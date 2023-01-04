Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D75DC54EBF
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9378.1672830369815591871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aIskgXh4;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bs20so30463321wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNvaiE0dXzxq4yaYY3hU0R/2/gNhRcRvv8PORG1wtxY=;
        b=aIskgXh4V09PMarXwQORUyvOpT43OvIqHrkFRgpTXmWUSx4S/RzGVVHBjUB0GRw51H
         M5SPaBPSzTF0EIJ/2fCTLirACLU0Uzt3mgaF9nA1OzraPZ9ZXHYxhgq3ob+V41p8xaXB
         Y7SYxb4s2BHMVclh9W37A2MMrXIus+xAwSayl2b1Mc88Pw+7gugij+d2BmfMGVD5W2Sx
         2wMqtV9iK58XCigdscal4ntJ4khkEFxfDWqKjy1vp+dHlrc34O1qkxim3/gkKDg4WCxw
         aY53iC0uuc7lPDlqKtjYFERUc8ELZ1GnF1z7c8ngYZZJMJu3X//sSSm8MxDm2YfiEdUi
         SD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNvaiE0dXzxq4yaYY3hU0R/2/gNhRcRvv8PORG1wtxY=;
        b=B4nr7AGG+HRXbHdUv2GR1x9MaAzrz4FVUIE2NYHc/w0PIBMkcMbgAeHZ8yTb2/LGXK
         vNvHZ2LEqoSmO6d3xa6Q5ZVKRo/hGUm6mIU96WJ6BaEh/GbiLkf97+RI/gZwMSFV6M3O
         1TS1Hnm2JXQsNvIqWP9zEMCMkqO7/YhbJylZEUjRc6fAxrSnGP19CQ4ahpiRUXCb4NjX
         IS1NkjAq9n5bm+hz4jKGaIVLy5Nd75bc1YmdGkdfmLbYK9fnwbZHpeYiV+zHoPC3NN5B
         w/M1BaXpHKGmLTIxDlFRrWc2KGvyIgIofqXb3yHhaR1YHofQ+iEFdNnWG/wXJfUHCGkN
         Gy2A==
X-Gm-Message-State: AFqh2kpoN5H4r3MTRAL5rsIFlOYp/JXFeSNyaQDkNjyKvT5t+YOVmK+4
	bLL7cG0LNWYG/ZSulsZIKub00XvTJhM=
X-Google-Smtp-Source: AMrXdXvYajMLxpKFRyLV6D18bOyQS2ZHPNtBXkvhlFkdE8ixl9wItp9CHw6tFn9cgSQVVxQ5hVsb3g==
X-Received: by 2002:adf:cd8c:0:b0:271:dd0c:866b with SMTP id q12-20020adfcd8c000000b00271dd0c866bmr25210324wrj.1.1672830368245;
        Wed, 04 Jan 2023 03:06:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/77] linux-firmware: upgrade 20221109 -> 20221214
Date: Wed,  4 Jan 2023 12:04:51 +0100
Message-Id: <20230104110548.2537259-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175406

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{linux-firmware_20221109.bb => linux-firmware_20221214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
index b05b960ebd..c2354e627f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
+WHENCE_CHKSUM  = "bf7c716d16e48fe118c6209f99b13253"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
+SRC_URI[sha256sum] = "e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331"
 
 inherit allarch
 
-- 
2.30.2


