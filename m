Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24CACA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 19:52:56 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13504.1790867448958556496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 08:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=mxNyF61t;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.225.140, mailfrom: jennifer.chukwu@amarulasolutions.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso68524175e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790867447; x=1791472247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMgwK6G7ZMWy5t3cBUokQzWwRwXi6+riP/IiFmmGHeo=;
        b=mxNyF61ttSE3gdVztkgGcFG2ZbeEtYZrgaQrqYlK+KGMhonA8zgTlVtkLTfuJgMlwT
         wt6z9+QSxiySH9DySFJRPx7o7hKDzBPkMM82cKJf0XCtCXXPbWbSq3YZfrksa929d1WC
         iDl2M+GfQm13yt2vHcDxwyJY/EoXJt/Y98g0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867447; x=1791472247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMgwK6G7ZMWy5t3cBUokQzWwRwXi6+riP/IiFmmGHeo=;
        b=dCCm53CgIwwWMBKutxMLc0mRGRMvuAUi7+Z8v7xpHGO9JtM7q9vu2zNwf5ZdhGS6Pj
         K3E95NycSce+r8nGIRcSFVteX7n0eypdYdMpZIc5lrmz9mRaqCxXLSHo3eV0WXPQK4jD
         XtyIi3OJp3YsM5XJOC/SCJYZxSZ17WmGlRKWxCy2P8iWdaQGYksPh52rAZudEqa5b53Y
         vCG0E5uBcEthy/xUnjD/gzYmuZE80wYPX1J4/b6pzjwhtcniqQkawCrBbPEjcL/I/wW7
         H+kDVEHrduWIDDmRM1Y2r5sJ2TJkJOYk3hdAE3abmfqFYj4lIVSzyytn72CufRVnM9l+
         yjmA==
X-Gm-Message-State: AFuF++mXTIzjQqN6b0jRTBKatwPeNxBZ0qL/T/jrDl3XpLztEtSoAjlF
	7VSeJBI2XtNZSZlmlLLGnA9urt5dHVlSPJCLdppuq1NwAQb+dOa9jWeIyH1sTEOrep0LXoLRkqO
	OBeR+xg4=
X-Gm-Gg: AYBFou0kZPaqQTtnCsVT7gecfQFYY3sd3/SsVU1RS1xfDYSssMi6X7mkq5QAu5/C27z
	UCxUsuDmE2+Aj3Pqxk6UuUqoqTVU542tmSe6XLbEd6k9XAzWtcIACH5CHFzl2n813/jnVHkjZA1
	0zq9m+Y+zpShYpbMq+PtSbChlGmGPKZtJcvm2p1Fz4UWYLvdGa6/MkLsXYwANz804flvOpAoO8Z
	AmXx1+BlFSuagqf1Hcs9XOcDVvj9O/hYuZSbUWsewFjY8BOuZbzUp7RObINmQSMCmG6aOXFRWPL
	XMLOabm84jrEV1ytTSd4C+0x6vwgwmQtxHk9FxANdU1AaZen4EIdaKk4X3WT/Z8hmq2+X4Ku7XO
	gqUQF+Rb6ISbCmlGC21DxAK5va6VaF95RiT5hGVAjy6cQoQOCCDFOSGJwO2t0HynHu9JJqNqIib
	0zzxiutM+Nts3BZJJKlJm1clvBvT7trF5r8y5EUlfSBMsTecHcQ4982Bx4eiS1Bc2rmkUaNPHLG
	ebblIDgYhZbcK5Aam5KJ7FXJqD34D1RvgzkF5tIH6cGxlIzrATlAyn9/FZswPs=
X-Received: by 2002:a05:600c:45d3:b0:49f:f922:1dc1 with SMTP id 5b1f17b1804b1-4a01b004bbemr76361235e9.28.1790867447038;
        Thu, 01 Oct 2026 08:10:47 -0700 (PDT)
Received: from jennifer-chukwu.amarulasolutions.com ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02726513asm2538655e9.5.2026.10.01.08.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:10:46 -0700 (PDT)
From: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
Subject: [PATCH] acpica: upgrade 20260408 -> 20260930
Date: Thu,  1 Oct 2026 17:10:29 +0200
Message-ID: <20261001151029.3446046-1-jennifer.chukwu@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 19:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247052

release: Update version to 20260930

Update license information. License information was duplicated in many sources files.
It' s now available in two separate files in the sources.
Intel License is no longer mentioned in the sources.

Signed-off-by: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
---
 .../acpica/{acpica_20260408.bb => acpica_20260930.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20260408.bb => acpica_20260930.bb} (84%)

diff --git a/meta/recipes-extended/acpica/acpica_20260408.bb b/meta/recipes-extended/acpica/acpica_20260930.bb
similarity index 84%
rename from meta/recipes-extended/acpica/acpica_20260408.bb
rename to meta/recipes-extended/acpica/acpica_20260930.bb
index 1e6326720f..374f4ce3bc 100644
--- a/meta/recipes-extended/acpica/acpica_20260408.bb
+++ b/meta/recipes-extended/acpica/acpica_20260930.bb
@@ -9,15 +9,17 @@ ACPI tables."
 HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html"
 SECTION = "console/tools"
 
-LICENSE = "BSD-3-Clause OR GPL-2.0-only OR Intel"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=4877caee45a613e9706946c3205a6fb9"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL-2.0-only;md5=570a9b3749dd0463a1778803b12a6dce \
+		    file://LICENSE.BSD-3-Clause;md5=8896f63a9dcbf96114f60d32d38e9169 \
+		    "
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
-SRCREV = "232ff3f8ae1a4da11c709f61d9154482cfe8e6df"
+SRCREV = "e85aa3bebaae81ed1e6d163511ac7e1eafe732cf"
 
 inherit update-alternatives
 
-- 
2.43.0


