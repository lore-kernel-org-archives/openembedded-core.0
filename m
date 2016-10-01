Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B34F6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b201so593421wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QebxXUgEAB60azTA2RPRrX635ImlCldPWwEeeqfv7nw=;
	b=hnv1kWfQGBzkrMjeiPZkyqrWhncv3pimsDbBDlEAdq+G0Je+uY9J4FijZnLC5tdl8G
	ZpkJpjNkUYKZwwLLwK4QydPtEIjlfcM09of9FAEbRFHPOdQkX+Rxdwj3ME8bq0uLwzJW
	V6S8PSbOSgxXOv3s/81yUPVC5RqT25RzkKnZWQ+ilmah22WD9jieEDGpqliVm+x6HMt5
	K36yUtwIGz1CYWu7Enag6DqDWoPYrKDwPpHRverO/Hn0ff3DzF9XmCxYlCfptF01V1lG
	TtGq0CTmUdO00LooKSOwtD5h9L5DbjbxJCGn+VrPwhEJfoc0M99QwIb59/Rffxc8il+y
	2JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QebxXUgEAB60azTA2RPRrX635ImlCldPWwEeeqfv7nw=;
	b=fhYxuYfXJdtIUOmbbQM2H8N+FG7poInOHrKOg6AhS0LWG+8/TO+nguS3iLBx6vHTk1
	Iy2OYkM9tE7EwetZOawyrXEPAEi+wYnPHKJ6yzjLZSreQAM6BCxZaz/0B7eUw8tpW0Qr
	ysgx4zRCiZaXYZwMInh7KD4XGti9px1yfS/k98I1YWlOklbB82FDaqLsHN/eimQxlSJL
	tGukMVy3GBpAAgYSn5EYepi02PbcRc2d4OmsZLPeKIds2Mxj07K0LBFxvINYE2RJb0MH
	vNKXEfCA22CpyY66+cNyL5EgEPI5BQr2Fd3MTTLIxKJLDZvtbpJMblKJOCcNW4yqfgDp
	IfCA==
X-Gm-Message-State: AA6/9Rnudb1Sptt0imOQ97/Hq5rwvfuRFQ21NAUdy3P4MtcgRx6IhoF0RZn6EtBUa3DKZA==
X-Received: by 10.28.38.193 with SMTP id m184mr338259wmm.38.1475290064681;
	Fri, 30 Sep 2016 19:47:44 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:44 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:56 +0200
Message-Id: <1475290031-20568-8-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 07/22] syslinux.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:44 -0000

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
 meta/classes/syslinux.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 9b0c2c7..7778fd7 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -100,12 +100,12 @@ python build_syslinux_cfg () {
 
     cfile = d.getVar('SYSLINUX_CFG', True)
     if not cfile:
-        raise bb.build.FuncFailed('Unable to read SYSLINUX_CFG')
+        bb.fatal('Unable to read SYSLINUX_CFG')
 
     try:
         cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
+        bb.fatal('Unable to open %s' % cfile)
 
     cfgfile.write('# Automatically created by OE\n')
 
@@ -160,7 +160,7 @@ python build_syslinux_cfg () {
 
         overrides = localdata.getVar('OVERRIDES', True)
         if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
+            bb.fatal('OVERRIDES not defined')
 
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
@@ -172,7 +172,7 @@ python build_syslinux_cfg () {
 
         root= d.getVar('SYSLINUX_ROOT', True)
         if not root:
-            raise bb.build.FuncFailed('SYSLINUX_ROOT not defined')
+            bb.fatal('SYSLINUX_ROOT not defined')
 
         for btype in btypes:
             cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
-- 
2.7.4


