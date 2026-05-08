Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB18CD37B1
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8172.1778224355079138781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qCJXYK/f;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so886927f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224353; x=1778829153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pry2/wpAennuQw1syu/NS/SrWGwuuaO/BSF/jato810=;
        b=qCJXYK/fWAVMBcPomyFPWRoEBpyUC1R7oaBTkRHEsvBGq/lMHNt26UZiHNPNKwpSuu
         atBZgyqlD865rTii2INq8x91lWJAYoLshrcrg81PEY/IvidamgocZgA1WF4hnDWwfBRw
         KBKetsmq/1QapDr/2ieowDtwtU1141MobknXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224353; x=1778829153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pry2/wpAennuQw1syu/NS/SrWGwuuaO/BSF/jato810=;
        b=eoONEE/7BaMzuzI9kxOKLxRbiFlHR+PtXZWygTV1nI5RM5WE/oUn0vqQP0tQzqXShn
         xaUs6H3e95f5QqGwppMkYJCDK5ZUcgAKZguw1Ef8W4KajAWzfAXpFnIABfSJhh3fPT0s
         wf2GxmFRdfSyUcW46JPyLblly+feYBnvQpWp90YCW/TqqerkUan0n0tEShgYy28WXGKG
         c3E1O1CsTuhkuyy/Yu0p2PPqzHsFK9qLLiIta5lhsBkqS+orR3gCQHXB8ue0+mHn3cXb
         IjPHRXNKnH/4COU6RMBMgqV5RdqLQA8VRY9Hv/SPgMfE2xP2sofQZmGPyeFghxgC+QsJ
         MxYg==
X-Gm-Message-State: AOJu0Yz3BSrubSuG0KWNgEXc1ubx5/STgLa6o1+kHvs/miHkti36JoSy
	ZD1kA00Krv9qjMVhInrm60PIH3aCOTQtMHYMWaffR/o9+bFiH/rFXA+82DhDFzNv42zwPnrl5c3
	xCWK3EQ8=
X-Gm-Gg: Acq92OGat+orUUYLAP1GI7No/tXSrlUuO4EGuffPrYhMK0AV5JqCyEYJb30SEtbZeLV
	K8Rwbx28YMlehH+Ot7pNlXUOjvN1xR55+BFMMYbyyOyATEigi7AQ/z8oDI6tvkLuLgNmlWkZDV9
	zTQyg3N11SQhyfnpR+qNyobTSTZRWCG0GJsSKy8czgmxLxTD56cbL9DsqfhS61rjy+aA99vKfMN
	Z/c49N8LElxODJ0M2yv7QveGUReeU0lnqNczc0r2TsPpOLpS7+1GPTczGMs12YzzazxzPIf5Svk
	MRtO0y3pou5GvNN4MUN+bXiTYmjMBBoJ8UGYf4X56msshPqEGw+NaJ2faHu55ha6ZH8xX8F/pC4
	TwPdnfjND2r0Zf5KS9GdlXcfC7Zji4PZzZ6e5fXtGhJ2u4kX0QFMTveYw2+LBaYqUNwWtYM8sRH
	JhBBpetJW4PcjgcT2s2VPbrWkOyXw8I9eLWQHJQJTL7Zsoi64e1iXE9BDgZRKYN+xKGw0GbIYUP
	khgPAzVjojWdsPj8A7GiDQ405Q=
X-Received: by 2002:a05:6000:d91:b0:43d:7883:87ce with SMTP id ffacd0b85a97d-4515d5c6c86mr12871170f8f.34.1778224352984;
        Fri, 08 May 2026 00:12:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/52] perf: add PACKAGECONFIG for llvm
Date: Fri,  8 May 2026 09:11:24 +0200
Message-ID: <7dd6965decc19a969cb0fc2f54c947d7f02fd4ae.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236673

From: Li Wang <li.wang@windriver.com>

for avoiding to enable llvm option under uncommon condition,
make llvm controll under PACKAGECONFIG.

error log:
ERROR: perf-1.0-r2 do_package_qa: QA Issue: /usr/bin/trace contained in package perf requires libLLVM.so.2x.x(LLVM_2x.x)(64bit), but no providers found in RDEPENDS:perf? [file-rdeps]

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a7c0c0f18a61d15c101c7c345de44c94043ae39a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 7a580884624..f24b44954e7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -39,6 +39,7 @@ PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 PACKAGECONFIG[pfm4] = ",NO_LIBPFM4=1,libpfm4"
 PACKAGECONFIG[babeltrace] = ",NO_LIBBABELTRACE=1,babeltrace"
 PACKAGECONFIG[zstd] = ",NO_LIBZSTD=1,zstd"
+PACKAGECONFIG[llvm] = ",NO_LIBLLVM=1,llvm"
 
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc = "libunwind"

