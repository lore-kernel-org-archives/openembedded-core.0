Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D9FC433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 10:03:02 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.17952.1653559375915620701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 03:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=npYB+k5M;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m20so1971332ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5L9wGTNJ5T1E8+rBmyp1gvXf2EgrPRzfF927TrDey3g=;
        b=npYB+k5MeCQ8gz0GLhVaYOoBPwYSM1qjKw2okdZNbFnTCsNOfQrPOAiSesxnI/GXfM
         FoiUBlncleecCVKEmq+3SVVtVAF0Be2SqERU2S+klvPGkdsGfQHayz8Z0+vPcjYcnRoX
         CkHP3ArwTjJFquGLXA7n67UbdNoAtGBGVvU8gZshOjuT8zMZ+qq9DrweyeHUem1/vgLR
         13Z9W5NBNhMlZsByBnxpWuanotAwaK/venJlsRw6snFus90MtS/VjZa8FtMBkBcuIxX/
         CUtdWJPGYMIJR0QJC49f9zF9YGBVHF2bmaL5LFmWCdCyAeor+tzG3RsXKc7tEn+Ic8CZ
         AOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5L9wGTNJ5T1E8+rBmyp1gvXf2EgrPRzfF927TrDey3g=;
        b=IFsxNDbFey3r/rTgI99zUCQSJwWcJ7wWPCxkSVS1vSrIkgrYH+50AhYihlYLCZj9TK
         S3nj3x4wqdY4zjpmGKjmnAk8M3p9mFMKxJ9NHKSDzIZo8j1VW+xo/OTFOiBY+jYm2Rj0
         jPmSLO0tC9/fM5Lmv1b38zzYTx6zU9n23yiGv0LjcMrz/4vnckW4p6j6os6SkqxGrKJg
         AAnokXd5xu6YWCr1hfuYg6B46y0ZawIj4JYqfvs0/SLqnAVwEfvHIQfhVmAO8c2g3+nC
         QKlqLDnUEnh7cUXJ2VTYeVn+bdCTsHdqR4ecEhiRlUc8GjD9ycpED95+snpNOwf6Ao8k
         febg==
X-Gm-Message-State: AOAM5307h42tXyTzu4itNXHLGIey4apdR7AothaW22/0aOBoDYoT+iy4
	dfXnYcBYvy0Eqhv53rDXgK5JB4W/IDE=
X-Google-Smtp-Source: 
 ABdhPJxWftjjBDRd8ycXV4cCwrFOw46Q8rko3Yd/7VSdc4peSBVsq3mO5kgDjftTykuU7MYO/C8Ivw==
X-Received: by 2002:a17:907:7b8c:b0:6fe:d41d:b6a3 with SMTP id
 ne12-20020a1709077b8c00b006fed41db6a3mr18787725ejc.92.1653559374223;
        Thu, 26 May 2022 03:02:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 s16-20020a056402521000b0042bd6630a14sm595302edd.87.2022.05.26.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:02:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] insane.bbclass: make sure to close .patch files
Date: Thu, 26 May 2022 12:02:36 +0200
Message-Id: <20220526100237.2224982-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 10:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166181

* fixes:
  DEBUG: Executing python function do_qa_patch
  /OE/build/oe-core/openembedded-core/meta/classes/insane.bbclass:1189: ResourceWarning: unclosed file <_io.TextIOWrapper name='/OE/build/oe-core/openembedded-core/meta/recipes-bsp/keymaps/files/GPLv2.patch' mode='r' encoding='utf-8'>
    content = open(fullpath, encoding='utf-8', errors='ignore').read()
  ResourceWarning: Enable tracemalloc to get the object allocation traceback
  DEBUG: Python function do_qa_patch finished

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4fc3c06c64..db811bf789 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1186,18 +1186,20 @@ python do_qa_patch() {
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
2.35.1


