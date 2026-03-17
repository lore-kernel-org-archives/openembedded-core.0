Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B42FB5E9D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65245.1773705817775732104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nj0qok37;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b96d784828bso781723366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705816; x=1774310616; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU48mfeLafroqGwpfZT9e8T8l7jd+s8URdc22F4rldY=;
        b=nj0qok37/naOs4WCh2hamVnPHe5zWYCBkChEfbLsVWfOazSClk/tDBKjYlo2lR6kkI
         xwcM8uPaE6qhaJeJl+lN0Pd6bjYxkFY1k+7kOnUeFMkeghHLNGUVe0ETDQCyKdDphxpy
         EnHwcQoACgbxswgGVhDqI/y7APZAp3Wt2Rh49QMufg1lwL7hPjv3JCenuyazaNuTuGA2
         tTCpzyiFK93wJZxOyARu9lf8o/AEI2nNDed4uGwRz/0ERRt2ecFTN7v7XmcS4brwvJc8
         nZMRaaH82St/qR+2FPYG3XtDKLkOSYMxERZNG3Z9nWJo1aneDL6IxCvba30S7DJbTOPE
         f6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705816; x=1774310616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wU48mfeLafroqGwpfZT9e8T8l7jd+s8URdc22F4rldY=;
        b=Dw2RGdd7YqPqnAxc92tpkXCrRkO2wYR4TvzTeUBoGCHngHxjhtMXNLnqBlbJ/thrgt
         qLyl8NKyzyctPv0S63Yq3MlxEnJVKv+w87nBJdN+JdOXaE5pO29aekLDC7t9UsFlH47O
         m4EkP3+dXUsFtWgBF9M5LD+GLpRSQouMsRXKnj+CgvVQNSouhyDI5BTigwugv6Simnz6
         l90SJN4RFLbI+0WjFMZJkHZz3K0B2paXI5tWm0gWYClt0OKtjSHTIjrnTsQ9vBr82/kA
         QWzb9eA3+Wp8wQ7uQ3mPMpIa9x9Ndk8+lRyiZZ2Ya6L7rhd3MohIs1oeP3SbDA6lGwf/
         ZixA==
X-Gm-Message-State: AOJu0Yyrob/OBYP4o3ITHLedzNPnZ1iJtf25k8Alh9Kl/4vXScrNgr92
	VyZP/SFIwslvxuztxuD99Mi9hsgy6i1os8xl0msztXrt2luHZTEKzOXyIbLfhi8O
X-Gm-Gg: ATEYQzylJsliqMl7YumilwpzJTOV1zvnW3vSLC6/Z7SUchg8Uh66ZoFoW6tTCLPNAND
	+hrF5Zg6iEdzqTimB8YhaIPL4LRvcdIL0v6Lfhj6kSjSwY8Kq6suTSprcahDiL1b/eVLjL4CwiU
	mUb7Ia7tu0nkNuXwURLNgvBP6Uc/oVyILi0Vu+pbAwLrG3L7iaauGJnJIS4TNh0t4vcBQ1piFZw
	tB/s6VscPrJorCM1OJv3DYCC3tI+fGBOOVFthsdVW1Npe90vOgDPFRT4P6e3GkvSVdC9FqzMNFE
	o8vkb8ct9Kcbro9zL6kKCUkZDXsHfieCbeXR/KxHmz7hGNzFZ2ZsJ1ORfTGRGSuSeu2V4BwuU4X
	/DMippDnPlINLGsDMzgoFPm9V1M6RD6Mm9oIQf5U5XwcUO7n79+Dyhf4w6j1buLyoDa31kMnQ3a
	OCBjSwM1y+TLboswvXoKt5L4qc2wQ8x90++3NPBJJ3rpvtXD0y3wUWQaU=
X-Received: by 2002:a17:906:794e:b0:b97:ba66:167f with SMTP id a640c23a62f3a-b97ba661f5emr394408466b.42.1773705815951;
        Mon, 16 Mar 2026 17:03:35 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:35 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:07 +0100
Subject: [PATCH v2 03/12] expat: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-3-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233276

While in this case `EXTRA_OECMAKE:class-native +=` wouldn't result in
any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-native =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/expat/expat_2.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index 95a1ed52c4..b3a9d8aa2d 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
 SRC_URI[sha256sum] = "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
 
-EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
+EXTRA_OECMAKE:append:class-native = " -DEXPAT_BUILD_DOCS=OFF"
 
 RDEPENDS:${PN}-ptest += "bash"
 

-- 
2.53.0


