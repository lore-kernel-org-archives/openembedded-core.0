Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 40E0760746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 14:03:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n184so22706407wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=trC76LKFW/eB7KPYxcuPXHmXtLA4UAg2gnaiFsEK6V8=;
	b=W3kQQdqdjyunL1ugQg8LQnJzMDNliR6XXNLt7IGvilIDBKbVv0T+i/MUwlt5zlNfi5
	rse+6n38dK7eQ0h4+WRrnqMHZ/pUnA/K5iaV2OBaZt7VOLjfBto6lGJkIe6iRTWgKb3Y
	QssarmdYYypiv2bcgW+9J9fKGlh8DLwSWTlsGRaDaCWck2di9msaSEhfbZ6EhntN4mhH
	d95DLoWiNPpwVpTQ1MrbIKgKi0UoDVsWrf9vI4jxRhDVVv6JTwHYSumcnN3gOb0hMczV
	8vTNLRK3wcoyz5LjTu/b9fwQ+uf01CP8gaJs4lsm18/EOR5V+l9GkmpIMcAf+/PoQ49z
	PySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=trC76LKFW/eB7KPYxcuPXHmXtLA4UAg2gnaiFsEK6V8=;
	b=SqeOfQC+SKvMHXftVGw2sKn/f3MvStt5T+vTmCpXcs/zEdjccCWpJF5I/ZVViqR2av
	GGlb7jszc78WRHPE+MvWp2mFg5MeW0rsJdjuzSQxQv7N4J1rWNz8lSAdP09ORLTEwI80
	BCGHatQY9AB2nDJcAZGmhyxu7H23kCk0zPvz3Rb3yyB+oeWCSLOIvQBgEcPdgo71ORWh
	ySutYrHZrAJxdTaNG5DTRikGJuiCDYwgqRW9C90Her1piI0JOAb8UywhNMQ5MjtQVRQN
	i7OLKHLM31VwR0ujt3RFGzNTUr8ddUk9sPPfqtyPtnfatdPzt52q3vj4GafM2ulkySFR
	BFxg==
X-Gm-Message-State: ALyK8tJ2FP1opKRAvUA19cdROMY6/kgxlr+9mXycxi7purf8p/H69dE35p6C0zunpFaQ8A==
X-Received: by 10.28.129.197 with SMTP id c188mr6963775wmd.46.1465913022308;
	Tue, 14 Jun 2016 07:03:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s125sm4282475wms.14.2016.06.14.07.03.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jun 2016 07:03:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 16:03:57 +0200
Message-Id: <20160614140357.6145-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] icecc.bbclass: replace os.popen with subprocess.check_output
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
X-List-Received-Date: Tue, 14 Jun 2016 14:03:42 -0000

* otherwise there is a lot of warnings about missing close on file descriptor

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e1c06c4..cb44007 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -47,7 +47,8 @@ def get_cross_kernel_cc(bb,d):
 
     # evaluate the expression by the shell if necessary
     if '`' in kernel_cc or '$(' in kernel_cc:
-        kernel_cc = os.popen("echo %s" % kernel_cc).read()[:-1]
+        import subprocess
+        kernel_cc = subprocess.check_output("echo %s" % kernel_cc, shell=True)
 
     kernel_cc = d.expand(kernel_cc)
     kernel_cc = kernel_cc.replace('ccache', '').strip()
@@ -220,9 +221,14 @@ def icecc_get_and_check_tool(bb, d, tool):
     # PATH or icecc-create-env script will silently create an invalid
     # compiler environment package.
     t = icecc_get_tool(bb, d, tool)
-    if t and os.popen("readlink -f %s" % t).read()[:-1] == get_icecc(d):
-        bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
-        return ""
+    if t:
+        import subprocess
+        link_path = subprocess.check_output("readlink -f %s" % t, shell=True)
+        if link_path == get_icecc(d):
+            bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
+            return ""
+        else:
+            return t
     else:
         return t
 
-- 
2.9.0


