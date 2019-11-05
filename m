Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id EA18D7F8AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 11:56:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c17so13209844wmk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 03:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6YasS92qLN5c+UOicaMxyW7uYdTnz0KjEr24E3yrnJQ=;
	b=D4u/ZmhckXJLhx4wvB6R7ll6REv4gHr9NRVhyiyrNkvW8qX+N+2gn8wajPYaU9N0oX
	ovc7S8U3iEoyhWIxa2lgU7/UhgyPPBXOMEWWNdYwhKGOYLkgFp9EEtU61ABO04WzmNq7
	aXDWrTDc6PaWEdA8nhjbHNzZLhQ9V0ttkIN1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6YasS92qLN5c+UOicaMxyW7uYdTnz0KjEr24E3yrnJQ=;
	b=FC2j6/G7Mz/r4UORrt7tqnvJAAXi754ULPSpla9rWKg/dGpj8th8OdlVZMfZMhko6Q
	Ppt+Owzmp9w5UC8lCLUE7PwF7+jwp73EeERzbR80hgC1FPCCTI/1mUXba3A7bY8qQj0i
	gwimL2B9Q4up4FDWgr0pB8UKsvldi1qol139/3Hp7ZXHLO6F52qKRgW9uGye7Qxo4aev
	cMv2sSb4BCbFn/z9eDPcQg6VeFFfJnf5IvBPU2vGR+vXz/wH8q17Z23030pqlRQg0uTk
	wfI3ivloxHMfp0CSSud3A9eVT3sLcbNrNdWIwFKjXVm4X3rj9iKBG4CZflkrALO7yB5E
	vKqQ==
X-Gm-Message-State: APjAAAVK476bXiX2hA7FU8CcUsm36cNWSk5Y4AIegVBO33KafmWCg/PQ
	tXQS+mE6Z+LOBVOwjjs6dKkCKk2Yr5Q=
X-Google-Smtp-Source: APXvYqxBHLArJOJHOP4g3nZq4qzESe0X4l6QPJbFlEXnMjfkk3ms5HQftBq+HY/E3I2poRkTLjnafg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr3773204wmj.91.1572954992328;
	Tue, 05 Nov 2019 03:56:32 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm17947463wmb.45.2019.11.05.03.56.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 03:56:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 11:56:30 +0000
Message-Id: <20191105115630.12918-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sstate: Add ability to hide summary output for sstate
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
X-List-Received-Date: Tue, 05 Nov 2019 11:56:32 -0000
Content-Transfer-Encoding: 8bit

Its confusing to keep seeing sstate summary messages when hash equivalency is
active. This adds an option to control it. A default value is given which
maintains compatibility with different bitbake versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b47b9c23bf2..64808f8e105 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -818,7 +818,7 @@ sstate_unpack_package () {
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
-def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, **kwargs):
+def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
     missed = set()
     extension = ".tgz"
@@ -951,16 +951,17 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, **kwargs):
             evdata['found'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
-    # Print some summary statistics about the current task completion and how much sstate
-    # reuse there was. Avoid divide by zero errors.
-    total = len(sq_data['hash'])
-    complete = 0
-    if currentcount:
-        complete = (len(found) + currentcount) / (total + currentcount) * 100
-    match = 0
-    if total:
-        match = len(found) / total * 100
-    bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(found), len(missed), currentcount, match, complete))
+    if summary:
+        # Print some summary statistics about the current task completion and how much sstate
+        # reuse there was. Avoid divide by zero errors.
+        total = len(sq_data['hash'])
+        complete = 0
+        if currentcount:
+            complete = (len(found) + currentcount) / (total + currentcount) * 100
+        match = 0
+        if total:
+            match = len(found) / total * 100
+        bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(found), len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.20.1


