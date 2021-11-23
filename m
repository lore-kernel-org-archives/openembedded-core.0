Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF425C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:05 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.810.1637704685100660963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AasgACou;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id d2so632747qki.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BLeoqB4zQJ3QixWfKR334c+JwfTFTsMlhNv+teIFZbY=;
        b=AasgACouUs3+aoIrGgZWE72tqBuKOKBa18hS1yvT4J3+AjB/eqBSIKIotUvwSMRrHe
         erRt3UnzpvGOzptFXfC/krlxwO9i+mmlS25d4o4vzJbET+KwLlgTuUN1nqfOQhx17e5x
         EAly5wxt3D4DBdV33gvA0QFg/1AEgL4RwFsM8Rh2Krk75PzA8XOFw3ONyjHxYqyrgcAN
         qk0RPsZwLe/xGha15q5NQO/PVX5i9mBh7sYHj51VNmkGSSZt3LDNWYhUS890EQbhDaNF
         wEFZf3iEL8IXOy621da9vn0d519nh06t4+E5V8rq9BI7anTt1b4jk/xPUK7qlceRnQjJ
         mW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLeoqB4zQJ3QixWfKR334c+JwfTFTsMlhNv+teIFZbY=;
        b=29Wdxp8D6QZgHuBTUZTx+P6jbousu4S90dMfXV2hN7bE12AT3aN1riMilfVZ7oJVv1
         jtZzqenSAhejPGXwWqo5Cj5uKXHa8BbU2UDHySqSeG/VOXIxNsUFm1mbTaZjSdWXXZvX
         /ODm1W032zK4WX1oK5PzKhsqEiUER8+UzZunHuSv+/Eec694v61KOioN49j67XovnW3i
         siQvYNfO5K9a5C6CIMohjNNu2RlChLFCXZyUuISZEYy6Ui4qFP2P/TXIirYS+sya9BVi
         YwVERSztElIdzLHaiYtkuXtVGNGjovb+lmJYjvDiOCspdN/mkPoQEJn2sy3ilL2371/r
         zH3A==
X-Gm-Message-State: AOAM533vMg/2VIQzFyxM/vVysdTp11ydAdw+feA0STuDUsG+AMaGydMs
	D1RKQziLLhHceBISU2D9y5w=
X-Google-Smtp-Source: 
 ABdhPJwmmtouECRuJmS9DZKu+GfxazvX383cEALZQ8A7lu9a+UFT9bcjAkRr01BujwSsAUOZtK//3Q==
X-Received: by 2002:a37:9f46:: with SMTP id i67mr727824qke.254.1637704684245;
        Tue, 23 Nov 2021 13:58:04 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 14/20] python: import ruamel-yaml from meta-python
Date: Tue, 23 Nov 2021 16:57:41 -0500
Message-Id: 
 <719f36203a73e361db431605378787f8aabe5d28.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158635

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


