Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E45DCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 22:18:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4799.1777571598975484722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 10:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=TtZP8BMX;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.42, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso10950695e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777571597; x=1778176397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JRASaNsFgmPTjbXLC7nKZ/wlbOi8yD473WoGWv7wW7A=;
        b=TtZP8BMXZVf8VS+VNY9xNTiPY2rsIv4hcBh/0cqVADCHhJYf0fmSmPpSqQfGRoZdqw
         uC9H2QMOliCeuDYOk0cpiiQl6F/BSR8djmjhbUBNuyuVGie3UY1iHwPPxOENkGFAS6kp
         /3oBRAHefcqUynRJOj1P+ShC+hkMxEKlIf3EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571597; x=1778176397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRASaNsFgmPTjbXLC7nKZ/wlbOi8yD473WoGWv7wW7A=;
        b=IShxRNst/z69AJNlcAhgQvw5dqxiDv1C7uP7PGm6jl6+qTV6HESpRdmt9buaMmEXy7
         0ZfR9fIkvONM/2LFoF+64i/wDHtBQnLg13AqZGjgQC09FBBJ0vF28RmqpMjzsynzJhWb
         EkBoeodBniHTpQAbYrcJzijryGxd7u4C56Hv8cieMfY5895dlZG49EfikmSANmcDfiJV
         LEoTmocqzhQordWR9pvhOF7uh11yCtij/iN+gsD7ZKH2D1DSllb4ulQQpNRzMSvnT+jF
         QuD69nA7Av6RiqYy/0vTG3oklUoSh9QPBHmXe9lLsXBAdE1zj+5MC6kNUgp7RFUqCJ4V
         vO4Q==
X-Gm-Message-State: AOJu0Yx78AmISegJ9cKCVbMQz6JCbCMTgL9c/fvs/+VUxZ7uLPqX6t1L
	m6lkzZP8KZDQ1F4Ki866RDEB4pdlcMH9q7BdNaoQFuI5j5AQkWD/kM05HJC1R+8mFZ5fD8HIg3k
	QAi/a
X-Gm-Gg: AeBDiet5yNIMlHKS9Wyg1MSzOB/XqdrYpvlPqUjM0NNkOClNoLodZ+ph9qHiZqIf7Jk
	05C1GRoQcj19DcWm6D8GA0VpjZLCJAyydihKzZ8Km8NknlrCGhNcSPpErwMDqEK0t3ybEtX314L
	jGDgU5c8cgYsir3cy5N+Kmt2TY5iyQ9hI+GSymeRvQr7bEVSGJ+AP9q5QQCI1uNbhBPjlb0IsyI
	DbVVBAZbaKuZHQ40ReFa4xGy4RxOHrRFGobiH4xjJAjrD+4rD8SqnH0iLTwMItb+QuxzrBNDHMa
	lROmBCQInAS9kRuOD2vB7g+1fELy5b0Em0zO48jIbx7A0uAbVv1VKc+lIF8KmTnjdMC+umcHMmm
	8Oi7g37Vm1QapIrr3eW9T2gkYmsCet1vSefGQdfZwbGnAqVwqT2QIuChWBPaGgztApja55Fws2K
	GCTNmEQdOpvxNIQ9kvjs0BD2dRBk9m6A9OJBfjdoAzgi17qBpKc7gz6MmcY59YE3y3fE0vHf//F
	M2Gxoi6V89sd46h7GK6BwixAa9bvknUclMz3woZziEWeMnAWqfcEDf1FUlkkx84n9IxJFwLZbtT
	MLNz6b8L3UuKLK+XlecBDpmLuF4bo0G3q54=
X-Received: by 2002:a05:600c:3b8c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48a83d6e1b2mr70193035e9.1.1777571596955;
        Thu, 30 Apr 2026 10:53:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217b20sm13835551f8f.22.2026.04.30.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:53:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [OE-core][PATCH v2] libfwumdata: add new recipe
Date: Thu, 30 Apr 2026 19:53:08 +0200
Message-ID: <20260430175308.868993-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 22:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236191

libfwumdata is a lightweight C library for parsing, validating (CRC32),
and manipulating Firmware Update (FWU) metadata, allowing tools such as
RAUC or SWUpdate, and in general any application, to modify the boot
bank selection.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- Drop S = "${WORKDIR}/git"

 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb

diff --git a/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
new file mode 100644
index 000000000000..aa8184845c00
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Library to access Firmware Update (FWU) metadata"
+
+DESCRIPTION = "This package contains a library to read and modify FWU \
+metadata. It provides a minimal API to allow userspace applications, such as \
+SWUpdate, RAUC or any other OTA update manager, to modify the boot bank \
+selection."
+
+HOMEPAGE = "https://github.com/passgat/libfwumdata"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+
+SRC_URI = "git://github.com/passgat/libfwumdata;protocol=https;branch=master"
+SRCREV = "c6e235d3cf0467211ca6946bd10a2c8bdc0d5053"
+
+inherit cmake lib_package
+
+DEPENDS = "zlib"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


