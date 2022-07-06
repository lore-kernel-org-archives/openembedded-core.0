Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEF0C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.3725.1657094860174902387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bhbxFAjs;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id z41so18257136ede.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=io0ZdJrzIeBa/wt/OkxJxX5EFncOHONHosar2EKPcBc=;
        b=bhbxFAjs2IZjhbaKRDFNCEOLN6eUtLK2NnmMdNQlFIOk0QSwUjQkCH9XE2quNHXSAO
         LPb5wPx5033hIT7qglLRu6vxpCs2qKcMlQZxBNULUTo72OpiG5kFmyrMqrTKD6VQKsvT
         5QcmxHbLFcvzE0Emsnlw5yoOxzwA0owIXUeU5J64G6IDg8hjjS1uX6Vz5yVHhbE/SE7W
         4f9HCrxs2Y0czk0oghYPgzCdIX6XjdO+XJolYvqGV8hU1Lod1JkkrzLvkNXfpf/WnTOi
         8kXNJ2meraGBjeiCliQso0ClwzB4ybEYqZ0xgZhFU4nE/mx9sa5T6+cMyzFEXvr4IsYv
         K/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=io0ZdJrzIeBa/wt/OkxJxX5EFncOHONHosar2EKPcBc=;
        b=ZSELeQ4vZg8snc0hc8BVmLZfd8EFs2WdA69S+RPtzZovZv4/5GwWc95oCHOsIt3k4t
         3LWd93SrNzPFlDCWU0aMKsDle0bOtdn6Enz24Hks4NqYryBm1hqjrYl6z63vFWqL7J+f
         u4rxvKa0OVP4OUXVlr9qUe1T4XS2Hh8PqjKExtuGPpP3Ay+w+uyY+ejCQ2eroSde5YNE
         mvD8nvU834TRHPTEGhPtDFpiIkWwFMD2Q/KNsqDNofBgvcXmIpZYMSMI9o0Fp7G8nbm1
         x9Ozda8XtpZNL+rMcWSBko+0gWX/tj/rTRb0EKJWx7mCg9IG8niRPaJxMOh1AAzg4egJ
         lW9w==
X-Gm-Message-State: AJIora/pmhpWMChPukRiLV4Fp3YAoBKM/6lzweFqUvimm1a1SZEmdAus
	gI1Ag4XHVnadS+lHRWrPBL/YHDIjZmljmA==
X-Google-Smtp-Source: 
 AGRyM1siAHC48gfM/VMGCbuzOCe3/FPklzWkFWB3I8klczgbHs5vvVsZIVCMuIxNRQdTWWDU8UMhyw==
X-Received: by 2002:a05:6402:403:b0:434:eb49:218f with SMTP id
 q3-20020a056402040300b00434eb49218fmr53690433edv.426.1657094858701;
        Wed, 06 Jul 2022 01:07:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/27] python3-cffi: upgrade 1.15.0 -> 1.15.1
Date: Wed,  6 Jul 2022 10:07:08 +0200
Message-Id: <20220706080721.3072553-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167701

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-cffi_1.15.0.bb => python3-cffi_1.15.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.15.0.bb => python3-cffi_1.15.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.15.0.bb b/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cffi_1.15.0.bb
rename to meta/recipes-devtools/python/python3-cffi_1.15.1.bb
index c36f23b3dd..daa290a54e 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
+SRC_URI[sha256sum] = "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
 
 inherit pypi setuptools3
 
-- 
2.30.2


