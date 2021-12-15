Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD442C43217
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.2681.1639608053127313738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CALhpDe1;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id y196so17677166wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8F4I6ew87C21IPhMyoKCfoFHJsf0KkZtPFn2O+Gku6c=;
        b=CALhpDe1YzilFPHk8PebiF7SG5alrzEkA/rX9wkzKXzEoqI+pOfZZL2LZPKlwvjVzv
         i+GGGMi2dA5NTX8vwspw2KHLriwoEo0Wfsdypcc1xTKF/y9j6wMDquVIQgaAkpQoscqK
         aDbpqax8/KGZgmlyL6WKmhKUsvHHPD+PGYKHzQSPngg/+DzfP1r2E/1VHn9PyIXj3Zvc
         +I3wnKdDSGFd915h5q6iZvaDJX7WpZkmStWrnTxntCSW7DQbV7znLc1Mr3kAy6Sy0rAX
         aJ7t9OryCxTEsHcZTuFtDF9t+/YrzI+p7k9KS2HzmjXnN+iTkrqTfIMmWBuLgQxBMNAs
         UYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8F4I6ew87C21IPhMyoKCfoFHJsf0KkZtPFn2O+Gku6c=;
        b=p6oEq255B2aKqdqa2r3NEqxd4Ulvz68XIvSCuXdZKzcE9Fw3VXVyA++Vr9G+VjdVSn
         ThnKhrHa6iXsY+KkoY65qzzjKGYeUMfFXqdc0l7wM/Z8HPlkAB//mEParEl3AI+OXBOG
         IbipDYcINB0V3SmsRg/xNviXpWAGx4E2WB0FLbel7cuHAeUURERJr++yBBmfqlgNBxH4
         yEqCQ85fgiwk2VCEc+FRR6P4sChLV8A+k9R0iqVD3yMljyFEi1m80nomduJF6ow9AkmN
         8Tz+gTXbWny95FV3tDTKCsWI1WEyTi5r4yERrIX9Ri/3i0n6ybsrtWWkxlTW2aOTheuO
         6GCQ==
X-Gm-Message-State: AOAM530+YQ8+TzFNF2y3nz9TKsbyTq1eKnLQHEwwRN0hsUGI/TO+lC8S
	6jwfr0BwB9YBW401jQhmIMZAPrtCRbYOLA==
X-Google-Smtp-Source: 
 ABdhPJwAJbhDSD9yTbNWgUdpP3MafMY4dWLKmcoST48u/LSElFSDcs3gjfA4Z4Tk7nPzRL90b6BRaQ==
X-Received: by 2002:a05:600c:6025:: with SMTP id
 az37mr2209906wmb.194.1639608051783;
        Wed, 15 Dec 2021 14:40:51 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/26] rxvt-unicode: upgrade 9.26 -> 9.30
Date: Wed, 15 Dec 2021 23:40:28 +0100
Message-Id: <20211215224034.1814148-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159762

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc              | 5 +----
 .../{rxvt-unicode_9.26.bb => rxvt-unicode_9.30.bb}           | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.26.bb => rxvt-unicode_9.30.bb} (71%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 69b8a659ed..e7d520ebef 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -6,7 +6,7 @@ terminal emulator rxvt, modified to store text in Unicode \
 output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
 HOMEPAGE = "https://rxvt.org/"
-DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu"
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
@@ -22,7 +22,6 @@ ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
 CFLAGS:append = " -fpermissive"
 
 EXTRA_OECONF = "--enable-xim \
-		--enable-utmp --enable-wtmp --enable-lastlog \
 		--with-term=rxvt --enable-keepscrolling \
 		--enable-xft --with-name=rxvt --enable-frills \
 		--enable-swapscreen --enable-transparency \
@@ -31,8 +30,6 @@ EXTRA_OECONF = "--enable-xim \
 		--enable-combining --disable-perl \
 		--with-x=${STAGING_DIR_HOST}${prefix}"
 
-EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
similarity index 71%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
index 3fe69a543f..0133029e0a 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
@@ -4,5 +4,5 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI[sha256sum] = "643116b9a25d29ad29f4890131796d42e6d2d21312282a613ef66c80c5b8c98b"
+SRC_URI[sha256sum] = "fe1c93d12f385876457a989fc3ae05c0915d2692efc59289d0f70fabe5b44d2d"
 
-- 
2.20.1


