Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBB9C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:51 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.15680.1753436064255326620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 02:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNH2Qozx;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: nmjain23@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3de252f75d7so16138205ab.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753436063; x=1754040863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdKn/5V+0AlQnLSpLKTvuMnMwJN/tciYVojwWwmg9NI=;
        b=JNH2QozxgWLkm+q3BPu36Bo/2lgPaX3ECgunWvP2QyT7HeJTg3G9Qz7rMqK41Nfzch
         UEu1AvfYQCFKf1EjX8Nw+QHcc/nIwmdR7W5wV547+low1ZPK0JCVymZhpxVlOt3/7nHw
         YBHmiWYeK/pBI3txw/pkRuHb7MaFdBV7UMO1wGv5gXTLP2prbvFbKQe5nOSbsf/9zPQE
         heRKQu7ejWsFGuIUq0qScT4tCJ1D5yBiIgpVv5YVj7CQOClnwEe1rcFiLibeLsZnPnT2
         I3EpwVavI/PDIvs5UtVvHVwm7Wm211FP6GjFSUbMfjraNuPHVUjJYy2SbU0UDisBaZd+
         f2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436063; x=1754040863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdKn/5V+0AlQnLSpLKTvuMnMwJN/tciYVojwWwmg9NI=;
        b=BmPD9aowpSHfKXW7VHdOHEWBnG/39ce39jRzqS4jLaoBeABU8cUvjg3aONHEcrPwL2
         BXVv6FE6gRUBfoA8qeXpUhrwmyGqT5SjqbuX/D74dX3IAQA9rub5PC4UuBgt00fR3ZML
         CIlHfG2FZtNxyOopReAwV0oTDR8q5x1YCpZXIZDgiP80/8DTmmqkWTTVh/rGyNAmBqzi
         yksO0Dfxj2Di3JTmjda//cx6UuC2TlFz65MCAMM5i074Dp4dexZ4VWVpp5cebUCy9M47
         mVR97wz6KGMk7eFUKJ2jrbNeOJp+grWaKb8E2WqClCJjT07KmzMmOhl9zmG8GS4oMQnz
         CebA==
X-Gm-Message-State: AOJu0YzSUwioJSR7ipqYrVgjXIGuEWd1gJD13HK5hD3Pl+fUSqcWSc2Z
	Yt73R4Hvkkss2/WashlDjKaKlm8ddxkvcK/fYXkVO+nsH+bX4rRyoPPza95uudRCA80=
X-Gm-Gg: ASbGnctspZVnurD2sO3OidgjX9UzV7eEYFZdblTvjDokBIzFNtTEwZ4RxM9SJFV6dAu
	Owf05DACDEJNbiCvLKNaWJezE7hHTfpvwdxqvTtdL/eVXC2BREb9F+lwU/Q9TYDtp0MHCPTCgo/
	tkWlVQorJcPRqooNLm5v3vCpYwhaJGWNq1LucvJ4WkttPP/svPRB3lxq2V5xfpVdvhZ36Zr17Dw
	D2eYchljUUSUYgZCo3NDDfqAF5EgTjmfs06LeI6ydmT1xJj4zvjYsxKet4Zcv8FehgAubHjWNgi
	DYNNq282H3SKUIcDp9wyl2be6IdfD5YXINLmsEd4CsThcZDQpXrNO1TDwL95ThOdtLCskc86tJK
	AvKZoF3aITctzQLqVqHptBY/Yi+QPtn/ttWw/
X-Google-Smtp-Source: AGHT+IEpV1zAh/HctHHIB4e6K5onMfg37haWLII8MSXHOylcWxjFk9QlqMtnmcCZYn321w9X7/bFgA==
X-Received: by 2002:a17:902:ce86:b0:234:d7b2:2ac5 with SMTP id d9443c01a7336-23fb3047e00mr22256175ad.21.1753435617807;
        Fri, 25 Jul 2025 02:26:57 -0700 (PDT)
Received: from LL-3450L.kpit.com ([103.133.67.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm32746455ad.106.2025.07.25.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 02:26:57 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: akash.hadke@kpit.com
Subject: [OE-core][kirkstone][PATCH] tcpreplay: fix CVE-2023-43279
Date: Fri, 25 Jul 2025 14:56:32 +0530
Message-Id: <20250725092632.672324-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221071

From: Jiaying Song <jiaying.song.cn@windriver.com>

Null Pointer Dereference in mask_cidr6 component at cidr.c in Tcpreplay
4.4.4 allows attackers to crash the application via crafted tcprewrite
command.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43279

Upstream patches:
https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242448a0de94fb901d3560

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit ea99328a0685b577adf4175e4d674c560ce9a490)
Signed-off-by: Divyanshu Rathore <divyanshu.rathore@kpit.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-43279.patch  | 39 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
new file mode 100644
index 0000000000..45581268c0
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
@@ -0,0 +1,39 @@
+From 3164a75f2660a5c3537feff9fd8751346cf5ca57 Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Sun, 21 Jan 2024 09:16:38 +0100
+Subject: [PATCH] add check for empty cidr
+
+This causes tcprewrite to exit with an error instead of crashing.
+
+Fixes: #824
+
+Upstream-Status: Backport
+CVE: CVE-2023-43279
+
+Reference to upstream patch:
+https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242448a0de94fb901d3560
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/common/cidr.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/cidr.c b/src/common/cidr.c
+index 687fd04..9afbfec 100644
+--- a/src/common/cidr.c
++++ b/src/common/cidr.c
+@@ -249,6 +249,10 @@ parse_cidr(tcpr_cidr_t **cidrdata, char *cidrin, char *delim)
+     char *network;
+     char *token = NULL;
+ 
++    if (cidrin == NULL) {
++        errx(-1, "%s", "Unable to parse empty CIDR");
++    }
++
+     mask_cidr6(&cidrin, delim);
+ 
+     /* first iteration of input using strtok */
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 32c978c1e0..8b41ba25a4 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
            file://CVE-2023-4256.patch \
+           file://CVE-2023-43279.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.34.1


