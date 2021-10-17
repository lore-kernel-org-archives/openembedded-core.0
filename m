Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA94C433FE
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 08:09:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.20626.1634458189819584668
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gQETvaDg;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id g2so5935805wme.4
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3dnzDwoUdquF63Y74v16waEoMQpnjKeNmPIl7+eWsHk=;
        b=gQETvaDguBXvPkY0TX7LS4RU6RTcKtjWvj9Mb3O/NTUZ0rzuuNGBqH/jXP90NGbT0R
         r/R8swtZi+1jeDHWif0L/WfgYhP7dyNtMChzuV8rn1gSc79axNLzoT8B8zSbHjtDJYc7
         zE/vop579FCSP7jNMSRfAzMM01Z/n1Kp30S+XIVGIWRnfjkXX+zs/QQ97gsHKC8a03rx
         cNGicHN4HQuQVtz+Ma5dP41D1qB0RizmtG2gnbHzy+m5f4YKEkzIv+fDfuYR0FjQl/ui
         XsS/pQFYHfMax134nAiLs69lfri7ufd30LkofajXIX5JPM4HkEXOt8/DYgIynsqhf00Q
         LkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3dnzDwoUdquF63Y74v16waEoMQpnjKeNmPIl7+eWsHk=;
        b=o86FTO652nQIyvH86SxqlYP9ETZ00VGIhq7lMO0fHlFkeljuWIHQTlUDnFMrOoPgkb
         WePzGNTCny6BNbJjXjYpzR9MJ5xtxGEQi/MblNECld7TLE14ypsEPm+0VNpdqcmOnCoZ
         vSXYayV+zWO6XfSnLJlUks12107yrWaDkDx1+rF+rv+WcL9uhXOtylYHe50GWXlii7RS
         Nl9SMVMo9MTLsazbY83h+mCXfk89QHhqwn+xid4SjUUEPByVDzcDXuCnnPKLBNHbyzQy
         qsqExyyt5UNIfdKV/mLBpIiAcDmG6892r/X9xjwQOwQK7wKQ7MqnSvt6jxLDMh8kJG5u
         D4rA==
X-Gm-Message-State: AOAM532C61COCnyWEZ71y9ayGw4/MLjHGjUkMm6eKuTUbYHg/5mLvBHZ
	GqLoWsRJ1udFpc2gMeVmqjrXJd46oYlPvrOa
X-Google-Smtp-Source: 
 ABdhPJwPm35MMatwRS5shsQ+1D2jVLALm7JFF25urIqZ0RkZhY5FYck7OLQ0cjEXHNMrWZH5fJkf4A==
X-Received: by 2002:a1c:58:: with SMTP id 85mr23109823wma.29.1634458188238;
        Sun, 17 Oct 2021 01:09:48 -0700 (PDT)
Received: from slackware.local
 (dslb-002-205-236-074.002.205.pools.vodafone-ip.de. [2.205.236.74])
        by smtp.gmail.com with ESMTPSA id
 e15sm9266657wrv.74.2021.10.17.01.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 01:09:47 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 5/5] overlayfs: add debug information
Date: Sun, 17 Oct 2021 10:08:59 +0200
Message-Id: <20211017080859.96939-5-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211017080859.96939-1-uvv.mail@gmail.com>
References: <20211017080859.96939-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 08:09:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157030

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index 9397ab44f9..3c0f4dc882 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -92,9 +92,11 @@ WantedBy=local-fs.target
             'LOWERDIR': lower,
         }
 
+        bb.debug(1, "Generate systemd unit %s" % mountUnitName(lower))
         with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
             f.write(MountUnitTemplate.format(**args))
 
+        bb.debug(1, "Generate helper systemd unit %s" % helperUnitName(lower))
         with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
             f.write(CreateDirsUnitTemplate.format(**args))
 
@@ -105,13 +107,17 @@ WantedBy=local-fs.target
             'PN': d.getVar('PN')
         }
 
+        bb.debug(1, "Generate systemd unit with all overlays %s" % allOverlaysUnitName(d))
         with open(os.path.join(d.getVar('WORKDIR'), allOverlaysUnitName(d)), 'w') as f:
             f.write(AllOverlaysTemplate.format(**args))
 
     mountUnitList = []
     overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
     for mountPoint in overlayMountPoints:
+        bb.debug(1, "Process variable flag %s" % mountPoint)
         for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+            bb.debug(1, "Prepare mount unit for %s with data mount point %s" %
+                     (lower, d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)))
             prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
             mountUnitList.append(mountUnitName(lower))
 
-- 
2.28.0


