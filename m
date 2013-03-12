Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFNZz-0007jH-Hz
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 12:41:22 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so748240daj.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=zkUZW3aOt7zGt13V9cERaUlVEstJoxoIKz5vsMBvluY=;
	b=tz5jBRP4QtyjJLs3IuI+5UcL4dquZtM1JuaLfQCUqMoxwij2St+tgF5Z+l2ey2AUwE
	bVXpp4H/hlkiXNmcSUcgKWrJYd1S10TxN5JdGprWKYmpCN6RrJz1Y8KdU44EaeCJF3Mg
	v561d/9UOtlBD1FSlMAeYuiEIrGXHaScmzajZYy4HZ5/jGMEpcFoABjBtfszgYAt0d+5
	v+Ol9+YPPb3x4D0dkBkNdmE11x/JSgkB0oWxsvEuavvtuw+bOPXCefiVFBGcO655Sqvc
	xN1hXWuvgogrMaq3sIMM0r+DKs5erywAt6IbdJxpXKS1mEBwPc1P9zPkr2hSsn+lGuMe
	0MSw==
X-Received: by 10.68.197.41 with SMTP id ir9mr36909720pbc.87.1363087475528;
	Tue, 12 Mar 2013 04:24:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	rr14sm24621178pbb.34.2013.03.12.04.24.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 04:24:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 12:24:32 +0100
Message-Id: <1363087472-32085-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] package.bbclass: add debug-without-src PACKAGE_DEBUG_SPLIT_STYLE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 11:41:29 -0000

* same as original and default version, but does not package source files in PN-dbg

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1625ebd..f3a6bc7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -682,6 +682,12 @@ python split_and_strip_files () {
         debugdir = ""
         debuglibdir = "/usr/lib/debug"
         debugsrcdir = "/usr/src/debug"
+    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-without-src':
+        # Original OE-core, a.k.a. ".debug", style debug info, but without sources in /usr/src/debug
+        debugappend = ""
+        debugdir = "/.debug"
+        debuglibdir = ""
+        debugsrcdir = ""
     else:
         # Original OE-core, a.k.a. ".debug", style debug info
         debugappend = ""
-- 
1.8.1.5



