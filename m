Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id F286277121
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:37 +0000 (UTC)
Received: by pasz6 with SMTP id z6so120634310pas.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EtStMCATlQIpKg7gI+gqI1z6BOm51KKlQ8CXbKJtGfs=;
	b=Say3JGgTan8YCG5nSUwuFuepgGu2Yj0PXnUzhJsqfFma9szyBZk4Vmm7FV4ebYhf2A
	yP9zovVi5MxAJqV/UNTLZZ6P7YEITR6zkPRZJT0X5t0XR4f0xTR5CMtWHOT1hhd0MTel
	q0Xj9JS0hazIh2S/PdKU4KLyJXuOMjxEdGf6cMtqC/EmM8GGSACKRQPpkESihO/gFyR5
	vpZg+MHXUBNC3vBu2HoMSvTm7yKA16+Qza6BAWDWcLSBwG9Fp7Qw4x1Ew6ZYQFkKSrKI
	cw0OxRzjDUfeohGmDkAUHJsPgB25dy3TyWYBGFpRYpIEg+q3od6zDkibwwo089mg0HRc
	8raA==
X-Received: by 10.67.30.132 with SMTP id ke4mr15741404pad.58.1446799658374;
	Fri, 06 Nov 2015 00:47:38 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:06 -0800
Message-Id: <1446799631-7037-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 06/11] busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:38 -0000

With current busybox Kbuild, setting .config to:

  CONFIG_EXTRA_CFLAGS="foo" "bar"

and then running 'make oldconfig' results in .config containing:

  CONFIG_EXTRA_CFLAGS="foo"

ie the CONFIG_EXTRA_CFLAGS configmangle in the busybox.inc doesn't
currently work as intended. Remove the extra \" \" to ensure that
${HOST_CC_ARCH} gets added to CONFIG_EXTRA_CFLAGS.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c568361..a655a36 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -97,7 +97,7 @@ python () {
                    ("\\n".join((d.expand("${OE_FEATURES}").split("\n")))))
   d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
-                  ("\\n".join(["CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\" \"${HOST_CC_ARCH}\""
+                  ("\\n".join(["CONFIG_EXTRA_CFLAGS=\"${CFLAGS} ${HOST_CC_ARCH}\""
                         ])
                   ))
 }
-- 
1.9.1


