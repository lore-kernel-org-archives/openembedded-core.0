Return-Path: <roosesweb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C64C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:22:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1267.1787120531713878777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s046tigi;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so4770645e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787120530; x=1787725330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujMDO555Foi8uazIki8LJVkQbG2SInIU4PKMXR9xMSU=;
        b=s046tigil/4rvvrNMpdHlknNH5tQ98pXXhZnVYlGU4Lo+5tJnBsRIQCXr1AQ5At2Yk
         bQ7QTBi2+VilF0Kmkb4K8RnUy7o60FawGCr1OayHsw08ZQAoAFZPWl/EBTLykYiqQIIy
         u6Ww0gcfSXpsW0gZqKUqZqv07bsa2WfPNTZJ02K4p/MseRuw1tk/PoDk7HMrUm827AUK
         uL6wXjYUX66SnUy6EAootk+LPdZ3W9EFL814phpRZ45UgfIQynoGvvY6otTtzBfUv8mq
         wCfLb5A62SoifGQBDF889r8FukxLhMKOMp4WU8QihsMYF4E4jLS+lSP/YO3RO0u3ppqS
         GK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120530; x=1787725330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujMDO555Foi8uazIki8LJVkQbG2SInIU4PKMXR9xMSU=;
        b=LmFt3K5hCZWNb2TR9fPsUTHSFYzbVjq1wqE+/xFoitHt98EMsS8M1x86frak4EWvWk
         tjGxPL7Slekr/Edx/ZAQlWb1FpuOy+vaz+9CjCySWWp3BsLzBGqhzjsVcfJJ2HN3HIpw
         I42tjgISEeHNvdYcM6jrAXknhjXZKUrfX6yrMjCyCHP3eYUjh6dDWzw2Y/TgoeR2NdUU
         zmR+RKyYTbFH+peAERv2/0T4ZXt12TfmyzXM7ET84eNF8aGozDFCCTuj7cOfSudyLXD1
         1CMI53N8U+2uS+E3/HPvnbyynE2GEsS8/Pcd547BmyjdO7s2RiyxHwWWhxqgwNpCYKoR
         vRmQ==
X-Gm-Message-State: AOJu0YynwP6bcxrzYECgAZHAx3cV6Ts8QXU/LQkK13A10yQcoZS/7XLY
	OB7vfAncQVlceQIR3ZmgWZymhYMMk/9gEVyLwl4Y6od1o1jR8Ro0pw9f4Jvee91m
X-Gm-Gg: AR+sD11G4SqJCsJ4Iz615WePzeGCGIuB3Edq9kdGMVdcmTzry2VeEXQLc7V/YukHwIZ
	m7QcGUYFbqedECU0Lq3S2rnzrdC6KUteRj4Up9bNhBDbmEKwO1TIED+CAMu+IYEHriXFRPDxG9r
	nHtqaCVnu0vVCNQujDYPLVRLqrM6TcxrO8EaMslWrZGjXU5msxT1ZZDR26lVBGCcciprzmE8L9J
	9D0ZblMndOconHsdQG2GqU4070bfQO4aEHC31I8GM6k0iHk6WEvc1660PlxSQR9e5DIIVT0PFey
	+Tnd8GJLqeJevvX04VTeMlg8EIGAgmtim57FdZK8W8AFLIZow243l+qSbuJKUksnBBKZ+PKtRRz
	w+GrOwjalxgJiqqdp56DkdijBlYV4RuTrc5jPDqT3MZn4JchCsC3k1twhw/WFo20cZpFHmEwB+8
	tOAXv4BCp7y6nBRh8tSnbeZawD/PDl++Cq+ft6V/UjvhwddWuFvQOG74eq7+fcyPqZ4psZ50N6D
	WCcft6S96WqTIfCoIXay6LqOA+Q9ppXWw==
X-Received: by 2002:a05:600c:3593:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-499aa0ff5a0mr41502055e9.0.1787120529985;
        Tue, 18 Aug 2026 23:22:09 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm32900085e9.13.2026.08.18.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:22:09 -0700 (PDT)
From: Thomas Roos <roosesweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 1/5] sbom-cve-check: read the image SBOM through the stable symlink
Date: Wed, 19 Aug 2026 08:22:04 +0200
Message-ID: <20260819062208.680468-2-roosesweb@gmail.com>
In-Reply-To: <20260819062208.680468-1-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
 <20260819062208.680468-1-roosesweb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243707

The input path was built from IMAGE_NAME, which carries DATETIME and so only
resolves within the invocation that wrote the SBOM: enabling the class on an
existing build tree, or "bitbake -f -c sbom_cve_check", failed with ENOENT.
Read IMAGE_LINK_NAME instead, falling back to IMAGE_NAME when it is unset.

AI-Generated: Uses Claude Opus 5
Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 451595f..ca47834 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,9 +14,10 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
     image_name = d.getVar("IMAGE_NAME")
     link_name = d.getVar("IMAGE_LINK_NAME")
+    sbom_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),
+                             "%s.spdx.json" % (link_name or image_name))
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
 }
 
-- 
2.55.0


