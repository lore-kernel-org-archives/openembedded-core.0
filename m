Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F39C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:20 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.14082.1676902751636741256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=X1BvQilU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id t14so1832911plo.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfTysN8juc1iVPA+1gh7rh6T8Zka+y/T7OPdYTuUUyQ=;
        b=X1BvQilU2DPT78RGrT1g+Ux36EOYuwna1xcxu7EDWwjtXdlM7F84k7WUfv2JYdYjrZ
         zasy7j163n06gGHGt8htSZOzqUnCsfRkTsTr/avfq3fPMfHFOzIUjH4/6d/gdiRQ+UnT
         BTP8Nz0y//D8tVfTukFflHhWa9c+jSlm/kcJbmTnM49SM8KJLhBfXay2GKvKlgSD8TNq
         OaOtc1+JgwPoRLuzEj2KuhqaEvmq8Bio0a5XuMZ2v9SSVSXv1/uor4pDCHS7iShw83XY
         v51yKdufmAw5f65HZs6EgsXDZhDMj2iDO45aio93HHCdG4HQjYoqDYwgqThYZZyI9KSB
         0rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfTysN8juc1iVPA+1gh7rh6T8Zka+y/T7OPdYTuUUyQ=;
        b=0lsErIf0CcRsUvFS1EtBP88aC+yaU7eWoUCvIUWjIxREwaU2tl/5nstdPAoJk7c93r
         Nw/L+JF4Bxdh7agpo8kzxKGLFV7ErbByuHuxoVB4e/pmHIwwsUVU8Sx1oKkcIx1hdcpJ
         //yNyM5Xrrpcmdv94aafJ30EY1RJX7TzTw4RxJOSZBCmTgpb0vMvifDFdmqiVJDz/qPT
         ktbmMPWyFB+pESjKQF7QNCHvQEy9RIW/nPTOMpIPraVzKp9j87Nr2N8ZWUKWYJ2L+9mw
         +4OdtKlOk9Sz1kIEyPYc6SOPj71W9WShUIKfJMjsyPo8soIZdkRFh4sNawi+rn5opgpc
         4PBg==
X-Gm-Message-State: AO0yUKUcDPCx2U1Dhd/Bj4QReslZBNVrQdU23Q9GS6RYok0AlfVIGSuE
	5eZsCwcwFXrtpJajmaMh/ixAs+aFdcggI4szbFA=
X-Google-Smtp-Source: AK7set/XXYpLydSsLCEC8ryeNQF43eGmSoMia6taeQy6VFCWlSv1dQfdk0KTSvRgF/Xz0QO6vurmkw==
X-Received: by 2002:a05:6a20:8402:b0:bd:ce7:22d2 with SMTP id c2-20020a056a20840200b000bd0ce722d2mr2450600pzd.25.1676902750661;
        Mon, 20 Feb 2023 06:19:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/22] oeqa ssh.py: add connection keep alive options to ssh client
Date: Mon, 20 Feb 2023 04:18:25 -1000
Message-Id: <07db4a45918eb82503b0bbc7003258c0a03bd5fe.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177424

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Configure ssh client to test that connection with server is up.
If the server does not respond within a minute then the connection,
target machine or sshd daemon are stuck and it's better to exit
the command execution with errors.

Some tests can execute a long time without returning stdout/stderror
data and it's difficult to adjust timers for those cases if
connection to target machine or the target machine itself hangs
and output is not expected in minutes or even hours.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit ba68ff04c5786eca7cd8dd44056705867dea8ac4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f1b9090bbf..48a463861d 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -34,6 +34,8 @@ class OESSHTarget(OETarget):
         self.timeout = timeout
         self.user = user
         ssh_options = [
+                '-o', 'ServerAliveCountMax=2',
+                '-o', 'ServerAliveInterval=30',
                 '-o', 'UserKnownHostsFile=/dev/null',
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
-- 
2.34.1


