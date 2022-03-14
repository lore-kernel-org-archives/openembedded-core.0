Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCF8C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3514.1647298135748845207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SZ7DVoqq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso413329wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zy1zbn53eHEfjZ37+R25EbEnSAiw9PWMIe9rYjjFazw=;
        b=SZ7DVoqqTB+IDi24xBR5Ggc5vXPgBpvbNWinsOrrI7l3I658FmH83p7Aly32On1kfO
         xnu97mgnBjWXnmQgsvresD2OxYmiFJsqghWv33+CeVnphfH339GsiUB/YVulrV+QeZJN
         joj6DfBw6QovP455uSNt7fjZHCxu5oWII+E+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zy1zbn53eHEfjZ37+R25EbEnSAiw9PWMIe9rYjjFazw=;
        b=V182HVKNAALMMg0vmoU84bw/002fytW1Lff6Wdc6wgSGvi1BYllAVXindfvjXtrRP2
         q+2yYNXwfrQIgFaKXNEESHRR/jA0sSVbH8PsyNwJ+aRNWJkMFR4xccWrLahjp3cKQBnK
         R8GCzfsSqSV96nOsuMMHOElMI7CynKF8ZD6PaotmxoqNuHHFlBqU2GmP/iid/mnYS29f
         BaxAuz/zU+iPtECU9dQo9iYn5VRFXreCJIkRitpsCKK8UV2UJfGFh9LsPSrVWprndaAS
         184uPxIl76+cPvh85+XhEglJoGc1300BG8BKf0el4Exqh9yVNionW3lOT+VNJvz75w4x
         zE2A==
X-Gm-Message-State: AOAM5333vk8nTK3bs/JHfH7MqHiRZRts71K1SSHqcuEdte0/mBH6Sob6
	u2rrLgtVu5nT8eo6++73RxjbnFjXQJBtDb+9
X-Google-Smtp-Source: 
 ABdhPJxKhrFMKFuEXCf2bsLjt/4W98i/pskBlkJBdv33a2B28PfHmvBX4fGr6M1eDnaECWqrtUoKPg==
X-Received: by 2002:a1c:c907:0:b0:37b:f983:5d4e with SMTP id
 f7-20020a1cc907000000b0037bf9835d4emr1005376wmb.174.1647298134055;
        Mon, 14 Mar 2022 15:48:54 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 15/33] python3-poetry-core: move from meta-python
Date: Mon, 14 Mar 2022 22:48:19 +0000
Message-Id: <20220314224837.834776-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163181

From: Tim Orling <tim.orling@konsulko.com>

A PEP 517 build backend implementation developed for Poetry. This project
is intended to be a light weight, fully compliant, self-contained package
allowing PEP 517 compatible build frontends to build Poetry managed projects.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-poetry-core_1.0.8.bb       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
new file mode 100644
index 00000000000..99ec763c4d5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Poetry PEP 517 Build Backend"
+DESCRIPTION = "Poetry PEP 517 Build Backend"
+HOMEPAGE = "https://github.com/python-poetry/poetry-core"
+BUGTRACKER = "https://github.com/python-poetry/poetry-core"
+CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
+                    file://poetry/core/_vendor/attrs.LICENSE;md5=75bb9823a2778b5a2bd9b793fac93ea2 \
+                    file://poetry/core/_vendor/jsonschema/COPYING;md5=6554d3a51d7cb0b611891317f3c69057 \
+                    file://poetry/core/_vendor/jsonschema/LICENSE;md5=2ecb81765361195731a6f72a89e449fd \
+                    file://poetry/core/_vendor/lark-parser.LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
+                    file://poetry/core/_vendor/packaging/LICENSE;md5=7a6e56c9d54ecd731ab31c52de7942f0 \
+                    file://poetry/core/_vendor/packaging/LICENSE.APACHE;md5=29256199be2a609aac596980ffc11996 \
+                    file://poetry/core/_vendor/packaging/LICENSE.BSD;md5=f405810d173a1618433827928768bcd2 \
+                    file://poetry/core/_vendor/pyparsing.LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a \
+                    file://poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=1211a1ac6eac40020d0f99c39b4e4270 \
+                    file://poetry/core/_vendor/six.LICENSE;md5=6a574656da93d9ef05431b45907e35b6 \
+                    file://poetry/core/_vendor/tomlkit/LICENSE;md5=be329e5ef9c9fe86738c9afe6ef3c11c \
+                    "
+
+SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
+
+inherit poetry_core pypi
+
+PIP_INSTALL_PACKAGE = "poetry_core"
+
+RDEPENDS:${PN}:append:class-target = "\
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-pathlib2 \
+    python3-pprint \
+    python3-shell \
+"
+
+RDEPENDS:${PN} += "\
+    python3-pip \
+    python3-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


