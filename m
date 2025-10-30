Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B320ECCF9FA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:17:27 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.20331.1761799661736982295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4oUFnqD;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ecee8ce926so5481931cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 21:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761799660; x=1762404460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ezJkhdRbn5j28EFTbbEfJ+BfmGFhQEYnElZOxPxGcA=;
        b=h4oUFnqD7VHutYOXhnTwI/3QTPGeyzZJg1xgvRvEUQ9DrKWfRP/UBXSZisGholePbW
         kvCYscHQrhbeCl2zaN/pCJWL1YLGbzcKKM2hIQadqbAPHwYma1brLNF/I3U8SVruul+p
         Ge9A26+0n18vCwftPJR7/9+BgnRBLiyQIFFrkX3JTP/bCDriXEgb5MzO3WwDVOj+qRdi
         rzRrWZfXtky24/vQy70TzeziLkvKPjT6e8/0h9K+lFVt4U9g8TUI4tqQAA3w9oQhnvfn
         sdTqoEquoyRF52PEPdTfQJ+bYelqw4let8IZr5UzLQEhtFWiapP6vO3bEqU+lLPGJWLR
         zvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761799661; x=1762404461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ezJkhdRbn5j28EFTbbEfJ+BfmGFhQEYnElZOxPxGcA=;
        b=obq/uNbdojbOX7qGTpFj2fpcqZyydNCh4lXUtrg3C5iAaV3n3mdol7V0QBz4tPUxtm
         Vvpu5SeRRxTupWLA9oaP0peHfuNpq2yPHmA3M2ie0QQjaF+sitERz7jeuuHqSM8cpi+J
         EVI7BPKs5OkmpRN4Sl+adobOlZEZvzO0ixBHnJJC0gWlLT8Y5Myz4oLXNYVS/cnhHcXj
         ZX7z38v0cIpE2t1t8nk3hyIBkFODkLw+uWQJ70b+w7lOFj8gAuABHxeL0SSNNKcSxk2z
         ZjpoRegY5cpNoGYQZAcfD5vwwCdCtvpaBWP3v0Q8eFlGaNLGtXfAkKz4/FdGvReD4pwn
         a1xg==
X-Gm-Message-State: AOJu0Yx+0CP1t9l2zD5b2vkJxbZs1dmRe+F06UJH5MWYPRFFVspiGhj3
	1RDEG0q3LCAOryTdvsrVE3AzIbwDbwl4otW4FDuSLIzI2z6/zFct32nSUSlJWg==
X-Gm-Gg: ASbGncs2o8MmpaPTy3Pv2a+gSh2cwPFOnToXAh6eyf9iNLfkExgzgDuRd3thaRORm0z
	ATk8RZUoB+fDQbJ2UeO57C1gx/7X8BPxBsXmCXpG1B2kVrVnBCtJPdzorJbvJPNGF22fNaaHfBU
	bKAwlf/zKdbb8A9YTaHuavkT7hsOST06CMvTG/wzEIn0SJYWvGu4KBvkyhko76kf/ln3L8NqbaE
	DEe/ieXYM9d7N4+LBOOYEusfI2PTmAMu3IsY1Q2Fc8XzN01zAmrXBQKePfAw9DW1HMLUnWauQNM
	T2Ut+WWwTaiwgkFR8H6Z+AIZrdkRZhIeO4gCo+jGLOputjAMZ2UM/ljUtmf/q74WqKbIyem4Eov
	rZfwsVgcwRxnd5hYewDOBaV17AcJTx+tynEXCVvnhnp1DVN+EG2Jq/d9Ew0SeUNf7sNaiG3ZxJf
	PMzL8jBw==
X-Google-Smtp-Source: AGHT+IHtE81UZpzilvEG/Fu4PAtzef4NCL972oTutJaNuvzoWEPLwkmwcsFYhJN77NFP4oGjrNDSqA==
X-Received: by 2002:a05:6a20:1591:b0:334:9d7d:f255 with SMTP id adf61e73a8af0-3465381699amr7386257637.14.1761799288194;
        Wed, 29 Oct 2025 21:41:28 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([2405:201:6807:1a2:beae:429:147d:8dc3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3405c363205sm270842a91.2.2025.10.29.21.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:41:27 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][scarthgap][PATCH] socat: Update LICENSE field
Date: Thu, 30 Oct 2025 10:10:53 +0530
Message-Id: <20251030044053.606746-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225498

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license. Also add LGPL-2.1-or-later as
socat uses it.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.8.0.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index bb39730005..ddbbcf976f 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=241;endline=271;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=241;endline=271;md5=338c05eadd013872abb1d6e198e10a3f \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
-- 
2.34.1


