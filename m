Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C818CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 09:46:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.34182.1712223969700951421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 02:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T7fPtcY9;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4162b8cb406so1344675e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712223968; x=1712828768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qnout9ajLXZgbnR9HVpGZKmuOTcIFsHDWeHU2/CTWI=;
        b=T7fPtcY9dFMEe9RQPPiby3SW5fTBdg/ZfntPCCioNiD/an2QM3vwSivNQJN3vowmKS
         0RfdO9FA6hJTlYxFCm0xb4x4kKJnFAZHXeG+YtUHNj/JrLcpAJrtQyhv1mePhEUfz0Yi
         /wRf4M/bIFCppskT/9VlpJPbxHdH8n8X1w42nvKZ9QfaHORYBeS6pJ3WqZ8mcy316NBe
         9Lfy1aGW7MCOiPhMkiFE5wpFWqotVG2QO/AXP6zCEtV0+A8p6u3S3VqpnLQl6NNr8YeK
         RGRh8mSJ+OUanqNP5JI3WJg26sY/j1kWyfBk1SCNbW9zJisUnu3HxOiuf4VU0aXjLFLP
         10Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223968; x=1712828768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Qnout9ajLXZgbnR9HVpGZKmuOTcIFsHDWeHU2/CTWI=;
        b=L7M5xzrKfgtFfOFUKItM0xOw9ATUMosUULRnOM2q4shTjsOHmACgIzeWSVSJ8RQIb5
         nJln4i9oZDDrQpH+fmN4Y0po7VVDcDfCcdTJfkKuV62XoBhbz9MmTnPaexRYEBL8MJvm
         OeCZcYE8vhu5/hoczQ3lks4imbETxpRhdcUbQiDnrH8oamWVCGsAowR7K1SAyJ7nYb73
         VRCGSvM3wuhfvrHqNOBtQNIxuETjFMsfD4+fw/d8WNOlXrgEfKnlfQuIr9PkBZCfnYec
         x3nt//B2LTcqVI82MxIvXjRj1tYX8pKUP8eQBGwsAjGWhHabLph34jxZ8jkUmvJaqsIa
         cLZw==
X-Gm-Message-State: AOJu0YwMqEcG9hYJjTkjL6zJSjuKpVoe8BwVshB6DrtlkzIAycCFLlH9
	I4FgscqzMlFHOpWa60qzS4uIMbwhMPgVXFQ514l0yi0P2/43MPgPgRKCpJ4+
X-Google-Smtp-Source: AGHT+IHNPlRHJuwbNwNNdfd8FflSLAT48363dk+4ESZpXM/i0rBE9SfTwPPnjg2msfQL4R+CAoW9Aw==
X-Received: by 2002:a05:600c:287:b0:415:544b:3128 with SMTP id 7-20020a05600c028700b00415544b3128mr1959567wmk.27.1712223967399;
        Thu, 04 Apr 2024 02:46:07 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b0041493aae77esm2080647wmq.23.2024.04.04.02.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 02:46:07 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] sstatesig: fix netrc.NetrcParseError exception
Date: Thu,  4 Apr 2024 10:45:57 +0100
Message-ID: <20240404094557.1142578-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197952

Looks like sometimes the e.filename and the e.lineno is not properly set by the netrc
and this can cause TypeError.

| File "/poky/meta/lib/oe/sstatesig.py", line 342, in init_rundepcheck
|     bb.warn("Error parsing %s:%d: %s" % (e.filename, e.lineno, e.msg))
|             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| TypeError: %d format: a real number is required, not NoneType

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b9aa39cdcc..a46e5502ab 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -339,7 +339,7 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
             except FileNotFoundError:
                 pass
             except netrc.NetrcParseError as e:
-                bb.warn("Error parsing %s:%d: %s" % (e.filename, e.lineno, e.msg))
+                bb.warn("Error parsing %s:%s: %s" % (e.filename, str(e.lineno), e.msg))
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
-- 
2.44.0


