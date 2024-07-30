Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7AFC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:40:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.14641.1722336046386950365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 03:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HCdTApdM;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d153fec2fso3376693b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722336045; x=1722940845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mkwp6vvxwSIPyGybbp4SOTpG0pEAflypc0h3Stn76RU=;
        b=HCdTApdMSUTlD8Mx9ZFO2pXBI9KJTdXb0deVA3M1JSHjesRCgo82kVbyWirsPaoJQq
         +ephgLh5GF7ccrDuy7WhR7KJ0Kc6/RfuQNASkUVgkejsoALMlWXm0jxW8+lrwkEX9Cu5
         JZn+kS18Yux9v01XhdMwHAvVVKiMANOVvquXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336045; x=1722940845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mkwp6vvxwSIPyGybbp4SOTpG0pEAflypc0h3Stn76RU=;
        b=X2xdawFXMO5ioM1ni6huDWfDiUxaxwoXABpNRll0cO8m9cokgPk5zbnFf4BL8Cn5k9
         V0XCQq/PFf7dcuAc+kIc16JquwOwBYjtqnl7X3XvmN2GWWw+folJVcjx1u8iBNBOkBuS
         qUj2mJy5L5X353FsOfdGPIcWr/+oKPFKqM+Gv/ApkN3jlCVuj1RYWsh9SRylIodEa0J9
         S6aB7fP0OZcLtN1/DIBIGcMyksXTK8+ul90vaCi+My7tBO2ZDDoBqZeupNOcoQP8cZtV
         mEH5ftNrYK6hwUuyc+vHU2X+8Z+y52kP2zQwknC3fJwjXJo+GzOpNv91cO6ylw3i41Rk
         bX4w==
X-Gm-Message-State: AOJu0YxGnJg3RpFGeJ0NiKDC8snDiz0Bfphuqmv9g2IoexSzoxAM2jGO
	kIs8qUwYqdiTRlM2vpt1jIvk3nMUb2PkU0JKCJAeobqaZIF5d1/0TBQSlG7GVRCdnAR+FGPQT9Y
	r
X-Google-Smtp-Source: AGHT+IGIAksR5rn5ZAQrv8ntXjH1Rf2VNHhdTB74ESChai8DLpOl8SHJCRkFmv9JD6ZrXVzaU4wShw==
X-Received: by 2002:a05:6a20:c6ce:b0:1c4:ba7c:741c with SMTP id adf61e73a8af0-1c4ba7c7612mr6281153637.21.1722336045391;
        Tue, 30 Jul 2024 03:40:45 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c30:2930:4c22:347d:8445:7c05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fbe089sm98364595ad.269.2024.07.30.03.40.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 03:40:44 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 30 Jul 2024 16:10:39 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] bind: Upgrade 9.18.25 -> 9.18.28
Date: Tue, 30 Jul 2024 16:10:37 +0530
Message-ID: <20240730104038.5894-1-asharma@mvista.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 10:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202671

Includes security fixes for:
			CVE-2024-1975
			CVE-2024-1737
			CVE-2024-0760
			CVE-2024-4076

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/CHANGES

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../bind/{bind_9.18.25.bb => bind_9.18.28.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.25.bb => bind_9.18.28.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.25.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.25.bb
rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
index cc35604aba4..ca2aef233b4 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.25.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf3c0c6b250ccb2ab3"
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.44.0


