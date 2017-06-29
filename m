Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8535E60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 11:43:15 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id k67so187494331wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8PbpEF/fwKjny2gsQhOp14gtyRvpzp16OMq+BmXqwZ4=;
	b=bZYCL8SVe5DXGxQRX9X4l66kXhRRFJ1kGLAyn2cf0xr7OkSphReCk9OgSYPf73h2iN
	hquCrHvA1tO1hXoHrfYWXmRM4PfPN6ChxWmqtaFMHdWG+Dk6RtnyghKjHWznUcOl7r5V
	vSPppixURWm77jAEPhOwGQ10LOiuDysNFiku6z06XbaNf1D1oXJB+uVNxDmdWysVisj+
	80LS5SJKbLQhhI/ahKMw+v4rpEvOY2FDxhZGXE8YYqNJ9vf7xLVfaamd1Gyq0kJN4eCX
	Yq+7ugop6qjfXvfYzakAvNjMq/FMJX5xU2Y9TPVf+fSdNIQ7ccff8B/jFJdmIKYT+kXK
	GW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8PbpEF/fwKjny2gsQhOp14gtyRvpzp16OMq+BmXqwZ4=;
	b=M9otIkaXj24G5095WgeMftlvHiAG4pKpLUlDx6rbmmFAl7tnOt+x6Nmq+mthd7dvDd
	9LOKnt9pQrhrw7pHgSLe6kBQuqRebJ6MeO8uuV3ED+EB2yAyNKUjzcBudjiZA/PiDGSK
	pKuBR8wQAtFHGgFxi2NvhauxrnigMp8Axu6XSu6HerPXOdX+pl5gDAb6e/9vEyZ7fZjU
	A7i9ntZygkdLId3cNaz+J4f/TrmGgM2Pqo4eq1JAB0EJ+exi+ZVT1xewRCbdrfHrgX6a
	FHzP67hIWbHvfknmw/YkJG34ucJ5Hr8R1OMfyHgxN5eILz3U2/uhHB+CT636CienNBUE
	bS4A==
X-Gm-Message-State: AKS2vOywMdWBkW0de4DW+kLG2FGiWyC+aqN+C7KWmiAwO+05/yB1iMMc
	wgSie+Vh9sYDIUCf8OQ=
X-Received: by 10.223.160.40 with SMTP id k37mr21198771wrk.91.1498736595697;
	Thu, 29 Jun 2017 04:43:15 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m143sm1088921wmg.27.2017.06.29.04.43.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 04:43:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 12:43:10 +0100
Message-Id: <20170629114310.26530-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] scripts/contrib/patchreview: add new script
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
X-List-Received-Date: Thu, 29 Jun 2017 11:43:16 -0000

