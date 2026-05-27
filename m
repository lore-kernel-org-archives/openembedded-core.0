Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79412CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:55:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18198.1779880380007547271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=AIiPvMeO;
 spf=pass (domain: 9elements.com, ip: 209.85.218.50, mailfrom: tan.siewert@9elements.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bd9a71b565aso1373533066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1779880378; x=1780485178; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrYIZH2mgBQEgsHpFTzpThSFu7jSgovP7IhhRFigCWI=;
        b=AIiPvMeO97P6JPVe5tqk03BV6unFHP43xLHWAb1Koombdzr+V7SHkyVf7QKK9LQBr7
         zYEfNLjBhMACmGvakLYGcLq+kkayf0OLbvHF+tVhMhr0u9fhOlGzRghxy6J/jlpqbfPd
         YmLZN5OK5FC9K2cOJhqKG7Cfnsd/6zymk1uZ9eutd8KB60lwquqYJ6po674Zwo67AlWD
         AOWiwcz2VA0ShmOUUjDKg1jHp3LsAWL1oGEFk5cA1tovKLwhzXMHA3le2TvxOOzopFo2
         VWiSXbdKAfyIy25x2mO/MgCP/QHpHye7HsjIJ7fTJ9nUMm5UxsqPGLmshCjnol4gdR7W
         U1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880378; x=1780485178;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrYIZH2mgBQEgsHpFTzpThSFu7jSgovP7IhhRFigCWI=;
        b=QD87P8SkUmOPMB4lQWNJvGiq1Bc/gwVnUA3KHcHtbFnMZ41pECIY2A9aauysYQIZIn
         1zfyclw9NWR/omF0dJ7LXwxitv5tz+kYtxAM5+AllC82A2GAIPuS3DwGuwGUwSRWMjTU
         45IY2LVRpiEaw/qjDMPUctIhW5By5uI4vurzbtRpSdsF7w349z3FABM3XtOLUYABNlFx
         w5/Q+9/m37cNuPBnQJTK41RBWxapuIRJSsFSB2m6WpJp3k9J04LFNZOT0Sh1HPtidkr4
         +PWATSsPvMOtltykH2qbu1QnfEGeuA7Y/3oc3pxkoNFzrvkhuUgE5j0mHPsGoj3QG43n
         UFVQ==
X-Gm-Message-State: AOJu0YxlS4e11EyQuQJgrECEjiZ9yuboXFTgNNp4cY1v67pHdOtP0YaJ
	HMVvpRmeITtA4EG9seFrv6JMKuCpwWnx2wt+KshWEY5wAEh605DGf1i2mY9nz0SzvbGfvzdHW8C
	VOeXPAsZc6A==
X-Gm-Gg: Acq92OGqsh6h5MWW1yfvCdR7wTCWObn2AMGPDGI02bf11ktg+B4Gio5fuGeZAoGX+cb
	C2NZ1iXUanxqTXEgg9wEVQFjxWYOYOdzW3xjOtHHwAUCdzTnhsawZqW3yM+8J+bndtCSo9F5AF7
	3FCiJ9R1nmeDbPrhw9zatGX/JSAwqBmmgwdAaIYc89AVpboENFG1ZHdpRoXFIMRhwWtyP3/U/8Z
	tpM7vO+qp4wJaOCzvX5QMGXWqFoBx3zRUdnDjc1qDdvMUibzscdxr8VHZruYWwg98G2EUjJJtdF
	32O9saDSMzsNnaBOvdjQMyPdYyAWEiHs/ucNJ3bynRw7IxG2izZ4s+/NHUvj1fQcQvEZWmGdHuK
	6EXAw9seRRDnaVDOr03wmg+imAgJpbyYc6nHId+XSmhF7PRxWdrF5JYdxCjdIGc5J86rj4nh9Vr
	fP+K2CQSf0/ynkYk6GLp1fj+ZB0yBKFhW0xFWojolW4+SROEsWReQNVdcbZf2Iq6wnkP2vG0gxu
	dUqIUa6y/1XJah3oJJdhdAPRAPmajqDqA==
X-Received: by 2002:a05:6000:25e8:b0:452:75ca:3fab with SMTP id ffacd0b85a97d-45eb3af6236mr38801138f8f.38.1779879990502;
        Wed, 27 May 2026 04:06:30 -0700 (PDT)
Received: from [10.0.5.39] (p200300e6670565003ebac936e58f3e19.dip0.t-ipconnect.de. [2003:e6:6705:6500:3eba:c936:e58f:3e19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557679sm9020592f8f.10.2026.05.27.04.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:06:30 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Wed, 27 May 2026 13:06:20 +0200
Subject: [OE-core][PATCH] tune-cortexa9: add tunes without VFP enabled
MIME-Version: 1.0
Message-Id: <20260527-cortexa9-novfp-v1-1-f27149c9086f@9elements.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNz3eT8opLUikRL3bz8srQC3WSzJBOTxBQTi2TjZCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIlGh/V5ABqbFKtbUAAGFomnsAAAA=
X-Change-ID: 20260527-cortexa9-novfp-c6b44ad48c3c
To: openembedded-core@lists.openembedded.org
Cc: Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779879990; l=2826;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=GkCd6ut8jeroWF+CkwVLR3DUJeC9jSmiFegcvlElAdA=;
 b=pi6cIwVve+hOr9gH6zeBJ62LJXYF6cQyGyfkVxyLxJGvEqVE6wd3xz/WvcpY8uF9A7/N/p+nV
 fy6KYw4BigHApH/sC232Tw9KzF97ev2I5W9g5PkHkLXewDb7jdquY+M
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237657

VFP is optional on armv7a and almost always included, however the HPE
GXP SoC omits it. This SoC is used on HPE ProLiant server motherboards
as the out-of-band management controller (iLO).

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
index 4b4a52884d..9256a74c66 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
@@ -7,20 +7,26 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '', d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
+AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon cortexa9-novfp cortexa9t-novfp"
 ARMPKGARCH:tune-cortexa9             = "cortexa9"
 ARMPKGARCH:tune-cortexa9t            = "cortexa9"
 ARMPKGARCH:tune-cortexa9-neon        = "cortexa9"
 ARMPKGARCH:tune-cortexa9t-neon       = "cortexa9"
+ARMPKGARCH:tune-cortexa9-novfp       = "cortexa9"
+ARMPKGARCH:tune-cortexa9t-novfp      = "cortexa9"
 # mcpu is used so don't use armv7a as we don't want march
 TUNE_FEATURES:tune-cortexa9             = "arm vfp cortexa9"
 TUNE_FEATURES:tune-cortexa9t            = "${TUNE_FEATURES:tune-cortexa9} thumb"
 TUNE_FEATURES:tune-cortexa9-neon        = "${TUNE_FEATURES:tune-cortexa9} neon"
 TUNE_FEATURES:tune-cortexa9t-neon       = "${TUNE_FEATURES:tune-cortexa9-neon} thumb"
+TUNE_FEATURES:tune-cortexa9-novfp       = "arm cortexa9"
+TUNE_FEATURES:tune-cortexa9t-novfp      = "${TUNE_FEATURES:tune-cortexa9-novfp} thumb"
 PACKAGE_EXTRA_ARCHS:tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS:tune-armv7a} cortexa9-vfp"
 PACKAGE_EXTRA_ARCHS:tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS:tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
 PACKAGE_EXTRA_ARCHS:tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS:tune-armv7a-neon} cortexa9-vfp cortexa9-neon"
 PACKAGE_EXTRA_ARCHS:tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS:tune-armv7at-neon} cortexa9-vfp cortexa9-neon cortexa9t2-vfp cortexa9t2-neon"
+PACKAGE_EXTRA_ARCHS:tune-cortexa9-novfp       = "${PACKAGE_EXTRA_ARCHS:tune-armv7a}"
+PACKAGE_EXTRA_ARCHS:tune-cortexa9t-novfp      = "${PACKAGE_EXTRA_ARCHS:tune-armv7at} cortexa9t2"
 
 # HF Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"

---
base-commit: a64b4f39724c13de3cc5098dbcbcb4fb8a40dbac
change-id: 20260527-cortexa9-novfp-c6b44ad48c3c

Best regards,
--  
Tan Siewert <tan.siewert@9elements.com>


