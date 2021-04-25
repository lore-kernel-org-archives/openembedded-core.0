Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.3765.1619369923845210490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 09:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VH8T6zq6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m5so1913631wmf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l3EyPdMMOsNqNQB9TSi4TfsF3rvW1DR39GhXk6U37nU=;
        b=VH8T6zq6sP4zqVjTi6xqHHwf1CGsQOdwyKRpX3LSFzmc7dRHTmHCbbyr8hfGvOxkjN
         eK/Nr2PXkYJcVeUDOLiXhEPjCCTEG/DtYoSH8P/VbtIAfG1DRtKKv0TAp0lMLFx91rM3
         mSZe6ghJML7EwL8Dag23G95im9QVj4UxANDvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3EyPdMMOsNqNQB9TSi4TfsF3rvW1DR39GhXk6U37nU=;
        b=c3qi1icrPAX0moH0HkUFORbe1elTU5sRMDnLIZ/Bus4FUBqXUXduoRboK7xmGKe7Vn
         cXROOI1Vww6atoes5vdrKZTPWKT/Y1CJi3JzuvEnadXQRjoB8XYMRNYSyVpf2k/b2bsp
         tViglwPexXllzVQDnjk5oTse7FUUxljfVXCEf9vWFNhQX5BpFPYEvWTUXmN9YV6ZeSsV
         qnTLua7EdVgs3R9E442wrOqxVgWvF2aGVYI2tV3yWwgEOTFBOJiBa/VpsfVD/ygUhY8u
         z2BQn5Vlv5mq6LoazMGeabBc+Q1bD5mP76XG0DlCXhQSa+MgdoDGP9W5xfh1ZrJrq2dk
         zttA==
X-Gm-Message-State: AOAM531750aY0VnhnVsPQSZnTRl8vTndiPvP++7ZwwjPfeQ8EHinVAaO
	DkJ+/i+WLZzwKkBElndcfITcTsmmChIuLQ==
X-Google-Smtp-Source: ABdhPJyPLQNlI/I9q/+45XMLqAf4zFRihBtgQ51oja6t4S6mA4/yUfRwlbteZ3d5M3UrsOLsnX5GsA==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15704659wmc.31.1619369922251;
        Sun, 25 Apr 2021 09:58:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ef93:a2fd:16ef:8c9f])
        by smtp.gmail.com with ESMTPSA id a142sm17274410wmd.7.2021.04.25.09.58.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 09:58:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] apt: Disable libseccomp
Date: Sun, 25 Apr 2021 17:58:40 +0100
Message-Id: <20210425165840.1671595-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210425165840.1671595-1-richard.purdie@linuxfoundation.org>
References: <20210425165840.1671595-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This isn't in DEPENDS and isn't configured. It can detect the library when
pulled in via other dependencies meaning the build isn't deterministic.

Ultimately this could become a PACKAGECONFIG. It doesn't build on musl
so disable it for now until someone fixes and sorts this out properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/apt/apt_2.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
index 7d1bce558d1..326f691ec03 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -45,6 +45,7 @@ EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DDPKG_DATADIR=${datadir}/dpkg \
     -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
     -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
+    -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True \
     -DWITH_TESTS=False \
 "
 
-- 
2.30.2

