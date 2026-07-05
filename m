Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F44C44501
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139224.1783291384456558335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=00L/H55K;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4720d22c94aso2344606f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291383; x=1783896183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0vCyba4bw8aYuL7a8WtV+9/yVQjfLRIvF+7xbMVBsrI=;
        b=00L/H55KOKpNnadbBkzlcB2D1vpwRW9C+E1ztrbiAMIAtj/HN5XLcefyxDBPOuqrQb
         MsSB0XrJTY6MwRLOYgWa2AZP5iMxQU8reuIIChQcPvFLr2hOfqJT8Ll3mPmESAfGmA1k
         TkRlidM7GPpETNVCW+BaDncp7Jzt+oV/b/dJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291383; x=1783896183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0vCyba4bw8aYuL7a8WtV+9/yVQjfLRIvF+7xbMVBsrI=;
        b=jeb9rBw3rW8Tk6Yk/V8ULdxU/kOYU6aWov+N/uCkm2X2LbYeEg21H0l6xtd1lAMqf/
         SOY31x8TgDHlrLKvLMiTKZKBQ+SAXnFY5WIthS+etcIH806ZRNdt0JGFP9M1DXDdrJur
         Ry+5JR35+/DEkrGTpPCn+mAKB7AZUEEi5MeXnYfkXKBJ8NFVbBa9taTNonV2xkAnidnk
         ZDDGTY6iQTUYPxbEEbWWSaoXJ4h8ZNuYNMjGgWjPlXiA4ovNUfGHZ3Zsaud4Oyv4dlEP
         mbcHme3R7EsjU6mgxpaGZ65FMfnFpegjBJ7AdNcZQTPCds5q+Zfb7olFJBoyRqPbLiR6
         Ho/Q==
X-Gm-Message-State: AOJu0YzrW1vcbyLG2bbucGADwVrHD8cPiawTHCG25+9Yvr6OF7GHsWBX
	dWeKQB6ly5AmnzssTkuv62Z3zZtcq63gyiYdpaEmosg5eXyttD9ldxz0tV8PUZ0fo+YbX20etwc
	Gktcv0Cg=
X-Gm-Gg: AfdE7ckKrBgYDhoLE0i7pMnGoIrIaIb0i4nsjhE8hgsdZTKAVi8RXYWr8emlkeqlpyA
	C559Q990imf5HgIyexzfHnYylpm22yUm+mORTPolyLu3zoOGYGekgxXXX/0JdNekk2z6Js9JzbG
	YPe7cwFcdjb3RjGG6QrAgJBJaDlfCrCtwfzaJMinKFopcl+TWRcqqf1nVONycGRFhDSpX/Wik/T
	rshzb+AiuQJnZxzwQ8Zzx0xFlzMSYDVYjiuupONp53TtHjdJAugJWlPcOMdXnmy302J07o328yY
	a9pspYnlxcitIDStGL4QPFQpXBizaKzRBwLhxqjBgERTWBE4ktO7APdebmOKkeIuuFuyohoAfCI
	EkgrlHFC+i57LDPvGvIMndYEU6Y1FeFFVH8XxEY97RRcoz3ouUBPX8frv1R1ocR4VMfXXPP1OvY
	wefTOxJ6oi7d5dgYXfwMXQLX+Lcg==
X-Received: by 2002:a05:6000:1863:b0:473:1ccc:15be with SMTP id ffacd0b85a97d-47aac6d94demr9699953f8f.39.1783291382708;
        Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/55] sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers
Date: Mon,  6 Jul 2026 00:41:24 +0200
Message-ID: <c1009a291bb4e2e5efdd3a88c512b48ac30b39cc.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240188

From: Nate Kent <nathan@otiv.ai>

[YOCTO #16321]

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Signed-off-by: Nate Kent <nathan@otiv.ai>
Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76231f202a437be221c2580d4fa0fc100c453e92)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 7dfa0cef6c2..489c0db09df 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -37,7 +37,7 @@ do_install:append () {
 		install -D -m 644 ${UNPACKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 

