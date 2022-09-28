Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947C7C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 22:13:31 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.3758.1664403209555046627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 15:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BkVnIjO/;
 spf=pass (domain: gmail.com, ip: 209.85.166.42,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id d8so11263677iof.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 15:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Z6pBU9pyHXpXSDL9whVCc4Hi5QdJ5YodwsjYtHAvgyQ=;
        b=BkVnIjO/42iW3QTugfZlijmAxqje56y0EZ9Lc58FJBW5NAAFP65HQKZml0y9D0Cu48
         DxTN7s1+iAQhox844quYBZ6aN7+n0x6TH4gPSU+peqkbShaC8HcLlDmQHC1s/yZgLrt3
         aUZrPzBco3y5xSzyu5wdqWT/iOrTf7m738PhYtBlg9nQUPZaIFjKVlzUSJM+6xciLl6+
         rfWr2iNVAgfnpkcOhy84QxyFGQbr5RDs6HP8oxd63vl9E4kU2MPb19/6+7NCSdZs6luh
         5ACyfxqq7UN2b0SAhEBoVsqIQ9ARvBhkm5W8OYF5FQw6+Zzo4ZFZKGKFzg+r5hn/S+v/
         EB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z6pBU9pyHXpXSDL9whVCc4Hi5QdJ5YodwsjYtHAvgyQ=;
        b=IP5QbnZtGEFOSp3OTgNz3hweqXX1mwZF9JPhwsxy/Qe/NbSkzpL1N/LbTe8x4iRUQA
         /3l1hqLSXJIYxhyb4kifk44tb46fKgg7uOjiTZV1RNSP6+VgJ6a0Yt+qBaTFV4U1dsbH
         91YA9aWcyntVchQQ8jI/TRhllaivAiumdIqxz/nxfBloQbXE2EzLNodiukGJT/h0Lk7p
         n+ZbFS7PyBWDLen8Hj+QdiYQsZ0UMFx4csbriTXxovBMbWo4GL2NCNPg4KnxDFTXJ24J
         4022+KOOg0nsgQ2T2v0f3URR17G0y5eXRUuDzBHKzC9QKScAdADoRQqd38FVRfeB2QvJ
         JXTA==
X-Gm-Message-State: ACrzQf16ykajdkw0uE3dY5o2NijC//3++LcEPWlcViXHKrx06nqLeIVJ
	2ytP9QBc8slomnDlcrg31+jfd/GNnOQ=
X-Google-Smtp-Source: 
 AMsMyM5q3URxY5aOuNeO8SCA+rb0qP63bfpbNiM9mZA4YwWDe/byR9AohA8tzowO756sUZtiCSMP/w==
X-Received: by 2002:a05:6602:2e88:b0:6a1:6d80:cff5 with SMTP id
 m8-20020a0566022e8800b006a16d80cff5mr34683iow.168.1664403208712;
        Wed, 28 Sep 2022 15:13:28 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 g39-20020a02852a000000b0035b0af5783dsm2191931jai.32.2022.09.28.15.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:13:28 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/3] coreutils: add openssl PACKAGECONFIG
Date: Wed, 28 Sep 2022 16:13:18 -0600
Message-Id: <20220928221320.1763684-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 22:13:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171156

From: Daniel McGregor <daniel.mcgregor@vecima.com>

coreutils-native will pick up openssl on the host if it's GPL
compatible (version >= 3), which causes uninative failures with hosts
that don't have openssl3.

Add a PACKAGECONFIG entry for openssl so it can be enabled, but isn't
by default.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/coreutils/coreutils_9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
index 55663c77136..4807eefd04d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
 # [ df mktemp nice printenv base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
-- 
2.37.3


