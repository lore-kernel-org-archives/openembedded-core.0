Return-Path: <tylerwhall@gmail.com>
Received: from mail-qe0-f52.google.com (mail-qe0-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB846AA78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 19:51:56 +0000 (UTC)
Received: by mail-qe0-f52.google.com with SMTP id i11so1358341qej.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+a2ZaiQyu8DkUiNoHh71ur+tFrOI2hw8s/5IOuIobhc=;
	b=VjdgwvNSKwipNkQmjuaKAs1Y32PO94GJUG+UskGIBXLnYGjLetQoDAd5Ie1O/UhhTX
	Nk8wD14VYECUEUKeMkFi4JEJ30eMNy43DQEVW0pPgga2K94SVYbvzd/VIzbdC87luFra
	L0LAJ3pNRvxOXCjJ5Q5Itx7WDLIjLHfVwNfqs/sJYKQek+muvEtfPLDCz5EpG8Wg7Rjx
	HYkJV5AsiPgQRbl3LyD4o5SebhwZWFdlvCXHGd5IK/SZpv7IPMN2iIpMCKLtgXilMv8e
	6rYGVkcFLu4cPby9ihfi4mu2pQjQRQ3kYKhtt1+mEggmYyrgRD1sKudpaGKkOuHpotk3
	jliQ==
X-Received: by 10.49.35.65 with SMTP id f1mr28710976qej.72.1372621916796;
	Sun, 30 Jun 2013 12:51:56 -0700 (PDT)
Received: from localhost.localdomain (74-134-75-179.dhcp.insightbb.com.
	[74.134.75.179])
	by mx.google.com with ESMTPSA id 11sm24865893qek.1.2013.06.30.12.51.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 12:51:55 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2013 15:51:53 -0400
Message-Id: <1372621913-13545-1-git-send-email-tyhall@lexmark.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] TmuxRunning: handle multi-word commands
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Jun 2013 19:51:56 -0000

From: Tyler Hall <tylerwhall@gmail.com>

Just as in f8ed7446755eeb88191e16749350efa1e7e6197c, tmux wants a single
argument for its command. This applies to the "split-window" command as
well as "new."

Note that this alone is not enough to fix the TmuxRunning devshell when
using pseudo because tmux does not preserve the environment that pseudo
requires.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 25f8004..4502f34 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -108,7 +108,7 @@ class Screen(Terminal):
 class TmuxRunning(Terminal):
     """Open a new pane in the current running tmux window"""
     name = 'tmux-running'
-    command = 'tmux split-window {command}'
+    command = 'tmux split-window "{command}"'
     priority = 2.75
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
-- 
1.8.3.2


