Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63D8C678D5
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:52 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.28055.1676931630559771113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aVECN0+x;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id q5so2992298plh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbWErJl5H9I7MHyubojrULiWuIOf187SSG7ccEMMjfA=;
        b=aVECN0+xOX7qlmo5Ollit9YTw7sNym/GEIBi80AvksoBMLLCW9BMo1JG3uFsaU7opv
         5lg2vbtNzyFNk/4F5cXiukq55MKCrBY5V+wVYYzJJiFsPDiEYD+0FwpFAp96Lh6lyTvg
         q3gnpIfTeG5CYEmHH5qWE1zZ96l61v/Wan6SjuaT7XnXZBUPQcy8RPYgPJmY9AsyaY+U
         Y2jgowo5knREwic2TVsWkhpEMeKeLav/ZpI1C4DlVcopxI/jmSygZ8vqyHVM1BWH/hRp
         7iYLwFEeMaldfVIumOdxHozEOK2WgaGDcRnveA0bWZgYac4j5BS6b/DNDd3uMB+/wNnl
         mBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbWErJl5H9I7MHyubojrULiWuIOf187SSG7ccEMMjfA=;
        b=r0kQhhaXjQ2+YP0wOsP5uGUk5Eiz7GEW59qpEeo3QP4pc1epVLA5sjSDefrAmELIQ0
         Q/vQ+Zno5gRxf94Y0rfk3y3dDs8OdhPi6afYqvkJIRRmAZLiQtp12KE6FTFQffZPnkUA
         Dy42srB30FwDr+68aZxr2Mo1ZlNu2AUtlgB8vxq+/IKTlPC2XqP4ZDawHmCXKKlXwgiR
         4v63tF6RsEy+LDGxfrHIcFFbxVIz6GGsVshI3j19nudLcy6D1SDkwvdphm0ufrSDxdpF
         r5mWW9T7r7veqkkTKqxMCo4Yr+1qL6JGMDmbsuXqvBjOGP22vITXSRwLtAVcHCBjyj2X
         NeAQ==
X-Gm-Message-State: AO0yUKUcvY5FmHTza4VqGFUiU40NsPp7GOGyfCNdPRvqMjUzb9RG3Oph
	qkM6f8YJsCAgawlzBI3SBM8xvXStKZWkEmgNhfU=
X-Google-Smtp-Source: AK7set9Rf7ZTuI4+zbhzYzX88Z9AcyLkSbtUvo7o72trocI1x+qt2N1AC+eD9VSra2Ec00kc0S3euw==
X-Received: by 2002:a17:902:db07:b0:19b:f5b:4ca6 with SMTP id m7-20020a170902db0700b0019b0f5b4ca6mr4197981plx.31.1676931646284;
        Mon, 20 Feb 2023 14:20:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/16] classes/fs-uuid: Fix command output decoding issue
Date: Mon, 20 Feb 2023 12:20:16 -1000
Message-Id: <622fea338a0c43f95185469b54cc72c545b73100.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177469

From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

The default return value from subprocess.check_output is an encoded byte.
The applied fix will decode the value to a string.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 046769fa952a511865c416b80d10af6287147fb7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/fs-uuid.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index 9b53dfba7a..731ea575bd 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -4,7 +4,7 @@
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


