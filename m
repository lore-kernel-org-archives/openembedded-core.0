Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B76E7325A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 12:22:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 33so1703155lfw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MoLG6fbsa/33LYq9BLLMuB4DywloaWNHsLrwN4yXqLk=;
	b=edCvOpo3XKwriBTzhGUy4zrNr62xFDwxZ7KJND1lnaeY2m/m6zG87ywxzWW3yh1m9x
	QWj7iLhEGeGYDie67YA4EBeBhUYmj1+eJYg3zhsuRKrQ2WMPAZfTmS2RTqSgVMblYVRb
	3Ge+1NHAN4LCVBqPo8X8BrgU9XSnfk7QYzXx3XD9M/LTMAfyaAwKwnNip3ZbbowEq2vH
	tltFvp8dykQKS8cqwSmtqN70VG08dMOQspwglLHkkIrdeeKgB12AxPP9+sp4uacnuLcx
	gdAO1hLQYO0ol+SDxR/9jZHskxA128PSoEcELYis3BNkF+Ibbg9a5qD4WVzmonBV97f5
	wEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MoLG6fbsa/33LYq9BLLMuB4DywloaWNHsLrwN4yXqLk=;
	b=PEGVkkkCL/Cqy9WI1tKuuCnKh6NvIadsiyms6pzOhx/FWKCMYID49zR1vQ5LDZlHGV
	732pPglsjXJZuYLtbkd9YNSULy0v4/oXbORupnoeJDky+fgM1gb0fBgeukEaoM3dq4JC
	7egtV2s/C6l4FEnulsyu/tzknTCmrvw2YHj8lobyxrvfwm4gqIYu42Bat2EV2rF4C/ht
	CvHJDgUNLAfHpQgkMm+Kaen8oFdwHivMv9EYrCgZrmwQxMx1o/5kpq9/FjRDvaSKczWs
	5YulK8OpK68wD9prtjjsxi9XxBW+tB8H5hCUabPHKWrN0SI12I/UebL6+RVFMSr3PD1t
	foAg==
X-Gm-Message-State: AEkooutGek+OPvrNOrthocEO5ysygUwa45Z+pe8zcc4+jCzvbz6xmYqwN/ER+pHuSjNdag==
X-Received: by 10.25.83.198 with SMTP id h189mr607840lfb.130.1471522920599;
	Thu, 18 Aug 2016 05:22:00 -0700 (PDT)
Received: from localhost.localdomain (m77-218-244-232.cust.tele2.se.
	[77.218.244.232])
	by smtp.gmail.com with ESMTPSA id 83sm305603ljj.14.2016.08.18.05.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 05:21:59 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 14:21:57 +0200
Message-Id: <1471522917-24176-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Thu, 18 Aug 2016 12:22:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
the default terminal, when I run any of the tasks:
bitbake busybox -c menuconfig/devshell/devpyshell
bitbake virtual/kernel -c menuconfig/devshell/devpyshell

I got a error as follows:
"Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"

Seems the environment of the process calling Popen is not passed to the
child process, this behaviour is a known issue in Python bug tracker:
http://bugs.python.org/issue8557

I think it could be fixed by using an absolute path instead.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3901ad3..5c3e0aa 100644
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


