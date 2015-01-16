Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFAF722C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 13:38:51 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so20302110wes.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 05:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L4MvCEFXiJKS9qQXCBp1VZy0Nh0H68+YE14DrQQ798g=;
	b=NvXCCtj+lDdwvtDY/0aKIJ1G8X7vC68ttJrP9GuiNMUOALfK5H+xeKYcNmUAqNk216
	mm90xUz9dixCiViRowg6CrjiyGhy+UVzetTXLyDKOq0x+wIALTWmjfJQSudIvvymaJyn
	QSKfc1dt3JN/CJRy2QJiA8F4ZFbT37cZX+6WkjyvT/M5NU0uIlIN4Guw5h5YSGEfcf+M
	LoJ7vI6sHk7AbIocssHDjxe9c1V1xZZM1S4qdv0gXK38IK6HmnJZw9u+u1Qf2CARihc5
	LXAEpEqxVSdYbYQnWqvKR0lfMW1/Ab2bHgAr7aD881dZ9LcV0Hi9bpWyP6Vs/rMS4mXA
	FFNw==
X-Gm-Message-State: ALoCoQm1RF3iKVsxKQqOmy16v2SNEO32it0wm0KweUcKbPG0CgV29tgaX8mwvRhe99FvGoia65IW
X-Received: by 10.194.88.131 with SMTP id bg3mr27882515wjb.99.1421415531315;
	Fri, 16 Jan 2015 05:38:51 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([109.100.140.128])
	by mx.google.com with ESMTPSA id q10sm2764652wjr.41.2015.01.16.05.38.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jan 2015 05:38:50 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
X-Google-Original-From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jan 2015 14:38:43 +0100
Message-Id: <1421415523-29824-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.9.3
Cc: holger@windriver.com
Subject: [PATCH 1/1] systemd: Don't create /var/tmp, log directories
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
X-List-Received-Date: Fri, 16 Jan 2015 13:39:03 -0000

/var/tmp and /var/log are symlinks created by base-files and point to their
respective directories in /var/volatile.
With this patch we avoid systemd-tmpfiles runtime errors like:
systemd-tmpfiles[108]: chmod(/var/tmp) failed: No such file or directory

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../0001-tmpfiles-Don-t-create-var-tmp-log.patch   | 42 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-Don-t-create-var-tmp-log.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-Don-t-create-var-tmp-log.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-Don-t-create-var-tmp-log.patch
new file mode 100644
index 0000000..a47b58d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles-Don-t-create-var-tmp-log.patch
@@ -0,0 +1,42 @@
+From f5738e5bc4e96672244d77cb6fcbdc0697d49961 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Fri, 16 Jan 2015 14:30:34 +0100
+Subject: [PATCH] tmpfiles: Don't create /var/tmp,log
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+---
+ tmpfiles.d/tmp.conf | 3 ++-
+ tmpfiles.d/var.conf | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tmpfiles.d/tmp.conf b/tmpfiles.d/tmp.conf
+index b80dab4..d5dfc8e 100644
+--- a/tmpfiles.d/tmp.conf
++++ b/tmpfiles.d/tmp.conf
+@@ -9,7 +9,8 @@
+ 
+ # Clear tmp directories separately, to make them easier to override
+ d /tmp 1777 root root 10d
+-d /var/tmp 1777 root root 30d
++# Already symlink to volatile/tmp from base-files
++#d /var/tmp 1777 root root 30d
+ 
+ # Exclude namespace mountpoints created with PrivateTmp=yes
+ x /tmp/systemd-private-%b-*
+diff --git a/tmpfiles.d/var.conf b/tmpfiles.d/var.conf
+index 4b63e41..fa74af1 100644
+--- a/tmpfiles.d/var.conf
++++ b/tmpfiles.d/var.conf
+@@ -11,7 +11,8 @@ d /var 0755 - - -
+ 
+ L /var/run - - - - ../run
+ 
+-d /var/log 0755 - - -
++# Already symlink to volatile/log from base-files
++#d /var/log 0755 - - -
+ f /var/log/wtmp 0664 root utmp -
+ f /var/log/btmp 0600 root utmp -
+ 
+-- 
+1.9.3
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 8e1b5aa..a7cac9d 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-Make-root-s-home-directory-configurable.patch \
            file://0001-systemd-user-avoid-using-system-auth.patch \
            file://0001-journal-Fix-navigating-backwards-missing-entries.patch \
+           file://0001-tmpfiles-Don-t-create-var-tmp-log.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
1.9.3


