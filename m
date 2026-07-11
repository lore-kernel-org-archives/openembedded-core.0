Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11821C4450B
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:54 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1287.1783747487970954071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=UXmNapEk;
 spf=pass (domain: underview.tech, ip: 74.125.224.43, mailfrom: vince@underview.tech)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6611669cd16so2372866d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747487; x=1784352287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f48+xr+da5AQla78zwsef2/qgZoamf1pCZad3/l/+XA=;
        b=UXmNapEkoux+AlqVaurLUe7fWJtSLIMNyRPUepxWA5aRnfTB25+4diCBjcQODo6Wrc
         jC3mAKqIvqmzE3ME/t1GxPcnPCivBZidHeRRmg7Ar+WVaJWprWtfhOwNInYzzU+KOlmN
         8NSeLuz2Js3iisnA58DgKaSkQnRD9atQ0MMYssLfSa9nBlSzmGMqEW5dvK4GP1Cce0Z1
         1yOx27alPCxzr4R3SpjM2Uv0DWnF3LccWRnU/1NCkR37pzN/MXfblm6ZlYQgm+dVUtoZ
         tG2isDcLXzz7qBhD0Rkicg6EY4DJSnXZBrK8OlUFzXv47EUQjOYzkdEHoPxJ8QVIt8Ip
         CiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747487; x=1784352287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f48+xr+da5AQla78zwsef2/qgZoamf1pCZad3/l/+XA=;
        b=gQUaMVgZHcEuT1WE/6G/s12YJF9cnU0UN/blxpvucFsg5vGScS3Ir6bJDvaFnzJhK4
         Q5uhzNWksbIzzrlubPHpySezCnYmheuls2Pva7pWxSAAeSFxI//PldbDJZ9AJklFhp4t
         N8SZELEW9E/YrxX6SPnlth6PPvAWTkeGSLBAFiLyMesEZF7yfNZUY8g2+L/91QS5val9
         EmlStV5Q9RXvcGYkEbhwCmM0XPDHT6zfwPrklSn04UTAh/2mfjS+dcL7dLTwKmuRVlqF
         JCos17q9tMgLssze65POjAXL1vJBD6APokdiGZWOkI2ebN7LMzh99XLfs8zQhoKATEtk
         BYjg==
X-Gm-Message-State: AOJu0YwX12zabY1YnuMWfLD1kXKg1bSMmrD9B8uv1wKWKAiBK8lzrUuu
	H5HY0DjV15Pkn8GSWkFjngBnlXthT5H3qG1PrHVmyylkXZc8eaBXPcDSFDe0+wf5fXWJb8i76MU
	cC0A7
X-Gm-Gg: AfdE7cmi9Rm6pGjgbcH6c8+DNXCH1UMz6UNlkKg4q3iDk8O8FcY0MXSC4Esr1bD1WbO
	+bVF296bCyNQVu9W2b8P0Dc4a6cxzHWTs+EPDn076/ZR3voG6Id+4T21zZKMIgqcy54bPqlspaF
	IhGyFHJS/n/F/qZy6dTtmjigUZUQTP3qGxsqcGHmfd5h2Q8jnFaPXIQqI2YsX5syrbaU7p3rWb/
	8Udkm3DJDT7I33B+4qIGAA1cUZG6m4E8ulusqS7Dew840QxKGMCHX036qvYk1plXO82hmEF6XNT
	8z8O8lQmZsd84W4kNja/NOGG3WYWJa5lSkIyXY3GcoQI4rtJ8eF4vrgcmlSORxg2ikuhLsJUj7Y
	Jz1z6a3k+Vdl38fhmv2fmZwOSlp0G9hABUi5aNvqR35rsXJn5baLqgALvK4aKr/VkRzNQkAhnc6
	TEDpueR4hSG59dgw==
X-Received: by 2002:a05:690e:4085:b0:667:dc1a:a90 with SMTP id 956f58d0204a3-667dc1a0b6fmr591445d50.109.1783747487059;
        Fri, 10 Jul 2026 22:24:47 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:45 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 14/19] hwlatdetect: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:58 -0400
Message-ID: <20260711052403.1292286-14-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240695

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..8ed22b2c56 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
-inherit python3-dir
+inherit python3-dir kernel-vars
 
 EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
 
@@ -23,4 +23,4 @@ do_install() {
 
 FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
-RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-hwlat-detector"
-- 
2.43.0


