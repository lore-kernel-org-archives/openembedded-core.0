Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE11AE728EE
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:15 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.27712.1696017908581380386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcL8AhF0;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7741bffd123so911511485a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017907; x=1696622707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjlR7Ki1Lvcj5yd73XbZqscnzToaYMCGCJZj4Y5CcAA=;
        b=KcL8AhF0SEmqAFhy0d2lOFuKCoEktqE9Ue9V0FrtatsXpvthS3fOHJVcReekUcMnpr
         Ka2rJlaQYFtlgiCV+/kuRhwKFzEpRnJQ5luf3zmd08EUZ1kTm0Kuxwbt3VCI669sRukV
         deKdCZwUm+wMwlsLqoAwCXhb9RhcLdd+pBfbF9QKB9TDsxTDfF5M7BTGVQ9jcE+lCP2e
         IDNXhwJjO703nekyEx9HWza/QQx33tw143KJPF6UBndrlJrhS3ZnSsVXPL9S0CmKG6A3
         2KOkeA8OdQULEga/OJBzCa4rB+AUdKl9MyrVonIUmGETgWGHuBIwpzeiUge6+PapciNZ
         QR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017907; x=1696622707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjlR7Ki1Lvcj5yd73XbZqscnzToaYMCGCJZj4Y5CcAA=;
        b=S4CJKj4UauPkrPiE9nYDfaGSUzAhI3bUJva4pKazEmvF0z2pCzICN0P37CWAO/JR+e
         p1hYgLBLbyEp1agiSB6ed4XDox+bJ3EtpJ+8wvpesp+FfCQiDbmu0JEugBoiZnh5IvgY
         IzIMVRt1ghTdMSRCJ8nxv0PJ0OCBwQxoHAQHZe1zyOC0Mlg39LKV4s5MslQMdTBJjO6c
         eF09H/y8/8/FCV7/Cxm5Fc/qFzuBJ50NpFznE96gpyuFkP44Io7xB3InKbxIyZ7KEFKm
         CY5fYVc3YWFGicJRcVJ3yhO/yMCuwLrJuxrSeRJUALpELMADDCx3nWQnd5O68FRvpW+R
         wGfw==
X-Gm-Message-State: AOJu0YyfZ4Xl8dUrUXwLpk/WyTH7bBRekUm2XrDc8RFVOaPjvRfGmnHX
	+DKyV0HKclvqrcgvOpKIRBS7A7ByycQbVw==
X-Google-Smtp-Source: AGHT+IEx1iMpXb5kvjxMaRpSPI5iIxmRLUDyWWheuR/MBoJWCCwhb5UWGYcARVxuqZr3fCUCYRzQ8g==
X-Received: by 2002:a0c:e20d:0:b0:63d:657:4cb9 with SMTP id q13-20020a0ce20d000000b0063d06574cb9mr4756391qvl.42.1696017907665;
        Fri, 29 Sep 2023 13:05:07 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:05:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] linux-libc-headers: default to 6.5
Date: Fri, 29 Sep 2023 16:04:53 -0400
Message-Id: <85b545177c70b85891fc40547aa9fb92d4be9954.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188428

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel version 6.5 is the reference kernel for the fall
release.

This brings libc-headers up to date with that tested
reference

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 69280fd210..c72a60b3ba 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.41%"
 GDBVERSION ?= "13.%"
 GLIBCVERSION ?= "2.38%"
-LINUXLIBCVERSION ?= "6.4%"
+LINUXLIBCVERSION ?= "6.5%"
 QEMUVERSION ?= "8.1%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "16.%"
-- 
2.34.1


