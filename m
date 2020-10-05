Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1776.1601938654482324623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 15:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kspXaAzN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id m15so257051pls.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=E267dWagmBKYRx0z+R+Y3VBUOEjyU+IvLj6QaFDMiUU=;
        b=kspXaAzNNRAp5AzLh//MQgVe2a+snQQMRPP8WTAsU57P02GglgGX4R/jw4sKOV5EgI
         RvQxHQ0E5D72i79mVNEBVPtWJHuCLvQT//7cid9xaMfheqop6c7tOytMr2x0DU3HBSp3
         WUVYX6nK1tdmNzxI3f6VQGVT6UFJIa0YOk/sJ3QOdLHVYfyABwgmXizgUFYr6YmXpBi8
         5kQ/glbKU+uMZEte+fsayurhjSY0ynXra+rS1zydzXxezVLM4ccr4NkGglls8ZQfS33a
         ssOLBcglJKoMnp+/IJGLTp/EGZuqb7pRCy9y7SKDc6vbUQY15Z3z2JYorE8T9SYwrNva
         50iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=E267dWagmBKYRx0z+R+Y3VBUOEjyU+IvLj6QaFDMiUU=;
        b=lfza0cCLNwVR2xYTQlyH5wxdHI6JJZ7k0hR1LdveojSsKX6iik4ap6XOCMhLA1Jodo
         aU5ed/Ehl2np3TSjM2qS2BIxe6cExMQwLgV4xVdMHiy2ZgtSg/s+DzI9yrVdHRS3UAaM
         yyT4LjjM2AtsUG4uzXp/3mPVoaFltyPb6LeZL9680YXAeNqKvdjivkUPw73hjX0QYfhO
         3hSaatTIhMIxULLwOYgKGKMW+X9qVabNHNyP6k3j6FMz50gNLAXfIMQiLYT7nQOTQAku
         bdKwGEcWAKoKw2upDqvatg/B5MbRXb7qg9k8/+nkYFp459wP84MI71AVpCM9nG2mPNuj
         tSlA==
X-Gm-Message-State: AOAM5308ZkD4qg+9ixnLcf7iW3OiRkDb+DHUDjp+9sgKNuZCw6GtTslS
	B7zigzoJ1+cP6NMhFUOktXY8OXtKm6Ytggct+KY=
X-Google-Smtp-Source: ABdhPJxknnXU08knRYkxhmCxm33HtbkVXrqTJ7ZX2VtLtMopCZPAoLhEP96gsX+CUJ7WZX0sceEfzA==
X-Received: by 2002:a17:90a:5292:: with SMTP id w18mr1677704pjh.72.1601938653669;
        Mon, 05 Oct 2020 15:57:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s67sm1038881pfb.35.2020.10.05.15.57.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:57:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/2] oeqa/selftest/cases/devtool.py: avoid .pyc race
Date: Mon,  5 Oct 2020 12:57:18 -1000
Message-Id: <1facb696140cc95ea3478654aedf1220459c825f.1601938491.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601938491.git.steve@sakoman.com>
References: <cover.1601938491.git.steve@sakoman.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

In certain conditions, most likely under heavy load on the
AutoBuilder, the prebuilt .pyc files are attempting to be
executed before they have been completely copied. Avoid
this by not copying the .pyc files (nor the __pycache__
directory). The impact of python3-native recreating the .pyc
files should hopefully be negligible.

YOCTO#13421
YOCTO#13803

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5003f08c75..d8bf4aea08 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -56,7 +56,8 @@ def setUpModule():
                     if pth.startswith(canonical_layerpath):
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
-                            shutil.copytree(pth, destdir)
+                            # avoid race condition by not copying .pyc files YPBZ#13421,13803
+                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.17.1

