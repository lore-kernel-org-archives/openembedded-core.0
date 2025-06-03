Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE2EC5B559
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:35 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.6342.1748939069290394333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=tgmUj8SR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250603082426d8e6445d731107d5da-icw9oa@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250603082426d8e6445d731107d5da
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FJMO15+hwFl8tugtDpQpfGrkHTbPXhTZZNF+jMzobXw=;
 b=tgmUj8SRZkPhQbavsJS8Eah3hpI9RJ05l4LCBLArDRyPzQp+fQfRLqNdmpICgZFu33GVTD
 19Wz+Yf+BZBhFOUmOBXDHEogujEDDvQPHIJYkSXzxn60zxPD4exaogA0MHRsFEyY+oD95Ilr
 +w2rMUqmrTwW+cxyeICfbib0XtIHj5RGIlIhrorvzlh+6RUMkm+ETMDY1BfTMxRt+OyO7HZY
 ui5CN7wuRAP74ODBU01Yl+a/KUgEwhVRniZmtvWdSYkBFReffQZTTAj9nex6gSLnWKb+7gr2
 5Cv0lR3aTlL2ZL+XCfMLva6ww869gJBoHt6AprgM7VfJB9taFjnSbb/g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 01/20] devicetree: minor improvements
Date: Tue,  3 Jun 2025 10:23:12 +0200
Message-ID: <20250603082419.409564-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217763

From: Adrian Freihofer <adrian.freihofer@siemens.com>

- Do not use the ${} bitbake syntax for shell internal variables
- Fix shellcheck SC2045 warning:
  Iterating over ls output is fragile. Use globs.
- Improve error handling for dtc. Print the output, not only the exit
  value.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/devicetree.bbclass | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index 1806cb62cbf..2a2ac93e9bd 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -109,7 +109,11 @@ def devicetree_compile(dtspath, includes, d):
         ppargs.append("-I{0}".format(i))
     ppargs += ["-o", "{0}.pp".format(dts), dtspath]
     bb.note("Running {0}".format(" ".join(ppargs)))
-    subprocess.run(ppargs, check = True)
+    try:
+        subprocess.run(ppargs, check=True, capture_output=True)
+    except subprocess.CalledProcessError as e:
+        bb.fatal(f"Command '{' '.join(ppargs)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\ndtspath: {os.path.abspath(dtspath)}")
+
 
     # determine if the file is an overlay or not (using the preprocessed file)
     isoverlay = devicetree_source_is_overlay("{0}.pp".format(dts))
@@ -125,7 +129,11 @@ def devicetree_compile(dtspath, includes, d):
     dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
     dtcargs += ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
     bb.note("Running {0}".format(" ".join(dtcargs)))
-    subprocess.run(dtcargs, check = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    try:
+        subprocess.run(dtcargs, check=True, capture_output=True)
+    except subprocess.CalledProcessError as e:
+        bb.fatal(f"Command '{' '.join(dtcargs)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\ndtname: {dtname}")
+
 
 python devicetree_do_compile() {
     import re
@@ -144,14 +152,16 @@ python devicetree_do_compile() {
 }
 
 devicetree_do_install() {
-    for DTB_FILE in `ls *.dtb *.dtbo`; do
-        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot/devicetree/${DTB_FILE}
+    for dtb_file in *.dtb *.dtbo; do
+        [ -e "$dtb_file" ] || continue
+        install -Dm 0644 "${B}/$dtb_file" "${D}/boot/devicetree/$dtb_file"
     done
 }
 
 devicetree_do_deploy() {
-    for DTB_FILE in `ls *.dtb *.dtbo`; do
-        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/devicetree/${DTB_FILE}
+    for dtb_file in *.dtb *.dtbo; do
+        [ -e "$dtb_file" ] || continue
+        install -Dm 0644 "${B}/$dtb_file" "${DEPLOYDIR}/devicetree/$dtb_file"
     done
 }
 addtask deploy before do_build after do_install
-- 
2.49.0


