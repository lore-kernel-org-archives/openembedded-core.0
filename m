Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D22A77181
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 06:48:07 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ez1so23441729pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 23:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1MLNsreOTBdZTubFJ4aHd/0imZcOVt/xfsEyidRBuvg=;
	b=1FbWRb3vNY91lYo/QTvPpuLs4UtjJjyarDGYXncl8ISRzTOG39P876tmfkJXhHk6ls
	5HkEG57v2zb4imRJkTwaJ5FJ28t9jrGSHFO7xcLMCP9NLR8nsze/uuPByzpBBbiq4P//
	qRwS135GiNXzlfWTNV903T5nOlbv0xncVcHjic5m84qoke7aiIGdRVn6b38XhNwp6+s0
	TPStpF50XvP0qZUQAjWj0JQxu5KGi+yhioQSXFMs5CCJVhDGepJY99HxfO+vL+kE5AOJ
	dgum0CQdOYrBvWpNELtsvSwgT+WyWN0GF7j5vpGM63wPNaYoNZSHGYWRK5ynOXbhCuMw
	KB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1MLNsreOTBdZTubFJ4aHd/0imZcOVt/xfsEyidRBuvg=;
	b=CuHusNfxnocyigmwXRuSarrsIiXoh5wub5Z9cfB61ZI/tydtyW1Lrdtzy964RubmHd
	AjVZUjy4nbI9XQVzrpqAJOR9L/cHJO1PvUEBKwZHTtIXubXMZVUow4mYvF0EbwAh/yU8
	7GufpzHltXJofOztwqSDfrKM/b0pmRwTHRpZ99UPOOeann6yE3grqsZJSzzR5OG7M4dZ
	PEDsDcIt1vWkEdIUj7C90i+kc+RphQLL+QqnXgSKpnyDOmSf8zK5ciGr0cn6wgNAsZxx
	e5rSK/kxR2VIJeZBvjcVXSoqgDfsT80LPb09nCUeZID3mgD5dV4zMi6a+r0IWkd5qVKt
	38SQ==
X-Gm-Message-State: AEkoouu4y0flfrTsx8SOTnLTpt6ybl1rGWCrDo5jXyMeQOsoa/0ULS9NKpEBrGD/Lwrv/Q==
X-Received: by 10.66.74.103 with SMTP id s7mr158025540pav.1.1470638888644;
	Sun, 07 Aug 2016 23:48:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	q1sm44920020pfd.48.2016.08.07.23.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Aug 2016 23:48:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 23:47:58 -0700
Message-Id: <20160808064758.19267-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160808064758.19267-1-raj.khem@gmail.com>
References: <20160808064758.19267-1-raj.khem@gmail.com>
Subject: [PATCH] world-broken: Add libunwind for musl/arm
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
X-List-Received-Date: Mon, 08 Aug 2016 06:48:08 -0000

gcc and libunwind race and when libunwind wins
results are build fails for gcc as described
this is only seen on musl/arm since on musl
/usr/include is search before gcc fixed headers
and unwind.h is in fixed headers. So it works
ok on glibc but not on musl due to reversed search
order.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/world-broken.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index a5f6371..d4bdddf 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -47,3 +47,10 @@ EXCLUDE_FROM_WORLD_pn-perf_libc-musl = "1"
 
 # error: 'RTLD_NEXT' was not declared in this scope
 EXCLUDE_FROM_WORLD_pn-gcc-sanitizers_libc-musl = "1"
+
+# gcc fails to build when libuwind is staged before building gcc since
+# it then finds the unwind.h header from libunwind and not from libgcc
+# and on arm specially they are different since libgcc defines some functions
+# as macros which are functions in libunwind and it fails during linking
+# libbacktrace/backtrace.c:76: undefined reference to `_Unwind_GetIP'
+EXCLUDE_FROM_WORLD_pn-libunwind_libc-musl_arm = "1"
-- 
2.9.2


