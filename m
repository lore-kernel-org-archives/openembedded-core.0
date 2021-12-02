Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A66C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 20:21:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.2384.1638476460624367443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WlNYawJU;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id iq11so617574pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTQITtLpvAQ6KXG8T7U0dcocwzBsacL+FS0xXExqpHQ=;
        b=WlNYawJUVQuWdFOjnu6F+4rteq88QdVNZYJlRBeurVLlTPOSEpHFYNZKaImpavPh0l
         D9DCSLZ/5GpfMgesSn59Sswr7YU1hcOARuIq9WjKrpoFFadAl/a/Njrj1SPce2QZL1rl
         KhTSetRgtAurN5uu/SLhidgBVGJMlfeOIzsl774GAe8sV0PE2hGTDDR6VTHsa/woNdEZ
         BC7MV5VQ6/iJJ71tA8ctIhEiF0D2KAHvU0Ucu4Hh/HGCFhbAZ21yJ1PF5gs2FmYSpv8E
         J6V1EChUJHLdf20w9lqhDtzxksARw1U97s+4pEeNnpYOVlt30pQi3k/sNvV5FzrmfsrJ
         BK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTQITtLpvAQ6KXG8T7U0dcocwzBsacL+FS0xXExqpHQ=;
        b=IcnwFOCHutrkNOjte23cbWwSTncgaGm1sf+DAZzfz0dWOtRSXr0mnxmSXcYM+g0Vx/
         fUiztQJ5/+mU6OwYE8ziuTmqz/Q+Yg6AOAKfw9Uh4zyKQ9qoV+B1mFTEnmpzVwqk2WAq
         2l+uB3MRg4pmgsKrxUbLVnPxvvLj4fE9RhZi7+SglUczBkitZBQB6bpgQknoK/aNXAlq
         JLeB6ZN2vUSQSz3nyhlLZR7nfCMvkc+95LYkJ3yskiCv5JzBYs+EkHFzgQgO/SqZRpvQ
         lpwhmco5mgCjOXCGZEWCJTJv8UgxQbtzlEmmV6F8bb6cWgBR1DlhAYHob3qwQbPF3/OP
         UETQ==
X-Gm-Message-State: AOAM533i06s8vjO+YIFbvA2x5aZ4CGTJxuwLRuMbWRPAA0U58H+xLYOh
	Q9Risp2TCtFb8VK31BXLum6pcDYwdrp7rA==
X-Google-Smtp-Source: 
 ABdhPJwy0xl9k+SNThiBG/InYmGOyFrNqeM663dXxkOgytMHDvMb/CRgtTVeKFLhXaPsh6SVMOlmRw==
X-Received: by 2002:a17:90b:1d0f:: with SMTP id
 on15mr8455961pjb.144.1638476459640;
        Thu, 02 Dec 2021 12:20:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id z93sm350447pjj.7.2021.12.02.12.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 12:20:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tune-cortexa72.inc: Add tune for nocrypto case
Date: Thu,  2 Dec 2021 12:20:56 -0800
Message-Id: <20211202202056.698020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 20:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159102

RPI4 based on BCM2711 soc which does not enable AES extentions
in hardware see [1] fixes [2]

[1] https://forums.raspberrypi.com/viewtopic.php?t=207888&start=25#p1642862
[2] https://github.com/agherzan/meta-raspberrypi/issues/964

[YOCTO #14641]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 2a510bd45bd..b2eb35f111b 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -6,8 +6,14 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72"
+AVAILTUNES += "cortexa72 cortexa72-nocrypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
 TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
 BASE_LIB:tune-cortexa72               = "lib64"
+
+# Some implementations do not enabled crypto ( e.g. BCM2837B0 in rpi4 )
+ARMPKGARCH:tune-cortexa72-nocrypto    = "cortexa72"
+TUNE_FEATURES:tune-cortexa72-nocrypto = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-nocrypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
+BASE_LIB:tune-cortexa72-nocrypto      = "lib64"
-- 
2.34.1


