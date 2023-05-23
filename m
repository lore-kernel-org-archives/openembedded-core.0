Return-Path: <pazhukov@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C502BC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 08:13:08 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by mx.groups.io with SMTP id smtpd.web11.16358.1684829578316570790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 01:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@suse.de header.s=susede2_rsa header.b=uYDjYU2O;
 spf=pass (domain: suse.de, ip: 195.135.220.29, mailfrom: pazhukov@suse.de)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F05272041C;
	Tue, 23 May 2023 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1684829575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nO/c+sT36A6bFzFk+371V1fE6u5dD6rAo2WDW7hUO3U=;
	b=uYDjYU2Oam/9eB8X/40nkAibEHs0ct6B5OQBrc+D7p7P+bZ3Tr8vSwAskICOHI/GWo83Ed
	7yy/uKpTDTGuBkV+gqWYgvupU2+GV4OQX6rIGQLQ+QBo4fr0BS5jeQcDwDrL0dUc5rSpF0
	fzykUJ1sKaoxFNrTBmgg9pnrLgCpr0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684829575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nO/c+sT36A6bFzFk+371V1fE6u5dD6rAo2WDW7hUO3U=;
	b=r57IqqwjR+nQsQbwVeI1oYGjmvJN2gFdYLcAfDcKUedgdXiXkZNE0LcGmOBlcI7KB6bi+g
	r1zfNtbxHjV7KyCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4A2B13A10;
	Tue, 23 May 2023 08:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cW2RKYd1bGTGMwAAMHmgww
	(envelope-from <pazhukov@suse.de>); Tue, 23 May 2023 08:12:55 +0000
From: Pavel Zhukov <pazhukov@suse.de>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pazhukov@suse.de>,
	pavel@zhukoff.net
Subject: [PATCH] lib/terminal.py: Add urxvt terminal
Date: Tue, 23 May 2023 10:12:55 +0200
Message-Id: <20230523081253.4020986-1-pazhukov@suse.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 08:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181628

This fixes failure [1] of menuconfig task in rxvt-unicode terminal in cas=
e if
xterm/Konsole/Gnome is not installed. Tested with rxvt-unicode-256color

[1]
WARNING: Terminal screen is supported but did not start
ERROR: No valid terminal found, unable to open devshell.
Tried the following commands:
	tmux split-window -c "{cwd}" "do_terminal"
	tmux new-window -c "{cwd}" -n "zephyr-helloworld Configuration" "do_term=
inal"
	xfce4-terminal -T "zephyr-helloworld Configuration" -e "do_terminal"
	terminology -T=3D"zephyr-helloworld Configuration" -e do_terminal
	mate-terminal --disable-factory -t "zephyr-helloworld Configuration" -x =
do_terminal
	konsole --separate --workdir . -p tabtitle=3D"zephyr-helloworld Configur=
ation" -e do_terminal
	gnome-terminal -t "zephyr-helloworld Configuration" -- do_terminal
	xterm -T "zephyr-helloworld Configuration" -e do_terminal
	rxvt -T "zephyr-helloworld Configuration" -e do_terminal
	tmux new -c "{cwd}" -d -s devshell -n devshell "do_terminal"
	screen -D -m -t "zephyr-helloworld Configuration" -S devshell do_termina=
l
DEBUG: Python function do_menuconfig finished

Signed-off-by: Pavel Zhukov <pazhukov@suse.de>
---
 meta/lib/oe/terminal.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 71ffc87019..4412bc14c1 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -104,6 +104,10 @@ class Rxvt(XTerminal):
     command =3D 'rxvt -T "{title}" -e {command}'
     priority =3D 1
=20
+class URxvt(XTerminal):
+    command =3D 'urxvt -T "{title}" -e {command}'
+    priority =3D 1
+
 class Screen(Terminal):
     command =3D 'screen -D -m -t "{title}" -S devshell {command}'
=20
--=20
2.39.3


