Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D64CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:39:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132725.1781537989791134756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BUqlsvzN;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so18665795e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781537988; x=1782142788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cOmxyXdJAamiwPA+lti9oWIuzDN3d2X1tJxE9TH40Q=;
        b=BUqlsvzNlBRo+lJPGkE811QDCJsTZ+jxaGv6Aa5BAFIRCwBbNjjS/sMyPxP3+GLdM5
         a9rsrr2a7J32GZWAEBP6IrDf8aTyaXKuOB9kq8N91maBd/4cglUs3yT1hR8eIpYinUAP
         gFukKuO+GYYn6jfxTJYZTXD3w667637yuerZao4eWq1nJu1pf5Vdgvwp+051vCtaWSX6
         iIt3zo8DsP8BnM/70TQ+fAai/ONXEAHCiAhV38FITz2v11n0XPbmdT3+qxCyFQiadb+7
         07pB7xS+BVDfEWKWmrB6Zfzwy6c3nNrc67EpwnOLK3vw8KtL/ltquD7491Duc1wVDXQ8
         /zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537988; x=1782142788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cOmxyXdJAamiwPA+lti9oWIuzDN3d2X1tJxE9TH40Q=;
        b=QsVZYnPoy46TLYhemL3J7DEYtNKOifcjrDqkbzeW8VdG91dhVEaKIKHLigI042GZQK
         dWu6uImHSe2pCp4/JizWnNCtMmXdP22I/R6z7ErrTqQb/bzOtU6bGpm5pTU3DeyxXowi
         2I9GG53mtIir8k5ByHNzuOb1MJh54ZjCJmgLzoXx0QHn8cY7uO58kpeWhjnPv47qF6FZ
         ClYjU1f3MlBUTJW9OLoDgh8/BeF41wgdepjQatJUNvApqk+OOMOHAkTRVS6y/oZEbSFP
         GpvAt/SyW0Gm0mKi5rN/JYbnvpLCbgvudhstyxx7JR/iTvkoN6St1pBSUMA8y9jMeaGH
         ksUw==
X-Gm-Message-State: AOJu0Yz2Kk94yZlOYkTZSGREN9o8NmsXwrFmmgM6U1QxtFceQDKADNym
	FYBpvnfnCiIE643fNMHlew5ZX1scbapxTCJRhKnwvmSNS7rKR3OUfXNB+9G2Sg==
X-Gm-Gg: Acq92OH+O8yCox24Vrd/PlTwoQbNI03qEwpYgqWrb3mQDrJAbpZaiji7zjNzeJUY4C0
	+YJpudIdjnBPnqvYL1QewqyceksfyQ/IKgDcjcff8l05xvtGkm2H1Kl6DWMUTJjMh0gAGHHcrjR
	UUmTEzxLFsNoxUODcBtiDb0FJeu/1Ub/Czd15zPAqZ5rUDY7d3Y3ex6YRuJMA7wqz6f/rUNbVGI
	SMSbx8qukd4iBCx3bP1tmSXoweBrTdxx5hx7lJJi1ZCqyIGta3vVzy7+h/Y5tBP28qQ0qlSiD4V
	paM0J6elzN2z/zQqgNY474xqFHS+/tsM6tTieq/2g4qdwbilQrx1OTTMYSBHuaZuuLjkms2y3rj
	Kb4Wvrhd+r5GExy4em2HJviojX7rNqe8/owdCvoG38CCxShDfiGMRj6qR7c+xsZuNGidorhHrFX
	37mq6BNqN5+eOydqpZSn0ISjSi8ngOmB7iiV7/wOur9qneQMIi3RtUgw==
X-Received: by 2002:a05:600d:8444:10b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-4922005e01fmr105340255e9.6.1781537987725;
        Mon, 15 Jun 2026 08:39:47 -0700 (PDT)
Received: from FDIACONESCU-3TG.lenovo.com ([92.87.113.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa50c26sm1241765e9.7.2026.06.15.08.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:39:47 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [PATCH] scripts/rpm2cpio.sh: Use 'xz -dc' instead of xzcat
Date: Mon, 15 Jun 2026 18:39:44 +0300
Message-Id: <20260615153944.112726-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 15:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238856

rpm2cpio.sh calls xzcat to decompress,and xzcat is equivalent to:
xz --decompress --stdout (-d and -c, in short)

Since commit d1930f8, it is assumed that xz is provided, but 'xzcat'
used in rpm2cpio.sh is not listed in HOSTTOOLS. With it being only a
symlink, and with commit eb3ec74 replacing bzip2 with bunzip2 in a
similar way, this fixes the bin_package class for rpm without adding
xzcat to HOSTTOOLS.

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 scripts/rpm2cpio.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 8199b43784..9343f70ea3 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -58,7 +58,7 @@ hdrsize=$rsize
 case "$(_dd $offset bs=2 count=1 | tr -d '\0')" in
 	"$(printf '\102\132')") _dd $offset | bunzip2 ;; # '\x42\x5a'
 	"$(printf '\037\213')") _dd $offset | gunzip  ;; # '\x1f\x8b'
-	"$(printf '\375\067')") _dd $offset | xzcat   ;; # '\xfd\x37'
+	"$(printf '\375\067')") _dd $offset | xz -dc  ;; # '\xfd\x37'
 	"$(printf '\135')") _dd $offset | unlzma      ;; # '\x5d\x00'
 	"$(printf '\050\265')") _dd $offset | unzstd  ;; # '\x28\xb5'
 	*) fatal "Unrecognized payload compression format in rpm file: $pkg" ;;

