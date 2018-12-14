Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id D83337BDB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:51 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so5614874lja.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3Li7STh2YlBYm+8Kd+lpmolgII58Gm67C1iRAVR2vnY=;
	b=RKq9qYiebM2pbdtk3UBspcdPev/IqDsSZx/Fesms9GV/dnKlIcEOBw96UE/kREgARi
	zpHOy6lH8LeSLQYK5ddW1cFzYKGcleinojE8DgxjgSYxrvNK7rv0PyNecwwyniATxpfb
	a/82qFrXbYKnr7yVnQqxUIiTueqJwuMGwlhGWjeVL+f+aToTzE7UYVVxNS7pIh+fx/8e
	TFHRG4qsqkT2D/W7r5zqvfYImyfFw0vgKfkT7Kfx8ToNtTi2sjWmou4uTMqBtGNda+U+
	+0kX8cNLHkEbRtNhqCzsc1YhrLXSjtHnL26iWHBW5q6t1US2nEv3DdiTNsqNJfGakaVg
	27uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3Li7STh2YlBYm+8Kd+lpmolgII58Gm67C1iRAVR2vnY=;
	b=IHS1BojiXdWDoMcd5UCY+XZOhEgGgTzN8MHAm5712HRTHQfYVMxuNg1EeDxWBSiEDX
	tdLipsBH4OGlLMQn7ldFPLYVA1IQkedpsGAk7+DOE/MERMVRgc8ykfgIdTjKMJ/g7xTH
	8ci7eqCVZW0gyFw2F1G6P9zUAYi3kR+NDffLb86ZXrdDhmuZSwZBbO3VoKaSJHqeSbFu
	mP8q3NHYqiFig6cS8B3rjo3wj+e1/+7TSUYEvr+LoAy93fskMmBO0BxaVIk8EMxvHcbV
	UyQ1icSd/IeDB4arL+Lp3v5PF3Drp6uB1cMMaYBifAXFxX9hKHmfltw9ZpSYG9FZlo+w
	D8Aw==
X-Gm-Message-State: AA+aEWbQt8P9EJv2q/BPYuZBXXVS7t1z47/XIGvxFLXIqdxY5iyLixZE
	mhKK70KzIC5tHEpf1LrychGdRk1I
X-Google-Smtp-Source: AFSGD/UAJtWB+B7OVopLqxzoZV+3SKPjvnUv4urNcNFBw+7Nxv/0IMTtxxCHie7Gb8fLWPMTWfC37A==
X-Received: by 2002:a2e:4c0a:: with SMTP id
	z10-v6mr2398787lja.85.1544810152218; 
	Fri, 14 Dec 2018 09:55:52 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:51 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:38 +0200
Message-Id: <1544810082-22164-10-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 09/13] python3: Fix do_configure check platform triplet error (2)
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:52 -0000

When building for powerpc 32bit with musl following error triggered
from do_configure:

checking for the platform triplet based on compiler characteristics... powerpc-linux-gnu
configure: error: internal configure error for the platform triplet, please file a bug report

This is caused by PLATFORM_TRIPLET != MULTIARCH mismatch since MULTIARCH
in case of musl is powerpc-linux-musl. Since triplet is used as part
module name as described in PEP-3149 to make fix less intrusive alias
powerpc-linux-musl to powerpc-linux-gnu to avoid possible runtime
(e.g. tests) incompatibilities later.

Fix was inspired by commit cda0ef61d373 ("python3: fix do_configure
check platform triplet error").

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 .../tweak-MULTIARCH-for-powerpc-linux-musl.patch   | 40 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-musl.patch

diff --git a/meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-musl.patch b/meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-musl.patch
new file mode 100644
index 0000000..34c9175
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-musl.patch
@@ -0,0 +1,40 @@
+From 7362464383bbd54f8e6be4389f2c74c0717bc6e1 Mon Sep 17 00:00:00 2001
+From: Serhey Popovych <serhe.popovych@gmail.com>
+Date: Sat, 8 Dec 2018 11:24:06 -0500
+Subject: [PATCH] configure.ac: tweak MULTIARCH for powerpc-linux-musl
+
+For musl builds, the MULTIARCH is powerpc-linux-musl and configure.ac
+does not have lines to recognize it causing configure error for the
+platform triplet when building for powerpc 32bit.
+
+This is feature described in PEP-3149 and to prevent possible runtime
+compatibility issues we map powerpc-linux-musl to powerpc-linux-gnu.
+
+Look at similar change by Hongxu Jia <hongxu.jia@> presended in
+tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch to handle p1022ds BSP
+builds.
+
+Upstream-Status: Pending
+Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 95c98d1..1a4d8aa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -752,6 +752,10 @@ if test x$MULTIARCH = xpowerpc-linux-gnuspev1
+ then
+ 	MULTIARCH="powerpc-linux-gnuspe"
+ fi
++if test x$MULTIARCH = xpowerpc-linux-musl
++then
++	MULTIARCH="powerpc-linux-gnu"
++fi
+ 
+ AC_SUBST(MULTIARCH)
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index cd7991e..b4f6e55 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -13,6 +13,7 @@ file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
+file://tweak-MULTIARCH-for-powerpc-linux-musl.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 ${DISTRO_SRC_URI} \
 "
-- 
2.7.4


