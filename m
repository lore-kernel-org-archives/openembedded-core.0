Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD4EEB64DA
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.340.1688831779159391841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uWR0ko/j;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so2163004a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831778; x=1691423778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHJCW2lWSvNnYuC02cYcLpeNcet0v6NSU0H/WTAoX74=;
        b=uWR0ko/jcGIx50ftOnAHDiStvb0/8Ls7yHfHM+rw56QtkN6l1h77OHHE9J/nZyVxSh
         jbb8LMZoy/7K6zUVpegK7Xe+mR43FTBbiTFvl0ZV4AjzvCXMEpIpXmIIyLCfoC5pOVOm
         qeoLCHZZ7NGLO4xRJ3LB5Bdv5b5L+OpvEm6RxLt33j968Pz/VxgG5Je7Czv021zk2JMt
         lPKt9mV/YK2Q3Ds0zoo/JLYywJwduqxwbjGKtrRUqnb11iagNScmxNlHKEyFX9MfgImj
         0BL6tTxCywIBf6b/mPFHyRgWD+EYeKtoZHsEiGK5aZRsy8FSd6H31tIeMIeX9CjDVFW6
         KLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831778; x=1691423778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHJCW2lWSvNnYuC02cYcLpeNcet0v6NSU0H/WTAoX74=;
        b=GXLZ2xWNCfguwGysBiuqzMPUViQ9tzUDlxzmwEEXLtEzA8+rVYjtOeNfYSRjYahXxW
         zOOVmTHucF+KXhdo5eHjSrj+hR2hX9ESRICQO06tiZkLEhqgefZzSglVjfs+70A0eSp/
         hFwTtuwsebcy+s7cIsS/T1b4agSosOyKy6b6qAJPoqpvRenM4kdlNUQNYF5bzDhYtrx9
         xyGcNpFSnIruk1yyEr3QBLjaUvmHtHNgeWcix9/Zruy21gjRw5c9RDjHAsDlG08tz8og
         iETNdxIzxj1BIxSCo6OXedo5YUsBXwGqloMHSI/xig1ZIbdZUFePr3uu6JGMfKrH4kCI
         V7vA==
X-Gm-Message-State: ABy/qLZZllwKRetCfZea6XGXk5054QSiXBR+Wu5DNPxTFFbHXxiNhoa5
	B3FvrrUCPp+kXqUq0UbacK9gTC8EEMkVIZZGia8=
X-Google-Smtp-Source: APBJJlGAKTP0I0ZwW6E7cpJO3BJ/KdyCVghyirtq33Wka6COb+pxDwGgMDu1TfK+UlQfeV5VOLifDA==
X-Received: by 2002:a17:90a:bd0d:b0:263:ff36:3aa0 with SMTP id y13-20020a17090abd0d00b00263ff363aa0mr8014606pjr.41.1688831778165;
        Sat, 08 Jul 2023 08:56:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/17] lib/terminal.py: Add urxvt terminal
Date: Sat,  8 Jul 2023 05:55:44 -1000
Message-Id: <9dad23306348af9f54c5fcdfacdbc1e775bf5742.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184030

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
index 2ac39df9e1..a0c166d884 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -102,6 +102,10 @@ class Rxvt(XTerminal):
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


