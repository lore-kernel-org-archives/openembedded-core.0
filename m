Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id B118276802
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:45 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id e32so258873134qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XNunPw/7W+TNTJ/vFwgmWXyCoGrma3ynjn6Ij50ev2Q=;
	b=ghQxr8WdefEYTPYsE075dvVoM5CLB9J1SzgmdvdAq59JJhkmcTNLKtupDLtxy2iDqR
	4v2MzVk59+nLVQOIhFVMtUTsbRWzNicL2gPKKzWc2gFBut6UKvk2IJvEbyI0s0We0qBI
	QbytQQylIfyvhKW4nWQK+tFFUVr455jtcXQEJfWVTwDOuyyLnah8DjLY9TGzdif4xEMl
	h/LizEHZtchehD3PVqcK/XVc8Bstmkpt2VS9s3Nfn3/uVUZNihbMpjOdJB0xw2YXLbpH
	aC+Rk+ggm9jkNmm0886EXnxaRZAVVqEUPPwq1eSER0KHNj98J6JbHqagGtiVrZN4g4hU
	Eviw==
X-Received: by 10.141.3.9 with SMTP id f9mr150051047qhd.98.1452248386020;
	Fri, 08 Jan 2016 02:19:46 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:56 +0000
Message-Id: <58a549917524fec02aabaa8dd6ad2fc92572f582.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 28/53] dpkg: Add musleabi to known architectures
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:46 -0000

Remove a glibc specific patch to be applied only for native version,
this is a dpkg-native specific patch needed for Centos 5.8, this patch
should be redone to be glibc independent for it to be applied to all
types of dpkg recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0006-add-musleabi-to-known-target-tripets.patch | 42 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
new file mode 100644
index 0000000..a6b0088
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -0,0 +1,42 @@
+From f8910022dc3ec622272f168cd0022dbdf6dff93a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 23:05:41 +0000
+Subject: [PATCH] add musleabi to known target tripets
+
+helps compiling dpkg for musl/arm-softfloat
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ ostable      | 1 +
+ triplettable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ostable b/ostable
+index 3bb6819..d0ffdc7 100644
+--- a/ostable
++++ b/ostable
+@@ -15,6 +15,7 @@
+ uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ uclibc-linux		linux-uclibc		linux[^-]*-uclibc
+ musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
++musleabi-linux		linux-musleabi		linux[^-]*-musleabi
+ musl-linux		linux-musl		linux[^-]*-musl
+ gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
+ gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/triplettable b/triplettable
+index 1213584..70d24c1 100644
+--- a/triplettable
++++ b/triplettable
+@@ -6,6 +6,7 @@
+ uclibceabi-linux-arm	uclibc-linux-armel
+ uclibc-linux-<cpu>	uclibc-linux-<cpu>
+ musleabihf-linux-arm	musl-linux-armhf
++musleabi-linux-arm	musl-linux-armel
+ musl-linux-<cpu>	musl-linux-<cpu>
+ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
index 4c3fa4f..dd1109b 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
@@ -1,17 +1,18 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
 SRC_URI += "file://noman.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
             file://dpkg-configure.service \
-            file://glibc2.5-sync_file_range.patch \
             file://add_armeb_triplet_entry.patch \
 	    file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
 	    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
 	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
 	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
+	    file://0006-add-musleabi-to-known-target-tripets.patch \
            "
 
 SRC_URI[md5sum] = "63b9d869081ec49adeef6c5ff62d6576"
-- 
2.7.0


