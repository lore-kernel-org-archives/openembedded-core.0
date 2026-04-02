Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E491CC6B06
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9230.1775107336919954019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UUKVS62D;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso3756415e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107335; x=1775712135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49Lh4v2vCV6JOirh0kZapps+5k+z4/KLAPgg2sgFjpg=;
        b=UUKVS62D2OpTuVGyo/0z2y4mltNlCjABuNxKKVh4gy5eZ49LtQZQn7nrsD69gDiFt9
         2jAk4j8S+bKcwb3q4iN5hbWPlusmkXcY1a/JNoeyyCoAluhQuK2qQsAJlftZ20uJALA5
         a4hy4/ulkKlZoSV7PaeIhrCdg7/a1hDrJE6Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107335; x=1775712135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=49Lh4v2vCV6JOirh0kZapps+5k+z4/KLAPgg2sgFjpg=;
        b=lBRyNiHTEdcFL0kT1Cb7xFwSRAZWtB0or73bJbbYo0D0gi6DFKo6kUjYQ6U+SvDwJF
         jE7v1DsnkXI47Z2rqFjjiF9zjLxkJoATlHDnBGSfXruxCVOAQBTIzOPvaiQZFqybdPnI
         RMTLmXK9lmUJLafIOar1QtyBkQFat9YmyLHe1I6NXMyUrR/v211RzoEHPP4PHzXOC1K3
         bagbCniEo7xew3jZNhmiYqUI5peM6mYYx1rwuE0sBNKZVbG06vC+ksuniU/4hZSnvfHo
         iWBzm7u7yt2m8zG6sqCI6AundF+INvaF0oPtKMKB+dPZLns/Ak8fQZxUUTiPgend9Ld6
         6xEQ==
X-Gm-Message-State: AOJu0YwHSzC6D+RZmhAw6TTTLxDozhMQKgolr5kQlKqaJGj7WrqBZUeV
	Uxp/BxVWNmvPybMlm3Fuj4U6dfxP3C2h9bCPGe7VdIAR05LcxD/plhoM6xwQs4aKpXbzGH9D7WH
	OPTkAEnk=
X-Gm-Gg: ATEYQzwZW+tocHcyRiM4kG5uPgFzNQn7hR5NORoUa8SEKHubyr74S7fe3Mdxc44KLZ6
	QsOvAv9HcJPDlWNurPpoT6c3N2kn5Q3zBwScXFvxTrVZjqXb68gh4pK+uDKxzPdNveKinmh6xQu
	w7n3C+mmM1KwwDIgpak83LDbKwAgaTDq9CJdSFFV9mGhq2TOVwXZNFIPxFx6H7mT6Kozqj/TeuS
	/o7GpZRuV1hBKXBEtj24rUtVhIvJ6kjSJt+DIV+Cypc+tDzuPfn/nVcs9q6x3CaytfoQLK/f3wA
	3a/aLNAs4y9fsdvloc3eWp+BZg2o1Jgv4biblZWYFAPC07PhcYfAc+n5uJ6O+VrFUTiIvM3fwOO
	HOzZkUVRx9763NyLvD7ZfF64sby37QrD+MKxvnLcTqVKotYy3CI02zhnTXS/7Zt/C4llWMT/VCt
	kuLRqPvloFtWEazDEaX6N77Npbn6v3lcoxXaBgTZ+jyfDyJecgh03y+q/MjbDG4YY3xy/F83pvP
	8LASz7f+h8wbk1inoIvMNAQLQE=
X-Received: by 2002:a05:600c:a4c:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-4888356844bmr112987195e9.3.1775107335017;
        Wed, 01 Apr 2026 22:22:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/15] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Thu,  2 Apr 2026 07:21:25 +0200
Message-ID: <769923b619fca84c4dce0bc18116d5e0970ba429.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234480

From: Paul Barker <paul@pbarker.dev>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 9a5105ffd74..b9323432b8d 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

