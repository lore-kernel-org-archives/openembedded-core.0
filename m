Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 209CB6C52A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 10:26:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id 96so11555547wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/IYQQ7XsnB8lyeDIgYgjZqs4T8lWIxYwfhB2SifaZGs=;
	b=1zcc1xlVp1GdSR4pGWmVF2uJWDt1dsbZIEXsvTAS7zHf82TaBddopsSF+aIFDpcNU1
	G8zi44L/G4FuG7+648z1evhbc2iwYiGWDWFV4FxY+tZzDa8IZ10aaY9GxqFquE7eokju
	ZA6cJJ5Ik3dFZaGPFgQFBWlMBx8p/0Oi3z5nWi/PHEpGWFYJIkp8qYYQX6WAG62826M4
	ZetEvLC0sPFKXAJ2roFSswOHEKZlKoLuvQtavHGg+K1OChOJ7h40WiztjA8KE3uv5NwA
	YiS4QGMb/5l07zcgsPcXhp1mlrqfzPcFmGiDoN7Fgt0rYIrOWCyHaQknUkW/u0ir4dMd
	JedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/IYQQ7XsnB8lyeDIgYgjZqs4T8lWIxYwfhB2SifaZGs=;
	b=kBKDXU2HLdyTA1fQJx7P0WW3AtRZQP2B7lzuItgAepXTynQHbfXHQ1n2r0jo+iAvwb
	BNCAJjuTNpE3mTJhTUFwn7FjYr1t55mvnVhlimx9aE0Su/RWSYUivUY/ZKyL4qscwAtV
	wHYlFQueHjh0XrrP700J0N1qFpyEx5bkL7hUcy8YMv1/vQcyMEu7Ud8zAkEPjkAs+0Nh
	ecb/nGOHHfzGVrS0j/EXZXVj07gdv8IY9sXUsiDe1U1MhNnbaCBLCRUdh6KYVaYAWfRK
	qasfkCOgpEzQJUknUjQyYHxp3/VXmZr2UbKPgI39bji5g5LrvMkwTm/crK7DkqKhxvZg
	HJrA==
X-Gm-Message-State: AA+aEWaPkdYWgYEMrcdlibJi6lqPF1BWb6b5VcBO4GMD9wAAPTMG4DcS
	LSAvLro2tt/ncjKB8KVcbo4WxWMbXTw=
X-Google-Smtp-Source: AFSGD/X7dBX87wED8BubKh740/556VH4wgDElKgbGFpNlvEAXkv1lvdH2vUF13BrdOQa2Gb3gReF3w==
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr13131058wrs.75.1543832796397; 
	Mon, 03 Dec 2018 02:26:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k26sm2977930wmi.28.2018.12.03.02.26.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 02:26:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 10:26:33 +0000
Message-Id: <20181203102634.4850-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] patchreview: various fixes
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
X-List-Received-Date: Mon, 03 Dec 2018 10:26:36 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/patchreview.py | 46 ++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index a4d5ba68676..072166504da 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -5,6 +5,7 @@
 # - test suite
 # - validate signed-off-by
 
+status_values = ("accepted", "pending", "inappropriate", "backport", "submitted", "denied")
 
 class Result:
     # Whether the patch has an Upstream-Status or not
@@ -35,25 +36,26 @@ def blame_patch(patch):
                                     "--format=%s (%aN <%aE>)",
                                     "--", patch)).decode("utf-8").splitlines()
 
-def patchreview(patches):
-    import re
+def patchreview(path, patches):
+    import re, os.path
 
     # General pattern: start of line, optional whitespace, tag with optional
     # hyphen or spaces, maybe a colon, some whitespace, then the value, all case
     # insensitive.
     sob_re = re.compile(r"^[\t ]*(Signed[-_ ]off[-_ ]by:?)[\t ]*(.+)", re.IGNORECASE | re.MULTILINE)
     status_re = re.compile(r"^[\t ]*(Upstream[-_ ]Status:?)[\t ]*(\w*)", re.IGNORECASE | re.MULTILINE)
-    status_values = ("accepted", "pending", "inappropriate", "backport", "submitted", "denied")
     cve_tag_re = re.compile(r"^[\t ]*(CVE:)[\t ]*(.*)", re.IGNORECASE | re.MULTILINE)
     cve_re = re.compile(r"cve-[0-9]{4}-[0-9]{4,6}", re.IGNORECASE)
 
     results = {}
 
     for patch in patches:
+
+        fullpath = os.path.join(path, patch)
         result = Result()
-        results[patch] = result
+        results[fullpath] = result
 
-        content = open(patch, encoding='ascii', errors='ignore').read()
+        content = open(fullpath, encoding='ascii', errors='ignore').read()
 
         # Find the Signed-off-by tag
         match = sob_re.search(content)
@@ -122,6 +124,8 @@ def analyse(results, want_blame=False, verbose=True):
             missing_status += 1
         if r.malformed_upstream_status or r.unknown_upstream_status:
             malformed_status += 1
+            # Count patches with no status as pending
+            pending_patches +=1
         if r.missing_cve:
             missing_cve += 1
         if r.upstream_status == "pending":
@@ -132,7 +136,6 @@ def analyse(results, want_blame=False, verbose=True):
             need_blame = True
             if verbose:
                 print("Missing Signed-off-by tag (%s)" % patch)
-
         if r.malformed_sob:
             need_blame = True
             if verbose:
@@ -198,14 +201,35 @@ if __name__ == "__main__":
     args.add_argument("-b", "--blame", action="store_true", help="show blame for malformed patches")
     args.add_argument("-v", "--verbose", action="store_true", help="show per-patch results")
     args.add_argument("-g", "--histogram", action="store_true", help="show patch histogram")
-    args.add_argument("directory", nargs="?", help="directory to scan")
+    args.add_argument("-j", "--json", help="update JSON")
+    args.add_argument("directory", help="directory to scan")
     args = args.parse_args()
 
-    if args.directory:
-        os.chdir(args.directory)
-    patches = subprocess.check_output(("git", "ls-files", "recipes-*/**/*.patch", "recipes-*/**/*.diff")).decode("utf-8").split()
-    results = patchreview(patches)
+    patches = subprocess.check_output(("git", "-C", args.directory, "ls-files", "recipes-*/**/*.patch", "recipes-*/**/*.diff")).decode("utf-8").split()
+    results = patchreview(args.directory, patches)
     analyse(results, want_blame=args.blame, verbose=args.verbose)
+
+    if args.json:
+        import json, os.path, collections
+        if os.path.isfile(args.json):
+            data = json.load(open(args.json))
+        else:
+            data = []
+
+        row = collections.Counter()
+        row["total"] = len(results)
+        row["date"] = subprocess.check_output(["git", "-C", args.directory, "show", "-s", "--pretty=format:%cd", "--date=format:%s"]).decode("utf-8").strip()
+        for r in results.values():
+            if r.upstream_status in status_values:
+                row[r.upstream_status] += 1
+            if r.malformed_upstream_status or r.missing_upstream_status:
+                row['malformed-upstream-status'] += 1
+            if r.malformed_sob or r.missing_sob:
+                row['malformed-sob'] += 1
+
+        data.append(row)
+        json.dump(data, open(args.json, "w"))
+
     if args.histogram:
         print()
         histogram(results)
-- 
2.11.0


