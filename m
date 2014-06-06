Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 407226FC3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 19:27:41 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id f8so1563739wiw.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sS3BIGB6z8iQxhCm0rduei+ZjFyhmvuR5fom9VCP/5g=;
	b=krWn0rVxmq2BPANcdBEDdXkgHCx9Stf1Cr7pjvMUjeG6VUlPIHSbR1R715RQl1U0yy
	WuxffoYCAK4Vmv09jiRWVBNvFK7ocLy5xO5OfkeHvZ7vsawCXHSedVW2NG8guzhNm1qq
	ZdGL7mvdsSFHwuyAVFb72HaClX9kMDr3iXVhLm97F/oMG9tfEWyHqcpF8WV7dieRrGhy
	QvLw/MTEMdDnnfxwTP71RDnobCLaJ2LXiQSGeBHVPxKuXl01vzIMaEKRSrn+Qycn5j+6
	dbknl8GX9Psj/zOztNbiq8uM90PBUXgcnLx1UaFtrd3BPzg3G77XmYr++hk0MReFHy4r
	O2YQ==
X-Received: by 10.15.36.8 with SMTP id h8mr1668147eev.12.1402082861970;
	Fri, 06 Jun 2014 12:27:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cj41sm24815081eeb.34.2014.06.06.12.27.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 12:27:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 21:27:54 +0200
Message-Id: <1402082874-12187-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] buildstats-summary.bbclass: Import useful bbclass from meta-mentor
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
X-List-Received-Date: Fri, 06 Jun 2014 19:27:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildstats-summary.bbclass | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/classes/buildstats-summary.bbclass

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
new file mode 100644
index 0000000..3c02724
--- /dev/null
+++ b/meta/classes/buildstats-summary.bbclass
@@ -0,0 +1,43 @@
+# Imported from meta-mentor
+# http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/log/classes/buildstats-summary.bbclass
+# with following modifications
+# 1) when both setscene and normal tasks were executed, count it as no_sstate
+# 2) count do_populate_sysroot and do_packagedata tasks, because often we invalidate only runtime deps
+
+python buildstats_summary () {
+    if not isinstance(e, bb.event.BuildCompleted):
+        return
+
+    import os.path
+
+    bn = get_bn(e)
+    bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
+    if not os.path.exists(bsdir):
+        return
+
+    sstate_ps, no_sstate_ps, sstate_pd, no_sstate_pd = set(), set(), set(), set()
+    for pf in os.listdir(bsdir):
+        taskdir = os.path.join(bsdir, pf)
+        if not os.path.isdir(taskdir):
+            continue
+
+        tasks = os.listdir(taskdir)
+        if 'do_populate_sysroot' in tasks:
+            no_sstate_ps.add(pf)
+        elif 'do_populate_sysroot_setscene' in tasks:
+            sstate_ps.add(pf)
+        if 'do_packagedata' in tasks:
+            no_sstate_pd.add(pf)
+        elif 'do_packagedata_setscene' in tasks:
+            sstate_pd.add(pf)
+
+    if not sstate_ps and not no_sstate_ps and not sstate_pd and not no_sstate_pd:
+        return
+
+    bb.note("Build completion summary:")
+    if (len(sstate_ps)+len(no_sstate_ps)) > 0:
+        bb.note("  populate_sysroot reused from sstate in %d%% (%d setscene, %d scratch)" % (100*len(sstate_ps)/(len(sstate_ps)+len(no_sstate_ps)), len(sstate_ps), len(no_sstate_ps)))
+    if (len(sstate_pd)+len(no_sstate_pd)) > 0:
+        bb.note("  packagedata reused from sstate in %d%% (%d setscene, %d scratch)" % (100*len(sstate_pd)/(len(sstate_pd)+len(no_sstate_pd)), len(sstate_ps), len(no_sstate_ps)))
+}
+addhandler buildstats_summary
-- 
2.0.0


