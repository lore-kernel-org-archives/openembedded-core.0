Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E032749F8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 10:05:40 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b23-v6so34212614lfg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 May 2018 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BraLG/u7IS/uyR1wIIsQsXCSsfGauR5MSEZYhQgDF44=;
	b=VJ4z1i4eRaOI81K+iqNOSQfEloVjlgXODzn5DGOWs7lYag2qWwW/VYAlJa42vSDqjy
	z7EitIpxy0U0M9NToFyLOAmL0pIfPsWOjzsVDbuYGaOOmy8aRoUJhjuNArr7sIt+nwNb
	uFtmdeMtm9qgpnLwXg86nTh1m5J1sALwxPFi0LJXFKBugtG+JmaWu95FyxpLZsa/de52
	03hqmsmz+cpayQ8Gm6IuNaq/NXo/wM6zZZpmnG3lYY6dco3c9Y99YxpkdwwtTGbkHjJe
	3k3Kzyg1mHjyVBbGqoVSN+ZeKsHfu2G1q8UFeqPLi/t2h38scTMdId3v/ESE2C75D2Py
	0Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BraLG/u7IS/uyR1wIIsQsXCSsfGauR5MSEZYhQgDF44=;
	b=rBeUq/KwBCx2tLp6558FUCW9dQmbj1qAE1Y+1seAyKg29LO1LLRXDga74OhpCsE+ka
	HiNE9n7JEyRCQrDX9Bchk37omBOJdXrn4mejh0nPxrCYaGJ9v5dYtqGac5n8nP+EOrFN
	UlwRTZdVn36JHS32qfyqyz6NdgdR2qKAUOj8ktAdGi+LVYjhP/sQmXhCb5treL/TWgZo
	j+Q/imWSg/ziA9f29lO5prU3OzJXjmxB62IC/ZERYYqqhp9oHIr4P0tGLo4F1+et9Npp
	I/LPVvBI94knG8OnXhKKxhtbLgAIKsbbsVJmZjAhxPW8EUmWNrZXeNVJODjB+MdOeELp
	2/IA==
X-Gm-Message-State: ALQs6tDgFNgFmdgQ1rvIjsLDeQm0gEjRfRhTkuO3Nuhi0vEH6mA7lm59
	F+ScuhGa4m9lnV9UXWBUh69Ctojktg==
X-Google-Smtp-Source: AB8JxZrPWhTQ+910FcJKWqPxpNCqZ9GgSkR1oRuXqvSMTppwoQcNBr6W+5Ac2sK/Fs/OkwG8emv3XQ==
X-Received: by 2002:a2e:1614:: with SMTP id
	w20-v6mr4659836ljd.105.1525514741382; 
	Sat, 05 May 2018 03:05:41 -0700 (PDT)
Received: from pneves.home ([78.10.208.153]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm3579631ljj.23.2018.05.05.03.05.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 03:05:40 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 May 2018 12:05:16 +0200
Message-Id: <20180505100516.23875-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH v2] package_manager.py: set dnf always debug verbosity
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
X-List-Received-Date: Sat, 05 May 2018 10:05:41 -0000

Removed an undocumented configuration
variable called ROOTFS_RPM_DEBUG. This configuration
toggled the verbosity of the dnf command. We now have
verbosity permanently turned on and instead of
directing this verbosity to bb.note we direct it
to bb.debug.

Having the verbosity enabled will allow to watch
the progress of the dnf package manager during the
do_rootfs task with the debug enabled in bitbake.

An example of the impact from enabling the
verbose output.

bitbake core-image-minimal
rm -rf tmp
bitbake core-image-minimal

Before patch 4m39,403s
After patch 4m42,441s

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2d8aeba037..8b6cd2aee0 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -884,7 +884,7 @@ class RpmPM(PackageManager):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = (["-v", "--rpmverbosity=debug"] if self.d.getVar('ROOTFS_RPM_DEBUG') else []) + ["-y",
+        standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--repofrompath=oe-repo,%s" % (self.rpm_repo_dir),
@@ -892,7 +892,7 @@ class RpmPM(PackageManager):
                              "--setopt=logdir=%s" % (self.d.getVar('T'))
                             ]
         cmd = [dnf_cmd] + standard_dnf_args + dnf_args
-        bb.note('Running %s' % ' '.join(cmd))
+        bb.debug(1, 'Running %s' % ' '.join(cmd))
         try:
             output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
             if print_output:
-- 
2.14.1


