Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008A5C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:51:30 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.18183.1683118282626290032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ludu/FBl;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a214572e8so55567947b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683118281; x=1685710281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKfjxXtGTgr19FI3/vCpiFZCXgjm+0lBnSt49LlwW0M=;
        b=ludu/FBlXmOPLYoMRSRKl3JHQDwqFavMiAqJnsKdRRqnkhUEQ82wtiKx695nT+cjGq
         RhML2vq33SjFtSG9o2T1Cq2Kgs+3VrfMyZiaWZr3k18cJXD5z03Eh2eqNa3JB7+FEwr6
         /FbFmOnR1GSvGcwncgs3SxwXrbKkH4rLzdaZK255Za4KW+NawEUDJ1NJ67gPjDCVZ8J9
         GK9NakSb0of/sfIxmef70VLN12D22juqZGE7k29YON/j6ovfOacNj6sMFTrM3nrSm0Fv
         1QiLYvbJZQHKUz//4X0WrxnGctAE+ZVzKfDmUs6gFg2P70745NrOJZI3X1Bdat+qX+wk
         DBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118281; x=1685710281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKfjxXtGTgr19FI3/vCpiFZCXgjm+0lBnSt49LlwW0M=;
        b=MRd0VYQuCUHEawR2XSi96YXFO6GTCmFbnNyR0etGs1JFQ5ZetUmghfG0jItNsO+tgS
         Yv68iY7sbuQfqJ+S2KR3tTiXU8dMldbrMIEdOFjj4snxUmtjv2vehjzDoZ0TKB9/+h95
         WTWqreWUD9B+s7LEmGp7MQnMx4TPFurh5FwGWk3FvOvqos3jgjVC3nvdJTRH8cfOVFlq
         HGziEPuzbJfs0/EETHcFhMF+8IgPxNzFb/5GkVcyY2Si1Ll5ekfPLTVmFRwL/rLGNQUI
         q8wrKTc6tu2A8M5eCUrOmEqhs13+0IyK8nYKJ5vJe5fLnvT6VYp3A7OM4N13NnUwr4mu
         eQow==
X-Gm-Message-State: AC+VfDyKwXqRgeOUfCZFBZF9x02oi7/OuDdWqPpv/1qcmfO2eN8E170f
	h6a+/A3zI6J+PymIyuJ589WniZRODAlObA==
X-Google-Smtp-Source: ACHHUZ75yRh+KGlvxHaqfNk9ZhYFTZ9saMqYFaSCaD9oCBlZHTm5i+CHm6lxF1BD4+UEAMFpu/PgxA==
X-Received: by 2002:a25:48c2:0:b0:b99:1053:becf with SMTP id v185-20020a2548c2000000b00b991053becfmr18849570yba.0.1683118281427;
        Wed, 03 May 2023 05:51:21 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id y189-20020a257dc6000000b00b9a7695e930sm3695949ybc.9.2023.05.03.05.51.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 05:51:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH] os-release: Add CPE_NAME
Date: Wed,  3 May 2023 08:51:20 -0400
Message-Id: <20230503125120.944934-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180819

Its time we add the CPE_NAME to os-release.

The vendor field is hardcoded to "openembedded" as it is the base
framework. We will use "DISTRO" to identify which variation of
openembedded is being used.

Signed-off-by: Armin Kuster <akuster808@gmail.com>

---
V2]
Add CPE_DISTRO
Improve usage text.
---
 meta/recipes-core/os-release/os-release.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 860ee97224..3f93711efb 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -16,6 +16,7 @@ do_configure[noexec] = "1"
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
 OS_RELEASE_FIELDS = "\
     ID ID_LIKE NAME VERSION VERSION_ID VERSION_CODENAME PRETTY_NAME \
+    CPE_NAME \
 "
 OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
@@ -25,6 +26,22 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
 VERSION_ID = "${DISTRO_VERSION}"
 VERSION_CODENAME = "${DISTRO_CODENAME}"
 PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
+
+"""
+The vendor field is hardcoded to "openembedded" deliberately. We'd
+advise developers leave it as this value to clearly identify the
+underlying build environment from which the OS was constructed. We
+understand people will want to identify themselves as the people who
+built the image, we'd suggest using the DISTRO element to do this, so
+that is customisable.
+This end result combines to mean systems can be traced back to both who
+built them and which system was used, which is ultimately the goal of
+the CPE.
+"""
+
+CPE_DISTRO ??= "${DISTRO}"
+CPE_NAME="cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
+
 BUILD_ID ?= "${DATETIME}"
 BUILD_ID[vardepsexclude] = "DATETIME"
 
-- 
2.25.1


