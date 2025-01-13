Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F99AE7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 09:16:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13134.1736759772474828961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 01:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3zIrtcn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21649a7bcdcso66447185ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 01:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736759771; x=1737364571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fExbVJVKCIosxV4PI/Yvp1TXYotMnqbdjCs0C/T3MW0=;
        b=a3zIrtcnXqemNyE/dDq5NNyMsEBjRhoaFaMhIsGXuyPrTOTFQGQQCInKG5FMKq1uuj
         8ipWLnCaAg/2lnw6op/Kftt138Mn0idIGWrMEm6Mo4UFyw93P0zzPIKVn8ezysauveFM
         LzHQNDkX3kshocNEIN+B7Gw2KisLjJDZ0FnMgZmxoiQPdpU/mMVWrMT+qswUJX8cO+U9
         q/Mblne8Lofp/mEOTgdvyYD+y0Xjy8B8TypNmUZqo+R/5wtyIvMPmyl+wQA+Wz1OLxTC
         5B82v8B01jS5JuA8rmDWtY1n6IYh9nKxYtUynz3ko2NKOYs5IG4GjBXgLjVH4f52YNMP
         t4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736759771; x=1737364571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fExbVJVKCIosxV4PI/Yvp1TXYotMnqbdjCs0C/T3MW0=;
        b=mT3qfIUNjsQ8hIg3f5Mk2P3ZecPLRF5HPA9kxaXoEaTbx7jK13RhWztPvNpi9aEuv0
         YswjxUJuODy42JAy9JEk6gCvlN3vRC7nmk7gnWr0WbS0q016gl1RvSBtEy3k1k6jffIt
         /Dy0c3K6eaXUl3wfkRcf+CeWCkEP1Fc7W+Qk03cz3+yM70kgit3Kkdf06hx3Ve36e0Hh
         vE//UZ931mxm+uv9gQlynJhQhbHBMQxJmUAFJQrg/oAdv+0mCyYO8PJsSCVLxsGRMolw
         HbLpFkWpUkHXAOSaRc612j7l/vJ7+deodIZXpooAdRWGrbzLezMLA+fcol2YZm/TvMwD
         Areg==
X-Gm-Message-State: AOJu0YxxcJVdXzD8DqHHvHqBw7A+uhSMNWoCSZpngKBbB8APwLRHC+/9
	DFjqTzCkn+NhlkhXnCO2PN+yh9Nptt0uJQr1f/HLR6lhl67xWcxM6x6DNQ==
X-Gm-Gg: ASbGncvDmVlaF/huCwyK/4M6OwrVF7EvrdYK5TYvXQEH9bSb7upbwt0hg7LDB94NVTL
	eMAnZeMynSDk7OPAqdKQZjXUSkxgytoDsmnXiOJvEWV+kVU++iT/fy1UonPEfrs+zs2LOZFyvZR
	0EuIoHjgoLYFV9FU0NUmv3LqwMXkAQG5/5iALvT8PqcACq5BT4XPvV7yDBC8QNfXVAcSW+8htXl
	TsBb9NFToj/JFNHGkH0XZiVSQkCJy4UM8FrAzncHmak0N3U3LdXz5wN9GiN5xSJuQ==
X-Google-Smtp-Source: AGHT+IH4hFz1C4eMq5aSKPWli648kml0XuFEQTGgBGJemi/SjPXVvswf4A5Fi+hLki45khuxVDKtOQ==
X-Received: by 2002:a05:6a00:369b:b0:725:b201:2353 with SMTP id d2e1a72fcca58-72d21f65205mr29515462b3a.13.1736759770979;
        Mon, 13 Jan 2025 01:16:10 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.50.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b41sm5488666b3a.120.2025.01.13.01.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:16:10 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akash hadke <akash.hadke@kpit.com>
Subject: [poky][scarthgap][PATCH] poky-sanity.bbclass: Remove True option to getVar calls
Date: Mon, 13 Jan 2025 14:45:53 +0530
Message-Id: <20250113091553.81130-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 09:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209702

From: akash hadke <akash.hadke@kpit.com>

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-poky/classes/poky-sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/classes/poky-sanity.bbclass b/meta-poky/classes/poky-sanity.bbclass
index 81cd2eb6a6..a068c7368c 100644
--- a/meta-poky/classes/poky-sanity.bbclass
+++ b/meta-poky/classes/poky-sanity.bbclass
@@ -1,8 +1,8 @@
 # Provide some extensions to sanity.bbclass to handle poky-specific conf file upgrades
 
 python poky_update_bblayersconf() {
-    current_version = int(d.getVar('POKY_BBLAYERS_CONF_VERSION', True) or -1)
-    latest_version = int(d.getVar('REQUIRED_POKY_BBLAYERS_CONF_VERSION', True) or -1)
+    current_version = int(d.getVar('POKY_BBLAYERS_CONF_VERSION') or -1)
+    latest_version = int(d.getVar('REQUIRED_POKY_BBLAYERS_CONF_VERSION') or -1)
     if current_version == -1 or latest_version == -1:
         # one or the other missing => malformed configuration
         raise NotImplementedError("You need to update bblayers.conf manually for this version transition")
@@ -11,7 +11,7 @@ python poky_update_bblayersconf() {
 
     # check for out of date templateconf.cfg file
     lines = []
-    fn = os.path.join(d.getVar('TOPDIR', True), 'conf/templateconf.cfg')
+    fn = os.path.join(d.getVar('TOPDIR'), 'conf/templateconf.cfg')
 
     lines = sanity_conf_read(fn)
     index, meta_yocto_line = sanity_conf_find_line(r'^meta-yocto/', lines)
-- 
2.25.1


