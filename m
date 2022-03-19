Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7363AC433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 23:38:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.13051.1647733107813877104
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 16:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gdCTIcyD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id j18so6625476wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 16:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpeuHDFio7zvMuatFZHUDPeBuQkGDK7klye0QKD3jy0=;
        b=gdCTIcyDM//KeijI4yTaIToCILfcWL+/+7C+0rA4FKsxaNkhmj/65/BQ5Z76DSsCvo
         1Gl5gGUtjfSrDS3HjzPd3rnU+JIQGpF1VMxr+yUENYZd1itglBQBH3l2JrxZ69UoCv5q
         Fi7H4QXQILFuGfrVvfiNw9sjA5YWa7DJ2WH34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpeuHDFio7zvMuatFZHUDPeBuQkGDK7klye0QKD3jy0=;
        b=CO047ScdTV1hyrmYAuFSWaW4iWTFu7Pyic2RyaCRCfclgMmwFfRCQ4P4kvnevMuoll
         8Zh/Es1SA/nLXOGoX49IjTYxbt1azcOsp4VsD8Q//KIwUJPRAxQ3586qF/nP88SP+TsT
         Zfh6ENUpJxBG43VQPJA02GQzSSTrTkVHdCGb6uRpg38dwEGzd6gL2xPLSKGqCFCLkdcA
         3m5hs8cBtI4X5ijSBCXMHptJl2YmJwwEWxpknQdNEtTpqlil0X45Ec326BBv3P87RZww
         TwEgIqTbc5YXO+hoh1xkdqAFanco6mO0AQ39G8kNMjjkyNNVKOdM2f5xD70Z4CDYrLa3
         CwFQ==
X-Gm-Message-State: AOAM533xkj6ggg9Wo8E58ad+LdFIg0TFFM/lVGwoVgLPdKe8c7BnzYsR
	4o7YYN9ieP81CUyE/62YpCRqiFf9mlm67ECm
X-Google-Smtp-Source: 
 ABdhPJwKVUyX1OPFRoLyO7Tp4BrFuwR2lSODcEjBm5W2gxdUtTEStkLNZXnROspHOB7+WlffRoqLxg==
X-Received: by 2002:a5d:6d8b:0:b0:203:e242:5e38 with SMTP id
 l11-20020a5d6d8b000000b00203e2425e38mr13580669wrs.105.1647733105944;
        Sat, 19 Mar 2022 16:38:25 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:11a8:91c1:35d3:962])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c358400b00389f61bce7csm14788853wmq.32.2022.03.19.16.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 16:38:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] toaster: Fix broken overrides usage
Date: Sat, 19 Mar 2022 23:38:24 +0000
Message-Id: <20220319233824.1125705-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 23:38:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163478

This fixes data corruption issues with toaster where image data wasn't
being processed correct.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/toaster.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index dd5c7f224ba..f365c091420 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -101,11 +101,11 @@ def _toaster_load_pkgdatafile(dirpath, filepath):
         for line in fin:
             try:
                 kn, kv = line.strip().split(": ", 1)
-                m = re.match(r"^PKG_([^A-Z:]*)", kn)
+                m = re.match(r"^PKG:([^A-Z:]*)", kn)
                 if m:
                     pkgdata['OPKGN'] = m.group(1)
-                kn = "_".join([x for x in kn.split("_") if x.isupper()])
-                pkgdata[kn] = kv.strip()
+                kn = kn.split(":")[0]
+                pkgdata[kn] = kv
                 if kn.startswith('FILES_INFO'):
                     pkgdata[kn] = json.loads(kv)
 
-- 
2.32.0


