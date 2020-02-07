Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C88D960D80
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 00:00:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t3so537711wru.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 16:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SjrWlB4njVhqgFzyJ7m+Fp+SHdBGW1WGbI89IU4dmn4=;
	b=KJ/Mftz168C4LhDUsKw7NHfbWuuPR6bdXTjRjvSuic9PR8jGLZxp8+QBBuEIVhysu4
	4FUhMlWptERIv2IzLXD44Bq0Kwat4CJLeUm0HZghxiPdf0taSg/Q2QAYrf22x4RKKpZQ
	8XPKIJYdzf5GLmsP3Fhk95BtviHGPqA5auWPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SjrWlB4njVhqgFzyJ7m+Fp+SHdBGW1WGbI89IU4dmn4=;
	b=I1zOBa2NpL4JUV1wfN4Ftu8TRRdgIVRXiL1XERmPLNzVYyWpZAyLEbw3yrvggnbmCv
	a1AqbhxdeOx/d9R7Pitrb9JSLT/8nSEkSWqpycA68YJiigEc6cRtyDSx59Luokja5nI+
	m8FxsVyL9z0VC3i7hQ15Rl3t8IYXTUOqXz4AvSUYzlxgd8mZ3eQHv/QiM2YlWZZ7CfDG
	HNnFsEW+4VSz8A67HeAmGqEDjN3djdDJwZDMdn0Dr7oB9hdUwmwHhItXTQiiJ9dGkkpi
	v/ba4AXBVs/oU+lxrCI8t+L8VDEcPbhn1xu6Kye4kFx8S7tyI4704txv+HdwDeL+8UvT
	xLgQ==
X-Gm-Message-State: APjAAAUPACXgk/yPp3b4hVv6Ha4hw/2oRmDpvQ+piBAn5C/M6YMjUCsN
	9vcPY1mxEcgvo+5adcWXWjlgsNZjcf0=
X-Google-Smtp-Source: APXvYqyYepYZU35F+QkHc1aEbt4lKXJYOGUGVIRh9Ji41GrebttryKPdUrq2TlA6rvpDyWPT8iytvQ==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr598741wrn.29.1581033647900;
	Thu, 06 Feb 2020 16:00:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d13sm1115398wrc.3.2020.02.06.16.00.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 16:00:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 00:00:41 +0000
Message-Id: <20200207000041.19304-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207000041.19304-1-richard.purdie@linuxfoundation.org>
References: <20200207000041.19304-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] libgcrypt: Fix determinism issue
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
X-List-Received-Date: Fri, 07 Feb 2020 00:00:48 -0000
Content-Transfer-Encoding: 8bit

The build was injection git information from the wrong git tree, stop this
to allow reproducible builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libgcrypt/files/determinism.patch         | 32 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/determinism.patch

diff --git a/meta/recipes-support/libgcrypt/files/determinism.patch b/meta/recipes-support/libgcrypt/files/determinism.patch
new file mode 100644
index 00000000000..ad0b8c79500
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
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 04785574f2f..4e0eb0a1697 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-Prefetch-GCM-look-up-tables.patch \
            file://0002-AES-move-look-up-tables-to-.data-section-and-unshare.patch \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
+           file://determinism.patch \
 "
 SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
 SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
-- 
2.20.1


