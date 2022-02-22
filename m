Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E60CC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.1886.1645557440129032865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+vtfYU6;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id z15so7312576pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dNLGngtey9WED5VQilqdbHjZhWopBluU8AH/DrKJCho=;
        b=K+vtfYU6uPApmjb2xNNl1w3hf0fDftieEB1ds+FsydvHJT886WlyFsGzvcjXkxl3I4
         TC4TEQ/cjXq0oyrsdLd+f0afcjEg5/c/00qdAa5gChxyr2JAxrm9xJcjjL77YF2ruaFi
         buyfCsW9Bd77lV4cTePdGb+m+Njdlak2Dt+hpYnGe6uPUViFhnx0/aGe1A7XOizpiHT3
         nJOKmbdbqauuRaFPxBgAfWhYjUEDr5PKiJVzVxzH+TLfPqS8dd2vJgXe4kVk2zA2KO6X
         /l7PW5fZNurBcOGPEffascR/qbSt7/1V0Yv5RRE0mlVGdThcf2R4sUL8bdwNnPTxrlgJ
         CtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNLGngtey9WED5VQilqdbHjZhWopBluU8AH/DrKJCho=;
        b=zhcgiz9le/5TCiM4mfrCfFe9sB3WoKrp8TOTMDBulkiFWQoqirxeolJeCVLLYwdWqY
         zmYSRt2sf0svZ/nY3y/f45HYLS1DWJKUus2mdzVobHbkPPcuW2HwHtc3jz7A20jXaKgV
         jg83zjV/ZKL6mptcUbXNXb+siErwFLmLElNqsMJt+V2lXJ+OZsyQrH81GbIzwXDtpSjz
         smigf5aj8juMKL7VrQayNkT8ljDFy3JnDP1s1zORHzom28epbh344mcEokiPVldSQWte
         ochxcCLC6wS0we2FEX9WIGtxNcLzED2iniSMHxm/G0F7PQkIq7AWNko+rLL1prFIiV3x
         rnPg==
X-Gm-Message-State: AOAM531CAZTHQlCVoMPMWPVZABKwCC6Q5CuYjE09L+c8diU+CsuFy1zw
	/vrwDCnY4Y+jou0q4vllFGVW5VeR9NYoKA==
X-Google-Smtp-Source: 
 ABdhPJy06bf//L4z6vtLq4416r4NUoik6MhUhhnXpiwy5hmLoIGQqPcaIO9fVhG6NOijk5aToaOqCQ==
X-Received: by 2002:a63:f0d:0:b0:374:916e:52a4 with SMTP id
 e13-20020a630f0d000000b00374916e52a4mr1970824pgl.457.1645557439019;
        Tue, 22 Feb 2022 11:17:19 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 10/32] python3-pytest: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:36 -0800
Message-Id: 
 <81cfdc9e6a95afdabc798752b204da51fd206d5b.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162201

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pytest_7.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
index 25014064890..ea6ba80300a 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
 SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd49850f171"
 
-DEPENDS = "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
-inherit update-alternatives pypi setuptools3
+inherit update-alternatives pypi setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-atomicwrites \
-- 
2.30.2


