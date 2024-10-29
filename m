Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D31D3A68E
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:34 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.1956.1730228433041934971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w2OY3PZO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so4658884a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228432; x=1730833232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDthNxrrcVZvXcTxLkP+/ELe0qNOmUuCvIwcqjPfwIY=;
        b=w2OY3PZOxnBMfo/QPfj9C/tNcEc4e4WCE4TaPozTyADI06KDvNtLjk/TkBNDI/84Vo
         MLeMdw+rMxluoGavOMxx4hpXXB3YNWfxHr9BIbilpLcy4qH9Tx5cptHoTYzgNaBba/Dd
         ELVEyPbpfsFwDHEP6SbflpJg05uyoRalrVfcX7SpaLDsVF3PQs/3fpPglZ+0mK3Yphjx
         gAODQvUKgbNjPhMVk2PAYg4m2cZ8rjSgb4C4knu06NuoxrKldXlLga3TZqUU45CNNTqc
         erYHgHCpe4Z1tXjvzWxDUxpynjtsvCtyiHukVi7DjKzhejJ89nXYpZNOEuMxVQCYGFym
         uUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228432; x=1730833232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDthNxrrcVZvXcTxLkP+/ELe0qNOmUuCvIwcqjPfwIY=;
        b=Hwv7vRWPpewNJwNtLcpQU/h9xmqL2y731KK4+L5GpIM/0KzWL+RNYnzsGxy8jNncur
         iTjTf5+4N82USuJUUHAtuDS+BTCPCNKuBUb8ch2AYbpXbhqqCF+2Y2tsh8+peNV7trzx
         mVLqo1ptWviBvh4GLsJPaJfLkhTEM4xn/dcsDWpOXZ1/ATxMkRY4XyoCIvAu3h+d5GFV
         iiACnBkO0SW76k8TBuu6U6OFbVTK/TA/3ZR1jkUlq2R1cYfC8MzoIhi2rf8AZVD9BDGs
         Pe4VsHiUNA4nWg5V9Cst222sa5tkvnC5ZAWibDuqkWiKuDrCL2pzbWoYW04GyQf40ryY
         pv1Q==
X-Gm-Message-State: AOJu0Yxqhi03tljZr3qK9N6fAKX1hXdzc6pbML7CvIT4PSW8p/AiGjTV
	NLaJUvikbVa6SFaW6/oNG8gQHwU87rV4KsctmyFy/J/c0Sin4VkncL0zbafs2d+IGD3ULaU+Z/f
	5
X-Google-Smtp-Source: AGHT+IGP24/DjF7W5NfGMw6k69CMhd0jGTe4nyFEp0xzo8sqR//JtyRlqiKu5gFHqAPoW+UpvwYbFw==
X-Received: by 2002:a05:6a20:c891:b0:1d9:2723:64a6 with SMTP id adf61e73a8af0-1d9a84016e1mr14275410637.21.1730228432027;
        Tue, 29 Oct 2024 12:00:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/19] cracklib: Modify patch to compile with GCC 14
Date: Tue, 29 Oct 2024 11:59:49 -0700
Message-Id: <7cca344feaa16cfabbaa2f34e4aab91cc1af39ee.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206526

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


