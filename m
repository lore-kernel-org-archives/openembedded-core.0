Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A374C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:54:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3088.1753386841433437710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CS/mInUy;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so2318893a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753386840; x=1753991640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+46t8wx1w3+SrTl600TDlnyfyycR2t/opsrbJ8xznJQ=;
        b=CS/mInUyFST6R2lU/gO3H5p8/Inxyc8m4XYhthT6yiCks5XrZUGtdvfLGj2SLxk+js
         68syCgn4vRA96SI/no64OYt1UUr58WJ30oMRHznuJ6KYOp6VO5xg0+qiecLICSVUvpaa
         TFlaocdnmhTzjopp9KMzrkicjWthbTXM+Jn60r4JjgO42+u2wUKdwmsPcKmkal0Axy/b
         MdagFbqLg+oejcg/W+MoTzpXT1XLB/uRUkUCSOcOLjCspAIH0P1CHj+3vhqTrcNcMdDB
         juqKJDgMUZN49Lu2b4IZF/Qx4EfQ+wtEPzGq3nuzdex/VbR9zB4mdQjh6K7pxbIoGWrB
         oD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386840; x=1753991640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+46t8wx1w3+SrTl600TDlnyfyycR2t/opsrbJ8xznJQ=;
        b=nUSjo+BA2CHXBOeSiG2vOJGJkpMDvrJTOS7ak+sMbrRcR6uHoBRA/uFU85UmKp20rK
         mNgjx3M8UAD5jnaAkS0Fr5SgTkz+fw7udhysPEk7ljAkHl3baIT3+fMtuUbmL5OjZ0+m
         BYBSBAQX1szDcO8peNzRyN8gypuEODMt7kAB91iPAHUli1z9Nn/lULX8xAPNyoB+oogU
         OrjuiElzzFgYU0U3TRbixidaROH7tPdg7T9MkFuNETtCewlo6yFt/dpW5igrMuqIpMZs
         8UVc7c/18z+rjXX/i5J/s9lc+//Dedn2geKXkkKBtfShR7258+nWrwoFHG84/thBck1V
         C91A==
X-Gm-Message-State: AOJu0Yx62Y3ODXdFnUftJelP318jARshWo7wGuaGksVf2qfQd/2cvhwS
	cGoYTN+HgYLBeXtWzQBSW64MgrL2CgJne57T0bLXgEid4cZPft1/YKPzJtelyg==
X-Gm-Gg: ASbGncsRyCSyi1FAZrtsSVmmABBLONxZENwJGmJpUztIwRH/tkjc7jpCimj+rBHQCtV
	R3NPb3Z+khJm5FCdC4LEaBJ1BhmE6bSQBXPPo/I/XsvlhLjto9KV8qOMOeOxXL1AZJUF1CzxEQh
	6zWmepGxzJFpjZJ+21NGcYAJFaakpiv3CXiMiGnvT+GVgShXoYpknpUFi+XQ9xg/isB0VH03vyw
	1N/pHzkq6y9+mxEPDojB8DcgvWRDL94cPz8fzcmA25KOErX9zPQKqlLQGyVPskIiWcbBmPckArL
	Ng134vMaUX79dLnnTOnXIK0L4+0nMGRwVfVKwa3fAnRK3Y9LOcRxQT2+hJvfz+500YFKYQQ++V2
	6sxDUg6FF7x/EAj1GD2T5
X-Google-Smtp-Source: AGHT+IHbDwhqCmjQsl/QzyVL0DNfpKWffg5fklkWi7BlXuGLAVS1Q45b1nhj5S/FRVHRt8TAGKB4Kg==
X-Received: by 2002:a05:6402:2353:b0:602:36ce:d0e7 with SMTP id 4fb4d7f45d1cf-6149b44b62cmr7191802a12.14.1753386839509;
        Thu, 24 Jul 2025 12:53:59 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:a5c4:a4a:87da:e28d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd3432b6sm1197428a12.63.2025.07.24.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:53:59 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.11
Date: Thu, 24 Jul 2025 21:53:52 +0200
Message-ID: <20250724195354.33606-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724195354.33606-1-an010@live.com>
References: <20250724195354.33606-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220867

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.11 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b699b34270..0dd23fe0e4 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.10'
-DEFAULT_INSTALLER_VERSION = '5.0.10'
+DEFAULT_RELEASE = 'yocto-5.0.11'
+DEFAULT_INSTALLER_VERSION = '5.0.11'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


