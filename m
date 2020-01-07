Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 80AED6D6F5
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:38 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id s7so8574155pjc.0
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=74rCtwQtiSnwIRYp71g7mA1/bolwhrIDKcQq2jHNBn4=;
	b=JlkMKsixXNP+sYn4U8cQTM0nEPmiFEoC9yq8j1IjY8Dv3S8Bgv1gvWwxVHSm7F+LMx
	Dh7CG5oY6F/TS1x+bHO8iAj+l048jYAHYNK1S1xWRiCB27aoOd6FIFxrQtejjteR+i1l
	iuJy1BHy3QSb0vYgomYMq15MMxCFAYClYXX6BLcaRxMZ5AQJhhT9ff8GegMHKUkpu0h1
	Dgk1jDV8d0sxyDqdy7aB4d4xEK0cVF4su1jCz4+4MMj0+w7a8PwlyhcKJkA/Iiu2VQv/
	n+vjlpA6MeoK1hDkwJVZzh9n9iuGa49Y4hy9S9okORGkaIzQC3DT/ChoAJwiR+ylCuDz
	+D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=74rCtwQtiSnwIRYp71g7mA1/bolwhrIDKcQq2jHNBn4=;
	b=ihXDLL6qKHMlmybvxugWHxd8ccVO+NjcZOvQzCO6WydWHnCgmVMU4MV/qeMmCloAs5
	zRbTnb7RZtx8wqOpzjj2ra4VB4MvVGL9e3QbI+BEFJ05p4PZFE4httOTbjhsp4KP82iE
	VG0AYiOKeqmKv4EN6oeJQ7AgeZ4x8KDqaMl3ahtPlpSHJy4PuS7/VdPrp3VTow0vU5dq
	3QAgZwEiOGGUhei3Zbbb84D18lJr7sQGIv3jaPJD9WxM1NKmRcImY4hSrJByzTRgoamc
	m2nVbznv/oUV6CEQaCnTxK29ovZ5+0Z843+OboVvulf49VqLgO1iTuF1wn8/eUhEP3dj
	ru7Q==
X-Gm-Message-State: APjAAAXwSUPm0mwYreppZP+dxDJXt68uZqGFpXgfR9VmhdfJOS/MiYem
	qo6S2oyX/8swJwbHuniwUpSxL33u
X-Google-Smtp-Source: APXvYqyrFO8LEwTJPI7CZfJGsiXapqzblfaoQ4goJi3Ls3LdD1sHaCrzzuG+fj/DDX46Os5Eq+aisg==
X-Received: by 2002:a17:902:bb81:: with SMTP id
	m1mr106121198pls.92.1578364479535; 
	Mon, 06 Jan 2020 18:34:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.38
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:06 -0800
Message-Id: <a67bd96de2b253c1d4c3bd82120f28dee06a4bf6.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 01/28] sstate: Add ability to hide summary output for sstate
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its confusing to keep seeing sstate summary messages when hash equivalency is
active. This adds an option to control it. A default value is given which
maintains compatibility with different bitbake versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 038004866ff6650bcff7bb1bde36de6c0f451d29)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b47b9c23bf..64808f8e10 100644
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
2.17.1


