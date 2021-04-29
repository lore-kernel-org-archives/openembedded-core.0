Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.5821.1619697905314268429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=joGAFYf4;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u21so99510643ejo.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bo0gFolHkW1EVCVifcrN442/CFpOk9y9JinlMnvYD1Q=;
        b=joGAFYf4dUKlj7YkoX0iQmYqI2e1FrWjYZ94cxH5fiFuxGZExSS31wBSbl+90UDXCq
         L+FY0+fED2aVwJp9v/+gW457EyCM1oqS22uwNvlGrFQiYv1LpgKBnSSum2HHlg96Rwtl
         i1Q8H1usyBTPDvLE2SOUQcJ7Lb5+aMFIwieKafwrGxLcbux57LM8TMhwoDkLjHtAuIOL
         er3VuSNBQq/SeWdsTgGanOYJiy8/AoZTbI5flMxQ75dYfq1pZzBxFGPBKY3Z93PCFJP4
         qmwsNpiRCwGQk2mIqiwTkTLuWOWEd4mxttvDlAjXDPVai8db47ibLN8BlH/ohK6k4Aex
         2LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bo0gFolHkW1EVCVifcrN442/CFpOk9y9JinlMnvYD1Q=;
        b=kK30RKIPpek2e7BAMWGrzFv9N6/bM+k2Xm5mvFiELfVyujODw7s2ic9yWdCj63GYbL
         YgXGDXy0NeD18hgj5/DzRE5sMU9iHGi7qJBNkp8eP3omtNHnuQJqxAsIxWemaMj/EcLc
         Z3O989xra5oRavTCIZTZHxvfSrPg/zSKY6ktOzCPFbWghqYUOKWjfWP8wUbYF5uIvi+S
         E2nXDuEJeexISud+o2eTdGGMx3bIQnIjm5d/xuQiW1Mr9n/8sMD469thv6vvVOt+Pvkk
         tCbTPOi/TzquUBGJuJ1FUtA8hDhoNfLMFJaq4n++/DC3pkZZg1c1dLVXVgXn0Ym7M96s
         AiiA==
X-Gm-Message-State: AOAM530Z4mNQV7u/hPhhkDzBqlpYQTGTuzGYhGnmtsN4XFVW0Vl5YRVJ
	SSIVJGywTABg7y00U0R4WBafFFGHWjw=
X-Google-Smtp-Source: ABdhPJxfrNzLSuiLGftSBmpkm80sZqmOBc3uNvzUCdWPZyM5chQH32GkDxWvkr1KE45MiPOcFYt14g==
X-Received: by 2002:a17:906:27c3:: with SMTP id k3mr14967653ejc.519.1619697903642;
        Thu, 29 Apr 2021 05:05:03 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id mf27sm1698129ejb.63.2021.04.29.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:05:03 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] rootfs.py: find .ko.gz and .ko.xz kernel modules as well
Date: Thu, 29 Apr 2021 14:04:57 +0200
Message-Id: <20210429120457.3511208-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe Chapuis <chris.chapuis@gmail.com>

* with xz PACKAGECONFIG enabled in kmod and xz module compression enabled in kernel
  the do_rootfs task doesn't run depmod in the image, because it thinks there are no modules:
  NOTE: No Kernel Modules found, not running depmod

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5f81023040..e4de0bfddf 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -305,7 +305,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-                found_ko = name.endswith(".ko")
+                found_ko = name.endswith(".ko") or name.endswith(".ko.gz") or name.endswith(".ko.xz")
                 if found_ko:
                     return found_ko
         return False
-- 
2.30.2

