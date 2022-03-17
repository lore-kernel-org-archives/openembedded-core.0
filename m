Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85673C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.9383.1647518250590026297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QNFFXX8R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a1so5640501wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7v6VhlligqdHDU6PMF/TDrwc8reLgHyzmQt4gBRKQo8=;
        b=QNFFXX8RfLr/SZu8IBNbbiJ5qyj+VCh3PBeK64CYZLtBJ7T58irKw0JpMo2Mx98GQ2
         yPhbHvVaLl9iFz95+EYlOBWK2zTvR8xnRyDQyGprjslvbqkcv7uo20YevVrvBjPpV1FL
         2tfVLM7qsmDSPX8gl+ucyqEyLRg5sCHr0EKvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7v6VhlligqdHDU6PMF/TDrwc8reLgHyzmQt4gBRKQo8=;
        b=FtFgyXEs0BY+CPVka3NbjBAI/b2nQiw5KVyrdPN0OXm+SU8GPwC/HxCY7DKIDPdkjH
         58G+Duk9QNWL2QOHhsIgPIWmkWghd7HHF/lGUjCVcnAaqHUVDuG89yGaeMkqRFyRM28j
         KKiy0cQbK7G1lkRo/kJ+/o53cXSC/wnpKGaBbGAzTyV+ajKrca52CkIhMbD+JZQnjsJP
         LpWufyIjQW+HZVvQ1ll1VD+yGPil6AjHcw21RGRj5qFstmExbBzdpnqGPe6Oui5GqXkr
         uh0uOCfjKTPh71I2sDWQYCnl1kUknldsWDZI56juRPam8duNYXNHUM1VLdSfUZtwSmLq
         OTBg==
X-Gm-Message-State: AOAM531E+xNl21lXFiTjpO9IP860pML++EyRtZjEz3eJw1O08YzKjhcv
	q5056BGGuf3byALxds0LWuAhwpttR6wWK7Es
X-Google-Smtp-Source: 
 ABdhPJzX86g/lMhsdGYbHFL1Rq+REACUQA4xAhjFrnXkBU6+600D7LGXh77QK9UGPf5XSRPZ8ojufw==
X-Received: by 2002:a05:6000:1a88:b0:203:8de9:47cc with SMTP id
 f8-20020a0560001a8800b002038de947ccmr3657233wry.182.1647518248826;
        Thu, 17 Mar 2022 04:57:28 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/26] python3-sphinx: Add a new recipe
Date: Thu, 17 Mar 2022 11:56:56 +0000
Message-Id: <20220317115700.993924-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163408

Needed to build the sphinx based yocto-docs

Based on a recipe from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinx_4.4.0.bb            | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinx_4.4.0.bb

diff --git a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb b/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
new file mode 100644
index 00000000000..225e7737f60
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Python documentation generator"
+HOMEPAGE = "http://sphinx-doc.org/"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de4349dda741c550eb8b20f6b92f38d7"
+
+PYPI_PACKAGE = "Sphinx"
+
+SRC_URI[sha256sum] = "6caad9786055cb1fa22b4a365c1775816b876f91966481765d7d50e9f0dd35cc"
+
+inherit setuptools3 pypi
+
+RDEPENDS:${PN} = "\
+    python3-packaging python3-docutils python3-requests \
+    python3-imagesize python3-alabaster python3-jinja2 \
+    python3-babel python3-pygments python3-snowballstemmer \
+    python3-sphinxcontrib-applehelp python3-sphinxcontrib-devhelp \
+    python3-sphinxcontrib-jsmath python3-sphinxcontrib-htmlhelp \
+    python3-sphinxcontrib-serializinghtml python3-sphinxcontrib-qthelp \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


