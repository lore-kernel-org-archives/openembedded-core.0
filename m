Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 00E73789BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:55 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c14-v6so9049707wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AOGt9X+4dLMgSRwTSQEjLNzWhx33yshbzNduJnpB4T8=;
	b=YKCLg56casFUTz5vnUyd4pxb5qeEYvnAHOAVSfnYc/mwpFV0naI8+gkfj+zPNE+NFy
	kGnREFbb3ebTIslk9vvXKYKnQWMhgxRlpSXPKaiST9IxuC+2BqqzSaRc62MZrigjDXR+
	qv29hUrcV75a11szz3mnK3tpCkZ9p+UOC6Sjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AOGt9X+4dLMgSRwTSQEjLNzWhx33yshbzNduJnpB4T8=;
	b=qgd7/Jvfs97rMeMhgbFD9Cr0486xret7W11bzGDsrj1XJScFhkjB6DdohaquEdQAFO
	UE7eJ2Oh7h4onm5UHTwBPMnWIGP+2H63TEJ4U3/01APHPBKTCRp2WcsWJN/dKBTAyw5/
	dRzc/gL03f4AVzZ00DPBepDCUAc4nUyfnnzXML3U+t8jMLMCnYuYaY59zQO5wiX7VC/2
	mrU6sVXB0/SXsO7+f0d6dMH6eTkqshgUSoWz8j2tVELycDtkNp1j/lXE6K4TyL25hJCi
	qS8n0/MVDTyQcC/yF+cCJKMoR4Aazzu8zIVNGOWpAlhhneQDfllaajqUGBV5hjb76AFo
	Fqkw==
X-Gm-Message-State: AOUpUlGqRrGLdpDOPaufkarIPey/H//ZxgYRX3xRiSkLcK1O77PFCyAA
	Wpfk5hyxtG/d3ee2jBpAN9UenLly3apVQg==
X-Google-Smtp-Source: AAOMgpehSZu2ErArntTWKbZz+SAywX6NEF8Y8oLsvS1NbT1MH4gXX5k8I/3THKK0aiyvLjeHwLjHNg==
X-Received: by 2002:a1c:6f44:: with SMTP id
	k65-v6mr1121115wmc.19.1532083196520; 
	Fri, 20 Jul 2018 03:39:56 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:43 +0100
Message-Id: <20180720103948.30044-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/10] package: Don't use subshell to execute file
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:56 -0000

We don't need any functionality from the shell here, its just extra fork
overhead. Therefore remove it and use subprocess directly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 8 ++------
 meta/lib/oe/package.py       | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7a49e4f3516..02914b52bb1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -888,6 +888,7 @@ python fixup_perms () {
 
 python split_and_strip_files () {
     import stat, errno
+    import subprocess
 
     dvar = d.getVar('PKGD')
     pn = d.getVar('PN')
@@ -933,12 +934,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
-
-        if ret:
-            msg = "split_and_strip_files: 'file %s' failed" % path
-            package_qa_handle_error("split-strip", msg, d)
-            return type
+        result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
 
         # Not stripped
         if "ELF" in result:
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4f3e21ad40f..8a303106a9f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -56,7 +56,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
     """
-    import stat, errno, oe.path, oe.utils, mmap
+    import stat, errno, oe.path, oe.utils, mmap, subprocess
 
     # Detect .ko module by searching for "vermagic=" string
     def is_kernel_module(path):
@@ -72,11 +72,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     # 16 - kernel module
     def is_elf(path):
         exec_type = 0
-        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
-
-        if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
-            return exec_type
+        result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
 
         if "ELF" in result:
             exec_type |= 1
-- 
2.17.1


