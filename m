Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8321FC6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:37:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.14095.1664300244883748593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Dl/tvdst;
 spf=pass (domain: qtec.com, ip: 209.85.167.50, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f50.google.com with SMTP id bu25so14892713lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HesNG72VYumc/08GcpD1eU7SMBCwGf/OUL47Tax+ito=;
        b=Dl/tvdstxgUAby1Sr0PltaTgIdzJMzmo0xLXDXs8lv96AvNLnX8ne1rB0mMaF66LbR
         GGP9cADPmP1r633oaQjTP9JNHJ7XQccoK0DBCK7gQ9gmRYBybv+vJK4HPfpVD74NbcwF
         hHYl+8W45dXkq7jFbtTL9lQ7Bp0x6c45WnhrAEdB5gpdW8LBiTAS6FQDJwZDI/0ojbrS
         K43gsAPsDtnbLlALzq+TeusRIQsgU4nRlDfD9HeafMLZCtKpIo5M2YMo4TkDp/C5M1ec
         vsRLX/8uCosAGii+2rR6zrogoPiLpczhRlc00foMZF22Alfol8eGGjtBvxt+beIkqxpS
         omMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HesNG72VYumc/08GcpD1eU7SMBCwGf/OUL47Tax+ito=;
        b=X2+CIftRHboXK7rbLDtjYWbsbiz0Q2ce/HzY3zQ8hrQM4rWIn5rKgDGMMUxGYFKUOh
         MpVAzhru4BjWJfl5sgDP4H+Jf2N+DII3YaBl0k11S6sw6MdZCwwB1CvCg2QMAkdAIY32
         cCraS0f2CWoOU18M+G0Q9qbHG29Kp7lf7ZAU3soneajKuOJcUoCSKIAiQzqHdzzCVZE9
         ZnLvbFmlYDLzwZq5d9ZoVQPeMCGJ3hl6OIzr9moy4AxtH/hwQaLbjkllG/iqUf8ipK1G
         YABYB5PpsviOi2AvAynkSyjoUakiT5Px5TEizFs38kwV+LQQCdDn6WLy0EhG+db9xjN6
         3JVA==
X-Gm-Message-State: ACrzQf1sLLV0pU+j0G8tKXiHNJ/2vRmpzi97tA8nSALSWfAusk7xmL1j
	IWPSmYowE13BaHamrlhr1be8WmYs812i0BuXMGlTy4nPR4lBrYglZfuSdcJyB7Nqapfhoo+2Nkt
	JtrGWv15PmQ9JWJck2GHqaj4mCe3ux+jaxDadJJdLB6LmD8OZtebkfyGJW3s8JWaawzmVtZxL3r
	HRrHdCJcROMU16
X-Google-Smtp-Source: 
 AMsMyM5QxeQ+C2kK3+ppTaNzn+amDOz40qB45datAqviqKR1REmhyqnw2gH7ALRVMIlScULdNOAUVw==
X-Received: by 2002:a05:6512:10d3:b0:499:cce2:37a8 with SMTP id
 k19-20020a05651210d300b00499cce237a8mr11311799lfg.169.1664300242020;
        Tue, 27 Sep 2022 10:37:22 -0700 (PDT)
Received: from localhost.localdomain (188-177-43-54-cable.dk.customer.tdc.net.
 [188.177.43.54])
        by smtp.gmail.com with ESMTPSA id
 bu27-20020a056512169b00b00497a8f04905sm217765lfb.251.2022.09.27.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:21 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH v3] dropbear: Add enable-x11-forwarding PACKAGECONFIG
 option
Date: Tue, 27 Sep 2022 19:36:51 +0200
Message-Id: <20220927173651.745123-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: 
 <CAH1Ww+RttSrArcsM0Od1bFRPsc2QLhVMO9ujr73FnNHpqfFkdQ@mail.gmail.com>
References: 
 <CAH1Ww+RttSrArcsM0Od1bFRPsc2QLhVMO9ujr73FnNHpqfFkdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:37:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171115

Add the option to enable X11 forwarding in dropbear with a new
PACKAGECONFIG option ('enable-x11-forwarding'). Method uses
localoption.h file for dropbear feature selection.

Add backport patch to fix X11 forwarding in the current 2022.82
version.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
v3
- Add S-o-b in the backport patch.
- Replace CFLAGS with localoptions.h as method to configure and enable
dropbear features.

v2:
- Drop patch default_options patch and use CFLAGS to enable dropbear
features.

Previous versions:
v2: https://lore.kernel.org/all/20220927102904.722281-1-daniel@qtec.com/
v1: https://lore.kernel.org/all/20220720194416.89631-1-daniel@qtec.com/

 ...d-failure-use-DROPBEAR_PRIO_LOWDELAY.patch | 28 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.82.bb | 11 +++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch

diff --git a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
new file mode 100644
index 0000000000..a26c1a851a
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
@@ -0,0 +1,28 @@
+From 64292091fe3e8ea7c9bfe74af730b2ff5428bf10 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 23 Apr 2022 22:33:31 +0800
+Subject: [PATCH] Fix X11 build failure, use DROPBEAR_PRIO_LOWDELAY
+
+Upstream-Status: Backport
+
+Signed-off-by: Daniel Gomez <daniel@qtec.com>
+---
+ svr-x11fwd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/svr-x11fwd.c b/svr-x11fwd.c
+index 353cb12..5d9e6a9 100644
+--- a/svr-x11fwd.c
++++ b/svr-x11fwd.c
+@@ -206,7 +206,7 @@ void x11cleanup(struct ChanSess *chansess) {
+ }
+
+ static int x11_inithandler(struct Channel *channel) {
+-	channel->prio = DROPBEAR_CHANNEL_PRIO_INTERACTIVE;
++	channel->prio = DROPBEAR_PRIO_LOWDELAY;
+ 	return 0;
+ }
+
+--
+2.35.1
+
diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
index 2de243b889..41c14ff2f1 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
@@ -22,7 +22,8 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.socket \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
+           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
+           file://0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch"

 SRC_URI[sha256sum] = "3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1"

@@ -53,6 +54,7 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 PACKAGECONFIG ?= "disable-weak-ciphers"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
 PACKAGECONFIG[disable-weak-ciphers] = ""
+PACKAGECONFIG[enable-x11-forwarding] = ""

 EXTRA_OECONF += "\
  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
@@ -64,6 +66,13 @@ EXTRA_OECONF += "--disable-harden"
 # musl does not implement wtmp/logwtmp APIs
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"

+do_configure:append() {
+	echo "/* Dropbear features */" > ${B}/localoptions.h
+	if ${@bb.utils.contains('PACKAGECONFIG', 'enable-x11-forwarding', 'true', 'false', d)}; then
+		echo "#define DROPBEAR_X11FWD 1" >> ${B}/localoptions.h
+	fi
+}
+
 do_install() {
 	install -d ${D}${sysconfdir} \
 		${D}${sysconfdir}/init.d \
--
2.35.1


