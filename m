Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id E9A616072C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 01:10:13 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so25528267obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 17:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kr+SGYCzwV9lIAgWkWRn0o90f4A0WjJ38P283FXYSgQ=;
	b=eSrnP3MAo30Xl8Ze1wOrZSeGLQOAx0lE6T2Q4yiOyJXUGC78Eob3Ilhzpme5Lo2zLL
	w0Uh6JP4qjnBQjrcftl1MjiiXuhx51TdtifFhcTMrFszIrAfv2jWjAXTS+hTWTqhziRq
	P03FJhg+u8yKHbgdqXMUZ5boaia8WJ/87OZvPG7QlvqDnLao4jiAhx8ZV7NGY3qBMwup
	Hzx0ZPIdV/qjfGPA0EARym33D+omEEync+U/DI6ZI/Ea2ZK1pqAmgKwQd5e93u57yNnC
	5MHb0abIpZmEFj1aHOAU8fJMI9FbbStBDaAgzrzviggzsLfrzvaFLZCvsqsW25kYgHta
	PRfQ==
X-Received: by 10.60.63.233 with SMTP id j9mr2256185oes.46.1449623414081;
	Tue, 08 Dec 2015 17:10:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id t84sm2540098oie.1.2015.12.08.17.10.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 17:10:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 17:09:58 -0800
Message-Id: <1449623398-29127-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
References: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] feature-arm-thumb.inc: drop 'no-thumb-interwork' tuning feature
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
X-List-Received-Date: Wed, 09 Dec 2015 01:10:15 -0000

Interworking is required for ARM EABI, so attempting to disable it
via a tuning feature no longer makes sense (support for ARM OABI was
deprecated in gcc 4.7). We can drop '-mthumb-interwork' from
TUNE_CCARGS for the same reason.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index fb22977..0c32210 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -28,13 +28,5 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}'
 # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
 ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
 
-# Whether to compile with code to allow interworking between the two
-# instruction sets. This allows thumb code to be executed on a primarily
-# arm system and vice versa. It is strongly recommended that DISTROs not
-# turn this off - the actual cost is very small.
-TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
-THUMB_TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${THUMB_TUNE_CCARGS}', '', d)}"
-
 # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
 TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
-- 
1.9.1


