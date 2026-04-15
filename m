Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46363FA0C29
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 04:39:35 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11709.1776227969705383751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 21:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hTak0AuP;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7355470eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776227969; x=1776832769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3gUGUsqSieTxlp7mhd9JrJ6OUUfXaypdTJFEwU+KFA=;
        b=hTak0AuPc4NPFSdSLntoDmx6T9D0MOACNvygRdkBHxhwI2mwuAd2fmwo0ZaAK+DxFL
         fZyXi6NszUZkCJjzz3yrcmTagWUUV1u8cvNMxyhdh+938SpIn2Ag3HhAhsdhQP09KKMb
         7bJar1LBtfQ5FrwULJqRBHClfHylj9ke9NNw47ZL32xzH9NeCmxoYra8kaHPy28xylq0
         jDckP7TwiwtjKsmeFnpBgZXW6+AGPHaUTCFc0p5DohHNhjB5TB8YJh9IKtAE+YkOAWYP
         A1njtvlfbkdls3fwZhiGzUyRwqG2lSNtws22BIXnxumeM+eScwiOurxVy2EhQ/seX9gR
         QAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776227969; x=1776832769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3gUGUsqSieTxlp7mhd9JrJ6OUUfXaypdTJFEwU+KFA=;
        b=F/NGP8WCMj7QZRLMDtvXCBliKNxatd2M6CzCDiRUWBgeQ6o8MsY/d1g7gFuxlhM9Hi
         3oeJQA7F1B5tlYQOW0PNUtZE/OLhvLt/9X0To9E+Kd2wQznCppcyChRdD909P1T80wCe
         0VZx75pHNKvV0pzUvhXcWUwJhCMbTpyMJQ8HqT1v0iLZQdbV8wHxZ9Jnb5zxgjz3tJUd
         j6jiB9Hjn5cfNKPVKPnyHWi7BfCvfcTwNcm9gWUfAejRKLbA28V4rEFuO8h+aJnrj1u+
         StWo2Dr1W+/IlPl3DJ5Ce+bgMfk0M1RrJRiWxQ89IeXDNd20bHrjMJsoTHknGX6laAjF
         Iebw==
X-Gm-Message-State: AOJu0YxZoUHZyMVcxQpJ0l1g1Tisloj6BUS1S0W9+A1ihKXBhG3mc4m6
	tNXP/RT0CIMCa9aA0uhhLE6KLG4gqYtqcWKTMjL4QXNaAqf4rEJoXiHDrgPPF3zk
X-Gm-Gg: AeBDieu0RgCakFMcqRXAke6xDLyw6C2GYM0WLC2aSwBDXmANnmJbQA7CL73bciD4Hy7
	TW7hRHOfmmzB+g2VPtw5VAI8H2IpsRGc7GUEbEGf69Uc2WIXlKSGwNtYRlwY+d1xgcY3lOXQDPO
	GCGrilI+9oTaEV2LEMXYQLVWEmgoFXcjL93czZjCjh3Ee9cmzcL/L67SGJy4+11r298mCFMShQS
	LP6bfW4nPTOfkX9uaXwe3tdMlz9U7FTSGWhJQmhPFdgUa3ylsXe8Pq+5/q3+qgeAby8av5IuPl7
	4l7JKumZldZdOnNbiKEuSmqGtfoC+5V/noSvJXxZlkno+d5HZWSwA0Qzcn5eGzbzxX8dF2tvDlT
	WL/dyycLyDzrehrMSqoEgLCY53KxoNyVXbJv2YOcI1g7qAYuAmayeftJ6NxaBob1rtxOJRuePQF
	PzG3iuRqHx6kxkOUnDwefqs8+zYNnjChRBIuqywMr7OxbjL3uSM8lA55ljizjTK7tQidV5ynlBH
	NIPBbpGlM87umFHdEvbU08NP1v2itlzm50T+5Pn6kajJq+mmPTSEWnp7su8A1uoYeBgqgku8IKK
	rtmK20AjSuIO44mKELip0rxoALRaTyChMdreXNn+rkaEUR5DUs4=
X-Received: by 2002:a05:7300:8184:b0:2d9:d062:4cb3 with SMTP id 5a478bee46e88-2d9d0624f07mr5745474eec.26.1776227968591;
        Tue, 14 Apr 2026 21:39:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fa5efb6sm1031701eec.28.2026.04.14.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 21:39:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [RFC][PATCH] autotools: Disable autoconf C23 compiler default detection
Date: Tue, 14 Apr 2026 21:39:25 -0700
Message-ID: <20260415043925.795191-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 04:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235178

Autoconf 2.73 introduced detection for C23 defaults in the compiler,
adding -std=gnu23 if the compiler's default standard is older than C23.
and compiler does support C23. This causes build failures for packages
that do not yet support C23.

Clang 22.1 still defaults to C17, but the autoconf probe can
misdetect or prematurely enable C23 mode across the build system.

Disable the check globally by setting ac_cv_prog_cc_c23=no in
CACHED_CONFIGUREVARS until upstream packages have added proper C23
support.

See: https://savannah.gnu.org/support/index.php?111401

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/autotools.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index bf58008669..7bb5c29f10 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -77,7 +77,12 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  ${CONFIGUREOPT_DEPTRACK}"
 CONFIGUREOPT_DEPTRACK ?= "--disable-dependency-tracking"

-CACHED_CONFIGUREVARS ?= ""
+# Disable autoconf-2.73 detection for C23 defaults in compiler
+# and adding -std=gnu23 if compiler's defaults are older than
+# C23, clang as of 22.1 release is still defaulting to C17
+# See - https://savannah.gnu.org/support/index.php?111401
+# Unplug it when packages have added C23 support
+CACHED_CONFIGUREVARS:append = " ac_cv_prog_cc_c23=no"

 AUTOTOOLS_SCRIPT_PATH ?= "${S}"
 CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"

