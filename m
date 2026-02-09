Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CF1E7E0B2
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43998.1770629379290897757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vzoFCvTR;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-436e8758b91so667992f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629377; x=1771234177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YK+qTxQTqXtBQI4Vk8pQONRQyGPEEbDmi0I8oaIhS7U=;
        b=vzoFCvTRjCMwDJEmk2QhTCCjxB8R0Hsr2LuRm09v/9VYGHkwPtZm1QnQ80xJDW0Uxu
         Wh5dysX21vDhAdfXXRd75UgCckI5frRx4A+jNfr3okhR/z3ma98yKDXPTnmTSCsJ4awC
         UAUk2IjBYRsBoE76enX+mD8GLq4sefIQk1AO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629377; x=1771234177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YK+qTxQTqXtBQI4Vk8pQONRQyGPEEbDmi0I8oaIhS7U=;
        b=F/XshTHqfueiSQzbiXWhOt0GFLAbGNyDQlSSt5q87tVUskobhblbPGSgcNUOYnf3Oh
         J8yC01vBb823lBxgFEXkWF9R1GmoS0ZC5zqO/A+OOjW6zPALWqw9KWksJnW2cVYZVWxo
         PTkXNN7EwfgIXBvS2UGjPf6Ql9B1cHY+34OGYJsMhX7oafE29+ONqFQ1v7RId+cRZ3uF
         bOUjFaDw54bC43Y7tNA6eXvom1/caMbgKetLtd3WtjBiv848iIr6uBfgqTcs5G8K/zUE
         B19mRPweCkrvQNX86dnD3InDWpVQ4uoL7PTbCh/CxY4s/SgNPNn6ikes82HFgVv6xsrz
         nJBw==
X-Gm-Message-State: AOJu0YxRvU+xRroS3XDM+O5d+ujj+qHX3JrqiWgXth78JsQZ+vMSiNla
	oeVRWism7ycR5uuU+ZUUfFsBHiXFxZgjbjaMr+hQNLmaIQCyK10+D2ue3SGhYNj8nbmuKHuG6UM
	ljhK/g8A=
X-Gm-Gg: AZuq6aKGWRhW2oVMEbsdEb36+pa+BpOlVPP5oRJl45Reo5ncgodj1xXFgQNy8d+2eaE
	CwVpbACwg/j1XTlcOFhtqJnlKLP/S36px7ToYezqxltbIg/oCP4TKu10pKG9ikVxY1prtkF4EtP
	W96F5brZut4MB6GZrdAs5hdqzeRVtCpOb4oZ4p9qe8x6MLR1B28c0+k8YEV1n2miq5P22AgUpZf
	MDlH+Vv6ny5X6ggg0/927VDVlVBES8NQXlyJ+uArMthwbFGcpxmxrACYyr5rUPJcF021JZm8c0S
	/1ZYg/hTv0paMIE75A5xxAA62GyvZzXZgmy/ruR4vL+QpGk5c+td0tQkUY9sVSdyigGOmH6UtG0
	LZlLw/CzbDd/xWTfzshJLvUH/QELAB1S2S7RcXrkDWsjQCA2ajanEccf2m0PPBe72SOsz8U37e6
	Owus+LZyr1W0k1pzNUFvI3IZCgPmNSR2yNNsP8FWiSPrBU7Cl3Zgz8rww6Spz3l756stws1UUzn
	3Z++x+SVw2HWwg=
X-Received: by 2002:adf:e587:0:b0:436:369a:7f36 with SMTP id ffacd0b85a97d-436369a80bcmr7951380f8f.45.1770629377040;
        Mon, 09 Feb 2026 01:29:37 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/25] improve_kernel_cve_report: add script for postprocesing of kernel CVE data
Date: Mon,  9 Feb 2026 10:29:04 +0100
Message-ID: <1adc13b185d18abd926ceab4fc893374b35f9adf.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230772

From: Daniel Turull <daniel.turull@ericsson.com>

Adding postprocessing script to process data from linux CNA that includes more accurate metadata and it is updated directly by the source.

Example of enhanced CVE from a report from cve-check:

