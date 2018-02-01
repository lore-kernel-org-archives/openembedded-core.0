Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id B19A560110
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:23:17 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id y3so9333151wrh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eUfZKEd/mSbTUclI6L8QO5sXZq6lIw42fqPsF/pLMZw=;
	b=kxvVtgBkVTJilBOJsCKPAWnlDc4ETfttrQ3ZyCSUvSG8HMKGNals7om4T4wxS16+vG
	oeEMccqZyk5qXn76Sq/TF3GygSVyuW8cA6xJFTowjxpSr/xZ8XpsFMVzDGgKZ/tuXb7r
	DF5vcV17mWxzoQgqrusKEsWeQRV7Asmh8v76WXGCObCuBD6McYk8xiqL15f+iJionTr5
	QkpZ0LZllgGiGkL4Ni0WKBMRs4PIRGXFR/Gc5XiFsFqOl9b47LHs+asfvqB0SUo/FS1O
	yEwWu1d421poMfwLEj88atXbjXYFjdELWVIZR27O0JVk5PpFy6IDFpu+hHAB2r6y5+8I
	O7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eUfZKEd/mSbTUclI6L8QO5sXZq6lIw42fqPsF/pLMZw=;
	b=bas6n9DrHsHzmfQSK8UJaMumbRDgVWHEdBBS3AheBoAkBSGMJIBkqHy9b2PmC7MALS
	fY4FdNxJyLHFoEgn8OcZyCGMfdQBGUhuc6C6U7g7JmG5Ho+aKibEgGHpmPZHfdCs6JDC
	VTKHNCs/+age6/CReXfrtMd4rYiJOitBe3b3THgILNvcKUIHSkz0P3lfix2YxCEeJ1ad
	4JTPKaVFR64lkaWG06/ROXOwafhTE7gt4O7yZblmEXy81mgb/W0LeRH3JAZFuRTYcQNw
	7LUV590gXX2NayfqRXvqB2MLO1cvbKFkrz6FJbsxXkJhYj/BFKcwHjZ+ivlj6ym/HFlw
	LCBg==
X-Gm-Message-State: AKwxytfixIvgVrLJTeEQuvG+FG0OxG/x9C0wRQkNp8z+wZ14Psti8+h2
	mjzqpVeS86I71dbfZbbSa0Z3xg==
X-Google-Smtp-Source: AH8x227RSOkC+R3YO3/8HlI2owA4ViwnWgfQZsl+JB+LBQW6hiHCwEoAUlA0MUlAUBBDuSckeiuHNA==
X-Received: by 10.223.184.36 with SMTP id h33mr12788722wrf.15.1517494998441;
	Thu, 01 Feb 2018 06:23:18 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w50sm13043620wrb.33.2018.02.01.06.23.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 06:23:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:23:16 +0000
Message-Id: <20180201142316.8860-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] libpam: be more script about user's sanity
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
X-List-Received-Date: Thu, 01 Feb 2018 14:23:17 -0000

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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/libuser/libuser_0.62.bb | 3 +++
 meta/recipes-extended/pam/libpam_1.3.0.bb     | 7 ++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

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


