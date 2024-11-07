Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75895D5AE54
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.64440.1730950691757977089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tNmsyvlS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so344525b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950691; x=1731555491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM5yryli00FiCOL/a4bEq6ebco5spiH3/QSwGmAI3zY=;
        b=tNmsyvlSv9z0FDZryGnxjOfQH3c8C5DLoWhhXw5bP0YA1q6Zf3v5BVGb//+o7JDGl8
         Szv3N586NZViklKQXEb4OUSsupIrvbY7XcXp7D2iEOjkzPTiDTTIukU+tKrVyARF04Nh
         N+I3BMEh/3lDzciEo90FIr7ZPVMDHQB7NaSSWfiu3wZ7T9ZV87EJmCdAAN9XH8nSZ4WO
         ZmS+WIID6BCB7ffBWSXVC9qeBO+XTLRNYOpyzV/YzqbbutWAGINgQ7vKWJxmWqTuplDu
         oFVg761mz8Qw7ld64sqzsewyDlXqCt+I0RI5Rp1+9AZOdhWQVOomMRP6IjcopMSbZDnW
         AsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950691; x=1731555491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qM5yryli00FiCOL/a4bEq6ebco5spiH3/QSwGmAI3zY=;
        b=aFRZb8HJI3Fr3v2t9fFI9VoTgdibqZYBw31RCBgOrBQmrRUjzKte4VPgKgX0zPaau7
         z7AxytAerNjfNCgiGXI57KRHDe/V1D42qyeU6YQcG9kmSi+lQlEi0p5rwVi8bITyQhuZ
         d6ume0G5kcaHWFB4u/fWP6ZFE1VXa+3CuDsmILEcNBXK7y9fCoMTR9NRj3X//JALDDji
         CcKfEbzD+kPQfwu9yRA43kgkecR+ufuSQeTnMijgprDtrt1Ho4rU4HDVYnz8Qqvpx1rn
         0UElo+j9b0m1Ku8VIRSdzEdgNkNZEfEMWGmK/8pKQVd/Nor93uSEEB1LwNJhSOZqgQVG
         ZIZw==
X-Gm-Message-State: AOJu0YycGEO+b5RahWmf7BqHVDmhLOrKhc6/pa3fmUPWYM8cdb50GvqP
	SiG5Pk/ZBjJQ+uJ7MFizdvd/sxXD12XeXT5avasKDtafG6d73axi5fi80CMAXPD/I/6bxEw+N/4
	W
X-Google-Smtp-Source: AGHT+IH/b4+u38uk4VyEi1MEMXVqtmRdXLWs0QQUbbX6SfOhURbPCHHFrVFwr7BJCOML6WXhpCLdAw==
X-Received: by 2002:a05:6a00:cc4:b0:71e:79a8:1d84 with SMTP id d2e1a72fcca58-72062eccf33mr56782135b3a.3.1730950690822;
        Wed, 06 Nov 2024 19:38:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] go: upgrade 1.22.7 -> 1.22.8
Date: Wed,  6 Nov 2024 19:37:46 -0800
Message-Id: <f3bc0483519fcf08f5e3ccbbbb29de0ec4fc927e.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206824

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.7..go1.22.8
aeccd613c8 (tag: go1.22.8) [release-branch.go1.22] go1.22.8
b4086b7c16 [release-branch.go1.22] syscall: skip TestAmbientCapsUserns when restricted, document
6fab4b9a9e [release-branch.go1.22] runtime: size maps.Clone destination bucket array safely
71655f14ce [release-branch.go1.22] cmd/cgo: correct padding required by alignment

[1] https://github.com/golang/go/compare/go1.22.7...go1.22.8

(From OE-Core rev: 552b9913b25107d7a34611b499b7811896b5f098)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc}   | 2 +-
 ...o-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} | 6 +++---
 ...cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} | 0
 .../go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb}           | 0
 .../go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb}     | 0
 .../go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.7.inc b/meta/recipes-devtools/go/go-1.22.8.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.7.inc
rename to meta/recipes-devtools/go/go-1.22.8.inc
index e54a902741..542519b930 100644
--- a/meta/recipes-devtools/go/go-1.22.7.inc
+++ b/meta/recipes-devtools/go/go-1.22.8.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
+SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.8.bb
index aba317fd38..98799eb503 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
-SRC_URI[go_linux_arm64.sha256sum] = "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
+SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
+SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
+SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.7.bb b/meta/recipes-devtools/go/go-cross_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.7.bb
rename to meta/recipes-devtools/go/go-cross_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.7.bb b/meta/recipes-devtools/go/go-runtime_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go_1.22.7.bb b/meta/recipes-devtools/go/go_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.7.bb
rename to meta/recipes-devtools/go/go_1.22.8.bb
-- 
2.34.1


