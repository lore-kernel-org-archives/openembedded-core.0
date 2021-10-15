Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716D4C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 03:17:21 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.4786.1634267840378112249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 20:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oAw62IN8;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id v8so3069651pfu.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 20:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwpJmarf6FZzRJ1GWZpJjuBhD7IsUH+eVYd/9suUSu8=;
        b=oAw62IN8z8w61gAbTmx+KOEgUKSZ8zHpcxpSPTbzzNMYRk0pVnx3/7e90dL7EVfEfb
         L0iD95/XVkN7OnbjJpMLrbKPdQto7L6m3OIb4OIVDb73TFfSaZYsyXD0joZwjdvbDb/1
         tR99uzXXMT/jXOZnJdInhSj6y2cjyODNwNLZFAs0WPFX+L/gmSdOPLAy4+FeDr2lo5x6
         KJ1cXVSA6D46WyWOcLke76VwEDJMz62DOSCAbYyKpjjesFVizbNSoCFPIAjFnjtvETVr
         HGJQlQgNByFm0ZCyvHlTX/7TcT2yhZ2f8v8HKFMPR+7l8cWpxXIpqrOfV20JIEl7I7ln
         mRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwpJmarf6FZzRJ1GWZpJjuBhD7IsUH+eVYd/9suUSu8=;
        b=0nt6ubKsDiI9haef2KW4OOKeC4w/fTpteyRvscwHc5160LvZ9moRA5ca3aaSGMaf66
         oVZ5xEOm7zogpxiKzc4M5uTnzS553h/4ckN9/iLIdgUvo2elKFFxZ8GQ7PmnXJWrcSmB
         LySt7f7EQGljSxKw6001PWMes9IjwMIUJvvTLV6YwN7c9GDv/UbrFrJ/4SZzhD++W8VN
         Q7ZqNjLAg3mQieZvv3zG7ArmnmCKl/RxjlPHpJcHH0Scb2jA1Gn4o6zS5xHQwJG8fLpd
         8DvQJuUkJJDcZ4zy1wwFxWgxZXnWTkpJsC47FeoV8td7ui0hW/gJCHjHKHEuLzw2Ndg3
         dHUQ==
X-Gm-Message-State: AOAM532j7dl/F5bTkKc89B3ShmAtP8Z0iU15o4BiioM3attP0M4PLU7g
	AxRmk87vw4ofVadE2zMEG8DUtNHv5yamsQ==
X-Google-Smtp-Source: 
 ABdhPJygmoaKzN4M8LQcyxeP0EqxSXFfnY7BBTXhbLX2Jr5QmVqzQl3eMlv/+7/WAd4cp7oz2SuhsQ==
X-Received: by 2002:a05:6a00:1255:b0:44c:dd49:b39a with SMTP id
 u21-20020a056a00125500b0044cdd49b39amr9301877pfi.66.1634267839448;
        Thu, 14 Oct 2021 20:17:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 g10sm3363713pfc.213.2021.10.14.20.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 20:17:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] opensbi-payloads.inc: Use strings for fallback
Date: Thu, 14 Oct 2021 20:17:16 -0700
Message-Id: <20211015031716.1049584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 03:17:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156982

This function is evaluated during parse and some machines maynot use
external payload, on such machines this fails to parse

Fixes
bb.data_smart.ExpansionError: Failure expanding variable do_compile[depends], expression was  ${@riscv_get_do_compile_depends(d)} which triggered exception TypeError: argument of type 'NoneType' is not iterab
le

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index cc31ab3b1d..ce537c0587 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -17,13 +17,13 @@ def riscv_get_extra_oemake_fdt(d):
     return "FW_FDT_PATH=" + deploy_dir + "/" + sbi_fdt
 
 def riscv_get_do_compile_depends(d):
-    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
-    sbi_fdt = d.getVar('RISCV_SBI_FDT')
+    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD') or ""
+    sbi_fdt = d.getVar('RISCV_SBI_FDT') or ""
 
-    if sbi_payload is None and sbi_fdt is None:
+    if sbi_payload == "" and sbi_fdt == "":
         return ""
 
-    if sbi_fdt is not None and 'u-boot.bin' in sbi_payload:
+    if sbi_fdt != "" and 'u-boot.bin' in sbi_payload:
         return "virtual/kernel:do_deploy virtual/bootloader:do_deploy"
 
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
-- 
2.33.1


