Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Jiu-0007SB-8O
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 16:39:48 +0100
Received: by eekd41 with SMTP id d41so1598433eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 07:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.199.193 as permitted sender) client-ip=10.14.199.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.199.193 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.199.193])
	by 10.14.199.193 with SMTP id x41mr4097267een.29.1330183884455
	(num_hops = 1); Sat, 25 Feb 2012 07:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+bDJF9mK8WhkQwKenSH+M/a7rFDuEw3/D3xEKzBrktk=;
	b=F6OkPQHxR96jN0RBWuvro/VemKhr9xYVR6V12vUgE6Hq8HjXusOs2V6zF2cFj6cFBF
	6okr9ZtcfO8CGDIixQe3LRp7uZjS0H4nJj6GVML8uknf3w1Pzq0BPIqFljYE8+Wgix6G
	PyZ2lQGwfL0KdVxPRzZEmyes4M/494p90JNpQ=
Received: by 10.14.199.193 with SMTP id x41mr3062265een.29.1330183884372;
	Sat, 25 Feb 2012 07:31:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm25475544eeb.1.2012.02.25.07.31.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 07:31:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2012 16:31:14 +0100
Message-Id: <1330183874-24088-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] sstatesig: add SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS option to exclude well defined recipe->dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Feb 2012 15:39:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/sstatesig.py |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 7b80c18..1c25823 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -33,6 +33,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     if depname in siggen.abisaferecipes:
         return False
 
+    # Exclude well defined recipe->dependency
+    if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
+        return False
+
     # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
     # if we're just doing an RRECOMMENDS_xxx = "kernel-module-*", not least because the checksum
     # is machine specific.
@@ -51,6 +55,7 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
+        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
@@ -59,6 +64,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasicHash"
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
+        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
-- 
1.7.8.4



