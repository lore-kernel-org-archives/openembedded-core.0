Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8926.1614344475112729694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eJLKW/WF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id i9so7064145wml.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kPgipmbEx/iPLd5Yzer/eENNGXfFoEPJ4EtQjv8Tt/Y=;
        b=eJLKW/WFouYyDPA5aRqnttPqwnXQ52Zaf4d153uuFFjOp7YvTuI6WdvAAKWsPzbEfK
         TxRpt1P8o7cefb2+WmmzwSrY+xJbaov9ICZppqSsbHgbgMGxoCA1DO3F+bOJndtKpRev
         5JyXiWSraFkGL6bwMX4Me7MeDgXlkx7/jT9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPgipmbEx/iPLd5Yzer/eENNGXfFoEPJ4EtQjv8Tt/Y=;
        b=k5Ny23Ak3yR3BFhAGfogJrSxlNkdfWSs1Leb7R8YJ2g+tSLbW7rGQWXHtbVHj/jeGw
         VNkQD1UtHIiyZpdS9+LiGveUHvj1FP6sNsSKoFer3gidZ1d9Eh2qs+xNiQrU7Yjvcva8
         3i+2SCsgmNPPyd/s+tkYxvirKrRZeZFZ5WBpP/Lu5TVHq9uHJClVdaEtM90IrZ9nZ2Xl
         R4pL7FAnXxQBbjZhgRpPIDd6Ssm7heX9hqLgdNYzB92p/KtPVPcCAfC6XbtYV1eitT9m
         1LJNGqtc/axcxCOA4uTtnT6o/FM+QU7Uw6vAiIPa2BFStuCCkp9dDz5g5zx0zUvVYdjl
         ManA==
X-Gm-Message-State: AOAM532ICo+HVLPOYXV53ZU7jXWR/zws1mdr0H4q61U71n371vY78eEy
	e+YpQPw4TlWNoAmFYRiGW/4FrTCejAuuCw==
X-Google-Smtp-Source: ABdhPJwqWU71jmd0jcB208ZgpakfoC00xWrQflULbLehrYcKUETMmFq4EpOUmMexNPo6E6YOj0B7Zg==
X-Received: by 2002:a1c:b70b:: with SMTP id h11mr2766773wmf.10.1614344470830;
        Fri, 26 Feb 2021 05:01:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:10 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/13] gtk-doc: Fix reproducibility issue
Date: Fri, 26 Feb 2021 13:00:56 +0000
Message-Id: <20210226130106.3925837-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

config_data was including a build system path to pkg-config, fix
this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 81a98795f8a..9c24706c667 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -39,7 +39,6 @@ exclude_packages = [
 	'go-',
 	'gst-devtools',
 	'gstreamer1.0-python',
-	'gtk-doc',
 	'igt-gpu-tools',
 	'libaprutil',
 	'libhandy-1-src',
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 8c925633db2..3b308318b2d 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -39,6 +39,7 @@ do_install_append () {
     # configure values for python3 and pkg-config encoded in scripts
     for fn in ${bindir}/gtkdoc-depscan \
         ${bindir}/gtkdoc-mkhtml2 \
+        ${datadir}/gtk-doc/python/gtkdoc/config_data.py \
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
-- 
2.27.0

