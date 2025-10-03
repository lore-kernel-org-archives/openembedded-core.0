Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B125CCD186
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.913.1759510089633388397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lp/6gExg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5506b28c98so1726325a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510089; x=1760114889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtsW2k/O6Ea9cS4kBIcTuM0+JrAyfMlwbtP6uvRMYZw=;
        b=lp/6gExgzyUM2IEpUTAUir5lRXI+n7R29qFrY25te4ngiOBttukaZdcJNRsUyEwWn6
         76iKy7xKqqiyPA0J5PKYCLiXgknYrkomAr9YCW3acMnjFXb/i0hBZb9vTbKjVaK4mKW0
         sAkiA5hvyOmslDAnHEO4sOYDrVFxS9wFGnKnRAnsv9teCHccsSyIG8TxKWtgaBMv1v/Z
         JelXCoMLe4G0MM69Nh1xCtX0sVwsnONMLgV5Z5m+ad+JJXpMyKGzjlB5SIGltes6AlQ8
         KB7K/pbRzUO3bYUB2C7TM4oWXW6GgtUni2fZVHQ9fH3pxq938WJcuzH29zWb8w2/qtCr
         rW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510089; x=1760114889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtsW2k/O6Ea9cS4kBIcTuM0+JrAyfMlwbtP6uvRMYZw=;
        b=rLiPc94XmrWZzPSIGSpWu/TkXGCMRMpoW6/ZoGiRkwBcCGU7vaV1sfLbCuoC31zDrE
         xTJoUf5gmHf+P2O9rke43NaEsUkjoxrDvMNDaaQLxjz60USxg9AJLdFuiXJqUCUyVpJj
         LH+sSrsbgOFKo6EfikwqIk36CnnUnytgCUOnhVlNht4NDeLowQQ1BRx8J7BbxdvOWdxb
         THBin3A2o/V8dtua68tOkLeqXtql2RPYPc0KRo2KLw/t2fzCGBbY0wK52mQCrUmDb46z
         upapJuU2TpN5tznTh+L555A02bHJV0GzbPYx1k7bG87xmiuLmS822ykxraSp//Jda5IG
         prig==
X-Gm-Message-State: AOJu0YyCysFUCXr9cD5zKC9tBY6BzOYXAL+ArRCdXFb2tMvBL1H1H+bb
	0HRk6LsCwcTtJ8dvvirjPW1HrFAKG3oRirKtfJd33OuHiP8Oew/dgmfx1oKfWwq4RKyjo6shJ8c
	HJCnl
X-Gm-Gg: ASbGncscTIaxAzSgQolv7RNu9CoLH2pe3DE+wlwSpRPTzce9vRH2QBnzBl5ZQT31I4v
	5PuNaZDYEDEWvs2urr2GEkXbQcE0dCtf0r3RvEeKVqFUg6813uwIeQ3gYdpnHi69PHsUwzSCONn
	t9vvqH0x8/Hd+wAQmDUHcUnUgIkOXsnElJfSAaL98PGLEp8F+2uJwA8Kh0qiMQW4A6QHS43+bq9
	RlI9SMGgT/KOlMKNXj786YpvSdF2Dwmw7w3xaXAc1XihMqSbUacXFswxG0jJKZklsu4ToZgcPAJ
	D0kA6uEk/ahdZhrbSeULzHraZw3v/yKp6x/SglZP6JGmAmp8hJoupBcP1/eYhMYZJsnqTdM+KSf
	s/kNADckeS2ZoVRxlmu5FuBKDTYr1GO+AWsUbSg==
X-Google-Smtp-Source: AGHT+IGCT14G2KCsRflKVPrmMrkTOP/2JZ5AQKMGZGtVC3E3H8OcNqZCcsrmHBkJuC/B+hJFuiYSWA==
X-Received: by 2002:a17:903:94c:b0:24c:965a:f97e with SMTP id d9443c01a7336-28e9a51347dmr42894015ad.2.1759510088888;
        Fri, 03 Oct 2025 09:48:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] expect: don't run aclocal in do_configure
Date: Fri,  3 Oct 2025 09:47:51 -0700
Message-ID: <61dbfd66210b090ec8abfbf1f4688e5691299d68.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224407

From: Ross Burton <ross.burton@arm.com>

expect has a hand-maintained aclocal.m4 so don't run aclocal, which has the
side effect of not deleting the aclocal.m4 file which pulls in macros.

The build works without this change more through luck and a combination
of behaviours than design.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 461a2c093a..4d4c91891c 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -39,6 +39,8 @@ UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/${BPN}${PV}"
 
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
 do_install:append() {
 	install -d ${D}${libdir}
         install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
-- 
2.43.0