{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "summary": "In the Linux kernel, the following vulnerability [...]",
  "scorev2": "0.0",
  "scorev3": "5.5",
  "scorev4": "0.0",
  "modified": "2025-03-17T15:36:11.620",
  "vector": "LOCAL",
  "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/include/asm/thread_info.h']"
},

And same from a report generated with vex:
{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/include/asm/thread_info.h']"
},

For unpatched CVEs, provide more context in the description:
Tested with 6.12.22 kernel
{
  "id": "CVE-2025-39728",
  "status": "Unpatched",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-39728",
  "summary": "In the Linux kernel, the following vulnerability has been [...],
  "scorev2": "0.0",
  "scorev3": "0.0",
  "scorev4": "0.0",
  "modified": "2025-04-21T14:23:45.950",
  "vector": "UNKNOWN",
  "vectorString": "UNKNOWN",
  "detail": "version-in-range",
  "description": "Needs backporting (fixed from 6.12.23)"
},

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 1 file changed, 467 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
new file mode 100755
index 00000000000..829cc4cd30e
--- /dev/null
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -0,0 +1,467 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# The script uses another source of CVE information from linux-vulns
+# to enrich the cve-summary from cve-check or vex.
+# It can also use the list of compiled files from the kernel spdx to ignore CVEs
+# that are not affected since the files are not compiled.
+#
+# It creates a new json file with updated CVE information
+#
+# Compiled files can be extracted adding the following in local.conf
+# SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto = "1"
+#
+# Tested with the following CVE sources:
+# - https://git.kernel.org/pub/scm/linux/security/vulns.git
+# - https://github.com/CVEProject/cvelistV5
+#
+# Example:
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.json --kernel-version 6.12.27 --datadir ./vulns
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.json --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json
+#
+# SPDX-License-Identifier: GPLv2
+
+import argparse
+import json
+import sys
+import logging
+import glob
+import os
+import pathlib
+from packaging.version import Version
+
+def is_linux_cve(cve_info):
+    '''Return true is the CVE belongs to Linux'''
+    if not "affected" in cve_info["containers"]["cna"]:
+        return False
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        if not "product" in affected:
+            return False
+        if affected["product"] == "Linux" and affected["vendor"] == "Linux":
+            return True
+    return False
+
+def get_kernel_cves(datadir, compiled_files, version):
+    """
+    Get CVEs for the kernel
+    """
+    cves = {}
+
+    check_config = len(compiled_files) > 0
+
+    base_version = Version(f"{version.major}.{version.minor}")
+
+    # Check all CVES from kernel vulns
+    pattern = os.path.join(datadir, '**', "CVE-*.json")
+    cve_files = glob.glob(pattern, recursive=True)
+    not_applicable_config = 0
+    fixed_as_later_backport = 0
+    vulnerable = 0
+    not_vulnerable = 0
+    for cve_file in sorted(cve_files):
+        cve_info = {}
+        with open(cve_file, "r", encoding='ISO-8859-1') as f:
+            cve_info = json.load(f)
+
+        if len(cve_info) == 0:
+            logging.error("Not valid data in %s. Aborting", cve_file)
+            break
+
+        if not is_linux_cve(cve_info):
+            continue
+        cve_id = os.path.basename(cve_file)[:-5]
+        description = cve_info["containers"]["cna"]["descriptions"][0]["value"]
+        if cve_file.find("rejected") >= 0:
+            logging.debug("%s is rejected by the CNA", cve_id)
+            cves[cve_id] = {
+                "id": cve_id,
+                "status": "Ignored",
+                "detail": "rejected",
+                "summary": description,
+                "description": f"Rejected by CNA"
+            }
+            continue
+        if any(elem in cve_file for elem in ["review", "reverved", "testing"]):
+            continue
+
+        is_vulnerable, first_affected, last_affected, better_match_first, better_match_last, affected_versions = get_cpe_applicability(cve_info, version)
+
+        logging.debug("%s: %s (%s - %s) (%s - %s)", cve_id, is_vulnerable, better_match_first, better_match_last, first_affected, last_affected)
+
+        if is_vulnerable is None:
+            logging.warning("%s doesn't have good metadata", cve_id)
+        if is_vulnerable:
+            is_affected = True
+            affected_files = []
+            if check_config:
+                is_affected, affected_files = check_kernel_compiled_files(compiled_files, cve_info)
+
+            if not is_affected and len(affected_files) > 0:
+                logging.debug(
+                    "%s - not applicable configuration since affected files not compiled: %s",
+                    cve_id, affected_files)
+                cves[cve_id] = {
+                    "id": cve_id,
+                    "status": "Ignored",
+                    "detail": "not-applicable-config",
+                    "summary": description,
+                    "description": f"Source code not compiled by config. {affected_files}"
+                }
+                not_applicable_config +=1
+            # Check if we have backport
+            else:
+                if not better_match_last:
+                    fixed_in = last_affected
+                else:
+                    fixed_in = better_match_last
+                logging.debug("%s needs backporting (fixed from %s)", cve_id, fixed_in)
+                cves[cve_id] = {
+                        "id": cve_id,
+                        "status": "Unpatched",
+                        "detail": "version-in-range",
+                        "summary": description,
+                        "description": f"Needs backporting (fixed from {fixed_in})"
+                }
+                vulnerable += 1
+                if (better_match_last and
+                    Version(f"{better_match_last.major}.{better_match_last.minor}") == base_version):
+                    fixed_as_later_backport += 1
+        # Not vulnerable
+        else:
+            if not first_affected:
+                logging.debug("%s - not known affected %s",
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] = {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": "No CPE match"
+                }
+                not_vulnerable += 1
+                continue
+            backport_base = Version(f"{better_match_last.major}.{better_match_last.minor}")
+            if version < first_affected:
+                logging.debug('%s - fixed-version: only affects %s onwards',
+                              cve_id,
+                              first_affected)
+                cves[cve_id] = {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"only affects {first_affected} onwards"
+                }
+                not_vulnerable += 1
+            elif last_affected <= version:
+                logging.debug("%s - fixed-version: Fixed from version %s",
+                              cve_id,
+                              last_affected)
+                cves[cve_id] = {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"fixed-version: Fixed from version {last_affected}"
+                }
+                not_vulnerable += 1
+            elif backport_base == base_version:
+                logging.debug("%s - cpe-stable-backport: Backported in %s",
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] = {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "cpe-stable-backport",
+                    "summary": description,
+                    "description": f"Backported in {better_match_last}"
+                }
+                not_vulnerable += 1
+            else:
+                logging.debug("%s - version not affected %s", cve_id, str(affected_versions))
+                cves[cve_id] = {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": f"Range {affected_versions}"
+                }
+                not_vulnerable += 1
+
+    logging.info("Total CVEs ignored due to not applicable config: %d", not_applicable_config)
+    logging.info("Total CVEs not vulnerable due version-not-in-range: %d", not_vulnerable)
+    logging.info("Total vulnerable CVEs: %d", vulnerable)
+
+    logging.info("Total CVEs already backported in %s: %s", base_version,
+                    fixed_as_later_backport)
+    return cves
+
+def read_spdx(spdx_file):
+    '''Open SPDX file and extract compiled files'''
+    with open(spdx_file, 'r', encoding='ISO-8859-1') as f:
+        spdx = json.load(f)
+        if "spdxVersion" in spdx:
+            if spdx["spdxVersion"] == "SPDX-2.2":
+                return read_spdx2(spdx)
+        if "@graph" in spdx:
+            return read_spdx3(spdx)
+    return []
+
+def read_spdx2(spdx):
+    '''
+    Read spdx2 compiled files from spdx
+    '''
+    cfiles = set()
+    if 'files' not in spdx:
+        return cfiles
+    for item in spdx['files']:
+        for ftype in item['fileTypes']:
+            if ftype == "SOURCE":
+                filename = item["fileName"][item["fileName"].find("/")+1:]
+                cfiles.add(filename)
+    return cfiles
+
+def read_spdx3(spdx):
+    '''
+    Read spdx3 compiled files from spdx
+    '''
+    cfiles = set()
+    for item in spdx["@graph"]:
+        if "software_primaryPurpose" not in item:
+            continue
+        if item["software_primaryPurpose"] == "source":
+            filename = item['name'][item['name'].find("/")+1:]
+            cfiles.add(filename)
+    return cfiles
+
+def check_kernel_compiled_files(compiled_files, cve_info):
+    """
+    Return if a CVE affected us depending on compiled files
+    """
+    files_affected = set()
+    is_affected = False
+
+    for item in cve_info['containers']['cna']['affected']:
+        if "programFiles" in item:
+            for f in item['programFiles']:
+                if f not in files_affected:
+                    files_affected.add(f)
+
+    if len(files_affected) > 0:
+        for f in files_affected:
+            if f in compiled_files:
+                logging.debug("File match: %s", f)
+                is_affected = True
+    return is_affected, files_affected
+
+def get_cpe_applicability(cve_info, v):
+    '''
+    Check if version is affected and return affected versions
+    '''
+    base_branch = Version(f"{v.major}.{v.minor}")
+    affected = []
+    if not 'cpeApplicability' in cve_info["containers"]["cna"]:
+        return None, None, None, None, None, None
+
+    for nodes in cve_info["containers"]["cna"]["cpeApplicability"]:
+        for node in nodes.values():
+            vulnerable = False
+            matched_branch = False
+            first_affected = Version("5000")
+            last_affected = Version("0")
+            better_match_first = Version("0")
+            better_match_last = Version("5000")
+
+            if len(node[0]['cpeMatch']) == 0:
+                first_affected = None
+                last_affected = None
+                better_match_first = None
+                better_match_last = None
+
+            for cpe_match in node[0]['cpeMatch']:
+                version_start_including = Version("0")
+                version_end_excluding = Version("0")
+                if 'versionStartIncluding' in cpe_match:
+                    version_start_including = Version(cpe_match['versionStartIncluding'])
+                else:
+                    version_start_including = Version("0")
+                # if versionEndExcluding is missing we are in a branch, which is not fixed.
+                if "versionEndExcluding" in cpe_match:
+                    version_end_excluding = Version(cpe_match["versionEndExcluding"])
+                else:
+                    # if versionEndExcluding is missing we are in a branch, which is not fixed.
+                    version_end_excluding = Version(
+                        f"{version_start_including.major}.{version_start_including.minor}.5000"
+                    )
+                affected.append(f" {version_start_including}-{version_end_excluding}")
+                # Detect if versionEnd is in fixed in base branch. It has precedence over the rest
+                branch_end = Version(f"{version_end_excluding.major}.{version_end_excluding.minor}")
+                if branch_end == base_branch:
+                    if version_start_including <= v < version_end_excluding:
+                        vulnerable = cpe_match['vulnerable']
+                    # If we don't match in our branch, we are not vulnerable,
+                    # since we have a backport
+                    matched_branch = True
+                    better_match_first = version_start_including
+                    better_match_last = version_end_excluding
+                if version_start_including <= v < version_end_excluding and not matched_branch:
+                    if version_end_excluding < better_match_last:
+                        better_match_first = max(version_start_including, better_match_first)
+                        better_match_last = min(better_match_last, version_end_excluding)
+                        vulnerable = cpe_match['vulnerable']
+                        matched_branch = True
+
+                first_affected = min(version_start_including, first_affected)
+                last_affected = max(version_end_excluding, last_affected)
+            # Not a better match, we use the first and last affected instead of the fake .5000
+            if vulnerable and better_match_last == Version(f"{base_branch}.5000"):
+                better_match_last = last_affected
+                better_match_first = first_affected
+    return vulnerable, first_affected, last_affected, better_match_first, better_match_last, affected
+
+def copy_data(old, new):
+    '''Update dictionary with new entries, while keeping the old ones'''
+    for k in new.keys():
+        old[k] = new[k]
+    return old
+
+# Function taken from cve_check.bbclass. Adapted to cve fields
+def cve_update(cve_data, cve, entry):
+    # If no entry, just add it
+    if cve not in cve_data:
+        cve_data[cve] = entry
+        return
+    # If we are updating, there might be change in the status
+    if cve_data[cve]['status'] == "Unknown":
+        cve_data[cve] = copy_data(cve_data[cve], entry)
+        return
+    if cve_data[cve]['status'] == entry['status']:
+        return
+    if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
+        logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
+        cve_data[cve] = copy_data(cve_data[cve], entry)
+        return
+    if entry['status'] == "Patched" and cve_data[cve]['status'] == "Unpatched":
+        logging.warning("CVE entry %s update from Unpatched to Patched from the scan result", cve)
+        cve_data[cve] = copy_data(cve_data[cve], entry)
+        return
+    # If we have an "Ignored", it has a priority
+    if cve_data[cve]['status'] == "Ignored":
+        logging.debug("CVE %s not updating because Ignored", cve)
+        return
+    # If we have an "Ignored", it has a priority
+    if entry['status'] == "Ignored":
+        cve_data[cve] = copy_data(cve_data[cve], entry)
+        logging.debug("CVE entry %s updated from Unpatched to Ignored", cve)
+        return
+    logging.warning("Unhandled CVE entry update for %s %s from %s %s to %s",
+        cve, cve_data[cve]['status'], cve_data[cve]['detail'],  entry['status'], entry['detail'])
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Update cve-summary with kernel compiled files and kernel CVE information"
+    )
+    parser.add_argument(
+        "-s",
+        "--spdx",
+        help="SPDX2/3 for the kernel. Needs to include compiled sources",
+    )
+    parser.add_argument(
+        "--datadir",
+        type=pathlib.Path,
+        help="Directory where CVE data is",
+        required=True
+    )
+    parser.add_argument(
+        "--old-cve-report",
+        help="CVE report to update. (Optional)",
+    )
+    parser.add_argument(
+        "--kernel-version",
+        help="Kernel version. Needed if old cve_report is not provided (Optional)",
+        type=Version
+    )
+    parser.add_argument(
+        "--new-cve-report",
+        help="Output file",
+        default="cve-summary-enhance.json"
+    )
+    parser.add_argument(
+        "-D",
+        "--debug",
+        help='Enable debug ',
+        action="store_true")
+
+    args = parser.parse_args()
+
+    if args.debug:
+        log_level=logging.DEBUG
+    else:
+        log_level=logging.INFO
+    logging.basicConfig(format='[%(filename)s:%(lineno)d] %(message)s', level=log_level)
+
+    if not args.kernel_version and not args.old_cve_report:
+        parser.error("either --kernel-version or --old-cve-report are needed")
+        return -1
+
+    # by default we don't check the compiled files, unless provided
+    compiled_files = []
+    if args.spdx:
+        compiled_files = read_spdx(args.spdx)
+        logging.info("Total compiled files %d", len(compiled_files))
+
+    if args.old_cve_report:
+        with open(args.old_cve_report, encoding='ISO-8859-1') as f:
+            cve_report = json.load(f)
+    else:
+        #If summary not provided, we create one
+        cve_report = {
+            "version": "1",
+            "package": [
+                {
+                    "name": "linux-yocto",
+                    "version": str(args.kernel_version),
+                    "products": [
+                        {
+                            "product": "linux_kernel",
+                            "cvesInRecord": "Yes"
+                        }
+                    ],
+                    "issue": []
+                }
+            ]
+        }
+
+    for pkg in cve_report['package']:
+        is_kernel = False
+        for product in pkg['products']:
+            if product['product'] == "linux_kernel":
+                is_kernel=True
+        if not is_kernel:
+            continue
+
+        kernel_cves = get_kernel_cves(args.datadir,
+                                      compiled_files,
+                                      Version(pkg["version"]))
+        logging.info("Total kernel cves from kernel CNA: %s", len(kernel_cves))
+        cves = {issue["id"]: issue for issue in pkg["issue"]}
+        logging.info("Total kernel before processing cves: %s", len(cves))
+
+        for cve in kernel_cves:
+            cve_update(cves, cve, kernel_cves[cve])
+
+        pkg["issue"] = []
+        for cve in sorted(cves):
+            pkg["issue"].extend([cves[cve]])
+        logging.info("Total kernel cves after processing: %s", len(pkg['issue']))
+
+    with open(args.new_cve_report, "w", encoding='ISO-8859-1') as f:
+        json.dump(cve_report, f, indent=2)
+
+    return 0
+
+if __name__ == "__main__":
+    sys.exit(main())
+

