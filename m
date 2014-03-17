Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDE96F719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:04:12 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so4644313wgg.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=b6HyyxbGL71FE2569yyhtjmWzRXbLdMWkR6QFcZO4aw=;
	b=SY2YmlBTd1Jp9OryShDWIVyMm4lSxZ51JPkJamRk9wH4mkfBnsDvXRUuzLM1w38ZLI
	dRX60WAC6dbxf1cY3cob1pJ2t9uH0g1OZBKrMJZ/5lKJK+SgFwI3UOBj8uzuo9G2LQzo
	vaZCjsmSOnyi01ALOTp2JuKeeQrKToTBEPviPM7Y3QOkXTByDe8wh/6UgdNiK+kvBqPu
	bufMOpL90FpE+4AO9TPr2MgbRe3q6+y8WcVcAuQRV8su/TzNNjR96bU8RMo3MEPKQwxu
	baQLiwzxUq/UM6zeH4ZsrYz3W3vInqzntuvDAmOmpd6xQ6pMMyjKD21oIdYtS2gprBwI
	l7wA==
X-Gm-Message-State: ALoCoQlLeU+dCJsPJ8pi0p8KGGV9/kph/ZHcnogxcYu2E+BQjvpq4YWjQmukZzbuasQwFU6EjOCs
X-Received: by 10.195.13.103 with SMTP id ex7mr18762086wjd.3.1395068653351;
	Mon, 17 Mar 2014 08:04:13 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	jw4sm39012064wjc.20.2014.03.17.08.04.11 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 08:04:12 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 83C65560DD7; Mon, 17 Mar 2014 15:04:11 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 15:04:09 +0000
Message-Id: <609daac07f29f0e935ed8ac3239430981305d19e.1395068545.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
References: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1395068545.git.alexandru.damian@intel.com>
References: <cover.1395068545.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/3] sstate: list missing files for toaster
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
X-List-Received-Date: Mon, 17 Mar 2014 15:04:13 -0000

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
index 03ee820..25b8d72 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -625,6 +625,7 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     ret = []
+    missed = []
 
     def getpathcomponents(task, d):
         # Magic data from BB_HASHFILENAME
@@ -646,11 +647,13 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
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
@@ -688,9 +691,17 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
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


