Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3C4606B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p138so5777196wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6598CV6BCYO/6XBvZ5jQ/6UeJlwROwMGpc4WaurgllY=;
	b=tki3polA2VPTWz7ehyFigpSenjlxdAVYWqDgtd/cSRHndlAkeN6fpjnaT2bxVhC2ju
	sHufAM6I/eQlFMZdaaQzfRU0Sckb68+2c/OqDoGoSF9lk1EhTgo/4gmP/oOJXkiLcY1+
	t+R9srj50Ofp9d9NWv6yaU7pzh68nOA8WHk/Ep43+FO4uCc4G7k6I/0UNtunrqOKf5CF
	U17qZYjfe0ptXBbr+Fn/QX+kVo6kRfrk4g6C8vreE5CDcy+dEeLRs4Bet1skS7a/MF/H
	VmRTUsbOSd0ETaIXmY0wrohS+dPbdimS8niCtehxuhaRwtGXdfzvvQY5I3qiWe/bmnT+
	31ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6598CV6BCYO/6XBvZ5jQ/6UeJlwROwMGpc4WaurgllY=;
	b=JAbc4/nbAGBYGAZp0OEZtuvU2J4ypagJQQKOn7F1vX+WIjRO/D8qke7VEnOfguvCzY
	S65CeUor7VUgC0g3UQFiPMNOoimGkYzoCnqjjZwZYlmWD6hPa6ubZ1u6xVJt3ZPLI3Q8
	zAoFfKJQD7lnaq05p6UJK+A7hC4MFFj4WYnSHxsBFhgUCp61twI4HoFz1fM4U72ccJae
	kkERhVr70P0nCQERIDEv5OpshvVUz1dmtQy7drS+Z4vJFUFfx8WQtWXlemKHTtdhc08n
	c0YKz2Baw3lgjYgVIRGYWW/iWY0TFAEZnfr7lIBo6ZWxyA0tV2d5ispkxgWa2qYRWhUg
	PwiQ==
X-Gm-Message-State: AA6/9Rn4Rz1NNqkNnJI6nbK8H8X6dClLcCbrDJ7C3wZRr3kYhqAe7UDUqAvvJiNaGyMeew==
X-Received: by 10.28.139.145 with SMTP id n139mr488977wmd.125.1475290060712;
	Fri, 30 Sep 2016 19:47:40 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:40 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:51 +0200
Message-Id: <1475290031-20568-3-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 02/22] package_ipk.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:40 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/package_ipk.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 930e154..eb00932 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -108,7 +108,7 @@ python do_package_ipk () {
             ctrlfile = open(os.path.join(controldir, 'control'), 'w')
         except OSError:
             bb.utils.unlockfile(lf)
-            raise bb.build.FuncFailed("unable to open control file for writing.")
+            bb.fatal("unable to open control file for writing")
 
         fields = []
         pe = d.getVar('PKGE', True)
@@ -162,7 +162,7 @@ python do_package_ipk () {
             (type, value, traceback) = sys.exc_info()
             ctrlfile.close()
             bb.utils.unlockfile(lf)
-            raise bb.build.FuncFailed("Missing field for ipk generation: %s" % value)
+            bb.fatal("Missing field for ipk generation: %s" % value)
         # more fields
 
         custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
@@ -226,7 +226,7 @@ python do_package_ipk () {
                 scriptfile = open(os.path.join(controldir, script), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
-                raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
+                bb.fatal("unable to open %s script file for writing" % script)
             scriptfile.write(scriptvar)
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0o755)
@@ -237,7 +237,7 @@ python do_package_ipk () {
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
-                raise bb.build.FuncFailed("unable to open conffiles for writing.")
+                bb.fatal("unable to open conffiles for writing")
             for f in conffiles_str.split():
                 if os.path.exists(oe.path.join(root, f)):
                     conffiles.write('%s\n' % f)
@@ -248,7 +248,7 @@ python do_package_ipk () {
                                                           d.getVar("OPKGBUILDCMD", True), pkg, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.unlockfile(lf)
-            raise bb.build.FuncFailed("opkg-build execution failed")
+            bb.fatal("opkg-build execution failed")
 
         if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
             ipkver = "%s-%s" % (d.getVar('PKGV', True), d.getVar('PKGR', True))
-- 
2.7.4


