Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799DEC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:45 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.50631.1660877016275441885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CLtVMKoA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id o7so3170174pfb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=4H6TW9DwKIBpd5IUA7JKyYE2coNrwEQSacOW1u+zvPU=;
        b=CLtVMKoARPOl4GntxC9QDcQp3MlgaAGI/dqoE7a7gFE407ZzufBBwFlHxzVJFukfdG
         RbEQ4cj8DVJ/1ilU/ow7pt0biBSGl+soFR/+TClIJeh22trASrum8mK9nip78/wqYJUN
         F8HG6O5Xx5hCKr/5xojZINF8CXNnWChNnp7CQHtiA7ZpA2gDbF+EAl+7iK5Ffm4p8dNQ
         UUzZP6pt4TbIz/yP6kebUO082VLTeyMtpSsJLrVcCgpjnTYX2HeNmR+fYsDxKCW4v9m9
         z7vZFbWAw+SLOvQVuSaRnRecxH8HQnDFzwPfVgTUUityPCmliLLJU0aULAw5aPTI31Kz
         Qlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=4H6TW9DwKIBpd5IUA7JKyYE2coNrwEQSacOW1u+zvPU=;
        b=6ijI45pveXHGEi4SPC5gCrt+bI09js5RKqWcpzjmjyXF1xQ01bvJVDyzrhD/QmPngy
         VkfmuKuzRXg0dVhYee1vU1R6xTGi5HN1lPhqxiuJ3NZd9mMPU87OsuCirpOKPzDdIhYY
         Ua0wo9VM6vhSYUNBckOBweEQ/jxwGMCtrF0DPNaQSH+biPqtSyvGMSbSa/IfKaUx8MF+
         frUvO2SAOBTySF22+DItEw/XBeqHaPpB1dIpE8oKQdR52jNtKIC3FTFZOQ/pycUQCfS1
         cw92PiZsLKMYPLEJw4wl+n8G1/ZNNM5knG3PbxbMd5Lgvzyh2d3LYDrNS2NfRMSYOuDN
         a2+Q==
X-Gm-Message-State: ACgBeo3LVjL7XXjB/ATjQs9b1p2pz4wC+LQ/iS4jPg1qEMWQwURAbHPj
	Wo9Eetf5/lrBxVF1r8yU8PJFmQjMs65Ce2cw
X-Google-Smtp-Source: 
 AA6agR4WSBEFv+68ooZF2sDNipJWfnAFSb5g6kYYXkPci1rdKXPKN93GXCb7C52eggAals1MKqNETA==
X-Received: by 2002:aa7:8e91:0:b0:52d:8ebf:29a4 with SMTP id
 a17-20020aa78e91000000b0052d8ebf29a4mr5736222pfr.1.1660877015198;
        Thu, 18 Aug 2022 19:43:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/26] devtool/upgrade: catch bb.fetch2.decodeurl
 errors
Date: Thu, 18 Aug 2022 16:42:35 -1000
Message-Id: 
 <72bfdca08029c031cedc9dbbf366663632c1c8db.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169556

From: Alexander Kanavin <alex.kanavin@gmail.com>

Otherwise, workspace cleanup (removing bogus recipe and source tree)
will not happen, leaving breakage behind.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 74774f9b67580a8c56f605dfd4cc7b856bbeeae8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/upgrade.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index c57015eb40..39a1910a49 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -336,7 +336,10 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
         replacing = True
         new_src_uri = []
         for entry in src_uri:
-            scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
+            try:
+                scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
+            except bb.fetch2.MalformedUrl as e:
+                raise DevtoolError("Could not decode SRC_URI: {}".format(e))
             if replacing and scheme in ['git', 'gitsm']:
                 branch = params.get('branch', 'master')
                 if rd.expand(branch) != srcbranch:
-- 
2.25.1


