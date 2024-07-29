Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A34C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.55952.1722258804782699692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZnLdNjir;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cdadce1a57so1978822a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258804; x=1722863604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LIQsEwxymgdrIL+EhjYr2gyswMZogX4N1BPX1VdGGY=;
        b=ZnLdNjirNruEo2nuygQ/yPlNgY6Y2PdBEnjupFlNyTA492bM2G5Lq5eFg89fJCStLi
         pmRL0PrhhjBDxVCiQ3f42MOkGJmPnJmCapOaBHbEU2WEenp3Q0CwxzzWS9j1v0hUhsY3
         UnLuIJhenL1tvwtyVS6F6hX4Eus6ZmOCozMELx6lSRQr4+cPgeUwwHwDWxYkxJsdy0KM
         Dgh9/9I6OuuweGlWXRGBzedsOUdVj8H4yiDSdp8gYlbrfFFpyWgZ4jsTg1E4HJldNjnM
         PZcCtAEu5e0Dfkp95wcVHt0Bwf8maIyRDZ/Gw14AksGwtzyr2N7IU+vdgpdshe8W4pg9
         kMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258804; x=1722863604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LIQsEwxymgdrIL+EhjYr2gyswMZogX4N1BPX1VdGGY=;
        b=Le3zsLMdsBMHjv9t9r/ZAVtP1AqJenrboVP7MdAeXRtTaXw0HBvTcl8rko4DZBjYiv
         tUu7n+fx/fWO5l0dDs13MjWb2CQkMDQx5COOG7dvT6voPBDMSYXirslD0ZTUMikiSWD0
         C1II5+YtcPD5biIE8omT04IgSsfHhaZQgPJf+NFBEPukPPOzLfgTj7uGYrUZ1gdnnBoO
         eE0n/dxxq7bVgwKs7JxmKwmSDgn6aueZzW/9S9iJvrmaU1cE5gIvt8FAcSp28lukzyu6
         vccZVKg2fUUfeMeebIH8f8dzKrtb8GTZ9iOa//pCA2pLnh0+CR6i+u4YCSnUIF3C9byw
         Kttg==
X-Gm-Message-State: AOJu0YyZ41BIn+6ynOf/KVdR0oKXzmSUU1wY+ZQiRHW4QmcYAkrB552R
	XXotOUzMLctXId9CaJJn2WLTZMhsIWYCZy3LBrZqF9RfSLGSyQgZhG4nPXWJ/vw7GgOYLbrI4c9
	0ublXRA==
X-Google-Smtp-Source: AGHT+IHLSdi1IRhtFaEmCYiZeohvrCAWOpY8z2kxGAV+m2WdrQNj03qisfadtugsPvwbUju25gijxA==
X-Received: by 2002:a17:90b:e8e:b0:2c9:5a87:f17c with SMTP id 98e67ed59e1d1-2cf7e1d8e63mr4881006a91.15.1722258804076;
        Mon, 29 Jul 2024 06:13:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/37] oeqa/sdk/case: Ensure DL_DIR is populated with artefacts if used
Date: Mon, 29 Jul 2024 06:12:30 -0700
Message-Id: <048467673ceb075277c5a4fbbb40b9c3e41864e0.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202634

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Where we're using DL_DIR in sdk archive to try and cache testing artefacts,
copy into the cache so that it gets populated and this doesn't have to be done
manually. Currently we're making a lot of repeat requests to github as this
wasn't being populated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3284958a2cc6c90a5fac26976bddc23f821c972)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/case.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index c45882689c..46a3789f57 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -6,6 +6,7 @@
 
 import os
 import subprocess
+import shutil
 
 from oeqa.core.case import OETestCase
 
@@ -21,12 +22,14 @@ class OESDKTestCase(OETestCase):
             archive = os.path.basename(urlparse(url).path)
 
         if dl_dir:
-            tarball = os.path.join(dl_dir, archive)
-            if os.path.exists(tarball):
-                return tarball
+            archive_tarball = os.path.join(dl_dir, archive)
+            if os.path.exists(archive_tarball):
+                return archive_tarball
 
         tarball = os.path.join(workdir, archive)
         subprocess.check_output(["wget", "-O", tarball, url], stderr=subprocess.STDOUT)
+        if dl_dir and not os.path.exists(archive_tarball):
+            shutil.copyfile(tarball, archive_tarball)
         return tarball
 
     def check_elf(self, path, target_os=None, target_arch=None):
-- 
2.34.1


