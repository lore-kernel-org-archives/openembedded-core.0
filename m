Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4156E650
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 14:48:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s9-v6so17730805wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=QdI+3ETRDj9COHUtlQCDa2k66YRjOmF4XuPfwHYILns=;
	b=PKP3PepW0W2+ULQgEGGmVQc373c0Diiz+LTct7yu0WH6Zfgexq2dWhKML5SBxNItiW
	gj/YMWwCEOWc+8AoJBiD1rCHzKJdL6H+SPrZO0vnY3MeUu8PG2kbjIevLoYhaSADXjE2
	tMdup2r0oIj8nUvYmn2CuqQtOTU6ru5454gYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QdI+3ETRDj9COHUtlQCDa2k66YRjOmF4XuPfwHYILns=;
	b=UOmyCOJ/n5MYq/pAhDnxgLPBYdiM1pte6cViVDL8bqx1UtEEHiTb6vhS+SLPeZLqDj
	/nJAwniQYMRJvgMtSmT2UCeQeq0gWiehWsST/yJqydT/sfFR5IgYBS8+33Ym5ICzBTKk
	46TEQEGU1zfMO0KluDVoyKiRhiRewvP+rNKRP/tTxX9zycjuw2gUS+OXhWjciiQFWD+k
	znRxTByLreDga1WgHKvlQKaJTjhB7ksLy1MjmM8eyM5+2HiCk9zSLx+6cXhNEWYgfKc9
	wpeMWHwPVjKKwHYucBiXPwwo+t/U1ZZRud61debbifP0HnprYk5skJEVEAjn8dT5zjZk
	Hj9w==
X-Gm-Message-State: AOUpUlEnV6/U9ViNm5VGeBy9R9oWf1DhryswT8ku3quiiRxA4yEzBmjx
	BnPpanKJslUnT5+zklTesMATmBIRw6o=
X-Google-Smtp-Source: AA+uWPwrTyt2QzJ3s6l3coRP87pGLfK2AOjrj+03WQZUGrrZI/O2WuB4qj91FQT/zYUdIHUCFPratg==
X-Received: by 2002:a1c:6585:: with SMTP id
	z127-v6mr1791265wmb.5.1533653325567; 
	Tue, 07 Aug 2018 07:48:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u14-v6sm1876290wrs.57.2018.08.07.07.48.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Aug 2018 07:48:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2018 15:48:43 +0100
Message-Id: <20180807144843.26064-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sstate: Add sstate usage summary to the build
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
X-List-Received-Date: Tue, 07 Aug 2018 14:48:45 -0000

Currently the user has no indication of how much sstate was already present
or that would be used by the build. This change adds some summary information
so that the user can see how much reuse is occurring. To fully work it
needs some extra information from a recent bitbake commit but this is
optional.

When combined with bitbake --dry-run this feature can be used to check
if sstate would be reused in a build.

[YOCTO #12749]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 350d3107f59..6743becf071 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -892,6 +892,18 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
+    # Print some summary statistics about the current task completion and how much sstate
+    # reuse there was. Avoid divide by zero errors.
+    total = len(sq_fn)
+    currentcount = d.getVar("BB_SETSCENE_STAMPCURRENT_COUNT") or 0
+    complete = 0
+    if currentcount:
+        complete = (len(ret) + currentcount) / (total + currentcount) * 100
+    match = 0
+    if total:
+        match = len(ret) / total * 100
+    bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(ret), len(missed), currentcount, match, complete))
+
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d)
 
-- 
2.17.1


