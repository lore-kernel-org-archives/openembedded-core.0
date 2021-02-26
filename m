Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8925.1614344474575246399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EHtifqce;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l12so8496085wry.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wwErKKdU9m+grGYIpignToRe3ayLgeI1GJy4xJJ6z0Y=;
        b=EHtifqcevlwUgSnrOUGKogH5stlRdS5ehuhbP3UF/AprIN2nuvrcR9/m2M+GmsciGD
         4UYAu85Nu1z90cxAmaT2mu4eZt5N/MRx5wbvg5zWfOTZsqW36zitjKEp9XNai4gaBGng
         bY2w7plUSUfj4V7dX7B//PsSs0/IwYkPNIaZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wwErKKdU9m+grGYIpignToRe3ayLgeI1GJy4xJJ6z0Y=;
        b=a4HhSM7BzG5khjsioDdwLVc09FyqXJPWFae5Hm5dzRyK29aA+n8xfmcW6al2la1vb+
         tBDrjnRBnq9Td9bFpyHjVwOl0P24oAJE0l4NYAKwz88DxPrcNK1K1C4rTj7V/ri2OLEW
         /ABBnpqEZ5WfUksjspf2fbW32bzVDTtAK0zPWwiZOg/SBUeGNB+KZLA8RYqDM/Q67T3V
         XaBakUuwLtu+vSGqHroz/MI16qOCFDQPywLmAybCaKKWHiPuXJmPM5WGPRkeeLKb6GhK
         0q+hP0j6fGstKFNx84FVyTRCYqsEovbycAMzssKxu7zJo9sPral9uLlAG0dInMGQ39YG
         Tb4w==
X-Gm-Message-State: AOAM530hYjbvoUDSGMKUsgHqorKLEScUYHgBFYuLsnX+p51HB9mWTCLX
	isnet5fgly9FBiby2s5aQ6jkKvFw0EyGvw==
X-Google-Smtp-Source: ABdhPJwvoVZvwD8LQw72asd9FQEW5XHT0YxlwlASO/V52GxqeFaQp5Q8j8FdpBDb0pnl75NMibPreg==
X-Received: by 2002:adf:d082:: with SMTP id y2mr3101923wrh.293.1614344472520;
        Fri, 26 Feb 2021 05:01:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:12 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/13] gst-devtools: Fix reproducibility issue
Date: Fri, 26 Feb 2021 13:00:59 +0000
Message-Id: <20210226130106.3925837-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py             | 1 -
 meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 8af38151dd1..2d65b1d5e6b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -36,7 +36,6 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'go-',
-	'gst-devtools',
 	'gstreamer1.0-python',
 	'igt-gpu-tools',
 	'libaprutil',
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
index 21a31b41f54..bad99217573 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
@@ -38,5 +38,12 @@ EXTRA_OEMESON += " \
     ${@gettext_oemeson(d)} \
 "
 
+do_install_append () {
+     for fn in ${bindir}/gst-validate-launcher \
+         ${libdir}/gst-validate-launcher/python/launcher/config.py; do
+             sed -i -e 's,${B},/usr/src/debug/${PN},g' -e 's,${S},/usr/src/debug/${PN},g' ${D}$fn
+     done
+}
+
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
-- 
2.27.0

