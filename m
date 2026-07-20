Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57114C44530
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2890.1784568213222188665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OIH3bD3T;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso5777516f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568211; x=1785173011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W7Y/gwdbyqY4Qm5qX21/aHZlgsYnTkjg0TiJBq0cf6U=;
        b=OIH3bD3T6QrZV6DpNDCvSyLTMLTegslt5EJ4QY7ew62MCQ/pQY5tKsUrANCsdY9JNl
         X3U6qbQiQVUKSaMGaRvHmHvIsa41FzaVPApivaOE97E66Y9B2YZTgMkMTNkFRcuwiOIA
         kQFSJH2ofTwDFixd0NGVaKSXbutB8cbfPrZZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568211; x=1785173011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W7Y/gwdbyqY4Qm5qX21/aHZlgsYnTkjg0TiJBq0cf6U=;
        b=ASD9poIl9TYPd42lVR/pAc8Nf0YrGrbG2D2Gt52t7ZtW2E3svg2/FPYfwOyCaFOPh6
         L8DoOa7GQxX6H1w3+Jge4/i5vcRnysJFlWLkavNw2YZHM0DcIkVkNruW2CXCn9cOOl5B
         bXoiAbCtLvG2zlIOEaE9hkowjAh7UJ9kWcMbV4T/KTxeEMO6rwfvQQV+KnMzyMosv5HS
         W5f/jZzPhHLb9+BgFV+JbZGYkn7glJe0p+CbMzI3/FnlrzrSqHqzDZ2TnT6zbCmFhYfT
         6JMITL6nbcZgr61aFtqN21UypqLnQvoTAvCOWLYG2FgZZaw6C+4h54uXdLXWGa9GAnQc
         bj6g==
X-Gm-Message-State: AOJu0YwdNbiezO+TElKfteXJRv95LUdTlJKg4+OyvU4AHNVJMdmZWIVl
	K3kwZtludv7VZYBn0HH+d5LaE+MW5Eco5QjtYoK6eBCBT2NJFPDwC9z38z9tcIkGpKKmBsjHqQl
	B9cVfgu8=
X-Gm-Gg: AfdE7cl2ypegiEQGqlLyHAZ+2OI6S0lqFDW98b7F7hELfM2cVznW4Ra2cF1fZdGdwBu
	/oSUccg+rD4SxI8etYx6EnHTELoZ6qGw03FQnvlq4z1RdMpe1Ty/LmdcUVVBOdKdj5DsgDO7zf1
	hcONg657fTO0PSM+ZxrsquIzAcHl8Kd97e6Ktl469mCLgi0znl7XQXVPhEpvQjL7AVWiAanwbxF
	hE/O9j+ePDeyxj2yqP4GmSeFVCoaPgua2nhFOtpGMrUK9Rj9u2oaP2XLLUXckEIjgxofGVZ7CRD
	c5kNoKQ1vrDUyaE4qTsHksbVYrUBh0ic24QwxFVNxe9obMAmPFxeV0LnOylxaPPtms8c5zihEno
	bJd0fq7nNljtX7cxH2MuTdH88/R98rmTnzk7qtDsYNc67tjvNH7xHg7/n5QgjYWJXmYOdRxz7Wf
	sEdMfnYydrbfFuFjUA3D+22Q4ALd7Sgc+bDQMTrYf2vbM4PVpi0BCAT3hGYK122QvkSnj70ILbq
	uoURZRm
X-Received: by 2002:a05:600c:2908:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-4954a3dcc67mr131714295e9.13.1784568211424;
        Mon, 20 Jul 2026 10:23:31 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/33] python3: skiptest tracemalloc_track_race
Date: Mon, 20 Jul 2026 19:22:40 +0200
Message-ID: <09adf3945b681bbc9eaa89cdad8fbb17191fd7d3.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241441

From: Kris Gavvala <kris.gavvala@windriver.com>

In python3 ptests, tracemalloc_track_race fails with a segfault.
To avoid ptest failures for now, skip the test.

Fixes [YOCTO #16182]
Upstream Issue: https://github.com/python/cpython/issues/143143

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7504490ba5e6ce0317dd12bdb961542062f05830)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.12.13.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index b31dd3d743c..d74bdc158b6 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -256,6 +256,11 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
+# Fails with segfault
+# Bugzilla YP 16182 (test_tracemalloc_track_race)
+SKIPPED_TESTS = " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
 
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \

