Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id E3D8B60F57
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:23 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g3so2517631pgs.11
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ElyoHQGYZy/sczprG0iFAfWqnqHthSWD0FjT/8IEqBo=;
	b=P/905WCmU91NmBZ4oW5xDK47lWJkOhvQyCZVT8Wm/1MBdobVgEsOxa2pmecydi36wP
	n1VIZrqXp0YftKRUVOLC8UNxzq0qSnnOkYwG8ARvoxJJ5fu5DGfnDaFGOOrrp4riiVFg
	wpCmXqTYrxl0r9Ta1c3q1T03GYdUas6M70oAhqkwwx7HOzFWflUPYVZk8TQHgg53tN8z
	SofiigtLgfxLFCPLWQ4JbxICHQOhLp7ur3Ge23qJNuwr1tWS2csRsTZOb94sTbl40riG
	PPWRr7J80ztYxx8F+9l/nZE6Lb01sZeFLbEf+voskkOx93/Am2w86cjunlf5M6lpgiFO
	zVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ElyoHQGYZy/sczprG0iFAfWqnqHthSWD0FjT/8IEqBo=;
	b=eQBmIfDqbiCFuphj/p/OMhSbCvBgdlDnPcsOgGDPonW1B+rov+0Ehl/BlX4n3S7FSQ
	HMONz2DX3KCXIzQaA6wtbY+u1JXIJPbzP8Pn0n2K1JefuxhG59LBks96s2K554XcXHyJ
	ZEx1i/dk5i8wINGdMuCfqmZRw2o4xoNWsNWGLMeEF4COTzAId0g/ES0bCCaCfvPS/HuR
	omd/BkcOM/YYyeUI6ZF1GyZIiTiqr8KEnLXg1dUk1W6cn4X0NUpA57nFaXmevgB5NsFS
	NVmSRTkv2kPri2i/YMkXAMGv3BSPHhVwfEHq83ChRXuNbhJL3J98oIu6+/25IIk80b/O
	GOFw==
X-Gm-Message-State: APjAAAWPIrzt24sAfPLIMea78Avdo0modKfhGK24ETZwS0o/CuXf6k8N
	0kuErBvibcgH0khyeI9y14WV1b7d
X-Google-Smtp-Source: APXvYqyW3HH2niL+YMB40R+GfXdLd8SGWenOKExOMuIsXVj4iM0wNUEGKAGp6IN91tyIHuCs74/A+Q==
X-Received: by 2002:a63:6c82:: with SMTP id h124mr9783528pgc.328.1581264624053;
	Sun, 09 Feb 2020 08:10:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.23
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:53 -0800
Message-Id: <db0bf68a706b6eb14ec4118fde2e102948a15a8e.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 25/29] libgcrypt: Fix determinism issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The build was injection git information from the wrong git tree, stop this
to allow reproducible builds.

(From OE-Core rev: 506b36b6d86b3454fcc3cb85f6229cbe8d14f5b5)

(From OE-Core rev: 2b68ffc6d7c45541958f1b0c0b9ca9e39064e096)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libgcrypt/files/determinism.patch         | 32 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.8.4.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/determinism.patch

diff --git a/meta/recipes-support/libgcrypt/files/determinism.patch b/meta/recipes-support/libgcrypt/files/determinism.patch
new file mode 100644
index 0000000000..ad0b8c7950
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/determinism.patch
@@ -0,0 +1,32 @@
+gnutls detects our outer git trees and injects that revision into its objects.
+That isn't deterministic so stop it. Also ensure we're not marked as a development
+build as its git detection is faulty.
+
+RP 2020/2/6
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: libgcrypt-1.8.5/configure.ac
+===================================================================
+--- libgcrypt-1.8.5.orig/configure.ac
++++ libgcrypt-1.8.5/configure.ac
+@@ -45,7 +45,7 @@ m4_define([mym4_revision_dec],
+ m4_define([mym4_betastring],
+           m4_esyscmd_s([git describe --match 'libgcrypt-[0-9].*[0-9]' --long|\
+                         awk -F- '$3!=0{print"-beta"$3}']))
+-m4_define([mym4_isgit],m4_if(mym4_betastring,[],[no],[yes]))
++m4_define([mym4_isgit],[no])
+ m4_define([mym4_full_version],[mym4_version[]mym4_betastring])
+ 
+ AC_INIT([libgcrypt],[mym4_full_version],[http://bugs.gnupg.org])
+@@ -2575,7 +2575,7 @@ AM_CONDITIONAL([BUILD_DOC], [test "x$bui
+ #
+ # Provide information about the build.
+ #
+-BUILD_REVISION="mym4_revision"
++BUILD_REVISION="None"
+ AC_SUBST(BUILD_REVISION)
+ AC_DEFINE_UNQUOTED(BUILD_REVISION, "$BUILD_REVISION",
+                    [GIT commit id revision used to build this package])
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
index 1bd355133e..92eb2d257a 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
            file://0001-ecc-Add-mitigation-against-timing-attack.patch \
            file://0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch \
+           file://determinism.patch \
 "
 SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
 SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"
-- 
2.17.1


