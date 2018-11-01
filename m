Return-Path: <ross.burton@intel.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id CE0EF60079
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 11:16:03 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id f192-v6so64776ywh.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=u9ho32iOZAkGDSrCnRIB3ympVJyA0Gusw3Jzt875xno=;
	b=SDqrwSyuI34yIfpGPJrf7W3P0BLP/E4A9DbXPalA/LgzdzZzErOLSFeEZNXKsz602j
	+4wu5lJ2o+bA/9Rb6P1aQnvu+vpb6yYVH/LSAR3m1hMMKWnXKWo0xx2izJUHtMVb+CA/
	7nDDdKWXkVEqxSeoAOytfjzoM/tYWMIN2M293LdMEnuX8+pbqhWrLwxtzs5gnajKylJK
	PyJYtqEqHrvD6jkO5hT15VscE94hDOE09tY4iUpSmCXP7G3b9HLz7wvrcBDrLCl+fLMH
	2RPMfS7/7q9KGOI4vRHqgpK/v6kDy2ZUL/UcEsYTTSrFl3De5Rqomd4YnGZoVjgzApUP
	Jd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=u9ho32iOZAkGDSrCnRIB3ympVJyA0Gusw3Jzt875xno=;
	b=CpdJ/76oS4d11lsur2r6K1RYj9u5JUCOzWHfh9RoZb/0QGSU4aXruvjJU3MUwFftVC
	abUwM4cCDg3v74SINOuZFmmogaHmo/JqdgORhzM6WKBzG7LDGHM5uft2uyuBV1pPiIhY
	NNinyCBagINcQ/x4APIqozg8QnccQABsdyFRk7HHus22h4GuqrO/g3pvo/oYrq+/zKiC
	BjBQHefKmk4KoKSdJ11guS8ipRtppevycPXk/gb26ONuhnZuzQV3MvIlwfT0T+Jxx7Jl
	XzCSkVgwrrNUFCCJ7wdEpO12lDA6wLKh6xkutGE7Q7qD2riEUUIbws963aOxAf6nWnmw
	R0vw==
X-Gm-Message-State: AGRZ1gLSDZtMPoLs8RSMRUwf6MXCKPsusVZr4izO4Jgk3hefibk0KUml
	AKHNYVquuuF6DSrLgAWWJHUPrVGCZXk=
X-Google-Smtp-Source: AJdET5e1qs7ZFmCcx04rWWuIgTXkEJRwL+SfZrWbKc2JX8ISOXYvrykNGyuMQWlYtwdrRDwFAPkVaQ==
X-Received: by 2002:a81:54d5:: with SMTP id
	i204-v6mr6617352ywb.87.1541070964485; 
	Thu, 01 Nov 2018 04:16:04 -0700 (PDT)
Received: from flashheart.ger.corp.intel.com ([134.134.139.82])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm6605285ywh.18.2018.11.01.04.16.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 04:16:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 11:15:58 +0000
Message-Id: <20181101111558.28523-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xserver-xorg: fix CVE-2018-14665
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
X-List-Received-Date: Thu, 01 Nov 2018 11:16:04 -0000

Incorrect command-line parameter validation in the Xorg X server can lead to
privilege elevation and/or arbitrary files overwrite, when the X server is
running with elevated privileges (ie when Xorg is installed with the setuid bit
set and started by a non-root user). The -modulepath argument can be used to
specify an insecure path to modules that are going to be loaded in the X server,
allowing to execute unprivileged code in the privileged process. The -logfile
argument can be used to overwrite arbitrary files in the file system, due to
incorrect checks in the parsing of the option.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-xserver/xserver-xorg/CVE-2018-14665.patch | 62 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.1.bb            |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
new file mode 100644
index 00000000000..7f6235b4326
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
@@ -0,0 +1,62 @@
+Incorrect command-line parameter validation in the Xorg X server can lead to
+privilege elevation and/or arbitrary files overwrite, when the X server is
+running with elevated privileges (ie when Xorg is installed with the setuid bit
+set and started by a non-root user). The -modulepath argument can be used to
+specify an insecure path to modules that are going to be loaded in the X server,
+allowing to execute unprivileged code in the privileged process. The -logfile
+argument can be used to overwrite arbitrary files in the file system, due to
+incorrect checks in the parsing of the option.
+
+CVE: CVE-2018-14665
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
index cfdaf731758..9fd2e8d870b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
@@ -3,6 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://pkgconfig.patch \
+            file://CVE-2018-14665.patch \
             "
 SRC_URI[md5sum] = "e525846d1d0af5732ba835f2e2ec066d"
 SRC_URI[sha256sum] = "59c99fe86fe75b8164c6567bfc6e982aecc2e4a51e6fbac1b842d5d00549e918"
-- 
2.11.0


