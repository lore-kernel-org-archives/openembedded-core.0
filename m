Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B7D776F770
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:39:18 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so3660650wib.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/+KgYTUGKLxlCzsxGRlbD+Z9ZbRNXZthSBzTL04yUd8=;
	b=BeeUcT0t5m7Pu3RfmT8H/4BgXHiBBgAYA5fGaVbhoxm1D1xldAk+w0Ee1zm0QDcyl0
	cAsWbZq+dBZCpg542aWJlw0pE8wLynqjmyySDAkRy8maAEHsA2/kX263qusoLmnjOkY0
	AvXRGjs9LsKYGnsEplSffUESZ6Ih21mlGzV5RffypnsGMO01EVxWOPEiY+ejKclV62JD
	yPZJU0OLoL2hNAfzAI5cJC2mp+JDlyYkhywT+ZtcWuWV1r8nuZRnOxvctrlKvXX0uEQ0
	F21QHEPRwp2rpVhiB2L4bYvhj2J7zDuoqNzEqGR97DHQMZOM3FZG3BX3s0xkVmR0O1Dr
	P1aw==
X-Gm-Message-State: ALoCoQmEmuA1KUX4FYUK4eTJnT1Jo1DRPTzPzf94Io6lIRPkgke8bdo/b3o+QbgDi3bLb2vqmTK8
X-Received: by 10.195.12.14 with SMTP id em14mr15769420wjd.15.1396283958997;
	Mon, 31 Mar 2014 09:39:18 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	xs1sm13256086wjb.27.2014.03.31.09.39.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 09:39:18 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 2BDD85601EB; Mon, 31 Mar 2014 17:39:20 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 17:39:18 +0100
Message-Id: <7445f7145ee425302da5b9d1ca77e3448899b78d.1396283886.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1396283886.git.alexandru.damian@intel.com>
References: <cover.1396283886.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/2] sstate.bbclass: update missed sstate event
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
X-List-Received-Date: Mon, 31 Mar 2014 16:39:21 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This is a patch to update the missed sstate event with
info about the sstate files locations that were found.
It's needed as to display the found file in the toaster ui.

Also fixes a bug where a setscene task may have appeared in the
missed list even if it was found in a sstate mirror.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/sstate.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 25b8d72..f761909 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -690,6 +690,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 ret.append(task)
+                if task in missed:
+                    missed.remove(task)
             except:
                 missed.append(task)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
@@ -697,9 +699,15 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     inheritlist = d.getVar("INHERIT", True)
     if "toaster" in inheritlist:
-        evdata = []
+        evdata = {'missed': [], 'found': []};
         for task in missed:
-            evdata.append( (sq_fn[task], sq_task[task], sq_hash[task], generate_sstatefn(spec, sq_hash[task],d) ) )
+            spec, extrapath, tname = getpathcomponents(task, d)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz")
+            evdata['missed'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
+        for task in ret:
+            spec, extrapath, tname = getpathcomponents(task, d)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz")
+            evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
     return ret
-- 
1.9.1


