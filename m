Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D404C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.12247.1641927760072834333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFTx0jSz;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id x15so263934plg.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H03/V5oni4uFgtb9YzTe7Z7wrFkD1ET35klogzfMu2w=;
        b=VFTx0jSzoj3OZEth76Jg+1E52TiFnCLlInHnz7bbCElu2g99OpzQ21bNd+ernV6GE6
         Uxj3V4sKJk//bIFHDJMRB1bnJPh+KdqcgYR83He+kItsYAmSbKU85N29quMRQBP0O6yh
         qzOUv9f4do0rJ77kVEsBrxevhubGoAcbh4Q42lLuePEow/X/XQqiqkup16/bcOH/o+RU
         lDqrFnLN+FmQKRm+DTRV8Bfe+LKpzHXaf8JM/0TvhFZs0qHf+MsKEhRvhZ/vURIyGGP/
         VYKfsbWoG4uY/LWXZ/3/TelSbhkAwOFBNUoTusTTkc4dFv3UyK90YGt6+Q9PSYioV7DP
         dUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H03/V5oni4uFgtb9YzTe7Z7wrFkD1ET35klogzfMu2w=;
        b=8FQqC2bfov8lgozxi7R5NeFLLUjQGJ1S3snpUMAAVFB7nlLIki0ITDuLRkU80yFM9A
         kW+4Re8sA9zSpmBiA/iAA/bDcHjRBTSD4D9k32LwfGkhvrYaSpnYWQp58hH9NfbOmNHd
         oWFzdJDijMcQ4CqOoDvNsW7iRjK0BFYgqAv/Ep9Abed/in8bG/vaW32sUOP0e7Ckwc39
         4sk+TrMWRyJC+zpN0s3f07tehNzqL/MZFSuGnGty3D6VrV2siXMtJiMKC20aKmstKtdI
         2uyATPVSh0d1OWdeHArVbjWidDqxgazM3W+OOtzA5zKir0mfnbwkmGF2iNpsTJ7t47pB
         B3nQ==
X-Gm-Message-State: AOAM531JdQJSrLE53N6zOdjex/q6ogzMI+n7oXK9DyRIF7iKtB6g84I9
	VYbK9gQu2s6HOikBykN9H7PUWHVGHac=
X-Google-Smtp-Source: 
 ABdhPJwdDUd1UVVoYiY1Ypu4y+76pyLL8rYhKhF/ZgzmiPM+Oiwfg4W3qWo0UI31bt+FWkuHLK7/Ng==
X-Received: by 2002:a17:902:e884:b0:14a:417a:3e12 with SMTP id
 w4-20020a170902e88400b0014a417a3e12mr5973765plg.2.1641927759262;
        Tue, 11 Jan 2022 11:02:39 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 13/22] btrfs-tools: use setuptools3-base not distutils
Date: Tue, 11 Jan 2022 11:01:22 -0800
Message-Id: 
 <fc53d91d03e3c30647a54377347fb00f4938c309.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160449

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
index 9f3c0e9abb0..3cf216724e0 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[crypto-libsodium] = "--with-crypto=libsodium,,libsodium"
 PACKAGECONFIG[crypto-libkcapi] = "--with-crypto=libkcapi,,libkcapi"
 
 inherit autotools-brokensep pkgconfig manpages
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3-base', '', d)}
 
 CLEANBROKEN = "1"
 
-- 
2.30.2