This script analyses the patches we apply and can sanity check or output
statistics.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/patchreview.py | 211 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100755 scripts/contrib/patchreview.py

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
new file mode 100755
index 00000000000..4e3e73c7a8b
--- /dev/null
+++ b/scripts/contrib/patchreview.py
@@ -0,0 +1,211 @@
+#! /usr/bin/env python3
+
+# TODO
+# - option to just list all broken files
+# - test suite
+# - validate signed-off-by
+
+
+class Result:
+    # Whether the patch has an Upstream-Status or not
+    missing_upstream_status = False
+    # If the Upstream-Status tag is malformed in some way (string for bad bit)
+    malformed_upstream_status = None
+    # If the Upstream-Status value is unknown (boolean)
+    unknown_upstream_status = False
+    # The upstream status value (Pending, etc)
+    upstream_status = None
+    # Whether the patch has a Signed-off-by or not
+    missing_sob = False
+    # Whether the Signed-off-by tag is malformed in some way
+    malformed_sob = False
+    # The Signed-off-by tag value
+    sob = None
+    # Whether a patch looks like a CVE but doesn't have a CVE tag
+    missing_cve = False
+
+def blame_patch(patch):
+    """
+    From a patch filename, return a list of "commit summary (author name <author
+    email>)" strings representing the history.
+    """
+    import subprocess
+    return subprocess.check_output(("git", "log",
+                                    "--follow", "--find-renames", "--diff-filter=A",
+                                    "--format=%s (%aN <%aE>)",
+                                    "--", patch)).decode("utf-8").splitlines()
+
+def patchreview(patches):
+    import re
+
+    # General pattern: start of line, optional whitespace, tag with optional
+    # hyphen or spaces, maybe a colon, some whitespace, then the value, all case
+    # insensitive.
+    sob_re = re.compile(r"^[\t ]*(Signed[-_ ]off[-_ ]by:?)[\t ]*(.+)", re.IGNORECASE | re.MULTILINE)
+    status_re = re.compile(r"^[\t ]*(Upstream[-_ ]Status:?)[\t ]*(\w*)", re.IGNORECASE | re.MULTILINE)
+    status_values = ("accepted", "pending", "inappropriate", "backport", "submitted", "denied")
+    cve_tag_re = re.compile(r"^[\t ]*(CVE:)[\t ]*(.*)", re.IGNORECASE | re.MULTILINE)
+    cve_re = re.compile(r"cve-[0-9]{4}-[0-9]{4,6}", re.IGNORECASE)
+
+    results = {}
+
+    for patch in patches:
+        result = Result()
+        results[patch] = result
+
+        content = open(patch, encoding='ascii', errors='ignore').read()
+
+        # Find the Signed-off-by tag
+        match = sob_re.search(content)
+        if match:
+            value = match.group(1)
+            if value != "Signed-off-by:":
+                result.malformed_sob = value
+            result.sob = match.group(2)
+        else:
+            result.missing_sob = True
+
+
+        # Find the Upstream-Status tag
+        match = status_re.search(content)
+        if match:
+            value = match.group(1)
+            if value != "Upstream-Status:":
+                result.malformed_upstream_status = value
+
+            value = match.group(2).lower()
+            # TODO: check case
+            if value not in status_values:
+                result.unknown_upstream_status = True
+            result.upstream_status = value
+        else:
+            result.missing_upstream_status = True
+
+        # Check that patches which looks like CVEs have CVE tags
+        if cve_re.search(patch) or cve_re.search(content):
+            if not cve_tag_re.search(content):
+                result.missing_cve = True
+        # TODO: extract CVE list
+
+    return results
+
+
+def analyse(results, want_blame=False, verbose=True):
+    """
+    want_blame: display blame data for each malformed patch
+    verbose: display per-file results instead of just summary
+    """
+
+    # want_blame requires verbose, so disable blame if we're not verbose
+    if want_blame and not verbose:
+        want_blame = False
+
+    total_patches = 0
+    missing_sob = 0
+    malformed_sob = 0
+    missing_status = 0
+    malformed_status = 0
+    missing_cve = 0
+    pending_patches = 0
+
+    for patch in sorted(results):
+        r = results[patch]
+        total_patches += 1
+        need_blame = False
+
+        # Build statistics
+        if r.missing_sob:
+            missing_sob += 1
+        if r.malformed_sob:
+            malformed_sob += 1
+        if r.missing_upstream_status:
+            missing_status += 1
+        if r.malformed_upstream_status or r.unknown_upstream_status:
+            malformed_status += 1
+        if r.missing_cve:
+            missing_cve += 1
+        if r.upstream_status == "pending":
+            pending_patches += 1
+
+        # Output warnings
+        if r.missing_sob:
+            need_blame = True
+            if verbose:
+                print("Missing Signed-off-by tag (%s)" % patch)
+        # TODO: disable this for now as too much fails
+        if False and r.malformed_sob:
+            need_blame = True
+            if verbose:
+                print("Malformed Signed-off-by '%s' (%s)" % (r.malformed_sob, patch))
+        if r.missing_cve:
+            need_blame = True
+            if verbose:
+                print("Missing CVE tag (%s)" % patch)
+        if r.missing_upstream_status:
+            need_blame = True
+            if verbose:
+                print("Missing Upstream-Status tag (%s)" % patch)
+        if r.malformed_upstream_status:
+            need_blame = True
+            if verbose:
+                print("Malformed Upstream-Status '%s' (%s)" % (r.malformed_upstream_status, patch))
+        if r.unknown_upstream_status:
+            need_blame = True
+            if verbose:
+                print("Unknown Upstream-Status value '%s' (%s)" % (r.upstream_status, patch))
+
+        if want_blame and need_blame:
+            print("\n".join(blame_patch(patch)) + "\n")
+
+    def percent(num):
+        try:
+            return "%d (%d%%)" % (num, round(num * 100.0 / total_patches))
+        except ZeroDivisionError:
+            return "N/A"
+
+    if verbose:
+        print()
+
+    print("""Total patches found: %d
+Patches missing Signed-off-by: %s
+Patches with malformed Signed-off-by: %s
+Patches missing CVE: %s
+Patches missing Upstream-Status: %s
+Patches with malformed Upstream-Status: %s
+Patches in Pending state: %s""" % (total_patches,
+                                   percent(missing_sob),
+                                   percent(malformed_sob),
+                                   percent(missing_cve),
+                                   percent(missing_status),
+                                   percent(malformed_status),
+                                   percent(pending_patches)))
+
+
+
+def histogram(results):
+    from toolz import recipes, dicttoolz
+    import math
+    counts = recipes.countby(lambda r: r.upstream_status, results.values())
+    bars = dicttoolz.valmap(lambda v: "#" * int(math.ceil(float(v) / len(results) * 100)), counts)
+    for k in bars:
+        print("%-20s %s (%d)" % (k.capitalize() if k else "No status", bars[k], counts[k]))
+
+
+if __name__ == "__main__":
+    import argparse, subprocess, os
+
+    args = argparse.ArgumentParser(description="Patch Review Tool")
+    args.add_argument("-b", "--blame", action="store_true", help="show blame for malformed patches")
+    args.add_argument("-v", "--verbose", action="store_true", help="show per-patch results")
+    args.add_argument("-g", "--histogram", action="store_true", help="show patch histogram")
+    args.add_argument("directory", nargs="?", help="directory to scan")
+    args = args.parse_args()
+
+    if args.directory:
+        os.chdir(args.directory)
+    patches = subprocess.check_output(("git", "ls-files", "*.patch", "*.diff")).decode("utf-8").split()
+    results = patchreview(patches)
+    analyse(results, want_blame=args.blame, verbose=args.verbose)
+    if args.histogram:
+        print()
+        histogram(results)
-- 
2.11.0


