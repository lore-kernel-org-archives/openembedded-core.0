Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB80C79FAC
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:03 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34919.1788788157202117607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yqh8oNmT;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48584dc164fso3372652f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788155; x=1789392955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=upndc3jtG6zuoJ2tRjcDWhb5064N6xIUNBjEFkdXOe4=;
        b=yqh8oNmToWvdegao1LltUA0zwgbhAsKAhz8xfklvQQL5pyuZ/QKs+XtQvfIyJthQCv
         +ZSVCS1UfR24ag/k+nxFaJ5gx8/wq23lADRZhHXq+d4Bo2EMc7kGb348npAFVlgbKDbG
         tHHjRbP7AshKrRo1RICFfsHmLNW0zm3HtzKN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788155; x=1789392955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=upndc3jtG6zuoJ2tRjcDWhb5064N6xIUNBjEFkdXOe4=;
        b=sr01Ttvl7Njb+JiivT17icsXHKHZD8Gn0RkkF+0tswynN3s6nFqW/EKTUuAECZbfRy
         hdmcBEQA0Nhesd2dJzpt/Jm+Khq2mPEhcKl3LJ9Ew0ozBgHUqEALC5HT0FrpfC/tEczr
         OCNjNpz7IBsk5IsEt+WNt0FmBW1efoN4TrBtBpjQVvD47BjUgNGhf9ENLd/L/gvEQyyM
         dv2rU+wa6vf8+7zY8iaL+ZTHQLTavhqBdEm40GtJ3lUx563A1hJ/WddeadyAJz70UNAj
         autNYBjkBfnx8G7QF02QNhpfgCXYc/DCWEgUSAkm1hWrHJitro886oeqGW85+Z9oD/uL
         u68w==
X-Gm-Message-State: AFuF++nKY59SpsAJUa38ErGd6PWNtXURhUFsBFJJKzbwa846DvpyxVvE
	WCEHkoiFnf5tnwBsjd2RbCoE0D321BebwQXsHaUwRJPvR+ZLQF4r8jUqckYJwLiaZIFibl/gZRc
	OevpK9po=
X-Gm-Gg: AYBFou10tD4EvnKgD6AW05tgT3Ucsjv7ymg9Po1xOSA9nXC9u7CbGdf1rBelkcr9+M0
	+C8ycjArLBL3uqoJu7ILSejxlCHMBD0AJWO0XOwLTaGQt+N79qs9mExBMxhlkNk26TT/RPTG0da
	35cUvTgmKyrf5KdASwJ5LT8C+DalWYDxxX9y5vXaZ5WCSZ7dryvyBS6hwDg5oqeaFLj3Eu6y6CX
	jNnO8ZxyBQJC0f4Na2ym0LyrulZtFMhogGTWoyU0ty0fsQOgpT3D7kso/1PN1g4yAzN6MHIXe+j
	gVGRQkJayl33Bd6MWW0bkKQ88la6c4sgC7uv5Z+eCNyI4t2PqDC26w9TX9DaefqsLR/xd5muyZW
	4eCBo0Sh1WtZdk28F4BQap+IqDG6vQnmAXDtfG9FAIkmRNQ19X8lvtf6H5ra0fBE0oH/zd+NwO7
	bLy7RVVoQ0ULBGN0NsZ8bkLrgMDzNbUvVtFVcIS+AcDqCOGVyog/9+MCn+4l+gTQG7YuXl2e7tF
	7CTubLNmG5K5Q3k2/xGvSFiOhzBP3/U5qHMAwJ5WksYzVPsjJpZg5tMLw4aDo9r
X-Received: by 2002:a05:6000:4a0a:b0:485:8a46:704d with SMTP id ffacd0b85a97d-4858a46713emr22311882f8f.31.1788788155450;
        Mon, 07 Sep 2026 06:35:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/35] libevent: use libtool to install test binaries
Date: Mon,  7 Sep 2026 15:35:04 +0200
Message-ID: <9d8cfd0d991cc03afe26983abe16dcb5ca341898.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245266

From: Ross Burton <ross.burton@arm.com>

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1dc0e5e240adf61561c899108d2fb5be71e648e4)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 25388fb4d7f..be690fe94e9 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -52,12 +52,8 @@ do_install:append() {
 }
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	for file in ${B}/test/.libs/regress ${B}/test/.libs/test*
-	do
-		install -m 0755 $file ${D}${PTEST_PATH}/test
-	done
-
+        install -d ${D}${PTEST_PATH}/test
+        ${B}/libtool --mode=install install ${B}/test/regress ${D}${PTEST_PATH}/test/
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }

