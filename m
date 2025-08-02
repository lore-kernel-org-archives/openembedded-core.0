Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3431C87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 13:12:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.6437.1754140350298187038
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 06:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1h5ts/Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af93381a1d2so261793766b.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754140349; x=1754745149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/G7D3xNyGyT6IebT+/cZtlenDMd/UReaKT+YZms2Gm0=;
        b=k1h5ts/ZjsEIAO7IAvv3ivhBla/HGX1HSjyfjOxmcAcAQb+0aBFk9rh2RE/LPkFXbY
         8VaN2IPo+Ec17EOPMOlfPlwClCM3TK5PzZ3sPkniNd2cdHu0ZS7Adsq4uoHhuS39bkX8
         MNCfk+Ee3l6J/FXq3iKeBohH2gBpZIzRS1Y1Ll32nMPb9Ak+gxkUKMo9zIQlgcBa9TfZ
         5Tnk0WeD8mQgg4ueNNDApXt4FwdQViXQixkPHP4TSeaKuDFc4NPqnUoscHDHE0SKEnGe
         FredT3Vd2g92mQDVyliqOBt86APhcxPDO8FGA+MI0/y522cjeSAtbIOHL1wDn5AoLQQk
         tu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754140349; x=1754745149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/G7D3xNyGyT6IebT+/cZtlenDMd/UReaKT+YZms2Gm0=;
        b=hmRIdf8qcSFwZ2I7GaRm8CnLgIhYYSPz01JqJSzFKIPDaXbpQjd/em1sEfWZ05nQ14
         s/nSERkziviicQqxiExlNTDb5FErTrj6g/+C9bJIfum1cmqLriTLjtr4/+k4GRCmZVVt
         Xtg0Bxaf4jmko+Eu5S+lVjDCK75UMJeQ5usTmVaSf7PVEl7a+iCwqWMrCqfmb4Zv5+xI
         lqHtV7HkTC64QFAsfjEsmPeOeqev98jJ/eZf8Wnzl3llPIgcE0kFBTiIrw321soIhCTh
         NTrjnibAqvfnW3rbtkdQxLU7LcISkfNMxqObHEjQG88HACsqoFGiVRSMFt+vpzfjBGw+
         f3qw==
X-Gm-Message-State: AOJu0YyNLrX8ZT4Zud40QBdMQUXqUCH3wEi4Z1m96hSgh7riZpaOxiPd
	O3AoN4RnaUDOf2FT8R0bVT9m91jBhp4kQ6NCfUdKEW9hMwpldtdSA1Ze5FTkVQ==
X-Gm-Gg: ASbGncszZ3WGXqoxM3E1Nrkc6n0YCxJOv0xfu99UGCNZqcUZg5dXTe7xz52c3gA0ho9
	mNHHabhUbwZtz8uunUnjwW1drQTzFdUnBNch9Gf0BKA25747riWIKukIj+UyFdhncqYdp26hbib
	82Ud2b/Wb/MZZW7ZRLvJvT+44Lk2XQrXe5A1k2MoieMDrdroLHID2oKVstvBRuonlXprXSeNvSz
	ESvW5bP2unF07hr9TPOOKJXlQrUvrtr0n/PVE2U6TFNzUAJa38/caB2ERdKpFvDZCsfYRmbdRcq
	PaKx6vb9lq9nHevR9ies4nXD6PoGjuiwgFoYTcwle0exBuZBVThlFjg6IKZr0Ho8Lro57xOVe6+
	uHuU24qAppJhxyWv38AE=
X-Google-Smtp-Source: AGHT+IHO2pqiAkRQyJwIWw8esNg/NrZlKLTopHZbj4rhpnY4mR7WO1AxCB9f3w8KHSLXvIQgdtaAQQ==
X-Received: by 2002:a17:907:3f90:b0:af8:f58f:89dc with SMTP id a640c23a62f3a-af9401f80afmr383332066b.41.1754140348400;
        Sat, 02 Aug 2025 06:12:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af937214cf1sm217963866b.143.2025.08.02.06.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 06:12:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dpkg: upgrade 1.22.11 -> 1.22.21
Date: Sat,  2 Aug 2025 15:12:26 +0200
Message-ID: <20250802131227.677594-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 13:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221381

All executables and scripts (except for start-stop-daemon script)
were moved from sbin to bin after the following commit:
https://salsa.debian.org/dpkg-team/dpkg/-/commit/12e3bc2991ac27f73545a246bb95b84fb8d262c9

Changelog: https://salsa.debian.org/dpkg-team/dpkg/-/blob/main/debian/changelog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc                          | 4 ++--
 .../dpkg/{dpkg_1.22.11.bb => dpkg_1.22.21.bb}                | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.11.bb => dpkg_1.22.21.bb} (91%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index f87d0739ad..dea1894a4c 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -50,9 +50,9 @@ do_install:append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
 		rm ${D}${bindir}/update-alternatives
-		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-* ${D}${sbindir}/dpkg-*
+		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
 	else
-		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-* ${D}${sbindir}/dpkg-*
+		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
 	fi
 }
 
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
similarity index 91%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index adceebf8e6..cc30b71109 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.x;tag=${PV} \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -17,5 +17,4 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "ee7e9118d0a9581cb00c5ce02dccd561b3096387"
-
+SRCREV = "d72b038fd2113cb62972e4071db03dd1388394d8"

