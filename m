Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BE3C3ABCE
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 04:17:21 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1388.1726460236157374244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 21:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbmtwI2x;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c3cdba33b0so5000401a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 21:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726460233; x=1727065033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZxPb6x2UI5/whxeDr7UwL/SndKwm/55WiY986W0sNM=;
        b=lbmtwI2xTKefvh+DB3Ii2zNxOWNU0zx8LxhKxdPs9vJIoEunjUYuKIIsOg+3hnkXMG
         zUKJ8AwCOuHpIIjb1p+f+X/ZKcW8OHIT3CcfSnvR0xbXIjb4+3bvZ7xMPKMuyiHjXESy
         OGWaMgXlvdr6N5SiI32dOtYKk6rzTt52+JZnlUYHGw4UmvEfyXBQNzU+vQnfjAFttf0s
         efimbismgKCphaxuNg20mQ/JK2J5B+g23OwNvwrbs6lsuM4+B9Fa+sWty8eQslA76SBk
         ra7SEWajrR+5m6POc54PFqYF6ZKcodVRxFCjBPcj+B8dGgQrZs5Rx4MDX8mRBPFxkUGu
         +Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726460233; x=1727065033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZxPb6x2UI5/whxeDr7UwL/SndKwm/55WiY986W0sNM=;
        b=ozjqrbwX7asrMyDOfprR0Mnoru7bZefRl2JAY4y+bES0q5wDjp/WTsResaQc/77s4b
         VQYXD973bApgBNnceNHWTE9s6stAZ+iR7FK1veFj54sjjjdrgKtERh4+wPcsVMQ7Rq/A
         +d3FJgmMucvblWFEf6JVjfrkK8P4Celdo0ANbTIdo/hrZPBrMc9RxF9XPV33g70qeAQQ
         17IUSiartdaSl1OSdV+MfCkleIDzbWCXNwsEpgu9kPjob3gkDZhSWYdJ3fTj4zlXDX4a
         3u5tAxYHtWuL86LiLrOM3rctEqWHF/O/Smt4+eNwI908rpoESiQ9fIO1Da+o+EtPuBZX
         LkOA==
X-Gm-Message-State: AOJu0YyuE9IsJ684t3W3j+e3WkXjMyO2Iq1lSe2a+QFMvYv5kyoiYncm
	jJetZJqrCbdDw1yc0n69FzJrRqyMdZhG+zVN03zbBJXAy5DQFgW6x4hX7A==
X-Google-Smtp-Source: AGHT+IE6iZ5iT1zB/VHBG0y25RqBNQAuAbysVqxluanAOdczSXdWcDraTpCg3Cn5FLVGYT368FbDcQ==
X-Received: by 2002:a17:907:3e92:b0:a90:344a:7db6 with SMTP id a640c23a62f3a-a90344b25e1mr1443462866b.62.1726460232684;
        Sun, 15 Sep 2024 21:17:12 -0700 (PDT)
Received: from localhost.localdomain (i68975BB5.versanet.de. [104.151.91.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612df770sm262593066b.145.2024.09.15.21.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 21:17:12 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iputils: upgrade 20240117 -> 20240905
Date: Mon, 16 Sep 2024 04:17:10 +0000
Message-Id: <20240916041710.6264-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 04:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204605

Changelog:
- Allow to disable reverse DNS resolution (PTR lookup) with with
  environment variable IPUTILS_PING_PTR_LOOKUP=0
- Lower max allowed -s value to 65507 (IPv4) or 65527 (IPv6).
  That is the maximum the Linux kernel supports.
- Include pre-generated man pages & HTML docs in dist tarballs.
  This allows to avoid libxslt, docbook, ... as a build dependencies.
- require meson >= 0.44
- ping has new option -3

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iputils/{iputils_20240117.bb => iputils_20240905.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iputils/{iputils_20240117.bb => iputils_20240905.bb} (97%)

diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240905.bb
similarity index 97%
rename from meta/recipes-extended/iputils/iputils_20240117.bb
rename to meta/recipes-extended/iputils/iputils_20240905.bb
index 3880689742..ca8ddc530d 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240905.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
-SRCREV = "8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2"
+SRCREV = "10b50784aae3fb75c96cdf9b1668916b49557dd5"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


