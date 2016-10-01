Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4956FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p138so5777313wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+rxYECEyKSnEJS6CVDfle0YVrFokFZTkfcxOC/dPXIE=;
	b=ZHoxlDXbC2njfUv280sb3BDfauD6tw9ad3F2qpAl19bqXHWtYFB7yyWHZuwl6/49K4
	5cJh1dwkAH5sgB+qNQJHRzEcyByMtlZxs5RYRz/XCywOyGHT4DYNxO0T5Tc5phthLshD
	ffXefHWSBqkwbP/sg9YVF7M2zYrAyGyjRfLZMQmzaIbnERjjSEmNH1yolpgErNQ0MEXq
	dbdChmpX3HKZPnapERXKVVVUwFUJ/q4hkYGfXYYOCYkFlEGQ7GD55hlcV/H0Gv93SpLk
	k3oLPY5Ydy0/TwZH7bduktecw9lFxCWMgau8xcmE4q6eYeYTampSftMQo/LFqneO16vt
	MkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+rxYECEyKSnEJS6CVDfle0YVrFokFZTkfcxOC/dPXIE=;
	b=k/qAO1xxqB2ZKJZk652BLegGT4GMlNsIhcLLwy7c9O0n0W43Yiki6+ClS+fpCHu7Iu
	cYvTDtzp07PTkSMliqMiKFJBiERD6kL6PITMFzMZufm5GD7+d/ysJ1xo4D7N3a+SQfu9
	jnvJsbMHe/xAbZZ72xzUKcTgik2psj3JcPgGOufvp0Apfq6zOJzRLDMow6i12qrDV/PB
	lu9RJjZOJ5d3ADy8v5Esb2NksxGdVVqJJPSfN/GNPB1fP3YRatzKxZwddDus+wRHodU7
	ftSb8gfGE0Axcdemq6dcYWHYLmlNPSRKv6UmBXlYPl5x/pkP3wawwSj+Kr2LlE53GXJH
	BMLQ==
X-Gm-Message-State: AA6/9RnE5cCkndYyhagBB2u7k7jy2sBWOnIlHx9yWOV7oTayyUl9ymIys3dpLBnPSH/aaA==
X-Received: by 10.28.183.87 with SMTP id h84mr382179wmf.52.1475290065391;
	Fri, 30 Sep 2016 19:47:45 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:45 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:57 +0200
Message-Id: <1475290031-20568-9-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 08/22] systemd-boot.bbclass: Use bb.fatal() instead of raising FuncFailed
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
 meta/classes/systemd-boot.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index b550b61..05244c7 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -77,7 +77,7 @@ python build_efi_cfg() {
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
+        bb.fatal('Unable to open %s' % cfile)
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
@@ -93,14 +93,14 @@ python build_efi_cfg() {
 
         overrides = localdata.getVar('OVERRIDES', True)
         if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
+            bb.fatal('OVERRIDES not defined')
 
         entryfile = "%s/%s.conf" % (s, label)
         d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
         try:
             entrycfg = open(entryfile, "w")
         except OSError:
-            raise bb.build.FuncFailed('Unable to open %s' % (entryfile))
+            bb.fatal('Unable to open %s' % entryfile)
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
 
-- 
2.7.4


