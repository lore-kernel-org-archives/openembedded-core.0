Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 27AAD770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:53 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so70670036pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UdqL1sVZkqtJm0v5QfRb/DnPdU6aO8AdYG8K4BnuYSc=;
	b=EO2v6Ed83kn3GMPQJf7sWh6zxH7DLVHXIvmn6VRuhbO3NTtiVkkn5fr19HLNkPww43
	GKQ6oLC4RvVroQodgoGsIyujZxkb5XvOo2CxfXhhD/Wgsp3QEMMbSX/uxewv4kRbf2RU
	spJ9JXTudeWE/89InOUwg8jyW+LB6E7cdiNI1X0Y91NvCmjPGnCx4XqL/Of9wE8j6o//
	N1/Wgjzkoos0E+mNojsY/J43KD/zqMIJOQC16d2OfGc68L5HJpLNpa3e0LwjlA/zR1W4
	Y3hFrrmG6Gw31WtoLQCDqkgExz9FlekPYwLIxprOwjNhodC4RzZbw5YoyQlmDo7yGiKZ
	ObfA==
X-Received: by 10.66.254.101 with SMTP id ah5mr7112335pad.10.1444873434284;
	Wed, 14 Oct 2015 18:43:54 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:18 -0700
Message-Id: <1444873403-21093-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:54 -0000

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
index 48a28bc..b380860 100644
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


