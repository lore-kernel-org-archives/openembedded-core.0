Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672F6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:29:23 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.9097.1664274554543598555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=dPzXUZhY;
 spf=pass (domain: qtec.com, ip: 209.85.218.42, mailfrom: daniel@qtec.com)
Received: by mail-ej1-f42.google.com with SMTP id z13so19717390ejp.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8YenmgsyMeA8RNFodEOvGTntG7MYhQLct7nHf1Apm0c=;
        b=dPzXUZhYX4Hdo8pzE/g8QeKKiOrsRw6xWLcvyw7Nf1NZGifhQP0iDXr5aIn1VMBF1/
         bnwyUTStA2W8CyvdU8sFkYWTv8W1WdJ/kYX7VM6WOC55ItP9DNaz/c7QZw/CQdLQp87o
         uEQLv0kJKj/Wp5WdJtn3HoM4QupDZF4ITZ//UECrtm+mYTwipa944lv80DszDFWzlirm
         NJtH4M6bVjKuU74AmsS8mJ+i+LfAzH9fHpbdsUud/05t4BTDSDOTK2MnJtiufDetm5KY
         RJ6rOcvtkmmks9UrSZbT6dB6IMNgwm6CrrWLj4yt2VVtjUF9o+tczOzAFhxSNsBGfHMg
         qv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8YenmgsyMeA8RNFodEOvGTntG7MYhQLct7nHf1Apm0c=;
        b=QcJRlpOZfNv2l0mXn5pQAGPGTzbW7ZZEB5ojVh5LlS+zGjsUbH2Rbw3ByuJtS0E+a3
         QOEsNtLbuTSM2FWVoBTjBrOL9vxSjfPo1dqZL22iO7KNrv6vKY8VkTAQrwYavUeUwFY8
         bP6AvDi/4CjtTNB5utGbNfI8wyeWdYeFnm5RSO76nw9NpclgSOYTDHIhp6GyN6ZIxDft
         cIhDS40Wf1IDXsZ/alaDQNPTezMqg4X6Avd8EdouTsALprMUBGlc5/QLcSulDHjEfH1k
         iW+nPZGvqNfbhYeGXBK0icsoZZTdBa8ixoCOVhcIThiZ9mkRgyTu0h+evj5tCbAGTTJq
         NRAA==
X-Gm-Message-State: ACrzQf33HT4K5HQkv1y7WpOvg0VZuTHmdrPfD3v8hHeaLC76qnfOtATF
	2AmWKSCVLNUuac72p60aMTiN3kaJM3OFPeDp0c2U5PbQxwxphpZ5LEwraBE0nL/VlBKKNxI9buq
	mNtByl+7ctMZJZWgIGn+X3/8Q9a9bDo2NtoYn9WyG+B+RlDOhHESUZYOfMF/q2zOru9cUrddzSH
	7+Y89wCpkXXrl9
X-Google-Smtp-Source: 
 AMsMyM7jjsFH4jyd5UX1q0TL0Ivv4NqbTuFtQE187rnyxAZGEB2q9kHywh9RNkrriOmhw9RddL9xLw==
X-Received: by 2002:a17:906:8a46:b0:781:7171:74d0 with SMTP id
 gx6-20020a1709068a4600b00781717174d0mr21540245ejc.214.1664274551914;
        Tue, 27 Sep 2022 03:29:11 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b00782cd82db09sm576195ejj.106.2022.09.27.03.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 03:29:11 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] dropbear: Add enable-x11-forwarding PACKAGECONFIG
 option
Date: Tue, 27 Sep 2022 12:29:04 +0200
Message-Id: <20220927102904.722281-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
References: <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171089

Add the option to enable X11 forwarding in dropbear with a new
PACKAGECONFIG option ('enable-x11-forwarding'). Method uses CFLAGS to
configure it.

Add backport patch to fix X11 forwarding in the current 2022.82
version.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 ...d-failure-use-DROPBEAR_PRIO_LOWDELAY.patch | 27 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.82.bb |  7 ++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch

diff --git a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
new file mode 100644
index 0000000000..994bbdd42a
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
@@ -0,0 +1,27 @@
+From 0292aacdf0aa57d03f2a3ab7e53cf650e6f29389 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 23 Apr 2022 22:33:31 +0800
+Subject: [PATCH] Fix X11 build failure, use DROPBEAR_PRIO_LOWDELAY
+
+Upstream-Status: Backport
+
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
index 2de243b889..dfb4e21a2c 100644
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

@@ -53,10 +54,14 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 PACKAGECONFIG ?= "disable-weak-ciphers"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
 PACKAGECONFIG[disable-weak-ciphers] = ""
+PACKAGECONFIG[enable-x11-forwarding] = ""

 EXTRA_OECONF += "\
  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"

+CFLAGS += "\
+ ${@bb.utils.contains('PACKAGECONFIG', 'enable-x11-forwarding', '-DDROPBEAR_X11FWD=1', '', d)}"
+
 # This option appends to CFLAGS and LDFLAGS from OE
 # This is causing [textrel] QA warning
 EXTRA_OECONF += "--disable-harden"
--
2.35.1


