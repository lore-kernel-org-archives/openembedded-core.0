Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB30EC433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 15:04:40 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.10233.1642950279523655984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 07:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H4NtyVmE;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: festevam@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id
 q16-20020a4a3010000000b002dde2463e66so4957894oof.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qjs3LkMo/7k/8caHXlwfnnSEud82dp9kap92LRNDr50=;
        b=H4NtyVmEpywGcSq0+isH80z+FNYyjIqx8Qi42YBXQqt3ECsgSLvDtJS2cOUeDK5a45
         D6vuQ6XLu65wCMd9081nGZSOMCCaeIVVSYVRITnKPNCyBdheQYiUx9ZC1gCZmshVyDn8
         nce3U5ZHs91OEl5oV8zfMdbJw3vRomr9X1b5VI8jeWNiViy0Qor0ykJGQmQHuzuQ3WSZ
         dwZwkY2U0KHGj5Do4BszV6Sy/LFIKhW7jKW/vBZ1qD68c3HbMFb60IFX3VeUASBWGUV+
         zS4d6hUNjY9875pqsFfBMnYEpR3WHU+YmdH0rPxU4qM7Xj0yKmzp+GYWn0V0MWvsICaq
         DR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qjs3LkMo/7k/8caHXlwfnnSEud82dp9kap92LRNDr50=;
        b=2kEPPiQnzW7ErlPjvhzjtsdTSAruyv+EIn/jU3ogxSIu1YDS/pqq6Pvb0cLpAZBp3L
         /rGvBHi4NoCBe7urvtayGUzNZgIxos9TnR2+6nXem8tSgeafE3WIN6ZDkdp1eDa1rERH
         Z+JiDebqRuAABMPQC+PQIgpI5dcNxb8pr8HNFiAq1EDbhGnYxe1sqzUtBno/PoXzGwja
         vTtYz/DlkOefblV8j73al7yBCIR9IYdEhk9zryILP6ltDbeUZP1IEXmygSfvr7K1q7sl
         zjOMpS0puMbt3XYE35Itln5XeWSKrKc9HugqSME13hj2MbnmwQf1ZouthqyjDgue+fe/
         ApAA==
X-Gm-Message-State: AOAM530gTwyMnk4Iqn1kmTvxEUE90u7KyQX5bcCjt1TAwnHgw5foZjks
	BFMQ9ekHhIubKTzBglEjFnL8Hs+BpJU=
X-Google-Smtp-Source: 
 ABdhPJzKbWE9xe4aAFyaq+Cj9p9cZxfc980gxsqVyuWJaW+eDreLE9CfceoxZg6c9BXqxm75DB9kUg==
X-Received: by 2002:a4a:5785:: with SMTP id u127mr7696712ooa.49.1642950278496;
        Sun, 23 Jan 2022 07:04:38 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:d01d:3b01:c62d:9ff4])
        by smtp.gmail.com with ESMTPSA id q23sm90791ota.38.2022.01.23.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 07:04:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: otavio.salvador@ossystems.com.br,
	hs@denx.de,
	alexandre.belloni@bootlin.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH meta-oe] rtc-tool: Add a recipe
Date: Sun, 23 Jan 2022 12:03:58 -0300
Message-Id: <20220123150358.1306062-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 15:04:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160866

From: Fabio Estevam <festevam@denx.de>

rtc-tools is a useful utility developed by Alexandre Belloni
for testing RTC kernel drivers, such as y2038 support.

Based on the initial recipe from Heiko Schocher <hs@denx.de>.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../0001-rtc-tools-Add-a-Makefile.patch       | 52 +++++++++++++++++++
 .../rtc-tools/rtc-tools_1.0.0.bb              | 19 +++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
 create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb

diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
new file mode 100644
index 000000000000..a372e390efb9
--- /dev/null
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
@@ -0,0 +1,52 @@
+From faa6dd2e4d063afcaa19f16740a3fc413a399e60 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Sun, 23 Jan 2022 09:22:19 -0300
+Subject: [PATCH rtc-tools] rtc-tools: Add a Makefile
+
+Add a Makefile to make installation and uninstallation
+process easier.
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-rtc&m=164294073129803&w=2]
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+---
+ Makefile | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+ create mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 000000000000..4f244d9289f1
+--- /dev/null
++++ b/Makefile
+@@ -0,0 +1,29 @@
++prefix ?= /usr
++bindir ?= $(prefix)/bin
++
++EXEC = rtc-range rtc rtc-sync
++
++all: $(EXEC)
++
++rtc-range: rtc-range.c
++	$(CC) $(CFLAGS) -o $@ rtc-range.c
++
++rtc: rtc.c
++	$(CC) $(CFLAGS) -o $@ rtc.c
++
++rtc-sync: rtc-sync.c
++	$(CC) $(CFLAGS) -o $@ rtc-sync.c
++
++clean:
++	rm -f $(EXEC)
++
++install: rtc-range rtc rtc-sync
++	mkdir -p '$(DESTDIR)$(bindir)'
++	install -m755 rtc-range '$(DESTDIR)$(bindir)/rtc-range'
++	install -m755 rtc '$(DESTDIR)$(bindir)/rtc'
++	install -m755 rtc-sync '$(DESTDIR)$(bindir)/rtc-sync'
++
++uninstall:
++	rm -rf '$(DESTDIR)$(bindir)/rtc-range'
++	rm -rf '$(DESTDIR)$(bindir)/rtc'
++	rm -rf '$(DESTDIR)$(bindir)/rtc-sync'
+--
+2.25.1
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
new file mode 100644
index 000000000000..8f0326829d8c
--- /dev/null
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Useful programs to test rtc drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git;protocol=https;branch=master \
+           file://0001-rtc-tools-Add-a-Makefile.patch \
+           "
+SRCREV ?= "acc442e7af4e1e783432a43d37f1a7938c692659"
+
+S = "${WORKDIR}/git"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+EXTRA_OEMAKE = " \
+	DESTDIR=${D} \
+	all \
+	"
+do_install() {
+	oe_runmake install
+}
-- 
2.25.1


