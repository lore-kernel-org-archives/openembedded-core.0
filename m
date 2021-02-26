Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web12.10012.1614349694392712992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dpxzLMrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id k2so4343117ioh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2gbOBkvYnkvtsqciEWiKU/Xf1ILJc7B4oMrMJ/uPNd4=;
        b=dpxzLMrLSLdti8xsp2AQxLRwM2EztjixQY8Q940M246Dqp8EKyji8cIlnYWmoZx9RP
         W6ZmQDQUjlHRn/b67r5KqGyda2IyzLFs+qpXsCVx8mJH4RaNAKcPPVWL6uWbzmLi6wIK
         BfaaLRcDu9CuuPmD/Eo9QBkQNtzwljFwOEPaooPeAuAMSJOzkRgRt+rDbJnaETMh9jmk
         f/exj9TNvB0UIJlzJXQR85uzASEZlMu/0N/9knl2ZkDqAa3KkIcWdrRBYdZKVd0lVXnq
         PXfPUoHd/NZEDiDw5wC4y3paDpOuGVfC0Y0HxUqPJfRGZqSAKSEpU035O+oxmjaGHW6C
         vSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2gbOBkvYnkvtsqciEWiKU/Xf1ILJc7B4oMrMJ/uPNd4=;
        b=gICWlRkf1WdIg1l3ygc9VjIEx1IKX97RX3fCzPSQNfSJb/LxM+WGo231ijj6WdCqNn
         TNJM0aX8mFdmAo3DxOwm3cuwL29ueurbUj3KvzR7sJhk/5/P4+OL57FUzf+UICMleQuh
         tGWo56nvi133wXPXOo2qgKlCQ/sCjiREut5cxHATinlN3LVH5u20JkmLLUz2noaOhlpP
         gg9ao9prinko7Qq2US+hiCKpikhZ57YczR1oCzUwAFH5FW6PY/OKqFY4ygjMXr5NCHFs
         NoQa33yNqU9oOwps8+YfUdwr0goyF6LSvBIEeDGR0DlzfXofriy9ALZRmyzj1rV04ZRA
         ZqHA==
X-Gm-Message-State: AOAM531HYAIlfGwcs8GFq240Blz5159DxhdcUp6zgVB3C38uFFqVYE/G
	9TAm1DWbE00ie8/eZQ5Per+HdNARNxN8THxN
X-Google-Smtp-Source: ABdhPJwHLHqLtk7H1sMId0Jn8pbDeYYk3KGSzgj8tsjnQUe49ZHsCdDLz36Cqrteb9ibkXntgRmwwA==
X-Received: by 2002:a05:6602:14c6:: with SMTP id b6mr3067316iow.104.1614349693273;
        Fri, 26 Feb 2021 06:28:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.28.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:28:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/40] oe/recipeutils: Fix copying patches when BBLAYERS entries are not normalised
Date: Fri, 26 Feb 2021 04:24:21 -1000
Message-Id: <7779d1a15b8f28ffdd66332c6ed99815e243675d.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

`devtool` uses `copy_recipe_files` for the upgrade operation when
creating the new, workspace recipe. Before handling the copy operations,
the function checks the entry in `SRC_URI` against `FILE` while in turn
uses absolute paths. When BBLAYERS contains entries that are not
normalised, this check will fail resulting in having the recipe in the
workspace without the initial patches.

Signef-off-by: Robert Drab <robert.drab@huawei.com>
Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 777fc24ab2c332954b56dac28cd9b3032808828c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index fde1ad3ddd..f36a2fb0ac 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -409,7 +409,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
                 fetch.download()
             for pth in fetch.localpaths():
                 if pth not in localpaths:
-                    localpaths.append(pth)
+                    localpaths.append(os.path.abspath(pth))
             uri_values.append(srcuri)
 
     fetch_urls(d)
-- 
2.25.1

