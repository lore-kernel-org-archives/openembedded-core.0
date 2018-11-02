Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A307079F35
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:09:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA2696ao021225
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 23:09:06 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 23:09:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 14:09:04 +0800
Message-ID: <1541138944-68335-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: fix for CVE-2018-14665
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
X-List-Received-Date: Fri, 02 Nov 2018 06:09:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../xorg-xserver/xserver-xorg/CVE-2018-14665.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
new file mode 100644
index 0000000..5dd6fe0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/
+commit/50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e]
+
+CVE: CVE-2018-14665
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+From 50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 23 Oct 2018 21:29:08 +0200
+Subject: [PATCH] Disable -logfile and -modulepath when running with elevated
+ privileges
+
+Could cause privilege elevation and/or arbitrary files overwrite, when
+the X server is running with elevated privileges (ie when Xorg is
+installed with the setuid bit set and started by a non-root user).
+
+CVE-2018-14665
+
+Issue reported by Narendra Shinde and Red Hat.
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+---
+ hw/xfree86/common/xf86Init.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
+index 6c25eda73..0f57efa86 100644
+--- a/hw/xfree86/common/xf86Init.c
++++ b/hw/xfree86/common/xf86Init.c
+@@ -935,14 +935,18 @@ ddxProcessArgument(int argc, char **argv, int i)
+     /* First the options that are not allowed with elevated privileges */
+     if (!strcmp(argv[i], "-modulepath")) {
+         CHECK_FOR_REQUIRED_ARGUMENT();
+-        xf86CheckPrivs(argv[i], argv[i + 1]);
++        if (xf86PrivsElevated())
++              FatalError("\nInvalid argument -modulepath "
++                "with elevated privileges\n");
+         xf86ModulePath = argv[i + 1];
+         xf86ModPathFrom = X_CMDLINE;
+         return 2;
+     }
+     if (!strcmp(argv[i], "-logfile")) {
+         CHECK_FOR_REQUIRED_ARGUMENT();
+-        xf86CheckPrivs(argv[i], argv[i + 1]);
++        if (xf86PrivsElevated())
++              FatalError("\nInvalid argument -logfile "
++                "with elevated privileges\n");
+         xf86LogFile = argv[i + 1];
+         xf86LogFileFrom = X_CMDLINE;
+         return 2;
+-- 
+2.18.1
-- 
2.7.4


