Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8636DC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.9222.1647518242069009312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S+NVuBev;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id p26so1818888wma.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tsBiLQByKbf9eWm+l3buqeBKiBJmXt2VAu/wCWe/g4Y=;
        b=S+NVuBev0fyawLLVBU/s5TjCpl5UImt1timYg05apO5ZVDtRMjzIZwhOAOQnhUlWcR
         9e25Xo6VGTVbidkGTc+eQYMjk0RR0xnriukXfOfrqFZE7pFkqMdIatnMHZLRt0u5QzfK
         uS1Np0tm3lCvjdRtp0GUfNc3F7cBx9gk7MVLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tsBiLQByKbf9eWm+l3buqeBKiBJmXt2VAu/wCWe/g4Y=;
        b=YxwQVzAbOKzNu8kVS6bCOlsZHSb9bHJZ8U+FONjSo2dQCI4CjaDOer1YR90nMIV01/
         qv0wMKHBa+mcZw1mq5MsD3X2kGM1flfCfICD+RMBLXvsYznf1SH0yhqBsd2vybj9H46B
         j3U7kI1KglyH4mA3fbYGtg3ava5Q9rpMp79sP6FJTBNwhDztEBM+AhJYCKLa9MMZYO7E
         ChVdnQhedOdDU+asbp0mYqkdGkq82hU7M/qG3n5dnwIirEPuljjxBYYZ2OoP+fzwkvSo
         FnR4XhRbfzcD/6RJgJ9vzt1agRjCMs8lFZa/dTmWu14VoE9A0ZKCijp4OlXoLYkbSe9s
         QUoQ==
X-Gm-Message-State: AOAM5336WzoKjl03elsu+pxh0r99j6yak3Jtu/uRKzlNQ86Ym0mbuar5
	QNvHcbhtWvxlT+GCdqrHvy+GQ+MMjmUhW9I7
X-Google-Smtp-Source: 
 ABdhPJxxdcEppUiW0DcDBELirkKUZJYV4EIzTfW27Sbsu2KRGCypjfL3RCO1qM+QkbtmtTMBduNfTg==
X-Received: by 2002:a05:600c:5021:b0:38c:70c0:80e9 with SMTP id
 n33-20020a05600c502100b0038c70c080e9mr3559229wmr.91.1647518240226;
        Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/26] python3-sphinxcontrib-qthelp: Add new recipe
Date: Thu, 17 Mar 2022 11:56:49 +0000
Message-Id: <20220317115700.993924-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163401

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinxcontrib-qthelp_1.0.3.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
new file mode 100644
index 00000000000..8ebfbba7410
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Is a sphinx extension which outputs QtHelp document."
+HOMEPAGE = "http://babel.edgewall.org/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
+
+SRC_URI[sha256sum] = "4c33767ee058b70dba89a6fc5c1892c0d57a54be67ddd3e7875a18d14cba5a72"
+
+PYPI_PACKAGE = "sphinxcontrib-qthelp"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


