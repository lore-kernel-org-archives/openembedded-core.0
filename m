Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC458D59D80
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 00:10:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.34493.1732579837677753646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 16:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gC1AGRSK;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-212776d6449so54896995ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732579837; x=1733184637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1SGqR8ym3+IsE8YlDHblHuafQ8sr3QkPUX0plgLebE=;
        b=gC1AGRSKqS3KNtuaWrKUsZ7xyMjjJz8qqPEAkCUurhnud/imZ5RbPGLNd3dzYzLwdo
         /S0KKbHIIpkrWWTvDRg3BGNfEv4oqj0KxaC9/RKtGwqyITc40c6PDVm4R12XUKHBxMmk
         /S3MGkT49h2LeOy6Y7sw9mz8YPKfUoHa3mXsuVMQ1aDL5wns8fg7C5/5O5p2rInTgYOI
         g6m/006ABE2CkqnUP5ZA0B3fpQ6lSwa7jssT2jrJGBZVcnBcAI3Bl4ojdw5lv3mKyxS7
         ZdWUiBPhv1oIqurBGbGlapnAaRYp7tRKoI6Lc6dOvfNwEGfkuTl9/ufxdZO2Jkz6KJy4
         aEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579837; x=1733184637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1SGqR8ym3+IsE8YlDHblHuafQ8sr3QkPUX0plgLebE=;
        b=Kyvk1ZpiJuNs9l76i57/g6CijxnODtIEAuAPJZyvH8w7lJkH3fG2tSLk52RGjHoEDq
         y8mNDOdv8EqdpiGpHG3a02pvGS9QNSj3A1nw7CyXt23/FFyQQMSV9KR9A8Obf9W/ErVH
         2Y/6fhy9Spn8ZXXluC2h+x2FeqcmMZs3BPZjqZm0UB3OxL1dHxBQHsFgysTBGYk5D0Mm
         imB/QOy35AbcWR2z/baTENXFNW7IGWEMSfBJFCvCE4uCg5e2wD4mtuDSVUjAzizZstpo
         lTXgHgHf1P9pOTYGEMRQPjEJNQJxp2pm3hTI3ka57XEmKaLMJMxjeKD7tMjuzClgRm9U
         x5zg==
X-Gm-Message-State: AOJu0YzwKjvc1EbQdqD9Qhi5JfFJpfYgY/vvjvQonBfOMAlb/GRXVrem
	F9Biczt0r9G7iJFFKanYjyvyiAsUSuxzOKF1NSR5NVNbssLfdnR1lU7Y2A==
X-Gm-Gg: ASbGncsejoxaoGNBUWN8cYYvZ/4NRSbxDw3UQEaN56FXI6pqsZ7nlUjk8+2nmMPLMPV
	RUOB4mHQy+zOtLu/Png5mKqJFpiB0qFJalmdjQM5n/oOdRfbcAbnyXA6JVhxtt59xSEHjtkCIYQ
	EuJhXj9NbweYL4jWH84FNPU3tOkwIRurBdVbfcE7BVgKD3DUqeVwFlhpZ7FMFF7Ap7otd7vl2Ux
	tGu/Se7x2nTybBKqHIWwvbz06QQD7kB8Us4RH1Cfthx87MTopv9XwcQSoE7qDFl
X-Google-Smtp-Source: AGHT+IFLh3+eUh7wzKjDGZaxMmMiBjzWcz7peweyGCxxlaOZxkkpdRQZf1axieSB8P3e8fBLabJ9mw==
X-Received: by 2002:a17:902:d2c9:b0:212:5814:8916 with SMTP id d9443c01a7336-2129f5e7691mr197294025ad.45.1732579836699;
        Mon, 25 Nov 2024 16:10:36 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c1:5c7a:1bbe:c924:2a5:636])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm71383655ad.87.2024.11.25.16.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 16:10:36 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v3 1/3] hwdata: add recipe from meta-openembedded
Date: Mon, 25 Nov 2024 21:08:34 -0300
Message-Id: <20241126000836.6901-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126000836.6901-1-hiagofranco@gmail.com>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 00:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207804

From: Hiago De Franco <hiago.franco@toradex.com>

Move hwdata recipe from meta-openembedded to openembedded-core.

libdisplay-info is now a requirement for Weston, since commit
a16598b038b2 ("backend-drm: make libdisplay-info mandatory"). However,
in order to build libdisplay-info, hwdata is required. Since Weston is
built inside openembedded-core, move hwdata in order to be able to
upgrade Weston, so oe-core has no dependency on meta-oe.

hwdata contains various hardware identification and configuration data.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/conf/distro/include/maintainers.inc    |  1 +
 meta/recipes-support/hwdata/hwdata_0.389.bb | 30 +++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/hwdata/hwdata_0.389.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d61b88f7de6c..04208ebbf22b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -262,6 +262,7 @@ RECIPE_MAINTAINER:pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-hdparm = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
diff --git a/meta/recipes-support/hwdata/hwdata_0.389.bb b/meta/recipes-support/hwdata/hwdata_0.389.bb
new file mode 100644
index 000000000000..8ab455cd2e99
--- /dev/null
+++ b/meta/recipes-support/hwdata/hwdata_0.389.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Hardware identification and configuration data"
+DESCRIPTION = "hwdata contains various hardware identification and \
+configuration data, such as the pci.ids and usb.ids databases."
+HOMEPAGE = "https://github.com/vcrhonek/hwdata"
+SECTION = "System/Base"
+
+LICENSE = "GPL-2.0-or-later | XFree86-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
+
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
+SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
+
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+do_configure() {
+    ${S}/configure --datadir=${datadir} --libdir=${libdir}
+}
+
+do_compile[noexec] = "1"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES:${PN} = "${libdir}/* \
+               ${datadir}/* "
+
+BBCLASSEXTEND += "native"
-- 
2.39.5


