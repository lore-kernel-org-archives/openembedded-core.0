Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9492CE6ADE4
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87700.1766434121573380812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XCw49xm8;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso7004481a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434120; x=1767038920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NI7o0Zi/mZzt3n1TJ1SVZok42LSzZHjWpIwG5ptfVeo=;
        b=XCw49xm8Aq1KNQFOR7k3/APxKJPbc8UB14rwCLRO8QWphCx2ef218Bs/oBKl/oGQgP
         IDH7A4e7WFBY8JTulvMKXZNldYxT1xjENE/zmvS+cKLKgxRsABsnNMDYO7+abyH0Zqx2
         K9VF1qa9/QYZB3Qxpd8iAl+uL4tFG6beGTokoRYahiT+F2sI7s2Xj4nt1k7If9nf0Anp
         KjY1FLTdtnbRh+3bBOgttVhjpYWH1L31C5hIaD3mul+r3VQ6GWJVR6E1+xieEpamHRdJ
         wO3wyAqTPTsXkL1bMlFoqDMVs/E/RXLd+S9NXAaun5Kap+zcj1RFmuB9nQs8ylArljgZ
         AySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434120; x=1767038920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NI7o0Zi/mZzt3n1TJ1SVZok42LSzZHjWpIwG5ptfVeo=;
        b=J6zZwQekNcaGov5zyZ3bG9YTuVY/OlaBXdeR+oLnBYa/LR+V/1nczfBOYhK1SjhobB
         bmuqNOOlt257ERuoBQKxmICtaTzbIxSLh0+WSSszCowg1fq5EVVVNyHA1hDk4DcZsy9r
         Bfoth26Ic7ZWIR1ubn33uRRQrNTMuimvxgoFygEN/nHZfq/mCzJMq6iKDbgaMKTqt00N
         FqsofUr6kBcMBUcMeAKFl83RAIh0dvSNQyRZ/0bJ6zkcOoFYuSZI0wFw+fz5CxNLcBlz
         Z0RwVrJ96rjHzsQi4zjF3bNODuApDuqNTaMYtDmIGpA3QISWdQy1FYAxQKcwtyX/KEn9
         AsjA==
X-Gm-Message-State: AOJu0Yy+3q3foFeBwUuVZDb+5lx91sQen91mnvIsAbO34+2E5xdhhz8K
	D0nkUEiGrxf/mmZSl4fLPdfC2Lm/SXTa8BnqSJ1Vk9mRl8gxjveni4+MpAyi0Q==
X-Gm-Gg: AY/fxX4XcmoishX9lEEtDBPUqaYOFBVJEdu/UsZfLya7H+cayz/wb6oxQabVOGi+EBm
	DPNoDMU5XNRt0yZ4fVCdL+OTTsW5znwK0l8WDlVJHRGZushC584PeyggnOPTjGtX/2wDeU0flfc
	DSaFkBAw31eR0tRVTqZt6c7W34R4OmlYdtbDUzJF3Jw6Wjxg61e1gBlvrhJf4HEW6iEEvBfkDMg
	P2DvD050dsK9pwb2+4p8xBNUmOqQs7cTwoHqzgcuGuq0wci1MxhZdBm4d33FStcrtL/Ap31A8Wm
	FICKCfD19X2j7qRegUj1+6AsfAxqM32AHS7pTwfktgrIzYM8vRBTiqNQoCgb4OGRbOtkZVpn7LU
	BxSrtMliFfFCW5HZ9pQit4GI/NBA8Y2GT3WV5xwS/Y7tG1+v51ful1jNqHjntdsS3jZ9Y0VBlAs
	yzLdimywD5OOJp4/pZx+/av4wX+wdTe+wQVfKXQcEz6oFX8ObesilEP1u4GQ==
X-Google-Smtp-Source: AGHT+IGLNmzzlihpZrXCiSUMO+nWy0Ga5O5STfrfP6kgUfZCPcM/bU0gvFKxZ5p+UK4gyiC2xmOPsw==
X-Received: by 2002:a17:907:3fa8:b0:b80:2315:b2f7 with SMTP id a640c23a62f3a-b803717908bmr1306181666b.41.1766434119852;
        Mon, 22 Dec 2025 12:08:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 079/114] python3-ruamel-yaml: upgrade 0.18.15 -> 0.18.17
Date: Mon, 22 Dec 2025 21:07:01 +0100
Message-ID: <20251222200739.2278706-79-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228404

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ruamel-yaml_0.18.15.bb => python3-ruamel-yaml_0.18.17.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.15.bb => python3-ruamel-yaml_0.18.17.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
index f14d043f56..a513a9e957 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
@@ -4,12 +4,13 @@ HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc5d45e8a30c81dade6ca1928caa515"
 
-PYPI_PACKAGE = "ruamel.yaml"
+PYPI_PACKAGE = "ruamel_yaml"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dbfca74b018c4c3fba0b9cc9ee33e53c371194a9000e694995e620490fd40700"
+S = "${UNPACKDIR}/ruamel.yaml-${PV}"
+SRC_URI[sha256sum] = "9091cd6e2d93a3a4b157ddb8fabf348c3de7f1fb1381346d985b6b247dcd8d3c"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.47.3


