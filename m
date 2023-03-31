Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E121C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:45:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.48109.1680241532941983417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GPQtY1ZN;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so13096143wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680241534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=GPQtY1ZNzhUQcqSXxwvv20Pt+kEwGPRICcNT+Xa+3zEzdoK0D3ZjiHfk4sQ26uo6Jg
         hpt7rzwhPfXJ8aoloEKSTUoMCe8SvzBcOzgGamoG42fkVfbwxnDahzRsPIP8yopXJHEK
         6/HPotIQr+RuKCqSKIFzftzcVD3LhlL3bOZ7vWG3QcsTc3jPfSWdje+zj+eOiMLa2aL5
         zzbgLEhsuLP11utRC+CyxaHr8rliStwhoiQ7Sa1bTy7quQFn3PGyEXiKsthXNrNW5k9j
         L/M8Df5c+SKr2Th6qcHHsIhjzR00mUluMIhuQT+mBPI2McT7+AWR8HYSSA8MckpMVxII
         BB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680241534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=6gIluPnXz8pHSAO9+dnwLt1ri22KPkC+H+B9pannLBEKQDNFQDzuAGsA6XCKpSiEtk
         VKM8kGWoZ0zKpMrR8QVchqvj1gAJiz5rT6Vk2TsZiZRVQPWwjyCw8yOR+8A1/CkqufFI
         SqC6+SbgLX4xON+rV2ScQEuxuFR0lMgVPXLBT2t2LRIqV64ujolrTZ1o+UDUWggFMbjI
         PfE6xY1YsYMTeelCE6iYQPUzkDaSdbPYpiPU++d6h6rPCGUaejb6alsQOGE0gsjr4e8M
         JkxCsLuYFIvfjTb1GAwkfEvtsZkJM+ZjhmapHxu5/tB87C5l0Ku/AkfVnXg1gDIIGV8d
         nxNQ==
X-Gm-Message-State: AO0yUKWxScs562H6L8wYQtJJUEVXFtONKqHc3+c22vxWYsRQAsvq0Lig
	tY+uH+Aow6fEdaSPGFdOV7juvONS2ss=
X-Google-Smtp-Source: AK7set8MXUzyhzlEmqee1/bAVZlVCiaycXK7CL/0LZ+8i3BpMOvAS2Q8M5W2ZDFM8maiAdGHCCP+Qw==
X-Received: by 2002:a7b:c409:0:b0:3ee:19b4:a2e6 with SMTP id k9-20020a7bc409000000b003ee19b4a2e6mr19582206wmi.19.1680241533863;
        Thu, 30 Mar 2023 22:45:33 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:72d4:654d:401f:66ef])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm12664307wmb.1.2023.03.30.22.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:45:33 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V6 3/6] devtool: add support for multiple git url inside a cargo based recipe
Date: Fri, 31 Mar 2023 07:45:24 +0200
Message-Id: <19ff7843ad82c2b3e245ce71d082650b3eed7822.1680238655.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680238655.git.frederic.martinsons@gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179395

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Without that, the possible git urls that are in SRC_URI of a recipe
are removed from SRC_URI during devtool process and so the
cargo_common_do_patch_paths in cargo_common.bbclass cannot
patch these packages to fetch them locally.

I use a generic type name because I foresee this change will
be useful for recipe that used a package manager (cargo but also
npm) see https://bugzilla.yoctoproject.org/show_bug.cgi?id=11015

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 26c5803ee6..b00fdba8e9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,9 +68,7 @@ python () {
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
-            if (url_data.type == 'file' or
-                    url_data.type == 'npmsw' or url_data.type == 'crate' or
-                    'type' in parm and parm['type'] == 'kmeta'):
+            if url_data.type in ['file', 'npmsw', 'crate'] or parm.get('type') in ['kmeta', 'git-dependency']:
                 local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
-- 
2.34.1


