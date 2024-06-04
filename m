Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B1C41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 13:24:41 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.21283.1717507470972314572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 06:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=yyRLx7WN;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-44028fc3d22so284141cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717507469; x=1718112269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9a/asW7OVAF2X3X8tzLp8gI+nbvujZsLvXrzW0RQqU=;
        b=yyRLx7WNyk+YoBdLN3C00zc9CXwD4sHPXxrse3GKCe/IWe5VVHQcWBiB5QGw0AhjUw
         Kd2f8mYVNo/HP9eS3uxHTRt5qj5+kZPzZmEpOl0ee1qBUAuEQ1KEtIReUK3ctGK6UvL9
         v+5JMCjH8VMbrTDLGG/xh1+pbTIvnPHncbQhpUr1Xvdu9djFwJ0Vvo5EioBvC5eVhTQA
         s5pzhqrhjZL2hM2Nru3/EY/bgFxwurZDJcJhisqyE0yzae/Rxly7AFWBGcoRaEQMssto
         1cmOrTixTTdj+ehrTcFudwA0aBREUauxzLuRHt/rSA/S4dNw/8rSMkobWLP+xbw2e/ek
         APBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717507469; x=1718112269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9a/asW7OVAF2X3X8tzLp8gI+nbvujZsLvXrzW0RQqU=;
        b=F3pxgRhRam7cB/gqRuvuJVFvRPg2fbn7HURFJusFoI4L8rllluNOOPQzLpf+rpvoQ5
         6fBxkWjIwM3lFsjRpew9nGMgE+QwLXv0Vu7mYHbldqUKk24x/5dmpieX45P0HaGp1J0u
         m7qEkEF9U1I1hJPfgmb1ldARYd83NyKvsKy6Q5Gx3WdOr3s0DiwIqMgOW65PPResX8rj
         FRm593tSH1sdCwYOEV9l7is5Gr38L2TJE1QZRTA8mpVctfLrl7BAqLu8B+6YBYs7hB6K
         KhN1TOL3tEb+/VUatH4gIVSCtLA2/FKli9ngkJwEGFTXLfyuCCYvesltwkrbHiXVoeD8
         VmQQ==
X-Gm-Message-State: AOJu0Yxkz1ioP06cEGlblubvUTsGQAd3a5b9oiEZb53AlPSyuUS0PSdG
	a6BppDZUL9d/8Kv94FZknRzKZjWXCrFD72T/wBpbdZJ69BWsyGeRgXYOx7Qzc3FBYccr2KO3Uzv
	q
X-Google-Smtp-Source: AGHT+IFCdMngPnhPZsLbM2x/HudjVCgimCAKjnaw7n16XhkzrlObYQ4fSX8NNaBfMNgjypqZu5Yt5g==
X-Received: by 2002:a05:622a:13ca:b0:43f:ed14:eb10 with SMTP id d75a77b69052e-43ff526dd6amr140927861cf.23.1717507469394;
        Tue, 04 Jun 2024 06:24:29 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff2467e10sm49266761cf.68.2024.06.04.06.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:24:29 -0700 (PDT)
From: tgamblin@baylibre.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-hypothesis: upgrade 6.102.4 -> 6.103.0
Date: Tue,  4 Jun 2024 09:24:26 -0400
Message-ID: <20240604132427.2700918-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 13:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200335

From: Trevor Gamblin <tgamblin@baylibre.com>

There are three releases since 6.102.4.

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html):

6.103.0 - 2024-05-29

- This release migrates the shrinker to our new internal representation,
  called the IR layer (pull request #3962). This improves the shrinker’s
  performance in the majority of cases. For example, on the Hypothesis
  test suite, shrinking is a median of 1.38x faster.
- It is possible this release regresses performance while shrinking
  certain strategies. If you encounter strategies which reliably shrink
  more slowly than they used to (or shrink slowly at all), please open
  an issue!
- You can read more about the IR layer at issue #3921.

6.102.6 - 2024-05-23

- This patch fixes one of our shrinking passes getting into a rare O(n)
  case instead of O(log(n)).

6.102.5 - 2024-05-22

- This patch fixes some introspection errors new in Python 3.11.9 and
  3.13.0b1, for the Ghostwriter and from_type().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.102.4.bb => python3-hypothesis_6.103.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.102.4.bb => python3-hypothesis_6.103.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.103.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.103.0.bb
index ec43514d41..18ef7992a1 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.103.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "59b4d144346d5cffb482cc1bafbd21b13ff31608e8c4b3e4630339aee3e87763"
+SRC_URI[sha256sum] = "7fe91917b99fc98ac150ec295775a687448c7c42c2276ab6e4a6969a4b285bb5"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.45.1


