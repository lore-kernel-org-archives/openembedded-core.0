Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 74E207841A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 01:35:25 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o2so1517070pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 17:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N7I7SMcLLVZgtgX4XLKt10WOZ7Rx7TkzZVT6iDDlunA=;
	b=GmnqGyBanP3YWxCwOBcSmw8O2Ty1fpB1IORu256ujXpeYyVm/tY1pIdUMapfSdRtil
	ca9AQGBP4WHNJ0PCl8vYGbU0oRuVS9hXZv/UiKg/3JBOqrv8u15y1/5VWp5IzkzKVyXD
	v3J42feoS/jV0p1U3bKf7WQSANeONQCPsyhhXusQOrfQcg4xW8cHemBOLV16b6Ft5O+t
	pzQUVXqJ/jIdfwNw525s5NgMbyQTegeDdUtKhrQhPVUhYbM4NruqlW9w/Ym7AjkfhR3+
	nsC3UYKpQzFXrKcfSDs46uxO7ZA81MCC0CwkJAz7lR9c25HHEDj0p7l63v9xi6umr0Es
	iy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N7I7SMcLLVZgtgX4XLKt10WOZ7Rx7TkzZVT6iDDlunA=;
	b=TxgIgL/VWvImGpjp1mAvOLPAC3lq+Ly/GB9NZfVwRWvHSEzR1YFylngCEq3cjFbVg3
	3uiDDIAMynq+D1DGUcfzy0SkPgJ9ij2AGQeiOTYpI/ILRmOgnaRsnWKnL1rTz5qpVbnI
	nK30mrhqgv85qYvILLFmx+945HObGQNVZ+YioxTB7VJfWIxU/84eAWlRDgFi91w+sBKD
	EqJFJzOtbv7PSuBhFA0MH5WL56nKWkjNFkJ2k53nZqzg6o5tnT6JOilaCyBsQx34PnBT
	/+VWvN2L3G7G9jNK9AeBxup6ERXblt5wWW56WC6sRX3BuN/6F+8sAfSGMpGkMmN74Jsj
	KnMw==
X-Gm-Message-State: AJaThX7K4ONo2ehzu26B7VdnV5v0FXgHh5uVSBZcA+8fpVxGbMir4JpB
	Doyf2yBxzxpu9MNycr+n8YwYmw==
X-Google-Smtp-Source: AGs4zMaBSU5NMbiyifY2fRYTnowquDDS0gFPlGYLc95+Ls7jJz7DumbNEu1ZTJdHSO/cuFIYMl0vfQ==
X-Received: by 10.101.77.210 with SMTP id q18mr15364031pgt.145.1512524126894; 
	Tue, 05 Dec 2017 17:35:26 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	t84sm1673958pfe.160.2017.12.05.17.35.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 17:35:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 17:35:20 -0800
Message-Id: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 06 Dec 2017 01:35:26 -0000

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


