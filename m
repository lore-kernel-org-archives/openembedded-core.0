Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86632C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9108.1647518247240512348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZPZMgqAD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x15so6987033wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nZGvd9YaVvZ3mPV5Lt/RUstyCP7kq4WCtinzNTYfsBo=;
        b=ZPZMgqADK+2KztXytRKiqbkggoJ6nuMGqJNEIsWAL2TjFECiF8X0HvjuEN6CTCxWWU
         GZDs8rw7d5nloe151hhV9UZj41znVUXbJDCLfn63VvPYbO3KgXJgC8IEyW3fch1dUbBW
         pifIoy5oHbhVESNCZvUviREsjz7BeTjBhsmzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZGvd9YaVvZ3mPV5Lt/RUstyCP7kq4WCtinzNTYfsBo=;
        b=50/GsUpKi8ijiRIl7QBuJgYHQd6H/VLOZI9aMd0D+nxydzyvZqI6UDSLnh7AsIKKUY
         MLZ5x3H2tiWnrwpmTRM9OEKmec0vnLdbm91knwxtg1CBG8Y3yTJAg4l7rXRUkOPHUCdW
         NlrPisY16RPl1DVcacMn4AIUPchiKr1gv3iecTj8glsoQQPTvwjXBjSjkUTgMkB3e/nh
         EEMqXb7LXyQdNLgYN16jnXz51y0zhw7DBdzQtQ71q6u7Rn0UwOd3sOrKXOsH9B5fbuIR
         OHfafoLl9PniHf+JX62DKR+ZqfQruRvW/6i4CF7vNdyFdgPWs4oVdJ/aMiMwFaW+fxiD
         p3qw==
X-Gm-Message-State: AOAM5333fPzMcmYCtbxdYK0lYZAVDSVj/7xt+vEyOuqvcbwykwP+dg4b
	Yu0zwNHDAbmMe23VZaulYkC8oytNb8cEwjnx
X-Google-Smtp-Source: 
 ABdhPJyoJD6qNdG138HsZgDBDtt5Ldr+xmESZ0SxG86vrO2ver+MMR7FnjJF4fvYhKR68zcWJC/U+g==
X-Received: by 2002:a5d:66cb:0:b0:203:ed15:fecf with SMTP id
 k11-20020a5d66cb000000b00203ed15fecfmr1734655wrw.278.1647518245051;
        Thu, 17 Mar 2022 04:57:25 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/26] python3-sphinxcontrib-jsmath: Add new recipe
Date: Thu, 17 Mar 2022 11:56:53 +0000
Message-Id: <20220317115700.993924-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163405

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinxcontrib-jsmath_1.0.1.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
new file mode 100644
index 00000000000..863458a1dc5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A sphinx extension which renders display math in HTML via JavaScript"
+HOMEPAGE = "https://www.sphinx-doc.org"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f0064c10bd544bcffccbc67a41c108d3"
+
+SRC_URI[sha256sum] = "a9925e4a4587247ed2191a22df5f6970656cb8ca2bd6284309578f2153e0c4b8"
+
+PYPI_PACKAGE = "sphinxcontrib-jsmath"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


