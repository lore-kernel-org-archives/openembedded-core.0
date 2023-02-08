Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563BCC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3125.1675840909917555521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oVNmH4xy;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso717288wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN2lGQxa7ZSJzO/2vs3OL3GZyCPdQEZVJVqvLFMieII=;
        b=oVNmH4xyEgFgB3EEVkr5ukQQ4DBISU2va5Luhq4274WDZM4krdTQiBT3p8QtTYWHEF
         T+IpN9AGidilWMUv82CesYH5wMdrRidZLA4eYpj34EnNKXxjjYrK2YoMJUgIRxn8uCcU
         xpx3mzOowKyxQGPk8gbVtbW8yiGB38YITagRrvgoiu1BZ5p87TlHQTrARP5QUbgxzF24
         sxClLiJItia2z0gujS2YW9ddbygPY1aLp1dATpAg/m3x/LwojqH4OGPYWKcmWHhUnOnd
         0pU3jKkRwNIOv0ZBWzhMI05M9IHaZjWLtGEjPWC4gTmnEeWsV7M79iSYEC9j9V4lmOKa
         36pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN2lGQxa7ZSJzO/2vs3OL3GZyCPdQEZVJVqvLFMieII=;
        b=V2zit/Xirm63C7NDqyUkE6XBOKEUDNttxRLj29Ur/WdtVvrQHs5LGpJw0WuiAZZyLZ
         MLiooTaEXe5QL8epFtzV0vS7E9MiYQrskx7G1PwKwhTrs/QS/Xm57YKX5RRXaZPSW2nb
         xVjsu2zXtS9x8Q4GEAobVjCbN+Mdql3MY4Xd0HRNkqNLhCY1tmVlmxiFr1yfsQt5tiSw
         NRmHRPQuLsLPADIJJ/Bn/go4tLjf0+21VqSOyBbvywp0ZRUph3IEAnomgHdN/xE428Xf
         /7T9DcZibaUliC74ssLZ6nftzoXGAvJMRc7sowVuYgt27D3jJoA8ZX4GJ/1+zHtTVuUu
         3lcQ==
X-Gm-Message-State: AO0yUKVfLPfJlBc2AmzIYeyYmAiOArSE1GC/OIF9R7Rt82RINZtLHu3q
	CmR+hygyFIv7LeMKv+ilolVpf/KJILI=
X-Google-Smtp-Source: AK7set8FVstOuEbyiDGTeACsRXmlzFOOdNTIEFvq9lq17xYJJqzbca7gDfXYk0ob3oa1+3k60VmprA==
X-Received: by 2002:a05:600c:4f8e:b0:3df:f2a5:49e0 with SMTP id n14-20020a05600c4f8e00b003dff2a549e0mr6209438wmq.40.1675840923124;
        Tue, 07 Feb 2023 23:22:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/52] ncurses: upgrade 6.3+20220423 -> 6.4
Date: Wed,  8 Feb 2023 08:21:18 +0100
Message-Id: <20230208072143.2930292-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176867

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ncurses/files/exit_prototype.patch         | 18 ++++++++++++++----
 ...{ncurses_6.3+20220423.bb => ncurses_6.4.bb} |  4 ++--
 2 files changed, 16 insertions(+), 6 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.3+20220423.bb => ncurses_6.4.bb} (78%)

diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index 791421a338..fd961512e0 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,18 +1,28 @@
-Add needed headers for including mbstate_t and exit()
+From 4a769a441d7e57a23017c3037cde3e53fb9f35fe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Aug 2022 15:58:32 -0700
+Subject: [PATCH] Add needed headers for including mbstate_t and exit()
 
 Upstream-Status: Inappropriate [Reconfigure will solve it]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index f377f551..163f8899 100755
 --- a/configure
 +++ b/configure
-@@ -3422,6 +3422,7 @@ rm -f "conftest.$ac_objext" "conftest.$a
+@@ -3423,6 +3423,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3423 "configure"
+ #line 3424 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -12997,6 +12998,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -13111,6 +13112,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
similarity index 78%
rename from meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
rename to meta/recipes-core/ncurses/ncurses_6.4.bb
index fb8c11582b..1eb15673d1 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -6,10 +6,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "20db1fb41ec91cd8a1f528e770362092c5403378"
+SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
+#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.30.2


