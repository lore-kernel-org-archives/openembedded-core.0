Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8FAC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 12:29:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.10183.1648470566033948621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 05:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UvCwiozi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u3so20188006wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CkKK9kfPhsAVcP+RPE9Yrp3s+Anpcba7Tz+p4ksd10=;
        b=UvCwiozi/WwJaCHM+auYwWLKkEPoGsSemJVS6dujCy4TvAxtC9GiqV31tBx67IbXvR
         0KPjFBSLRjWgnPRiEj3ArOMy6RwEDpMQ8sYWAn3ZmYulT2pjj2ycqe60nBb7SVJ+KwC7
         wsMdsDW5bfV1pQSOppzI8Ktz3RhhJItuCUumo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CkKK9kfPhsAVcP+RPE9Yrp3s+Anpcba7Tz+p4ksd10=;
        b=a/dOOl2sMEKFkjq19xPhBlJAe3DGMjVV6TG8NCQngBavNcL81i2v4vZdsBCha2NXjA
         qSH5y/DeaXc51NvCvYY+cBwFFVxNzMzW7M8z7y+B8FYmVxKbJuranoXOGBqZ7C4sap1a
         v0cKQMr7kHXV1Lno9urOSqdzB+wHsKySTeoUldf/kPYf2Xn2TjKDirLo+GhhX5v6W5Dp
         m3Z21WNArkYF+pMYWHbHts9skisWd0OStsktBXoARSXCYYvWxF0bjjlCYZeEPbYYx+Jn
         Z1ZFXdTNYeW82GFryrQbPqZW17Zil9JBELSjcmi4HjzgPGvSI3N7ywB5bq9Su0hNCQGm
         jRaQ==
X-Gm-Message-State: AOAM533K+CfkKi+bYfH0GROWtEKdnG7Pc/200vJO9FMHgG5ycO6m1vvs
	k7I3ycbwbl0IHC2VXUXoxOrzfSp4Z1UUqMsO
X-Google-Smtp-Source: 
 ABdhPJzUnmMoahNAWEjiW+WuHLUTxb+lrBDQhgy3tErhk/ybZsYbd2NSNLrBgyYApR8JWPRhmz/ikw==
X-Received: by 2002:a05:6000:1ace:b0:203:d45b:fbce with SMTP id
 i14-20020a0560001ace00b00203d45bfbcemr22975665wry.673.1648470564167;
        Mon, 28 Mar 2022 05:29:24 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:69e0:aa6:3ee0:1c3c])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a05600002c600b002057f1738fcsm13117284wry.110.2022.03.28.05.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 05:29:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] create-spdx: Avoid regex warning by quoting correctly
Date: Mon, 28 Mar 2022 13:29:22 +0100
Message-Id: <20220328122922.1430750-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 12:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163705

create-spdx.bbclass:43: DeprecationWarning: invalid escape sequence \W
  lic_regex = re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index cae8cccd8dc..137db81a5b4 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -40,7 +40,7 @@ do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 def extract_licenses(filename):
     import re
 
-    lic_regex = re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
+    lic_regex = re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
 
     try:
         with open(filename, 'rb') as f:
-- 
2.32.0


