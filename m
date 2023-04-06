Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4627AC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 09:11:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.154032.1680772300738840979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 02:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=it3T/3GN;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id t4so33554289wra.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680772299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Go7vXYJAuOgSmg2InCf//dImyzPyp7SE/ODRYLR7Z1w=;
        b=it3T/3GNTSK7SKe0RVbdXIhwKw6MxVAa4okJOKYSeaGBzIwLvMDbFRIiUD8zKTw0zx
         iBX+00yfsVkoASXCWV6s7S+t53YkoagNNSmPubS6zp8e1GXeb6UzPPSsj+hCJtnukdKt
         FpstT94gVCmdetZkUjX0KaZjj0tWqlCspszql3bvQsyGBkOJzPpUGdfDEmvwa+sVphMC
         2YHTN/n1I2G4OJ9YuZhW9iQtA/k4ILdtTZeYELwDYCl7Vblv3WKcpcsxIZzP9nc6ooJx
         3Vq3KY9+DXJbIWj01F71VF0usLEjO5HRwYocrz+zAvRt4g+9OTIvrCKpuJ0jeKX3kZ9M
         w+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680772299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go7vXYJAuOgSmg2InCf//dImyzPyp7SE/ODRYLR7Z1w=;
        b=T1/w4AJgdT16eg1ZtLak685vVbzkJrSYx3MW3Vy1AcAeLLKplNp5AsVJjlRRXC4KIn
         2F66/ojLEe/pl45vofi+BGJRHYPLoKELwoYDX2BIU1yZDOK63KoYH1yJHmqbHigW5IOX
         FdYA0rvUDQvWjYXzy8I8oO2et4fbbyhORtl6UKDqMUaln+djuLqlLYkwvOgvNlPEXLMm
         WDkqGDwEW3qZBVULAJ6Js/uFgYpe729DSvcFUW9WBl/9sshWTXLjg1y+C8zftJ/f6rra
         qyELHT5V77s/zXK/fkEQ2fN9tO03uKkenP/JpfhvoTPfVSZx8qhEv25ONHrXd/KCKsZc
         Z2uA==
X-Gm-Message-State: AAQBX9dHFDGtsDO1R5htlpQwxk2V1GrauWdeqkAbp/gXYA4qhaHX6x9E
	ZceA/mO3O8TsTjJCP5oka+cndToWafk8+qk0y3s=
X-Google-Smtp-Source: AKy350acDK1wrjJUn0do3nkJys0qMacGPHXrHzzwj+iYTPGqkVA3yTAbprGEJGnOooAvvMRiZQdHzg==
X-Received: by 2002:a5d:6dc4:0:b0:2ee:dc10:b468 with SMTP id d4-20020a5d6dc4000000b002eedc10b468mr1228145wrz.8.1680772299032;
        Thu, 06 Apr 2023 02:11:39 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id x6-20020a5d54c6000000b002c70d97af78sm1166367wrv.85.2023.04.06.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 02:11:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Frank WOLFF <frank.wolff@smile.fr>
Subject: [PATCH] cve-extra-exclusions: ignore inapplicable linux-yocto CVEs
Date: Thu,  6 Apr 2023 11:11:08 +0200
Message-Id: <20230406091108.395219-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179766

CVEs CVE-2023-0179, CVE-2023-1079 and CVE-2023-1513 are patched in our
kernels but appear as active because the NVD database is not up to date.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Frank WOLFF <frank.wolff@smile.fr>
---
 .../distro/include/cve-extra-exclusions.inc   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 76992c5b46..0b89598501 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -384,6 +384,14 @@ CVE_CHECK_IGNORE += "CVE-2022-42896"
 
 
 # 2023
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-0179
+# Patched in kernel since v6.2 696e1a48b1a1b01edad542a1ef293665864a4dd0
+# Backported in version v5.10.164 550efeff989b041f3746118c0ddd863c39ddc1aa
+# Backported in version v5.15.89 a8acfe2c6fb99f9375a9325807a179cd8c32e6e3
+# Backported in version v6.1.7 76ef74d4a379faa451003621a84e3498044e7aa3
+CVE_CHECK_IGNORE += "CVE-2023-0179"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0266
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v6.2 56b88b50565cd8b946a2d00b0c83927b7ebb055e
@@ -442,6 +450,15 @@ CVE_CHECK_IGNORE += "CVE-2023-1077"
 # Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
 CVE_CHECK_IGNORE += "CVE-2023-1078"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1079
+# Patched in kernel since v6.3-rc1 4ab3a086d10eeec1424f2e8a968827a6336203df
+# Backported in version v5.4.235 dd08e68d04d08d2f42b09162c939a0b0841216cc
+# Backported in version v5.10.173 21a2eec4a440060a6eb294dc890eaf553101ba09
+# Backported in version v5.15.99 3959316f8ceb17866646abc6be4a332655407138
+# Backported in version v6.1.16 ee907829b36949c452c6f89485cb2a58e97c048e
+# Backported in version v6.2.3 b08bcfb4c97d7bd41b362cff44b2c537ce9e8540
+CVE_CHECK_IGNORE += "CVE-2023-1079"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1118
 # Introduced in version v2.6.36 9ea53b74df9c4681f5bb2da6b2e10e37d87ea6d6
 # Patched in kernel since v6.3-rc1 29b0589a865b6f66d141d79b2dd1373e4e50fe17
@@ -460,6 +477,14 @@ CVE_CHECK_IGNORE += "CVE-2023-1118"
 # Backported in version v6.1.13 bd662ba56187b5ef8a62a3511371cd38299a507f
 CVE_CHECK_IGNORE += "CVE-2023-1281"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1513
+# Patched in kernel since v6.2 2c10b61421a28e95a46ab489fd56c0f442ff6952
+# Backported in version v5.4.232 9f95a161a7deef62d6d2f57b1a69f94e0546d8d8
+# Backported in version v5.10.169 6416c2108ba54d569e4c98d3b62ac78cb12e7107
+# Backported in version v5.15.95 35351e3060d67eed8af1575d74b71347a87425d8
+# Backported in version v6.1.13 747ca7c8a0c7bce004709143d1cd6596b79b1deb
+CVE_CHECK_IGNORE += "CVE-2023-1513"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-28466
 # Introduced in version v4.13 3c4d7559159bfe1e3b94df3a657b2cda3a34e218
 # Patched in kernel since v6.3-rc2 49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
-- 
2.30.2


