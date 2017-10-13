Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 16B1678215
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 11:26:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b189so20514019wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tdhnjptZ9FGAxM8MFemQ6peUsuhQvW8XGFmps66QBJc=;
	b=iJtsSxkG6FSOQ1S/1SthXy48o8KWyD0AEVrulTGwaE+EOEemG/CvguHO/KeACJuQqs
	hfKMaLvkKD8YTZyk4m3IcZHZfLaME8eOhUkz50RrDjJEMMtr8v/htKlaGi6ejqZ28wN+
	VM8zgQ0JEEHET+35TZam3htHM0B8v8a4LdkB1ck5mmmlYUJ02c0CcOZ2uFWKfsBu6MgW
	whWeErVWBnHLfSoICok6uzTFZfJC3OCboaDE8O/+E3GZjU642S8/lhFxZ9CW+Bf9i4Te
	Px0UancQmNJ5yCkZEcyZqIQrZ6+64x02rJ/DSQz5aEQhcqVSVvoW134MoTRfMI427ad7
	dQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tdhnjptZ9FGAxM8MFemQ6peUsuhQvW8XGFmps66QBJc=;
	b=BPjoiXrUk07h/n42pgwbDSiOCgxkF/H0qRd4iAadp9xaHjKKC0JbMEq2ZAWCymCHEx
	iZawfdvI8fNWfBcba779NMgiB0/BcMXTB44tJ+ZDKuLPSS84nkUEYyejsdEr3/pGSvYP
	3akNJz7bTATF2nIiyBWvvVy84JU7mTLuNB+ZLrCWEiko1QY/V2oDRwP09+nxHkVt5YrB
	zTQYpJiyYN04y/pCzAGIx3WQldi4Skf4PqmOT6mnDUQWx18adFJyV/gzw7OLUb9w9mnY
	agkZVur7vQggnRwLQf1Ni+nEruYNsvtkKd0CNhwK2FJMz08QzR8h/JVU6gRwZCO/A82Y
	C2vg==
X-Gm-Message-State: AMCzsaVKFMX1h5DDzV27SEziEVYmwO/FzcOtaUODc9o3cla3pBUtTLD4
	hEeg1OAMcknTxVP2cnIhSvgIKA==
X-Google-Smtp-Source: AOwi7QAh2RrC7nRIdXUfn4TOdCDtbBgavhkCEOY4KwxYAhaZIe62TPqPpz8s1uJ8LJXfxsuTd6RJiQ==
X-Received: by 10.80.194.1 with SMTP id n1mr1655253edf.1.1507893987823;
	Fri, 13 Oct 2017 04:26:27 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id z1sm736354edz.97.2017.10.13.04.26.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 04:26:24 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 13:26:16 +0200
Message-Id: <1507893976-31129-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
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
X-List-Received-Date: Fri, 13 Oct 2017 11:26:28 -0000

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
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 9eb19a2..94afe39 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -224,7 +224,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     import time
     pidfile = tempfile.NamedTemporaryFile(delete = False).name
     try:
-        sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
+        sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
         pipe = terminal(sh_cmd, title, env, d)
         output = pipe.communicate()[0]
         if output:
-- 
2.7.4


