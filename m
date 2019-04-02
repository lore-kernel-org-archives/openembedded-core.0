Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0827D167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:17:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g8so6177586pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=7GIeKg8plEd+oreAg+d3Bx4gaqpKNZpv3KuZSiQ5ahg=;
	b=ID8wR7GsHWw9CW6ALVXQsTPl9KbgojAkeEonCCsnAlgUCtUDZpC6P/GoKmveL6HZYN
	pkE0aP8gYyBgAiFBHoUqYBbwaHGI1hwV85Qi0UCxCzdc2oES5L+cfYxDlNVZSoiNik2X
	h2U8DxbTnWq5tCy3YwUSGjadvNi1svDMae746+czGEeqx8ja+kiP/0cq1smRamPouwNS
	nkraLjVXnTtCksYFra6cyf14h41emt+97fzc8hwks80FfjP6XFxoahSx8W6FBCGMzDPT
	TCpvYsXk6XbdyDpllSlMy/gBTlRcJMhg9NXcaZWRQu246R58IDHFedhdU23Jsn979IKu
	eF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=7GIeKg8plEd+oreAg+d3Bx4gaqpKNZpv3KuZSiQ5ahg=;
	b=MqXBHgvvYvMFrh5Sp6Gt9sM4g7M36Rki2FapEdbNuuSkCjGEpbl5TXHR6q3yWuMJOx
	Dtq78vG/D+9PtagQSm0f5z7OnZ/HEIq9SkznP5mhN09Lr3zTk6IWHspUU5J6dXbmmSkS
	B89sbPPlu28r91rRPE4psD/ylWOphRJec9bdEkzqTabCVHn2SLa6fM+hszZnlKwYwnR9
	KrAOcf3HDsPVIst5vMx6P17rULxeC+L8CAKQFQnrQXVc1Xk82IacG0mjTrWo5Hqg7UYO
	FWvqJarWXycg5bAD7ZctaR16DaLUc/8ZpaknXd8G7hRLgq8R97qIJ05pVuHyJwGlIVxx
	uNGA==
X-Gm-Message-State: APjAAAU/uVltPhu2M14qyUVyuPd9kQx6nXtKfYZAyQQ+0V+AkXzj8M+u
	NV3gTssjSLTnEaBNkwGPqIC6YY7XzS8=
X-Google-Smtp-Source: APXvYqy7Yn0vc+uxnPcYu0m9dp9GzV7m/MAZhKrp7kW50CvMopDxZcFTWaB2yATd4F43GOfgP+kkMw==
X-Received: by 2002:a63:711d:: with SMTP id m29mr19834931pgc.109.1554193070236;
	Tue, 02 Apr 2019 01:17:50 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	o67sm11854108pga.55.2019.04.02.01.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 01:17:49 -0700 (PDT)
Date: Tue, 02 Apr 2019 08:17:39 +0000
Message-Id: <20190402081739.3316-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/2] terminal.bbclass: Generate do_terminal as bitbake would
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
X-List-Received-Date: Tue, 02 Apr 2019 08:17:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This changes the runfile that is generated to have the same behaviour as
bitbake with regards to emitting the shebang and trap code. The existing
implementation used 'env' with the current var-SHELL. This means that if
the user has configured there system/environment with a alternate shell
(e.g. csh, zsh, fish, etc.) the do_terminal function would attempt to
execute with the wrong/incompatible shell and fail silently.

With this change devshell and other classes that rely on terminal can
now run when the var-SHELL is not set to a sh compatible shell. For
devshell, it will launch the devshell with the users configured shell.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/terminal.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 73e765d57a..6059ae95e0 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -14,6 +14,7 @@ def oe_terminal_prioritized():
     return " ".join(o.name for o in oe.terminal.prioritized())
 
 def emit_terminal_func(command, envdata, d):
+    import bb.build
     cmd_func = 'do_terminal'
 
     envdata.setVar(cmd_func, 'exec ' + command)
@@ -25,8 +26,7 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
-        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
-        script.write('set -e\n')
+        script.write(bb.build.shell_trap_code())
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
         script.write("\n")
---
2.20.1

