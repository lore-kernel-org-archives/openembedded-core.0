Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1C2E7FDDE
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:08:19 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1430.1770066498847406504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RPc1lbXk;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8946293374fso2962266d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066498; x=1770671298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S41g9PN2x0vu5e8nAHXjlyue/wUyh0Hz0olIY7xWNw=;
        b=RPc1lbXk2TaZDrh1EETsrVTtBGOkgCt7jFiLo+zRJ9JaKTqE7NqU58Xas5ziUFhNvu
         g31d+U/6GiQaQJOfJ6E07f9DlUsrdx47s3vOSgPx6PlB0bGQv4udG50u7YpAa3eVSCV2
         6rrLldSZqaIjz/y75nPgG5RNdDcRljGprxb90G0tBuQ2v1QDHbpW1tpKLB5rS1FFgsJZ
         otofEE7cg9mPkQH1xIHTo6DB/R226x4qjSf3Czv1ME+J5Vea0sz58TUH7kDs5MNFAQbR
         1PnPephI/7Ti8wajHrNIbW7FMdpNTxSzY/dD7SrOV+V0MQXf0G4A/sM3rkyI1kMF+5Z3
         BJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066498; x=1770671298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9S41g9PN2x0vu5e8nAHXjlyue/wUyh0Hz0olIY7xWNw=;
        b=VhsD/tRaAcKqdcaDWkBha/Tisa5Tf49EMv7ybiY82uM3ICAhlW339gEn+cCfoD58xq
         NnWFVCieg+0R/ZYkHb8kYJTu9+GrAImLnANLPRwdm7lLZHtn4i4JJUNgD2/9DK5iv6q2
         HfTFWUg039GwuqZK8JcRvrcNKO9fYlNxLqPRXOSFSmHkwk4aQon3+mUZORqvHHnhaOIH
         ihUfB/N1/sb5zmz0Ev7bVk4Eo+2QU/SKm7kV6cAkCRnALnADvR7yscBsk/Tpapp2YgPK
         gJOqOwKvVuop7RKGhoZuH8Il4711g4rpgsiax+ROi9lir/GsEHzBF5jxSkOBXbjrUnA8
         RwjA==
X-Gm-Message-State: AOJu0YweSWzVLdoVathKZ121I2DUlCuASFSVZbEPvTIDEpLVHOjU+0Mt
	pN01IBEEP++humsPaSe+WKQBgOy4voWcJ6CHtPbIt00QvdcSesEkWgqo3qjfmmrzRJ0=
X-Gm-Gg: AZuq6aIFF/c/mamtiB+jKD/d+D/QuQfIaYZTd9sCw2NvDxcPvSFdahUBfh1XQ9Wf/rs
	7zFz2rmo4h0e0zkd0CtTZwMfJknK8clxgRHPi8H2NI9Qfu302V1uQ/cP0SwZsrieHVwTIhkyjN/
	SOyeDTtt9bIWz/a7SfSnZaXDmqqhCjpiw/Hq04qwO5zXxvtxxyipYvzqJIlAC+MOuUCxqo144qk
	LfiE9kF1OKrWqnua0n0jpBrHiKoJa9NpYX5pW4iXPMapy4Sw8/KnXbVNQH+qLheQQsn77sT4SGf
	LELVWuEaUZi7IR0IES7tg2Ar68wXGt6L2XIoenbp7TaAmehnS2/ZepbeVtgXSm4s+nffQWYF9yn
	0YlhR6JVDCq/Qz8LZzTmQcBrGsoQ9funTXeZLb/CDoMRm3Ofzwq1NcjRT59eDldMxaauAWFz+Q0
	4b8r+X+JuRhqj2lSFfNavHvSTpgHCT7m3gCbhY0NQ6AUZ0IhaJU9p2A/8=
X-Received: by 2002:a05:622a:652:b0:502:a1aa:7a65 with SMTP id d75a77b69052e-505d200a67fmr129642751cf.0.1770066497719;
        Mon, 02 Feb 2026 13:08:17 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bb9a30sm117547431cf.23.2026.02.02.13.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:08:17 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 1/2] vulns: add a new recipe
Date: Mon,  2 Feb 2026 16:08:10 -0500
Message-ID: <20260202210811.2136027-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202210811.2136027-1-valentin.boudevin@gmail.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260202210811.2136027-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 21:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230405

This recipe is in charge of cloning and setting the Linux repository:
https://git.kernel.org/pub/scm/linux/security/vulns.git/

If the build is online, it is recommanded to use SRCREV set to AUTOREV
to use the latest available commit on the remote repository and stay
up-to-date with the latest CVE information available.

AUTOREV would make the build non-deterministic which would break
offline, turned off by default.

Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulns-native/vulns-native_git.bb          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-kernel/vulns-native/vulns-native_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 550ef0e0e7..f21a00749a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -875,6 +875,7 @@ RECIPE_MAINTAINER:pn-vulkan-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vulkan-utility-libraries = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vulkan-validation-layers = "Vincent Davis Jr <vince@underview.tech>"
 RECIPE_MAINTAINER:pn-vulkan-volk = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-vulns-native = "Valentin Boudevin <valentin.boudevin@savoirfairelinux.com>"
 RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-watchdog = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-watchdog-config = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-kernel/vulns-native/vulns-native_git.bb b/meta/recipes-kernel/vulns-native/vulns-native_git.bb
new file mode 100644
index 0000000000..7ea3f743d5
--- /dev/null
+++ b/meta/recipes-kernel/vulns-native/vulns-native_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Linux Security Vulns Repo"
+DESCRIPTION = "Repo for tracking and maintaining the CVE identifiers reserved and assigned to \
+the Linux kernel project."
+HOMEPAGE = "https://git.kernel.org/pub/scm/linux/security/vulns.git/"
+LICENSE = "cve-tou"
+LIC_FILES_CHKSUM = "file://LICENSES/cve-tou.txt;md5=0d1f8ff7666c210e0b0404fd9d7e6703"
+
+inherit allarch native
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+
+# SRCREV is pinned to a fixed commit to ensure reproducible builds
+# To get the latest commit available and stay up-to-date, set AUTOREV as SRCREV with SRCREV:pn-vulns-native = "${AUTOREV}"
+SRCREV ?= "2c9b20d7a0699222b58c4824560b716b6096637b"
+
+do_install(){
+	install -d ${D}${datadir}/vulns-native
+	cp -r ${UNPACKDIR}/vulns-git/* ${D}${datadir}/vulns-native/
+}

