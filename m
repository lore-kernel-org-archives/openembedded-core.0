Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902C3C982DE
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 17:20:43 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16179.1789752038132879896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 10:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KG2ifsqb;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so6241825e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789752036; x=1790356836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5vxwNTGOnUmgmGoCvgVRTiduhQ3GpO4Jk7ZV5SCDA78=;
        b=KG2ifsqbHZyPYpb0mPO+BPbukkJjNdfzT9bjLhXljT4PJyje/z14kMQg1BiwHQsp2F
         NQ/ZHO54ycIZO+vS/iXwr6iMLsf+OPP0zeF54RDGGlyV7CSOwiO4B51O80wj5HVTvi4H
         SX/JL1wHaZpHzPQxVWdKMZQIjnpU0p8upk6gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752036; x=1790356836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5vxwNTGOnUmgmGoCvgVRTiduhQ3GpO4Jk7ZV5SCDA78=;
        b=EDzEoDBAsBZWyRiIoGuibVljfUydH9oNd5r9bMMuIa+H9o3Zj5hNoFkPg7JGhfUQbB
         AXZGUTTmHD0ap0/TjOHHZguy0F40Oq+fj3dfEalGn/herbQGKggInGs6kfxk6EAQLuS0
         bFSIDFtP7gwjk5msfJxobVl4lcp4HVbJIn4pSsRJq/hEgNFejh2ubi2rZxGlHJX7MUpR
         XHtBPbPrVzzNbUrfP6nQEAQkHXZrXDxvdtYAjA2SK65vU0zp1Urj0pjwYrI6z6QHvVuu
         ZiV0qWW5SHgOTOugB/GEzKKhxzcGinbP7JxT49dgUhfKx1ks/Vo7iBqCnTuLzb6PDCbS
         dvrA==
X-Gm-Message-State: AFuF++lRNwlENaU/nz4MwaJPrA7q9UiMTEjs5nbcge82G8u6Y6FtvZj7
	hjevLZO6xxZumxLmeqqFXhLdFh/YYg3mOIQ94rPDUkhKWH+JuTsfDtxbCmUt75+/RGzZv3ALTOa
	d0bROwIo=
X-Gm-Gg: AYBFou3f6AGgCxbsmx6zyYYPXeZiQwZ7186e0A0oskKdHM3l4t4Ft6IlCNJCnpT6ZR3
	f6tBflfaRaeftqeX5s6eb6P82a7+UhzUr5mfnExtgTuULtAzHvkj3KO/MIsrCtD6PjG9GSVHCqj
	hDh9Or67UG8y1eGDFInMo5L7ioKvDo+WggeCFk0mc+p79qaQOCNu+4z1eNQ5Iqv3+iKYuhQb/OL
	j+EeACSm/SZIBl/eb2uGWtpfa0P16eXzopfaiCIEMFOT1kzRk9US6PWAnwPJgTC2Jm4hcz89jBc
	u+fREpC+qxSXDcxw/ZSqbyuArijt7gndovC4iH9O8VfdKwdorsJZZcjlhaHvDT8XWyTDSnuEyDa
	zcUa2UFBRPDPQMHmuav2wytW2jxfJgbqKUUglfw/gaP3lDfnqid2WxOFj5kGc9+DgTtBdDK2AUM
	y8PvUeXk1uc/k6/FVohqt3o9YirJWi8cLZuYYFFpvoiuRLpwl5UiuKbqXONdzNxG1E7ykJzW5iZ
	HSNMJb/TMRAXe3saTa/NR3mLyo=
X-Received: by 2002:a05:600c:1552:b0:49c:fc6e:a3df with SMTP id 5b1f17b1804b1-49fcc2b2785mr21016075e9.30.1789752036367;
        Fri, 18 Sep 2026 10:20:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm71174935e9.2.2026.09.18.10.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:20:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] gettext: Add missing locale ptest dependency
Date: Fri, 18 Sep 2026 18:20:31 +0100
Message-ID: <20260918172031.2871246-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
References: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 17:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246222

The site files handle the fr locale now.

Add a missing locale dependency so tests work with the new site file
entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_1.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index ce1d698260d..8a93ce1b49d 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -50,8 +50,6 @@ EXTRA_OECONF += "--without-lispdir \
                 "
 EXTRA_OECONF:append:class-target = " \
                  --with-bisonlocaledir=${datadir}/locale \
-                 gt_cv_locale_fr_utf8=fr_FR \
-                 gt_cv_locale_fr=fr_FR.ISO-8859-1 \
                  gt_cv_locale_de_utf8=de_DE \
                  gt_cv_locale_de=de_DE.ISO-8859-1 \
 "
@@ -224,6 +222,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
 RRECOMMENDS:${PN}-ptest:append:libc-glibc = "\
     locale-base-de-de.iso-8859-1 \
     locale-base-fr-fr.iso-8859-1 \
+    locale-base-ja-jp.euc-jp \
 "
 
 BBCLASSEXTEND = "native nativesdk"

