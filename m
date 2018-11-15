Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE2A6C152
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 11:51:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id w7-v6so18514454wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 03:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zO29koJMHbZTcEJsp/MP1+l2f6DiZVLg9nYIC5WcGsk=;
	b=FHAckCFnoFcqkbWf08A9tPzcvI8gky3O3ZSn4cBjPWb5OqdwSz558PdQW9MFvmXl6Z
	fytXhydwVDSBaAjAQi9aiFJkmr0ixcwAbOA1u2HON7X1JVap/jS3ODO6QcOKjRyxXAHm
	mI1/AGy8fDpgH66TLvjWwos/9wN7MBqtkmnzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zO29koJMHbZTcEJsp/MP1+l2f6DiZVLg9nYIC5WcGsk=;
	b=CCdFIKHhR5aj9nL/RF2ZiTVqiZdVCQGXTJrAhp5xaViE/tButcnx4nJJt6vu7HRP+Z
	eYE+D8o6+Wovg43rm0EFZwprzlHhRRfZyUAFUOuczXnuXb3QfC9ONhdQZPqMY0DR1PFC
	JQpXEzlLN+OG45tO9g25vxylif6G7iUsJnJgZYXdVjYBaPxA7TgJwRZLgA3cvgxoCcsb
	DgJxP825pirK1y/asppuoqFzmYuij414Oq1CzV46FrkubnW7znqUDx1sX6V4i4lAzbdN
	aFIoPl9bzh0+/ehcYhxFkUodVDgihVwpyj/ocKdXf0U84T3gupijpXpHYe9T18ACfiTi
	EPbQ==
X-Gm-Message-State: AGRZ1gKRO8frCSLH4QfivvcIzmc5U2gvrztH2BtcucLQVvYv5Jj9Q+JG
	o157rSJdXT+j8uob7429gjPnTpmEatk=
X-Google-Smtp-Source: AJdET5cKQzTDx6g+coRzmqhGSje5wHVaEIWGuZqW1tb0s/uohN9vxniY7Dno7AVidTheViSuVZMN2w==
X-Received: by 2002:a1c:8314:: with SMTP id
	f20-v6mr5246299wmd.120.1542282661482; 
	Thu, 15 Nov 2018 03:51:01 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j125-v6sm17622731wmb.12.2018.11.15.03.51.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 03:51:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 11:50:57 +0000
Message-Id: <20181115115057.12871-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181115115057.12871-1-richard.purdie@linuxfoundation.org>
References: <20181115115057.12871-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] lib/oe/package_manager: Avoid race problems when calling list_pkgs()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 11:51:01 -0000

list_pkgs() for rpm calls RpmPM() which would try and create a copy of the
package feed. This can be called for example from buildhistory whilst some
other task may be working on an SDK or image construction, causing the package
feed to disappear part way through an operation.

Avoid the need to copy the package index just to list the installed
packages, avoiding the race.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index aa4de6e7c30..02cf2b76218 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -320,7 +320,7 @@ class PkgsList(object, metaclass=ABCMeta):
 
 class RpmPkgsList(PkgsList):
     def list_pkgs(self):
-        return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR')).list_installed()
+        return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
 
 class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
@@ -724,7 +724,8 @@ class RpmPM(PackageManager):
                  arch_var=None,
                  os_var=None,
                  rpm_repo_workdir="oe-rootfs-repo",
-                 filterbydependencies=True):
+                 filterbydependencies=True,
+                 needfeed=True):
         super(RpmPM, self).__init__(d, target_rootfs)
         self.target_vendor = target_vendor
         self.task_name = task_name
@@ -737,8 +738,9 @@ class RpmPM(PackageManager):
         else:
             self.primary_arch = self.d.getVar('MACHINE_ARCH')
 
-        self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
-        create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
+        if needfeed:
+            self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
+            create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
 
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
@@ -967,10 +969,11 @@ class RpmPM(PackageManager):
         standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
-                             "--repofrompath=oe-repo,%s" % (self.rpm_repo_dir),
                              "--installroot=%s" % (self.target_rootfs),
                              "--setopt=logdir=%s" % (self.d.getVar('T'))
                             ]
+        if hasattr(self, "rpm_repo_dir"):
+            standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))
         cmd = [dnf_cmd] + standard_dnf_args + dnf_args
         bb.note('Running %s' % ' '.join(cmd))
         try:
-- 
2.17.1


