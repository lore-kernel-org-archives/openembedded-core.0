Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5A7CDB479
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6019.1781960431538745218
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FtrSLksV;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eeba68948so2161799f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960430; x=1782565230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyfzkCrhG0G5N6N4Q9BO07Hb9YC10w7S78c7aMEVCjY=;
        b=FtrSLksV+WYFipnQ2BXBSZ6dIC3gugaTYCf40kPpmSXv1rUM3DwG06wX1P/DV6dc6x
         CjfytGjAv8tGilGlkFkmxrYc8AIKwg+ZiZt1GrG5euktYD12J7ttlXwUVe4Sufcfv5EL
         fN8gvhcv/hOoY/+Krxwnl6az+jfPTLxS8nEek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960430; x=1782565230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dyfzkCrhG0G5N6N4Q9BO07Hb9YC10w7S78c7aMEVCjY=;
        b=gFXwnfHm4rmVB/xrHd3wAi89pqMuEndE34ALmzFW0s8AMbLKMuFb26wb6TipPR6Vp3
         XeJSpw8r8/ZpsN/djYFqmxpPURrHAM54U63RHM9ba0GbjbT27huLsvZ9rCTxON9A4xEa
         tFx45vjEIw0a5dkQYxeqoDAVz4phK3Kz8JIbzBfkgPN7tNsb11tlm517Q0aroUA03aUx
         ahWgD3CKu810VMjjl1/sCcVfaZeK4aGo+R7+Bh5cCldhs7d6hivf2HgEXdJRKbciPvxe
         n46uP1/KTNmJj3tUoNWl8PkFlu2ilPg53noih77lrgyTr+nt7mu03egAVDjdIbC76diX
         Of3A==
X-Gm-Message-State: AOJu0YxQGH5NipLci+R6bbLdiBiSm2S9xVR6Hw5au9+VlRFI4gtwPrq/
	bNy/Vl926CibPxXcUfh3z97CrbkjNC3kf1JT841zEgvtgMrAx4cNQFHDXmZE2+cp5XWmiOvrVRb
	3xYqH
X-Gm-Gg: AfdE7ckKDihDVZIToI3kZ6qZ9RXO/ziCf8S4+PtEddR1E1rmbmoZBzfYt7V3v+OUtj2
	Wn6PnmZEjQO2hnyD/P+dmFkTtYOULR0MR9pCt3z7rEAqQBB6bZLNap9glfTTyCdwvQDmvK4k0u6
	lyV6HZFq5jFMvX5T5dMfurwasaCwmGNwbdOqnSA6HpHozwdLcuDIr3UyV/Z1pgLuHzvha5aIt7i
	wM7/r2E3Gfe/oyhaHdiMd4qJrwT+76DLTbwBQDD1CLKi3Y/kzHU94E+tsrFIxROZiw+Bba9QrsP
	LlHN0UZYoE79n7CGbp6K/5FgsaWDUG8cRS0h+5HxRJyAzcXVYOhwQl3iodSvINYD5ca77gqyfA9
	w7kYjdGV72ukK/TQE3X8dgEXYlsDi1mjUBruKM9odIHO9VzXUcSuMo4U3jWs8bEmje+cNfBB4vC
	FdR2k3ttCpTxKZmMKPdQDQrW1NQkXVXagSbr0ohK8IpQcRwTF6mQLOLvf9SpESsjJxvdalDNcc5
	hLAIL7+9dGLxBvU
X-Received: by 2002:adf:e44c:0:b0:45e:d3d4:c230 with SMTP id ffacd0b85a97d-465090c5701mr9877757f8f.38.1781960429722;
        Sat, 20 Jun 2026 06:00:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/36] dropbear: Clarify LICENSE and drop PD
Date: Sat, 20 Jun 2026 14:59:45 +0200
Message-ID: <84e260ffe34f25321d13bd802c549f20ce3ad2d8.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239240

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The "public-domain" code has a MIT license header so we can remove
that from LICENSE (MIT is already listed).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c36b5550511726dd86bcd37de84a3aea7acfc27)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dropbear/dropbear_2025.89.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index 957a0901fb0..ece065265ff 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -5,7 +5,8 @@ SECTION = "console/network"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
-LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
+# The 'public-domain' file is headered as MIT
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
 
 DEPENDS = "zlib virtual/crypt"

