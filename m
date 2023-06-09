Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB6EC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.166.1686329685937935389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VOU0YY+H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso2083275b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329685; x=1688921685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH0CYTDRsc94EJxAw86QyrI+bcu66iIEHd0VqBT47RE=;
        b=VOU0YY+HrmJ8DIICVPtYqQNB67CZwCHbAiBC5klbc4qWpw0wMBXYfNX1lUu6hqIXpo
         WfV+HYJBIuHVGUnGO3bGLz8Ix0SK9JzE4g9uoHtUVMKNjoakBUBYo7bZOXCoJijlaDlg
         kY4vL4eLJxgpufOygCl5t+lbLRnilvmeg4fm0jCBxee9vRhY36scnidllu+0eSQO2zfU
         9NAWYxVOmSaBvimny3AQHybA2tBzQ0pkoItloOz+r5KzZl3Q6VX5AfhNgnjD2kk4V07L
         q9wRBczy33JIjLabEiUmtwwo4NIxiNegkrncJ81RGYUXaxwzWX8YGwPhnL8bC8WtpHB7
         dQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329685; x=1688921685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH0CYTDRsc94EJxAw86QyrI+bcu66iIEHd0VqBT47RE=;
        b=c/W6OfTpqhPyE4lH3iwQb4iBRpXVoMx6jU4KEiqb6XKInDNkdfS0Te6FNtoXFaXo4m
         l/ArqKYb8sIKRfJOYAyC7C72HsPvTzcfAzOR0biPse/ejrCCyigNupwAtL4hzCY/y62c
         /9z0A+FBTjED3mhsmDEbwKbH5uOXNGCsL1+74zjImwkbria3Z9+p2rawdvzJnc+AVpwZ
         FctRXEcPT/svIgnbBeFaOTlzoiHR9X93CaqKVrKdD5/psw5iqhyPu3XfKrxQ/neA7Ail
         WXW05ZiR2oOG4l54Af3V44cqacvHcH2pyHwwJ7qfR2u+wW9Lxe+pcqd614vjnSYdNBG6
         C5Hw==
X-Gm-Message-State: AC+VfDwVrCYrDX2BLBOcli4DQVtZoNUIjmsy/dMUyfdaDq3QeZLqVYlo
	ZVcpNbhSP9XLOPrJ07b31KF9K/PbMBTikX4HH9g=
X-Google-Smtp-Source: ACHHUZ7pkN4OxNSA9/yek6emo8EOw+Pkr3C99O51+7ZIjPv7LhG7tESU4oiRoAIOPpuclnAjuEKxNQ==
X-Received: by 2002:a05:6a00:24c9:b0:64d:4412:9923 with SMTP id d9-20020a056a0024c900b0064d44129923mr2308317pfv.3.1686329684894;
        Fri, 09 Jun 2023 09:54:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/30] lib/terminal.py: Add urxvt terminal
Date: Fri,  9 Jun 2023 06:53:52 -1000
Message-Id: <d873b925a02dfec2c7655757a1f08d2435fe1980.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182591

From: Pavel Zhukov <pazhukov@suse.de>

This fixes failure [1] of menuconfig task in rxvt-unicode terminal in case if
xterm/Konsole/Gnome is not installed. Tested with rxvt-unicode-256color

[1]
WARNING: Terminal screen is supported but did not start
ERROR: No valid terminal found, unable to open devshell.
Tried the following commands:
	tmux split-window -c "{cwd}" "do_terminal"
	tmux new-window -c "{cwd}" -n "zephyr-helloworld Configuration" "do_terminal"
	xfce4-terminal -T "zephyr-helloworld Configuration" -e "do_terminal"
	terminology -T="zephyr-helloworld Configuration" -e do_terminal
	mate-terminal --disable-factory -t "zephyr-helloworld Configuration" -x do_terminal
	konsole --separate --workdir . -p tabtitle="zephyr-helloworld Configuration" -e do_terminal
	gnome-terminal -t "zephyr-helloworld Configuration" -- do_terminal
	xterm -T "zephyr-helloworld Configuration" -e do_terminal
	rxvt -T "zephyr-helloworld Configuration" -e do_terminal
	tmux new -c "{cwd}" -d -s devshell -n devshell "do_terminal"
	screen -D -m -t "zephyr-helloworld Configuration" -S devshell do_terminal
DEBUG: Python function do_menuconfig finished

Signed-off-by: Pavel Zhukov <pazhukov@suse.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d2fe4df8ae33e033caf4119a76715f085be1d15)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/terminal.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 71ffc87019..4412bc14c1 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -104,6 +104,10 @@ class Rxvt(XTerminal):
     command = 'rxvt -T "{title}" -e {command}'
     priority = 1
 
+class URxvt(XTerminal):
+    command = 'urxvt -T "{title}" -e {command}'
+    priority = 1
+
 class Screen(Terminal):
     command = 'screen -D -m -t "{title}" -S devshell {command}'
 
-- 
2.34.1


