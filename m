Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 03D0660FBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 21:42:14 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id dc14so3964208qvb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 13:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hAesYGWWpIgbRLBgiZc5vBe9bgMe8bfMIl48gTyYW8E=;
	b=U17r7pyWgx7OaeOF1jB4thHKi6odW4Ww/jmEJqog6vRMOyClP3jdqJql+EHGg1TfYa
	6pyu2twpSAWxrZkZfP72acAUYTpFeKMd2FtT8Ug4vmP55GjxbBItC4s3kzqtYponMdjF
	A7SPAj93cld+yxuKZsUBkyjpNo9UTylT9rJomsbQ7/vAIPGpgkORgvSVtanmyjR99PXP
	683x4iY6eyrOcHt6TC4qqZtiiK8+fAn4+/M7u1lxYqIEZu5rMpvKNAMM+fiMIzwmDgeM
	0VgZ6A+XUR2wqjKPiE/NarobsEZzEs+5svVbVURr5shdbKOXfwd7poOMhu+EcLXam/Ux
	iElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hAesYGWWpIgbRLBgiZc5vBe9bgMe8bfMIl48gTyYW8E=;
	b=UiqhfKy1Z7ZT2XOSf/9/1xPdwLnd3IbJ7LsRuJ5jUbXTk1FBWdHMiAgJbxdSdKC3DZ
	P3G9s7JvhMdBlJJGZLCz/ycrxtBbnDb/8A5XJ8V3DgyxqZ6E6/wGb9/YMGFThvRK1Aeo
	T7iAfZjI2xW/iCFQfUbMpLW8cVOsbjVqHFuxjWel5mJww4fu5DfCRJ+fHtq3hLJZD68G
	LjmeOgEHQLQspakDXxYZaa7++jQ6mBcu3GPVRI8ZmHFXL3qI4nyKRVoR0IFUGvY9DPnq
	7SAfUi6D6fAZLTdVjatb1qUBZ12HX7+zzSYCuyeFKU3+YDjukfVs2fWl56A51wDMP7LO
	Fyyg==
X-Gm-Message-State: APjAAAUxU4R4mgFdVh/szYJM4c4TVvGhK1186etLdoutVWdDFJb1EO4F
	AiBAq3eDfusRB3f6O3sEhD74GIhnL4U=
X-Google-Smtp-Source: APXvYqx/W9SeMN6kytHeTIbY6QfMZH6vXCCZ4vevpI4ZGIIdEO2c+f9lPJ5i8IeazTxCdf3/h55DUA==
X-Received: by 2002:a05:6214:118d:: with SMTP id
	t13mr11831824qvv.5.1581370935617; 
	Mon, 10 Feb 2020 13:42:15 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id 135sm842758qkj.55.2020.02.10.13.42.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 13:42:15 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2020 16:42:11 -0500
Message-Id: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] wpa-supplicant: add virtual supplicant
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
X-List-Received-Date: Mon, 10 Feb 2020 21:42:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a second supplicant raising, iwd. User should be
able to switch between wpa-supplicant and iwd. Let's provide
a virtual package.

ConnMan, systemd-networkd and NetworkManager supports iwd.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 3 +++
 meta/recipes-core/packagegroups/packagegroup-base.bb           | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 2db09ad2c6..270e14eeb3 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -15,6 +15,9 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 inherit pkgconfig systemd
 
+PROVIDES = "virtual/supplicant"
+RPROVIDES_${PN} += "virtual/supplicant"
+
 SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1f802da09b..911877cf0a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -270,7 +270,7 @@ SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
     iw \
     wireless-regdb-static \
-    wpa-supplicant"
+    virtual/supplicant"
 
 RRECOMMENDS_packagegroup-base-wifi = "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
-- 
2.20.1


