Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C693606B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so5768848wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SUvfqv1ifcjvv2yZTmaJAmAwZnLlQr3RggxCCPeh+sc=;
	b=n0R1FkuDwznFoqgm+rvOd5uu4zSif41tBTLD2e881heJj30EaFTDPy+I1AOC3J3bnJ
	3zpEY9zoOfYxbSNLsgUM8OfmLKBJY/PG4gUGmyGpYH9xlSwdYVa2fq57dS/OftPyThvK
	4Rr1VUWJBj5qgNMU/duBWqoMlo/MU177Fy7C7vC55SlpD3SpDivlGnW5J7RAZcxVqy2o
	DKOjjYFlwMuzjUJerLkiFOWwtm2E2pwCDQq8hyzvSrvSKAGX1L0Dp2GGp4gZyk44ddiT
	dDAB9hJ/OERgY4SSFGdNJnmDrMU9n2RaBdUrL87ZSeXKVsT5ugHkGOaRoXYzTy2VwqHb
	m/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SUvfqv1ifcjvv2yZTmaJAmAwZnLlQr3RggxCCPeh+sc=;
	b=EwP0Jz2GH55Puz5t9reaX8oM2D1BuKnQ6eNBFR+XC/pn7TADqDTKLJwCbtJdDdT2wf
	rC0YOevrn2VBTsCFGVVnu2PlWh6ENQxLgRuD4cfcfj+Qo0AqfYfev6kuKICNol5Bv5sl
	Lw+tvGsBlECozOItidZE/mxUhD83PMuttm+L06pXVEC5e5amr35L2nI4ciFugOnPZQSC
	StxXwA3geyhkRuiUelYXM+LxS5FD8ds9l97jxKRjdE/bh7Hzxgvsx6eDZy37hb3pEIo3
	aTsmPop+fY4SyTMzkXKVwH26/fnVYH6rBpkVHud/OZIffqZ8XLn3AJ+Wi3Js2kspswjF
	pqRg==
X-Gm-Message-State: AA6/9Rnd8CL1nkjhKSd90I9wry256zluKPkY3uU7KzVZcyGx8iLf6YhZwcZ0yw3Z3Pq+Wg==
X-Received: by 10.28.185.71 with SMTP id j68mr328415wmf.116.1475290066190;
	Fri, 30 Sep 2016 19:47:46 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:45 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:58 +0200
Message-Id: <1475290031-20568-10-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 09/22] gummiboot.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:45 -0000

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
 meta/classes/gummiboot.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index e6eba17..4f2dea6 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -74,7 +74,7 @@ python build_efi_cfg() {
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
+        bb.fatal('Unable to open %s' % cfile)
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
@@ -90,14 +90,14 @@ python build_efi_cfg() {
 
         overrides = localdata.getVar('OVERRIDES', True)
         if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
+            bb.fatal('OVERRIDES not defined')
 
         entryfile = "%s/%s.conf" % (s, label)
         d.appendVar("GUMMIBOOT_ENTRIES", " " + entryfile)
         try:
             entrycfg = open(entryfile, "w")
         except OSError:
-            raise bb.build.FuncFailed('Unable to open %s' % (entryfile))
+            bb.fatal('Unable to open %s' % entryfile)
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
 
-- 
2.7.4


