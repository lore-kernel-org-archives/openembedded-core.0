Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7EEC64ED8
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.19556.1676150638762634710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UnS9KrDK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id m2so10040097plg.4
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kuWBVb8mGIYQFD4E1yZ0Gj93iNSavK8dCn0p5d1ut4=;
        b=UnS9KrDKU3jJM15UG9wJM5QBocBKw8Ervu7Yo9k0rynw+E3llSK5AtWlCsTc6v10yy
         jLxjJzV2TSi27BLefch6SrvixR/87BFwODKLzUoq7d/M2wrbrghxyJRWz8hObkPraQwu
         mnKZvRYXQY1DKd0gkKX89I5DzCNcXkhu3HfEEDm5Z+ChmdVgtSxFG8eZBVGvPVRrhje9
         TDWVo5t7MaUmqwAucW9lafW8fc6ds2HxRJXZthx4fMP28v4mgPi/xQWFtdQwUZgfEVln
         Fu/7Yk+FygodhZVo2lai1S/SUJiKxll9FHk9jufkwNSWeOdBcsx5+4fTzSRhr6vcCXmC
         uKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kuWBVb8mGIYQFD4E1yZ0Gj93iNSavK8dCn0p5d1ut4=;
        b=wA0Goavr60W39QnonKcJgOoKg+7xybD3cDJRCtxwPxuZPxfbb9PjBxc40QmKRKODte
         gdICh7hfp1nqB6UsgyUCtlDfsRk/D4ezJjVlPVk/lUK+rMmrYVDlrelSfg/iz+tqSu4X
         djYtnHzlEvZjvAa/vA+fPCRqUSXXeg0zqFhfIlIJ+s5weMuW6WoWMrU0JtPe3XFXyE5P
         j/nmTZesgioH0l0v4C57DybjtwfbufkoFjWDcTLxOiPBQqk4GTOnnwDmlonIbSYKteiA
         xUfKB6EHv0c6cwmZPWyMm87HSyWz/kcpTfUaGiTqMe+lRgwfzk06RdfGp6wjKqDbuiWn
         l1aQ==
X-Gm-Message-State: AO0yUKVgjElvbCztuk4GIN60/M7giSMydbECYqMx8tzyOu6WO1TfVlPU
	e8c8C9UEt80eqeeOVR9rsysiloCAMkrhUUYCRl4=
X-Google-Smtp-Source: AK7set/IiBxaelBAGtdTwx3SCwvV79I9xbHVZUXQhrLkYd7ACsikVtX2fyoU956/TmLSp4FrGJm+DQ==
X-Received: by 2002:a05:6a20:8416:b0:bc:93c7:969f with SMTP id c22-20020a056a20841600b000bc93c7969fmr27020795pzd.10.1676150653718;
        Sat, 11 Feb 2023 13:24:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/28] classes/fs-uuid: Fix command output decoding issue
Date: Sat, 11 Feb 2023 11:23:32 -1000
Message-Id: <2bde03a1a58be6636d36229a75450e08492e7a89.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177019

From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

The default return value from subprocess.check_output is an encoded byte.
The applied fix will decode the value to a string.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 046769fa952a511865c416b80d10af6287147fb7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/fs-uuid.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/fs-uuid.bbclass b/meta/classes-recipe/fs-uuid.bbclass
index a9e7eb8c67..e215f06c80 100644
--- a/meta/classes-recipe/fs-uuid.bbclass
+++ b/meta/classes-recipe/fs-uuid.bbclass
@@ -10,7 +10,7 @@
 def get_rootfs_uuid(d):
     import subprocess
     rootfs = d.getVar('ROOTFS')
-    output = subprocess.check_output(['tune2fs', '-l', rootfs])
+    output = subprocess.check_output(['tune2fs', '-l', rootfs], text=True)
     for line in output.split('\n'):
         if line.startswith('Filesystem UUID:'):
             uuid = line.split()[-1]
-- 
2.34.1


