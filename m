Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2822178684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 18:38:09 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id 70so8048647pgf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N7I7SMcLLVZgtgX4XLKt10WOZ7Rx7TkzZVT6iDDlunA=;
	b=bzIb3hR4GMFRMgaAt866jrmajIqPJqfxPb8E/2NqAmkNBkr2BtTvV3+aWpaOE/HZZS
	17IFzJf3D0/KM3fuJPtJB4NC7FGx9McGYl3wAioGtm9LrDsMWvaa10KWpA7v5Fyz4HP0
	nEF6jspTrZaRy4pvo/PPAaeQnY4ta5TXZCJBeY3RvxT1nlH02vF7NzHTMrqDWA6i6A3Z
	2gbPNBlyeerGKhLhx3aaZaLT3k2onL1lLA293Ft0wiqxOggHxkgzTj4RUFSsu3wcW+Sp
	aC9sd8G0W96Yqz30zAosM/Eur7WU00y7rSGretUY9iGO6m4lWd2Zj7WiXLM44nMc3ve3
	iaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N7I7SMcLLVZgtgX4XLKt10WOZ7Rx7TkzZVT6iDDlunA=;
	b=qHiYHX+swLsxdQaO3Cq6sk2DMgThbqFAFcAmXc7XE6tYdiQbHsp0EIxbh8OhqsS1tP
	nR1KxqDg6FE3imqKvlRWT3tnLbvMyZf7hMenPN6fNz6KyPYiH7xVCzOpcVI2xP83IDZo
	3F25p0dqBHN1P7saxfoDQFJMw10eyjTg20izHyoo2atId8e+S4exSF9yGhb97jp2KwEh
	KCZcrNnyxc6CzB0JGrvptkpKfdNXtY6m32g3e1FbG0vTQHtsCLpDAeZtPj9AhjUpqqZW
	sNCdz1owNhX9kJLNd6Vl4NPqlGpMsI/thUpBHv4lBTSBQPZrN3IwNJ+UMoZyCw1RchfB
	XtuQ==
X-Gm-Message-State: AJaThX4Sug/+YSnx0SNZwva9JndWbVvVdmO15YwzoNd6/xRgcLTTSbQI
	4mcwlp7vhgBjA/fLUH8AgKFwXA==
X-Google-Smtp-Source: AGs4zMYQ9XjSbOlE9yZP/dZFsS+hV+3gQGfby9ylLaZKBzUk8RfVGJAmzjvuvEq30KrGMn607GXOlg==
X-Received: by 10.84.132.42 with SMTP id 39mr14590035ple.382.1511203091078;
	Mon, 20 Nov 2017 10:38:11 -0800 (PST)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s25sm19367779pge.44.2017.11.20.10.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 10:38:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 10:38:04 -0800
Message-Id: <1511203084-3492-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [morty][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Mon, 20 Nov 2017 18:38:10 -0000

From: Ming Liu <liu.ming50@gmail.com>

A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
the default terminal, when I run any of the tasks:
bitbake busybox -c menuconfig/devshell/devpyshell
bitbake virtual/kernel -c menuconfig/devshell/devpyshell

I got a error as follows:
"Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"

Seems the environment of the process calling Popen is not passed to the
child process, this behaviour is a known issue in Python bug tracker:
http://bugs.python.org/issue8557

It could be fixed by using an absolute path instead per test.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2117c148ef07d84bc605768e3b3671b0126b9337)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3c8ef59..df4c75b 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -67,7 +67,7 @@ class Gnome(XTerminal):
         import tempfile
         pidfile = tempfile.NamedTemporaryFile(delete = False).name
         try:
-            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
+            sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
             XTerminal.__init__(self, sh_cmd, title, env, d)
             while os.stat(pidfile).st_size <= 0:
                 continue
-- 
1.9.1


