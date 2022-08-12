Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E2CC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 21:58:12 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.2930.1660341485762266560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 14:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bHLq8lpE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.177,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f177.google.com with SMTP id f65so1813996pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 14:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=naIuruL/0267g5nOqClg/btmIaaq9tKLXJvT3l3UASU=;
        b=bHLq8lpE+Sz/nKvCF5LjUSdQdAb7BZFfCLo/dn4ZBVDU2DLkH3tvTszJUx+ptTejNs
         WyQjkdy3NA8mwZGAjub++kGgrskkpUvOxcz8faHgITl1CIiE5+hHyGsITP30mpG2MvIc
         ofdxHmGm9Ddu1Dr34yRHvqyBsYOgfiCxUGiiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=naIuruL/0267g5nOqClg/btmIaaq9tKLXJvT3l3UASU=;
        b=KXF6W5eybWcye2iE4boUlBDBh7i3n2ShysZBhb9O+4Ni0xPhFRvlR4e7rHZqFaGr6T
         bny4tHL8gxKJApXctg2b3bFMafIdchPVkwqpOMCsAT7STUkSynuVR7tTJY9hNiZL+OUZ
         AgroNdrW1qyJWzSMXiFTWfsQBokXmwq1iXdPzlpdqEASll8OG277KBYFCoKWopwBqHlK
         BTn4316t8IIu8XpMbyWC72qqufL90A43xuGohG3IqBMWCL2n+JsB2mv0gfx6+XVIdRUs
         JenQBdLdtx1f6ERWz5i86QGkbYSgFwd1o8BESmp3Iij6MqN1oSKVnz+allLgKGTifVsd
         +KFQ==
X-Gm-Message-State: ACgBeo08m5zTdzdxiNHukZrrQQWpydof8kxHbc7w6lsi0oPDun8+bG4I
	uwqKclAk0ZfgF6giFNn76e0ao/7CmDsLL5Gu
X-Google-Smtp-Source: 
 AA6agR7xz57TjODdSB86AMYQBNacSTyDi33JbqJnpMEp37oiOAEk+/xbM/XS871odONLaJFR+/GWZA==
X-Received: by 2002:a63:2110:0:b0:41d:234f:16aa with SMTP id
 h16-20020a632110000000b0041d234f16aamr4557403pgh.481.1660341484957;
        Fri, 12 Aug 2022 14:58:04 -0700 (PDT)
Received: from fedora.pdx.yoctoproject.org ([107.115.32.49])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001f10c959aa2sm289373pjb.42.2022.08.12.14.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 14:58:04 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] uninative: Upgrade to 3.7 with glibc 2.36
Date: Fri, 12 Aug 2022 14:57:36 -0700
Message-Id: <20220812215736.10309-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 21:58:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169294

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 411fe45a24..7012db441b 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.35"
-UNINATIVE_VERSION = "3.6"
+UNINATIVE_MAXGLIBCVERSION = "2.36"
+UNINATIVE_VERSION = "3.7"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
-UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
-UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
+UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
+UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
+UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
-- 
2.37.1


