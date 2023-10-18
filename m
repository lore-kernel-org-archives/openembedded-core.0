Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE2CC41513
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:47 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.285063.1697644120657992016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=myve6tfB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27d329a704bso3454789a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644120; x=1698248920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmYKEgrn01cjZ33WnUn30cyipiTm0T+MLFUktvCFex4=;
        b=myve6tfBllwGtlUjSJICaT7Vw5qNFBzLDGatkrPoklkzVnaHnZ/11KsrPB4cKOEcIY
         EkyM1TUXvJ858uVO/K7oGGEXgJJFGtEJH2WIB5FsmrZBphYpo658pNF06HuraKWCzwcj
         zbQIZCE3GJn4WmwAeRr11WmiZjGM6RWAiKBtnf0EZFgtnaIxkUh5+DGzRQ+mrdZQYe92
         1e8KpdueQXb0RokUc42bmbROUZsAiJH85WSaJm2zfH9jua0/w7vo7i82q15I+GGBJBYK
         pLWpTae7go3jMddZAQv5flQgHDgetTiUqysjwH3hFDpkL9410IqM2CClFBpzCDMeQx8+
         2HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644120; x=1698248920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmYKEgrn01cjZ33WnUn30cyipiTm0T+MLFUktvCFex4=;
        b=NahJXtj7TiWvP58wbrRze7P3TJB0U5xJ3pOLM3RNhhph0Yvv34k2mllmO6WhSw2E6y
         9wCSv5OM24axo+1A+NFRPz405MCIKr/W7ZjvnMyuKDONA/ueXVJv7oVmhRWexx7vVhtk
         yPAgBhDs8kqZB2SpHQhEs7MyEd8Z58QNwTz2WH1y81rXvM6UXX4J1Wt32wHOPuSf0lxv
         4MmSgielpbbOSFXT422WdCyFpePOOHaAE2LtT4mKLGf80XiN1xhMfbpbCnnBEzvzstuq
         Siqk7QX2mcscxSljh9btHNgfl7HReJCb0bP82MyqjTgRQlR2EyiUbhEzQ0fucIPkRXsE
         KjdA==
X-Gm-Message-State: AOJu0YzKuss9nO9KNFoMSHIeY+0HXhXQ6nTUvA4O9i3oILRUUc5ujbW/
	2pib9csOXaynLwlG8zn2972wa+kZBYLX8QRkhUM=
X-Google-Smtp-Source: AGHT+IFivFof41QfWh4xBoErYovPc4HPi5KM0HZz5lyLCXlDpEhNVpNifsNA20C33kyHW1++Xszk0w==
X-Received: by 2002:a17:90a:19cb:b0:27d:4d0:5d7f with SMTP id 11-20020a17090a19cb00b0027d04d05d7fmr5732321pjj.28.1697644119781;
        Wed, 18 Oct 2023 08:48:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] binutils: Mark CVE-2022-47673 as patched
Date: Wed, 18 Oct 2023 05:48:21 -1000
Message-Id: <96fe4b522a35f75a7d2b597d7e650dfc7ae82e27.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189401

From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils/0022-CVE-2023-25584-3.patch               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
index abe501e570..47cc3f310b 100644
--- a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
@@ -35,8 +35,10 @@ Lack of bounds checking in vms-alpha.c parse_module
 Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=77c225bdeb410cf60da804879ad41622f5f1aa44]
 
 CVE: CVE-2023-25584
+CVE: CVE-2022-47673
 
 Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
 
 ---
 
-- 
2.34.1


