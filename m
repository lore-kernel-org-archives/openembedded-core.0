Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AEDCD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33644.1781132118817727719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FO6j6llj;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso84513355e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132117; x=1781736917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBaCG0VcFeEeGKqhH8SQAqk0djZil2pLFTNLIxyLX+A=;
        b=FO6j6lljZJXrTz3R7yo9Ac4NdK2xq6EFDWUH70nqWgJheghGRGMCrQxYdduu0RsIxw
         549FQAV22GL4WqKoPmKUlK/sRUXwBDebW6GeBa4z9yxvIcYYGPjEMPnJ6JTuus7x3XCn
         6z+JDXbxVINDdZlqtvhoTnv6THla1iCO5v2ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132117; x=1781736917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mBaCG0VcFeEeGKqhH8SQAqk0djZil2pLFTNLIxyLX+A=;
        b=lU0sQoprvJGskzAsExtrO/dkc8PDe95+Eqrn+y78J8NR1zV0yTUsM1XwgdIHfLrVzX
         hGbunZzQLY8RPA2wuGaTsJAtlpW8I86MQyNvm5s0BncylBDh1HPBjoFnZ5LkokFZySNB
         u3dXVrVDJk2YPAJxWe6LwXAJeQ7KwTid/V5ULaMJKfAWs01bYxchkajaO9OfplsPM26/
         Uy9LBaPljq0AeLg0WIiG5L6MFKX/KRW3E4vnx9pSCXHKE5pyXeG8OZmFoIA9yE/bIN8H
         SotOaNKFf9PgBLpAKqBCiHeTZPCH1FVHWnbta5DvFvbxOLahaVg7Zo85kYi8EgVYMFAF
         qkqg==
X-Gm-Message-State: AOJu0YylnSnSs8WN4V0CLD5ekRZ2Zk5x3Ekd9zcDxcLSPQXv+TAeMwsI
	WCENj3j4idzDfUByeRki4eBGVJvL8/z4CzjBTueGPEK5F4UFi0Af+LQSdFmIZLNEjbx9tUzBfer
	ZxVyB
X-Gm-Gg: Acq92OGH83sNi5pHp8GMCHZhV0bwut4jvCsiPdDxflc21reuMfcef+Wxlq21S219UGM
	FD1/FVbyadvc/1VYV8fyLG0Ctz8lBR2HgaQsvldMLoRuBWjVManJzFuqvokf2yj8Z2JeFzQP5kA
	2jFCPvYlKMdyZgPb5nzybdshGERUBd08HGGwso5dcPNJ/GZ4Wq8Qf+wx865/yw38Ak+PDQbvMdR
	SYWdix3R7lzuYztG7fpFoGSJkc1HOocba6psWUHxJPKqaOlViHljYiOcIVlQnD/NhssXoB99ryo
	bCGfDfWGWIQwVWnhE7B0JbLv/cmtOXD60eFhxX3vRfwMvhGrLrD644adGFfF6afLbIcweKf4yKh
	k7yN2qJ4v3J4zuI+/G/f9U39xiryDHRR1bxAD+6KvUJ3Pw9LFxDd4pE+AEKrd6N1eQ8+VWW7/PS
	JnUG9Lou5jH4lMpqip+ey6umRtzSB5MZNjPf8DaZvjFJn/hMifk/h+xjUMoG7BGQoPwTaHfWcF1
	wX40TNssx6JnNPPluN/pUPseTqBC9E90gOjYCE=
X-Received: by 2002:a05:600c:6206:b0:490:e18f:d0db with SMTP id 5b1f17b1804b1-490e18fd29cmr34213485e9.26.1781132117159;
        Wed, 10 Jun 2026 15:55:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/21] perf: make libraries for install_headers configurable
Date: Thu, 11 Jun 2026 00:54:54 +0200
Message-ID: <e1da5b3f7b2f33d6f60d9c4ce2109562ee9c706f.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238399

From: Peter Marko <peter.marko@siemens.com>

Older kernels don't support install_headers for all libraries.
For instance kernel 6.1 fails for two (api and symbol) with:
make: *** No rule to make target 'install_headers'.  Stop.

Also sort the list when moving to variable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 089e2571b1a220607b00a16c87c1a2dcdcde9792)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/perf/perf.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f24b44954e7..c3ef25fd999 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -169,6 +169,9 @@ PERF_EXTRA_LDFLAGS:mipsarchn32el = "-m elf32ltsmipn32"
 PERF_EXTRA_LDFLAGS:mipsarchn64eb = "-m elf64btsmip"
 PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
 
+# override for older kernels which don't support installing headers for all libraries
+REPRODUCIBLE_HEADERS_TARGETS ?= "api bpf perf subcmd symbol"
+
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
@@ -179,7 +182,7 @@ do_compile() {
 	# There are two copies of internal headers such as:
 	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
 	# For reproducibile binaries, we need to find one copy, hence force libXXX to be created first
-	for i in api bpf subcmd symbol perf
+	for i in ${REPRODUCIBLE_HEADERS_TARGETS}
 	do
 		oe_runmake -C ${S}/tools/lib/$i DESTDIR=${B}/lib$i prefix= install_headers V=1
 	done

