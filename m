Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CD1C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 11:57:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.8311.1634299051520119982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 04:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cmwLkqfD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u18so26182916wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 04:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vn0mTKsjLDsVUOfBon1GeuRL/1NXlT73lDgl6UOHhaY=;
        b=cmwLkqfD+nv022gyNztZVPV5EJH09Ecqot+UDXdJKf4edcRu6sSSjEAPBogA/bOZ7K
         eRRR5lBiKjZCGbEvXe9LnATu1L5/nPpd/0uzGk9X0L8LD7QQWNv6sUCo44vWgHOljsgp
         BxXTFFwIqM3H+5ULii0ETWT+HaGwAg/tStgv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vn0mTKsjLDsVUOfBon1GeuRL/1NXlT73lDgl6UOHhaY=;
        b=s0hpHjrai154gwcEKI1j8X76BhuK90zAEGcHLgRMvfn6jf5QNvM9vTt8Ez2qFkt9ea
         nMkbTEwl/kj+CzTiSdKBTpWJ5wDK3dLEIkrEWRdqYt5jNWXICQGovQ84tkimoGGN0/Vk
         TQbg2ZkJP1cOWAxqLronmZLZmqbXjpejdAul/Cw8FdE/3BWQu2T6ShCTo8V6oN2BwZi/
         zR16U30koTUz92LYS3JfYl84yQx9i6rfKKjjoJ0dqcZTyHmVPXCiIAsWCcYjFQu2HQrr
         EJTB/dIL6F4xQ9fKg09hyHncyyiaMJ42oOm6Uo5+LJxTUnjGA+QZhk9E1jgnDBQCEJHy
         ISFg==
X-Gm-Message-State: AOAM533O4vbMM+MkKvvQzU1gu0zk31Y0AcpGrFJGXZCfv3C/i3e1C2iv
	CthaDaeWFLfpr5/bSuvHGYCtAKuMbKnXjg==
X-Google-Smtp-Source: 
 ABdhPJxTW8YtZZ81ZJkxyGH1zw9TyE1pkwZnElnhdGtZqOPZP45fwC8PBhgILY5Hwuo6vxoMQRb7sQ==
X-Received: by 2002:adf:9791:: with SMTP id
 s17mr13481612wrb.122.1634299049673;
        Fri, 15 Oct 2021 04:57:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 25sm10450413wmo.18.2021.10.15.04.57.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 04:57:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Fixes for eSDK generation after zstd switch
Date: Fri, 15 Oct 2021 12:57:28 +0100
Message-Id: <20211015115728.2951596-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 11:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156991

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 scripts/gen-lockedsig-cache           | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 35679208bcd..9187f53f133 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -550,7 +550,7 @@ python copy_buildsystem () {
     # We don't need sstate do_package files
     for root, dirs, files in os.walk(sstate_out):
         for name in files:
-            if name.endswith("_package.tgz"):
+            if name.endswith("_package.tar.zst"):
                 f = os.path.join(root, name)
                 os.remove(f)
 
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index cd8f9a4356d..cc674f9c1b0 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -94,8 +94,7 @@ print("Gathering file list took %.1fs" % elapsed)
 print('Processing files')
 for f in files:
     sys.stdout.write('Processing %s... ' % f)
-    _, ext = os.path.splitext(f)
-    if not ext in ['.tgz', '.siginfo', '.sig']:
+    if not f.endswith(('.tar.zst', '.siginfo', '.sig')):
         # Most likely a temp file, skip it
         print('skipping')
         continue
-- 
2.32.0


