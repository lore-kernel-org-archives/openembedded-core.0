Return-Path: <gtertych@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1203A79A5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=15209; q=dns/txt;
	s=iport; t=1539188713; x=1540398313;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=067st0sCw4BX2hs6ug8awexQurrRhXBtU8OuolPPRpI=;
	b=FEf1SXsuV/r0TRal9FmcCk7sTget+W5KiJBhIs5qDroyr9u6VE9prR2C
	tPLZD+Cic0WFIwziOyw3HqoCqyvnRSjxxqGxZWRu96CoZQeuJA5P3R/tP
	o5kUvl2NTLB1jnabj21zdFt6mnh9zk8iGv48KCkflpRAzsHtbEUhKQrt8 g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BXAAD0Jr5b/xbLJq1kEwEBBQEBAQE?=
	=?us-ascii?q?BAgEBAQEHAgEBAQGBZYIEZm0SKIxplmKOE4FmDSWBUoJ1hHM4FgEDAQECAQE?=
	=?us-ascii?q?CbRwMhXIBRoFRGIMJAYF0DQ+jdRGCUIR3hGQUhwiENoFBP4EShDiBdQEBAhi?=
	=?us-ascii?q?BDIYTAohNhlOOFA5ECYZRiXULF4FPh3mGQ4JghjODHYZ3gmWBWSGBQgsIcBU?=
	=?us-ascii?q?7gmwJhXqBf4hWPDAxjC0BAQ?=
X-IronPort-AV: E=Sophos;i="5.54,364,1534809600"; 
   d="scan'208";a="7081680"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2018 16:25:10 +0000
Received: from think.cisco.com (dhcp-10-61-106-181.cisco.com [10.61.106.181])
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id w9AGP9xg020074;
	Wed, 10 Oct 2018 16:25:10 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 19:25:10 +0300
Message-Id: <20181010162511.7273-2-gtertych@cisco.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.106.181, dhcp-10-61-106-181.cisco.com
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH v3 2/3] cvert-kernel - generate CVE report for the Linux kernel
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
X-List-Received-Date: Wed, 10 Oct 2018 16:25:12 -0000
Content-Transfer-Encoding: 8bit

NVD entries for the Linux kernel are almost always outdated.
For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065
is shown as matched for "versions up to (including) 4.15.7",
however the patch 57ebd808a97d has been back ported for 4.14.

By default, it checks NVD Resource entries for the patch
URLs and looks for the commits in the local GIT tree.

Additionaly ("--resource") it checks other resources, that
may have up-to-date CVE data. You can combine resources and
decide which one you want to be based on.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---

Changes in v3:
 o "cvert-kernel" is a separate patch
 o add "--resources": rework NVD, add LKC resource:
   https://github.com/nluedtke/linux_kernel_cves
 o better logging ("--debug" sets all logging, including lib calls)
 o fix pylint warnings

 scripts/cvert-kernel | 379 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 379 insertions(+)
 create mode 100755 scripts/cvert-kernel

