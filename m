Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945B9C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:08:01 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.48590.1718892480053739721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=I4M+zstD;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79baa4e8531so93484085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718892479; x=1719497279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exW5yZ7nCTRpcyjpe8RwVGGRImAMHilGdnrM1ZXUy1g=;
        b=I4M+zstDapE0m/cgCQqxj087cfG+WTrYRfpym8M12eXZp5n+2x5ivKGTiAhEs2N5Od
         hiLVdtfUpMTAtnPKSqxRx1Y4DB/Sn0doXecqWlQpjhcIMPmRlIzIlI1LcIrmE5El1uiZ
         iFGV4VUSh57nGU2WL5HLwA+3vWey+DEwWlDTrA+OpFZRegJw+GOjri77YgCF9dBd6j/A
         JeN0i61MULjoM356stJh8mvc8Lszf6YlfaO8SdalDF+Lwkd6Hk7wSMhrxAhUG1CWU46y
         QaFnoej2+Pq7+vLKehisruzmQGq3kjbx6H8tCz4a86BBCFV8BtVkcrzCNCtBtgPcWmq5
         yMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892479; x=1719497279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exW5yZ7nCTRpcyjpe8RwVGGRImAMHilGdnrM1ZXUy1g=;
        b=bbXUTpjpfFCPic033cp86bz3q0k5bR4gZV1zBdmlt1k8G7oLOxMve2TZyHdkWkIo5U
         LppAdrvtx3HZT4A8ZKRDD2ob2xHEXsSVS3bS0dRlYifIvfqCJYEGsmXY6L49WlGepZSn
         FBQs2z4ks4+04XObd2fuHYaJy36b+XdY44ztkwkZ5hdOSWW4jc8KNEQ9wtSehVCYm3PQ
         2q9b2mNU8nsyHsakSfpOmUbjnvbZ5hy02sAMjIlKH6gSSScPtyGfpC5Ok2sLn9IZJWFa
         ibF3cpps53+/jZZoWDqk+SoP9DEj5TAFekejSAANCgqwzs1nS2CCOLriFNHwqqomvUmu
         AtdQ==
X-Gm-Message-State: AOJu0YxJDFJHL2+g5dmec05UKlDvsxOopS8cgKSdQn2RUHtTauMlW52m
	Q2+STMhMJoNE4+fEJsPGLISAq9RxTXqnQilfq/E0giQoHRACoZqwOMMkqPVhS9yEa+j7/YDRn3o
	8
X-Google-Smtp-Source: AGHT+IHBr3FBxZhFVCJB473exOzBDb8arxp0p/k1LnV5bSw6Eao9Idd/MEleA5r460qP4OMcvhvn9A==
X-Received: by 2002:a05:620a:44c4:b0:79b:b8ef:15f1 with SMTP id af79cd13be357-79bb8ef1a32mr413619585a.56.1718892478943;
        Thu, 20 Jun 2024 07:07:58 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6efc7sm691579185a.131.2024.06.20.07.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:07:58 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 1/6] python3-hypothesis: upgrade 6.103.0 -> 6.103.2
Date: Thu, 20 Jun 2024 10:07:48 -0400
Message-ID: <20240620140753.392220-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200956

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html):

6.103.2 - 2024-06-14
- This patch improves our deduplication tracking across all strategies (pull request #4007). Hypothesis is now less likely to generate the same input twice.

6.103.1 - 2024-06-05
- Account for time spent in garbage collection during tests, to avoid flaky DeadlineExceeded errors as seen in issue #3975.
- Also fixes overcounting of stateful run times, a minor observability bug dating to version 6.98.9 (pull request #3890).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.103.0.bb => python3-hypothesis_6.103.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.103.0.bb => python3-hypothesis_6.103.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.103.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.103.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb
index 18ef7992a1..b935bb02cf 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.103.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "7fe91917b99fc98ac150ec295775a687448c7c42c2276ab6e4a6969a4b285bb5"
+SRC_URI[sha256sum] = "83504e31e90a0d7d6e8eb93e51525dc1a48d79c932a50ad6035e29f8295328cd"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.45.2


