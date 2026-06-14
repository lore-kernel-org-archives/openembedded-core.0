Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF691CD98C5
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 16:07:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.111584.1781452169127494485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 08:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kHvQxQ0F;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: prabhudasuvatala@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d8b644473so2207265a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452168; x=1782056968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/GstCNvcHU4TKNR8VVUxoNEL2ftmPNrWb8QT5WULJI=;
        b=kHvQxQ0FkKnKz9TdeDWTylQ8H2HLXXO25UxySBpssbhF9xCBPV3UiwraSVWRIKRC6T
         /Kpn5o7oQcb6Nn9yu013d4dHFkmpHt/2JAAE//QB7H0O80h4kSmSsyXk0Ppk0qPuTMsG
         IdPIkRG+H3FoP6W2HTgVDVLspYTAi4jT29IBcvVjf4KZ6Cfz+Ww7JHYRitPqIbS/8N7R
         F/fzcHOuDCZf+dG35wdDy6HJKISGWZz/b8spE9o+9fkhWjFC0aIzlQi//o3mOSjHFKdI
         WthlKvSiqMu0jjjjoqTi6ykRnSndTHpPTWA/iGQQbEkoIIdDtMbbSLFPp4bMWe6ASNkx
         2LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452168; x=1782056968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/GstCNvcHU4TKNR8VVUxoNEL2ftmPNrWb8QT5WULJI=;
        b=ea0iIL8+aMVdXOUu0XwFU6gms2kZPg+oa04d6lV3Of630ZJKWFKERRi0Af8wwzn+tn
         8okU+LfgNMKFPkig38KJzomCeU+IZvmTBLxh5qPUdryOPSw0Zd6wM0PQiW5gCHxiDEfC
         JTY+vwuHUe1xTB3htGIApy2CMkRnoofjYc52SVtzA8qL5Z0x8TIhv76QETcvm2FjwqvN
         1QtI+buyYe7nzAlnsoBMuzZxkHH6Vk9SECPbXHJb+s7q93NDg06JSRl+3EvpDr41fGO6
         fWnlAs5XqIwJ0ZhMO2kAhISwW2aJi+JZwKCRjhgenKll7bDaE5nMJt7zjauwk/E8/ukh
         D7MA==
X-Gm-Message-State: AOJu0Yxp7NPY4iDzf+VYJq1ntTdgKqGBIW/ikyQ9FcN2yVBcbjH/m0TO
	q6OljchxzmwbeKpNshrVl8slyNf7eAvRyfleu/WQLV7W0k9Yesjf6TQApJxCRBPm
X-Gm-Gg: Acq92OEKUtw2QWLdqCVn25gezX0ccl5YtUoc71mCsqGbUAojAzgxVZ0/Bp4WUWWSiom
	q5vK6IqGrZSzTx7UZ2jaHgWwY7RO/vus3iVKiijW/gD7zK7/QrBO9qbhWUvuUvylDi0crIAkFlD
	Y9CyLwk5w9Df6dCt5TI+nj2Uu70xAQz3LYPpEMgNGcmAW7oTbUC7rDAWr/iyQclvdfPF5cQs3jE
	IBMUjLj0t5R1E69GQUdGjaGAtXzjO/VuIY8q/vmXVDVyKxXZghfdRNekkbSh6xBnamqcMyAGYFZ
	3VnuxoMoyp3QJCNfvezc/Ro+oitj5F/QdV9c2MJo1ABjdUkE6Th2cC663CIMd0st82S1EVuPwLG
	0rfS4GBlGpgWTuAPGx6eGr9ampd64IoE864lVDzv8tfF1aNZq9JxriCiY705u1ALZWgOOAcBB1m
	xfddN0mqKw8syx7l5NkKo7lEbGIpEcxBeJkzGTgcWd+Y+0WwYv8w==
X-Received: by 2002:a05:6a00:b46:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-8434cc0b10dmr11883058b3a.14.1781451702543;
        Sun, 14 Jun 2026 08:41:42 -0700 (PDT)
Received: from workstation ([2401:fb00:ffff:fffc:0:b:ac10:f0ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434a934a97sm7712770b3a.0.2026.06.14.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:41:41 -0700 (PDT)
From: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: prabhudasuvatala@gmail.com,
	jeremy.rosen@smile.fr
Subject: [PATCH] [wrynose] conf/machine: fix typos in ARM and x86 README files
Date: Sun, 14 Jun 2026 21:11:34 +0530
Message-ID: <20260614154134.293039-1-prabhudasuvatala@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 16:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238798

Correct spelling errors in the machine include README documentation
for both ARM and x86 architectures to improve clarity.

ARM changes:
- Fix TUNE_PKGACH -> TUNE_PKGARCH.
- Fix "definiton" -> "definition".
- Fix "curently" -> "Currently".
- Fix "specificed" -> "specified".

x86 changes:
- Fix "define" -> "defined".
- Fix "to to" duplication.

Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
---
 meta/conf/machine/include/arm/README | 6 +++---
 meta/conf/machine/include/x86/README | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index c5637798e6f..bccbb1bdee9 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a given tune.
 
 A small set of ARM specific variables have been defined to allow 
 TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
-change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be 
+change the definition of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will be 
 ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
 default.  The format must be of the form:
 <armversion>[t][e][hf][b][-vfp][-neon]
@@ -22,14 +22,14 @@ ARMPKGARCH - This is the core package arch component specified by each
 tuning.  This is the primary identifier of a tuning.  Usual values are:
 arm, armv4, armv5, armv6, armv7a, etc.
 
-ARMPKGSFX_THUMB - This is the thumb specific suffix.  Curently it is 
+ARMPKGSFX_THUMB - This is the thumb specific suffix.  Currently it is 
 defined in feature-arm-thumb.inc.
 
 ARMPKGSFX_DSP - This is the DSP specific suffix.  Currently this is set 
 to 'e' when on armv5 and the dsp feature is enabled.
 
 ARMPKGSFX_EABI - This is the eabi specific suffix.  There are currently 
-two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI.  
+two defined ABIs specified, standard EABI and Hard Float (VFP) EABI.  
 When the callconvention-hard is enabled, "hf" is specified, otherwise it 
 is blank.
 
diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/include/x86/README
index 05aee533a71..f0a1882d818 100644
--- a/meta/conf/machine/include/x86/README
+++ b/meta/conf/machine/include/x86/README
@@ -4,7 +4,7 @@
 Most of the items for the X86 architectures are defined in the single
 arch-x86 file.
 
-Three ABIs are define, m32, mx32 and m64.
+Three ABIs are defined, m32, mx32 and m64.
 
 The following is the list of X86 specific variables:
 
@@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
 TUNE_PKGARCH = ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
 
 The package architecture for 32-bit targets is historical and generally
-set to to match the core compatible processor type, i.e. i386.
+set to match the core compatible processor type, i.e. i386.
 
 For 64-bit architectures, the architecture is expected to end in '_64'.
 
-- 
2.53.0


