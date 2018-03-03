Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C62278982
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 23:02:55 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y6so16281211qtm.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 15:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Sas0qBXUdnh0qRlbyCuhaBGfU3UtonJZOJBvrytN2ek=;
	b=Q4L9Xli9quQBWQVDFbdBC+k3JpZHUKWNImAQ/tCiDEnr0fWYvnnkOehabIFhcOFTHi
	/UbJRNKTgHKaBXdRkAA4iF1ufykNA2VLcsRM0NZ7IPeJw8sWK+jJg9myz+dqaZqjKidC
	CCZITO6sWhu6AQa9cNFJPvOHEvxa9mJK15wZ/aah0XRozbD9EzdRGrBWr63nuLU5qD7A
	uaPnJBkwQ/g2STyhGH6phq/y91CWU23p9aAu4lp1J9+CZ0ga257aj1QYsVn1VOTuQUUp
	2nfyPW+7ygTZCad0kDrAqXIAkAJJaHiWn5VLvmZnb1/GkU8vhnJTBD6cvD6J8cinhSS4
	Fd0w==
X-Gm-Message-State: AElRT7HpgcAC8ZCAB9g1URXP/um80qMuRyPIU+Hj8po4Cfq3Yteqi6ys
	xXPeVka/+JcCvz3hm31N5t9+OQ==
X-Google-Smtp-Source: AG47ELugGP/cv4uQ3cf1hAAjX2s62rd86ss6OsfRmBpQLgjaPzgW7oag/68BHb7ATZGfkXh2uMSDMw==
X-Received: by 10.200.26.55 with SMTP id v52mr16011629qtj.53.1520118176821;
	Sat, 03 Mar 2018 15:02:56 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id g9sm1456038qti.11.2018.03.03.15.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 15:02:55 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sat, 03 Mar 2018 20:02:48 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat,  3 Mar 2018 20:02:47 -0300
Message-Id: <20180303230247.31820-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5] u-boot-mkimage: Add dependency on dtc
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
X-List-Received-Date: Sat, 03 Mar 2018 23:02:56 -0000

The dtc is used when generating images which use Device Tree and we
must use the OE version to avoid relying on the host one.

Reported-by: Renato Caldas <rm.santos.caldas@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- rebase on top of master

Changes in v4:
- just rdepends on dtc; it is not used during mkimage build

Changes in v2:
- add rdepends on dtc
- fix depends on dtc-native for native

 meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
index f1fc5644922..1c008be96e7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
@@ -24,4 +24,6 @@ do_install () {
 	ln -sf uboot-mkimage ${D}${bindir}/mkimage
 }
 
+RDEPENDS_${PN} += "dtc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


