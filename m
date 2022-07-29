Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B71C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.61.1659106115863078957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CFSgBdbF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y141so4816191pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F2sXNOnsZ7XmR494ms/YwEO74Uch41QkQuj7U441s9s=;
        b=CFSgBdbFUF/n0aQId5GEw0lkiQdy2Dc2JZsMOkYsEMNCOBz4tbmXxqpZMVIs1tG+p/
         cnFWfGQd29O8fmnkJwT4E99ctXKVCKURfoT5+NdHkQzNzIraSGvnNMfwVl5QN8r9hZ9y
         bW8xHma74tT1dr/Z8ww8scqlbFFfEAwpzxdbhzO+3Vn1MFz3tJOlFH5p+n+MqpFyQfBK
         ngCZVPcapPDPRGpfEYr8I7RypxL5gVdtGLqxdqqtJOmmLmSAbFzwxztzucZhQ4B04BAH
         L6KInCCh6jxm8zKeBuNx9JcjRb+qMoaxR1SG82HfeoFurdUOzcSVpWoNo3e/Un9NQYUw
         GFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F2sXNOnsZ7XmR494ms/YwEO74Uch41QkQuj7U441s9s=;
        b=fz8pk64xeEklAGAcsyqEeQTtGmeOmft5G/C1NICGboE8ultt0H8sAVXMBkC50nzcXs
         B2RWRq4yFKnhfZ0YeYgL+qpzSQHvvsLz9YfoFzgEOrR8PeAQyXaTtlP/Pvhz3ITttRSD
         Brw5q3S216nj1MCZYnkt9Kh0E83g3nOsTIDweTMWGVRYCpC6/qwMELXzzCGtrekxXLiN
         ucy/fPSHy/1XpPvD5YQCC7UTP1uhqja0ROGCO2rLUCMnrengR5JH49BbvtPQvV0ugRI2
         TLm1mq8/kf4lju8XvjFp8zHlRYnrOPe2mJ1Mid0x+pq4B7LqrZDTNwYweTOsG5eUI4GB
         3rJg==
X-Gm-Message-State: AJIora+0hk38Le2TqXelRVlYP3jla8/4eJB3avOu8zvF99/KJUokEkpt
	ykZAyuQtitn3xoEuCFAjYMvEz0TuibWi+DEl
X-Google-Smtp-Source: 
 AGRyM1s0zY6gzUnFQAPFN2pYffGaU0cqzQtUoNnfPYjFkcNWCStwLxUzTIwOhuQWqwntlePTfK4R8g==
X-Received: by 2002:a65:6e41:0:b0:412:4c1f:9936 with SMTP id
 be1-20020a656e41000000b004124c1f9936mr3282333pgb.455.1659106114755;
        Fri, 29 Jul 2022 07:48:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/29] initscripts: run umountnfs as a KILL
 script
Date: Fri, 29 Jul 2022 04:46:45 -1000
Message-Id: 
 <3564ce3d9b2030dd420362c66147bd327090915c.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168664

From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>

`rc` runs all the KILL scripts in a runlevel before the START scripts.
The umountnfs script is currently configured as a START script, and
runs after the networking KILL script. During shutdown, this causes a
~3 minute timeout after networking is shutdown when the system tries
to connect to and unmount any mounted network shares.
Fix this by changing the script configuration to "stop" so that it can
run before networking is stopped and unmount any network shares
safely.

Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c419bd4537756e9f6c2fe6da3a9b798526e27eca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 2244d1b292..7c9d9ca4f1 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -130,7 +130,7 @@ do_install () {
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
 	update-rc.d -r ${D} sendsigs start 20 0 6 .
 	update-rc.d -r ${D} urandom start 38 S 0 6 .
-	update-rc.d -r ${D} umountnfs.sh start 31 0 1 6 .
+	update-rc.d -r ${D} umountnfs.sh stop 31 0 1 6 .
 	update-rc.d -r ${D} umountfs start 40 0 6 .
 	update-rc.d -r ${D} reboot start 90 6 .
 	update-rc.d -r ${D} halt start 90 0 .
-- 
2.25.1


