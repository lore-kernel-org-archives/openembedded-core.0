Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id B475F7736F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 00:48:50 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id yy13so21851563pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=abcxmhkcHWeYsAQih/BfMABDn9WKcdToiEgZfsdSO0A=;
	b=TyUaXVyDpXpN/2WpRn6/znENB0ZdwM5yyY+zmYs/DUvFNsasirpZD303+yvFIA5XsC
	mH06+Y1FGiZ8trFogCTFv5mBuTykA6klqrl/g/FcshVy1TS5kYsPSxSH2CIdwd3MJlEL
	huBgvqX0tU5rpq84dotj62KQjYvEbi8m96kR0yYYuUWgXNgMzXAl1OntSiYcdu3bEqqN
	SJQeYjWUnCeZ4059J9zShKnPgvUE6Q+ARnJrMLYia5gMdIuQWTZFze1aOGV+dNBiZ0QV
	16YKsdev7lh7XMKg0YUDvWHtcu/m7GYwPnvKSF24B0Z9KaI1vXqLaWpAPQXkQ21vgAji
	eLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=abcxmhkcHWeYsAQih/BfMABDn9WKcdToiEgZfsdSO0A=;
	b=TR0NS9jt2rhoAjoCq7gk8dA0JLFGPsdF1MZ8cczd5a0QLRhKYZ29toY8v+7T2ZnOTO
	f757Z9R3yZ0owOTrVVCYwULhL8mcszkl99cRZH/DmHYFfiQdufb+jRXvmx1tqZKikGcO
	IOWwDeNh0kfdgWEzVbTdoZQQIJXd+1Evc2YbO0BqiIpdkxsaAyAug7xGj4RHB2oFEgqi
	Ra4FXESmD2DqbVHWEiQUn/oNm/FW+r3wkow/mvp1/N8e+Z4fxORuCOldNIvpwO14AEzN
	EODu96CcDffa3P5L3LSBwll0ZSH2F+wDqxc0Di53xjLEbqqd0L6ZcIBgtRUzZIPBnEj/
	hBPQ==
X-Gm-Message-State: AG10YOR8Xqagc4rAL0V6DRCczcn1IhL9Dk5Z9FCy2XSpdJkkjEjPXV2tDVxVGGtxgWvUtA==
X-Received: by 10.66.146.196 with SMTP id te4mr58923212pab.125.1456361331624; 
	Wed, 24 Feb 2016 16:48:51 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id z5sm7590873pas.29.2016.02.24.16.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 16:48:50 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 16:48:45 -0800
Message-Id: <1456361325-19298-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] boost.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 25 Feb 2016 00:48:53 -0000

The original over-ride dates back to 2009:

  http://git.openembedded.org/openembedded-core/commit/?id=43e94412c45b4b79485a64010c76d89b245bb235

There are no obvious issues seen now when building boost in thumb2
for Cortex A15.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 981e6ee..79c4e63 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -2,7 +2,8 @@ SUMMARY = "Free peer-reviewed portable C++ source libraries"
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 BOOST_LIBS = "\
 	atomic \
-- 
1.9.1


