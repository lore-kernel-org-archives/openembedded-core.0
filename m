Return-Path: <alexandru.damian@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 778B86F77C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 18:28:26 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id x48so3607829wes.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 11:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tMo6kPZDwz6KpGamdvSukOF0bbRNw0TQksYwn3EKeq8=;
	b=mtYeOch5YEwntaYeGwvgqe25h9VYGTBGs6cA5RmTy2fidiAf2qIshXPyhNbra1cnlp
	9uyg+12/7RL6VIxWc37vLpoUT3h3wtGFVaWctAZgL7OrXEnh+UU9adVb8c9zRx/uvPsb
	79g/0ERV7JPeZTQfdoyyqt20ao5oNIOAVYj/sLamvgskdQerC9pe43e6FWLZm31bWe8J
	nqTGHU6sFVZG/rtsECkYQFvrO5OqjYtYzkEmM2sHPAiaho2BvPmA/T2v5gL3ec5exitr
	/EvTEYwunxkqlekXClYPjiNCwst55FXlPL7BccshTPpe7InQ78S8EWYnydwTB6suoXdv
	4izQ==
X-Gm-Message-State: ALoCoQktykGrDMN08/gDK5RCArIJ33EMsbEveWKuvMMJcVq2AoK21uR4OfhisHirllyNjnWosFnP
X-Received: by 10.180.24.134 with SMTP id u6mr17894407wif.41.1395685707121;
	Mon, 24 Mar 2014 11:28:27 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id jd2sm41462624wic.9.2014.03.24.11.28.24
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Mar 2014 11:28:25 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 27CF0560D87; Mon, 24 Mar 2014 18:28:24 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2014 18:28:22 +0000
Message-Id: <1395685702-30537-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/1] toaster.bbclass: update buildstats event data
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
X-List-Received-Date: Mon, 24 Mar 2014 18:28:28 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

We add the PN to the buildstats event data in order to
proper select database task when multiple similar tasks
are executed for the same recipe file.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 563b1f7..f55a4d7 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -179,7 +179,7 @@ python toaster_collect_task_stats() {
             bn = get_bn(e)
             bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
             taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
-            fout.write("%s:%s:%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task)))
+            fout.write("%s:%s:%s:%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task), e.data.expand("${PN}")))
 
         bb.utils.unlockfile(lock)
 
@@ -222,8 +222,8 @@ python toaster_collect_task_stats() {
         events = []
         with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "r") as fin:
             for line in fin:
-                (taskfile, taskname, filename) = line.strip().split(":")
-                events.append((taskfile, taskname, _read_stats(filename)))
+                (taskfile, taskname, filename, recipename) = line.strip().split(":")
+                events.append((taskfile, taskname, _read_stats(filename), recipename))
         bb.event.fire(bb.event.MetadataEvent("BuildStatsList", events), e.data)
         os.unlink(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"))
 }
-- 
1.8.3.2


