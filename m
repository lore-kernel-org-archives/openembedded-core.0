Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30CBCCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:39:41 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36373.1792420780017272927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4640680eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420779; x=1793025579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QixYrsBApXnXr0nnzdwFL94BOHZO34Po1CcREZ9O3mw=;
        b=QzHGuuMSAPThX011XOEjr3uBnmAbTwBuOLBQbtbVHwbVNz+6KHqO5FWlAx+sqwSOT/
         8GNi1g0zS71IrGiVCGyc0r7mDyeSTanSk4Ick6l2CszyOPEjH1aSpcJQnkAaIIYDTKyR
         +EIuxHKrazfbAYiaDIc44yLI5IAYoNN7OPrGMhzQFugCdHwQphjAPRqsb66Ym+oEvCu5
         zKZmmPjfWpsFd2wsqTVJkSWiCK1B1ZetGNs4i7NOTuggl9IM+hXD/dVoIpGKwcHDuXVc
         oGaysNDG/InKMpMETuQyVr0nolU6gdDjfb58Kf33zCdokY3tN8kT97eZxsqHFFU0JEZZ
         3kkQ==
X-Gm-Message-State: AFq9FYLypiye52hdzsqCZfrY/2o2DLDHwauyOjnVse71/6xK0IoZqSWo
	Cf9NhusVBDPYvbKlr/4TLgC/TqerY5HUQYw74NpW0Em4OFpqZk/o5p+EsVMBtPXL
X-Gm-Gg: AYBFou2RbZXGSnGoUkxlnMlBEFLoThcTzHDoBRpu8lr/bC9ROC6+u+uxKrUaOOuBbjG
	NCF56OnC5ZpcAsn5uNzyVBBpbtItvOJa2qGGPBIGH2mBRDwirNLyjFm7upUlj3rH9fzs0lcR+gT
	nNrwZB7cC2iojSUjleqEOVGSLVaKezxAd2dvtK6FQ9cUgB7HLmmYFlkul7WLBAztV+FuhIluqIN
	+yfV6jL3sAZvt83e47Ubznzh0EA8FENOjsrRckZJ7UGMwIkGjywWSW7A1jiyH6567b59UkivTsf
	l1PTpRaZi/VI7AyLXrJ/NInytc3X/wfBsFt2514WVSZmI1v21lppbwbLaUZ7si6tpoOMhlfJulu
	iQbBJWWQysa6VDuYNIbzbE/n1UfWCz/0CG4XqWvTumlD3NvVDJjWTxG/tMhNSphZXFb4k7bes//
	LT5jQhIHC3BTW2LvIIZkDHHOj7Q+gy4gcmA5FmMysl8EcRQ9Lz+08gPW5vong6zoA+d0eah/dxn
	8t7gP5cmVtl3gUZbCAVmv/tkCnRm22izSENetJ5L4ZJ1yCWbsxsH513oEHLYvFerqgJlWuPBiQY
	keK6bEdWJwnj27/H0g0dEKgWRhfkm6p8jhADYfKqKFSmwV1XakX6ksP3///I4umUBJsD/wY/iTo
	d
X-Received: by 2002:a05:693c:8345:b0:351:bb8f:540c with SMTP id 5a478bee46e88-361a2e36fbamr9940493eec.35.1792420779146;
        Mon, 19 Oct 2026 07:39:39 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm33957324eec.5.2026.10.19.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:38 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH v2 2/3] yocto-check-layer: Skip initial signatures unless test_signatures runs
Date: Mon, 19 Oct 2026 11:39:23 -0300
Message-ID: <20261019143924.1521981-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019143924.1521981-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
 <20261019143924.1521981-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248177

Only test_signatures compares against the world signatures dumped before
the layer is added, so a run without it, such as "--run-tests bsp", spent
a world parse on a dump it never used. Dump them only when --run-tests
selects common tests, as it does by default.

Tested on meta-freescale with "--run-tests bsp": no initial dump, same
results.

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/yocto-check-layer | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index e747451366..2fcb90acdc 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -214,7 +214,9 @@ def main():
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
         try:
-            td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+            # Only test_signatures, a common test, compares against them
+            if not args.run_tests or 'common' in [t.split('.')[0] for t in args.run_tests]:
+                td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
         except RuntimeError as e:
             logger.info(str(e))
             results[layer['name']] = None
-- 
2.54.0


