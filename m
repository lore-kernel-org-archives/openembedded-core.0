Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E224C79F9E
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 08:06:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9862.1788681963861152803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 01:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JvrAXL8a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso19476145e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 01:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788681962; x=1789286762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WOiMYfnDhPhhfI4AwjW8biHRniBetNIA7NEliS4AZ1w=;
        b=JvrAXL8aAaJeSdwXszY9c8F2YtALPedcXGFVmRphjnNNQxOanCSEK4furbULOv7yMT
         MPIypKIColBQ91QyV+NmXkzNY8O98nQurPJyv7wxIfFaadt7EbmUUkUam34dbkoE76xV
         yWkYLxcVAiyZQYLWhCLAnivTSwMzaIhJWmEuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681962; x=1789286762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WOiMYfnDhPhhfI4AwjW8biHRniBetNIA7NEliS4AZ1w=;
        b=c7MhZetDB9ygU4tojL6HRqzYc4tCDQ6lvbHH5TSJxCNL/pAYD1OejUWhZ27pZ0rpYT
         PO/G69QCKqiGLl8q15BwXRD+N9dbw2/YnRGnwpCAP2taC58AblbKg5so/f+y0D7RnXyO
         SZ/kQTM1+tWxwkIbCoyuRnRj5HM3CuAjzEM7sHLc7aypkhJHGhSBFQhC5vDPiSY6SHfP
         CYl4G5++db2W+OUQ/veopMBzjUblBaWeP7TjGlYPaEMw9wDP7aQN33drqw6q2TvD92Cq
         dcoooeZScjKth7hFI+zavccsBOjGyiYb9AHeQPyGYc3ZfFje4tNMNM3FA1zxhQGnOd9W
         ZpHA==
X-Gm-Message-State: AFuF++lVTxh41aAr+jfBJVhGeQsq8E6TrzazNNHzIaL9Ye2CUH2GaGPy
	alUKc+LqrDkhFGj7T2MWimTRup3ymoBxpnXpkMR+yLKntEPf5jmF0bsvfhKqH/rQJjbSSen/Bup
	E5htznD4=
X-Gm-Gg: AYBFou0h2YCWM5PLbCLsnCzxFbIxOL/sMfW1aO+9wD4J6jOyUdSta9WInHuclTzljko
	cpEOTSKHiOzj/WMbqCQ4381qONmBcViKmf+4Eng79C+8qwyy16XpfKSvvtGNDnLW98XQUMx5l7v
	7Fn/HNNvgBQQsIVrWylcbWBvvSaXRgRSKy3l5hBuypoBb6JLTF/vmLQjmT5YalUi7ntuBcV2zSd
	Scrb1cGVi5AQL5EpVmSIeI2+uwZQ5xO3J8coukX4zMAKlo0l5uJvJWLbNBps1/AsPP0mFgF2iJu
	8jd+istW4tDTTimSA2Se+NEJxr4Lj+SvJdRwEoi2PfzdPKCaZGMy47U+ox+56WacGRwN00ncw+d
	IhUizL/FwrrcX0kz3MfXeCYX7GCjTlAN2P81o5ljIU//338P9/1Dt6EKzKkxiJ7ULFkHxQvqi3q
	4oAxO7U9hhugrJSRiD2dsMHvzsbkBMhZK9nWVmzuiY19TZINXZ3wrMA32aeSufMQVm2/FyvqEnb
	IPpDGnd+AfsjEPFew==
X-Received: by 2002:a05:600c:8711:b0:49c:fc6e:a3dd with SMTP id 5b1f17b1804b1-49cfc6ea7bfmr159666025e9.28.1788681962011;
        Sun, 06 Sep 2026 01:06:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7e4:ecad:c000:9c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm183691545e9.11.2026.09.06.01.05.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:05:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] pkgconf: upgrade 3.0.6 -> 3.0.7
Date: Sun,  6 Sep 2026 09:05:50 +0100
Message-ID: <20260906080553.3151802-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
References: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245204

Source: NEWS

Changes from 3.0.6 to 3.0.7:
----------------------------

* Correctness fixes:
  - spdxtool now serializes the SPDX 3.0 suppliedBy property as a single Agent
    reference instead of a one-element array, as required by the official JSON
    schema.
  - bomtool no longer emits PackageDownloadLocation twice for each package.
  These fixes were contributed by R. Christian McDonald.

* Build, packaging and portability fixes:
  - The Windows installer uses a default installation directory without a
    space in its name.  Patch by Kai Pastor.
  - Skip the spdxtool allocation-failure test for static builds, where linker
    wrapping also intercepts libpkgconf allocations and invalidates the test.
    See https://github.com/pkgconf/pkgconf/issues/593.
  - Use PKGCONF_ITEM_SIZE instead of PATH_MAX in the test runner, allowing it
    to build on systems where PATH_MAX is not declared, such as GNU Hurd.
    See https://github.com/pkgconf/pkgconf/issues/600.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pkgconf/{pkgconf_3.0.6.bb => pkgconf_3.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.6.bb => pkgconf_3.0.7.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
index 471433e7b54..4579476ae4d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "c88a653fbabfa2a5857a30f6b6ad6c40dbacc3b7c72cc066e5c7dc4571cbddaa"
+SRC_URI[sha256sum] = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig

