Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id DC8A378684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 18:36:02 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id r62so7894783pfd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Iyix8RlDh+Qvc0yxnacroEi27XU8fw+ndBY44KARmsg=;
	b=nXsvoUpBYc9YMhLuMU39lgubVJaCfsv6pcWg6e95LSojwoga8ugoDwyS5hlcFY9sup
	BlbttSQk3fLVmc9hk8e2vpPGUvavUm/swcck3xArCsuQrITd8+5XWSEs4vGyeDDKW34G
	CyUw1Bq+SfK9lMthvmnb5Jwx1u969CJFPgy42V4LfvvZKzjjGntYUERskCfaReJGaoZL
	+RwjGcIbIViNHt9SBxUxZyOmtwlZY45ZH7QSTzxaxZ+qZyhjv/6BBid8W4RV9iOFRtHS
	fYKTq4BIcYzDeHRGZ3X2juSy8AY5iWA81LvmQFZjcQX6Zc3RV6ZeaN8D+eSiBj+fEygj
	1lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Iyix8RlDh+Qvc0yxnacroEi27XU8fw+ndBY44KARmsg=;
	b=PINbIvtP76WSVXfFZvRItqr5knEqDPMOEK29IB1ihFPt6RIuN+/nIi3jjNYKImufci
	4ukXwn0DSEccSCp7/Hcx+BaxSNgSY2mLoST3r8QLZOXeLXMpq+q9i3+CNPGkzh3nBAzC
	OoGoTyxgRTSAcv1pZKj36jW7QaOp/spdW+qnZqSpbdP1+K1pI3jCaw3cF492QA5UFfHb
	6ZlCOK28G7dOk43l3i4UQB0X4so3Mftj6jUOmherxOTinpyyvVedCujCvLlYXm4+qDxf
	VGiDlQt3FgBiscJyX0i1FlpXsyvp4nx4xyyhwqvWdamTmel5+NJ3ryOEOhh1XOUMEYE6
	bsoQ==
X-Gm-Message-State: AJaThX6JyjMaY02gx/SejPeEw2sP5WHKQGf+MAxjIZ6p/h0qsrTQKMMN
	Fsd7frTaUBvF7SNP+RNB4RpRhQ==
X-Google-Smtp-Source: AGs4zMZvzjSwKgwZaqkdJ2N9qQ0yBrLi9MEFon+y+X7g/6ogl7TUSLZ1XpxObUy4jaZvWHqaghNKJA==
X-Received: by 10.99.56.26 with SMTP id f26mr14337660pga.328.1511202963496;
	Mon, 20 Nov 2017 10:36:03 -0800 (PST)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z78sm21687435pfk.115.2017.11.20.10.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 10:36:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 10:35:57 -0800
Message-Id: <1511202957-3269-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [pyro][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Mon, 20 Nov 2017 18:36:03 -0000

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
index 89ddb46..2f18ec0 100644
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
1.9.1


