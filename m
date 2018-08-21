Return-Path: <rv@rasmusvillemoes.dk>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 45FA77900C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 10:01:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id f135-v6so13120762lfg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rasmusvillemoes.dk; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zeo4HoWNsXA2GVec23xHBYsCw4GkVgDf2/+RSnyqDes=;
	b=ThRspd9gF8+yoMQTXMu6qIsh0RwQ7HQAXUi630fAYYruVoQ8Pt4FRhlfy15tH8D5IJ
	i0UU0/PcSQIWin+HCxE9fg3BzSnabyXiCQla/G6fxUZLEn1AEO78oZjOBq6bdxOFre3U
	ShGO3EUdmswPhuyGIHWSWvVXPDtNwmoAxWntk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zeo4HoWNsXA2GVec23xHBYsCw4GkVgDf2/+RSnyqDes=;
	b=Xv1UFaPoHFRF+5jIeJb9MEs1gV0sdTCdRDaOPidrFvke35XvDBbMEWGqwRIEl8NbtQ
	96ZrGXnVrEheXVBn1niUXPND+rajSeeOhUZbEG55uRunaeJ/PaVvSCDcQ/2XyHwr6JvM
	cwDOG4LPVDJLWAIImAB8ByBxG9rc7k0glvEx48xzVAFeS+r5HYS3gWmdt2xplbl7agbJ
	0DQaMW5iWs5BP4yloBFJCZFZKd/tWYzQg9sYj3JCFc/189KQhq5UewLDaQS5Ld6y9OXL
	m+/QOjfQ86Gg0pTrfPOiCqvgMlz1QsEb/titBqFqS0KKyHbPhJMq+TaXOeNGd0L/2eoz
	MrOg==
X-Gm-Message-State: AOUpUlFMYHC914l0/WUYt7CHDqFfRRddKxAag3R/2IDBBV94lt9g9iw1
	J94r/bF666r7ByCzbMuCi8pi61aaSayn8A==
X-Google-Smtp-Source: AA+uWPyPx/myAuJ88mV3yDvGjgN1d/oMN5LRHWAAXEcj9z6GiOQ6a+UCsqk3dcjjG8jzvoldTeFIYg==
X-Received: by 2002:a19:73c5:: with SMTP id
	h66-v6mr3777651lfk.22.1534845709686; 
	Tue, 21 Aug 2018 03:01:49 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm2037104ljh.26.2018.08.21.03.01.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 03:01:48 -0700 (PDT)
From: Rasmus Villemoes <rv@rasmusvillemoes.dk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 12:01:45 +0200
Message-Id: <20180821100145.12696-2-rv@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180821100145.12696-1-rv@rasmusvillemoes.dk>
References: <20180821100145.12696-1-rv@rasmusvillemoes.dk>
Subject: [PATCH 2/2] lib/oe/package.py: use bb.utils.break_hardlinks helper
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
X-List-Received-Date: Tue, 21 Aug 2018 10:01:49 -0000

This does the same thing, but is more efficient in case st_nlinks
is (already) 1.

Depends on bitbake commit 7ae93cf40ab91965147055100432961436bce46c .

Signed-off-by: Rasmus Villemoes <rv@rasmusvillemoes.dk>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 21c80aaa38..efd36b3758 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -159,7 +159,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
                     else:
                         # break hardlinks so that we do not strip the original.
                         inodes[inodecache[file]] = file
-                        bb.utils.copyfile(file, file)
+                        bb.utils.break_hardlinks(file)
                         elffiles[file] = elf_file
 
     #
-- 
2.16.4


