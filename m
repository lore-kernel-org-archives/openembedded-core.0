Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D23C4743C
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.2526.1649470608754702463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n41oBVAw;
 spf=pass (domain: linaro.org, ip: 209.85.219.41,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f41.google.com with SMTP id hu11so8870139qvb.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0cjfWA2nQITztXmgXlpDOv/HBOY+3P9msnbsnP6AQU=;
        b=n41oBVAwDFhAuGsZpj11Uj0C7CTqGNJ8cxME7getSOHsscLL/sFZTwqpOIMVGt8+5n
         vBJ3pYkyes+wvIbyFcB9mBvc5ljwtj0NcefBRplJEWiz2aniBr9hGQX+xl9S7uiUpylw
         pjd0lrQAnUaZQTseL0TzWVDaarT48aYTTfl5kxwPxwccbPLZv0CcH+e45ID/lcB8dFdz
         IsVa3Hv+sUHBdzq6WL2fKIh7zdXKsshzsmNC5YeRvc7i1P8EqvSLXm2gnqjvUD5zp1CM
         RwyRDgy6rgzf8MmSflT5O15MsP94l1r6wFAG3+fO89FJzyUelf++//jaq6r0NiXXckd1
         ij3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0cjfWA2nQITztXmgXlpDOv/HBOY+3P9msnbsnP6AQU=;
        b=xygivWU5rpZdKcAJ6POEZt711MfhC6Uky/3cJy852yjq5I6hHcm51FpUGsROd0dZSj
         Lk9FUPJ29ZJvcOTPuMCs2ilqh/PDVwHgK7919qtZEDmhWDLUqQ18z7tRGKkGYZ5k2CUO
         oN+YW+Ls/SZwG7ZFSoLJwzvwTLgnupMYAMem5Qqx2TP7AVcdSQa7kIrr/IORQlGxiSwK
         pvKN5T+wADN1aQOQPjcemV0N9KbIXSqblBcKxABFjzdngf/Z7yB89d9wDBZrCiazGDQX
         g2WJc3wSNtOUKoP+H11yYH2q+SXbbLFq63zhzQ/c81s4WHhyLmiVNNqSWZO4c8SPMcSE
         lILA==
X-Gm-Message-State: AOAM532w+RcDP3rMuZm9KU25tkvt6B1/BW4d50QfSsa8s57emXhgKRLQ
	kgDEZEmJ5BG37gPlNdjmsKDwqlSJvy7kBg==
X-Google-Smtp-Source: 
 ABdhPJyh54Dne+wAaNkeLo+Sk0G4Mnku+xY16ChEQklL52EBiaUQoFF3ldgcaEHbRNBqsrDAAX30rA==
X-Received: by 2002:ad4:5ec6:0:b0:443:ca04:91e0 with SMTP id
 jm6-20020ad45ec6000000b00443ca0491e0mr18355472qvb.2.1649470607876;
        Fri, 08 Apr 2022 19:16:47 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 t67-20020ae9df46000000b006809a144ac1sm15413368qkf.99.2022.04.08.19.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:16:47 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] gzip: upgrade 1.11 -> 1.12
Date: Fri,  8 Apr 2022 22:16:44 -0400
Message-Id: <20220409021644.201219-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164180

This includes a fix for CVE-2022-1271.

The existing "wrong path" patch needed to be refreshed, because the
context changed due to the following upstream change:
https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=31193bbd13cd2807d8ccaa2ba5b072303d5425e7

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../{gzip-1.11 => gzip-1.12}/wrong-path-fix.patch  | 14 +++++++-------
 .../gzip/{gzip_1.11.bb => gzip_1.12.bb}            |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/gzip/{gzip-1.11 => gzip-1.12}/wrong-path-fix.patch (79%)
 rename meta/recipes-extended/gzip/{gzip_1.11.bb => gzip_1.12.bb} (94%)

diff --git a/meta/recipes-extended/gzip/gzip-1.11/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch
similarity index 79%
rename from meta/recipes-extended/gzip/gzip-1.11/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch
index 7c37bc8d2d..7f9e249de8 100644
--- a/meta/recipes-extended/gzip/gzip-1.11/wrong-path-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch
@@ -18,19 +18,19 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d4ecc3f..e4657d2 100644
+index 4f51b61..80a5ddf 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -82,8 +82,7 @@ SUFFIXES = .in
+@@ -93,8 +93,7 @@ SUFFIXES = .in
  .in:
  	$(AM_V_GEN)rm -f $@-t $@ \
-           && sed \
+ 	  && sed \
 -		-e 's|/bin/sh|$(SHELL)|g' \
 -		-e 's|[@]GREP@|$(GREP)|g' \
 +		-e 's|[@]GREP@|$(base_bindir)/grep|g' \
- 		-e 's|[@]VERSION@|$(VERSION)|g' \
- 		$(srcdir)/$@.in >$@-t \
- 	  && chmod a=rx $@-t \
--- 
+ 		-e "s|'gzip'|$(GZIP_TRANSFORMED)|g" \
+ 		-e "s|'zdiff'|$(ZDIFF_TRANSFORMED)|g" \
+ 		-e "s|'zgrep'|$(ZGREP_TRANSFORMED)|g" \
+--
 2.7.4
 
diff --git a/meta/recipes-extended/gzip/gzip_1.11.bb b/meta/recipes-extended/gzip/gzip_1.12.bb
similarity index 94%
rename from meta/recipes-extended/gzip/gzip_1.11.bb
rename to meta/recipes-extended/gzip/gzip_1.12.bb
index 321c9c31a4..14de50b230 100644
--- a/meta/recipes-extended/gzip/gzip_1.11.bb
+++ b/meta/recipes-extended/gzip/gzip_1.12.bb
@@ -38,4 +38,4 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[sha256sum] = "3e8a0e0c45bad3009341dce17d71536c4c655d9313039021ce7554a26cd50ed9"
+SRC_URI[sha256sum] = "5b4fb14d38314e09f2fc8a1c510e7cd540a3ea0e3eb9b0420046b82c3bf41085"
-- 
2.25.1


