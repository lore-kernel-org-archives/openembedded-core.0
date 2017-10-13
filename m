Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A6F756E630
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 07:28:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q132so19143002wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hIuQ0KVnbrM1nvhhR4huvr2iWaoLx8lkqsLeEN1kyLE=;
	b=lUC4nVSP/qNTa1SbIFPAWi470eTjfKqU/qsuDo4UVzWScZg47lv8TTm9NQIezKerSf
	Tbz+vzY6lFGLaq99hSGbLk/xdqZKannvpeMVjbdZXUjH2rK7T0/By93ZS5tA5GJMAqiF
	4HMkr+JjiMDlrGKessdXa8ux1fYqfIBGIdYxNja6Idqse/l3KfJDVK+7HNJWlkskDotH
	0cBvhr6SsGA4m+Y41GfXObzktK4fE/Tytx/BsMxIkDxU5X+dfOWen+gjXQTz8lXKue4F
	yTy3oK74PPeVJJWldhnldcWPUhGKdd0o6OQqsF4jLHGA62UVsziHp4hnVAoYA0D/VsVy
	ETag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hIuQ0KVnbrM1nvhhR4huvr2iWaoLx8lkqsLeEN1kyLE=;
	b=kxYS7Y5nyKWwWSXLGnP2pPHcYlIjbnujhWvhdHECfNl+VfeyFYcqJuIHIruq/4pi9N
	v+nmJaDGXuKmK4mXfQUPr6nu2aFUGolaxmqBnswQVjP4X77cA4QMTmvAweiNlvqDF/PA
	klEkjErshcxf3vRa56tXKjABb8o621sEKsbauAXF+7jcW8aaPMsOfGKGIDgbqr4pxeG7
	t9q9IjmT8dobXc/T7fLAKkTvmwzt/ejD+7wctoJQ/WMoMPsoJx+6DsGE94McBqQ6CSlh
	duRt9InYAV8U6gEpAcuFhMNivUeXwNFXZeSVlIYK3i9dgkX9fW1FVDgqYhlmZwXb9oKc
	9VOw==
X-Gm-Message-State: AMCzsaU+KRh1FcALlOa17crV30akRgskc7UajSAURxPUgG8gc+lftSsZ
	b3cF43DZs90Z0toI3uYIfxJfJQ==
X-Google-Smtp-Source: AOwi7QAhm8gsE1r5OSKt7wIP8b23H9CXuv1C02ilvro3OpQ4I8+Jf6cHbNyu9yCGEPPSXmATM/4biQ==
X-Received: by 10.80.241.91 with SMTP id z27mr1009717edl.35.1507879703961;
	Fri, 13 Oct 2017 00:28:23 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id s6sm374052edc.2.2017.10.13.00.28.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 00:28:23 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 09:25:11 +0200
Message-Id: <1507879511-1070-1-git-send-email-liu.ming50@gmail.com>
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
X-List-Received-Date: Fri, 13 Oct 2017 07:28:24 -0000

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
 xxxxxxxxxx              | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 xxxxxxxxxx

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
diff --git a/xxxxxxxxxx b/xxxxxxxxxx
new file mode 100644
index 0000000..e69de29
-- 
2.7.4


