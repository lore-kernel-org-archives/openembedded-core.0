Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAA6C54EF1
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9354.1672830355694061789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kCKxOwjg;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j17so27212039wrr.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/mYLe5ou89W53LrPo67Yog+ndhwzvl+CfHqKgCUA0s=;
        b=kCKxOwjg4vzZKFnXX/qUAsPRKeL5tHM36M2fhuHBvUUxwyJ5CEZ3Ck4JvjRaV7zEYB
         2PBJEdfR9uX6lmFJp3hVOPSwT7NwpVnrQlpSfLnwRVPisByZ5e1CzHpOFNw281eDKkhc
         F89w73InaKddQe+fVOTM0lV22/TatMuaeBtai5Da54FaWqivBjKFF9+ak4NagCPLaaph
         AGrC0m9N6gl4zDtRsRq2+M/48zwgLoZ7faR6FZ+LWKsbYa7wQ4XkL/DNUSLTh+CJyQNH
         pFS0rNbsH/BJ2L2a9QD1fy6T6vriACLwsWVysNUnSf7OsGkinNHIdba6JKWOEjf+ky6J
         SZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/mYLe5ou89W53LrPo67Yog+ndhwzvl+CfHqKgCUA0s=;
        b=ij1KQ+flc6Czs/RgpvEuYnYqs+P6sW/A9RdaUdBxGfh8q1vig9VKJLeCTiQktnB2OD
         h5yKgrZREDck16plVjabdnFdPbBdpfcNA8wU4bhmPCMItTPDXnOvWzSn0bqXv7fdyBDK
         9bGhClgiEYjVzFJcd7/5FpIG1jBdbzgyJJpwFA01/Pd514SijJ86lbSR32dhsB3CCmWJ
         bBL8gYBeS+grCoJzcCFC/B+CLGFzsTW5BN/hXEI7tON4A/6Jmp1w206RAIMzcqTE4m4d
         +NqrrZzweMWCEjXNDPbrhxwuTIgFwQ5S94Lf4GGl3Msfg1BysTLpHd6S73Gx34oxaYei
         B5tg==
X-Gm-Message-State: AFqh2krtFCjaSOjS7uiZils5/Ze5UxnmEIuF0Ud/P5CcMwDFve/xYC7v
	gmA70GYTZRaaAfnS51zDl3K8FLVL+Q0=
X-Google-Smtp-Source: AMrXdXvFspcpSlQP1ZoxS8vZrqXps+tNyz4OvMhHD+qOk/xo8y8vKHGEdj8GGcGqqtkhczQmBXhiuA==
X-Received: by 2002:a05:6000:10d2:b0:299:4e2f:fca6 with SMTP id b18-20020a05600010d200b002994e2ffca6mr6151311wrx.58.1672830407695;
        Wed, 04 Jan 2023 03:06:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 72/77] libpcap: upgrade 1.10.1 -> 1.10.2
Date: Wed,  4 Jan 2023 12:05:43 +0100
Message-Id: <20230104110548.2537259-72-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175457

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpcap/{libpcap_1.10.1.bb => libpcap_1.10.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.1.bb => libpcap_1.10.2.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.2.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.2.bb
index dbe2fd8157..48c9bb09d3 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
+SRC_URI[sha256sum] = "db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.30.2


