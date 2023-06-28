Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93187EB64D9
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:24 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.7291.1687919417341387664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NXoajSC3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b44b5adfd3so4333739a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919416; x=1690511416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4ZxXsvgbywj/Ex2HfA7ouPo4lIzBthFytHQpLtwcXw=;
        b=NXoajSC3h43P7vJDfR5sgdu5atD6CY3MH67bT3qKdbfZKWbDg67teImPJr68XvvCUl
         KmUz+70LLc1iG1ZX1fImxem0a4CceLN9bMfNmOgcQSFUfQ3CVffVCir4wB5F9AZf1JPU
         L9tzE0+hKyQzkz8d7A4eA5GFAOsmmF6v9kpw37++Xl/CG7QwDwMAKm6OSdnft2kualFw
         lh7RJOvTgROAFUPBhl8xJyjgKnO2f1u2amt6tY2T2QJVn2GPlSpHCB5Hv1U9JSImUyhL
         uwFYo47SAW7sScAkdNR9vquqzZ7URRzWE45yO/fCKsyINPwMwOvCAK5A+gpIS9DCNpGA
         bWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919416; x=1690511416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4ZxXsvgbywj/Ex2HfA7ouPo4lIzBthFytHQpLtwcXw=;
        b=RU8Om55hViomlIm/PUzr7ffPl52V/A2TZcZg4C9nMOx+Gi9s7zSjTrbJlgXM38d6sd
         JvF9UFNG11XaTCZpL5/JZ7ldalfZtwjh/b5jzNCiotYPTKmsvQfKbX2d5UnldjEy9r0M
         WR7QKhZ9oAjAKk4vefS/nXgb3R61wTSLDylBzx4f5+3Z+aFaAWbbxe/bKJaXNMkTWlw0
         MT0hgrzeLnUd7PUDthD9xt4V5kfYKI9O4L7dYCjWvKeVsbYMckzISCeaACyeypBvREKK
         2KF7bxgoB4QfsG2KXFU54f/JtmMNU5aRihtnxfPv3MowdAoHcFItLE328gGThm/UUkwC
         FEdA==
X-Gm-Message-State: AC+VfDzLwK3j1Kw3arPSekd3TVbCABeI/2NKWfeIGmne6iYRItn17xgx
	QEJH95OXKIl8Kuq3gX7jUx0MyMXmKWnF4ZmhxOlcIA==
X-Google-Smtp-Source: ACHHUZ4jPGW9PW4pUl2IUZj/JQkcb9HbU9JHNEBmiEw6EPNiZ9B2RiNH9gNCZtqHPVGKJLb2E0JXGQ==
X-Received: by 2002:a05:6358:f55:b0:132:d3b1:c34a with SMTP id c21-20020a0563580f5500b00132d3b1c34amr13036743rwj.7.1687919415932;
        Tue, 27 Jun 2023 19:30:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/30] gcc : upgrade to v12.3
Date: Tue, 27 Jun 2023 16:29:29 -1000
Message-Id: <5aacf91e9839f60f5cb933e27a349c2ed7fcddf4.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183522

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

gcc stable version upgraded from v12.2 to v12.3

Below is the bug fix list for v12.3
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.3

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/{gcc-12.2.inc => gcc-12.3.inc}    | 6 +++---
 ...cc-cross-canadian_12.2.bb => gcc-cross-canadian_12.3.bb} | 0
 .../gcc/{gcc-cross_12.2.bb => gcc-cross_12.3.bb}            | 0
 .../gcc/{gcc-crosssdk_12.2.bb => gcc-crosssdk_12.3.bb}      | 0
 .../gcc/{gcc-runtime_12.2.bb => gcc-runtime_12.3.bb}        | 0
 .../gcc/{gcc-sanitizers_12.2.bb => gcc-sanitizers_12.3.bb}  | 0
 .../gcc/{gcc-source_12.2.bb => gcc-source_12.3.bb}          | 0
 meta/recipes-devtools/gcc/{gcc_12.2.bb => gcc_12.3.bb}      | 0
 .../gcc/{libgcc-initial_12.2.bb => libgcc-initial_12.3.bb}  | 0
 .../recipes-devtools/gcc/{libgcc_12.2.bb => libgcc_12.3.bb} | 0
 .../gcc/{libgfortran_12.2.bb => libgfortran_12.3.bb}        | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc => gcc-12.3.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb => gcc-cross-canadian_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb => gcc-cross_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb => gcc-crosssdk_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb => gcc-runtime_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb => gcc-sanitizers_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb => gcc-source_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb => gcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb => libgcc-initial_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb => libgcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb => libgfortran_12.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtools/gcc/gcc-12.3.inc
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-12.2.inc
rename to meta/recipes-devtools/gcc/gcc-12.3.inc
index 0dbbecad4a..4ec03f925c 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "12.2.0"
+PV = "12.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "12.2.0"
+BINV = "12.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -64,7 +64,7 @@ SRC_URI = "${BASEURI} \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
 "
-SRC_URI[sha256sum] = "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff"
+SRC_URI[sha256sum] = "949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes-devtools/gcc/gcc-cross_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipes-devtools/gcc/gcc-source_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devtools/gcc/gcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.2.bb
rename to meta/recipes-devtools/gcc/gcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-devtools/gcc/libgcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recipes-devtools/gcc/libgfortran_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.3.bb
-- 
2.34.1


