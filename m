Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC7CC87FC5
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 15:27:14 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.16251.1753198026830745613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 08:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+yor7tR;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae36e88a5daso964214466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753198025; x=1753802825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vW0ak0RDZKVDT0w9DzjXsej4+p2uGHhUJCm/pXdIopM=;
        b=H+yor7tRvZXp0kUmhW+ff4mRWbEr1YyLOBp7WWKjEiQY5EnffMMY20nNpyTU8GzNm3
         mBaSH39Ym1XxZzyLrfACdUOwjr6Mc35SPXbWFMhMpv6LEQ0Il0OrlnxKCx5S9B5Z2WGc
         09i2vWVFcFTWcA4GnVtsbKTs2K1OkmG6+f+Su0iB+FjzaPH7rCeusc3e5DVXZb+DfZUb
         +BmVAatRGe/UriGHFt+NdTTngVBu0684v99djQyQXjiy308DVRDVi0EN4xBrRB9+CE27
         bdjZZLljtyMSxT1PWlTsUpQltCAGI559mCX9I6OL7bsT9GzLN5PCXGqFNLJ0v9y/EWZT
         GT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198025; x=1753802825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW0ak0RDZKVDT0w9DzjXsej4+p2uGHhUJCm/pXdIopM=;
        b=k9uFkyIKcu2F1GX5qwwz4IX5Id+zkg96SevcDUUu/cAJS9zit5rdZr4zjN8XsmC/Fo
         d80K6mwv8Q9fmBab7Do1Qymo2sjNm9HfoVr+5XGwKa+L3wM01kRgpuxeMrdjyhkXk3EA
         ICFscuwpLGRsfrj34NeC+Bqo0BvJ3reRh2B+b07a3fpHwWVhvfQyMGxScX8hVtDMVaQo
         0GFQjvTBhqbE2ywnIil4ItCZFjkubVW1oL8SsJ9OobGSIlfv6cELBfYbAR11Isi4fuo+
         J8ygVIOtgkWUtr9u76z9Q77cMYo3R66pTfgGQSwN8lhlz+6D8EdG6KpFFEJN9tEej9R2
         cXtw==
X-Gm-Message-State: AOJu0YzbrBMRWboM6HlEQ+o0lxVcPxF5EMcJjA/aR/WMqyqM1bdrAs4O
	Sy47M8FUAYyVtvTEqrLUR10VEoOstiq5UPVn0v5KKayvQT9exHmOrPcfCWIqdg==
X-Gm-Gg: ASbGncu59giEKAwoimRPVwsVrXywLzqz8y5xF1LYbh2FcgA+6Ior4RMdwH+4IuwyC8P
	DAEL6/uult8r2ik8YoxaKRwBzSb7C7IOHZTkXnceShpZZg8yi9JB2xqHSq+URQz610KO9mZrKw/
	hbPzHmZguLQjZ6Q67ZRVwv89e812enmMtlHtxO9nOEdedy/vnWI4QcPc5fY+p/P7ZaipTxrDEnD
	ntFfH1l+M5XVhPhxromC1BUGl1jzhgcUsDHbdiBAFXrTdh5/W+FoDIdHM0CaFUaTfmzGDN3etLJ
	efh0R8I5yRigcHOGDMogfyRz3uu7uxtFafC86t6q0fnaKoUkugtCSz1JZQ73IZr1Rcxb1d22p+9
	JgHIewlqebQ/+bmYrnWE=
X-Google-Smtp-Source: AGHT+IFl7+h+NUrIddxOIbNC5ho5hMbq9P675mcKt3/vWvXdsWC35bWIEn8XlJ+M+XYwyOtR7I7sRA==
X-Received: by 2002:a17:907:3eaa:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ae9cddce21dmr2654093466b.16.1753198025006;
        Tue, 22 Jul 2025 08:27:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad0feasm877743766b.138.2025.07.22.08.27.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 08:27:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libpng: upgrade 1.6.48 -> 1.6.50
Date: Tue, 22 Jul 2025 17:27:01 +0200
Message-ID: <20250722152701.1718859-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722152701.1718859-1-skandigraun@gmail.com>
References: <20250722152701.1718859-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 15:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220753

Changelog:
Version 1.6.49 [June 12, 2025]
  Added SIMD-optimized code for the RISC-V Vector Extension (RVV).
    (Contributed by Manfred Schlaegl, Dragos Tiselice and Filip Wasil)
  Added various fixes and improvements to the build scripts and to
    the sample code.

Version 1.6.50 [July 1, 2025]
  Improved the detection of the RVV Extension on the RISC-V platform.
    (Contributed by Filip Wasil)
  Replaced inline ASM with C intrinsics in the RVV code.
    (Contributed by Filip Wasil)
  Fixed a decoder defect in which unknown chunks trailing IDAT, set
    to go through the unknown chunk handler, incorrectly triggered
    out-of-place IEND errors.
    (Contributed by John Bowler)
  Fixed the CMake file for cross-platform builds that require `libm`.

Ptests successfully passed:

============================================================================
Testsuite summary for libpng 1.6.50
============================================================================
# TOTAL: 32
# PASS:  32
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
============================================================================

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libpng/{libpng_1.6.48.bb => libpng_1.6.50.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.48.bb => libpng_1.6.50.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.48.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.50.bb
index e603df1edd..aa2dc99f10 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
+SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