diff --git a/scripts/cvert-kernel b/scripts/cvert-kernel
new file mode 100755
index 000000000000..adf26924d10c
--- /dev/null
+++ b/scripts/cvert-kernel
@@ -0,0 +1,379 @@
+#!/usr/bin/env python3
+#
+# Copyright (c) 2018 by Cisco Systems, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+
+""" Generate CVE report for the given Linux kernel GIT branch
+"""
+
+import re
+import sys
+import argparse
+import textwrap
+import subprocess
+import logging
+import logging.config
+import cvert
+
+
+def report_kernel():
+    """Generate Linux kernel CVE report"""
+
+    parser = argparse.ArgumentParser(
+        formatter_class=argparse.RawDescriptionHelpFormatter,
+        description=textwrap.dedent("""
+        Generate CVE report for the Linux kernel.
+        Inspect Linux kernel GIT tree and find all CVE patches commits.
+        """),
+        epilog=textwrap.dedent("""
+        @ run examples:
+
+        # Download (update) NVD feeds in "nvdfeed" directory
+        # and prepare the report for the "kernel-sources" directory
+        %% %(prog)s --feed-dir nvdfeed --output report-kernel.txt kernel-sources
+
+        # Use existed NVD feeds in "nvdfeed" directory
+        # and prepare the report for the "kernel-sources" directory
+        %% %(prog)s --offline --feed-dir nvdfeed --output report-kernel.txt kernel-sources
+
+        # (faster) Restore CVE dump from "cvedump" (must exist)
+        # and prepare the report for the "kernel-sources" directory
+        %% %(prog)s --restore cvedump --output report-kernel.txt kernel-sources
+
+        # Restore CVE dump from "cvedump" (must exist)
+        # and prepare the extended report for the "kernel-sources" directory
+        %% %(prog)s --restore cvedump --show-description --show-reference --output report-kernel.txt kernel-sources
+
+        @ report example output (NVD resource):
+
+        # 2018-10-10 15:41:52,213 %% CVERT %% INFO     %% kernel version: 4.9.132
+        . patched |  3.3 | CVE-2017-17807     | nvd: KEYS: add missing permission check for request_key() destination
+        unpatched |  3.3 | CVE-2017-17864     | 
+        unpatched |  4.4 | CVE-2016-9604      | 
+        unpatched |  4.4 | CVE-2017-12153     | 
+        unpatched |  4.4 | CVE-2017-14051     | 
+        . patched |  4.6 | CVE-2017-8924      | nvd: USB: serial: io_ti: fix information leak in completion handler
+        unpatched |  4.7 | CVE-2017-17449     | 
+        . patched |  4.7 | CVE-2017-18203     | nvd: dm: fix race between dm_get_from_kobject() and __dm_destroy()
+        . patched |  4.7 | CVE-2017-18224     | nvd: ocfs2: ip_alloc_sem should be taken in ocfs2_get_block()
+        . patched |  4.7 | CVE-2018-1065      | nvd: netfilter: add back stackpointer size checks
+        ...
+
+        @ report example output (NVD+LKC resource):
+
+        # 2018-10-10 15:46:05,902 %% CVERT %% INFO     %% kernel version: 4.9.132
+        . patched |  3.3 | CVE-2017-17807     | nvd: KEYS: add missing permission check for request_key() destination
+        unpatched |  3.3 | CVE-2017-17864     | 
+        . patched |  4.4 | CVE-2016-9604      | lkc: a5c6e0a76817a3751f58d761aaff7c0b0c4001ff
+        . patched |  4.4 | CVE-2017-12153     | lkc: c820441a7a52e3626aede8df94069a50a9e4efdb
+        . patched |  4.4 | CVE-2017-14051     | lkc: 2a913aecc4f746ce15eb1bec98b134aff4190ae2
+        . patched |  4.6 | CVE-2017-8924      | nvd: USB: serial: io_ti: fix information leak in completion handler
+        . patched |  4.7 | CVE-2017-17449     | lkc: 0b18782288a2f1c2a25e85d2553c15ea83bb5802
+        . patched |  4.7 | CVE-2017-18203     | nvd: dm: fix race between dm_get_from_kobject() and __dm_destroy()
+        . patched |  4.7 | CVE-2017-18224     | nvd: ocfs2: ip_alloc_sem should be taken in ocfs2_get_block()
+        . patched |  4.7 | CVE-2018-1065      | nvd: netfilter: add back stackpointer size checks
+        ...
+        """))
+
+    group = parser.add_mutually_exclusive_group(required=True)
+    group.add_argument("-f", "--feed-dir", help="feeds directory")
+    group.add_argument("-d", "--restore", help="load CVE data structures from file",
+                       metavar="FILENAME")
+    parser.add_argument("--offline", help="do not update from NVD site",
+                        action="store_true")
+    parser.add_argument("-o", "--output", help="save report to the file")
+    parser.add_argument("-k", "--kernel-ver", help='overwrite kernel version, '
+                                                   'default is "make kernelversion"',
+                        metavar="VERSION")
+    parser.add_argument("--show-description", help='show "Description" in the report',
+                        action="store_true")
+    parser.add_argument("--show-reference", help='show "Reference" in the report',
+                        action="store_true")
+    parser.add_argument("-r", "--resource", help='resources: e.g.: "--resource nvd lkc"',
+                        nargs="+", default=["nvd"])
+    parser.add_argument("--patched", help="patched CVE IDs",
+                        nargs="+", default=[])
+    parser.add_argument("--debug", help="print debug messages",
+                        action="store_true")
+
+    parser.add_argument("kernel_dir", help="kernel GIT directory",
+                        metavar="kernel-dir")
+
+    args = parser.parse_args()
+
+    logging.config.dictConfig(cvert.logconfig(args.debug))
+
+    kernel_dir = args.kernel_dir
+
+    if args.restore:
+        cve_struct = cvert.load_cve(args.restore)
+    elif args.feed_dir:
+        cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
+
+    if not cve_struct and args.offline:
+        parser.error("No CVEs found. Try to turn off offline mode or use other file to restore.")
+
+    if args.output:
+        output = open(args.output, "w")
+    else:
+        output = sys.stdout
+
+    if args.kernel_ver:
+        kernel_ver = args.kernel_ver
+    else:
+        kernel_ver = get_version(kernel_dir)
+
+    logging.info("kernel version: %s", kernel_ver)
+
+    if "lkc" in args.resource:
+        lkc_ctx = prepare_lkc()
+
+    commits = get_commits(kernel_dir)
+    report = cvert.generate_report({"linux_kernel": {kernel_ver: list(args.patched)}}, cve_struct)
+
+    for cve in report:
+        cve["comment"] = ""
+
+        if "nvd" in args.resource and cve["status"] == "unpatched":
+            process_nvd(cve, kernel_dir, commits)
+
+        if "lkc" in args.resource and cve["status"] == "unpatched":
+            process_lkc(cve, kernel_dir, commits, lkc_ctx)
+
+    print_report(report,
+                 show_description=args.show_description,
+                 show_reference=args.show_reference,
+                 output=output)
+
+    if args.output:
+        output.close()
+
+
+def process_nvd(cve, kernel_dir, commits):
+    """Process NVD references.
+
+    Sometimes NVD "Reference" contains a link to the commit in the GIT
+    upstream mainline.
+
+    First, look if we have that commit ID in the current local GIT
+    branch. It happens if you created local branch after CVE has been
+    fixed in mainline.
+
+    Otherwise, don't give up, and try to find the same headline
+    commit. It works if local GIT tree has up-to-date mainline branch
+    fetched.
+
+    That is all we can do having only mainline commit ID.
+
+    """
+
+    for url in cve["reference"]:
+        iden = get_iden(url)
+
+        if iden and iden in commits["iden"]:
+            mark_patched(cve, "nvd: {0}".format(iden.decode()))
+            return
+
+        head = get_headline(kernel_dir, iden)
+
+        if head and head in commits["head"]:
+            mark_patched(cve, "nvd: {0}".format(head.decode()))
+            return
+
+
+def process_lkc(cve, kernel_dir, commits, ctx):
+    """Process Linux Kernel CVEs approach
+
+    [https://github.com/nluedtke/linux_kernel_cves]
+
+    "kernel" context contains mainline "fixes" commit ID. So, check
+    with that first.
+
+    "stream" context contains backported "cmd_id" for other upstream
+    branches. Check accordingly.
+
+    If no commit ID found in local current branch, than look for the
+    same headline commits. Rarely backported commit has different
+    headline, so look at the "cmt_msg" first.
+
+    """
+
+    iden_candidats = []
+
+    try:
+        iden = ctx["kernel"][cve["CVE"]]["fixes"].encode()
+    except KeyError:
+        logging.debug("%s: commit ID not found", cve["CVE"])
+        iden = None
+
+    if iden:
+        iden_candidats.append(iden)
+
+        if iden in commits["iden"]:
+            mark_patched(cve, "lkc: {0}".format(iden.decode()))
+            return
+
+    if cve["CVE"] in ctx["stream"]:
+        for kver in ctx["stream"][cve["CVE"]]:
+            try:
+                iden = ctx["stream"][cve["CVE"]][kver]["cmt_id"].encode()
+            except KeyError:
+                logging.debug("%s: commit ID not found", cve["CVE"])
+                iden = None
+
+            if iden:
+                iden_candidats.append(iden)
+
+                if iden in commits["iden"]:
+                    mark_patched(cve, "lkc: {0}".format(iden.decode()))
+                    return
+
+    try:
+        head = ctx["kernel"][cve["CVE"]]["cmt_msg"].encode()
+    except KeyError:
+        logging.debug("%s: commit message header not found", cve["CVE"])
+        head = None
+
+    if head and head in commits["head"]:
+        mark_patched(cve, "lkc: {0}".format(head.decode()))
+        return
+
+    # last chance
+    for iden in iden_candidats:
+        head = get_headline(kernel_dir, iden)
+
+        if head and head in commits["head"]:
+            mark_patched(cve, "lkc: {0}".format(head.decode()))
+            return
+
+
+def prepare_lkc():
+    """Prepare LKC context."""
+
+    import urllib.request
+    import json
+
+    ctx = {}
+    url_base = "https://github.com/nluedtke/linux_kernel_cves/raw/master"
+
+    with urllib.request.urlopen(url_base + "/kernel_cves.json") as url:
+        ctx["kernel"] = json.loads(url.read().decode())
+
+    with urllib.request.urlopen(url_base + "/stream_fixes.json") as url:
+        ctx["stream"] = json.loads(url.read().decode())
+
+    return ctx
+
+
+def mark_patched(cve, comment=""):
+    """Put a "patched" mark for the CVE."""
+
+    cve["status"] = "patched"
+    cve["comment"] = comment
+
+
+def get_version(kernel_dir):
+    """Return kernel version."""
+
+    return subprocess.check_output(
+        ["make", "kernelversion"],
+        cwd=kernel_dir,
+        stderr=subprocess.DEVNULL
+    ).decode().rstrip()
+
+
+def get_commits(kernel_dir):
+    """Return GIT commits dict."""
+
+    commits = {"iden": [], "head": []}
+
+    for gitlog in subprocess.check_output(["git", "log", "--format=%H %s"],
+                                          cwd=kernel_dir,
+                                          stderr=subprocess.DEVNULL
+                                         ).splitlines():
+        oneline = gitlog.split(maxsplit=1)
+
+        if len(oneline) > 1:
+            commits["head"].append(oneline[1])
+        else:
+            commits["head"].append(b"")
+
+        commits["iden"].append(oneline[0])
+
+    return commits
+
+
+def get_iden(url):
+    """Return kernel commit ID from URL."""
+
+    commit_re = [
+        r"^http://git\.kernel\.org/cgit/linux/kernel/git/torvalds/linux\.git/commit/\?id=(.+)$",
+        r"^https?://github\.com/torvalds/linux/commit/(.+)$"
+    ]
+
+    for regexp in commit_re:
+        matched = re.match(regexp, url)
+
+        if matched:
+            return matched.group(1)
+
+    return None
+
+
+def get_headline(kernel_dir, iden):
+    """Return commit headline."""
+
+    if not iden:
+        return None
+
+    try:
+        head = subprocess.check_output(["git", "show",
+                                        "--no-patch",
+                                        "--format=%s",
+                                        iden],
+                                       cwd=kernel_dir,
+                                       stderr=subprocess.DEVNULL
+                                      ).rstrip()
+    except subprocess.CalledProcessError:
+        logging.debug("%s: commit ID not found", iden)
+        head = None
+
+    return head
+
+
+def print_report(report, width=70, show_description=False, show_reference=False, output=sys.stdout):
+    """Output kernel report."""
+
+    for cve in report:
+        print("{0:>9s} | {1:>4s} | {2:18s} | {3}".format(cve["status"], cve["CVSS"],
+                                                         cve["CVE"], cve["comment"]),
+              file=output)
+
+        if show_description:
+            print("{0:>9s} + {1}".format(" ", "Description"), file=output)
+
+            for lin in textwrap.wrap(cve["description"], width=width):
+                print("{0:>9s}   {1}".format(" ", lin), file=output)
+
+        if show_reference:
+            print("{0:>9s} + {1}".format(" ", "Reference"), file=output)
+
+            for url in cve["reference"]:
+                print("{0:>9s}   {1}".format(" ", url), file=output)
+
+
+if __name__ == "__main__":
+    report_kernel()
-- 
2.10.3.dirty


