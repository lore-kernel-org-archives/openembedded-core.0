Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D164EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.802.1687275617040230016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GP7tq5yN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-543b17343baso2477621a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275616; x=1689867616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YstHWgu/QrOfzmLmMSIFmqgecc9LKkl0ktkaLQFJ5g=;
        b=GP7tq5yNy5Mzy8howcWn58G91S1sU13XwCySveDNVKRP9IJWi5L7Ew2BaG9A1QDPec
         Yr3fHaYOWOx0NS0LW92axqHQVRRPbb8EE5mMKiv6pTcnuPXXq0HFk0awUKEPPi5Rs63J
         RzcbsN744lhnNd2QqvRJBsHiNN+Rligxi6ERhptWIc7DFaXfVb0kMt9SpKKRuMsrWphO
         ItmihoYoSlp8aZ+Rsg1byRDRSaGDglS+hDZEwUAw8hWb2Jyw248vGavMqWgocZ+htqo5
         ziBBmJrY4jXTXPqrqWxpITyaDBIxd4drgZIpUjix0ZNM3G6TG+rq3CPU3Xxl9SZ44Irr
         uxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275616; x=1689867616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YstHWgu/QrOfzmLmMSIFmqgecc9LKkl0ktkaLQFJ5g=;
        b=IAP6VfMePm2gvUuDmlOaQ7CPEJJ3G6SEiJ+gbMeJhR1cAjeJ9vGBvf1kw+9DZjCKhf
         3QOdL86Umh5TVtQREwA6t4S1A8USKUYqocFKJz71LrONmrfPfk7dljSnuICdwuCcvEtS
         ilaBgWurk9COOw0IIN7bFONXNSSBAFIcgC+IafkVY5Exa06/eI1/DHZ5FLM3bKh2Oq02
         TlBSxTe/2UvOptMY78TYABKgGEwIXCOWFHoiWl9FOBj6sPYU89BtzAGsdQk+ON2/DvEF
         uSviTydVvCAmDLcGazCoMhuglb1IPVjQjDBo1Coxr3QmhU2wp3LtustqYdTEvf2jcEEX
         NHjw==
X-Gm-Message-State: AC+VfDyeXKoA0riemnKBEQ9nhflmyxp0S+yvsO9AsxHtnZipunyRpZKV
	UkfsH8qI64RygIc0IqmWXQSqlv2YiN7u31uiG0g=
X-Google-Smtp-Source: ACHHUZ5pjr3TfmJ8TcWh82dUgifn/bWke0QvZcfUe4mqKswDvGLqPmrFGojEQV5vDLPzbuUe5zg9iQ==
X-Received: by 2002:a17:903:22c4:b0:1b0:6e1:4b9f with SMTP id y4-20020a17090322c400b001b006e14b9fmr3503160plg.43.1687275616089;
        Tue, 20 Jun 2023 08:40:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] lib/terminal.py: Add urxvt terminal
Date: Tue, 20 Jun 2023 05:37:28 -1000
Message-Id: <59f1a1b2326e2191aa882cfc73a851ea79672a6f.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183152

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
index de8dcebf94..b674335654 100644
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


