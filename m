Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA24CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:47:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.21514.1761227228092088193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aBrgcGiX;
 spf=pass (domain: snapchat.com, ip: 209.85.128.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47103b6058fso6628955e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1761227226; x=1761832026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jpgC6K7KqhYBCuGrt/mO1qXNNhNo1wGcs06X4jKmU8=;
        b=aBrgcGiXvA8VREiJ3PnEqH/Skc7KfCIH/N+aIROZQf2fDSUCRNy2qXqBJCcSDglCl9
         Simqzxl9ocpqcINAR+19/N/qds91f39Rs1Jx6DAxphkro+QYPJovMRpThJY0nvVt3sYJ
         eqCRCjZPu7pLfx69WSQqE9l/kyb8MjLPYHuwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227226; x=1761832026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jpgC6K7KqhYBCuGrt/mO1qXNNhNo1wGcs06X4jKmU8=;
        b=ji3PPLa/l0QXzzkt0xe1nEG4V1+xKaKUKaeQdbVkZSX8OpIiSppF2/ZhOQwDmGgXS6
         IcOSJhHSjN0lDHPhMx7ABcqUX+MrZ9Sn1zZ22sLj7uZ4DSViBiZKeQHFViQTXOwcXpjK
         ey8GpwqF+R8H8yQ0ze6ChrcRMF/E00plWv/yPIs0z+6ecsJH5N0IXauO0X01ozsntURM
         IfnUT7JdtKHwu0IT7wMitNzgvkLqWO8nwAHtzHNHMaYAaNFzJFQ0tv67Ke7D2cp1+Py7
         ZgaV2cgjFslriysn7jqLQR8Xgn+6KInHMPY1Z/0Y60N+dpGEVuBGwm6C6qzlgih0pvS3
         SVng==
X-Gm-Message-State: AOJu0YwcC6qaQ6tEM5ZsEf7pTrf9nb1D/WfCbENyj2ubY2dRbSFFc/+R
	Lqwc96X/8f5jwbEKsStYfvEBA6Jdj0z7xdiFgM4QPbHAjm4Zl7dO8X8D+VErrSIumsArtORdwfp
	oBNEuqkU=
X-Gm-Gg: ASbGnctKxfu0TqVZSc2BEU3f6obb2XLwi/ZD0TSwTTSfzd1Mn1QYnV2JmuI/j/AzKJd
	IA15NKAY1dvBEZi2AcVVXYsrL5tmDaU+MZA6gMNnE5GqeUA3mXr9Py5t+GN1xOf7Q+58DPpzNMy
	ZbicipEQwugbJGTNzEy6QI2xuutwq3tyRWLmV1LngpSOLwKEceyqlKi0quCpJ+DuDYJqMF53Bto
	oCeH/hGZlZY5PT3AyVWk9GqpOmyDu7Em6iIDzB/KouoFl5r4r7f0XV4NWj2yfH8rluJq7Wlk3Jh
	u+BCytqPo8ILzD+rmaSDIwUWk3VwVTnQtF1nfzLzxQH9dZHjio0ikEQMDS4THZ6vYwtj013fu20
	MwxYAbxh3T1Swx9tdhCQCcdfqFsCbKWS4sn041kY45b2ImiYFZW/aK39i9pww10ifVQN1tjCFfi
	wQm55i+Uzm2O6FHPJd0g7VpTOmXJ3McNVCFjDh+1xfKFiXD9KAJa+7jGI=
X-Google-Smtp-Source: AGHT+IEtegwQ7usdQJWLRCBNI0TsR6LVljuSAqY/JDi4eUuSJN37fJhskX55s0YiOTj0cZWox7k53g==
X-Received: by 2002:a05:600c:3e8c:b0:46f:a8fd:c0dc with SMTP id 5b1f17b1804b1-475c3f96944mr64723715e9.3.1761227226116;
        Thu, 23 Oct 2025 06:47:06 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4298b996aaasm2406691f8f.3.2025.10.23.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:47:04 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v4 1/2] opkg: upgrade 0.7.0 -> 0.8.0
Date: Thu, 23 Oct 2025 15:46:55 +0200
Message-ID: <20251023134656.2059483-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225259

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-notes

[0.8.0] - 2025-01-10

The minor version bump in this release is due to the changes to cURL error output line format.

- [Changed](https://git.yoctoproject.org/opkg/commit/?id=ab03377868256427279b36c4b2a298edae4260b8) the error output for the curl download backend, to now report the HTTP error code for failed requests.
  - e.g. `error: log_curl_download_error: Failed to download headers of https://foo.bar/all/Packages.gz: The requested URL returned error: 401`
- Enabling debug-verbosity, while using the cURL backend, [will now](https://git.yoctoproject.org/opkg/commit/?id=ce6fede3db931bb0da70d1334cdc4101d0aec702) print cURL's verbose error log to stderr when there is a download failure.
  - The verbose output may contain confidential information about your cURL transactions. So this is your reminder that debug-verbosity should not be enabled in production systems or sensitive security environments.
- The commandline configuration file option (`-f`) [can now](https://git.yoctoproject.org/opkg/commit/?id=36d08b93d2859992b624a4ba2f412cfa5c766050) be specified multiple times, and each configuration file will be loaded and their settings merged.
- [Fixed](https://git.yoctoproject.org/opkg/commit/?id=c87188d7535684fddb8cf80993c147b215602b63) a bug in control field parsing where custom fields whose keys are similar to other fields could be confused by the parser.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/{opkg_0.7.0.bb => opkg_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb => opkg_0.8.0.bb} (97%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb b/meta/recipes-devtools/opkg/opkg_0.8.0.bb
similarity index 97%
rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.8.0.bb
index 95480b47164..12e2edf7e3f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.8.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
+SRC_URI[sha256sum] = "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.43.0


