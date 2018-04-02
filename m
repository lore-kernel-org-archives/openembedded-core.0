Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96B92745DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 23:54:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w32Nsnsf008375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Apr 2018 16:54:49 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 2 Apr 2018 16:54:48 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2018 07:54:46 +0800
Message-ID: <1522713286-28799-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH V2] logrotate: update to 3.14.0
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
X-List-Received-Date: Mon, 02 Apr 2018 23:54:48 -0000
Content-Type: text/plain

Since the wtmp and btmp definitions had been moved from logrotate.conf
to logrotate.d in this release, we also need to install them to
/etc/logrotate.d/.

Also update oeqa runtime logrotate test case.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py                       |  4 ++--
 .../logrotate/{logrotate_3.13.0.bb => logrotate_3.14.0.bb}     | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.13.0.bb => logrotate_3.14.0.bb} (88%)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 992fef2..db6e695 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -21,9 +21,9 @@ class LogrotateTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg = msg)
 
         cmd = ('sed -i "s#wtmp {#wtmp {\\n    olddir $HOME/logrotate_dir#"'
-               ' /etc/logrotate.conf')
+               ' /etc/logrotate.d/wtmp')
         status, output = self.target.run(cmd)
-        msg = ('Could not write to logrotate.conf file. Status and output: '
+        msg = ('Could not write to logrotate.d/wtmp file. Status and output: '
                ' %s and %s' % (status, output))
         self.assertEqual(status, 0, msg = msg)
 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.13.0.bb b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
similarity index 88%
rename from meta/recipes-extended/logrotate/logrotate_3.13.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.14.0.bb
index 990cf91..d48539f 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.13.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "78ef24d6fddcc4df8e412dd75c551b4c"
-SRC_URI[sha256sum] = "3222ca032f99be8d7a4a8c6ad69f3dcc49b9511bfe384bd5a271ebcd9bd3e52c"
+SRC_URI[md5sum] = "1c0f6e6e490c4bcac0a1e77ad1310683"
+SRC_URI[sha256sum] = "4703bdc0e2df3b322f9dff0aafc99aa9172c9e4acae28b7c924cc7d4e5b29d55"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
@@ -34,7 +34,9 @@ PACKAGECONFIG[acl] = ",,acl"
 PACKAGECONFIG[selinux] = ",,libselinux"
 
 CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
-		    ${sysconfdir}/logrotate.conf"
+		    ${sysconfdir}/logrotate.conf \
+		    ${sysconfdir}/logrotate.d/btmp \
+		    ${sysconfdir}/logrotate.d/wtmp"
 
 # If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
 # optimization variables, so use it rather than EXTRA_CFLAGS.
@@ -68,6 +70,8 @@ do_install(){
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${localstatedir}/lib
     install -p -m 644 ${S}/examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
+    install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
+    install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
     touch ${D}${localstatedir}/lib/logrotate.status
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-- 
2.7.4


