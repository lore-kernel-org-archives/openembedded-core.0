Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAAFCCA47B
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1511.1654188776124680630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4Iz0QNV3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id s14so4973567plk.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Jf9RD8KiMCJ4pPyOj93DJp6CaupJKYFBBZcPn5T8gCA=;
        b=4Iz0QNV3Ucu1VDdimXqC3Pt24rxLcxGW/QoH8BoTcSESLIR0giepnvkbgcRGrfkPBL
         3rOLqwLb4rHIGRNKBgdaSw+Q06Pv9SVDJrfsIFvQFvLIZYMqkAkqOpKDL2W5XPMmTC13
         UZ9N9j21DfvSA6QPTa2TowyHbxsyclHakShmykfuncN0ODwS6BFCc9AJOpt3bzsoTSoJ
         oGOBH7WrkRTMpwjk9P0xn4VxEn4MK5mpLXrYkR7ZBRkPdWcoo60n63jxvnpxrcVQD5gJ
         j/74EiV22ctBofu/2nLrW/LICLwGBcEVzNQ7eX2nnbpGlqjGcOuIAi9NIqJl4fUKbvjm
         PVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jf9RD8KiMCJ4pPyOj93DJp6CaupJKYFBBZcPn5T8gCA=;
        b=bdjTlxjRz/iEkhqPHH5p6OTTUjd+dw5iG5TKc3FkaQSd+/rcOMjFv3cx8lfyaB0Kaw
         5AroBq6/wNntoO3Nf2m2EUaE2N8t2r5mVlfq20GlcY9yujJyWtNojHGcbqzekB/8ferA
         6LNmWvOKI0hOjFH2EZdFOiwdDE1Lrn6cRY+Yzv76uyfZSjBlYTloghXGqAxLnIXwtknR
         3Rn82BFem1SNi6Thc3L7smXBDz2MISO2kfbnV9xrx+pnZ84FcZE3aUjUYlrwgOWDAeii
         xNjgN5f1nbu5MtQvCSm7sjAoXp7+xFDjsozvgk5WL4/3RwsFub03tpX0tgGBZqI03Vab
         oJFA==
X-Gm-Message-State: AOAM530QrlBj/cEa1vDGl1xjnTjDzzFEQxfnHZ/zOqgG6xYsnhOE/D3Z
	e3oLvgxlN3giyugmaiMml5pO07pV9nDDp0gU
X-Google-Smtp-Source: 
 ABdhPJzwS662TKuQjM8QbRG71xOSE5ovSsD/hcAnu6nS8Od3pATC5wVXAZnrUcKfm8+XzN7C4++I9g==
X-Received: by 2002:a17:902:cf06:b0:161:53b6:474d with SMTP id
 i6-20020a170902cf0600b0016153b6474dmr5828653plg.63.1654188774990;
        Thu, 02 Jun 2022 09:52:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/26] insane.bbclass: make sure to close .patch
 files
Date: Thu,  2 Jun 2022 06:51:50 -1000
Message-Id: 
 <d96022a38908fbcf0583ed3388d5667bff38087b.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166495

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  DEBUG: Executing python function do_qa_patch
  /OE/build/oe-core/openembedded-core/meta/classes/insane.bbclass:1189: ResourceWarning: unclosed file <_io.TextIOWrapper name='/OE/build/oe-core/openembedded-core/meta/recipes-bsp/keymaps/files/GPLv2.patch' mode='r' encoding='utf-8'>
    content = open(fullpath, encoding='utf-8', errors='ignore').read()
  ResourceWarning: Enable tracemalloc to get the object allocation traceback
  DEBUG: Python function do_qa_patch finished

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61be3668d866834adfff688620aee7e29f6d8c44)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0bc6492c83..9ca84bace9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1201,18 +1201,20 @@ python do_qa_patch() {
        if '/meta/' not in fullpath:
            continue
 
-       content = open(fullpath, encoding='utf-8', errors='ignore').read()
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
-       match_kinda = kinda_status_re.search(content)
-       match_strict = strict_status_re.search(content)
        guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
 
-       if not match_strict:
-           if match_kinda:
-               bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
-           else:
-               bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
+       with open(fullpath, encoding='utf-8', errors='ignore') as f:
+           file_content = f.read()
+           match_kinda = kinda_status_re.search(file_content)
+           match_strict = strict_status_re.search(file_content)
+
+           if not match_strict:
+               if match_kinda:
+                   bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
+               else:
+                   bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
 }
 
 python do_qa_configure() {
-- 
2.25.1


