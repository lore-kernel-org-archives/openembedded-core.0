Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B5CC1767E4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Aug 2015 01:15:28 +0000 (UTC)
Received: by iodb91 with SMTP id b91so66981726iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 18:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ecojp0RhYE1GM0zQaixO/XCAVc9WHTNjugd+1xs5AbQ=;
	b=Y/0gYEVughoCRIwmW1OG+e3qXB3ngMKyW6KFgzDtw2aHB6tgRoLmziCUGPaKLshKqF
	KsDAQcNE1FaivHEbVF5+BkduQqJLGlA0d2xiWre9USWbV06mpDGeU7niOp+2m2sYLyqo
	zLI6bQvRUVF0qUJSlKouQpQro3kQ04BKCq1hyhHshlBPS/+wSdQrd4p6cdrpJ6iFfpBa
	61h15x7jdN/dyewpL0+jXmHg2vhehn/MD2QNN9u+3WkX62d/PM4SGTWUh+iKP+y4yyVa
	+gO+dUhwAFiEPrddjU/ZEz2jgG7Rl9NhLJlYm4q9N9HL3xIyKdBKbx2yEWpinzLL9ecg
	yFWw==
X-Received: by 10.107.5.18 with SMTP id 18mr5170541iof.156.1438996529167;
	Fri, 07 Aug 2015 18:15:29 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	g123sm8071699iog.31.2015.08.07.18.15.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Aug 2015 18:15:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 18:15:21 -0700
Message-Id: <1438996521-4789-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel.bbclass: dont assume ${B}/include/generated exists
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
X-List-Received-Date: Sat, 08 Aug 2015 01:15:30 -0000

Older kernels (e.g. 2.6.32) don't create an include/generated directory,
so check that the directory exists before trying to copy files from it
in do_shared_workdir().

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d06f6cf..5318b5f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -300,8 +300,10 @@ do_shared_workdir () {
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
-	mkdir -p $kerneldir/include/generated/
-	cp -fR include/generated/* $kerneldir/include/generated/
+	if [ -d include/generated ]; then
+		mkdir -p $kerneldir/include/generated/
+		cp -fR include/generated/* $kerneldir/include/generated/
+	fi
 
 	if [ -d arch/${ARCH}/include/generated ]; then
 		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-- 
1.9.1


