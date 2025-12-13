Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CCBD5AE68
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2999.1765620084537551977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BORv5M3l;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29844c68068so24632355ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620084; x=1766224884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkN4UIIqvdwustwGi2BC4pOi25ruY6YDaMpKO9/l7Fc=;
        b=BORv5M3lAKxlqqFIinOqORGNDiWNyLbCCnuuG1yq35MrAeY3fINBXTnB1n5piDCUKu
         1+VV0tmhc8VheQ+itxiM6AsqUMRVDVaRMUhIgyuX9es+mAClrX9T4ncugJnxUeWfhhA0
         yOh6JnnIwOuTNFxUtRpFRuzE4tG7v5Sa2+76rxMVv0Bxwt1YMVXKaZWOC7a/QEd0sz0C
         /cxjazdZ+QbI/3eLe9JcGS6t5XgaMvdQGCNia+UhefrDXqsfY3XW1VnQQklc85aIQPfg
         XVpRvzu0XtduGafrujXV2pQlnzsURBzodgbvu3VXN9UvdhECAzZ2MGUCLHb1XYkJXFC+
         /iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620084; x=1766224884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkN4UIIqvdwustwGi2BC4pOi25ruY6YDaMpKO9/l7Fc=;
        b=wjof335yjgqP9o7V9jgiO0r9mh9ctAcfAbVgIxDq9bqHvZ9JUkGB7lg8A1p9JzZJuD
         nOkXEXBBNANsdEmUnrKhKQD4GHgYwH2XIn2ifV6HCRbE8vWxOb62uzOQv24skzW6GxkZ
         hbLIPaLcaYqc00Zb1/Vvug5qX0yb2Fm8sqEoSIR7tD81AxB09CbQG4osfpjrOW0rGOmP
         VCIoxa1k/u71SKXnjLP2sTJvslukD8usY/AK3I6FVes12F+dxcQPZ4SQCW7aFpPS3qTO
         gJbIv2pDYDRmOhRay1bnsWfVqrJCtDavX2JNf+IVBD/rn8+TbG5Qum8WdW9sjAz62aMQ
         X2tw==
X-Gm-Message-State: AOJu0Yzp8Gafvr8cTPiaQywT0fOgIc6NWY7aJa+8CbzwApr8Fj7f6z9J
	s1t4yyceB8C+8+s0Sjp7W6iZ+x8fCDi3yyk8tz3KJX7L4hhmMGCFNbyURAW7U81y
X-Gm-Gg: AY/fxX6ezGVAdXQon3f/NuBNEaA63gDVBJWLUhrety9Jg4FqTojUDiKlbUcwkDagtiv
	mkuZB1ZjfUJya/+LnJiWiGiCAEKTXUvm6t1hzloA8Y+7bZmHmcnyiIWUDFpUse24rhvo54KDYFk
	kk942M5b9jyjOflTOP7NOEa3goBR2C/SWKe9EUTHUYWiyztKMMrsY7l2WxNI1ShnCEQ07QA3z5h
	oTB4x5caBYtY9mgxh6QMGkASl4Z2zUdeRc9LMcj9W2qrfLHALC9TTbhqsPXzbguuJyw2OAcrMKZ
	6gKsjcOnkEXA4/wYvPm5b/PSSASPNN1l8pHic3e3qhu6p5iMG1HyDSEHVvigQjlJiKfddsHFmqT
	4jxi85gsnIPz8ZiMC0B38Yi8Tgugx7PN3Jr0X9dijoNbehbAEpSDl5VdELqgl0RhXy3PBmbiKuR
	7tcbp33P1i/vr5wkgsERWVYOZI
X-Google-Smtp-Source: AGHT+IECFFx3ojlgrsyCc6xfNjgCE0Ds6Pt7wJ4gvq8MF6XsfHj37YaO2PbdKVAFaw489A37t2zs/g==
X-Received: by 2002:a17:903:110e:b0:295:98a1:7ddb with SMTP id d9443c01a7336-29f244d4d15mr43085185ad.61.1765620083702;
        Sat, 13 Dec 2025 02:01:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 38/67] archiver.bbclass: remove workdir from patchdir
Date: Sat, 13 Dec 2025 15:29:02 +0530
Message-ID: <20251213095931.2571498-38-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227656

From: Changqing Li <changqing.li@windriver.com>

Remove build path from patchdir, file name will change from
series.subdir._master_build_tmp_work_corei7-64-wrs-linux_thin-provisioning-tools_1.1.0_sources_cargo_home_bitbake_libc-0.2.155
to
series.subdir._sources_cargo_home_bitbake_libc-0.2.155.

This can also avoid the following error when the build path is long:
File: '/layers/oe-core/meta/classes/archiver.bbclass', lineno: 262, function: do_ar_original
     0258:            series = os.path.join(ar_outdir, 'series')
 *** 0262:        with open(series, 'a') as s:
     0263:            s.write('%s -p%s\n' % (os.path.basename(local), parm['striplevel']))

Exception: OSError: [Errno 36] File name too long: '/path/to/series.subdir._path_to_tmp_work_x86-64-v3-wrs-linux_thin-provisioning-tools_1.1.0_sources_cargo_home_bitbake_libc-0.2.155'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c99d22827c9515e9fdb31d4989925aa9e9604134)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a95c899a0f..d963d28f43 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -252,7 +252,7 @@ python do_ar_original() {
         _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
         patchdir = parm.get('patchdir')
         if patchdir:
-            series = os.path.join(ar_outdir, 'series.subdir.%s' % patchdir.replace('/', '_'))
+            series = os.path.join(ar_outdir, 'series.subdir.%s' % patchdir.replace(d.getVar('WORKDIR'), '').replace('/', '_'))
         else:
             series = os.path.join(ar_outdir, 'series')
 

