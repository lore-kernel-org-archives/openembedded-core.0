Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AA4EDB7E0
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75567.1775546028165077872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EbZMb7nX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso23288215e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546026; x=1776150826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=EbZMb7nXS0PCtseTq/egiBR6KdSNaaIqbtZBbqbs5onN/hrC4HVReY/624bJiG1HmN
         6Y1DWOKUw5KRHE9qrrjQISS00a4eQJDbS98SKFb5sqJDjFtK7YUXUWbDU7XYx19cmr20
         rGWy99L+OJ7AWal6dMp8VsZVzrfvmLR7Msx04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546026; x=1776150826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=M3kGB449qnZdPd7X44+mpm7ukHhbaDjInLSDNgbVaIOE9frkZDCtqRYVS4edffk0mP
         de2XNC0r9uqgP0MNjAEqNSaO+2xRQin83itmGXLpBeDnUQVf83z6xOxtTAzFqCTCG+6U
         hpCccG3GoGYRmc7d6ljOPm/VJJZ7c4ZLHU36oY5ihd7EE5R8sqkyWPRhpwQtVYzvR41m
         QZANNqR+XuEjgDSP46gRvI+qdEhHTHMvDnoDGYk/Vq7zbJuiLHb/0AEojBZYtTg66c7V
         an1lwZZAkzXt8Or6QzNbvqGRQwN+g5kENrRMPua8WblUFbheaN/Gpee+669xBuspm+UY
         VGiw==
X-Gm-Message-State: AOJu0YyamnNSzbKTgJVWTSIt1LTe07R/PwsiC/4GykBt1DpCX2lbzdGf
	BbTs8EyE0dEcXSRwjSsvrWEaCkVgV+feJqR4EeiqQ7BWSQ98L7qxQe4obpy9bdk11wb6ykhKdh2
	8xni3Gc8=
X-Gm-Gg: AeBDiev5KlSsfX7JeNH6CjycDS4hDuupHsGnlrvJBoW1ZYaIfJA9ck5aefmATbQeG6x
	MGNPwtRRzzvG08S1Gf3YHAQ/og0KXY4UxUA7hH70MWCVbOI9bYxLKgG2gHp1vd3Ld46JbYzqOYa
	LIccg4mLG8qOnX4Xf4x25JxmruaZDzVvXhfM5I4Yls51pWGk937eiuRQnKVDD5p1cC6RzvSlEU0
	cnPUN2aDnTBAG6GwJc++LMXZgclnl7/3oxmBDrakxaLwp9sFPYBuHnyIDU17+g+/McKWIigeJtz
	Mq+WMSD5RlfVJfujsR/8yjxUmgFbFyMOxAVYhXaIwx6GsZMAoIfD6ehStLnr/OzPJVCIhP2Cpkd
	OKv5skP6Q5foL61AG7GDKXDUsgvIJR3nJWJ4ezNwuF7hiMyYUvvp4HarFVCn5POIk8pZO21S8Uu
	uOJ4tIL1vUwneyvGkJEkiupvGnBDopzFQtXIEPcj42puNn+l0r4/JDZbNSFPzlUzmBO6BmxTSKL
	LkLuXiBjnWnNXdZ71HtR81bomvkOxpjtsegkA==
X-Received: by 2002:a05:600c:3546:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-488996da17bmr216992805e9.1.1775546026195;
        Tue, 07 Apr 2026 00:13:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 06/18] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Tue,  7 Apr 2026 09:13:14 +0200
Message-ID: <d40198e70a3b548e5dc7b95dee4fd4b9cb0358bb.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234710

From: Vijay Anusuri <vanusuri@mvista.com>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index bb81d77ccc5..1c08d4b1023 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

