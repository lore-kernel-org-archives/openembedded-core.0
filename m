Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BFD4372882
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:06:49 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so1248739wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+cg9i3eciPfJ2NyQBgzKuvBflexuFrrNOUuI5bTxVtY=;
	b=dOlYLT4wjAWsHXp5HK9e5D9+Vb8JDi1Ko4i6UqXV5D1TbqNIn+nYgTupZuNOVQDiId
	iJA2DEi99YWulFl/00fv3WojI91fqPzwRezkmOvB3C+dr5TAVV4e+y8b5OGIyCvDTFCa
	XKdU653CjLLMcwGssVJjFcqcKAORZf2xgX1X/NOEj5ALy4SdmC5ENXzXZ2eFj/jFpxhU
	Jbk8Zbbkek2iT8M1arLhOeAu1wwKTItryS0d2gG3W3YHfY/gmaGZr/K4jAHcyY7zU7la
	1m3SVV8Ow78JMcR88J3Vk9a+zQ1es21YR3uQlG+z/NBV5PYXibtwFDjW28q219n5bfvQ
	//ig==
X-Received: by 10.180.198.51 with SMTP id iz19mr7546112wic.65.1420639608801;
	Wed, 07 Jan 2015 06:06:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ck7sm2278560wjb.13.2015.01.07.06.06.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 06:06:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 15:06:48 +0100
Message-Id: <1420639609-3198-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH 1/2] pulseaudio: use stricter PACKAGES_DYNAMIC
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
X-List-Received-Date: Wed, 07 Jan 2015 14:06:51 -0000

* I don't see any usage for libpulse-* packages
* adding '-' resolves the issue when we have separate recipe for
  pulseaudio-modules-droid which isn't built to satisfy RDEPENDS
  with the same name, because generic pulseaudio recipe seems to
  RPROVIDE it through PACKAGES_DYNAMIC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index db144a9..99cad76 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -79,7 +79,7 @@ PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainl
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
 
-PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
+PACKAGES_DYNAMIC += "^pulseaudio-lib-.* ^pulseaudio-module-.*"
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
-- 
2.2.1


