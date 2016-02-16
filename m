Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9270373163
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:27:23 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a4so108223443wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zdwKvKJq7Qe4rSCw+lCXZrsiEzF5VlEj8ui1gm2XoJE=;
	b=w9z6oaHCkFZRgE05Kc443o8C3+N3uovyfNktg6hsuxG3Fuas/Z1kaD6MpDARuhwKjR
	2SudE9WTpvEgmhH5k2/eSFnXd429kRfSbvoqc+QYMfDXMcRCDCRdkqSUhycUkEbHze/E
	r9vlAPffje13oKugVmU5uYF2pr20HxEx3UKu2O2AavTItPMwYCK5itFpln4IddIlEByK
	+ss6OuP4tnTWmTSnZyIrzcPbzAUO4653bbB6rmjlyPeUQIHl+WelLDfA5BlGrT3pYieV
	7XSoqCftgMsYSm43UztaeoiY7FWt2+nqLJQ5NMTevfenlJieK1zWcl8kVqx7ugJi4yYh
	5DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zdwKvKJq7Qe4rSCw+lCXZrsiEzF5VlEj8ui1gm2XoJE=;
	b=OhBRGbDOP4UFTtsAYBCaVpB7SD2HwShrLADFTEEjBFWd1EPRyMpP9ZLf6V+MC+nHZS
	AaTGUlADVqmKcoNvy6oiLXefeTbJyVCvYhbSRXVZ3UfXU2Zs1ZxPeGLdSElO2Hxm4HYs
	/o/WaNXIICqNbvRyRjGEi60IkRcdby4jrUKvxPLdRlBlOtmNUo55WbRCzs1itNTPvknd
	1wTlm4/624VunWcd2saVQ4/5igXPSlEJSHhWZGa+IX7qo3EIf0FNllZCdyNLSJql8dpl
	I93NHb4IxHLh6SBYGP87dzHE99eOxSkLu/JWGbjlxBBqb+DLKOQQv27pDlrynGR1DSxK
	yTIQ==
X-Gm-Message-State: AG10YOTCoAvvbps+ZzcTbyBf5W0OjDIb5OuNyp4f6YjU9V10sFu6+Ero0cR8pZbDJu74v1C7
X-Received: by 10.194.189.7 with SMTP id ge7mr23023156wjc.72.1455640043730;
	Tue, 16 Feb 2016 08:27:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m63sm21350260wmc.3.2016.02.16.08.27.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 08:27:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 16:27:20 +0000
Message-Id: <1455640040-8949-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1455640040-8949-1-git-send-email-ross.burton@intel.com>
References: <1455640040-8949-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] insane: wrap autotools checks in inherits_class(autotools) checks
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
X-List-Received-Date: Tue, 16 Feb 2016 16:27:23 -0000

There's no point doing the autotools sanity checks if a recipe didn't inherit
autotools, so check the inherits before doing the checks.

Also pass -F (fixed strings) and -q (quiet) to grep.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index aef08fe..241ad08 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1148,19 +1148,21 @@ python do_qa_configure() {
 
     configs = []
     workdir = d.getVar('WORKDIR', True)
-    bb.note("Checking autotools environment for common misconfiguration")
-    for root, dirs, files in os.walk(workdir):
-        statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % \
-                    os.path.join(root,"config.log")
-        if "config.log" in files:
-            if subprocess.call(statement, shell=True) == 0:
-                bb.fatal("""This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
+
+    if bb.data.inherits_class('autotools', d):
+        bb.note("Checking autotools environment for common misconfiguration")
+        for root, dirs, files in os.walk(workdir):
+            statement = "grep -q -F -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s" % \
+                        os.path.join(root,"config.log")
+            if "config.log" in files:
+                if subprocess.call(statement, shell=True) == 0:
+                    bb.fatal("""This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
 Rerun configure task after fixing this.""")
 
-        if "configure.ac" in files:
-            configs.append(os.path.join(root,"configure.ac"))
-        if "configure.in" in files:
-            configs.append(os.path.join(root, "configure.in"))
+            if "configure.ac" in files:
+                configs.append(os.path.join(root,"configure.ac"))
+            if "configure.in" in files:
+                configs.append(os.path.join(root, "configure.in"))
 
     ###########################################################################
     # Check gettext configuration and dependencies are correct
-- 
2.7.0


