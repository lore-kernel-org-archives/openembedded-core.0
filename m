Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25ADC71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 10:42:24 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.10616.1692960136144675694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 03:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ODTZiseR;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so3796311a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692960134; x=1693564934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP/K7KtDsHDxbfwl4a9xVKDWWF8byJMNX1LAjt4zC24=;
        b=ODTZiseRhEUC8v0vt4O1D/6gApMsH+9NjzXw2+TSDcUM9GPd4eWoxacp0AVjW1v/m/
         86ZzQ8S8S/7Ixz4Xcs9Kt/tj6d/fANgf/WxjQi/OfbQsGrxpf7iWoYFsgkyEbQLKiE0u
         /ESp4syUVV/gelf4dWUEAuFzXWxXRscUVz5uVN8+NNcqreUhHoKXzJWjm9QaZGX7ujuw
         OtfYa/CQXvOXg4q2F+ZNrvkz33bhqmfuLici8CwyPUB8Gl6TCvMG8QFIgyddpzXVC4Xe
         y4sgOy0mo/EeaoYvnT35QS3HtQK54oE2ToDvvwIxSwpTCI+wb4SP7X/Tqrqgqb+Ck1ac
         /AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692960134; x=1693564934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP/K7KtDsHDxbfwl4a9xVKDWWF8byJMNX1LAjt4zC24=;
        b=bPJsHofasjp1VIsVFcl3aG4Ijl7P4Yq0V7wt8S/E3pfEvv0IDbI6s3W11420COv9BM
         oTcEdltK1dWhzLayTzJQGNGeSyzH/Vy4GmdlnLlfNj4/H7B/0VeJu1KLRgthv6L88gyL
         7+53+KEz5dxWpsh4NvDVthDAH0gndyDPglC/lHQvUvM0mpRdMjX5ifAa1Paxs0vZOkB6
         7NRUEZJjNnRx26SouwWkiEqDvZVyN8J1O70WwfUppDAvPvNeDHJfFkvaXVCzdghYwbSb
         abClCe/w064hGYsB4ouYeUC2UZk2/b4LzAwogv2nUH8yAtdAce20hMGCelPyUM0PxsNt
         n3Yg==
X-Gm-Message-State: AOJu0Yz+1Gugj8sa+YYP1OVc1Xi8Tj/a4GuLYe3AZuFZ6vY5itu2D9mB
	SSI4ZFntQ1llKZuVb6/ftx/tnsRkz74=
X-Google-Smtp-Source: AGHT+IHCgufgThTCNwBmI6dO+r1C1dy4VI70512Ll+KczavRJ1snSHL91vvljClyDw2h7avnVJ2UlA==
X-Received: by 2002:a17:907:7da3:b0:982:a022:a540 with SMTP id oz35-20020a1709077da300b00982a022a540mr19623003ejc.11.1692960134369;
        Fri, 25 Aug 2023 03:42:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b0099bd6026f45sm825219ejb.198.2023.08.25.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 03:42:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-sphinx: correct version check
Date: Fri, 25 Aug 2023 12:41:58 +0200
Message-Id: <20230825104158.3273715-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230825104158.3273715-1-alex@linutronix.de>
References: <20230825104158.3273715-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 10:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186704

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-sphinx_7.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb b/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
index fa616cd5044..92d60126922 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 SRC_URI[sha256sum] = "59b8e391f0768a96cd233e8300fe7f0a8dc2f64f83dc2a54336a9a84f428ff4e"
 
 inherit python_flit_core pypi
+UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
 
 do_install:append () {
 	# The cache format of "{None, 'en', 'ja'}" doesn't seem to be consistent (dict ordering?)
-- 
2.30.2


