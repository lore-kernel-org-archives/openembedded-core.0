Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78618D66BA2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 00:51:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.61696.1732668685341302030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 16:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJpzt/Qc;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso19915a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732668684; x=1733273484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwyz8eZo6tz+lYldf7+5kINb/RzYNkd6b3z01ZAP/G4=;
        b=HJpzt/QcLRzLL5kI7I78GzMxjNAG6BVUBRWO0Q2TGhMowGj2xNatu0Z46H6RRLOI5s
         PPc02wtCUWvclB3DRxaXXQqG4bcBzTdy7Y2+Rb/SgpFoOI98C4p1YOBsMYEOMbihejhX
         xgierZFJRlhOwbCrscDBeNWOpygCRkXaLhALj/m+GjHuzJ8Yi662hA47qYrYZWvujRzQ
         50n98S3hN3YkOJ7yAzDsY/hMMic8b3bj62N5oWp2ZEbX9DpyzcIx2zYiKgxeZxnOA8N4
         LZOOzFCA3+sMnFydWngxiMGXYZU+XsxxfRxKE4mtVhyHxrin5/QdnfTb5+hhPzK4u2CD
         RK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732668684; x=1733273484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwyz8eZo6tz+lYldf7+5kINb/RzYNkd6b3z01ZAP/G4=;
        b=NAyCPAJIq0XQIzrWaL6gnsBjQ/20e0anI9ks8vGV3qBPnTzKtQPI9IqS5TXzs0aWCm
         4z6Gi76byjNYe+Jm8FNbBuACc19sKgV5BJq1IrnVwC9Gh4vaY/Eq+ST4LnLoiuqaIYen
         6yGco8b1yZ03kVo3Puu/z3MuFZiDDP3AMAI8yID+47xJ5mOlvPsH8nhy0QNU0YEaVl64
         Q9xyGHeZJoN8cjhhAg2m2o2iMiaEe3LjDBU7H83RztX9SqQdsPoLD9vSbU4CuvnX1MqS
         SHROS9oN6BEPH9zG02kuJ8ULyp1Uhe1aUGaEgtXmv971sEDn4+Ic70BlBdzTsCBU31o7
         sXew==
X-Gm-Message-State: AOJu0YygpQ9VXFxEbr9c4pikCt0R1k6RpG0/INhPwAi2K8JZYBYDxE0S
	DRVfu69nb3HGm0l5dksIkiD2tAYmT92W1uTJige1W7QikmNQzNzA6fpdbA==
X-Gm-Gg: ASbGnctX0HAtcHCWp3m4x2OPp9rtkQiRevxzXzuaGsDLU1BnMBkO++FANUpVjCgODRs
	06b9DFC2Dfldjsyi8tW2WtNz7ZBE58t5QyxNFNmlFe+6Vs2fXoaQKzswq9AfrvY5wPX3/CXtoFH
	lClRKZ8DI0rQWRVS+blF9EWmbKceJrPVGSuHyBMyq2et3c2BpQTa2XaBxELmf/Oeshnbe8cMc1g
	RA/lVxIJT7DkRhSCFD2CdPkloUCc88X3ReL6Fl5lqFyreU4oqlD
X-Google-Smtp-Source: AGHT+IHhcWPOU2kqHOFYBofDPjedHbOg1lBMpWJbJppwk8iwyWVeAYotJFKuqD5FNRTMVZLJ7QSdfQ==
X-Received: by 2002:a05:6a20:4393:b0:1e0:d5be:bf75 with SMTP id adf61e73a8af0-1e0e11badd8mr1896057637.17.1732668684432;
        Tue, 26 Nov 2024 16:51:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e41d7sm8092209a12.23.2024.11.26.16.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 16:51:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] seatd: Create seat user and package systemd service
Date: Tue, 26 Nov 2024 16:51:20 -0800
Message-ID: <20241127005121.683644-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 00:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207890

With latest version seatd does not work properly if
user access permissions are not correctly set, therefore
create 'seat' group and package the seatd.service file
and enable it by default with systemd distro feature

set logind to systemd when using systemd as default init system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 8da57acc567..8ee43a3dc8f 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
 SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
 S = "${WORKDIR}/git"
 
-inherit meson pkgconfig update-rc.d
+inherit meson pkgconfig systemd update-rc.d useradd
 
 # https://www.openwall.com/lists/musl/2020/01/20/3
 CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"
@@ -22,14 +22,21 @@ PACKAGECONFIG ?= " \
 "
 
 PACKAGECONFIG[libseat-builtin] = "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
-PACKAGECONFIG[systemd] = ",,systemd"
+PACKAGECONFIG[systemd] = "-Dlibseat-logind=systemd,,systemd"
 
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
                 install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+        else
+                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
         fi
 }
 
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "-r seat"
+
 INITSCRIPT_NAME = "seatd"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
+
+SYSTEMD_SERVICE:${PN} = "seatd.service"

