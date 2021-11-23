Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD8BC433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:58 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.803.1637704677541944219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+0gCTOP;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id v22so692964qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QKk9HjInLzxXOoH9JI7pHC3+6lP7LRDlHu2Tqi+2r/w=;
        b=K+0gCTOPIzMPysQau6liJRcKhZbBZ5Y2ccR8OCscXO87qJgceTxhqOoMo4tjn6kiq7
         QmPWIxQ+Zj7fuZXhrdm+Od6DP95/v96ZCevTHVtSrFoX8AmpEvmg7tWFwmzYbcHXy0qB
         VfjvSQ9uwb7FZYVbruUNNE+9CJrCh+Lt47SXyV/8m5TrkEtmm7frn8tBUI3TiPm1YGcH
         59pIlR1HTPnk2kjNeH8OR2juEKOzQdkyl4U9RkDRYY5h7P+GE0RfQsaqVlwl2lCC55AZ
         3fU3tEAFlAjLCbqnkjgO9bvyGbkXiMlY+6QJxqqhR5AHgu5YmEQbhoyVHRqj4kMv3vJm
         /AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QKk9HjInLzxXOoH9JI7pHC3+6lP7LRDlHu2Tqi+2r/w=;
        b=swwZSo35rqH+JFJfcQJ13t1uohbTNecB10KIY1OfuKEgSwuy6D2KMwnQrYMt4Qtdbb
         9sAZ79jqEcoBREU112noKpYY3kYBIod54HVlsoSMEnugQIXee0S323D8/YMXL05lPYmR
         lX0zAByS+hyZgxm8EFh+MNOJhkdyha09VbvyagAeq/mN3YwcWqQbXZi85e39W22ZqkZk
         yIpoYvzmN8rPAjpsviFSEBgyzXQd2TIzvbeJ1aC4LhPrk5hWT697aE969eHU2Yxq9aUZ
         nhsN4/PALHRi7Y3Wmrlf3ZqjQf26z95T0sC/b9hdxihudRwLAkCoW0OgN1d75wqaY5tz
         9YNA==
X-Gm-Message-State: AOAM530huXPbgK2lRb5uZbcQMXgmxk6LhZG1B/BT9BB6zMtUNIgCPO5R
	G2XHlQdTb4dHftgLjulQlCc=
X-Google-Smtp-Source: 
 ABdhPJzzIeVj9JoWyChcFtVnAsEJiFf1+y6XoyG9d2JhMSOcKFTfl6bdG39q2/O4PBQotYYU58t0ZA==
X-Received: by 2002:ac8:7c4b:: with SMTP id o11mr867785qtv.358.1637704676688;
        Tue, 23 Nov 2021 13:57:56 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:56 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 07/20] python: introduce python3-dtschema
Date: Tue, 23 Nov 2021 16:57:34 -0500
Message-Id: 
 <c24c13ea3996b1bcfeb7c4454ae06b422db795b9.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158628

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel commit 53182e81f47d [kbuild: Enable DT schema checks for %.dtb
targets], which is part of v5.16+, makes the checking of dtb schemas
manditory.

To support the checking, we introduce this new recipe dtschema.

Dependencies will be imported in subsequent commits, so we can
track the dependency need on a per-import basis.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-dtschema_2021.10.bb            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb

diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
new file mode 100644
index 0000000000..36e572a35c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
@@ -0,0 +1,15 @@
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
+DEPENDS += "${PYTHON_PN}-setuptools-scm ${PYTHON_PN}-ruamel-yaml ${PYTHON_PN}-jsonschema ${PYTHON_PN}-rfc3987"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


