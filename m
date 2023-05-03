Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA47C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 11:19:49 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.16500.1683112781216703760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 04:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RGTvC4Fb;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b99f0a0052fso6956913276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683112780; x=1685704780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kivmCFfpfShey209K88IgaAbeW6FiERkUCk/BZ3c1mA=;
        b=RGTvC4FbnSTM7F42UhGjuZGcbSADRmT2zlNZHgGuL1olsKUVVC40TAQ+z7lZaeGMqn
         6zo0Lhf8RQpRHa8AZGfRZcQGnBL3c8+BzYwrWL3fi2y/ouURvyhaW00NuxWPYIGMyslm
         wrzw3/B2YzNpE+IscEV1g/Q9QJmFznUv7wB9DN4fV10MqUE608lj+4C10FNH2Cucj3Pn
         BQ0vRPJyB+Igl+zh+dt34Cjoi5jQomuAtAJ1qdgWfTgZpMe3Gov67SNAgjpljb2crSOc
         tSf8708q0KAII+MEPcxWIUW8WoKB9WpQmzzW04HOnDkfQU/hSetyOs2fYuPeDd1FTmNV
         2cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683112780; x=1685704780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kivmCFfpfShey209K88IgaAbeW6FiERkUCk/BZ3c1mA=;
        b=N/ouhXOWPe2bDYVd4z42qWiDQhNyIljL+O323e25cuJ2dW03h1ze4ZPf/5lTgMO8ry
         RJ2pIpGv2Emw4BunZFXuNsPOwIHUlI1/k7Ps4ddBOEj9olr2L5Mdz/RNgy59KlvKeBF6
         5ovKxIDok+hKOKnshsEBOmcChkp3Lez0o9Mb71S4jQNRoX/d2ziP+3lUdt78wlLIxr4h
         nXTaK3xBVf7uIHzFmUHu7ngrqpwP9lrUMWn4Gl2ab3ytqSAbsXZ8VAUtitDUgjEb/ZFE
         oatPs1GG4GnSVqdpr4XoTLGphfCnQK9j251xzDPGuS+NupIlnYSTaz0xMBeD/NKOp5tt
         DKLg==
X-Gm-Message-State: AC+VfDyXUWcjCG3udFlse8BTBKRzaJ53c/NSwuA0dh504erwI9C1N2cx
	pCJWcDvrU62bMOwfdmv0L0d8/5QkYAZwtw==
X-Google-Smtp-Source: ACHHUZ5P2gXSOiXIKVV0pghUxU2xJGHhTtiFEgQ2c6Sik+3tqC507XJ8O3KUgDSkQbdQbc1q7gjosQ==
X-Received: by 2002:a25:c907:0:b0:b9a:76e5:c99c with SMTP id z7-20020a25c907000000b00b9a76e5c99cmr18446817ybf.44.1683112780100;
        Wed, 03 May 2023 04:19:40 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id d3-20020a814f03000000b0054f8a3f6281sm1155016ywb.3.2023.05.03.04.19.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 04:19:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] os-release: Add CPE_NAME
Date: Wed,  3 May 2023 07:19:38 -0400
Message-Id: <20230503111938.942018-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230503111938.942018-1-akuster808@gmail.com>
References: <20230503111938.942018-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 11:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180809

Its time we add the CPE_NAME to os-release.

The vendor field is hardcoded to "openembedded" as it is the base
framework. We will use "DISTRO" to identify which variation of
openembedded is being used.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/os-release/os-release.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 860ee97224..aa37dec7c7 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -16,6 +16,7 @@ do_configure[noexec] = "1"
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
 OS_RELEASE_FIELDS = "\
     ID ID_LIKE NAME VERSION VERSION_ID VERSION_CODENAME PRETTY_NAME \
+    CPE_NAME \
 "
 OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
@@ -25,6 +26,13 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
 VERSION_ID = "${DISTRO_VERSION}"
 VERSION_CODENAME = "${DISTRO_CODENAME}"
 PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
+
+# The vendor field is hardcoded to "openembedded" as it is the base
+# framework for all derivatives Distos.
+# We use "DISTRO" to identify which variation of openembedded core 
+# is being used. 
+CPE_NAME="cpe:/o:openembedded:${DISTRO}:${VERSION_ID}"
+
 BUILD_ID ?= "${DATETIME}"
 BUILD_ID[vardepsexclude] = "DATETIME"
 
-- 
2.25.1


