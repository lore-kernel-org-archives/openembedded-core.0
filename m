Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.31.1613667411941610549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E45VMGcn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o10so3148109wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aJD9amSFfv/tsHdrMv7WPLhfxDYjZZaCaFIsHxRr0Wk=;
        b=E45VMGcncIMRmt/Nqif3bUIPO/PA2mHcl6tLfWUVb8tiyqOHFE58sQLHfK9wr3hbVH
         JSFOEbue+ozlbwV0QChIXElMrhSu8nHWKBOz7a/GkVIWgcrDyMP+hbqkXr59tIQWhRns
         ztBdxTRAXeLiCx+mhLXQFgR4AkTS1E9p9/pek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJD9amSFfv/tsHdrMv7WPLhfxDYjZZaCaFIsHxRr0Wk=;
        b=IcCivew90xpj+0rPu5IQBLpkHFnHgZe0xTxgUx2qtzz09nSuAWJsJhKnDNGRUjhACa
         bHH6GI7WYsIjX/x/bUouyzQW7XQN1QX3BR4h3znSNqgPUzpfOHG09cc5pkSwHZQMJbX/
         IbcnoQCdnY7TNuiI9pR2zufWxUBql39X9ktiwuqt27tt2aPRxywA5fvWQuWlSsEt+JwV
         ZPP1A1x1SNuEL9dDrbze27hGWIP9DjMeOOgq4AFbo9oE20sg0R/gbAS6eE9O7oacFVsQ
         H5+C/HPszt9llsMceSAD8DNI4p6Pak0J/EkSkEafCkLDjb7/AZFrWYDEjtJE0S9vkF4+
         TaxQ==
X-Gm-Message-State: AOAM530wQ4mpePZ8k8FLU6iq4aSzqvQBWi7jCsy0idPqe2JbtdH4+4T2
	Yc5mN5n5GkzxcDK7tp7IhtxLD14OIOmimw==
X-Google-Smtp-Source: ABdhPJxQ27PkY05am2BBDIBTG3dIx4pCxJwGy8DXguNZtAs6UIB6DLlQm1r/XnWJHoFyo5lv2xMa1A==
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr4469042wmp.8.1613667410346;
        Thu, 18 Feb 2021 08:56:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:50 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] license_image: Don't canonicalise INCOMPATIBLE_LICENSE
Date: Thu, 18 Feb 2021 16:56:41 +0000
Message-Id: <20210218165646.2109894-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code internally correctly handles canonicalisation of these license
fields, we shouldn't call it manually. The issue is that the fields can
contain wildcards and GPLv3* means something quite different to GPLv3-only*.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license_image.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 36ddd84805b..c96b032ebd4 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -40,7 +40,6 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     import stat
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
-    bad_licenses = [canonical_license(d, l) for l in bad_licenses]
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
     whitelist = []
-- 
2.27.0

