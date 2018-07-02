Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6E11578A07
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:27:26 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b188-v6so9712512wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xkcfgF7ICvnY+oGDJrpc/c0QrnpkdUX3JZAvdrpQ/x4=;
	b=SI4Q6VGPtUfdO5g6seVTkPLdLzCM8MkT4PJWpDagpVRCMQFCJ1Gp0/x3UOcwPCW2zR
	7biykmJsgqtuG4tj5x67f45FRRpF0GcswbMe9BN+2eUfk3xafN+eqeEGvUCWN5Ph0x3M
	R8d0CCb1icIK0cBqgMGQ5M62MCwMRIR3+MlkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xkcfgF7ICvnY+oGDJrpc/c0QrnpkdUX3JZAvdrpQ/x4=;
	b=Nsg44uzi0pSo+F/HyxrYPUOFYGY7ykypWr2KmlT+/lAoJtCOs5TmPJhIEr+fHXATps
	ntm7voL+Oq5uHUSPuK6bwmgvJ8onGAWzv4rEIe6oSkWnNJ8/g8yLri7ce9km6g88mHIq
	41ru7ev4tWfsFfog59/2+p0lXw8yA8cZ5XOu6ms3KwKnxi6ibODPZa9lR7xNnw8YV5jW
	nEWhtM8WYbtNQKRApPnPFi5zON72t8+XJ5BAL4om9/5490pxZm0UzD3RVgeu6a7LVVVR
	K7nadqHg5y01MTiPb2OyMT41T3JjqR+G5QEiKIkfBGVXzWDHcpTaBrxLKp/pWtJ9FoWz
	LVfw==
X-Gm-Message-State: APt69E2NC8yezbJhI+PJzKU2hu09nEDhNrZ+jBmlOrBDU70hS9chZA22
	U03LftuOZBXbfGicOVNRUx0GY9z3l58=
X-Google-Smtp-Source: AAOMgpeYyEAhSxLwyGG9udM43rgkIuRs+gvVTr1XrI4DKFJK+j2mzJaSECw3SOeU0W+YPOb+N1e6Ww==
X-Received: by 2002:a1c:94f:: with SMTP id 76-v6mr8797049wmj.86.1530548846861; 
	Mon, 02 Jul 2018 09:27:26 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	17-v6sm12148012wmm.21.2018.07.02.09.27.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:27:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:27:17 +0100
Message-Id: <20180702162718.27038-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
References: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] staging: Improve fixup processing code
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
X-List-Received-Date: Mon, 02 Jul 2018 16:27:26 -0000

With the fixes to other parts of multilib, it was found that the fixup code's
assumptions about the recipe sysroot were incorrect. We need to use the value
calculated earlier in the function.

It turns out there is a rather neat way to do this which cleans up the code
as an added bonus.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index f04c7b637d9..91cbc2083d7 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -383,8 +383,6 @@ python extend_recipe_sysroot() {
     lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
 
     fixme = {}
-    fixme[''] = []
-    fixme['native'] = []
     seendirs = set()
     postinsts = []
     multilibs = {}
@@ -483,12 +481,13 @@ python extend_recipe_sysroot() {
 
         if manifest:
             newmanifest = collections.OrderedDict()
+            targetdir = destsysroot
             if native:
-                fm = fixme['native']
                 targetdir = recipesysrootnative
-            else:
-                fm = fixme['']
-                targetdir = destsysroot
+            if targetdir not in fixme:
+                fixme[targetdir] = []
+            fm = fixme[targetdir]
+
             with open(manifest, "r") as f:
                 manifests[dep] = manifest
                 for l in f:
@@ -546,12 +545,7 @@ python extend_recipe_sysroot() {
     bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))
 
     for f in fixme:
-        if f == '':
-            staging_processfixme(fixme[f], recipesysroot, recipesysroot, recipesysrootnative, d)
-        elif f == 'native':
-            staging_processfixme(fixme[f], recipesysrootnative, recipesysroot, recipesysrootnative, d)
-        else:
-            staging_processfixme(fixme[f], multilibs[f].getVar("RECIPE_SYSROOT"), recipesysroot, recipesysrootnative, d)
+        staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)
 
     for p in postinsts:
         subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
-- 
2.17.1


