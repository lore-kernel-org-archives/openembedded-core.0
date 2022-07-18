Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DF9C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.21869.1658104272203335212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CuDlNVGh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id v7so9382068pfb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9eKPHWYg/6hIoJywzOP++1xrhqpfiM/LzglCY3QvAb4=;
        b=CuDlNVGhvPZS3ERZWZNipf5koy+TMvZ+7m0QkcveihWnhVLbZeAKUXj1xA1E2p4wz6
         jnewpfi7xCSuzvoxiqWI6TVc/k25Hdgx1324I0S2h0EC55EYlpks/Mpx3K7Chmuvv4Va
         bRsJVc0wW2qthuu0gOnQMKVVXnsO1AGoNWMVlszXSLAMjScZ/az0CqmihqV0Q9twe3F6
         MYJQB1FF7HpofA9T0OlYYFMWjgOCyoZZoaNV2bJ8951x7C7kUWdWCD1UIyf3YW/YjYm6
         g9VQlXokjjDK1wK/h6EL5nRTW6xhRtkZxagoBrcTo6v6AA74PkCpMe3vGIO6Hpgvsmcn
         JZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9eKPHWYg/6hIoJywzOP++1xrhqpfiM/LzglCY3QvAb4=;
        b=ZYbiF+PLul6x4kAx85aQoyAkO6CwOXwVZ7uRKh89Lraod2Ky1ZkDfuupIWOJaFaCBo
         ef1LJvKSAZpZ0MUjc8Au4JABPrqf8gw2TKDPgLSS3la6qXuPD7led7skIiWtVG3y1Fe5
         rtRRKVUI7Vygcm7NSDBnvpo8JUtR0O+phUNF+ZMbxuL2nqI1EzwSMeV/zFt5mdUAvqry
         3USHYix8oCb9eBfEdpY6e515w3slG3oF7TLwQWJukzGtFyz5h+1hEtDv00T29DJ2JQSM
         yta2AJkeyvKH+U12A2hLNweKA2gIEGnltDEGbm3bV0Ov9WszbpPNTN5MxSBO+MC9i0pW
         uKCw==
X-Gm-Message-State: AJIora8WuZgqqkC0lrciHKSrBpbTAbaMqcoXjEL2gXodnQVEFG7CqKN9
	KpFJ2gvcfmQrZyOaB5GmafJOiLGCh0HxJN8O
X-Google-Smtp-Source: 
 AGRyM1sY/YFQM2q2nv72tlqzR4WM89HuEF7HmIVliK0x+zV+MsC06KsKp1B67MXYu8ZmNw+aW1ZCAg==
X-Received: by 2002:a63:d94a:0:b0:412:6986:326e with SMTP id
 e10-20020a63d94a000000b004126986326emr22881613pgj.56.1658104271074;
        Sun, 17 Jul 2022 17:31:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/23] linux-yocto/5.10: fix
 build_OID_registry/conmakehash buildpaths warning
Date: Sun, 17 Jul 2022 14:30:07 -1000
Message-Id: 
 <bbf858692f4d84aa45cc2824689ad6950f6759f6.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168171

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    4d201ec392f1 vt/conmakehash: improve reproducibility
    ae24d013888f lib/build_OID_registry: fix reproducibility issues

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db22dbc1f66d2f76dab719597986cfd96cf18d71)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 75868eb3d1..a695740976 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b54fa6bf849eca66798bb59d0632b76475e5ef98"
-SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
+SRCREV_machine ?= "f481ff6adf4be55c3ab89d0cf7243bbca69205c9"
+SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 15e03c653a..41cad3d37e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "fb53532e7f97426df28a91c56beff034b2487c21"
-SRCREV_machine ?= "953ea081e524baca7401da7cdf6aab5482cf9fb7"
-SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
+SRCREV_machine:qemuarm ?= "cab1bb0e702f93b16762fc560d6be582fbf86a6a"
+SRCREV_machine ?= "5239dc7bbd53a3d4d5e31f8631612c2eb6cee0b8"
+SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e143616db9..fbee1874f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b0120b4ab3e79e53b9526fcb888a0fa7fb26b290"
-SRCREV_machine:qemuarm64 ?= "cb4d26c271f026d51c2944cd8e42e484707d760c"
-SRCREV_machine:qemumips ?= "cdec08a50503179be1b3ab5120617ef11345817c"
-SRCREV_machine:qemuppc ?= "c0821a7ab5ccfd996ff3a30fc8359fb73ba4b123"
-SRCREV_machine:qemuriscv64 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemuriscv32 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemux86 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemux86-64 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemumips64 ?= "43cc2c777b16ea5bb45bbae47b901c801c30dbb1"
-SRCREV_machine ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
+SRCREV_machine:qemuarm ?= "952586297dec710cba21ccf7f6fe4a1aadde0a5d"
+SRCREV_machine:qemuarm64 ?= "268aa738ea2454a1293dcb6c829c88552a5768d2"
+SRCREV_machine:qemumips ?= "bb9cabbe92165b556329cb0eed12ab67d2dee7a7"
+SRCREV_machine:qemuppc ?= "88ee9e4c24d32b6d0ec90756f0c7729954d3feae"
+SRCREV_machine:qemuriscv64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemuriscv32 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemux86 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemux86-64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemumips64 ?= "1a760ff71146a87cb5b7de87aed88db07a907ef1"
+SRCREV_machine ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.25.1


