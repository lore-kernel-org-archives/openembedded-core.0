Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.10502.1608392727929777790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 07:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gc/7bb4D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id c133so5649595wme.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hVwzK/zdmyaS1f4gvDkPObbMttyoVO+4gStpPBXHlh8=;
        b=gc/7bb4DeepQe3zvYYU5SlTMKG9HvKRIiX2tePTPNgH7nsJ9vGolotftY4nQfE+TOe
         RofhLaXRK0Rst/rU6Rcw+M54n9c0VA0/CJj4fCf5CtKAvVPptyJDOeg4uSmzvt2exNNJ
         m3u7RgHXGf3UMTTORJ0kpLdnVN/O1ape9SxPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVwzK/zdmyaS1f4gvDkPObbMttyoVO+4gStpPBXHlh8=;
        b=pBV5m5smrMchL9omHvrtiDQraYJBg2FlOIGcIdecVx3htPZvOCLgBt2vONg8fslXdY
         WaYYt3EMEukEeFgP8pdwn4Gz452dbGUZy+V8oqR+aT8BfnoIqY18riMWbkLvr0M1Vy7f
         WGH/jmOc2umyjfZt8uZcPgyVJVIHJ0/bAG8uPoxwkK3LWyt/v9XsTFx02olNrMYCm04r
         HKBTr6xJ7l9hG0W/NoWk0kGHAIUoAB9mxexGoif8ddA96b0IVpKrtMkMK2zKp4I/Hmw2
         8IvQWSBY2oty6Rr53xNy2ZbIZhHXpA58BStm/4pbXkjRIN846fZlwG/4LFEkoruZsqGE
         ZIjQ==
X-Gm-Message-State: AOAM530kfQoN+F2aSBIhBowtNoTjFVN19y2n36pXBiXzKhd9c35esOYD
	zQCy7DT/vDHbYDnlBh13gPXWR+xnrbl6XQ==
X-Google-Smtp-Source: ABdhPJxyR1rMqzsBGDcgiIn30PcyIljt7nv9gsUItkG9KcCwYxpEdBITeOEmp62PGxR59wVZ6NwpCg==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr8902606wmh.85.1608392726527;
        Sat, 19 Dec 2020 07:45:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id z15sm19853015wrv.67.2020.12.19.07.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 07:45:26 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linuxloader: Avoid confusing string concat errors
Date: Sat, 19 Dec 2020 15:45:24 +0000
Message-Id: <20201219154525.3995389-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201219154525.3995389-1-richard.purdie@linuxfoundation.org>
References: <20201219154525.3995389-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None is a bad choice of return value for functions used in variables
(strings) as a failure results in concatination errors. Use a string
with a clear meaning that can be searched for instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/linuxloader.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 720e5dfad4c..b161c51a50d 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,6 +1,6 @@
 def get_musl_loader_arch(d):
     import re
-    ldso_arch = None
+    ldso_arch = "NotSupported"
 
     targetarch = d.getVar("TARGET_ARCH")
     if targetarch.startswith("microblaze"):
@@ -32,7 +32,7 @@ def get_musl_loader(d):
 def get_glibc_loader(d):
     import re
 
-    dynamic_loader = None
+    dynamic_loader = "NotSupported"
     targetarch = d.getVar("TARGET_ARCH")
     if targetarch in ["powerpc", "microblaze"]:
         dynamic_loader = "${base_libdir}/ld.so.1"
@@ -58,7 +58,7 @@ def get_linuxloader(d):
     overrides = d.getVar("OVERRIDES").split(":")
 
     if "libc-baremetal" in overrides:
-        return None
+        return "NotSupported"
 
     if "libc-musl" in overrides:
         dynamic_loader = get_musl_loader(d)
-- 
2.25.1

