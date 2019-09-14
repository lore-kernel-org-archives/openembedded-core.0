Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8356BC19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 08:04:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b128so615110pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mtyAEZJKKVZYYarLES+DOKIkD6jBNGIiNAv7xrp9CsU=;
	b=Y9PcZv417sgVVYC+Wal+EXmKXwpGjnGQSPaoKz/5diFCDVmRPzxQ4h7PcjcXJ7hCqx
	XYWHCy2S1LpVK4aeKWhsyeAguaEfu0bMS3I9Ip+ZJZMQUguEdoDVwDZo/Y0skWyf6M7Q
	0NptL8N6TcdaA1i8QhKVeV6/SApdYzejjcUbwJsqc1+elffkDjqAXpB4PJFkgpG5AZfs
	3pM+jQIO3hgfvXrQGPplhk4W9JfURzeeGFTXhUQNmtN6YyAhCn4JbIEdct9oTnrPViRT
	L1XZik2/UOodcOg+9141XRFkPGTlcnwlJeWPey2a8CaJ268ysXqh4Zsz1vm+c9h1490g
	6OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mtyAEZJKKVZYYarLES+DOKIkD6jBNGIiNAv7xrp9CsU=;
	b=qTPLLwSof5e8RsKtbL7nej+6pIiAcGV++/S2Hv97gctRqG2zoehqt0q0U9/EJMto95
	NdCySSVWbyTaTLE6FdsOFYTG+BiXdEw4rWCWSPfbB0WUDBHkEuzmhZ37ZvZNm75pHe/3
	FvbvahU25CI/tS7fGdfca3UJzFO/Kr9X85y9o0JTqlZfNw0Eq5dAIglrpQd28kI8HwgT
	EwQRr5IlwiZDUP+UJhWSaACxAyjj8P0bnlv6opOzmYulFvE2+WrA+HHPpEFJOKhOrEcO
	sXek9hH1484Xa79Me9JS2u90PS9+MARRztKz8etghcY1yt6RHA9LZg5h0Op+MK3ot3Yl
	GKQw==
X-Gm-Message-State: APjAAAXXsAx4bhVf4+zCVs7DtFarWCoviuVD2vhtdbSYvrNJq1nBHWq2
	6JgEijp/f+c0qi7oQpiLHqQKVNSRu48=
X-Google-Smtp-Source: APXvYqxoNYaBQq8eXqx2JJuH2puyIiIqG5bLsJqFM08KbP117+95R8a3usJSnS+acOf7T+Q/fj8S8Q==
X-Received: by 2002:aa7:9a84:: with SMTP id w4mr62811481pfi.244.1568448297604; 
	Sat, 14 Sep 2019 01:04:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f74sm48045350pfa.34.2019.09.14.01.04.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 01:04:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Sep 2019 01:04:48 -0700
Message-Id: <20190914080448.973404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] nativesdk.bbclass: Clear out LIBCEXTENSION and ABIEXTENSION
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
X-List-Received-Date: Sat, 14 Sep 2019 08:04:57 -0000
Content-Transfer-Encoding: 8bit

These variables dont make sense for nativesdk targets which essentially
are target only properties, this helps in avoiding recompile of
nativesdk-libgcc-initial when switch libcs. nativesdk targets are glibc
only for OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/nativesdk.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index f25b0c31b1..03135acedc 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -100,6 +100,8 @@ python () {
     clsextend.map_packagevars()
     clsextend.map_variable("PROVIDES")
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
+    d.setVar("LIBCEXTENSION", "")
+    d.setVar("ABIEXTENSION", "")
 }
 
 addhandler nativesdk_virtclass_handler
-- 
2.23.0


