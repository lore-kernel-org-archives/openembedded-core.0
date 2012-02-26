Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Z09-0007VH-SF
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 08:58:37 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so159520eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 23:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.38.193 as permitted sender) client-ip=10.14.38.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.38.193 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.38.193])
	by 10.14.38.193 with SMTP id a41mr5341966eeb.125.1330242615533
	(num_hops = 1); Sat, 25 Feb 2012 23:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+bDJF9mK8WhkQwKenSH+M/a7rFDuEw3/D3xEKzBrktk=;
	b=lIXZWMYh4//YzC1hcojXNd1ZA0kh5ZwWTRmWJCmGbGCGk/p7m6djeJxVIUVhskCbKT
	HwKyzFKwEORKsE/fSDunwDl618oCUUodA7mOtw2YJxGTTv8Aty3JQk7MXWG1etkSuudR
	fFy7ncUngqqeyAqAnyjtlY2202VU9jm11IxAw=
Received: by 10.14.38.193 with SMTP id a41mr4026999eeb.125.1330242615441;
	Sat, 25 Feb 2012 23:50:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm41702154eem.11.2012.02.25.23.50.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 23:50:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 08:49:43 +0100
Message-Id: <68fa8e2238d9161bc62950ab3c2cd2078f117f45.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330242184.git.Martin.Jansa@gmail.com>
References: <cover.1330242184.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/5] sstatesig: add SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS option to exclude well defined recipe->dependency
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
X-List-Received-Date: Sun, 26 Feb 2012 07:58:38 -0000

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



