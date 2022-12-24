Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D21C10F1B
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 17:00:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.100756.1671901202173394276
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 09:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eHRo4XF8;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id y8so7022983wrl.13
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yD8JQ3sBJBENlk16VnPgwnmRkS150UAREqRalQcq2w=;
        b=eHRo4XF87pb+BrrRE63ArFXURJjpIPx2wzI0q3HNYoQ2LtSqI+p/StTaEcMa1Qo1Mm
         kVsQ3BettVzjxGxdE5OVnnuNVEWRTYIaMzZBE7e2xb+/HYA9bBNG8/cE6296FeApGz6Q
         jDDIBXQU65rzjRTtGQsuoTAIey7/JIxnnfc8TxJGO1tjX0r2zgBbJFqBWgf+YZpf6A3E
         EwGpUCcidit3+Q/5v0RxWYcQRmQJcC2uwvasOOeLZW+hKdWX7QV3mpQkyIHRAElOCLnB
         YeAExC2FwPLT6sJV2wzahfGj7MHMosaG9DohD6xPs9/dcT89+KFgzfzAWpXOQ/ezN1Th
         niVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yD8JQ3sBJBENlk16VnPgwnmRkS150UAREqRalQcq2w=;
        b=2XH2p5JAYwl8yP0OzE6rxlMbg6OIcrW5DixqrCzGgiPpUPm90v1hSvKF/zMzGS4cht
         SbHFgffijc5dUfEx5qhTk265FkQeGPseE4EIeuqLEMS0eqm/UJydwiD2pWZWTBdO+8Dw
         TRQHVRznCm1VF4i239EPnsZ9V1Pyh03z8697KPJ50x9DtXTuhtzCERM4WwXUpUC3Muo3
         +lFnVlW6IR7RLh4VCVOm/6LKzj8j91wJPWUnvby7T0grK46aR+F0wSIxGOs9lI5N0wm8
         d40ggOJHB41kBjEB87KKIn8R6b+IpsLlHewCuTSu6duxpgmAwKRB+q4HlfCyB4v/IUn2
         nQjA==
X-Gm-Message-State: AFqh2kqCyTKcCMPh9en2unwTlHxZf/4GP6bna2gt994kg8RpoDbTAL/Z
	rKSzrci9sBNcqPKNKt0POy+rSpo6McM=
X-Google-Smtp-Source: AMrXdXuxzXfb+BWJSPOi5mjYFvdWcb/9GWa2JqrJR7Voe4fJrT4G8IL4AiqFyKspPUGAz1Xv3p4W5A==
X-Received: by 2002:a05:6000:16c4:b0:247:4802:9435 with SMTP id h4-20020a05600016c400b0024748029435mr9321750wrf.5.1671901200706;
        Sat, 24 Dec 2022 09:00:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm6005622wrp.95.2022.12.24.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 09:00:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] libslirp: add recipe to continue slirp support in qemu
Date: Sat, 24 Dec 2022 17:59:42 +0100
Message-Id: <20221224165943.1324800-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221224165943.1324800-1-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 17:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174989

qemu 7.2 no longer carries libslirp in-tree, and so
it has to be provided externally.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 .../recipes-connectivity/slirp/libslirp_git.bb | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-connectivity/slirp/libslirp_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 66797db02c..be96123ce6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -382,6 +382,7 @@ RECIPE_MAINTAINER:pn-libsamplerate0 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libseccomp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsecret = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-libslirp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
new file mode 100644
index 0000000000..334b786b9b
--- /dev/null
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A general purpose TCP-IP emulator"
+DESCRIPTION = "A general purpose TCP-IP emulator used by virtual machine hypervisors to provide virtual networking services."
+HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
+
+SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
+SRCREV = "3ad1710a96678fe79066b1469cead4058713a1d9"
+PV = "4.7.0"
+S = "${WORKDIR}/git"
+
+DEPENDS = " \
+    glib-2.0 \
+"
+
+inherit meson pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


