Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4992E78F5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:21:01 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t25-v6so9581697wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ty/l5H9CCdR0iznmgpFCcbV1lOMgOvhEtwvqyueAF4w=;
	b=fQjPqKuxl2AePGmmKagTybQBqZQ0Pi6hO5FkCiE35mdxHtIsZjARhG+Rby0Xhf9adr
	a3pCzpPQIAB8sDrOWEnPBipkcf3BM16NaVgkAgiQwLCDhLLrEiFf7xYtn4eeN+VhW+Qu
	aLVYmb2vsWAy/5zdK5XNh/GLvZ02PzHWWdQCn5TSjpzbhxZlfc3GZk50nZqOb6ZlkDFq
	N4VMBjuz4jomfWMJnWcGGF7PxYBathjsaHZeibXRD2k93ykfcDmGfPlulUYpgA1jTi39
	7mJOMpvwwREvN0fyrNxZ3HeenDW4YQ4UyNW891mtDzREFFjaP9cqYTfOVsKZjlfecPFH
	RqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ty/l5H9CCdR0iznmgpFCcbV1lOMgOvhEtwvqyueAF4w=;
	b=fz3fOdzTtJkk/u82kVTMfYzMF5BtFhq48NWk44g2fBAulY9PkFIpkvFpA3s1XRrN0t
	xnLieqSnzsvCKmRylFIYk0HdIagxoE93j3oW0ULSNoVWlBiFB3g6gC1zM8vUB0LG7klz
	dsHNuK8Eps+KDf4wO2Kp9POA3zCBTav47Z7KYLTRiRQVysTobqtJRG2H0sUoeIQd5bUM
	j98uY8ENBTFy0GrvNoAnRt34JjH9aUfxYEv9zbIuGTOsKy9cw8s+FkLCnyzIqrNfWSAc
	CxrVe+b/MTC726wCuVpbIv/gqJXNiC98vfCU0beURc6GK+yZBclIa69RLqHfQ49nH10D
	XdWg==
X-Gm-Message-State: AOUpUlFYUtiVNlT9iuPN9FyqRfLGGC30cxnYCN8Fpx5XSo4jKa3eZmgK
	v5/nge0HdMPuaNrVgRo/PpUCSLo04Wk=
X-Google-Smtp-Source: AA+uWPx4h/eOcr0KTDyxnf62zwe+NZ9rnMt2SRDSa5qmXWVpzWxQ/FPZ5oVpOHoDbH4a2pQpLoS1XA==
X-Received: by 2002:a1c:4143:: with SMTP id
	o64-v6mr9272754wma.123.1534180861698; 
	Mon, 13 Aug 2018 10:21:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm16598921wmd.32.2018.08.13.10.21.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 10:21:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 18:20:53 +0100
Message-Id: <20180813172054.17767-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180813172054.17767-1-ross.burton@intel.com>
References: <20180813172054.17767-1-ross.burton@intel.com>
Subject: [PATCH 2/3] checksum: sanity check path when recursively checksumming
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
X-List-Received-Date: Mon, 13 Aug 2018 17:21:01 -0000

In case something goes tragically wrong, catch a request to checksum / and
refuse.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/checksum.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bitbake/lib/bb/checksum.py b/bitbake/lib/bb/checksum.py
index 84289208f44..4e1598fe835 100644
--- a/bitbake/lib/bb/checksum.py
+++ b/bitbake/lib/bb/checksum.py
@@ -97,6 +97,8 @@ class FileChecksumCache(MultiProcessCache):
 
         def checksum_dir(pth):
             # Handle directories recursively
+            if pth == "/":
+                bb.fatal("Refusing to checksum /")
             dirchecksums = []
             for root, dirs, files in os.walk(pth):
                 for name in files:
-- 
2.11.0


