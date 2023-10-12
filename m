Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB2ACDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:06:19 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web10.5264.1697090776147116002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IHYel6CB;
 spf=pass (domain: mvista.com, ip: 209.85.222.44, mailfrom: sdoshi@mvista.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7b07548b084so220822241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697090775; x=1697695575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PaF36/+vAFpJ103PpKfpVxc9lcE/O2LOqmJvBpgwTtI=;
        b=IHYel6CBuoM82Rz05tfaTKDIo22WtIu3w8lfZLzXzRiVcRaGyhm+qp7BaFb19pk22J
         2QXmGPzrSSBcB0mrMdZT2PhjTOTJFYfdKY8CHR0GSzAe5CpSOckPw5qRb6LY1VTDghmT
         Ug+O19Wcopuzj4dwGJcKMNIrGllLnag246MIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090775; x=1697695575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaF36/+vAFpJ103PpKfpVxc9lcE/O2LOqmJvBpgwTtI=;
        b=goz2kjLHRReojMCPTcx0BnQ1LHXTq9SFTEz3HA5x4mDaRqq2IkAd0Nim1TMBHI/UZj
         RzViYjwzPIxabYBluE0m8j62vHjzfqrqlmZYUeIJop0cSXbgkTVDjyUIQqxtxuIfGjCP
         l1qBZdB+2/LdBWwqA3Pv6CdY/SFeBfaDel1p9lHHorKqNUF5UIlPK8W94oTvW87pQt0A
         e0S5WcLGTT+WU/0/9Ila1KNnwwbOBFeMeTslnZQ40d/LVJsuVPxAuvBvLtPcyyjQoTxo
         nHCSS+6XBUtekNMK45NE9/tTMhifjB1apfNTH7m/seDaIZIw6YtjBHkSp4ACLVNLDw4T
         pMzQ==
X-Gm-Message-State: AOJu0YxSJkf3KAcdzonk77mYMsmEncw3wVOg2mQDPpe1yYFy4+4yvMmX
	qmKpO/9xgvaA+4HS3K7maxq7TjCKEtib4V8tHy8=
X-Google-Smtp-Source: AGHT+IFFseDZ9Vba6wTV8jB5+dN7Ds8UTeT9slGMqYkUcFeowW1cNrKd8x1VmbLsIOBXUC8xWCzrhw==
X-Received: by 2002:a67:f117:0:b0:452:cfeb:1607 with SMTP id n23-20020a67f117000000b00452cfeb1607mr21463759vsk.5.1697090774786;
        Wed, 11 Oct 2023 23:06:14 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.58.87])
        by smtp.gmail.com with ESMTPSA id q25-20020a62e119000000b006933866f49dsm11478006pfh.19.2023.10.11.23.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:06:14 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable 2.35 branch
Date: Thu, 12 Oct 2023 11:36:06 +0530
Message-Id: <20231012060606.13522-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188980

From: Peter Marko <peter.marko@siemens.com>

Adresses CVE-2023-4911.

Single commit bump:
* c84018a05ae tunables: Terminate if end of input is reached (CVE-2023-4911)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c23a43576c..e0d47f283b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "73d4ce728a59deb2fd18969e559769b3f590fac9"
+SRCREV_glibc ?= "c84018a05aec80f5ee6f682db0da1130b0196aef"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index b4bad5b7ac..271520f76b 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -17,7 +17,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 CVE_CHECK_IGNORE += "CVE-2019-1010025"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-5156"
+CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.34.1


