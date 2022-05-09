Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BE7C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 10:42:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.30208.1652092963270281662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GrdtEvEl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id i5so18800126wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8O+FcBFFQ4f4YR6gj2xu+bNAJj3hd6qMhcvdXqzmvP0=;
        b=GrdtEvElDM2VKNQJhroHcYGc1vIc6ACH8MLMkNHF1/T+GF+LnK7EjnmaGoJG2zOmJE
         erhjIBs+2WDSVh/OE4g/Hyu0MJ13pkb75uXgPhaA7ZMWwm6kA8CxKr2B+eXdCd8LZf9L
         wom/KIVh5jSzdZkZf/yMIUpRjG1ddDSHPA5zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8O+FcBFFQ4f4YR6gj2xu+bNAJj3hd6qMhcvdXqzmvP0=;
        b=G/Iw9OXNF+VmEItBh6zIBfPtAQTGCzI40Mz2WQGBOJzw9GrtWj1hQ2+Ig/ET2axL9F
         aoCoF8EpduTExCEa6d+8XyQEU1fprNO0j5bKtDnTqFtH2M0KMT3LkQu01+Lj22EKuloq
         HsTt19ABzQEIWy/kOBhvNfH9BIu2AgOreqePgLQCTIlTE+80vv5ia36Q6hzRdj3umd95
         8XlIti9GSW6Kdz67Zca1lgVPUh85ns1XBSvZYSsin3fbbPyzou4isQhFVsw3DI+7Ednr
         dMW+ePPmS5bp1IassjZhyIbmZ2uJMa0VW/UBLuai3j33Gv0XEP0hhrAc6ZbUvY28osem
         qW5Q==
X-Gm-Message-State: AOAM531opxHmmuVgirvJsy8vFDLDQoXOTK5tVuJxso7MAWoIp0hoJpFR
	Gx5ttPiaA1w7/QtPtt+5YyB4FhWPXPvE83OJ
X-Google-Smtp-Source: 
 ABdhPJxTBIZ0C5N17k+ISJSRPOq0pMhoQNP8NAVQWimJRBtquovsKe4yFd5v1TqppzNWUSg65nzJSw==
X-Received: by 2002:a5d:588a:0:b0:20c:5ddf:2491 with SMTP id
 n10-20020a5d588a000000b0020c5ddf2491mr12870131wrf.197.1652092961332;
        Mon, 09 May 2022 03:42:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9751:d995:8644:a17e])
        by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c1c0600b003942a244ec4sm13265659wms.9.2022.05.09.03.42.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 03:42:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pciutils: Add make-native dependency
Date: Mon,  9 May 2022 11:42:40 +0100
Message-Id: <20220509104240.193445-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 10:42:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165393

A change in behaviour in make between 4.2.1 and 4.3 on how whitespace
and appends are handled[1] causes changes in lib/libpci.pc and leads
to non-reproducible builds.

Add a dependency on make-native to resovle this as a least invasive
and least worse solution for now.

[1] https://git.savannah.gnu.org/cgit/make.git/commit/?id=b90fabc8d6f34fb37d428dc0fb1b8b1951a9fbed

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/pciutils/pciutils_3.8.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
index 8455b286a820..f3a67d97e445 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
@@ -6,7 +6,10 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "zlib kmod"
+# Can drop make-native when all systems have make 4.3
+# https://git.savannah.gnu.org/cgit/make.git/commit/?id=b90fabc8d6f34fb37d428dc0fb1b8b1951a9fbed
+# causes space issues in lib/libpci.pc
+DEPENDS = "zlib kmod make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
-- 
2.34.1


