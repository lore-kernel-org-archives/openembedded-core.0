Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C163DC00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:22 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.44445.1660841835053447613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=f5vN3rM9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id x19so2003290plc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=HD4qi2Ri58BxZuJ+VT+kA1DfmjjzIytELRU0MzgO2lc=;
        b=f5vN3rM9lL4Sm0Cg10fFhxLKPXXO1F0WR82HYp/O0ulLQJOnLYZeOwGGMag9jJI8Zz
         FxhEvM00vR8To7JYe5kwX3fQ2r8RVzcPVNvKnQWuUkAPI7d7WnEeOZhaokC11kDp0m8k
         BbmbdhvSgyb7bE3V/ZKkIas+d4uG/AbOvj5UrqoOjAaZYWSXvPXUWujRdJ4KQR5UaofF
         LkOomDeIc7OYTpxzJ5uTsSIdFjbdS6kx4pGQfd1+OoOFaL6mbRUj6qJMjwjfg15KOajz
         fm5G6ob7LWR3+CU/GiHThPb7Ww/iHEZit3IpVr1tmt3ccwSGZ4iip9/h/EG8Fhrr/gEn
         VyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=HD4qi2Ri58BxZuJ+VT+kA1DfmjjzIytELRU0MzgO2lc=;
        b=MNKjQfN1GZPZQ++I3PU0wMcQGRtOyK5F7bJd/2P+Oh1KJ4JSyIPNS8p5KdIa3Bfnqs
         M2EH2G4qWXaTBZ3sNcqZffb4VUW3AWXKkMwHFlTJ1uWUFsOCAzNujYIdq6XvW8azTmeP
         7Q8UWVCOB3aNsQjL4WjmrtGpW5AKLOTS+rm7JM8vY3E25rnAtSbGcPJIetw4t+vL2sot
         Gh6/vGhm1315v08SKyMLgj6fbNGnypRiEpfMyk4x5qwP/AcTFEhAHN/UmFBfIQ4GwwP2
         K/32IxKVGdqrVa3Nk9BrRh7Cj39D3tWKOqRldhBLDtv30k1h4WgD5mO//yeFOaVkODSy
         p4LA==
X-Gm-Message-State: ACgBeo0BIchuRMAxd5qYkeugy5Y3GCx5XbniMjTEdSvfzxGFoXoF7kuk
	b1LMeaBgG/2Kmks99/WIO3/XYSayuJBLyeAp
X-Google-Smtp-Source: 
 AA6agR5NZ5VTJ8Gf/ModdccoHRA0V+PWvtjtRnSgYLlGyRbgLC2c3tYSR3mD8uA5940JSZUIAfUEGA==
X-Received: by 2002:a17:902:c411:b0:170:91ff:884b with SMTP id
 k17-20020a170902c41100b0017091ff884bmr3377180plk.58.1660841834122;
        Thu, 18 Aug 2022 09:57:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:57:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] initscripts: run umountnfs as a KILL script
Date: Thu, 18 Aug 2022 06:56:28 -1000
Message-Id: 
 <60e3c877fa507f21885c5ef13f493ccb26e5d63b.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169533

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
index f98e42eb2e..cb5417cc39 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -129,7 +129,7 @@ do_install () {
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


