Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1A8C35FFB
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:55:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3908.1742414137840372509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QcHwPlv6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso59095e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742414136; x=1743018936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgANvtJqUziUweGnexgJVDxsqvoOp9sJTGiN1uXJMKA=;
        b=QcHwPlv6z67GIxtNY6DQqnPotkwu2fVqGop3gWrfQvy9PYUoxwtOUbBDftHcO+Uup9
         YioEGJCDxks9zWC5jKTVfRV83PYvlOJ9aKd7JenNjrEvOmyVGBU8zMTsgt2Xms7jtxpl
         ZFqJU4oTayOAT4D8v/F02lJMnoUXt5NbPuJ7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742414136; x=1743018936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgANvtJqUziUweGnexgJVDxsqvoOp9sJTGiN1uXJMKA=;
        b=PPc2bQ03giGVrxqa83SqPWSbmalvxfcRMZH5jzJtwp6CHG1OEaa5SLAG3MehiQIL4D
         eXXni9E3V3P1a7t7tmllvSkN0v0EWsfkczE4vRbxkRE0d5AJo+G/YoyptLHCRRlixlnW
         ae5Cn/j9duSbuAHXAphq4EpAC3bzuIJNW/rzqEAcrDkB6K8C6l2YlzWPRB9JFF+2/VAc
         mfLnCEFdliKZ3ktl8OSHqWw3bbNALHXZY6iFq3pHk0/tCaaBAcLX65DP1W7ncREDwX67
         kBWow6zKQLe4cKwRgFEw57xzNdfIHcRQxLu5Y7ecR/MS2oRj1JU75lgxdZ6jt2RgPraE
         3GjQ==
X-Gm-Message-State: AOJu0Yy0AU20mPS2Pl2D3l3DbBaFLeSDAYokVMIF2eYfI2YGCWIjuudK
	SCxlz4UnHEMxafkKLzl/8ybpMAHtE7F+TPck6f+8hSMhzcXsc+SWCt4VttUB6M1KoUllANeqtdR
	L
X-Gm-Gg: ASbGncuNr/MPmhQ2UUaSHAIKHMA075CJAIJdCX2qVY9XFb0KbKME0rFkwEUxG77JJDp
	aoYt5AHZqeLLiTR9phvk5ZbKwQrXYpo6Rixak5uaATEbKgv8mnKkAGDCmqP23qC5tkOx8T9gYWV
	EQbMp2nKuo8WVFJt0gNjXiuSEonnyf9MKGoGpEIQvzCCVGhxDYsGexGmN08MPRqnDjudtijE0Bq
	NT/8jLkYNVBl1VvK+ZSIWZnX1rWXUW0blCPYVQzCCYBeTLGt4EjtX/vCCa+ZqJy/fQEyk1SfAib
	AFHGI4zRPuc2w6D9+xSql6ptAcVmBC4M8aazqEZ26YcTR2aEc26dnF8z8ojng7TDOFMMb3rYtck
	MN92qjYg=
X-Google-Smtp-Source: AGHT+IES1vNAK4WAMvH2k+yBFIRDwZVI3qbKjZhdjfmTTk53c1OtWd0w2ZHlNC7piSC7RdGZNBgDvg==
X-Received: by 2002:a05:600c:1d85:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43d4950d2d2mr4124015e9.2.1742414135838;
        Wed, 19 Mar 2025 12:55:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb8c2sm21330269f8f.85.2025.03.19.12.55.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 12:55:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Bump minimum version requirement to 3.9
Date: Wed, 19 Mar 2025 19:55:34 +0000
Message-ID: <20250319195534.860324-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 19:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213352

Since Ubuntu 20.04 is heading to EoL and that we're having other issues
on that platform needing buildtools anyway, we're about to lose the
last python 3.8 platform we were supporting.

Bump the minimum version to 3.9 since there are many developers wanting
access to newer python features.

This likely won't be seen since the bitbake minimum has also been
increased but helps for documentation purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 5783b92b26c..d2ffb59fe6a 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -847,10 +847,10 @@ def check_sanity_everybuild(status, d):
     if 0 == os.getuid():
         raise_sanity_error("Do not use Bitbake as root.", d)
 
-    # Check the Python version, we now have a minimum of Python 3.8
+    # Check the Python version, we now have a minimum of Python 3.9
     import sys
-    if sys.hexversion < 0x030800F0:
-        status.addresult('The system requires at least Python 3.8 to run. Please update your Python interpreter.\n')
+    if sys.hexversion < 0x030900F0:
+        status.addresult('The system requires at least Python 3.9 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
     minversion = d.getVar('BB_MIN_VERSION')

