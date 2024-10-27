Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F381D1356D
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 15:47:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.31922.1730044045329455590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 08:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiG63pxA;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d49a7207cso2588709f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730044044; x=1730648844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YM6sYw/d8ouIgn1c2IOcscu4j+VdWk49XvrUNnavdPQ=;
        b=BiG63pxA2HQDwKbNKkMxBa7ieK/t6ZvaSSWUZKf5HAid6ZC7UCVUmMR5JcJKUOwQ+k
         pO0jkGRkxB8D1UaPUK0ZULZNHz4veaZxJ8d0vWHQjefQUE0ynrqHzoClOYk0Xolpi/HI
         TAb79pP99Ro7J/Xo7lemjLWo9/836VFQrx9r42n5xO22RRpwC5QQCewYlg5hv9E5rfgi
         VNYa1+54/HpbWpzn9MZJ/DW58NGAoR55ueoUSD9luxGF/tVrR5NJeumUTsFo7JQewwHd
         QJyjJP45OkY2S2wB5QooRRQ1us6U245yDD1vMMdUx1TYgEMY8D7Na+aCacT9s9xtdwj2
         y13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730044044; x=1730648844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM6sYw/d8ouIgn1c2IOcscu4j+VdWk49XvrUNnavdPQ=;
        b=EXLcBwgz6+Q85Mt5JaIawUVuHQooWbePhwXuICe9m4AMb8P036ty5afcwSrOHcMcgd
         Dbt/ooWpqbF7WoF48aFg3bLSRmKLjwslq44D01I8RZf4DbN06a0b6wg2fp57Q1oksJbx
         PTd7YikH4HUvkHeRuHc3oTJ9c8vzEPFngHXG96WNQHULnWtwZt4m9UKUQA/b0VzQ3KAv
         W4nTYn6YtED2AFi2AWmZpf/Z4bBN1XBBtB6Q5CT8PiU/VyG2Ufp2Mu25OgbW4/jAz5FJ
         yo+U+3FU/Uw6tkkGG42dLNx4J2XpBmlpVPJHYO4LZ49VfNjEZFggjNbhmJmF98ndlaBP
         dpQA==
X-Gm-Message-State: AOJu0Ywu8VIHN4PiarQLpT8tMeCSB8zOgtK4Pcex16JunZ/tmvNSCYCt
	zVU5Pjm6TNjt5x5VmnUMFhgtunlN4K/ob/zourgs6fEhGhxvGtBsMAg91w==
X-Google-Smtp-Source: AGHT+IE9jTK12dXb2fLIda1RZBXTwyd6Ckw8aJCHAYEZLp/fPQYUTw7LmlXWwpFnlcJsjOCwhtDTmA==
X-Received: by 2002:a5d:404d:0:b0:374:fa0a:773c with SMTP id ffacd0b85a97d-380611edab5mr4451636f8f.47.1730044043498;
        Sun, 27 Oct 2024 08:47:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c4a1sm7011506f8f.16.2024.10.27.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:47:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Zoltan Boszormenyi <zboszor@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] cracklib: Modify patch to compile with GCC 14
Date: Sun, 27 Oct 2024 16:47:20 +0100
Message-ID: <20241027154720.3930286-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 15:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206403

From: Zoltan Boszormenyi <zboszor@gmail.com>

GCC 14 implicitly turns a warning into a compiler error:

| ../../git/src/lib/packlib.c: In function ‘PWClose’:
| ../../git/src/lib/packlib.c:554:40: error: passing argument 1 of ‘HwmsHostToBigEndian’ from incompatible pointer type [-Wincompatible-pointer-types]
|   554 |             HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
|       |                                 ~~~~~~~^~~~~
|       |                                        |
|       |                                        uint32_t * {aka unsigned int *}
| ../../git/src/lib/packlib.c:142:27: note: expected ‘char *’ but argument is of type ‘uint32_t *’ {aka ‘unsigned int *’}
|   142 | HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
|       |                     ~~~~~~^~~~~

Add the cast to (char *) to silence it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-packlib.c-support-dictionary-byte-order-dependent.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 8fb512a224..cf7a0857e0 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -303,7 +303,7 @@ index 8acb7be..a9d8750 100644
 +	    PWDICT tmp_pwp;
 +
 +	    memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
-+	    HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
++	    HwmsHostToBigEndian((char *)tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
 +	    fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
  	}
      }
-- 
2.47.0


