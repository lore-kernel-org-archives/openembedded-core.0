Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E209C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:24 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.9709.1718288480803674833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bbrUYkHq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f4c7b022f8so10533165ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288480; x=1718893280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsZUMYsc7m9agNqU2ydlndrHCNunRwE0xlEdqtF35Zo=;
        b=bbrUYkHq/ShRQ+ABhLiKZlKIFpNAJk5D1jymWZATK5I9ZairmPXA0ZkWNqh9gs0qlu
         H/bUU6WipdvEw1j/k70pSqr2EBoqhGFafEj01scRcT7XsPvttDWZhJthcd7lz5OQ8+kQ
         U3K4st9Dw2uGpFiJVo55SifPfnD6zSXq3jzdaaEhi1vf3J4EWNit1ckiwmjqCnmExclI
         m9uobWh/CUT3JDuOI9jeLfywDXpV5z69FRG1JS1EU0TvMjVoyDydpMoAgzfaFbc5MYXA
         0NemHewynC6MTmaex+eX8Xo3S+HCs9bLvhDgZWQMdtGlox7oetp132b05pDQmR7SkyUq
         hOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288480; x=1718893280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsZUMYsc7m9agNqU2ydlndrHCNunRwE0xlEdqtF35Zo=;
        b=GK59RUq1VE2/HwiDCLxYpebEUcEiXLcKUThHX1A5gvf/Jqzx5BzSFcaJVkV/bq2Yp2
         93C4HcEtbnHvsVcwJhXSWHzjFcQ1VmzGTYwmAqj3aPqk7Wu6wlZJquH5zlphBOBOoR+a
         /Y/nW7ctMIbUgTndX4azjsN/aTN1bsFkRezLY84muwu4xQ6duOA7SSqcbie8uBaWV9Yy
         6WxY8m2rOyjnjJgh4wyq3LPGHjo+f8decZ1b1BQpfXYHz126mqtWSRDyP+ha5JV8aodh
         A+qmDM+4vbHr8NHaJeH3twbmGt5CYQn5DsjOpsn93aFUhUgurFKqIHUdpqU70AMHRU2k
         v8ag==
X-Gm-Message-State: AOJu0YzimMRE3YeVs1QlrHmBt09fM87pd93G2EVkTnosyjo0s383tTGW
	/snMVBYyI+p42DI58SlgrslJMNY62x3paHGBShL2ge+K2WSht1Ze8khKSMsEuKj8sE+XhOPCDr3
	/
X-Google-Smtp-Source: AGHT+IH4SnsGJ8tAyQUiNLfs8AeExouTor9HUp6sXVPx9w6Hwf0CRkuZAwyXgqfbv8sGIhO5C2Z+Zg==
X-Received: by 2002:a17:902:c401:b0:1f3:2b46:47c9 with SMTP id d9443c01a7336-1f83b609b25mr50765065ad.28.1718288480029;
        Thu, 13 Jun 2024 07:21:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/29] cracklib: Modify patch to compile with GCC 14
Date: Thu, 13 Jun 2024 07:20:34 -0700
Message-Id: <50b9126cd8668d8c039e9bd61eaba458f7a22014.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200632

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
(cherry picked from commit 914128f6bd988cde278e087fb9457a0c70c7e5ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-packlib.c-support-dictionary-byte-order-dependent.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 20572b55c4..35229ae890 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -303,7 +303,7 @@ index 9396e1d..d0bb181 100644
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


