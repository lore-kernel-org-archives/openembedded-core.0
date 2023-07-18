Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69424C0015E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:40 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.11609.1689696093837716321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=b9/emdtZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6686a05bc66so4281586b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696093; x=1692288093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAwbSrS/nl9Daa/GKGmapjheu+jwiFo9ID6XlBUw21A=;
        b=b9/emdtZ26ET0J6JT67nSMbF4z0TjtIjTECNXtXtAptVCfNde2jyM66XzlUOnHwTFP
         eZkwORfU8sSqlQSdZEFds+yb4dKvkNx/Av5MybXiwi9MrRdFqDgUvI6E52csmR0oMJwe
         aq2e9gPtvP/Kg7NRdoRX38+ZWIjYp48eHqlcJc1CqMzEXv4Rf9Ol0luank5JaPc7wvWP
         q3J/bRRsZDpDaWXgE4/dfeH9rRrThdzNT3JFnpHziB98D1BIUXHjOddo7sIShTIZ/CBp
         ogYPgAlbN/jP4ctdCHC/IQh2vQCLrMSXGo8yp+EktU9YgjVXpVWdFUY9hvk6MuDiTKaA
         7NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696093; x=1692288093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAwbSrS/nl9Daa/GKGmapjheu+jwiFo9ID6XlBUw21A=;
        b=fHN5pcQHzZiReIIrgQSQ2ieY9SzStelkEmJwttehCjbUS1UioMpo7E2DBFoO9sombp
         1A5mkJY/rm4kunNHK03UTbqXW9OLWFThD84wVL5SAffrtzCAMuQlPuamIwasffHdPL4j
         UCR0dMgczbUWarauR1/wMhoC+DmibpA7/MF5dNYGcD7eqsYFpfkA2jDrjDdmNOt4BqxU
         UGZIHe/zRBxV8M8hX6GAiYeXL5c5/E+mL1jC+dX/piOuaoOJnA64y7/DZHmFWeFxZAxJ
         X0Z0yxNYl6wZCUMQjHW2/WcSnwJG7BcPkrZnf0gijIozRArSkWUVmDSZkwx4DwsRqT/T
         /l9Q==
X-Gm-Message-State: ABy/qLbQ8MUfms8gIEiUA+X9OUo/U5TQwwxbUrzzRJ3ysgnsrNKiRnq2
	d9BSoz5OZEZ16Q3rEL5nPc/fP3t0peZ9JhQi2Vo=
X-Google-Smtp-Source: APBJJlF5X6S6/0h6Vb5tdaQLbOckV8BQW5VtkcADbj0KPGZ98ISzH7e1kV3s6FH5hJoxEolbfwn1Xg==
X-Received: by 2002:a05:6a20:4423:b0:122:550f:aad4 with SMTP id ce35-20020a056a20442300b00122550faad4mr3358427pzb.9.1689696092882;
        Tue, 18 Jul 2023 09:01:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/13] linux-firmware: upgrade 20230404 -> 20230515
Date: Tue, 18 Jul 2023 06:00:59 -1000
Message-Id: <17988a2cebcccb7ddacb3d085deeab0f0b8f646a.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184545

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64603f602d00999220fe5bafeed996ddcb56d36b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230404.bb => linux-firmware_20230515.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 9ac70b2a3a..a367a9fd01 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "0782deea054d4b1b7f10c92c3a245da4"
+WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c3f9ad2bb5311cce2490f37a8052f836703d6936aabd840246b6576f1f71f607"
+SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
 
 inherit allarch
 
-- 
2.34.1


