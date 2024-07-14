Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54791C3DA50
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.15298.1720960787141642695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ynytUM+J;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb0d7e4ee9so23042825ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960786; x=1721565586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YixmtihO+hxQy5c7OdcKBujqGAX0+YfTnLe+631S+3Q=;
        b=ynytUM+J16rIFs9tEwOhNYDIQjxlX6PsNFzWFBJsRu+pZV6D0QTS59Gxw3E1w1nY5X
         IxEXNWUDOsYE5DjDuBj4bGudk1+cJ/OqZjlkrRnxoOPv/ZNBVL2hvNIvTNvqZYmANLYT
         uGkmf5vK3gRJOFymPgk9TGZVsXbSSA1iRuwGfsYqZrW+sGH92ZUq4h4bK05EuZKz7Z3d
         nxrZ6WxJ+aT4tZSuZcFdkLhi594fqimGbfpL1zZAi6z5k/JHOUxqnS4E8v3/OEP+tWOt
         iqMYfK+7zna2p4tc9G+VgoThhOo8Gx5hrx7sdaLsBTMHrg7IzuJk/6ZgoSdFyPQe5eQu
         cLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960786; x=1721565586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YixmtihO+hxQy5c7OdcKBujqGAX0+YfTnLe+631S+3Q=;
        b=aeF40yjmF6CaWtpGlbG+OocxWiBANrb1vTtgTJspQBEnYIl7A25OlAd13upC1cn9ta
         +4XcyB6qpWf7C4sL1dQGo7fz4xKtqbSg8oaTuAyh37NU6ZWs4VVXSKzLODCVeV2mx3pN
         OBZSdCS/U02G8gvPD00jWtfFmb9u7BobTXS7kULCt2WAr8MjNsHJbBXlj5voQrdIZfln
         XkKud2TqvozFv79vEw7xPHk1xVBnq5sRA0c3JV9BkatoWeZAns5v6kP8Pk4uizksth2B
         aWvj2RSMH5+ML7RgtlAHy7f4LemcEYtk4tOppef9h/kKpnivhvlV264wt3foqfgkoblu
         PiRA==
X-Gm-Message-State: AOJu0Yywqm+5h35p+UDK7ptH77BavkbDSj8QO6AG6smQNkoD4iiydmpj
	6X8Zihuj2Hxari0t2mu4M0da/uhTgfvlizNvyLX6X5hrJrR5X5e+ZxMFh1Y0PvrVMT/3zE8zXzV
	zZQE=
X-Google-Smtp-Source: AGHT+IE8UTP3i3w4gS5gzgfT/EaQBNgYBXTAeFYhzLOoeuDHoD3iMgp15hnScrDb2ZkTh2b0KlAKmQ==
X-Received: by 2002:a17:903:120b:b0:1f9:b16d:f94f with SMTP id d9443c01a7336-1fbb6d70175mr141979655ad.39.1720960786427;
        Sun, 14 Jul 2024 05:39:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/27] grub: mark grub-module-explicitly-keeps-symbole-.module_license.patch as a workaround
Date: Sun, 14 Jul 2024 05:38:51 -0700
Message-Id: <8c03f8c4916c802e0e6ad483a019fcaa7b09f509.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201881

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6307adb5b0644845f4062c21ac5717eb62a61dd3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub-module-explicitly-keeps-symbole-.module_license.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
index d9012d1dd6..7c8770ce8b 100644
--- a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
+++ b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -37,7 +37,7 @@ SYMBOL TABLE:
 0000000000000000 l    d  .modname       0000000000000000 .modname
 --------------
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [workaround that needs investigation into @TARGET_STRIP@ behaviour in oe-core vs toolchain used by upstream]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
-- 
2.34.1


