Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.13171.1622640444245410933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=icI76+q5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id j14so2318798wrq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g4m4S4Oz8N1nDnFos6js4K7Myw1L5Y7z05Nhdh91EXg=;
        b=icI76+q5Gt2w7oL42pRJqdewvsF31yYEEyPHmreivYhZiE5D032+Y6Tv/ix1sc03Xy
         +DNGLrHgpHmWYZYAfZ9KD86xK22sm1njwE44jM0DY/Nlmy2wLP1bdghjDy5Mz914f+MP
         gaQkO6Kc5lClgKEhcJQUJ/0W+08ydfFmn8xcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g4m4S4Oz8N1nDnFos6js4K7Myw1L5Y7z05Nhdh91EXg=;
        b=aF/9m+Eki3GkoO4cLnhge1iMzdkI1SrNMuIOKSqi+lbIZaXHnnu2UHwZ2OwlsIxcXS
         WL9pWzDlxsnfrXCH5gUrd/oD9ZZl4NeE4LPaB1zl7rt3D2aqXFFFpOtuoSgxotKlyDBC
         d9NBFy/UmRr7n5jlle45NkDzkapBhzUZ9UxuSlkBg0PDqx8E2rvF50zIWKZYV9ysl4x9
         hqHxq9W+pInb8kbrtMtjOQH3706XVwskrZVbYLqkt5k3lipEpmAy8jb4Fvhyd/FqgF9E
         AEmhTBctn+OdXWujNcIVMFitg1COQW4noyxN8OU2Uad/+pnlcU3KIIQ0wWu3INnGJ3B7
         Pnhw==
X-Gm-Message-State: AOAM5321aKN0B7GNtCwQF+BuM+Y7+OkTnZpvkaSBVn//jgfhcA+tPvTE
	uViIEsKJ84Rk2C8xtK0S9Mkvw2TK9T/zAA==
X-Google-Smtp-Source: ABdhPJykMtfU0aFOhPyg/Eue1KcxSox/YufjBqgmZ84IjbkHqPHUPvFKd2XXVJYOSR35AQ2Pp3VKcw==
X-Received: by 2002:adf:8bd4:: with SMTP id w20mr20769507wra.310.1622640442820;
        Wed, 02 Jun 2021 06:27:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id i16sm2799498wmm.9.2021.06.02.06.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:27:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [hardknott] [PATCH 4/5] package_rpm: pass XZ_THREADS to rpm
Date: Wed,  2 Jun 2021 14:27:19 +0100
Message-Id: <20210602132720.2921099-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

By default RPM uses the number of cores as the number of threads to use,
which can result in quite antisocial memory usage.

As we control the macros for compression anyway, we can pass XZ_THREADS
to limit the number of threads if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 84a9a6dd12f..86706da842e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -684,8 +684,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
-    cmd = cmd + " --define '_binary_payload w6T.xzdio'"
-    cmd = cmd + " --define '_source_payload w6T.xzdio'"
+    cmd = cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
+    cmd = cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
-- 
2.30.2

