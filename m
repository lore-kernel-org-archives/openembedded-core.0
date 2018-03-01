Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED50978477
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:11:41 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id f14so5452134wre.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QH0mcNuuBLCbhin/dBx3NyqcAyj0TKTTsAnSGm8+GdM=;
	b=poL+Iznmj6FyEDyTE++TN+amfzh8TqnFgNG2h2kS6h6+aw7DiePfVqU+x6N10hArXQ
	5g0fxnRR+5l7pi3kih9vL9z+apnlozxTW+O8R8IwJnj9CpBG/d1zCNx6jr53IaObwMj4
	1wKbowB/l9KszzRngbl9LYbAswBkm0mrHOxcDj/VgUmg3VTMXH8Uvnwvnmx5GC+It7Z5
	qWj+0AYKHWKyfQ2xdMe3tgSpcenyWpRryH7+xiiqvSqTxpdLxyOj0zIte29EYWKzBWaa
	6Dk4Bgmf19j4LMnodjmj7pn2OR3SC/H6KnB/y4LDfzUFz7bkMB3J5RkzO+63EXXo8mjM
	tyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QH0mcNuuBLCbhin/dBx3NyqcAyj0TKTTsAnSGm8+GdM=;
	b=LMrXbXOtymB5GLjE9MP3kjxWGTlbRTshTZmBFP9hkorL6Bnhu0+lwpeWF74Uu3AQ2t
	19Sh8/y/vM6QJwYTtYAcs6c/NwM3d+0NJBl2+Qd7tdYliV5qoFtCnZCIgPwNrbZDnme6
	rCiibaZUQx4PZEW4vehiTUtKRhYfj8Uji7YXuMk5j0gICBqPqi1ebJMUhYVhLgiLPhr2
	H5mzB3P2dBx0esZvRl50CjOTT+siT7nZ3UKLIEemkA997lEeqJx96rXFH+LjrP2tDBNu
	3Dnky38CyzAPCA2EqF1nPfq4MHU9jxg5MDDXHQgtpskm98QC5lXwnHtbKZ+kRvia3lt3
	ZWUw==
X-Gm-Message-State: APf1xPAKpYZytPoQuU0EoDzRKmtBQ7K8/f59d5n3IrjNtRMrks6xRUIa
	ECN2IDGKXU4dfc4jkGBD7nloLw==
X-Google-Smtp-Source: AG47ELuMXMGN5njA8rP2IWamlzbgvXXiKMMHoYCwAsiziOrjGl9vZ/Vx8SuUTy3QsgNIIhH1ugAOwA==
X-Received: by 10.223.134.12 with SMTP id 12mr1165158wrv.193.1519899102272;
	Thu, 01 Mar 2018 02:11:42 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id l8sm3588809wmf.39.2018.03.01.02.11.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 02:11:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 10:11:38 +0000
Message-Id: <20180301101138.25645-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQdBp4v4kBLcx==wzR2ORzKen29_+HgvzAfSrkAF9tw+6g@mail.gmail.com>
References: <CA+chaQdBp4v4kBLcx==wzR2ORzKen29_+HgvzAfSrkAF9tw+6g@mail.gmail.com>
Subject: [PATCHv3] libpam: be more strict about user's sanity
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
X-List-Received-Date: Thu, 01 Mar 2018 10:11:42 -0000

* replace do_pam_sanity function with distro_features_check inherit
* fixes:
  WARNING: libpam-1.3.0-r5 do_pam_sanity: Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly
  in world builds and prevents user to build libpam at all without pam
  in DISTRO_FEATURES, I don't see any users of this which wouldn't respect
  pam in DISTRO_FEATURES
* only libuser is depending on libpam without respecting DISTRO_FEATURES
* there are few recipes in meta-oe layers depending on libpam without
  respecting DISTRO_FEATURES, I've sent patch for them:
  samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs
  and omxplayer in meta-raspberrypi, I've sent PR for that one:
  https://github.com/agherzan/meta-raspberrypi/pull/192
* poky-lsb will need to add pam to DISTRO_FEATURES in order to build
  packagegroup-core-lsb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/libuser/libuser_0.62.bb                | 3 +++
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 3 +++
 meta/recipes-extended/pam/libpam_1.3.0.bb                    | 7 ++-----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index 1765346646..7ec54eb16e 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -22,6 +22,9 @@ SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3c
 
 DEPENDS = "popt libpam glib-2.0 python3"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
 inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
 
 EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 8959e3c8f4..53d100ce74 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -14,6 +14,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # libglu needs virtual/libgl, which requires opengl in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES += "opengl"
 
+# libpam, pam-plugin-wheel requires pam in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES += "pam"
+
 #
 # We will skip parsing this packagegeoup for non-glibc systems
 #
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 8f7753d001..92ab72a42f 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -151,11 +151,8 @@ do_install() {
 	fi
 }
 
-python do_pam_sanity () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'pam', True, False, d):
-        bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly")
-}
-addtask pam_sanity before do_configure
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
 
 BBCLASSEXTEND = "nativesdk native"
 
-- 
2.15.1


