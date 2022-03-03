Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A4DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 21:53:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.90.1646344427026349745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LxkdJ4jE;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id q11so5964245pln.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YnS4Y05vU7hkNDIcA2rLGZ+C8OtvC041leWwJuqw06Y=;
        b=LxkdJ4jEMMMkzCY9ZUWcfpfM162hJ2+f/DJEgxHe7HD0UX7JSLbE+/JRDI+U+pRNtV
         BN8MtyvG+FPskxk0yzX1NvtHTlDR4/IQj/d6g5Spt6TedSaC9mcnjX8z4NGbJ4TF6+95
         wR6eCeNs3G1uAzJHbpFdPiOTdm+lxqfiEnazrSZunvOdCu7bjm+MjeDUxhsBdKY9cls0
         6ZLl5hmbghTwl3eXfzObZcs1MCZbpsvs3SyjthMdkaZovAXQo8xsXLV2byemYKzjxjLC
         4FdeRHWYk0sg6f/Wy0LSU8lU8LpKbf57654DvIdDLhTDfIIIlxOPFsvpN9Q3LQlTKpV9
         0UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YnS4Y05vU7hkNDIcA2rLGZ+C8OtvC041leWwJuqw06Y=;
        b=THWPTCJKsoxqSSXLvMtCV1g8nct3vwcd/pSgd6y0KjG3mVOf62wOrWBecVivAFELU+
         8l9fWkDO77WpaofdgvhMi3i4cpRrppCIeDj15aP5My5vloL/Tzsf8GiwDpjVUmws6N2l
         Tdi9jRIkjbb3G/5JB7HwAdrGbzMH/U2zch34QhHFgMjZXzeD9y16CcA9H81i2bqS+ScU
         gFlHKSv5eMA54Qw9QPyCCJL50reZxx2ehpnpOsOuiMiEEwSTSLejbOAV9LIPI0aNWJXx
         XwwSbTJ/Ad77qCJtPJK0W6xZMunZTXoxGPWOzaZLUViFb9kj4PcgTdZHCV7/0OeE9Qh7
         D1nw==
X-Gm-Message-State: AOAM532NKMXt3PLBhjLGALXmCIKIAllcWYqvfamBJ9jMdiTnkH3dLUF3
	ilLvdVdFSwPdfOYppJ6JDyiH+AB2kQ+L3w==
X-Google-Smtp-Source: 
 ABdhPJyc9oEQG70Wz5N0x4eFLiMs19c050MzYG2vr+sYQ1K7LlwlNshE6NEwWyvSysloGysGSStFmg==
X-Received: by 2002:a17:902:e84a:b0:14d:7ed3:dba9 with SMTP id
 t10-20020a170902e84a00b0014d7ed3dba9mr37829400plg.33.1646344426301;
        Thu, 03 Mar 2022 13:53:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 be6-20020a656e46000000b0036c7c63e915sm2746180pgb.48.2022.03.03.13.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 13:53:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] insane: Accomodate llvm-objdump
Date: Thu,  3 Mar 2022 13:53:43 -0800
Message-Id: <20220303215343.3257206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 21:53:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162701

llvm-objdump emite MIPS_XHASH where as GNU objdump emits DT_MIPS_XHASH,
checking for shorted sequence makes this check work in both cases

mips-yoe-linux-objdump -p libx264.so.163 | grep XHASH
  DT_MIPS_XHASH        0x00000168

mips-yoe-linux-llvm-objdump -p libx264.so.163 | grep XHASH
  MIPS_XHASH        0x00000168

both are same things

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3c8d49f13bd..270b7860c7e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -429,7 +429,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
     for line in phdrs.split("\n"):
         if "SYMTAB" in line:
             has_syms = True
-        if "GNU_HASH" in line or "DT_MIPS_XHASH" in line:
+        if "GNU_HASH" in line or "MIPS_XHASH" in line:
             sane = True
         if ("[mips32]" in line or "[mips64]" in line) and d.getVar('TCLIBC') == "musl":
             sane = True
-- 
2.35.1


