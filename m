Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 91E6575FF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 17:15:32 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so19195673pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j3jWwpj+44XavzpRWzjQxjNFymjCfnBtx+/VMVdrdS8=;
	b=xp3swC56vQ8S9s+Y/S8Z8VRo2iZNYGe61/Rt591R7PpPwtUAkb+8fus0P0x44aoe2s
	ovroYT/kgYx1x5FrkIXcWNMM8Bb9Hr4Hs5PvWZduSe5tOOZgPRybYVHIVZ0Pf2vuMaAf
	W7dF7HBNI1XHBsLap+mBGrxzorKKqLIxcf7ZsJwCUlewxyjdJuVQThhhhI6Ss4L44FHD
	l8sQy1U8czpwlHh1+lsXGRpHE69l27yn3k1/hPCdLYYQzg2mY0tBqEvwcCYopjszWw83
	qNo1j2TZhyaP5hQcCGhRCb2APQKij0bxy+JGusP0VHV4Yt/8YyL8+Ju3VzRh2dHC1c2l
	pmaQ==
X-Received: by 10.70.30.193 with SMTP id u1mr31138102pdh.59.1437153333440;
	Fri, 17 Jul 2015 10:15:33 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	nl10sm11832492pdb.38.2015.07.17.10.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 10:15:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:16:03 -0700
Message-Id: <910a69c2d626117ec01e2d9dacad04c447999489.1437153291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1437153291.git.chris_larson@mentor.com>
References: <cover.1437153291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] recipetool: appendsrcfile: fix duplicate SRC_URI check
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
X-List-Received-Date: Fri, 17 Jul 2015 17:15:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/append.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index a2133f7..0997f82 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -349,7 +349,7 @@ def appendsrc(args, files, rd):
     for uri in src_uri:
         simple_uri = bb.fetch.URI(uri)
         simple_uri.params = {}
-        simplified[simple_uri] = uri
+        simplified[str(simple_uri)] = uri
 
     copyfiles = {}
     extralines = []
@@ -365,9 +365,10 @@ def appendsrc(args, files, rd):
 
         simple = bb.fetch.URI(source_uri)
         simple.params = {}
-        if simple in simplified:
-            existing = simplified[simple]
-            if uri != existing:
+        simple_str = str(simple)
+        if simple_str in simplified:
+            existing = simplified[simple_str]
+            if source_uri != existing:
                 logger.warn('{0!r} is already in SRC_URI, with different parameters: {1!r}, not adding'.format(source_uri, existing))
             else:
                 logger.warn('{0!r} is already in SRC_URI, not adding'.format(source_uri))
-- 
2.2.1


