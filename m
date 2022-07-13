Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569B0C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 15:41:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.23473.1657726907805694824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pa60RfDY;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bu1so14879593wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4YRALkLiPnMjO/sMPoaDBpYa+Cqq4ccO4ZLg/2S55dc=;
        b=Pa60RfDYmu8S05KP/q7QejeF2MZsd3PRYxWq8i+/vLMgxesu2zHaqXOuOk51hW/UUj
         tMT5QUwaejzmANAx2HMBTvKYS2LtLm6rWuePSuB0NRUh/LPw0nACHLtcIBfBAJQxUzDS
         T+hbZnxjRmEyj2zx45qpzJNEInNEJt8NrchbxRV5d2qUsmjCDqPQiWJmERSxERgyXLkL
         FVzerQb98ab1SJphrtTO46GRHrad1lVwYIIZi7ldsU2DXL7sJezcXAomhIPCAPd+a8yW
         BU77s3m8+o6MH8w7Bb3HlzML+HnHDPiCFCsMFfz181YeeXU5adM+6B876yFELmSUx7zW
         yVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4YRALkLiPnMjO/sMPoaDBpYa+Cqq4ccO4ZLg/2S55dc=;
        b=WW1vQTSbvOfLnafgTYuGGxmdXHpkptvk909QdQkFOllnRxSDESrpEHo6+4Aht83DWf
         788VSeM3bLLbi4q6y42OEF2klR8hHjPDDt4RJtrr6H7P2Dcdf0uhKZhhqkPEjF0U8Nms
         KCz+nDw/5KL2H5Y1GqJPu6/WEyAqkH1gEgYvqJvRV0QGsTQtaGVFEjH4N6lQn5Iu4rBy
         /QjyYhaVNi8zthInVt5HvlleQFMbcut9E+SDFFcBAFzN0HFKc751cIj+prVaKRzEmSOf
         zKG9+IAe+h4WFdAXOeckznBIi0xiJ/P99jvAH7Icp+qFNFgkpASprEskF5vXR9ajZ/M/
         utqw==
X-Gm-Message-State: AJIora/nHzWAIpGwiI/QJApbgQkRqI9YgRA3VJkD9nX6iUGdULz/1jSU
	iI+LXClzWJQppqZs+joAFL8C0aE2324=
X-Google-Smtp-Source: 
 AGRyM1tMuzXPU7AejoP+6iqp3vSbSiFOt1aJR1uuhCBbU5esd8A9jnDdgWO/q83SUiL1huGQyqRvYg==
X-Received: by 2002:a5d:464a:0:b0:21d:68db:5244 with SMTP id
 j10-20020a5d464a000000b0021d68db5244mr3801562wrs.566.1657726905821;
        Wed, 13 Jul 2022 08:41:45 -0700 (PDT)
Received: from localhost ([2a01:4b00:f41a:3600:360b:9754:2e3a:c344])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003a04962ad3esm2581695wmq.31.2022.07.13.08.41.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:41:45 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
Date: Wed, 13 Jul 2022 16:41:39 +0100
Message-Id: <20220713154139.101744-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713154139.101744-1-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713154139.101744-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 15:41:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167960

From: Luca Boccassi <luca.boccassi@microsoft.com>

Support for unmerged-usr is deprecated upstream, taints the system and will be
removed in the near future.
Enforce building merged-usr images when using systemd.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: use :append in each recipe

 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
 meta/recipes-core/systemd/systemd.inc             | 5 +++++
 meta/recipes-core/systemd/systemd_251.2.bb        | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 55ebf99117..9085075a78 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 ALLOW_EMPTY:${PN} = "1"
 
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES:append += "systemd"
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index fd888bb834..60e18c4298 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
 inherit features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES:append += "systemd"
 
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b8dbe2263a..f9e109bba4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
 "
 
 S = "${WORKDIR}/git"
+
+# unmerged-usr support is deprecated upstream, taints the system and will be
+# removed in the near future. Fail the build if it is not enabled.
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "usrmerge"
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index bb3c59f418..b1358420eb 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
 
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES:append += "systemd"
 
 SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
2.34.1


