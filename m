Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.13193.1602771344134923128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TTpMAyt2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id k8so2124565pfk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nRRzIWm1RvybpyzWVtRW4y6TmbwA82p4NhcNhgoa9dY=;
        b=TTpMAyt2teh1NapH+z7elI8rkbsRRmIXw9HIPD5+MTDmpfKcTcy+PukxQj7HXG1eDU
         PD2ZpxYdTLrJu0H+osvkn8b5iZYMJ0KJCgCeSfwem5IusyaRIyj6scIIXYSbYjxc8IDo
         MeAcBVqz4knBa/jqW5I8MuCitiii9eTKQ+8Micpf4bbLg1YBSs+dzpowLsvCenojCBf/
         1kL0QYEkIXRd6rhI4eVj5wW64PFseLuvNX37KBhP2TLC/c4sIcoJz76wd7FP4o5OmdIY
         BIxpWs96OUGnchH6L8ShUzlgH2ZUUS4m920hJLohuPBxyubNYqP71iSmRL78A7lpeq1/
         rsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nRRzIWm1RvybpyzWVtRW4y6TmbwA82p4NhcNhgoa9dY=;
        b=ZpZkRO3PtJYh9AkluMk94XMqsZs5194r0b1i3IkeOvsvaD0e1yIS6ImDVopyBJUBND
         PdfudClG+fpxW9Q5UUrDrqA1hycqfDklV7GFXmKtXm5GeUy9V9ZLIQONJPrYJC+Y/eL6
         8G2w6aX2taJ7zguhq4eBn4d4L7JDeQYDbPPjYYXjFgMBHI6CcUuVxGoZ+AZOMu3Jwlm/
         fD43ay19I1lwC2vzTWhaAo1/F8pBmCJpRsflxlVLCdtOlXsousMmWh1k53r2jccAT3l/
         Ju3FtVOqNEtiOeS3L2tkvIp3T9AyrwUMcSKCA2m6Mti/HjfPKcgF9LZu2qBE7YoqzSVz
         iYEg==
X-Gm-Message-State: AOAM532LMldIa3l/rFPsnzS30Cs0Bbax8U9euPQYU1QTrP2WMacxl3mq
	LuBVaTRvHk0JpU49fd59oKkLt4k7Kw7hLMTy
X-Google-Smtp-Source: ABdhPJwUt00+xAhybEp1CWXEFMAjsu5G3xG967SjxPvl52qpJ9llayFUY0UHYqtsZcBvCwSoO5wMZw==
X-Received: by 2002:a62:e104:0:b029:152:4f37:99da with SMTP id q4-20020a62e1040000b02901524f3799damr4320448pfh.17.1602771343100;
        Thu, 15 Oct 2020 07:15:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] bitbake-bblayers/create: Make the example recipe print its message
Date: Thu, 15 Oct 2020 04:15:09 -1000
Message-Id: <8cf48f47ad7dcaa324d8a7ce6c7364c3fa1d0596.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Yoann Congal <yoann.congal@smile.fr>

The example recipe is setup to print a message using bb.plain() in the
"do_build" task but this task is "noexec" so the message never prints.
This might be confusing.

This moves the message printing into another "do_display_banner" task
and add it to the do_build "before" list.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 252385bef9b226f32691b8513869ea3e41813b40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/bblayers/templates/example.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/templates/example.bb b/meta/lib/bblayers/templates/example.bb
index c4b873d593..facaae35d2 100644
--- a/meta/lib/bblayers/templates/example.bb
+++ b/meta/lib/bblayers/templates/example.bb
@@ -2,10 +2,12 @@ SUMMARY = "bitbake-layers recipe"
 DESCRIPTION = "Recipe created by bitbake-layers"
 LICENSE = "MIT"
 
-python do_build() {
+python do_display_banner() {
     bb.plain("***********************************************");
     bb.plain("*                                             *");
     bb.plain("*  Example recipe created by bitbake-layers   *");
     bb.plain("*                                             *");
     bb.plain("***********************************************");
 }
+
+addtask display_banner before do_build
-- 
2.17.1

