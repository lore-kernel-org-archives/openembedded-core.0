Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E288E6FF56
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 12:44:02 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b14so169545174wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 04:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+Et1c9NE7Er7JMUa0p6GF+m1CzXKGkgSESP7YwGT7Yg=;
	b=ZbL8Rovd68y+ApfNr7uUW4MgN/SMQIILvLK4QcVp5fWaNMbHd4q1FcGjHHh5ejgSlj
	mnr3UduL/oVSN9yKEYrASleCbIXv+YiM/RDovEnWi2JsbZtKWg5vnzSbKzVIejuuzN9C
	x2VMjQUyGIk+fHmSqzTCzDWJA7fa1OGNLhbyyKu2JzbHEu93/DE3BphkX7hLaMTE/UEQ
	ikL/NTQ7APZopK06P2dEfF1ueI7rD3J9+31I9gAUjDX/OuwG2xsf1d0C1SsnkWBFq2b8
	rhQwD4jedUWjRw0wRgh+TGIxpkHhjrCp5ft+LSoPJZtaDDvqAeabkLutleq2eu827xJ6
	7bow==
X-Received: by 10.28.125.147 with SMTP id y141mr21488967wmc.18.1452257042684; 
	Fri, 08 Jan 2016 04:44:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z3sm94784450wjx.38.2016.01.08.04.44.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jan 2016 04:44:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 13:44:32 +0100
Message-Id: <1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 12:44:03 -0000

* in all cases we currently have we consider armv7ve to be compatible with armv7a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 79e1ef6..d0fdff7 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -3,7 +3,8 @@ DEFAULTTUNE ?= "armv7ve"
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
+# In all cases we currently have we consider armv7ve to be compatible with armv7a
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:armv7a:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
-- 
2.7.0


