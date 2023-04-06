Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A244C77B71
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.162555.1680796969929678038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=x1OJcbK0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id w4so37887400plg.9
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796969; x=1683388969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+i4g2DirhqVPDbMjKUgAzHTn0kwzyYv7E45CijIFwM=;
        b=x1OJcbK0PzmAPfmPQ4qxCf7Fu3q37rqX1jW49vTJZcrqj/79XKg05zr/1W0/kAy/mw
         +ktM4d6KGpYP7gom6LY81VaPJivlxRh2a9OfMr9yOPy46lANnHljuihwj20YSCfOGNAs
         lRaYnZk19rR2OaKdWFpa6YdRpHNudK/oZdggchsla2W+O6Tfeef+oPlnoMeqvMPWKHto
         hQY6veh/6ttxMneYKdaDxfaGtL0OBkGdtRtqAYL7YgPM8TzuHFNBsT75jw73bTuNu93q
         p9Qgy7/uefgGjV8LGnePvKAO/+bDOzIdfDCqopwYQEMWNcDF8F4Phpv+ndSFl0sMZUej
         4YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796969; x=1683388969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+i4g2DirhqVPDbMjKUgAzHTn0kwzyYv7E45CijIFwM=;
        b=N8bz9cig2lAvxjgzgj1tgAGVDTEnrZYfl321o63GpDf6MuHuWGmA3ZKbc8y0v77GMg
         332ypjR/u+yxcvt7KQwgC7HP4U3569IDClLMmbGFSOrmiLmOEDa2hqTOD5hmowfDnnS+
         hJuaMURFQ9VeHJzf3OKZX7868SJ0weboVAoAt8m8Uv89VBNP6NyjEv3DeIsQLCz7qT1l
         zUqWqV3gJlHDMJFqmRoz4G2JfK8twsSdvZrMBmxNjC8nXqkkGaIUGm4RDqU0LMkj2bp8
         iz6nwD9eAMGENkgQKi29pv83rNz8LTx3XMcUv6n65IV8fZpSBWfFZhpr9WevGdR+gYq1
         nvPw==
X-Gm-Message-State: AAQBX9eo1sOuhnmE+frcNgbDfuwuoxCJvYtJil0HyfiPU5dr0Fir1W87
	4kugUlm6eFDy4TOmSdW+IWSlTfR6QxeAWuqksHc=
X-Google-Smtp-Source: AKy350ah8nfwBkbXuytsQXGFtP1P0vmNHuQ8wvuPlSKQwDgPLd0nqE1gWe5ySJaFCcik1yShsZbCow==
X-Received: by 2002:a05:6a20:6d13:b0:db:8f0c:6a3e with SMTP id fv19-20020a056a206d1300b000db8f0c6a3emr74487pzb.16.1680796968957;
        Thu, 06 Apr 2023 09:02:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/26] oeqa/targetcontrol: do not set dump_host_cmds redundantly
Date: Thu,  6 Apr 2023 06:01:43 -1000
Message-Id: <ddcd9061ec11a53bbb4b7c9ffc1b7880f45a17d5.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179794

From: Enrico Jörns <ejo@pengutronix.de>

This is already set above, thus simply use the set value from there.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f6571ffb23b1a0b5bd6a1212fc108e536f04539)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index b8d4ea8a70..bc6b91e994 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -145,7 +145,7 @@ class QemuTarget(BaseTarget):
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
-                            dump_host_cmds = d.getVar("testimage_dump_host"),
+                            dump_host_cmds = dump_host_cmds,
                             logger = logger,
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
-- 
2.34.1


