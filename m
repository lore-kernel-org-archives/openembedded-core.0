Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 54FF96D31E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 20:47:33 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb12so1497557pbc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=roAofOXgxos/e+2H8X6fTTu1uve0rai2H+H+yQq8JIU=;
	b=DxRfwjTe7KRFkN59Xxi39gzoFVc+vPueae4ZC7wv304qMLv9ceH4F7wk1/p5E8Y30Q
	UtbxP1ogwfyekt1uUemX+X8GywuGzSvjysxK8yYyxznWj9/LFiOQ2bsbvZB9mn/Jh8jN
	i+tnxh9uxRcB0OY0fpSgYl+0XTu4R+/Iezgwc5eWM6suudCQCbf6fIvgqtsBh3qPxwYu
	rAS4AeKnFk3h7p7uRh3HE0lCdD7tpOJKpP8el1VgNg6L4p51Yx0hlWcSgy/Ses0RCz72
	9Wb4pwtrQFP9UEPM+JOIjQyUUp01EV/LU03sgDGP1qfcRSZpZ4N/J6mOxws4IQQ0aKsL
	XS9g==
X-Received: by 10.66.155.102 with SMTP id vv6mr5220392pab.89.1382561254910;
	Wed, 23 Oct 2013 13:47:34 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	ef10sm43520943pac.1.2013.10.23.13.47.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 13:47:33 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2013 13:47:27 -0700
Message-Id: <1382561247-30349-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] base.bbclass: fix nondeterministic PACKAGECONFIG processing order
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
X-List-Received-Date: Wed, 23 Oct 2013 20:47:34 -0000

The PACKAGECONFIG flags were iterated over using dict.items(), but this
returns the items in an undefined order. As this order determines the
EXTRA_OECONF append order, we can get EXTRA_OECONF which are functionally
equivalent, but whose contents differ, resulting in not using shared state
archives we should be using.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index dfa580c..93bc700 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -433,7 +433,7 @@ python () {
         extradeps = []
         extrardeps = []
         extraconf = []
-        for flag, flagval in pkgconfigflags.items():
+        for flag, flagval in sorted(pkgconfigflags.items()):
             if flag == "defaultval":
                 continue
             items = flagval.split(",")
-- 
1.8.3.4


