Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 675B16FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:36:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n5so86052472wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qbFyvAZxKkCgMdBU4MA7PlrVI9+7TXSLLN60Sul0JOg=;
	b=g+6b7RS7JEHdAtRRaDX9t+iSQ+S499Ru16qfyYM/RjDFculZl5O3SYBJQQU+uW15iP
	OZ2sPPnRdqi7E1CO3x92kK9H/POX0mQF8yEzRFFM0F2jV4H0xhE38qZKN4zcacRtRtAh
	/A3I5WBdokgTkcwakVz5odmfwStUv3txlXRhrqw+04ESP9TfDisaGOJscMpHXlhzY1WS
	Cdn+rb9YUpobX0s/aiI2DDQ4VGv/nc3C+YD26lFR9fNZfrgxeMEWLgZKcZCj6lVSVab3
	1uhHbjwzqed5t7T6sRZGS6MhUyM6p5SofUm4YwSggKlgtZkul5OmpGt18WqeKzBpfKOP
	GQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qbFyvAZxKkCgMdBU4MA7PlrVI9+7TXSLLN60Sul0JOg=;
	b=fpPPUkf1nCPmOP0SR9CMj4g/8ALFxVRyV7jgIjtbI95FHKsKnZ8mESyI+CAuG9ptRi
	rog1a0sWjchPHTAi8jC9V9rQU1WHtWqtd/kdwA9mEb1cschcAPIPPyyfAGS47sB5cTfI
	X5yez23Vuvw8zZQ7jdZ+uRs9K5yUlP2KAp/JgprEljY3scAbTcEPODfOrQtM1SIgnqd7
	VS7NRLxrkC/l/HNpEmwe/tPH9ZXYPBHPzifo8tNd4BrJ48M2wsUzS75YmYAF3x7rxnzU
	G8dJttzjLlzR5FxcQjpCO+XF5vbN0ZhXPxPep5r5ok4J8jqia27PeNttPr7y4HjcNK00
	O27Q==
X-Gm-Message-State: AG10YOR/dOcqhSMwVUCPxTD8jmRXeWaN2r7kEXWN6qaZTFEidEIk8ZnJ4nWbiZNAmLkEYO98
X-Received: by 10.28.218.81 with SMTP id r78mr19717502wmg.91.1453736164189;
	Mon, 25 Jan 2016 07:36:04 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w23sm16774624wmd.1.2016.01.25.07.36.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:36:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 15:35:57 +0000
Message-Id: <1453736157-21837-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453736157-21837-1-git-send-email-ross.burton@intel.com>
References: <1453736157-21837-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] uninative: handle UNINATIVE_URL being file:///
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
X-List-Received-Date: Mon, 25 Jan 2016 15:36:04 -0000

If the local fetcher is used then files are not actually fetched into DL_DIR, so
check if this happened and if required add a symlink to the real file.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 3383e01..38c05df 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -16,11 +16,13 @@ python uninative_eventhandler() {
     loader = e.data.getVar("UNINATIVE_LOADER", True)
     tarball = d.getVar("UNINATIVE_TARBALL", True)
     tarballdir = d.getVar("UNINATIVE_DLDIR", True)
+    tarballpath = os.path.join(tarballdir, tarball)
+
     if not os.path.exists(loader):
         import subprocess
 
         olddir = os.getcwd()
-        if not os.path.exists(os.path.join(tarballdir, tarball)):
+        if not os.path.exists(tarballpath):
             # Copy the data object and override DL_DIR and SRC_URI
             localdata = bb.data.createCopy(d)
 
@@ -32,13 +34,15 @@ python uninative_eventhandler() {
                 bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH", True))
 
             srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
-            dldir = localdata.expand(tarballdir)
-            localdata.setVar('FILESPATH', dldir)
-            localdata.setVar('DL_DIR', dldir)
+            localdata.setVar('FILESPATH', tarballdir)
+            localdata.setVar('DL_DIR', tarballdir)
             bb.note("Fetching uninative binary shim from %s" % srcuri)
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
             try:
                 fetcher.download()
+                localpath = fetcher.localpath(srcuri)
+                if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
+                    os.symlink(localpath, tarballpath)
             except Exception as exc:
                 bb.fatal("Unable to download uninative tarball: %s" % str(exc))
 
-- 
2.6.4


