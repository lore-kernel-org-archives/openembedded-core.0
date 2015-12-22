Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7F58B6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 01:07:12 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id uo6so3070284pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 17:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=019wDSDlPyTYolXL6r5rq5rCUGFY8UIrYf+CxWuJSEw=;
	b=OVozt1+T+gAwN6lw5IEeGaNUT+z3d9sYI2QzvG3ASfAeSssQQBnpocZcNZ4ylumewr
	fYBFdoNVxFmBTQTz0EyAWx8NfdgzgIjUYwNql7EMK5RIjesxk7XXUEReNvP+fVKJgy0t
	S0RDKoPr73tYfYTWHwu2juzsbAtauNochjPUe4fPiy4qV1VOsLOG7zehCGu2amZGejgF
	M9KH943TGySXjcQK7RcUCRFmuL8KM09aL5urtjiSRd0LWnIwLDDN5a0JlGepvRda2Z5V
	/Tu0t2moazsajS0dzfeQd20lf/FkWhCdxKKgdONoxBc5Nu94CUCAHrIaIOrZ22Je/R8z
	e2WA==
X-Received: by 10.66.161.133 with SMTP id xs5mr31446160pab.70.1450746433063;
	Mon, 21 Dec 2015 17:07:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	dg1sm41776567pad.18.2015.12.21.17.07.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 17:07:11 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Dec 2015 17:07:02 -0800
Message-Id: <1450746422-10755-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] directfb.inc: enable bfd linker workaround for all arm targets
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
X-List-Received-Date: Tue, 22 Dec 2015 01:07:14 -0000

Although the gold linker problems with DirectFB have only so far been
observed with armv7a, they could potentially affect future arm targets
too. Since there's no particular downside to using the bfd linker for
DirectFB, apply the workaround to all arm targets.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index b905ab0..603aba3 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -23,7 +23,7 @@ S = "${WORKDIR}/DirectFB-${PV}"
 LDFLAGS_append =" -lts -lm"
 
 # Workaround for linking issues seen with armv7a + gold
-LDFLAGS_append_armv7a = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS_append_arm = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 BINCONFIG = "${bindir}/directfb-config"
 
-- 
1.9.1


