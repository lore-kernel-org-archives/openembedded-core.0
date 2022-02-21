Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E997C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.4681.1645478653100700898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XHEA1XkO;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d17so10006192pfl.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EMGj9MC8SPyFqxQziGiTsoHsvLOOfG3kpD8+GHqh4+k=;
        b=XHEA1XkOKmLExqXI3CXZwr00Q8T0fWUGGRUXc36V6CrLQRJdjC2tOtkQBnfyUqO8N5
         dmNXvGWg0nrgiblcrE04Aw4YE32wjHQIdyQZPfYzCnm4CU0MrFa8hElUKjbOgPhNF8xT
         +pEg2jn4xDCL2XpmAHhq8idsYJ38V7+xQNNf6qWjXNBRYY0cvUrGd67xRCkjTerbGxJ1
         l8iCqSBj9USzb12WAZDsVjFSnjgufoCVsLXgiR6L9GKZgE73bojHf8I6FWLXuaQOcui0
         aPpIOM9FmP5x5UGwmO2p53Bo8co8coiafy1J6r1D4+nLUtfVf/vhnGpaXFAvmcl+JOWM
         2PkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EMGj9MC8SPyFqxQziGiTsoHsvLOOfG3kpD8+GHqh4+k=;
        b=PxnvMkViADUj5wy8cyhoW8AdgQRQ3ydF3UL3d1wxoTBM6jIfawi/TNZQHK9cqLLz5r
         CpfLL5nG3NAfBtnGPk9rgBmSCK2V9kbX4wiLpYNTKEfxZLPuULpsJMhFa5N0TWEan9L6
         JxPIJl1HTZfHGroqgRP/Xo+QgHG+rjATSoPWs5A3i9fRlte2+UMVk/hP+VDmmM9+plmZ
         BnhJ9T9VIM6olEGx9MLNHMW0hSLm7qVa1LU+qFDjLDITzH21t2oIqUDhwolQ3b4YzDkl
         HYBans5dPzWMEeV0el7bajZlO6e3a780WfhhTbarpzW94SNDpO80Nn95/rMNUSR2Vx3R
         gWxQ==
X-Gm-Message-State: AOAM531QzO7BbDBG3xioM8grmTblBKu9D7wBr68tjRZ20cKw7I+urysM
	v58PMYGAQ6XiZ2aKY/mDtyr5B3k6a7hcng==
X-Google-Smtp-Source: 
 ABdhPJx8eL1IjHHL/IR+BSxnw3ogi2HFrDChFN84WOysUsJazd+ITwTPSPyQey/AYpgbrKO5OmEZdw==
X-Received: by 2002:a63:d158:0:b0:341:7eac:74d6 with SMTP id
 c24-20020a63d158000000b003417eac74d6mr17271099pgj.541.1645478652217;
        Mon, 21 Feb 2022 13:24:12 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 08/32] python3-attrs: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:23 -0800
Message-Id: 
 <10f7c55b870870312620aa6ac8dc1a2ff590bd6e.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162084

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-attrs_21.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
index d1dde29d376..20e4541f81c 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
 SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-crypt \
-- 
2.30.2


