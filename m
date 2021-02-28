Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7679.1614526634424864472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YV5fN/5A;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id r17so23490161ejy.13
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JTQW/BYIdKEPMxBQJ1i7uhv2rNiWwPUIUflrX/ROgLk=;
        b=YV5fN/5A7S0vVzh2FlJ0BXeV0BEKAr599C4qMJD+F5p/0h9WBkaOgWD7zitYpVxtxI
         xMkuhiKMphHndztbc1q8Hetv/zG1tCi4JRWvN+iz1jUWGmcG84EDZ/F9f21Bw9JU7X9J
         j28EuYaaXhnx60uqZ4CjvrZFLEYNd4RyGOAv2Pda9cmgtMRLDB9H6zKqzI0oZtnzxMXD
         26IvNo+RDUfHV7G8E4/PpYGPThg0aMa71KNm7E+xQyFaHqBcY/EBGnfZ6PZ6DctC0Zhe
         eDZznDS2nYPta1UffuAnytBb2CpXHd0ydK37plAQUsFt1VIY0sAysuR/aqG9Up1IndEB
         8yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JTQW/BYIdKEPMxBQJ1i7uhv2rNiWwPUIUflrX/ROgLk=;
        b=c2E0XK1qesHd3+NUQZ69O+lesT1/n1U4YCefnnRzc7+1terdcd91fa2sRYESJeEU42
         x0N0jh+VcvSZ6ZmT3jRDBI0DbTwGwQkBqstreaLo5h4AXWxT8+ZV1s3E07wuuTmGNNsp
         Ean+ULqMQXH74xgsZTXop7I70zh3FGb2e1mwcHDPJlkCUtw+DBoYJONri2bJYI2SpQ1/
         SdVVCMZOy0bDYAXPKkGsYgoQe2CJm4bKzYJbgiQtFEMuJHdtNuS3U35KtqMGBbpxbouc
         SUf7OcViBGPfhZEJjPlt/Iol4U/oNVivkeyXnMEmnFReZFdK53Ze0yCmigC9iLYR0z+p
         itWg==
X-Gm-Message-State: AOAM530STp8iIwyJA4pdJbaHx8flTgMFy4PKmZxaRItjDQaRRKjYM2ER
	4k6SFlRG37PEDNG3HKnXGDU1YUXEVpXfdg==
X-Google-Smtp-Source: ABdhPJyGO0ZjBcNjHGMRR7pYLW1z43YzWxgKt1fOZckBPOkRjysNSq5WJFvK3gROkU0dIi6a7xaYaA==
X-Received: by 2002:a17:906:3393:: with SMTP id v19mr11902201eja.403.1614526632844;
        Sun, 28 Feb 2021 07:37:12 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:12 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/24] webkit/wpe: only check even versions
Date: Sun, 28 Feb 2021 16:36:39 +0100
Message-Id: <20210228153702.498275-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/libwpe_1.8.0.bb         | 4 ++++
 meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/meta/recipes-sato/webkit/libwpe_1.8.0.bb b/meta/recipes-sato/webkit/libwpe_1.8.0.bb
index a81e6960b2..164831be39 100644
--- a/meta/recipes-sato/webkit/libwpe_1.8.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.8.0.bb
@@ -15,3 +15,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2"
+
+# This is a tweak of upstream-version-is-even needed because
+# ipstream directory contains tarballs for other components as well.
+UPSTREAM_CHECK_REGEX = "libwpe-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
index 69d6098d36..344aa9717c 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
@@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
 
+# This is a tweak of upstream-version-is-even needed because
+# ipstream directory contains tarballs for other components as well.
+UPSTREAM_CHECK_REGEX = "wpebackend-fdo-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.29.2

