Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79187C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 17:20:42 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16041.1789752036059450183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 10:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WHUNnVHI;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so5919355e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789752034; x=1790356834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CPNfWERwwyckltw38Y1FC+hA6gzkS4j2oPw7iZ69OHI=;
        b=WHUNnVHIeF+adDTpRBN6j6EBGiZlLj+82qw+7XYR3dHI162FvxuiPXM9pS0AgCJo75
         zDMr6oZr/2Ds3NfTZDKgpgpLZanXGDPwHhl5cbEOo4FkGTy54luHP4GwsfeAuCB4C9+D
         Al+ypsir0MPxf5dfkcQVk5lzpukqkbAVFw02g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752034; x=1790356834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CPNfWERwwyckltw38Y1FC+hA6gzkS4j2oPw7iZ69OHI=;
        b=A8nTTnju+neSnRv1v/Hp5iYrzqsKXcPXr2847iP7DC5sT+w3oAMFJdQtulSPMZLL0z
         k/d9HpkUE3qaZHRxu9uTdJoygmtmCGtBWBJtZrK+20kEyZQqA0fAhknJ/ObGc/mr9JP6
         wxm0pt+AO9RpbHa/9kGZdv/q1dpneNSW1g5sacdTpcFdLO4Zr/gjHPoyqOLDBUc4dz/w
         5CVykdJFsCy0Nazx/LUqB+zIhavvPtX1JSqhSvv52HPAF85ml8/niWqEQ/IUzDYL137e
         xJdZEzmvHteRzvJi2MZVS09CKmgoc00iojrn9oTZyy968gyoEDTa3/n1XQYccrkRAbYK
         xgkw==
X-Gm-Message-State: AFuF++nic7L5pnY+j+XmE/6zP4npe22OuG/KRHhjBs4m02Dcsq5uDgr4
	F6OsvMmxw3TLCNaTMCr+lJcsAGiI2rIVfc+NwRairq0mrd69+UsxpmHl2BexsPxie/8YysIpK9S
	chicrOY4=
X-Gm-Gg: AYBFou0RdPdWkftFRzpTrXrgX4f1FqYToAhOc9kyWZcYpq8sOcptcoKytPavxFH1iPp
	KPmxMVxacnnwbQiBFD/jfy4oLfOOrmQnmzi7D8+qhnfJuGJDkpV9AnrgH2+y145YQ5KpW1HaG0l
	zvVSFJznpzkJLkbu0pE2qFFkCTXME2UN02Vaii70GH2JUChq6XV6W0ei1YmgicxdiFlQGAFcUCy
	lwc6BK9mAmJSIoUWN3F/iqrDhVMQtgFfpO4T8DWrbldfisYo4QqSFiQLQLT76amBcOzDmMOKx/b
	OA0T7pZBVUcpiC5x4XdgzIXZdka49VcHaTc4r9kldzdveUfmdNQyOPuoUq0UVOUJfWayCTGesxK
	duNh567zui4H04mbSuFq7ufFu3kUUQp8TmBW6Edf++uHcm3VCX0EsYBaGJ/F2OIugeEHc6SunqM
	tk6xlehKCXXERbbUGi/d3JhtpsOfRtkQ5WklBivpRTZ5kDsBYHlvaf5FMvP9e7RKlCHeCHkhX+0
	NvRBiewWJop2ydGurG6+2+7TlU=
X-Received: by 2002:a05:600c:1daa:b0:49c:fc6c:bdfc with SMTP id 5b1f17b1804b1-49fc574643bmr39070035e9.19.1789752034041;
        Fri, 18 Sep 2026 10:20:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm71174935e9.2.2026.09.18.10.20.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:20:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] m4: Add missing ptest locale dependencies
Date: Fri, 18 Sep 2026 18:20:29 +0100
Message-ID: <20260918172031.2871246-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
References: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 17:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246220

With the locale configure values set correctly in the site files, it highlights
missing test dependencies. Add those and also remove the previous configure
workarounds for locales which are now not needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/m4/m4-1.4.21.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.21.inc b/meta/recipes-devtools/m4/m4-1.4.21.inc
index 3be6a521a86..41f8021d025 100644
--- a/meta/recipes-devtools/m4/m4-1.4.21.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
@@ -47,14 +47,15 @@ do_install_ptest() {
                      ${D}${PTEST_PATH}/tests/test-xalloc-die
 }
 
-do_install_ptest:append:libc-glibc() {
-                sed -i -e  "s;LOCALE_FR='fr_FR';LOCALE_FR='fr_FR.iso88591';g" \
-                       -e  "s;LOCALE_FR_UTF8='none';LOCALE_FR_UTF8='fr_FR.utf8';g" ${D}${PTEST_PATH}/tests/Makefile
-}
-
 RDEPENDS:${PN}-ptest += "make coreutils diffutils bash locale-base-fr-fr"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
+     locale-base-ja-jp.euc-jp \
      locale-base-fr-fr.iso-8859-1 \
+     locale-base-tr-tr \
+     locale-base-en-us \
+     locale-base-zh-cn.gb18030 \
      glibc-gconv-iso8859-1 \
+     glibc-gconv-euc-jp \
+     glibc-gconv-gb18030 \
 "

