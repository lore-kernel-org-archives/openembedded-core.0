Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FD8C43219
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.5893.1651048829960020647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lvBJ44tH;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id k27so1096275edk.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKeGDWgH+lwbw1J17iT75Y+cic4ooHHhWivJQKhtSEU=;
        b=lvBJ44tHSczzI9Ydcb+asuuPSRo1pqIo3FqYtoWr5HBQ9K34t1hSvU9Pbc77GBSr6o
         sKnbZzX1you+KP6ee3gLkpxt9UbZhCV/6On89elczIhT5dS5ephRin1lAfpvIHBJxp3c
         DZCDqF0mUYSd3dSc9h9tBWPciKHXMSttvMKpE+M4kGXDycnxr5ST0Xx6rYzf6Myv1bfX
         c9zFWRLJP2h2EJB5bugJFnhxmTKhUUnQlLUkTbIS8mv3Qn1s3vYJFxBR5qWne485pIkA
         oXOA6klt8Emu4V8s4h3P2IU8TF+tqwPgZ4ncNQujlyF6FkgYA4NRgvCG0hW69iQtUOri
         O+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKeGDWgH+lwbw1J17iT75Y+cic4ooHHhWivJQKhtSEU=;
        b=gAFzzVU9h3Ml2UJFXtOEKwBPHuYqByjoixUXIzIbdFi/aYcbMcbrl38xwxX/NuPmNJ
         2IMTxv8vO0hxoGu6nDAIqL8HNIPldTcXmkB/B3Jo1fnF+IWDyZjk4bLERpRfM+yTl+ZK
         nobYsYtWnvBOiAY8kPo/fwxpaxTfLFPn9uJtzsCYEZIiZm4Y8Z9KaR8U7dBl5RTSMqJ0
         ckZs4Gq31KRZWFoTzhBJKJRaeUkvbOMG1u2uCI/E3OXWx2ESmvZWEusWawn4ogeuvCj+
         it88iknVAEmll4xNR3z0iii/l04+awtcJEVw6hKoeQPawe+rkk7wzy+P39Kb+9p3Q38D
         gFCQ==
X-Gm-Message-State: AOAM531SvHnrnt/UzjeWOgggDkmpFOJIWkdzcNngs8FLyuw8vY+IivLk
	KGR7qt6e3NPkZXZRy159KusuIHdvnyc=
X-Google-Smtp-Source: 
 ABdhPJx2W+MNIL/l+VbLfo6/F8dIOaYxSk0j2vPJQNpl1il/GI6Dr89GVAQXuDXsbYnLLf38257n/w==
X-Received: by 2002:a05:6402:4256:b0:425:e639:5da5 with SMTP id
 g22-20020a056402425600b00425e6395da5mr16237878edb.314.1651048828573;
        Wed, 27 Apr 2022 01:40:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/18] stress-ng: upgrade 0.13.12 -> 0.14.00
Date: Wed, 27 Apr 2022 10:40:09 +0200
Message-Id: <20220427084009.3406717-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164909

Disable apparmor via empty config file creation.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/0001-Makefile-quote-CC.patch    | 41 +++++++++++++++++++
 ...ess-ng_0.13.12.bb => stress-ng_0.14.00.bb} | 11 ++++-
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.12.bb => stress-ng_0.14.00.bb} (76%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
new file mode 100644
index 0000000000..498a024830
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
@@ -0,0 +1,41 @@
+From f6162ced588c17c1141a8f6154475a299a2ebc0d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 26 Apr 2022 22:35:35 +0200
+Subject: [PATCH] Makefile: quote CC
+
+It can contain command line options, and therefore spaces, and so
+needs to be quoted.
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/188]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile        | 2 +-
+ Makefile.config | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 501093f5..8a454edd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -432,7 +432,7 @@ stress-ng: $(OBJS)
+ 	$(V)sync
+ 
+ config.h:
+-	$(MAKE) CC=$(CC) STATIC=$(STATIC) -f Makefile.config
++	$(MAKE) CC="$(CC)" STATIC=$(STATIC) -f Makefile.config
+ 
+ .PHONY:
+ makeconfig: config.h
+diff --git a/Makefile.config b/Makefile.config
+index b76d0903..f03f7a85 100644
+--- a/Makefile.config
++++ b/Makefile.config
+@@ -69,7 +69,7 @@ else
+ endif
+ 
+ 
+-MAKE_OPTS=CC=$(CC) -f Makefile.config --no-print-directory
++MAKE_OPTS=CC="$(CC)" -f Makefile.config --no-print-directory
+ 
+ comma = ,
+ 
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
similarity index 76%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
index fe177a4de0..ada35dbc4c 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
@@ -5,8 +5,10 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+           file://0001-Makefile-quote-CC.patch \
+           "
+SRCREV = "ec7f6c4731a54f0e515bef7f7e84ef9e9b8125a2"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
@@ -18,6 +20,11 @@ RCONFLICTS:${PN} = "stress"
 
 inherit bash-completion
 
+do_configure:prepend() {
+    mkdir -p configs
+    touch configs/HAVE_APPARMOR
+}
+
 do_install() {
     oe_runmake DESTDIR=${D} install
     ln -s stress-ng ${D}${bindir}/stress
-- 
2.30.2


