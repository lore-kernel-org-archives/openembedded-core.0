Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E4BC433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:33 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.4150.1637788472555845259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TRtPJ825;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q64so5056533qkd.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0+4CIbyQ4HuRpkTimYLLLpEXHnlcmfQrTqKZxirwEwM=;
        b=TRtPJ825X1acGF4MPDKa3NSTk25jWsitaqJrwEuhOTLvdBMQF0NrXzriMGHHKaz6LC
         KVMHLtocbiUGsjayC2LIvnQd5fbZmNW6kgdNRuij14a6LZpASVmNUxi4A26bG4qQOnWk
         ASe6ks+GJOf08uUpNS3uBqwc2ci2JAbGAbyP3iGD9TzcHH9N21m/GUyqQ/sHyyWgxjtl
         A3kaJforchAHRL9UpokeUe4OWYi3Midtz9JqFWVOdmR7+Z10MhnV6N1p9y7/aKpfj/pr
         rBe8lGLG+dPbP1VSSsfFh91WT2rYRb35PnSo/2vvTdVJL1r6j9WfpZE5k1QTv5HGYB74
         zwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0+4CIbyQ4HuRpkTimYLLLpEXHnlcmfQrTqKZxirwEwM=;
        b=7PN/CbeEPSoAmIIzn4KFMsfBJeDsla82FZBEuGZixhvPssXBgz1H5Dj2NaXXOJr07b
         QvpWzWp55D+TKAGzDVHb7lKRDXorzUvXJLwAzkmNTmnvvmtaqnet6k7QxQkBpnOwV+Fo
         TM5LwqZpJ1YiWM8O5fOvCaA2+9D8IPsERl2P1HXaBDCRK1/WQ1yhUrJHYO4bi80fDmKg
         SJ4ee3NWPBR6FoGnXHy8+pf9SLVIjblR53XxydM5oeMd8EHvso0Geu0cL8RWGRmF3gDz
         RuNjuIZ7qjXXAKeDj5xfi/Trcs9/9bq9VQM8+k+DEqqDqbk6oiUNY/lbI+KMGHr2eADt
         7ggg==
X-Gm-Message-State: AOAM533zoV6Rcb7Mpqx45NgsfRtMOKJDpCLMpQQAQ/rhzSjEo9BZMuqJ
	7HhNcd9FzGM9kbuYXZ0IMmA=
X-Google-Smtp-Source: 
 ABdhPJzAiGrQgFPcuKR16twCOnnJpzMMtAOoX5IKUOAc3AMvmflnqmjiKL+acbxqxVneAN0mOYFbTw==
X-Received: by 2002:a05:620a:127b:: with SMTP id
 b27mr9391894qkl.183.1637788471706;
        Wed, 24 Nov 2021 13:14:31 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:31 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 03/20] python: introduce python3-dtschema
Date: Wed, 24 Nov 2021 16:14:09 -0500
Message-Id: 
 <c653e0c3cd0edd038b3c3a2d9df442d2fe5ea745.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158749

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel commit 53182e81f47d [kbuild: Enable DT schema checks for %.dtb
targets], which is part of v5.16+, makes the checking of dtb schemas
manditory.

To support the checking, we introduce this new recipe dtschema.

Dependencies will be imported in subsequent commits, so we can
track the dependency need on a per-import basis.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-dtschema_2021.10.bb           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb

diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
new file mode 100644
index 0000000000..f16232d610
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Tooling for devicetree validation using YAML and jsonschema"
+HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "dtschema"
+
+SRC_URI[md5sum] = "d2f0d847ba2ad4d223317ef7304342b0"
+SRC_URI[sha256sum] = "d09c94d13f46e6674ba11ff31220651ad1b02dae860f5a87905dfac6b8d768d9"
+
+DEPENDS += "python3-setuptools-scm"
+RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


