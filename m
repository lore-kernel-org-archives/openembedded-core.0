Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D0CC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:40 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.4103.1637788479400044496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Icf3F4H5;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id i9so5056380qki.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BLeoqB4zQJ3QixWfKR334c+JwfTFTsMlhNv+teIFZbY=;
        b=Icf3F4H5CDA/mUcKAf8K7Gyr5/tNCu6qidmUNZpmJehVt11E8G0edpS+Yq6O5vMUlm
         nfeyfl/23JVCyBf0PpF4ucZzMu6dXdWI889QhTLEhaaTGjOsPfIqISe3ZQ6ne0HqkyGz
         3ncZE/V28MYddrsbA7C09S3opwPJZQR9cM9T2tqAdAWcBHw3z85cXYMV0GbBtPNfyceM
         YoUI5Y5hfiNaylJxXQTy4mfGNbRBE5UEkhc9ESVAEagPBp18H/GdivcROJZi9j6gKV4x
         iql19rF7z3vcC/dfaiBYhgdG4yrh/wrvwy6eHJ5uF05dBso0cTjRqANWUjmjuF7vM4Hy
         1XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLeoqB4zQJ3QixWfKR334c+JwfTFTsMlhNv+teIFZbY=;
        b=KI43oBOJqSl0lHxpzYMZ0m9dzjbjtn/DJGkenDpkUC9aNl0VsJQW0q6gyaXAvGK6d+
         4+J82/0PoWOvYA6iMOPUT1vjVyyTCQOYztJuke++S+oxY1o8oG63CrnB7z64wC+9u6d2
         cyc9zddG/G2qGPCkJZeo+cHZNfr9BaFhdEquNZfMbHADt5UVBbEuLVYvXkyJJemICLGA
         NiYP3uHtqi4XdOGgx8nKtCru9cGglDqrJDtQ3VgziLZ0gpMvgh7hNiChpAM5UuzqAwNt
         gTSFq6XE9d1JiUWmj5XjoWoG1f73Z4elbcNmv2YaNy445Dv6ALn5rzu6jsWS7f/Deaiy
         zhqw==
X-Gm-Message-State: AOAM531JVfoiDDJ3WuYOWRgzLJxKnj2wGPwDYlVUqEbZJFsgt2eL9h12
	G699wo+QayUkKO5oWOqzIag=
X-Google-Smtp-Source: 
 ABdhPJxezojH0EljBrsnL1rqrRbrpfRIfGf7I3J1JYCSiL4dMOZd3lDwWQ8AlGw59V6Y9GZCK7B6SQ==
X-Received: by 2002:a05:620a:1a8d:: with SMTP id
 bl13mr9334709qkb.200.1637788478561;
        Wed, 24 Nov 2021 13:14:38 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 10/20] python: import ruamel-yaml from meta-python
Date: Wed, 24 Nov 2021 16:14:16 -0500
Message-Id: 
 <aec89781f1b37469ca09bba2de1ac334991da8ba.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158756

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing ruamel-yaml from meta-python. This package is a
dependency of python3-dtschema, which is required to validate
kernel devicetrees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-ruamel-yaml_0.17.16.bb     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
new file mode 100644
index 0000000000..e64f196004
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
@@ -0,0 +1,23 @@
+SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order."
+AUTHOR = "Anthon van der Neut"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe"
+
+PYPI_PACKAGE = "ruamel.yaml"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "1a771fc92d3823682b7f0893ad56cb5a5c87c48e62b5399d6f42c8759a583b33"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
+"
+
+do_install:prepend() {
+    export RUAMEL_NO_PIP_INSTALL_CHECK=1
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


