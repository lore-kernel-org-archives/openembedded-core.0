Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8FBC531FC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 07:29:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14458.1784878185225501540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 00:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BEghoWMM;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso89869a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 00:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784878184; x=1785482984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8lF/vEc99GAU+8iT5W28hUU8tStBnwqjKmDLtXZKEU=;
        b=BEghoWMMtxa8ilie+XndjIp/hXIRmI1P/hVE3UJeVWbO1FHCUPlvfpzUFZM2b/EFdo
         apMN1k5TO5Bu0AK9Thfg8v3EXO/+O46vJZHV5aS4+Js9vYbvMg5bzo7QPY01b2rXV4wQ
         ueLOTiV+ZLgrT2qv9CYv8kzHWq+zIf0EZ82nANeGD0UrR4pz4SpsFbbkuE2+OKUhq7hw
         KMf7W6Pl7LD2p+BhJWqh6wyT2bTENiOWvJ/RVQlZ10Pok823biBJ+K2Ue+JMgpf0V6ti
         7JBMUaU2TAqmQClK/oyLrxBCyWtCoRGUthMuhuwmZtg3slWZSHlxA4aEn12GQac2cgCi
         pXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784878184; x=1785482984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8lF/vEc99GAU+8iT5W28hUU8tStBnwqjKmDLtXZKEU=;
        b=khg0KpY//+dOnDFFzTESOsFC8aOpusB92YrOVqFmR6jRHiWlBVBZLLrfZycdbVjnoP
         9Q5s2sa9MQa/vvd9ta3YbQ/pIoeMXlSNi9Ns3Fi/FzYMoQQCnuokYewxTSDindcsU7DU
         mFdObxP/aWzME6aEjTtEjuXCSSnPMQIucNhnAMlNdQfWto2VfzutBu4FLAhLJAxqAWhH
         ZzU9XwUd7y28RmG/r9Z4xkSEwgIZfZ+nuMhySrFHlp43xepbpnHMKyNy26L01uEpSeWR
         SdM54di5Xpa4rxg1r5ihYHKRPORn4PKsqfW/plL9qfhdgoGsmxjyZ9A5Jt7kW7TljPMS
         rqQg==
X-Gm-Message-State: AOJu0YwV64puKVZ2FQvg4DUO4oYHNKmBE4pa74Ap0C9glDNAi5kic80Z
	tyqu7i9C5sZaGqs6FaJsNoA9mk8tsmk9DcCfwFaxtnLAFw/wf1TPmxhXiGHvsQ==
X-Gm-Gg: AR+sD12t+35s3JyDrq+a7FXlxLiccdL1A0nZQvytg9L1i+6HzAM8D8pMWSYTtiAzUgp
	4agiACWKfidnYjV4zlIBziY+IbxC3X0zyke+7u5WGu6mLylqJRnGltVGaQUlC5/iOM3VWUiNQd/
	0P9TlFlkadJCUfs3leyg80+5VUuhtoGp2keF+XpeyHpskvNss95FQF/OV/cIC8Si1eyWt5DBs7U
	TOpHElXAr1wxWY4vPWXrXucyS2PGoQnvJZeDbjlLkEjTxIdNo2DKabfPN29WiMjcMv4dAZ4eky5
	niuKUaclKOR3q0kBziMkatgTOtZwgR+e+sitQgfeIDBbFAsoX90+/SxJcKKMe3WC7OgpcX5A/xl
	eI4lhMQ0kThdkRwZ2GqmmfD19yUt31urD0ixpzxR1neV4GI+Q9k+f4G15zBEdc3aYAtVel4HPCo
	Epc3YbmQ7UJDC/AD0Be2k7YbnyJes4kZoTNYwaOnJYY9lOutLAdgdd0RdnTUX5yaBvm4H4KMCxH
	T4KciKVS0UaRRLFoK6zTJtiG95j84gUuD12hT15/Di6W1lB6Iv53EG2FvT96dd2XUi3QY6P+pQF
	nMCPUw6EA7DzL5Sdf0M=
X-Received: by 2002:a05:6a21:4a97:b0:3c3:b4e8:5565 with SMTP id adf61e73a8af0-3c44b24449bmr7075755637.61.1784878184168;
        Fri, 24 Jul 2026 00:29:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45091397eec.1.2026.07.24.00.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:29:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 1/4] libpsl: upgrade 0.22.0 -> 0.23.0
Date: Fri, 24 Jul 2026 00:29:36 -0700
Message-ID: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 07:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241902

From: Khem Raj <raj.khem@gmail.com>

License-Update: copyright notice reworded, MIT terms unchanged

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libpsl/{libpsl_0.22.0.bb => libpsl_0.23.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpsl/{libpsl_0.22.0.bb => libpsl_0.23.0.bb} (79%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.22.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
similarity index 79%
rename from meta/recipes-support/libpsl/libpsl_0.22.0.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.0.bb
index 1e5e9c74b4..793fe0d73b 100644
--- a/meta/recipes-support/libpsl/libpsl_0.22.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "https://rockdaboot.github.io/libpsl/"
 BUGTRACKER = "https://github.com/rockdaboot/libpsl/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f9e317096db2a598fc44237c5b8a4f7 \
-                    file://COPYING;md5=9f9e317096db2a598fc44237c5b8a4f7 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
+                    file://COPYING;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "c45c3aa17576b99873e05a9b09a44041b065bbfa390e6d474d06fbfaeb9c7722"
+SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 

