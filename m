Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 59D3160722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:23 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so20474266igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OxlBZec4DB92+fXpVyfSYhjbxC4T17AusRabOSFfKug=;
	b=Irhz7Y+jyulGZH35/Bg+zX/oWpiWLNE9y55gSs+PG20ajCr86Y1gaCeH3MigiRK38i
	JozY95zmRzNuBF7jtZvvfoSdOqgK7Yl70AN+flkTzMFheb0ajbN1BMzjtLInG5+65Zfs
	UTYEloPQBQzDh0/N2iiv7dOq2N38loBD8YV6WS/BtFCqJXvCbBVsCDqhnklExeKhaG4Q
	1v6kh0IL2DevFCgSms3Eqe0RChOukC6IrLh1zAov0u3N9uFcwD5vntm/pwQdimKX+jlr
	H/UxSNy0qqMMtQkMGM1xZiFK8OzbOwcN3rhGcCZbqpBL/loFZIYtupzWOEY1gnh/Ew7X
	K3JQ==
X-Received: by 10.50.141.131 with SMTP id ro3mr4141540igb.74.1448059464739;
	Fri, 20 Nov 2015 14:44:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:52 -0800
Message-Id: <1448059438-24431-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 05/11] busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:24 -0000

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
index 57da1db..03b6cf2 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -96,7 +96,7 @@ python () {
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


