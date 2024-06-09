Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01CBC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 19:57:06 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.4126.1717963018109756189
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 12:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZf/rry0;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so6814011fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717963016; x=1718567816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EmTlex/AMTC8LIbbUWUs4cyu1zkMQehji5efJRQPt1s=;
        b=FZf/rry0pA3+33ZSJFvUogRCZzKZTB+2bAGenrCetldsnmNAE+fMnsr7UHGNIb75Rl
         I0b2LAw/WP/dptIeVzTYpN7NLZnYS2tUVocOIHUL1EUgd8xibdIaif3IGmTDAXDNTf2k
         mw/ERauCaZahtv6bs/KR5KcyJ0YG21ufa9tqEKetmBWPGTZdlctVrdCRoOnwc4Hgp8Qa
         BlI/bB3dglCCJw6QcBg8vx7In35oekvggJAUOCVeD56oVtjdO8JTuFoYwn1f2f7CkuTT
         yv5foHJXHGl4wSDDJJgJS58V0mj3dQ/m0I/AC4lkTlHHqqsfMM/Yj04jyOU4D4oUIbij
         O9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717963016; x=1718567816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmTlex/AMTC8LIbbUWUs4cyu1zkMQehji5efJRQPt1s=;
        b=lu0EjzyygYrpSsKC7hN+YvxcJ28fwMvm+cT/hecoJGS14mus9/ER/EG64YLnqGfnyD
         691vO0Np/iRVtxlw5XTp28p0/zrXoUANce4mUy/2mfvW+UXppfLtu/ifSoI9uRi90Ngm
         C0vmcgxv/PpTyKwR7qx2SuinmsvjN7EjR0v6L4BFclng8LDheDWy9KoesSKvo268Wuvh
         /3RHykJ7DLJWIfNsYgdM2iSLXR9W3sriCuALwXatts0d1jU+XGu08m4KWETN6es5RQnE
         WcGkAAP/xsn+xWumzeNtJMa+LLbsqelQIg077YeEham2MdX85O5XxcQ8mGxlH7+Y8FJN
         xqRQ==
X-Gm-Message-State: AOJu0YxX2doCL5AB6dljLH2YZeq2UQMiY2aRfx1hPDQydZ/bqVr3Mpx+
	aw4o10J1vVFoAYX6yPojQqiuUnOlD7i1doPAYA9n9vsCx+7tfMMux4hmDLlv
X-Google-Smtp-Source: AGHT+IHao+ZnXEVAPaiC/0QoC3qXqAMZvhLT7AMv8YDPLFk/KSCniIaeoZkp5qcBUVAYpwJbs2r/Iw==
X-Received: by 2002:a2e:80c9:0:b0:2eb:da3c:53b4 with SMTP id 38308e7fff4ca-2ebda3c9107mr23283491fa.29.1717963016020;
        Sun, 09 Jun 2024 12:56:56 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170:b24f:d7d9:1891:c98c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c67432820sm3522689a12.75.2024.06.09.12.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 12:56:55 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <an010@live.com>
Subject: [PATCH v2] cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX
Date: Sun,  9 Jun 2024 21:56:54 +0200
Message-Id: <20240609195654.432515-1-an010@live.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 19:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200464

The variable contains the suffix of the CVE JSON manifest file.
By default, this variable is set to 'json', so the current behavior
is not changed, but enables developers to use some other suffix,
e.g., cve.json (similar to spdx.json).

Signed-off-by: Aleksandar Nikolic <an010@live.com>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 56ba8bceef..93a2a1413d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -49,7 +49,8 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
 CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
+CVE_CHECK_MANIFEST_JSON_SUFFIX ?= "json"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.${CVE_CHECK_MANIFEST_JSON_SUFFIX}"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
@@ -278,7 +279,8 @@ python cve_check_write_rootfs_manifest () {
         bb.plain("Image CVE report stored in: %s" % manifest_name)
 
     if enable_json:
-        link_path = os.path.join(deploy_dir, "%s.json" % link_name)
+        manifest_name_suffix = d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX")
+        link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
         manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
 
         with open(manifest_name, "w") as f:
-- 
2.34.1


