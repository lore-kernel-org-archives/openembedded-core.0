Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093CFC982F8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:13:17 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5257.1768590788867432055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+Z5uAEr;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c532f0c317so45012985a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590788; x=1769195588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJztdStxg7wwAM3hZuMHgzV4ybGDlyVuhYYNDMUfcBs=;
        b=Z+Z5uAEruDHkmI1eSrxDrIyP+rJ/K6LsGdcS+ywmQafxdwR8cYg36bvl8gaW2FWXFD
         oqZcoBToNePrB3y0rZpTp7UPY99ywHmLo+MWUPKN9zdl/onBT4IJH9n6uqLN9fMuLpUw
         T+66CzInDWZOLuQKKivIQ+vXfqbBusHkUP5SQccQFeEs9UCOrbp39Spv5EPAwPnRQXnx
         R4FJi2ykuOMe9ohJWcadSe2YvEEJlTZ0VOkcPAuNuXJfajVHII3cHbaaUHkQ02t9Wrx/
         /KutHB6uNNYAmky4e4WprlQJKxyfpXuqoQGiaEH7G6wr5EKbgk7T6z1+2HqOnv+jpIxO
         p+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590788; x=1769195588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJztdStxg7wwAM3hZuMHgzV4ybGDlyVuhYYNDMUfcBs=;
        b=WFmlpV95J1gO754dRpP3FVH98Ops/tPiXo3YU/mdxJykR9zGqbt5K4cqwxAvihU687
         hI2WX8ENAzg6FRAFfDJ0H83UjkbukShKDmVSPY9J2/OIlUidB7543J30Y6AGZm4wJ4vX
         nZnwG5hQeC/U2eNcmvCOr6g6Rz86W3jr7YG66SykomNz6FF/97z5erMcuql3+z5YZkZy
         Dcb8h6xhO+ko3xlh9lP3mItD5K3zAiSqifbGaLMn2/33soSX1l4kh2fGxvQzz+7HV/CQ
         +P+x1NRGQ0eMOhqzhNUgNDKvbEfAPfCtgVlz2llFz07TfzNRsz4sm/+TiahL1F0j+udX
         TGRg==
X-Gm-Message-State: AOJu0YzVX96Cu/v0FBZ+cv6/8gdfbIEYnsuzmf0LERc2VC6iJ/spbnBq
	s4klupL+X9rCCADY2PX0rhSXmi9DHZQfAsOLQCJWzdwnukwbPfnGPlNBWlwOiglHi8U=
X-Gm-Gg: AY/fxX4C1+i2+KCwCqP1le6LoSbUlBTyIvnrFJVqxKtvAOx3X4cEY0TLE76jAgX6tNj
	eNgLaQhLwmanzRVmi03sSUe94JSw76iqourPz2pCArKO2EokuhbAaShtQTxipKEbmQzoz+sdFZ9
	jM0vF498nPfw4cMc6bDlDhwH/Njz6ftvQ4pYiV7XCUkWvRt9KLl75X6AqiVb9J2m/A0ZEEg/3IV
	vWAudsSu8aREpyf81oftAUJDKPKGnhFjOfIkg0k3d0rwM2HQBLtvCwCVgKXdAWxuh5DF2ZgWu0O
	Hv5W74xBXgPYfIk/xzWVXcrkEaLnL+6Gc0o5c7wjGfdmqMGZzZV843o3VwFt7g2PT1yJPFUZCk1
	8ibl9YSearbF5pYg0X01vRwNiP9+kEkenYC0+tngFuser/F7oZyD4h6yLMXpgpFdweiVidozJIU
	MpLE2CdX9JPoNuWn+QVqr6aZIIN61hnNbXACcZUkPa6OTpIN2bEyuGseM=
X-Received: by 2002:a05:620a:a215:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c6a719d1a9mr372317085a.4.1768590787691;
        Fri, 16 Jan 2026 11:13:07 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm287446685a.12.2026.01.16.11.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:13:07 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	antonin.godard@bootlin.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 4/4] linux: Add inherit on generate-cve-exclusions
Date: Fri, 16 Jan 2026 14:05:20 -0500
Message-ID: <20260116190520.118714-6-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116190520.118714-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229562

Update linux-yocto.inc to inherit the new kernel-generate-cve-exclusions
class.

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..d627afa3a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -5,6 +5,9 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+# Generate Dynamic CVE Exclusions
+inherit kernel-generate-cve-exclusions
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"

