Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8632CC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9107.1647518244387165925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ze2akb86;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id p26so1818939wma.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=twWLmUigJXAfdvajpgb4wJQusE2GIG1QhwZ7ibShLus=;
        b=Ze2akb86eb1+BX6ix66hivW/C09EaqkZ3ULphygWbx/2d002+pvxD/lLq7TdS20lLa
         qyhiMbvWYBcIzr2vBobjjLtQXLueh0MpOf8lWgqMmj0q78jF20war8sGc+9sBqVS0O9K
         8a5eioKyVPw528pS50ze0nbHQyb9fw1k0e+VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=twWLmUigJXAfdvajpgb4wJQusE2GIG1QhwZ7ibShLus=;
        b=mEv0sjVw0xvgsM80U0JbZeKTboUJ6/NUqyObpNpGhhOozqikesmaPFkr9eg0y97GtJ
         ppdR49/uizuGzS5huaBLDLBDjG8AXEQnH7kGDsDE0rv0vjPZz1Ei0IheMlfoKPHuiXqE
         p9FB47PDR4kltgi3pIn++DUJuswPAeoYWbKkfpBwyPmqh4z0spyG+DMOBOOt3jRjHZ9/
         qKYq5bhoW27pEHWnSGaQKc0DD6DrT0txYFqSqPUktSeklvi+N9A5O8lCCr7X7yFWa4FO
         V+dWkEYvyQRAvmqCgNP3146CcuncuTRn79T9WTZHQdD4EX8P+a9dQ9kMw0qMRlDTYPAZ
         TF2Q==
X-Gm-Message-State: AOAM5326gBcFdJmnPjSisyGY20BxHvopUCJ+ama9N5I4NpCKiqTHhOyZ
	qB6MB/1rwedvfHkXScYKYN1g44dK235rvrsu
X-Google-Smtp-Source: 
 ABdhPJzlmfyntoPFsV7W6QZEstq+G7WQSzYjmvf+jxmYPTIimLsgHWU3Yg3nDQXy4tzybZDO+AHKmg==
X-Received: by 2002:a1c:6a15:0:b0:38b:57e8:dd5c with SMTP id
 f21-20020a1c6a15000000b0038b57e8dd5cmr10579372wmc.160.1647518242615;
        Thu, 17 Mar 2022 04:57:22 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/26] python3-sphinxcontrib-htmlhelp: Add new recipe
Date: Thu, 17 Mar 2022 11:56:51 +0000
Message-Id: <20220317115700.993924-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163403

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinxcontrib-htmlhelp_2.0.0.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb
new file mode 100644
index 00000000000..cd8b987e0c8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "sphinxcontrib-htmlhelp is a sphinx extension which renders HTML help files"
+HOMEPAGE = "https://www.sphinx-doc.org"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
+
+SRC_URI[sha256sum] = "f5f8bb2d0d629f398bf47d0d69c07bc13b65f75a81ad9e2f71a63d4b7a2f6db2"
+
+PYPI_PACKAGE = "sphinxcontrib-htmlhelp"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


