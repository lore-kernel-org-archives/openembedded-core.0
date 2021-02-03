Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.9495.1612361057877665986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EqgAjhyl;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id i9so5357009wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Th6AOXZ+aXGjdFo1uNlhJnA+jnk7ns2KBHuYV2GIhG4=;
        b=EqgAjhylAOwurbBydTKGmWvPiBn8IqKnBAOFFuRnRF/l1qfBhhJBGWtXLxRyXrWFmu
         TJsvvv6Uec2lqDbzfWEDKlmpWvbs+/eWwF6Hx7FHnuu4ZOLIkMMapdpy0U7/mvu4VRsH
         FANZpu8tK1D7LzVmLCnyB7lhbMmjnoeUVS3KDunqqOh9gGu3gs9SeFrLsgD3cvFPQ1oG
         7eUYHWe/w9RLmuj6ouo0EdbaUTOyqRchm0MgiS93jun/tYAztneMkL3orGrmhGI4vOl3
         wJrMypunEqPIEqeT+XAubDbGlLuYEJ2B1biat7DBGdB2chbFcdH2/F4QnOu8LNApoygZ
         zHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Th6AOXZ+aXGjdFo1uNlhJnA+jnk7ns2KBHuYV2GIhG4=;
        b=CNisJE16yU/zh1LnQzCFwJB2fWybqmgLd9i8qG0/xUzgiJPIMoqSlYtgEiObt7N6ek
         4C8SwXKb97pBBKlonidBv4qlG21PiuMiU9NFxiwr0lK+EhsanERymiqvbHs1JDGCjUwq
         tqCkg7ppNCPoUFQRaYX9jxMG6MP9nxzhaH7vTegW8bSE5PwFJ/4Vh+BJBhPrDwjgdJGr
         H7Zzs8y1vFDpsZ5hEjknsLDzb9ppBFfNKiAinyNdvXsMiUTuxaA8xam0FPXAQ1oRwjiu
         dv2ZEynsRyDee4JRqkl0aBaX3ngF7kriICUSsf08KVsxirLicxsY/doksPRtoMPA5Uys
         nKeA==
X-Gm-Message-State: AOAM530kyB49CoLnccLh+jeRmEAKm1YVaPXkeYFYhju4zVfw/zdsYt43
	KV4+Qn7b7IrN6eVNt03m9DTXtW+gEJsH5w==
X-Google-Smtp-Source: ABdhPJyM5lbsGuCqL8RT9Br2jwBHQr68LkT9Luyfa6C1rAYWUZVMLuQWHh4PoqhkJMESpIEe07g1ZA==
X-Received: by 2002:a1c:7301:: with SMTP id d1mr2952890wmb.33.1612361056322;
        Wed, 03 Feb 2021 06:04:16 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([41.202.219.240])
        by smtp.gmail.com with ESMTPSA id m10sm3903005wro.7.2021.02.03.06.04.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:04:13 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][RFC PATCH 3/3] package: Remove false positive lic warnings
Date: Wed,  3 Feb 2021 15:03:41 +0100
Message-Id: <20210203140341.130251-3-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203140341.130251-1-idadelm@gmail.com>
References: <20210203140341.130251-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added text to distinguish licenses from sources and those from recipes when warnings are outputed.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 14c8475cfa..782d9d00b3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1780,8 +1780,9 @@ fi
                             computedpkglicsperpkg.add(lic_)
                     else:
                         computedpkglicsperpkg.add(l)
+            # Displays warnings for licenses found in the recipes and not sources
             if spdx_lic - computedpkglicsperpkg:
-                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglicsperpkg, spdx_lic))
+                bb.warn("License for package %s is %s (source SPDX headers) vs %s (LICENSE)" % (pkg, computedpkglicsperpkg, spdx_lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

