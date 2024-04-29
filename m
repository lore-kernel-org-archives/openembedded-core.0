Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFB5C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 10:30:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17262.1714386624669814154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 03:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdB0pzrr;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41c011bb920so6401065e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714386622; x=1714991422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4yT6Bm/qviUZ3R2jDkzNZAHEqkbDDpXtwLZattB9H8=;
        b=HdB0pzrrOQKFwU9iawJh+wMAFo3l3kN6bU2UE0zJ5x8hWJu7ZjZhKxVLlKfeENTms/
         ri+lqn4BStKfS20n+rlvQY+ORlgZ1nmuHJbU5byfaBB33fvwAfzQc0qhfUZUPP2pbubF
         FgbifsZQQAQrHQ4m+x1iHAj6t2dR33JOaFA3nMpsb2FU+pG7S24eKkKPnmQJDwes55c7
         7ZgtS1soQiaAxirEEcWthFpuuj8KDJOPTRJvMJvtXi2aRmNhBE68+OufrRm1nb9lN/rP
         LUVJeexIZ9WUxElXt2YE1whLYjPNOi9inqxdUtGZzPOO5DmH+6fAPnuoXzbcf7EQwSZb
         oDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714386622; x=1714991422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4yT6Bm/qviUZ3R2jDkzNZAHEqkbDDpXtwLZattB9H8=;
        b=S4EutyvVveBYYq9099TNvqQfbNRRDeAQ3rpGhCOvzmSm3HIcWnq/VbZKjT307glwWb
         6iYnW4PQqjiCpwY9i1t+ujD3XAprJAjBGuJ9G4ijvuyXsCuMQTdGhEX7SIJuiTkImOnx
         QYl6eXOwfegCnbsQNEyt6wENC/r5EPeNPuV3WGsmhTnb0VvGFwakVhLfPf++ooIJexDb
         leQE+cq5VRCo2cFO7/NzQiPOCbxneREFpJB5QdFa3nSXUXGvwc5LJ2b7NWT/19DM1d5r
         92ElnmiHKZ5CHvF3eZx4foPqNu2m7457MVG9wQWXg+cAcf8Mfxa8WSPYwdmJXYxIkRzQ
         9jjg==
X-Gm-Message-State: AOJu0Yzc/i3JJ4oKfAsAVJalEhN38qAxtKJ4sm8Wwod8/XiJIz+zmXat
	+/1qh3YZaa7RpJsC9aV8uCVKdxqJ4WSwOsscEB0iCcPgsS+Z/V3NuAMOL6Oy
X-Google-Smtp-Source: AGHT+IGoi+TrrbflswktUVZ4+VTdWdA9llUhQ3okgHYPt6rpjlru9u42185y4epHgilhRssZDAXDLg==
X-Received: by 2002:a05:600c:4f15:b0:418:d3f4:677b with SMTP id l21-20020a05600c4f1500b00418d3f4677bmr8346671wmq.17.1714386622235;
        Mon, 29 Apr 2024 03:30:22 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c468600b00418accde252sm41242144wmo.30.2024.04.29.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:30:22 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] cracklib: Modify patch to compile with GCC 14
Date: Mon, 29 Apr 2024 12:29:59 +0200
Message-ID: <20240429102959.3493324-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 10:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198734

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
2.44.0


