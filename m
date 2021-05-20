Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.521.1621543757611242220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q2hEC6Hl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso6177708wmh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H9amQruEMbRkid2ieR4mCzz9zB83ltjXh+nbyO1RwV4=;
        b=Q2hEC6HlfE7E1ck2n2/XhKNwqrXdkXPxL3rqCqqwpeaNar26oXYo2EEWCO/kX2YkxK
         NlzXAp/utA8ihbqBbUsGISSbKtsdzAXd7IJiWmFzd82YM3S/NRVXpj+P/cysdDzWahYZ
         eln0sxlZVXb+tGOaF17WUIslebERrpABhtzsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9amQruEMbRkid2ieR4mCzz9zB83ltjXh+nbyO1RwV4=;
        b=cGXSgH90ZO6kOGvLUnr+THe9lWEnXjNjvMzjdxzyMmlKZjZy/Hb3w1o2O6I02DPwqR
         fgxkGLqEFW/F8RK8kktMoAwhpK7/MJVhbiQdIyyj9S7JLryG8PrlviHTupjYgjStITaM
         Q7jZSavo7dAifNTg0ynTinr2dG8ZJDioHwxlrZddo9wrsk0Hj4X52KN7AyvfiUDRsElK
         jiyjD8ER/ic7UEpusjZ2XS17ZyqY+gewTHVyal3nwa6+1ef/oGnMqG+sF2cMN+UWor51
         g+jYoDyJ9HIo3e4cpla0XGRRJXjdsdFr3N/TwNRSZe7o8C4zX3ftjGGuXfBHnN4J9mrb
         STbQ==
X-Gm-Message-State: AOAM531mDynGxsPjFKthp8AVvd0ak6R0lAnGAnlGyrWzZlhZL44EZtzt
	5ephMGcCfRS7pWTAzvhrt8RI0t/2D3oKOw==
X-Google-Smtp-Source: ABdhPJwKyJGpI14Pt5Ay5n81cnQJATzRwWd5P64VmHy3uWqvRcs97RiDT+aklHwZHEftVD2YklU9cw==
X-Received: by 2002:a1c:1d97:: with SMTP id d145mr5779415wmd.107.1621543756116;
        Thu, 20 May 2021 13:49:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 23/28] tiff: Exclude CVE-2015-7313 from cve-check
Date: Thu, 20 May 2021 21:48:57 +0100
Message-Id: <20210520204902.2527687-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some fix upstream addresses the issue, it isn't clear which change this was. Our
current version doesn't have issues with the test image though so we can exclude.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libtiff/tiff_4.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
index ea8580a25e4..6ca01af2fa9 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
@@ -15,6 +15,10 @@ SRC_URI[sha256sum] = "eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc1
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
+# Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313
+# and 4.3.0 doesn't have the issue
+CVE_CHECK_WHITELIST += "CVE-2015-7313"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
-- 
2.30.2

