Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62558C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1862.1645557438236884263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZvpC39ax;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 v8-20020a17090a634800b001bb78857ccdso512894pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oJCncBKA5qbLLBPKiBc4Tm+G6oyg4F90VBwS2JXToE4=;
        b=ZvpC39axsFTLqB25+mKsaS6PILoLflhIjDW5H7V2fN2P5K7KNx/1WfZADBVOqXXVWV
         +b7T460atpcp1fCnOGh+RIs8iek9jhtVHA+u4zOksDt8cpaQG7E29Nq1bJfH3Wz+QSIR
         xYajkOxAFlsByKHytLazh6rV0DDVSiIp6oL3xURVINOV82NaO9Ug+cJLjtEIifgANqsM
         SF7yWDeVlvEuHN7G4Eg2bi2VFKMxU08ltsGAEWhzcB9Dfyk6zbJ/Tn2qHBGf2FN0aBYA
         rasygKpQQv0MnQSCWxtzZOmHEs77L8bBEff9LyzXQOUvjA0xNdC1JnxpRt4c9bDMmtT9
         426A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJCncBKA5qbLLBPKiBc4Tm+G6oyg4F90VBwS2JXToE4=;
        b=OpluaZ91av7GqR0W8ErAcMG5J6QfFj8rQ0O7q1BI6RAEYNm6taElUP4Vr9MFzgeiOD
         Xa0KnlVmcN8pf5cFDvZhpjaXZWdLbSLCvNPwswVlEdAw0RzBZipd5sWTWTypEe1AuTX1
         qqP96KHZkF2QLOO7rhWkdm7+59Ptxxa/3lEtDrE25SEqzJt9nrLrGMmO1GCXchRGGDgM
         XHWFLiHlGsdeWt0TvW9l9pHO/+eViLc02rA+/O7YKNu3Mv7PS1wDmFlHNSG8vN39VK/r
         +vs8RRIkW7EG92EWdog0AnD6ROuk6SB1SiEf1vPDRhHTfucOQpcbEg1QzRal8TR6WFTL
         7wig==
X-Gm-Message-State: AOAM533WFCF+ZL2SvQewNpTNheDJ9OwzqBk+3rzIKOPOb4SXu8RSGyQ8
	r0+L+KIVucCg2fM8xC5AdqB/Qn8vJSqH/Q==
X-Google-Smtp-Source: 
 ABdhPJw0gzAb8WwD7NrJAs0iykSX7+3JGiVEKUIPGbn2n1fZQKY0p2sW7jHOpj1grrFnFPbbFubjiw==
X-Received: by 2002:a17:903:292:b0:149:460a:9901 with SMTP id
 j18-20020a170903029200b00149460a9901mr24515540plr.44.1645557437300;
        Tue, 22 Feb 2022 11:17:17 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 09/32] python3-git: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:35 -0800
Message-Id: 
 <31806c669201042e8151be1c7bceff3a17b3394e.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162200

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-git_3.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.26.bb b/meta/recipes-devtools/python/python3-git_3.1.26.bb
index b6171a0e4d1..8f4b13cc15d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.26.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.26.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 PYPI_PACKAGE = "GitPython"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 SRC_URI[sha256sum] = "fc8868f63a2e6d268fb25f481995ba185a85a66fcad126f039323ff6635669ee"
 
-- 
2.30.2


