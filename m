Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77069C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9126.1635325667331622508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V6+DbaK+;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v17so2849386wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OrJ8Ckvn/wsaYtCtznRbsa2zY6rybd/FwaHYR4XGbTE=;
        b=V6+DbaK+Xdu07tQk8OtCiQGj/zthT0Aj0kIrWbY+fs14m4RIxtJiSWL5rGWwG01QqG
         Y8SpP4wB/YcPSL5xXwlKdG9Ce+gB5BkDQ+KhbcDz8pHlPp30avV/0WvW2gnLLYWahF7U
         7qpvFpgjsplaVSchFZ4x3MA+64wvYmpPMWPt1xBy68sP4CvlRQGquybPzQA1eoVp078C
         IxhB8EvvgjJnBYv2mwxQEUBnJQdPypjEiuLAZ/XA1fFV29rh07zDM2f73sf7omKCeHAW
         iRvOFyLV6dtTF+/0fFfv6AUd3usaRXwDlhVK+3gwN+BK31e73se1r1jpw3D28UEobrvu
         62Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OrJ8Ckvn/wsaYtCtznRbsa2zY6rybd/FwaHYR4XGbTE=;
        b=Zxm4UmiFU2C1uovCMBgwri0EGKrn6d6uSo3iWV4hSsnQ03i50SrFMK0rXcWv0A4OYq
         jk1njVRGo9Hr4Mc5fo7o6iDmVRrtC+uCQxhDLMEPkSU48dyFWi0DczWDImx0vqGUuiD2
         Jd/ZQWKtHK9GV3AZfVym3R6lq/64M4dAAFAuXBRsP9B0UyXQsii0N2Ip9aFHJ10jRYz5
         anhPnGhIX5ozkcky5oFvkMdLjW0FaRYrO32Ibx8SSaK4zsY0cHSxXPoX5/xxba5vSTSn
         7ZRPZCKyEi7zctm9RkaxLbM6F2SFMSHtnWsVQmlcqaosG6239lC2oy39jgsUfboDCj5c
         6MMQ==
X-Gm-Message-State: AOAM531NOQtQHnDGo8URe8m8cHn9mXmP5H+4Z8EGoNyTRlCm9WP2Qvdv
	lUMq6EiUUGhznBJGXb1RwIM0BZR0CEg=
X-Google-Smtp-Source: 
 ABdhPJwY7UoRwfGvpGVdTUNva1wU7smunGP//kRMTxw8JWPbzwKQRdNwdNi4vTSDsrCnrhG7jYbBcw==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr38534569wrs.46.1635325665974;
        Wed, 27 Oct 2021 02:07:45 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/30] mpg123: upgrade 1.29.0 -> 1.29.2
Date: Wed, 27 Oct 2021 11:07:18 +0200
Message-Id: <20211027090736.2546759-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157488

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mpg123/{mpg123_1.29.0.bb => mpg123_1.29.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.29.0.bb => mpg123_1.29.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.29.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.29.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.29.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.29.2.bb
index 0f4a36e0d3..ba09e1c619 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.29.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.29.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "135e0172dfb6c7937a81f1188c27f9a47b0a337f7637680039ff3ee5fea3ce7d"
+SRC_URI[sha256sum] = "9071214ebdfc1b6ed0c0a85d530010bbb8ebc044cfe5ae5930e83f7e6b7937e6"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.20.1


