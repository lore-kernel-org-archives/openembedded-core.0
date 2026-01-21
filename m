Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D199C44508
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 17:46:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17643.1769017610406224609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 09:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XFVAmZ0k;
 spf=pass (domain: konsulko.com, ip: 209.85.160.173, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5014b671367so519181cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 09:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769017609; x=1769622409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y98CZOXo9ZOFCG27VnMvBumEPVQg62eMBsQKyMipmF0=;
        b=XFVAmZ0kRmUxAvHLGdjs9t7nj90TluBpAze8E6LO/Z0lYgAZykuQj9gDBoAlZTB7iZ
         DIzYH3niiwEEt22v/80vTqDDcArcNXBOjUYjlwpijOtd5Zqve2KM0qQQE3D4FdtXO2Lr
         m4yHtF3SrSPbJBKcUTDYVaaXNvQZZYtyHNdqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769017609; x=1769622409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y98CZOXo9ZOFCG27VnMvBumEPVQg62eMBsQKyMipmF0=;
        b=O0N3HN96BKEhLuezk+yJqT+fMNimNbxYoZ+aeQNrRPxb5RW85dwzM9S+YZjTPDrmoB
         ZikcH7Dfs4Ojj2gEXkfz7F87KZHkXZLD6YAZtcx6utfnO2guGC9jGb4AxElkdJWkS2jv
         OrkbvZC7IZh2RgorHTBVunImbiK0IX9JT489mhYmTYP/XZWLMKOyD55HL4zUpzjOWNc9
         kzZ+lFQ7+21I1RTn6+VZ7AxByZEW9ut8VFA5rPCVsCFvBdzzOjBY/fmiHLcY7PTRdgVe
         DXRhBdpnVo/7WUGOjHHaBi/Ycjpnwd6Yg2mcSKEad8eIefB7mhhS3EOFva6vL9VcRyfs
         7Pkw==
X-Gm-Message-State: AOJu0YycuSqB2MKiKl3MnYaNr1203GIsdqrTqmmAA7Y1qKLtHhJn6z+0
	QVEy6QeMQ+Ax0Fk5uEcoPqZU4gJyfJQOhZUu2vTTjD4OcSlg33DU0QPMwO9KiW6sWH3ihTP1Q1n
	tufpW
X-Gm-Gg: AZuq6aIiR79DUcmib3zzu2xcHRfNKuepxGhMPHw026ZKc6l2G+kmDnA8DKIscdu2pHn
	jhcAxuoSLzkTagGttggJaDmo358k5jD5fPShcUNyz9WnmzBk+NZi7gekoxS5aAFocR+32wExos9
	eBmrVoWdlGLcSGSucEZ07xAGTo9ZhGgA3GjlQcH6NRFPDNg81P2rFxEsdK/DDNQOdsZAA9sJB/B
	k9slEE3K5YoVAo1xSDtGQgRS6DkE4OIc9c2prFRDN4SKWIOH0KY4ymAJa7vP9Wsasc23694Rgqz
	mSgzsBe+pDRfjG5+MBkL8mcwD4GviO23TXGtEcfsh5a2S7bS0Z8vjagvDxHpx6Oq/e85o4jHezf
	C9IaSCFxspTBzNc7xix/7R5UNVzy6wW19dXX3YXdRu/q6zUXRkfKUgToElnVC62LtDHcV/uhEoO
	42mpg21Yp4rXNbzoriSd2MwlTG+0CE4ObGIp4/4tfuBMJiBelAWA3l8HycsbJLi4/eGAozxzkF3
	m4g2W1RP9q2V+0Oforlu5Y8L3cvHZb0XzyaOpcjaGXGxvKgwYyC
X-Received: by 2002:a05:622a:4c8:b0:4f1:d85c:d7c3 with SMTP id d75a77b69052e-502a1f777b1mr274063621cf.66.1769017609088;
        Wed, 21 Jan 2026 09:46:49 -0800 (PST)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1c3a5b3sm117369471cf.0.2026.01.21.09.46.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 09:46:48 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: move CVE patch out of u-boot-common.inc
Date: Wed, 21 Jan 2026 12:46:40 -0500
Message-ID: <20260121174640.3102533-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 17:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229820

Commit f5b980ad added CVE-2024-42040.patch to the base U-Boot
SRC_URI in u-boot-common.inc as opposed to adding it in the
u-boot recipe where all the other patch additions are. This
breaks at least one downstream BSP that reuses u-boot-common.inc
(meta-sifive), so move that patch addition to the recipe file
with all the others.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 +---
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 7a63420642..d366f10398 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,9 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
-           file://CVE-2024-42040.patch \
-"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 0ff2477c39..f0ea3ef9e0 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -11,6 +11,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-30790.patch \
                    file://CVE-2022-2347_1.patch \
                    file://CVE-2022-2347_2.patch \
+                   file://CVE-2024-42040.patch \
                    file://CVE-2024-57254.patch \
                    file://CVE-2024-57255.patch \
                    file://CVE-2024-57256.patch \
-- 
2.51.0


