Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6EC16AD68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:45:03 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id u57so3129671wes.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OtDSlGv7riFvCQ8ReP37tdO+WPf6ZAzymCjnOO64sPo=;
	b=DeOBWIf396bcqlakBh828GrTSMGWol/Km6onxXrmsS4kUTXLTcIvDz6r05usBVUMYk
	CIvzNYFrdc9q/c2rvbjW59IMJAX4zDm1P8p+MugtXSzm05equqSe/HB7EzLFK730NLYp
	nEO6phd0M8QlfkO/6nK3S5LBkFyqhcqW18DyObm59Gv1pAb7Yjj9o3d7zd7FBOn5jbrx
	v6B6UE73fyeORwqpyIhPzVHYDw77Vn7tVj4OGXb53LBEul3efNfexxK6UNzKp4rxqETM
	qcWEeopKH0M44ZipEe8uucFg8eHL54mGGecRqCvzpM+eXLyAtZT+ppJ7d2ns1fN7FZle
	+Rkw==
X-Received: by 10.194.190.42 with SMTP id gn10mr6102439wjc.9.1402677904754;
	Fri, 13 Jun 2014 09:45:04 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 19sm6525759wjz.3.2014.06.13.09.45.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 09:45:04 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 09:45:05 -0700
Message-Id: <1402677905-15569-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402082874-12187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1402082874-12187-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH v2] buildstats-summary.bbclass: Import useful bbclass from meta-mentor
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
X-List-Received-Date: Fri, 13 Jun 2014 16:45:05 -0000

From: Martin Jansa <martin.jansa@gmail.com>

This class summarizes sstate reuse at the end of the build, so you know how
much of your build was done from scratch.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
v2 changes: obey SSTATETASKS, add file comment -CL

 meta/classes/buildstats-summary.bbclass |   39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/classes/buildstats-summary.bbclass

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
new file mode 100644
index 0000000..c8fbb2f
--- /dev/null
+++ b/meta/classes/buildstats-summary.bbclass
@@ -0,0 +1,39 @@
+# Summarize sstate usage at the end of the build
+python buildstats_summary () {
+    if not isinstance(e, bb.event.BuildCompleted):
+        return
+
+    import collections
+    import os.path
+
+    bn = get_bn(e)
+    bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
+    if not os.path.exists(bsdir):
+        return
+
+    sstatetasks = (e.data.getVar('SSTATETASKS', True) or '').split()
+    built = collections.defaultdict(lambda: [set(), set()])
+    for pf in os.listdir(bsdir):
+        taskdir = os.path.join(bsdir, pf)
+        if not os.path.isdir(taskdir):
+            continue
+
+        tasks = os.listdir(taskdir)
+        for t in sstatetasks:
+            no_sstate, sstate = built[t]
+            if t in tasks:
+                no_sstate.add(pf)
+            elif t + '_setscene' in tasks:
+                sstate.add(pf)
+
+    header_printed = False
+    for t in sstatetasks:
+        no_sstate, sstate = built[t]
+        if no_sstate | sstate:
+            if not header_printed:
+                header_printed = True
+                bb.note("Build completion summary:")
+
+            bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(t, 100*len(sstate)/(len(sstate)+len(no_sstate)), len(sstate), len(no_sstate)))
+}
+addhandler buildstats_summary
-- 
1.7.9.5


