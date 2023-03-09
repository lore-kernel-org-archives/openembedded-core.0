Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8578BC74A4B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:25 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.5687.1678402701264023177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Lu5yD5uf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id b20so2535520pfo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wM1x/RQTUb7zA6P2Jc+gZAz6UIf9V8f/0rpROaAVB80=;
        b=Lu5yD5ufa2kz31efUBTidsibhHtYd0lzkry0vwlY3GOv9CQ46dC/K3bVp4k4EcWu0f
         luOwxZ6fDUUWjiz4lSThYDX4aROwnUo3viTPmDh98bTBaehoJmE0tLah+3H5QoTG1pTU
         FdnNyN78RwNOY2DGmx+HhCYsYU2hxy1+gHFbM0AIXfbdNRXgN9Xsgs4cdOCuJKMygdXn
         M/M0GWbyyr8qFySXHUNJsllrM3++oqUM2aUaWpLpSeclLrGm4xx6xJoxQyW5vbDtAbDi
         jVmlT7CH4A6G2b8SZGGA6UPYn6WGmNg7IN9olJN6zMIkNZXIFuFS0XJacdWPQ17ZSvaA
         b5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM1x/RQTUb7zA6P2Jc+gZAz6UIf9V8f/0rpROaAVB80=;
        b=TCBtEwjMcUyBsr7zeWFIKnt0t9lyJU7HK+IEb9YOWqAp0uGtagxCN2fzv/FtGpt8xM
         l+kJs8xBpbeGx3tAmTPBeNJ7L3Vshq8ZzhdwjILA5D7/t+E7c7BudXJKNPAaq4ffLJPO
         r+WzuFhZ8+7m2IY+QQ7qeP1yTFjdv7JGzdW9ONDh6UZOM5UNSIRYTupB7gOtMi3F14qn
         mgu/Z8PSrIPSF5kajOuIHs/zU09uFPO6cExszzrIEZ1jlRCTWlgTIXT1iUz15c1OloDS
         JmF2ffPsC1iTDo7Zg0Pdg+EF/3FR1Gr9g5F6ooUDFjdlhS/yd42sdaDHTIHRiC8pzANR
         GDJA==
X-Gm-Message-State: AO0yUKXEJVG+JCLZ1mH3Y6vhmZmlvLaHazn/rz10SlUQur2ZGKZk+1mo
	4LUYvO0LAyV7gPInxSdvJSFa2Gr2Zk+Ct/sYD0c=
X-Google-Smtp-Source: AK7set8gUra/DBeJa2ygQTcxEenomjkoCAEHRjeCj72GX+c2qRmiJOx2eXhxMPvYPp5Xh7zCExpG0Q==
X-Received: by 2002:a62:1748:0:b0:5dc:6dec:e9b9 with SMTP id 69-20020a621748000000b005dc6dece9b9mr21964143pfx.21.1678402700377;
        Thu, 09 Mar 2023 14:58:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/27] shadow: ignore CVE-2016-15024
Date: Thu,  9 Mar 2023 12:57:40 -1000
Message-Id: <8dce0c01d9a0f6855e6a70a65412a43208b034a8.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178278

From: Ross Burton <ross.burton@arm.com>

This recently got an updated CPE which matches this recipe, but the issue
is related to an entirely different shadow project so ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2331e98abb09cbcd56625d65c4e5d258dc29dd04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow_4.12.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.12.3.bb b/meta/recipes-extended/shadow/shadow_4.12.3.bb
index 40b11345c9..d1a3fd5593 100644
--- a/meta/recipes-extended/shadow/shadow_4.12.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.12.3.bb
@@ -9,3 +9,6 @@ BBCLASSEXTEND = "native nativesdk"
 # Severity is low and marked as closed and won't fix.
 # https://bugzilla.redhat.com/show_bug.cgi?id=884658
 CVE_CHECK_IGNORE += "CVE-2013-4235"
+
+# This is an issue for a different shadow
+CVE_CHECK_IGNORE += "CVE-2016-15024"
-- 
2.34.1


