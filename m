Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2D6C46467
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 21:16:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.57035.1669410965357560370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 13:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jNH6Ii/Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id h11so1178308wrw.13
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP5rtKL9MTfoUY6ICGzRHu1UK8N7V2rEVsy9SYy4btU=;
        b=jNH6Ii/ZafcQLml8NsnXnqWOP2PIdgafBfYq9flcrfhXTuMUdYIbgnsn5jo2nffs4l
         5Af9fVkLdELLb8XCN/vumeB2BVYiJ6I+TD55u735YWqAE7DQsOHe1AMkSz3OCC8jUSVE
         qjl1QjlqTSmDNrsr7ydb9xAhlqyUg7EPN1XoHJ6FLFmFipPEv4m88Ts3Hd+cqaVPUT1H
         bIAN1Di6jjGl2RNe+Vtxi6vZKyLh1w/HWuc61h48NiV882oHV6h+o7jeJryjVDWTL0PR
         WIYF8P+EJqB/2QIYKTUTIi1ELrdOOEmLR3rx61wmqmLAPT5UHLU4sVlRiNFt6upYlCj/
         UY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP5rtKL9MTfoUY6ICGzRHu1UK8N7V2rEVsy9SYy4btU=;
        b=iDe+nngX0ZwQlNPRFoU3h1fjlrUJQmqWIoU/9kPKn/QqyydXNJ9t/2Dtvlp5j5LdGE
         d+FywTtGNMLZ6wy9LUxuREWe5brXz8eaSl5NW1enPpKvxBmaYQRmF7HbVTYYD93rxzxR
         2Cx8W+tN4CnbymWVXZspRy3z1tVwQMWDeh8CW61jErccQvxOLYeIj79UedqO9IMBInO4
         Pmbri0w7Pu+8iEiKCwwewPtnXSHOskZ3rw26NoeE2Fven/+794r+ha0Iqk05e8zWPZ2P
         BzhHOdYbZ8SAMkA/YnPl1DPRHGn+aBUqaOJGFtnZud0iAetkI0yH0nzr58gS/Ta/uGVM
         VMMQ==
X-Gm-Message-State: ANoB5pmeY+9TneVzKMW61CafqUb7XJymtI5V9TVQcvQYnBMfJYpGyaSa
	NHsmpjukTZWFyrshkPhD+Frs0Dql0gY=
X-Google-Smtp-Source: AA0mqf4Q/g3+LxhtSuORMzO442TtjHp4NII5j61al3QiVgQ05GwENx+UO+u0ivohrv/BKj1hDhTbcw==
X-Received: by 2002:a5d:6349:0:b0:242:c01:71ed with SMTP id b9-20020a5d6349000000b002420c0171edmr583565wrw.54.1669410963620;
        Fri, 25 Nov 2022 13:16:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c5441000000b003b4cba4ef71sm10068863wmi.41.2022.11.25.13.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 13:16:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] runqemu: do not hardcode the ip address of the nfs server when using tap
Date: Fri, 25 Nov 2022 22:15:57 +0100
Message-Id: <20221125211558.20985-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125211558.20985-1-alex@linutronix.de>
References: <20221125211558.20985-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 21:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173786

Rather, set it similarly to the overall network config.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7bd9465593..04728673de 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -999,7 +999,7 @@ class BaseConfig(object):
             if self.slirp_enabled:
                 self.nfs_server = '10.0.2.2'
             else:
-                self.nfs_server = '192.168.7.1'
+                self.nfs_server = '192.168.7.@GATEWAY@'
 
         # Figure out a new nfs_instance to allow multiple qemus running.
         ps = subprocess.check_output(("ps", "auxww")).decode('utf-8')
@@ -1187,6 +1187,7 @@ class BaseConfig(object):
         netconf = " " + self.cmdline_ip_tap
         netconf = netconf.replace('@CLIENT@', str(client))
         netconf = netconf.replace('@GATEWAY@', str(gateway))
+        self.nfs_server = self.nfs_server.replace('@GATEWAY@', str(gateway))
         logger.info("Network configuration:%s", netconf)
         self.kernel_cmdline_script += netconf
         mac = "%s%02x" % (self.mac_tap, client)
-- 
2.30.2


