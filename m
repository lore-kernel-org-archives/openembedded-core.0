Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ED0C3ABAB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 18:38:11 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1668.1745951886570188191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 11:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=T0S6e/U/;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476a1acf61eso63690941cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745951885; x=1746556685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0DGHT8u28WFmslGLsO5xqxYKI6Wri/94q59JAMi26k=;
        b=T0S6e/U/HGD2buL1nSVWx4Ikw92gDr31ngwyGZLsRTFsMC3iuY03QhQk66aP7o8EE8
         z5o7RvDlEWL+1DGz0YTg8/FFITjyaZjphlJxiAS61LSPdzjP6nYJAoVxep24XGzoLWIm
         S4446c2ppWeCZ0pqeZoz0HOLmxBYpySFcIPTKFYAUlW8mHgsjvhBki+0PLvyuShSxWiB
         mjGFe3qVLCjHQMya5bW54/5QJ1JJVPHNoXkWh4v+vrJdJddhSp7GpABP5mBNXUbMetxW
         FB8OYUKXrv2cMDcbQVdc/60UrLo9GlNo87b7IkedzPK8iY3iB11VhJXgR5ZCqw5edUve
         a8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951885; x=1746556685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0DGHT8u28WFmslGLsO5xqxYKI6Wri/94q59JAMi26k=;
        b=DFW+g6byx/eLeds+xTLqIfQ9iWGuM4qqSJLSM4AflqcQmlNdCBthUW75/utNxBW/Km
         BRoxHCUKPsA5szljNOnVLdf4RrO4+whSgmLDbcTU7FG0HjdBoyZ2/LONyOeU+cE1eQzG
         sYwQis2zPXZvUY5p8hpCPpp+CBtJh2SOpsXYm2q78RPeombZ8Z82LU5h6BC2L+oLhVv4
         uAud4NcxwoOmjY1XpYjv86kEX+/lsqeT03g+hvxfB7ufZiCbyDDCjha314i2Ytopl7EF
         16G7sWXdbiJB6HjVPtJHeOCtOzlSMC5Jxj+l3GCQu9ycpCLoyt0smVk7vZ99Oc2FBdq6
         79Cw==
X-Gm-Message-State: AOJu0YzoANoVOvahX/sjJ9B3C1hToMR7firEkHikjQvyMPfAv200oin8
	LG+Oy88A+HeZ3WQi8cUEoOGlt0TQECcZdfQme4k9XYvtHJFiKJeWG0CH86VlVz8kcKVo3CtKUlf
	WwxE=
X-Gm-Gg: ASbGncsnAkj/rTADun96VLpntnZUeg8mIYmxcmAaFrxSoNu1k96Nnagju5bvs0K3qB5
	URxczNaesW+il/nruYtjcN5MRB0z5YgwwuTD9rGObu1mipkU9zzIWIAbF7M4UTsqV8/WOpjWxUz
	26noo0Jtql1N1zvZ6vPdqRh9/DMPwvfJ5ZYJgjgcoxRdocdsksiKGuKsCJ8TADoJgxxLZl4pugU
	rlvz1krPANnMiRikJnhjngutHhfQ0vIiSZrGEgscDJ5ctSDBXFmAnr4Vwen2gS7l96C+7NjnCgK
	C9vnfdUrfmU/GYFFJFI6/3MAJOz6yvT+L/imzebHnzm/B9hNNl9hhIRD9+mkhLMEa7b+rxYdCRz
	6+8D1cN3qV1M=
X-Google-Smtp-Source: AGHT+IFlqMdfovvmUVrajiBu8d+5UoDU1YVnVlrG7Nv+M8DZxl+3/g4AOlTyUgWzRXvPW8OhMRAwhw==
X-Received: by 2002:ac8:5146:0:b0:474:fab0:6564 with SMTP id d75a77b69052e-489c4e204famr649931cf.37.1745951885099;
        Tue, 29 Apr 2025 11:38:05 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48969deb42dsm4005001cf.70.2025.04.29.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:38:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [OE-core][PATCH 1/2 v5] python3-numpy: upgrade 2.2.4 -> 2.2.5
Date: Tue, 29 Apr 2025 14:38:00 -0400
Message-Id: <20250429183801.1125000-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429183801.1125000-1-tgamblin@baylibre.com>
References: <20250429183801.1125000-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 18:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215687

Changelog: https://github.com/numpy/numpy/blob/main/doc/changelog/2.2.5-changelog.rst

Reproducibility looks OK:

|2025-04-24 10:27:00,978 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1203.06s)
|2025-04-24 10:27:00,985 - oe-selftest - INFO - SUMMARY:
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1233.056s
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
No changes since v1 (just included along with the ptest patch).

 .../python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index a2ee2b48d46..c6a37c0a85f 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
+SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


