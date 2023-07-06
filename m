Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF410C001B0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:06:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.26457.1688656009767428487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3hpRtOJY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8baa836a5so5074645ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656009; x=1691248009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqc9BN5XVOocZULuj2mim6dP/aM108IFp3F2xe/ai18=;
        b=3hpRtOJYSGsBT8bKWXFlgUvBhPKc/zcU6AklgXwnwwvmSr7/0JW8oRYBVi6wUZo5Bi
         9F1gA7lWHVuj0pjNUNxgTPrLreSobsrTGxL2r54iAMb9N/jc3TNi/+/G+6123Df705th
         6cfoXlQMKDUFm0dN2600dt1bBKk2CGSX/jwqKQQXaxuvUM6+XshAq//829/vwwpgO41/
         4emJOzf1GDUdapraA6YAgu8rOyIdkTtgj34fSzT3dpRLHkSI7y2P7nv/Rn/HhVc3F8eZ
         Fck8O9K/B+wmeKahEiJY+1+qx6XYSEtkOKKU4cpV0UoBeXvnJLCR5fivwlZKCWY2aHrF
         1Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656009; x=1691248009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqc9BN5XVOocZULuj2mim6dP/aM108IFp3F2xe/ai18=;
        b=VrxGkjtta/iMhvBWsM4w2W8jt4KDLjETT6Us/qx9Ur8I4/C5VHwdfb+fyu6I5/k+Is
         /rcaDYK2P+XsTqnVxrwvu5+qs1TqGh/I7jncgTpimcTzXezAg+5Zv17xmpxFCurNOFBq
         saF1Vj4new8oFlvD44WETP0rKRJ4pfzQ7Nw82FjhUE9/OYQLtpEov+iuUd4lqhTuUxBo
         iU903XFkWvu1vssNiMcv1r5w8FBm0RU9JTXfPODqv3VF2Key8Z7dt3ywE3F3SPg+HleW
         +fKycoyxFn7fFl2LGwESdKpX37WZ+hcn+e/sNH0WOvPQEOnD+UfTgSGk2imsYhMyW/Bh
         E+Aw==
X-Gm-Message-State: ABy/qLbSl1p52y0dHcTgPaEoE0hlsH5UanzwSL4RDfg4oHkUutNstZwc
	16t+YTeHHylOXFM9zyBRlKjlTOYhhYIXgVAFAHY=
X-Google-Smtp-Source: APBJJlHATKNF2KqHuJiyEI8dgXSAcliZkxzUx7yD2YupBWuwjpLcvADcC72HBlirXk+c6tQnSefh1A==
X-Received: by 2002:a17:902:b942:b0:1b3:f8db:6f0c with SMTP id h2-20020a170902b94200b001b3f8db6f0cmr2039324pls.58.1688656008918;
        Thu, 06 Jul 2023 08:06:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/28] libxcrypt: fix hard-coded ".so" extension
Date: Thu,  6 Jul 2023 05:06:07 -1000
Message-Id: <87d3ad23643abff47ac35ca14f8b4b4bb9ee80da.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183957

From: Etienne Cordonnier <ecordonnier@snap.com>

2 issues:
- the .so extension is hard-coded, and therefore the libxcryt package compiled with
  meta-darwin is empty, because the dylib files are not contained in FILES_${PN}
- nothing actually produces a file libcrypt-*.so (the symlink file is libcrypt.so, without dash), thus
  defining FILES:${PN} manually to contain libcrypt-*.so has no effect.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed6bfa2428b4f1ba7f09d6e9e67c462ff355153)
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b0381076..454a55d73d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,12 +17,6 @@ SRC_URI += "file://fix_cflags_handling.patch"
 
 PROVIDES = "virtual/crypt"
 
-FILES:${PN} = "${libdir}/libcrypt*.so.* \
-               ${libdir}/libcrypt-*.so \
-               ${libdir}/libowcrypt*.so.* \
-               ${libdir}/libowcrypt-*.so \
-"
-
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-- 
2.34.1


