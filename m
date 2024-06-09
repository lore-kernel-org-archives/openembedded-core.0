Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE151C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 19:27:26 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.3540.1717961236269791399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 12:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JUon5v+F;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a63359aaacaso585362266b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717961234; x=1718566034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe3jT4Dg/3EVo1Y0dvLWAvF53v8ZFnMzn7mRHi3vvAk=;
        b=JUon5v+Fen4Uu2hCHZ8nJ0f34TMozgr9Ev6h2OgPRNwkgqMYmdjhILyype3OqE5ADW
         chHknGp29PfLXmuUpqlxtmuWD1wBEKqJ896fL/85vjWPCaB3Z9h5O1kUFb1UZduIvEpR
         FneF65YRr5kgbKVBIDRGWMCEMzADs8nY6mY/KhlzjjdY+MP8ZoX/YCqb0bdxfYanftgQ
         +WNPknUzj/QNhTHM1tVtU3Hp+mLrOFU5qM/Fin19HJA+wSmnqp0A+2ArBIlYlWs9q+q/
         tkBX8lIxr4orb0U5ZdcBVpGp+K+kBFKlcu2QfxNdYoUileScs75elBvfNQsHhjR7Lz9H
         fV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717961234; x=1718566034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fe3jT4Dg/3EVo1Y0dvLWAvF53v8ZFnMzn7mRHi3vvAk=;
        b=sR+QDjFZQlzR7bGLwIN3Hh/panc8UYnyq3AVpT9XaSnsSRmE/hTbSGw3ppZyPv7WBl
         AcjoNvjxUpayW9ztPEVOj2yDeyviCffzRA3JUDThVaqVe6GuKAKPUDJz3aQ9a40Slvg1
         VgW/H/VWNF1OogHtQaRNvqHAHTvQHzjNK6lZMFItdVwWf26Jb7thpmzOSnPGuWciqinb
         JuL2mlrhBeiaQsR94JJYJin8+Hrr0w3oWJslm6qTNsy3gDOfSG3ABt/StwxSeAOKNNoF
         IyqCjLySUPjvIC0iNONSmCfGzrVOpMPpbk3/nBFgLdYy+11oQ6MQ5QFxuMWbzvTBFttx
         sAOA==
X-Gm-Message-State: AOJu0YxWdfvyykejgmbBFtBYEp5xyX86g9YgWF9suhpQmYOCo1wJMDRJ
	kvk4NbfPCCpQZ7j/SU9T8EYdu5Fz0aX8Nms6q+v+yjQHlzYmuXHdboRexDik
X-Google-Smtp-Source: AGHT+IFeOASO4DFbTBqevr024lv756Dhn/T5KLu21z18DOjBoRY+aDBizhj2Z+peVgzwHC3NGSaTjw==
X-Received: by 2002:a17:906:f742:b0:a68:b49e:4745 with SMTP id a640c23a62f3a-a6cdbef6d8dmr461726466b.70.1717961234133;
        Sun, 09 Jun 2024 12:27:14 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170:b24f:d7d9:1891:c98c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm275451466b.20.2024.06.09.12.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 12:27:13 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <an010@live.com>
Subject: [PATCH] cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX
Date: Sun,  9 Jun 2024 21:27:11 +0200
Message-Id: <20240609192711.413867-1-an010@live.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 19:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200463

The variable contains the suffix of the CVE JSON manifest file.
By default, this variable is set to 'json', so the current behavior
is not changed, but enables developers to use some other suffix,
e.g., cve.json (similar to spdx.json).

Signed-off-by: Aleksandar Nikolic <an010@live.com>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 56ba8bceef..201bdb796b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -49,7 +49,8 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
 CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
+CVE_CHECK_MANIFEST_JSON_SUFFIX ?= "json"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${CVE_CHECK_MANIFEST_JSON_SUFFIX}"
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


