Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55757C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:08:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.32123.1699859328863515184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZwsWQmf;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40a46ea95f0so23088285e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 23:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699859327; x=1700464127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNlWcSqUrj94+DrMNTzW756tbzNi9a15XZqIi7eaGJM=;
        b=lZwsWQmfJJVNg9QROHdLY1N4CBxYNhTjikR/4XRME+H0ZDEo2YHyXaPHHJviPW4faY
         GN+Uy37ELA94brruc5EmF6dRLk02gPekByj0mvM6Ld5zbmTIAhIPemDWKwXTtwtmIv1n
         4j563e+n6yGcjruljOEUyqPGuDJ7zOBtdfLYwGoZ/YJFfnIKtcLRC1wyhEALIrqT9sb1
         db8+lpZWc0S8Ran1EZz10D3p4d/yopNLg0uBwwWGxMZLMDDRemugFWyAzr3IHZ63HlFz
         T4i3X1mugzrR7F41p5iVA7BmZ1v52fGpdJEVx6rCsqJCebuMmQTgE226Mr3V3Yolm5XJ
         XBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699859327; x=1700464127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNlWcSqUrj94+DrMNTzW756tbzNi9a15XZqIi7eaGJM=;
        b=VYwBX7wKSRE8rd4wokwj+qaf6wAftdXHpdEItDxawhxGn02p2eN6rX2PZ8xylLhLMu
         D2zoH/JDuLNkkdMq9VFhKEtwlueZ5FegAWo6dgSz46JfMSqnRacTpphxsJzBefgdECDm
         vdXv1Zu3v2Sycq0Ms8rHegXL2CrWTTYGowSgzITFZ8rT8RS+Czq7Pn3UPqdW4enZ6qv5
         uV7XV8oDXmMSptJap5TnJACQiUxq2mrH99hJ4wvRDvoniveEABRRCg1cTu0UDMfWz9fP
         A/61nHVyJx+7irfJ/+siv4FNDk99eooPjVk+HvZiaWTdCGnH3y05HgwgGijQo7dNgDgu
         xFoQ==
X-Gm-Message-State: AOJu0YxnqLKN3Az0ei5fbiAhR357IOgSq0hSLZRn+jvt+R/ttpDMWNbB
	KICG7lqba75REdBBkIz+ykUFDAXXqWU=
X-Google-Smtp-Source: AGHT+IFnnYvY8hBaCgGf5zyVe2OjiHZv98ee2LXKEIl9c1whHJkjLMJ/qbzvhgHMEzQwemrtMvsRag==
X-Received: by 2002:a05:600c:35d6:b0:406:53ab:a9af with SMTP id r22-20020a05600c35d600b0040653aba9afmr5384012wmq.10.1699859326984;
        Sun, 12 Nov 2023 23:08:46 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c445300b0040813e14b49sm12949327wmn.30.2023.11.12.23.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:08:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/2] staging.bbclass: process installed dependencies in deterministic order as well
Date: Mon, 13 Nov 2023 08:08:43 +0100
Message-ID: <20231113070844.5142-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 07:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190458

From: Martin Jansa <Martin.Jansa@gmail.com>

* similarly as direct dependencies before
* this doesn't fix any issue (at least AFAIK),
  just keeps the log files more deterministic to avoid unnecessary churn like in:

  perl-native.log.do_configure:
  -NOTE: Installed into sysroot: ['zlib-native', 'make-native', 'perlcross-native', 'gdbm-native', 'xz-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'libtool-native']
  +NOTE: Installed into sysroot: ['zlib-native', 'make-native', 'perlcross-native', 'gdbm-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'xz-native']

  and similarly in "Note: Skipping as already exists in sysroot:

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index d229f40107..cf1e4600fd 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -521,7 +521,7 @@ python extend_recipe_sysroot() {
 
     binfiles = {}
     # Now handle installs
-    for dep in configuredeps:
+    for dep in sorted(configuredeps):
         c = setscenedeps[dep][0]
         if c not in installed:
             continue
-- 
2.42.1


