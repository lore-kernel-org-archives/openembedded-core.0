Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F2DC3DA49
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 10:19:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.90039.1722593935336090793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 03:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MgnVVTGt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso53202305e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722593933; x=1723198733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8TunJkGvFLuFJ0vJVdamLZmzDG7iSQ8/cEJA2y5UOQ=;
        b=MgnVVTGtNEzJOl6bUxYUJYDWa+ccFXhsGLyS+KA2b4gBMPl1XoC12ghbZbJPK2IkjX
         KJF/4Olv8HQ+xp6OdYmf3bXcFUqetPYo7jN2mq1C8zMBMaI1hIwOKtLNud/9CvMP540l
         7HhXmpB3fJmBxosq/LzTj7+0UQjQ1bUrWiAqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722593933; x=1723198733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8TunJkGvFLuFJ0vJVdamLZmzDG7iSQ8/cEJA2y5UOQ=;
        b=w+WF6diIkIjgr79Is6D3tHT/qSOa6Eg18Y+DyXXRuXJRvAz6X3TdbOFgQPdHHT1Zen
         fs1ELdV5RTVJnuEs8ODLV/VNOjknlJSikCiE+mDjX2xQqxViNrK+scFhaLfapsbNRWDp
         IsANqLCYWjFAUpoq7lfSMb6b87GWsgknXVAOVMLx1yj+mP2gOubwVjvkKMF1tmVrwCTE
         DDoU6AEPGpnWkdBS2gpYCPfrOv5NYvoRMsw7tr9L/ga4zv7/Y7aJrA6tvxRdHb+tzjyg
         ZzTSaepqGAZUoGmSTebAWVAaoPjrHHOCwPOtpZlzMCbz74tD4wL8PrbQbmHeLNkx5xmb
         85bg==
X-Gm-Message-State: AOJu0Yz07c7AAj7Y/BKspGLWWcvcSmRB6XlKMQfaQmjf2klYdxp8Ll7a
	5HDf72rzNZcmqYhFjjstjJknJLgWcqot9x4lkQDraXxH7bYgnwmBF9Lzarw9dYA3/Qj5ahyvWXx
	gMZg=
X-Google-Smtp-Source: AGHT+IEDMGuSJbwa9cNHaT6FlHPOlm4gwDADYe7E4TC8AxE8iu1P2BdnXuukAP7grICD+PjgTTtS3Q==
X-Received: by 2002:a05:600c:3544:b0:421:7aa1:435 with SMTP id 5b1f17b1804b1-428e6b81cbamr17390375e9.25.1722593932736;
        Fri, 02 Aug 2024 03:18:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2ef2:8ccb:3250:e48c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01e0a7sm1573924f8f.43.2024.08.02.03.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 03:18:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] sdpx: Defer loading of SPDX_LICENSE_DATA
Date: Fri,  2 Aug 2024 11:18:49 +0100
Message-ID: <20240802101851.437996-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 10:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202894

Loading a load of json files into a memory structure and stashing in a bitbake
variable is relatively anti-social making bitbake -e output hard to read for
example as well as other potential performance issues.

Defer loading of that data until it is actually needed/used in a funciton. We
probably should skip putting it into the datastore at all in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 2 ++
 meta/classes/spdx-common.bbclass     | 6 ------
 meta/lib/oe/spdx30_tasks.py          | 3 +++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 509d3b58b6f..4930793cd97 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -401,6 +401,8 @@ python do_create_spdx() {
     from contextlib import contextmanager
     import oe.cve_check
 
+    oe.spdx_common.load_spdx_license_data(d)
+
     @contextmanager
     def optional_tarfile(name, guard, mode="w"):
         import tarfile
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index e1528b6d0b5..cd9cc0db987 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -39,12 +39,6 @@ SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
-python() {
-    import oe.spdx_common
-    oe.spdx_common.load_spdx_license_data(d)
-}
-
-
 python do_collect_spdx_deps() {
     # This task calculates the build time dependencies of the recipe, and is
     # required because while a task can deptask on itself, those dependencies
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9d5bbadc0f4..e9e99756dc0 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -452,6 +452,9 @@ def create_spdx(d):
         if val:
             setattr(obj, name, val)
 
+    import oe.spdx_common
+    oe.spdx_common.load_spdx_license_data(d)
+
     deploydir = Path(d.getVar("SPDXDEPLOY"))
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))

