Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.23873.1609434928567433047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Dec 2020 09:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KW78czgw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n16so4126826wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Dec 2020 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1ZrT8SMPHWjs7NNwjpbMEFSq+wb1PlMZzNqV/Oq/Ns=;
        b=KW78czgwKyywUaXYjeLhzJMYlfaaIt+Hc9sPs9QnR5u8C77wMs1Rx43ndH9YhVEJWQ
         EEFggdKyj/vYC1HjjALbRLFRRhPfuEEow3POjr+buRtd0AYRn/VJQPtQqH+k4DzxP3mY
         m0IO+1Hq8EB3vObntTxdCt8mVGz5uWcpp0jXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1ZrT8SMPHWjs7NNwjpbMEFSq+wb1PlMZzNqV/Oq/Ns=;
        b=DqCU2rTgRniarkYfxT75HR8c5ez7FAdTHGWYwlNK/NAqZhkmbJ97bbdSSzLKuWY0Ol
         x1mYWaHmAAGlTyosNFP7zsiZbAV5vEZYVy6OTiN8usToMKHrR/0nJj583osObBwreHMe
         a7KExbC9QI9kJIICOz5vSpcCDziIZfVc3CT0AEf4NRLdH3HpqMBnDwsxDUnUKbnErIXF
         qV9GzQEf8jh5K21EGKUVjA+FRX3l1GccZbCiVMdppHbxD5EvGPzLxAubrq2B5Q4B41F8
         Q/9Sn8QNcvPCxNetQ6nBDABdDoHOq+/jqFA9VOevc/aqUvR5FQDnG1ap+xBeY6E9z7jt
         tDPg==
X-Gm-Message-State: AOAM531IbhYzXnh44KYI3ybCz1gxKlIwtXQzgHyoDQ0TtT0g/OFirgw8
	VMybRPLae74sr9N14qT3peuD4/fT4EW2aw==
X-Google-Smtp-Source: ABdhPJywGCm1QwZ37FAOhOOKvGSLysumwW8Lv1vAGgjq0VeNz2sGZWGBc40ewE3FFGD6eE8/cNne2g==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr12273712wme.183.1609434926850;
        Thu, 31 Dec 2020 09:15:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.9.0.d.a.8.e.3.c.a.b.0.5.f.b.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2bf5:bac:3e8a:d09d])
        by smtp.gmail.com with ESMTPSA id u26sm13291906wmm.24.2020.12.31.09.15.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 09:15:26 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub: Further reproducibility fix
Date: Thu, 31 Dec 2020 17:15:25 +0000
Message-Id: <20201231171525.257958-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the ordering in the generated unidata.c file to aid reproducibility.

[YOCTO #14167]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/files/determinism.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index fac80e7b544..3c1f562c717 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -8,6 +8,9 @@ Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
 from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
 missing sorting of the list used to generate it. Add such a sort.
 
+Also ensure the generated unidata.c file is deterministic by sorting the
+keys of the dict.
+
 Upstream-Status: Pending
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -38,3 +41,16 @@ Index: grub-2.04/gentpl.py
      return ''.join(r)
  
  def platform_conditional(platform, closure):
+Index: grub-2.04/util/import_unicode.py
+===================================================================
+--- grub-2.04.orig/util/import_unicode.py
++++ grub-2.04/util/import_unicode.py
+@@ -174,7 +174,7 @@ infile.close ()
+ 
+ outfile.write ("struct grub_unicode_arabic_shape grub_unicode_arabic_shapes[] = {\n ")
+ 
+-for x in arabicsubst:
++for x in sorted(arabicsubst):
+     try:
+         if arabicsubst[x]['join'] == "DUAL":
+             outfile.write ("{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n " % (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2], arabicsubst[x][3], arabicsubst[x][4]))
-- 
2.27.0

