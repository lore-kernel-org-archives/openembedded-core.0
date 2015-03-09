Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 32A11738F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 12:56:44 +0000 (UTC)
Received: by igkb16 with SMTP id b16so20457359igk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 05:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VoQYF+AkLbVmtsfWMG0D4arI1v7dF0Fntde+bT0DkdY=;
	b=MaRAq7NYmc8DlSd77EE7SDUDT9cUWkm4bb0XsDscCjWeIg5gmddTfTFDXgqaHI7W4x
	wji8ryGgtFW8T1oL2Ee4KElO1JLS2mA3rUW3zV/yzIUeJwT1MaeFyZFYQsNBUcxSoRuy
	nRiwGweVaQHFc8t1ptKPOZUDGLrpZCDSXXhmESwLi2K32TIGJS67eHfEDNuhRrHCGG1G
	KCn18PTU1lk1+Q/NnuiA6BTEmS52BHOuj+zGkYsa5i/p/4PQbnMClWvFplfGInk7LbuZ
	OlTEp6g/Dr2/0HI8vWQZ9ERaX6yhgWuxaWkq8369vCXbVONJzHHSRUz2IS0Qf2rFNQ7O
	sN1Q==
X-Gm-Message-State: ALoCoQmfHTlXH+EtcSylrqGwYvZEoSMHCXyqMcPvHvG0M23+WIsHxWVPL9jFeiIzFUXfsdTU7vTl
X-Received: by 10.42.110.10 with SMTP id n10mr26710625icp.65.1425905805569;
	Mon, 09 Mar 2015 05:56:45 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D980.dip0.t-ipconnect.de.
	[93.232.217.128]) by mx.google.com with ESMTPSA id
	b137sm1952925ioe.36.2015.03.09.05.56.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Mar 2015 05:56:44 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 13:56:39 +0100
Message-Id: <1425905799-9101-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Mon, 09 Mar 2015 12:56:45 -0000

It depends on the diligence of the person running the combo-layer tool
whether the Signed-off-by line added to each commit actually indicates
that the person was involved in validating the change.

When the import is purely automatic, it is better to not add the line,
because the history is more useful without it (searching for the person
really only lists changes he or she was involved with) and it would
be a false statement.

This needs to be configurable, achieved with a new global "signoff"
boolean property in combo-layer.conf, in the "DEFAULT" section.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer              | 4 +++-
 scripts/combo-layer.conf.example | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 19d64e6..60ead5b 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -75,6 +75,8 @@ class Configuration(object):
             self.parser.readfp(f)
 
         self.repos = {}
+        self.signoff = not self.parser.has_option('DEFAULT', 'signoff') or \
+                       self.parser.getboolean('DEFAULT', 'signoff')
         for repo in self.parser.sections():
             self.repos[repo] = {}
             readsection(self.parser, repo, repo)
@@ -471,7 +473,7 @@ def apply_patchlist(conf, repos):
                 if os.path.getsize(patchfile) == 0:
                     logger.info("(skipping %d/%d %s - no changes)" % (i, linecount, patchdisp))
                 else:
-                    cmd = "git am --keep-cr -s -p1 %s" % patchfile
+                    cmd = "git am --keep-cr %s-p1 %s" % ('-s ' if conf.signoff else '', patchfile)
                     logger.info("Applying %d/%d: %s" % (i, linecount, patchdisp))
                     try:
                         runcmd(cmd)
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 010a692..8ad8615 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -1,5 +1,11 @@
 # combo-layer example configuration file
 
+# global options
+[DEFAULT]
+
+# Add 'Signed-off-by' to all commits that get imported automatically.
+signoff = True
+
 # component name
 [bitbake]
 # mandatory options
-- 
2.1.4


