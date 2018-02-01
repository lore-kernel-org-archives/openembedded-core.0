Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A28467869A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:34:06 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a43so11648432wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eUfZKEd/mSbTUclI6L8QO5sXZq6lIw42fqPsF/pLMZw=;
	b=g8s4KZ8AOCbZn4QOWEhzovn1PL6KtOCjx8Pe3VW8ZZj9JKtVj1lgfKNtey2Ktgnv05
	a9oLI3cuyy6ZS8ezE9j00Nw1zd0I9YUyobPxzpBJfla+IP8bOtt2BC18Lj7HRlcDJ6ds
	5mMvbW41zaUJc460UU4uys64p2UGy/AudBbZ4z65pgVmE+DInej4AdDJs3Z9YT/lngOK
	m4LsHpydEEBBJl8aitGGDwZAZkMmq66EkO4Se5eSGdDcG3LK++gpoIdrSLeeX08KOQZL
	8gemKe17FTgyqPGEvA8n9anjceA6OZ9k1NTcisyYrzaKHbZ3em01i4W0o2RLrMRiTSHS
	emRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eUfZKEd/mSbTUclI6L8QO5sXZq6lIw42fqPsF/pLMZw=;
	b=D0vjtbf8nyKK6Jr1scfLM2j+xhLRWTnqF129Y3TP7P1Ws/QSnOb3cBWkq8Jjh7i4Yh
	5yR7ZC0dd1A3yX0uLT511yAhF6XufnafY5ioRQ6lXkbREes+XbEdmvFqvgpDQ3SB1Fzg
	GPYNst4rsy2Qn2OheGUFRQq1l1Je4eNlOuXYIopkzCaynnOCT6tJx5vwt3l40Pp6/Dv1
	ZqauuEXMtInHuIcDokgOHAZykRiZnJGDjZh+zN+pWzEmfCZACHalzaA9XSfsmq2Q9HHd
	2NwfY+A+ylmk25Td6G71/za+ZggF1H8/pBP3ffCfiqOdC43j0QSv6MYKap5yxCRts8jp
	sJ/w==
X-Gm-Message-State: AKwxytcDvFHGpN/mpqgbJXW1W8jbSw/vRHmUuP92Gr5l1f070IdEGGPS
	4tS0KQeax6/vwP+hbIVdwZF7iQ==
X-Google-Smtp-Source: AH8x224FHp4hM7Jkwpq3lyQEEt8XcKHXns+7nzAAS8OG9GCPlsAjtC4xDRXCSSiJ5qEilKGvdJr+wQ==
X-Received: by 10.223.171.24 with SMTP id q24mr15935721wrc.206.1517495647276; 
	Thu, 01 Feb 2018 06:34:07 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b35sm46467188wra.13.2018.02.01.06.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 06:34:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:34:05 +0000
Message-Id: <20180201143405.17663-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCHv2] libpam: be more strict about user's sanity
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
X-List-Received-Date: Thu, 01 Feb 2018 14:34:06 -0000

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


