Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6F33A6C9B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 17:33:11 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hm4so2662882wib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 09:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s/5Yd1h8lv4B7zsG9uhUn6n9UGt7J4cSiomE4qDNMrw=;
	b=juw1oYzNgNzfE9U5kE7nh8uqRayIwWsCUhHuS6Eukutob668PAzs4iiV+27bZdWd3E
	9dscpuF/s0rHqU4fi6oKms4HfQws/8djeo+XjZIMdwHOLhTz6o7ZZofdlK8GadKAG2Mw
	mb+DoW/x8p1LDt4eACFrG8ci6vaIjTcGFgHhlCpXZnEGZ8SGMYVUQCoKQ00jAP05ZK4o
	DpUh5JnKk6NZJngrq+cwJrOYzI8w1wEFtyD9yRVZRaxVL6uaVqZQWqh5CGRyOx+FQMRm
	V/EtU0QjpNZJu78xqcp8lrGCoI2W0RgaFl3how4V2gEIa00OFzQWm+DyLF2/yXWAQmC1
	eh/g==
X-Gm-Message-State: ALoCoQkENwf4L2S3aVaySyAFspUy+shqcPvUedG21cPYFKgJ8HXfH2FWcECb/qPXo9/59nSTwpQX
X-Received: by 10.180.163.206 with SMTP id yk14mr14072451wib.5.1392658391393; 
	Mon, 17 Feb 2014 09:33:11 -0800 (PST)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id q2sm38489473wjq.0.2014.02.17.09.33.10
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 09:33:10 -0800 (PST)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 7211F561700; Mon, 17 Feb 2014 17:33:11 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 17:33:09 +0000
Message-Id: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/1] sstate: list missing files for toaster
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
X-List-Received-Date: Mon, 17 Feb 2014 17:33:12 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Toaster needs to record the attempts to restore
setscene tasks that don't have a sstate file.

We build a list of tasks for which we can't find an
sstate file, and if we're running under Toaster data
collection, we send it off with a MetadataEvent.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/sstate.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f7bd117..f70c62f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -621,6 +621,7 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     ret = []
+    missed = []
 
     def getpathcomponents(task, d):
         # Magic data from BB_HASHFILENAME
@@ -642,11 +643,13 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
         spec, extrapath, tname = getpathcomponents(task, d)
 
         sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz.siginfo")
+
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             ret.append(task)
             continue
         else:
+            missed.append(task)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
 
     mirrors = d.getVar("SSTATE_MIRRORS", True)
@@ -684,9 +687,17 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 ret.append(task)
             except:
+                missed.append(task)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass     
 
+    inheritlist = d.getVar("INHERIT", True)
+    if "toaster" in inheritlist:
+        evdata = []
+        for task in missed:
+            evdata.append( (sq_fn[task], sq_task[task], sq_hash[task], generate_sstatefn(spec, sq_hash[task],d) ) )
+        bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
+
     return ret
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
-- 
1.8.3.2


