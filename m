Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1519476AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:56 +0000 (UTC)
Received: by iofh134 with SMTP id h134so208356615iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UdqL1sVZkqtJm0v5QfRb/DnPdU6aO8AdYG8K4BnuYSc=;
	b=uVqQC3Dkz34KU55yCeouEBMhGp9hzo2tPkPf5lh8THQj+0YopU5kM5cMcknoDYNEiN
	GJobclH5yXYJ/kAbezAw46SnQLs8z/FMbwNkiKPTHm5nAmpqSEBymRZHh37fkiFrWVvb
	adnk1Tk0u9rob4UqiqfdaV6htYGS1Mgc6cd3LtXcwT1JJRiIqMqI46TmtiEWLWhohBnm
	dKiMZBok/n+vARENZ6qpXJoS1qDU93SvZcr228Nm9nYAHDKVo83NbLUBGXgcnvM64WNs
	12oad8VBnpQpFYE+yRO3Q9mc7vf7sY2myc5nL7F5in2hfQorxNXLp44brCJpilwLlMfU
	x2KQ==
X-Received: by 10.107.10.140 with SMTP id 12mr32997591iok.160.1444101597174;
	Mon, 05 Oct 2015 20:19:57 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:27 -0700
Message-Id: <1444101568-16639-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/7] busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:57 -0000

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


