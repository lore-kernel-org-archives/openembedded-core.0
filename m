Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id CB4446EE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:26:34 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id m10so5189346eaj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 04:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5ItJg091v1SZIzRKqaXipTKb+edzdwS36zjtctiV0kc=;
	b=xQ49oUjHwcNYK72o/QbrhbJzmHURltBoCZR1Pdfczs02ZjZTK68VqmUrWh/B4rZj7z
	ulA0phpsh5UjCQVItutKTn2V6qorvtr1yEdYrmae4p7uUrWJeiZVXxInsDWAjn2RkIcJ
	tge1WFFF4c8/z+R8At3pFZa4QH2VnbjS5U81hnWCBW4dV6mifj6eKyy0sHwpxVG6BHxh
	scJO/XjV6JrArNgvm/x+gyTMBTIcP8ht+jeczEdv7v+dlekRR96U65BItA2hv6Y0ue0L
	8DtR/0xMUSq7dgydNAiK1omaoAl6w0QzzMLEtg5dbUVMJqBzUywd+z6W4YMNqI6j2Wd4
	DgFA==
X-Received: by 10.15.52.66 with SMTP id o42mr3245574eew.89.1392726394741;
	Tue, 18 Feb 2014 04:26:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm69463541eeg.5.2014.02.18.04.26.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 04:26:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 13:27:02 +0100
Message-Id: <1392726422-6634-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] package.py: log rpmdeps call
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
X-List-Received-Date: Tue, 18 Feb 2014 12:26:35 -0000

* I've noticed errors like this in log.do_package:

  DEBUG: Executing python function package_do_filedeps
  sh: 1: Syntax error: "(" unexpected
  sh: 1: Syntax error: "(" unexpected
  DEBUG: Python function package_do_filedeps finished

  which are actually caused by some filenames included in package
  containing '()' characters

  Maybe we should change meta/classes/package.bbclass to
  fail when some filedeprunner call fails like this and fix
  filedeprunner to escape '()' and other possibly dangerous chars
  it's called like this:
  processed = list(pool.imap(oe.package.filedeprunner, pkglist))

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9a0ddb8..1f78a8d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -89,7 +89,9 @@ def filedeprunner(arg):
 
         return provides, requires
 
-    dep_pipe = os.popen(rpmdeps + " " + " ".join(pkgfiles))
+    rpmdepscmd = rpmdeps + " " + " ".join(pkgfiles)
+    bb.debug(1, "runrpmdeps: %s" % rpmdepscmd)
+    dep_pipe = os.popen(rpmdepscmd)
 
     provides, requires = process_deps(dep_pipe, pkg, pkgdest, provides, requires)
 
-- 
1.8.5.3


