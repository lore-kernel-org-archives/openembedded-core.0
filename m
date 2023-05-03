Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B86CC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:31:30 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.21106.1683124282816392318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 07:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oNutCOh4;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-55a26b46003so58414877b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683124282; x=1685716282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iG8WAh3BR6OE4ClFZy2la7QXaeuiJ1KWbLQvf8ZRvzk=;
        b=oNutCOh4okjgGay6EyHY7ESsCVkLSgXY6ALPSokAgGy4HNZArGLJ8YJmmW3iGh4hd/
         4szmJd3n6ZGErDGvxggtcdCx2Yb7zbVmRwz3Gg63faktVf+b/lyOGtlC0xZpX8NMEMWN
         15EGirn/eA9Obs27I7uVSnJR1hwI90lrLSPrqGpt9FEQkrNk+Xo37o//NrQNdgcJjLfI
         t+m73uIthPQPTKZgU1JTJtnbKUIIBkZsJwf0UbLQLkS8hj+gMuvojPZlbnkgLaf5L7EI
         B+nOCFcDHAcMa16dXAj28FFFl/jOCRpmfiGcNrgDHDucRsI4BGs1JhTWHSURTuLYQx39
         SECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683124282; x=1685716282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iG8WAh3BR6OE4ClFZy2la7QXaeuiJ1KWbLQvf8ZRvzk=;
        b=Oy1THYv/nT/5GXUU888HZ1ZwGMy6RoCBfqWcc7LSfNbSprRS+YALLSq99sQ7Us0Q68
         nONoeVleoE+ykCmXyQQO7O5M3lkg40Vjr/jwxG/RCLfJcVInCYMQaQbKuAQ3x8iKRbZ+
         bk+4QI4L8pzUraBZiSjrwQka9D3W7KMnlT1/5fh4Zk3yu3tKlgEA9EDndCnR90MajI3d
         NeXSMG3fBHaQ8525ilG5DFtqvezClZZFhueMPU73w8sbtk56VNM4Fjku4t+RAuBCg5H8
         7EJQKVx2Pmlge/2Fd0Vcb/VMmcuB/n2z1BIeZJo5n32Yvd7rWqgbjrcjJ3msu6/60q1d
         4sSQ==
X-Gm-Message-State: AC+VfDz0e+A9M3yM/rb9nofAHtutUgkJx74kqoB8u7zTPZ33zFQC+ry6
	ArOnueFPfXcnML7TtMEo1x9ERDORi+YhMA==
X-Google-Smtp-Source: ACHHUZ6o0LD++ouMFDyhfXFaHUO8INwWa/I9/9FtrIljwTYPtwan1BZHqw0aFfh6Mcu1+T6FaLLNpA==
X-Received: by 2002:a0d:d4c7:0:b0:55a:501f:2a51 with SMTP id w190-20020a0dd4c7000000b0055a501f2a51mr10798098ywd.22.1683124281665;
        Wed, 03 May 2023 07:31:21 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id m127-20020a0de385000000b0054f83731ad2sm8719691ywe.0.2023.05.03.07.31.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:31:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v3][PATCH] os-release: Add CPE_NAME
Date: Wed,  3 May 2023 10:31:18 -0400
Message-Id: <20230503143118.1287997-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 14:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180829

Its time we add the CPE_NAME to os-release.

The vendor field is hardcoded to "openembedded" as it is the base
framework. We will use "DISTRO" to identify which variation of
openembedded is being used.

Signed-off-by: Armin Kuster <akuster808@gmail.com>

---
V2]
Add CPE_DISTRO
Improve usage text.

v3]
Improperly commented out text.
Shipped without testing issue
---
 meta/recipes-core/os-release/os-release.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 860ee97224..8906906bc3 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -16,6 +16,7 @@ do_configure[noexec] = "1"
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
 OS_RELEASE_FIELDS = "\
     ID ID_LIKE NAME VERSION VERSION_ID VERSION_CODENAME PRETTY_NAME \
+    CPE_NAME \
 "
 OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
@@ -25,6 +26,20 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
 VERSION_ID = "${DISTRO_VERSION}"
 VERSION_CODENAME = "${DISTRO_CODENAME}"
 PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
+
+# The vendor field is hardcoded to "openembedded" deliberately. We'd
+# advise developers leave it as this value to clearly identify the
+# underlying build environment from which the OS was constructed. We
+# understand people will want to identify themselves as the people who
+# built the image, we'd suggest using the DISTRO element to do this, so
+# that is customisable.
+# This end result combines to mean systems can be traced back to both who
+# built them and which system was used, which is ultimately the goal of
+# the CPE.
+
+CPE_DISTRO ??= "${DISTRO}"
+CPE_NAME="cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
+
 BUILD_ID ?= "${DATETIME}"
 BUILD_ID[vardepsexclude] = "DATETIME"
 
-- 
2.25.1


