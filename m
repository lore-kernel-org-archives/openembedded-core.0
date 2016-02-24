Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id EE8857722E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 22:39:39 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ts10so32592417obc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GgoSasfYYUfQiiCIYMv97IOCTwhY9EAp8yu0kcIcPyo=;
	b=CQ5DWf+vfqhW3EPTSD3CtFuVTMUF2HUYAJVtz1r6KKAIadp9EqxESkvMPPO7xOSJjE
	VR3pmyEH/rAs/A00qGQmLJjM03TSTP7MpZhpW7GVBaLR6RdDmM9aTTjy+pMEBJAUOOQj
	Dn6pYIm4z9fI+YfV80B7JbcvgB1GfcBNcZZV+9rHxRlJHB1gYvZMgHHDNZhci74Q6cbb
	VIbOfcUGG4MrFAs1Nh1W7SqQfSw5Nsx/w0iRNOwxdlQXlwRQyfwBnnQqMteKDn25fHif
	PMrXsHxo/Gs2o7JZlluLrErAQ325hI+GA4AWa+eEGXBZLM6DFb36F1Yv/tjv6HyFtsqB
	IVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GgoSasfYYUfQiiCIYMv97IOCTwhY9EAp8yu0kcIcPyo=;
	b=U83p3rUsdeRWt4amtt54JdmfHf6h+aeXLKXfgfTLJmANsrYRpc/OpEEBZ7k8YHlEOm
	uSIsdrRhJL8jjMVGZpHQvK9qzcNRPIkZ103j7i5c46m17mvEGnjOSFU4IPOPPQNwgHmM
	UPVc4HTH2E8t3HPH2j6BVAzPNOAh265fPjkN+baQAu1gSep9BFS9r9DcCet0Cy4TkkGm
	sFZX0w8rK9YbCzsRE+uZyqc84ocES+DshHwW69QK9nBdBEW299m56q2BxA/tI0/UfVA3
	lisHq2qElkdjLQh+2u1oZmn/RtEDgTUGzpdwKN3VGpvO/8H1smoLqJb7ZqxmtnRacVyt
	6k9Q==
X-Gm-Message-State: AG10YOTufzijP0PARSdbRJQTMe0WQB0ojsHA3GSeD/+NTslz/g0evGf/tX3/lUIcQPfcsQ==
X-Received: by 10.182.38.199 with SMTP id i7mr36417066obk.86.1456353580359;
	Wed, 24 Feb 2016 14:39:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	yn3sm3262607obc.27.2016.02.24.14.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 14:39:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:39:33 -0800
Message-Id: <1456353573-29469-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] glibc.inc: improve optimisation level sanity checking
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
X-List-Received-Date: Wed, 24 Feb 2016 22:39:40 -0000

- Avoid code duplication to handle -O, -O1 and -Os cases

- Consider the effective optimisation level only (avoids spurious
  warnings if multiple optimisation flags are present).

- Prefix warnings with PN instead of hardcoding "glibc" (avoids
  confusing warnings since the test is also applied to glibc-initial,
  nativesdk-glibc, nativesdk-glibc-initial, etc, and each could
  potentually have different optimisation flags).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 5711209..bf1dccd 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -8,19 +8,15 @@ PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
-# glibc can't be built without optimization, if someone tries to compile an
-# entire image as -O0, break with fatal.
 python () {
-    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
-        bb.note("glibc can't be built with -O, -O -Wno-error will be used instead.")
-        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
-    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
-        bb.fatal("glibc can't be built with -O0, using -O1 -Wno-error or -O1 instead.")
-    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-Os", "x", "", d) == "x":
-        bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
-        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
-    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O1", "x", "", d) == "x":
-        bb.note("glibc can't be built with -O1, -O1 -Wno-error will be used instead.")
+    opt_effective = "-O"
+    for opt in d.getVar('SELECTED_OPTIMIZATION', True).split():
+        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
+            opt_effective = opt
+    if opt_effective == "-O0":
+        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN', True), opt_effective))
+    if opt_effective in ("-O", "-O1", "-Os"):
+        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
         d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
 }
 
-- 
1.9.1


