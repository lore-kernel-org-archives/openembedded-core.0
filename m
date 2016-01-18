Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E840D65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:26:07 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b14so131134575wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Z8LZL7pUx+7nsLjQexk78BBcROQLlKsTBysGYrWxGpA=;
	b=byOqku6vTomyt8b08RRuzj7/LT2WZ3XFCSEBpZYwmaIXj/6/4yhVs2QjgasHFjdJ/O
	9w/PKVOx3jdi5v7Zryuykgsf7WScugFGvbHdwsKvE3PuhIeHYq/N18vmWPlLMAAqZgJ1
	oHL+bd+u5mXMb5hXvu1KHBvibRBjOqbqY0loywhJdj2SVTX6idvZTk/BD/XjXbRBCn8W
	Lo7xukX5ZmMjd3e8TVqLG6zffEu1CqQ2d62UkHQb4a8vL8BK6F94V1qivsUl0NXUy4dX
	0urxI6wbeWGYP4hXZXOtKenY6kTo0Enj6cc9uYcZlxRUTcq1cMg42N2RWmLKQdxusa/X
	u8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Z8LZL7pUx+7nsLjQexk78BBcROQLlKsTBysGYrWxGpA=;
	b=LMLu84NOdJ7BjzfNTFA0fYWUflo80YZdxrz8r1nMaO7381qTZJ6tt9yYosbxYayp5L
	GRQLd3Se6ErhQwVXZp49oFfcrUPnofJISRQ89E9TQ5SOwte1qESz3J4jvhqyQJhb8ysI
	LjMfBUJFdRARlET66N/R6mFn5YwcV6JDcRjPn8C1NSC0RRtAAoLkeifspGEndbF1eLUT
	NBvLga79iv4ddY/J7nellbw+D3Bo4JaDSe/ek6PiWhV5T0z8M48pwmSyM7fDXQ6uwF8W
	7WRGptl2oMyuBP0Lu03FCTD2+0xpyaMmRhgaeZm4EC+KJ4VWJBqF8Kg+g4RYugmk0Djw
	VF1Q==
X-Gm-Message-State: ALoCoQkIjyJtM3rQ1NcSJG3tIpkQ7QAefoMRtqxv11lWsH1w2VqTCwfGI1Hp6/4kc7o47uskYgLhogMx224X/PEtxYcwUopalw==
X-Received: by 10.194.234.41 with SMTP id ub9mr25096177wjc.9.1453134367961;
	Mon, 18 Jan 2016 08:26:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t199sm16494733wmt.23.2016.01.18.08.26.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 08:26:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 16:26:05 +0000
Message-Id: <1453134365-26107-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] sstate: replace verbose manifest removal with a single count
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
X-List-Received-Date: Mon, 18 Jan 2016 16:26:10 -0000

If there are lots of changes between the previous build and the build about to
start bitbake will potentially print pages of:

  DEBUG: Stamp $BUILD/stamps/corei7-64-poky-linux/libdrm/2.4.66-r0 is not reachable, removing related manifests

Instead of spamming the console with this list, write the list of manifests only
to the debug log and simply write a count to the console.  This way the user
doesn't get spammed but still knows what is happening if bitbake appears to
stall with heavy I/O.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9bef212..918768f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -952,8 +952,12 @@ python sstate_eventhandler2() {
                 if stamp not in stamps:
                     toremove.append(l)
                     if stamp not in seen:
-                        bb.note("Stamp %s is not reachable, removing related manifests" % stamp)
+                        bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
                         seen.append(stamp)
+
+        if toremove:
+            bb.note("There are %d recipes to be removed from the sysroot, removing..." % (len(toremove)))
+
         for r in toremove:
             (stamp, manifest, workdir) = r.split()
             for m in glob.glob(manifest + ".*"):
-- 
2.6.4


