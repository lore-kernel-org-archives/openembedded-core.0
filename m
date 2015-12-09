Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0B9607AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 01:10:10 +0000 (UTC)
Received: by oixx65 with SMTP id x65so19090673oix.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 17:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bJrcAlPuRGOMFUTikjqd8E3GYlvQSQ4zA0TPPkjHAsc=;
	b=EFHnnLx4zGBWscCqeR7xd71C2+0sBncLw4Ic38UvlAg1aHmp12dMyIpu5JF4wjZm7P
	K6wkIqw8BV21+ctuM49ELkph2/dSSEt5VJJFoLfTFNed3BYxs5lp9htKnoJBKQTLYn0w
	i6yeWMCB9vPy5ldLVvh2iZWluI04h3VXAT4atZQ8X+A3QFpYNKNxcqMbyM+qQbsJhuLQ
	CbnBpUYHBMmYekhsshFSSIKfXkIIUVatVKLAcGZ4rYFt6Za4HDZrfU+E+zJBCzOhk3nG
	qDUW9999ngm2aCxE5M7OosR4V3MgU09ao47yoZ4S2c+BfeyWaH0RmIPLQAIbFYJwiNSr
	2WIA==
X-Received: by 10.202.73.133 with SMTP id w127mr2140443oia.43.1449623411051;
	Tue, 08 Dec 2015 17:10:11 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id t84sm2540098oie.1.2015.12.08.17.10.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 17:10:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 17:09:57 -0800
Message-Id: <1449623398-29127-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
References: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rides
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
X-List-Received-Date: Wed, 09 Dec 2015 01:10:10 -0000

Bitbake over-rides for _thumb and _thumb-interwork are undocumented
and are not used anywhere in oe-core or meta-oe. The logic setting up
the thumb-interwork over-ride even seems to be reversed and nobody
noticed, so it seems safe to assume that these over-rides are not
used.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 0a9545c..fb22977 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -24,7 +24,6 @@ python () {
 }
 
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
-OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
 # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
 ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
@@ -35,9 +34,7 @@ ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_
 # turn this off - the actual cost is very small.
 TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
 THUMB_TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
-THUMB_OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ':thumb-interwork', '', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${THUMB_TUNE_CCARGS}', '', d)}"
-OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${THUMB_OVERRIDES}', '', d)}"
 
 # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
 TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
-- 
1.9.1


