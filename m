Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6381.1620287463445637631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 00:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dqrC+prl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id a10-20020a05600c068ab029014dcda1971aso2668482wmn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 00:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=My94w2eTXXKYNhK2BluWLDRCtA7N6OnVo2pnhPQGU8s=;
        b=dqrC+prle/u61lBPX8fXudmx2SuPzUjDF4sCTtMQyX+T4drssxQUfOf0CRfTsg1SUH
         8OZl3BtWBx0IS3GimxMB7j9sAXOQGuh0YUrGSgmzapbhGC6Bpd0Prc1bZR9EHd1KGYDP
         4dFmdmJihNklJSLhrK7/hxSl+QNS+fAUzSenk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=My94w2eTXXKYNhK2BluWLDRCtA7N6OnVo2pnhPQGU8s=;
        b=fR6AzW4cQ4SSj764o9zoeMUDdTbJqZv26ch+RXgPe5kiwzdfKjxR7xa/mnEGqzkOZ+
         VoxeEMzQPACySsTjznMZXQCPLMdcosptjQ2awC6Gp9LEvDuoFYixSlQUzOhAjPVA0LLA
         BDqfKUjrg3F/w5nFe3qkGSUIy9QGgW3vi+9/6INK9u6yDBa47TmW5kEIvptyQUXmriwz
         L5vwMQaYrhCMVZiAmy7CqGt7KtJ+2qYSPR2nOH9N7Xl9PtwMj/23EWM96dJ+0yJA+usX
         Jalmn4tGbdtxVleZq1aq3Tqw28izqa7FBOepYv47GpFTXM4z6Mb17IOYXD2s/DkUBfmk
         NzUw==
X-Gm-Message-State: AOAM5329SnVdviDSCRZD8rF2K0Pc+IspgT6XoGqdz/qGNNnfJWFwNKJo
	8QZGa5U71cKCoBnSm7HLt/4U3awBekgq3w==
X-Google-Smtp-Source: ABdhPJwPS1CHmWYWA/pY3RCr9pwzfLgWYuOR1hpY+dAKy9higV35JAbGR1mYvENaOAokjeZ2EC1JHg==
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr2439610wma.121.1620287461938;
        Thu, 06 May 2021 00:51:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id q16sm2251437wmj.24.2021.05.06.00.51.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 00:51:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Date: Thu,  6 May 2021 08:51:00 +0100
Message-Id: <20210506075100.1984260-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
References: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the scripts/postinst-intercepts is owned by root/root then the copyfile() calls
will fail due to chown issues. We don't care about ownership of these files so
use shutil.copy() instead which won't perform any chown.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 8e7128b1958..4d22bc0296c 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -189,7 +189,7 @@ class PackageManager(object, metaclass=ABCMeta):
         bb.utils.remove(self.intercepts_dir, True)
         bb.utils.mkdirhier(self.intercepts_dir)
         for intercept in postinst_intercepts:
-            bb.utils.copyfile(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
+            shutil.copy(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
 
     @abstractmethod
     def _handle_intercept_failure(self, failed_script):
-- 
2.30.2

