Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7761C3527A
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.7343.1651727149235458545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k1PtlyHr;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id z2so4973418ejj.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+cMkNhYMxIjClOxkYcR7/PPs38eD9XeFZ0OOSgwsfM=;
        b=k1PtlyHrBGzdsgR5M86lSoW5kdzHtmlZTQASmMaWF8hl19in2udAjePBnLyJ/6p0AE
         3fkAbnK2rge7d2KGSZbmxSZvkjsDvNf3AqeuvP7L5HYSEZ49UepAImgfxe/vt6/jW9BA
         LZW4/E4+pA9az8MAyQtyxItJxFsIsqElzHwcNYuNlvULkZswIHXCN/y02ME3NIvUbMMF
         NQq3fZxWF+R8qWsA8pZ83CDFylfvWL2Z9wACu0WiaEOSA0e1LavDfSqYw7AuWD2N1V37
         q+6uf4wgtt3cUGh1q8fc2FgGsKoHUnsqcMXmexg+dxXh9Fd/LKIJvhMmF2y2uNTuzjvh
         C8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+cMkNhYMxIjClOxkYcR7/PPs38eD9XeFZ0OOSgwsfM=;
        b=F849P65XEXe3/IVOrSWwPNWt7w059PIMafaB9JmnQEtBrNolpyOzRiBtYIMoZg9xnp
         ysjdzE6LmafEImAj70V9Mx9clV2rhRNrtXJt76sZJ0TWciOOLn1ve3GzFPhbEBrI8x/Y
         3oajbwjH27zUoHQRM7hixIamI/6ASlQ3MX2xP66iFCAb25ClwsDCAuR1YOSb+4c5y/86
         hyZJqAvlKc1NI3EQdr0s6jK8z+EbzLILGrYdRvVf3/WBLqKNmgm8eW35Is37KHMobJa8
         G19lKQYeK+YozUHEOhPy9fhMAS6RPpe9YtzhIO4fErgR/T7l6sBktSLK1/eRbcdd4ffg
         tSig==
X-Gm-Message-State: AOAM532bHm6ml0whhBhVONJSsU80c5v5LMu7wxp3d73vm2lMowR23ve/
	wnytZA77uDK0wpElSwy3UhgwwtV2gJo=
X-Google-Smtp-Source: 
 ABdhPJw5SP1KS6zbq2kG6/CB8c7DqIK6BFxmfKcRdrpPi/6hOzqmFDX/GN2liNR5CLRbFt6u2MtjVg==
X-Received: by 2002:a17:906:3918:b0:6e0:5bbd:bf33 with SMTP id
 f24-20020a170906391800b006e05bbdbf33mr23085058eje.764.1651727180315;
        Wed, 04 May 2022 22:06:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/61] sqlite3: upgrade 3.38.2 -> 3.38.3
Date: Thu,  5 May 2022 07:05:25 +0200
Message-Id: <20220505050544.651895-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165271

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.38.2.bb => sqlite3_3.38.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.2.bb => sqlite3_3.38.3.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.2.bb b/meta/recipes-support/sqlite/sqlite3_3.38.3.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.3.bb
index a37aff6fe7..286987b708 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.3.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "e7974aa1430bad690a5e9f79a6ee5c8492ada8269dc675875ad0fb747d7cada4"
+SRC_URI[sha256sum] = "61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2


