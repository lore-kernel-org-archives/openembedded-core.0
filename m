Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A9ACD4942
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.15995.1695367478866861743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XU02cDAp;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so1803830a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367477; x=1695972277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcdopTEDKHt0u+NbWz3rAgZLxeZ0lTmU0N++6WJgrUA=;
        b=XU02cDApNLxbueyZWuCCg+rtVGzN5HyLbQow82H4ZG0Yog2699zRVHzCvynsq4tg2Q
         0XdsuRxYWEr4DnZ/z43vuIHHlM3KdFqM6VSqUP6sXhwtLSnQkljoEXsLFaPavMBs2Aey
         cHUtRL8W+1J82bYVHGOylEodkZohsQES3M9//PtPc9Ol8ZPPg5beOwrNSmXpeCFWAtHy
         Dm0D76p4Dl5zosw1xIZ5LbHuruutlZ26wJQNmgMpL1z9nh60s+J561VNZxgmI4+3ssmz
         9l7Trnm0Kkz9UnFIWoePejj/r4D/a569Lr3A3HYOu/ljiJ9k4UNdxC5yW1BrY+Mws0z3
         8d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367477; x=1695972277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcdopTEDKHt0u+NbWz3rAgZLxeZ0lTmU0N++6WJgrUA=;
        b=ELMR1yfY5oX2HD7tZXdT4AkzJZpnZlx8GyS1rgr8GxM0/uqiZg+UZot2W8Hju9ElCd
         1XWmPEGwA1bN+Oqf/01gn45rZ47L5Eg5eYaofderC+1x5CHGUKy/UAVNXDrb2IIoCB+m
         wjn6BvGgZ/TIj0Wn4q+qiUgTexDR3S9+vf/dCDfjvqTUFy7ujMFfUu9fIthX/WKSTlkX
         Dbd1HJ2cFRH9Kv4nf6Eovw4aPOwTuTMWOCqbqQHdsVNAfHk7QfMxMkhUgCNY9KiY0pSY
         x0XCzrbnyUychAIL4rq1LW4kfs5owbRqIoJkCe+0nomUrswaJ7b3GXOeV+WdxnyMOHGR
         Tl+w==
X-Gm-Message-State: AOJu0YytnHkkZMuYr4vSTxoA7NkrrqpGuZEJaOygxRYLvKp9VXo0Z+py
	O8pAkSi8h5zaZQui9kInjl1ExtWs1Ac=
X-Google-Smtp-Source: AGHT+IF4W7A7HeJi/UjMR5fFtuSw2aSgoUF+FptsEGUQfLlVYnaOTVw+XGtJaa+YYFG1CS+GslYd5w==
X-Received: by 2002:a17:906:1d2:b0:9a1:cbe4:d029 with SMTP id 18-20020a17090601d200b009a1cbe4d029mr6769121ejj.74.1695367477080;
        Fri, 22 Sep 2023 00:24:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/40] python3-setuptools-rust: upgrade 1.6.0 -> 1.7.0
Date: Fri, 22 Sep 2023 09:23:56 +0200
Message-Id: <20230922072431.1481743-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188049

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ptools-rust_1.6.0.bb => python3-setuptools-rust_1.7.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.6.0.bb => python3-setuptools-rust_1.7.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
index f1da4b50e7d..6392a4deadd 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
@@ -12,11 +12,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262"
+SRC_URI[sha256sum] = "c7100999948235a38ae7e555fe199aa66c253dc384b125f5d85473bf81eae3a3"
 
 inherit cargo pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
+# remove when https://github.com/PyO3/setuptools-rust/commit/7ced8d2a8f36e1b4fc41b5544636defb7bd44bdf
+# is included
+DEPENDS += "python3-semantic-version-native"
 
 RDEPENDS:${PN} += " \
     python3-distutils \
-- 
2.30.2


