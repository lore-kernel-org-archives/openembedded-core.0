Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712F6E9B26E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21452.1771943096190039372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pT6MIW8h;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so69461115e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943094; x=1772547894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5uhNdz2R/BMnvPC/Njsx5S+BcAE0fT/iv8NbaMvmlM=;
        b=pT6MIW8hev1u95KBl+cVCZqioNecF7qnANHyw13A3XyUcwJ1vN9YTKRyWtUp7biijW
         WxCGOiYgxBxh0NN3KIFEPBMjekRJRbTgrc9uEP2KmMw6U7o5NV80TpHzf3I7dASsrgtA
         ivHTmVJYWfSClcDq/UzxShf2HdYD0LW7COFRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943094; x=1772547894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N5uhNdz2R/BMnvPC/Njsx5S+BcAE0fT/iv8NbaMvmlM=;
        b=TPQ9pIcPx8BmhOtcndAP2XNewy/pIwj9hM6Z5bY70NyKKzk170pShskXV0WePRiAgr
         +Hjun2dFo+HKaZO8fOkO4eLR5rZb6crcxjEjnAypzfcmLyH4HaCIRqt/z4qZriDngC5Q
         zSg928jc9CMG4AmSTjzsBlepAIi0lk6moj7MiUcRXUzDinKcNGqG7JcUlErePBFVTkxw
         xsVwv38hd7alcLnyobCD/GbEoNphi+niErAUHVRT85/fi4VLL9ZdV1lGuMu2hH+XIe1b
         SnKT4IQJ50TYPGKRDT+Cliv34Q2PLKnRtK4pZk1sdKiaeBQvX+DVnpiyTud9QTen5/NE
         YJ9A==
X-Gm-Message-State: AOJu0YxMpgTwVwUdziq6Dxjt7ZFuYnJcQ9lk2ULnGmzucAATInx6KaAv
	bMWptxSt5ZpkPpsmpVpfVn+kWo62sncjBw2WwCCHpyVKlxJH+ghjIP8m0G/G3im0zdDLrnjHR2I
	jvVEA
X-Gm-Gg: AZuq6aIJZ6MNIGZrJlrq3wihfS5CQHkwDdTu4wkyXFCR+vLL/VHsgfcjhGtPGmX8Opi
	0JwN3/sig/ShJc0y/133dsfI0Sm9jwWbkDGnciuNSc/W7gSZaIishSC2fYUf0MSx5pvObXfhqgz
	F1uhasa1uncIIJevFElpLzZ41yd1N7EglLByzommJiQn+5ds4XPHriI+nvCuJBsXHzAdJ+ouC5t
	0ITDJPTpsmMmTf97Z+133ZrjDHydUUr/H7om0Unsu0y4uAaVIR65b3pdYQXUOhDz5Z1AiBHpJuT
	8Lt1RTobhs9xIM23wpjfqh39tpDk26qzmOuzn0iyBUBZJO6FGH8cLoXsxWfJjlQP8wTl0PTckL5
	+6AvnRkuzJmhwvVHFWZhE0G+8HzsnsDSiXEVzDzTiFYfmPnLu22ATFAkcOCbzOVzS0c/0HstdL6
	R477ImWeXWWSQFVrJVUl+IGtZsKBe8NHwixdPVdocxTvqN/DNsAbDWz4jviendormLQksKabScl
	IiX0P7Mm59vYhChcZZGtnkygnz1LEmq6A==
X-Received: by 2002:a05:600c:8b31:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-483a95f5911mr211773065e9.27.1771943094312;
        Tue, 24 Feb 2026 06:24:54 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/38] zlib: ignore CVE-2026-22184
Date: Tue, 24 Feb 2026 15:23:53 +0100
Message-ID: <00eae842fe2989d5f72917e48ef748dfee93d57a.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231767

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index dc8f7c6c855..8dd0a90b523 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -58,3 +58,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # this CVE is for cloudflare zlib
 CVE_CHECK_IGNORE += "CVE-2023-6992"
+# vulnerable file is not compiled
+CVE_CHECK_IGNORE += "CVE-2026-22184"

