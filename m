Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D918C79F9F
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2481.1788641120244335752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RDpetFpw;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482ea739de2so1437637f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641118; x=1789245918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=se2riq49+3t+cwydmgR6nBbhPTMJKoFh7cP2Dv28azg=;
        b=RDpetFpw7hGGkOGMRKacP0joODMJqPrygrb1XOafHeiWg2D5rk7ygaDl/2kYvUW8zo
         /sBL6Lgxn5HAhi9jblvSqgifIK/10/2XBa5h3inkwT8KxUH7QNcH1zPHf02xVD36lf9H
         I+oglpvkpRpiAUmTp23hJ7d6JZYEq/zF3Eoc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641118; x=1789245918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=se2riq49+3t+cwydmgR6nBbhPTMJKoFh7cP2Dv28azg=;
        b=TtfhG8X5L7rMZy5Rz9Df0ArRCNOz0vfyfZoOMxcqrgnjBkwnME4TPdRCxYozGquiFe
         jllmgiaMZJdigokuySHfcgP/6dCmA+rvfbxfyuyVuDefxsDz1OqkmM79a3w/4azNoWaC
         TRdLC4b8gOJzECeTwCDWSGt7oqZqSvpWUM38ukTTAZA723kFYNwKfG0rrsO+p7hvN5xR
         Y/ytwJCfDhJKnz73jll7+q0gGrGqwgIrXTgGwXcfoaR7Dn3bZ1I8QiePH7n2Kv3u+ocA
         sCFVX0fgUtMzMw2YjzfEW0EsfseOcywu1pBVDXI6/8vSFQe4Fgk3/gMHgZeDAAIr3953
         MD6g==
X-Gm-Message-State: AFuF++liUuCdoPruIpbwGDZuudrnuhmNnj2pC9sttlgRS227n81qI2qz
	/r02vd2a033r8dGNuQnEsyoFgZeAuVTq+9t4zTnWm1RvjPNiLl3pVzaU99+V0GWCG1/ClAwQEC9
	azliPt0I=
X-Gm-Gg: AYBFou1JyRIqJbBcD99IKVhkworJYs2n+ug2WlNRhBLCqwr4Pfax9EgMsueDUba4KTA
	eYAnP5BUmaSqa6soeffoKk0q2s2a4H8d5RKJSJXPEAocRMl8PPwHrN6HkhYGcy663TsN5At4t7t
	XSzFoNQN1+7f7em07NfnMSgyeF7uD6uAl5ZbMRmUjeBn7Ih9ZVTAnfQi5AMaF74G6xR9MI6khXm
	2fyJ6rG+71gFqsTK31FdPkoUrJdcKO+Pw/amQiKrcS5QcKwodBnIdB1Vy3HGSc32nHXut62+df1
	FKjmbGAOTp9f5lAmIAk+ZRXfhwM47r4aa6JBgTgv9ZlxNESxpb4lRNLzaNUL+dJAbmy6dQh8rKc
	iAaJqh7Sf2SIVIz+0FRgfxMoe2A3BI0VGlRSASt3wtU6Hz7V/M9ypxxedgXkTUkHUT+A61ia51V
	hOnelMB9iE1JsVr1fR8/bSrEXhzuIsUuQj7cj/8sRd31i/5+LKEEBLvrx2ODlpclE/eUgdm0aCE
	S2VrNQFQbIVyCOZoeIYW6zBginqQHFhrelOisJY8B2Jc2gVhmToYYX4Amh+qQS3DA==
X-Received: by 2002:a05:6000:605:b0:485:8c16:a360 with SMTP id ffacd0b85a97d-4858c16a6abmr11531032f8f.56.1788641118523;
        Sat, 05 Sep 2026 13:45:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/40] python3-pycryptodomex: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:15 +0200
Message-ID: <540250a7b7b17058da2b48d870373f2d3e48aae0.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245166

From: Tim Orling <tim.orling@konsulko.com>

With this change, 1 Patched CVE is properly reported:
* CVE-2023-52323

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2a2ae48add874f41c5b60ca90ba3a26ebb0fe38)
The current pypi default "python:pycryptodomex" has no matching NVD CPE
or configuration identity. Use "pycryptodome:pycryptodomex", the active
NVD dictionary CPE and configuration identity for the packaged
distribution, so CVE-2023-52323 is properly reported as patched.
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
index 43dba3faa3c..148409c8d96 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
@@ -3,6 +3,8 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
 
+CVE_PRODUCT = "pycryptodome:pycryptodomex"
+
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \

