Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF7AC3F2D4
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1570.1654188778563560505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ie14yXIj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id g205so5201960pfb.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bUAjnzBPC+PRQHQC4mMFWZZuziiWrZHhm5J8dJdphFw=;
        b=Ie14yXIjluCLYqDkUqm2MBVMRDNj1VBmiti5qrqbtkCr1fz3iq4ux9Xe+p+2Pic5aq
         LYZyr5wS7GQ/90SjArBAkQG1VxidOmUTtvhRhrYqZ8kgTk0ln2H9liwdmu3EVQg7codZ
         +dturNofE1T6EoBsKJpYrOlsnjVVdVb2NM8R/GijPNcgLGRUHDZkBErT6V+y+S3jsQHq
         aF2u6SimH8uKzaVqrSJq22Wf1VrYtN1Y+SYsKlvBhAinBRQxbz4UJRbWnAVUniw28JWD
         /tyQ4vs47gmFj2kWDXCFiKfIMncmW8Y3PbBR7p+ZgPvfVcqrCFEDGpcxaF8l7S7fhimq
         tJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bUAjnzBPC+PRQHQC4mMFWZZuziiWrZHhm5J8dJdphFw=;
        b=r9KEc2Pf155ziheBeKjsPLS3uO29F4/8AawqImU22dIHgZRIbCvox4wqF2XiPuTFl4
         JraNcQ/SsSaSqdn8gfMjp9ZWSdD7gvRgPJt4cwieLRzZ7q2yxx2JEUPf3YwCXOGJxH5n
         KeYBXTzjQptHvy6cWSJ7dUWmiaEmB5czCTZvUYosZTnlswVemaF7h2+61bzn2l8xLei+
         kJJlwxNPFSLNtDjgPvhneejK6Jak0ymUNrCswtqof36yRkiMf7e90vwz+ZJ4Vikpn67k
         olFqxpU4byJogxD7NKs1BYSETlqNZeHT9U8JYBH8FAHy2ecx1FZUrxo5W1Y+oTjtCM5o
         MuoA==
X-Gm-Message-State: AOAM5328BUrsJc8+FETQrw+aP5M+rqiWyIC30p6U42laechu/1LFkB83
	vnioNsdVVTAF4CnqhRl0mg4jWs5QU8qCi0bQ
X-Google-Smtp-Source: 
 ABdhPJxPQ1DlJLVzj46EJ/5JBjfoUqOAaygovMbmJKQ7VFdpq8ssjQI9zEfCNJBECvrGrX7wwU/ASA==
X-Received: by 2002:a05:6a00:a04:b0:51b:6ea0:43ca with SMTP id
 p4-20020a056a000a0400b0051b6ea043camr5936580pfh.78.1654188777429;
        Thu, 02 Jun 2022 09:52:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/26] pciutils: avoid lspci conflict with
 busybox
Date: Thu,  2 Jun 2022 06:51:51 -1000
Message-Id: 
 <bbb7dcb461c09409b556571cf645bcadf12f397c.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166496

From: Naveen Saini <naveen.kumar.saini@intel.com>

if virtualization is enabled as DISTRO_FEATURES, then meta-virtualization layer
enables CONFIG_LSPCI=y for busybox, which in result have conflicts with pciutils

update-alternatives: Error: not linking ..core-image-base/1.0-r0/rootfs/usr/bin/lspci
to /bin/busybox.nosuid since
..core-image-base/1.0-r0/rootfs/usr/bin/lspci exists and is not a link

So marking it as ALTERNATIVE with ALTERNATIVE_PRIORITY set to 100

Ref:
https://git.yoctoproject.org/poky/commit/meta/recipes-bsp/pciutils?id=a81af375dfc51446b21548dce2afa6a77bc02df3
https://github.com/pciutils/pciutils/commit/0b307156c92f61c1a02d232f4c6ed17e888de9a9
https://git.yoctoproject.org/meta-virtualization/tree/recipes-core/busybox/busybox/lspci.cfg
https://git.yoctoproject.org/meta-virtualization/tree/recipes-core/busybox/busybox_virtualization.inc#n4
https://git.yoctoproject.org/meta-virtualization/tree/recipes-core/busybox/busybox_%25.bbappend#n1

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 257e7620a79ea50c0c59746ff9a3817d43411e39)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.7.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
index 7d1740f665..311e57a98b 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb"
 
-inherit multilib_header pkgconfig
+inherit multilib_header pkgconfig update-alternatives
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
@@ -57,3 +57,6 @@ FILES:libpci = "${libdir}/libpci.so.*"
 SUMMARY:${PN}-ids = "PCI utilities - device ID database"
 DESCRIPTION:${PN}-ids = "Package providing the PCI device ID database for pciutils."
 RDEPENDS:${PN} += "${PN}-ids"
+
+ALTERNATIVE:${PN} = "lspci"
+ALTERNATIVE_PRIORITY = "100"
-- 
2.25.1


