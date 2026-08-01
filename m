Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B382DC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 20:38:03 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12608.1785616679319031615
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 13:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DFij76QT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260801203755dc887460ae000207be-et0fqb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260801203755dc887460ae000207be
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Aug 2026 22:37:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AzWP4DeCdUHona4Em3dMOLG6w3GO4kVeJgGBBkPdbc4=;
 b=DFij76QTFtxcqqOIKd5sW312fkLuQXL3FUU1/S8u7eSLLHmBoXohA7kHUNbA/60KqqeseA
 wH2e8ZFUSVqPVvSO2hVQ2sck+nbyyS5a3srFfhZ7rCm26klPESLK8sY4thV3ovq4qI1lsDem
 zaLXdODwQkl9S3yFcmXGt3qkNM4Q0QIaht2DEIKzlXxiOakWFI1icCSN4LvbStTK49BZBfH9
 QbEqMmySxZoQDUlZ5vecs6q/RpJMGVtrNfwcD69yy4XMYFYSvky5Mb/ayYaWeKeYx8c/2xE3
 /sI+cCSuSFKyKTuWA56riT4e1yYis9t99LN6OqMV9itRKV0BBSwokfgQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] busybox: patch CVE-2026-38754
Date: Sat,  1 Aug 2026 22:37:36 +0200
Message-ID: <20260801203736.3751775-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242501

From: Peter Marko <peter.marko@siemens.com>

Pick patch which fixes this CVE as discussed in [1].

[1] https://lists.busybox.net/pipermail/busybox/2026-July/092392.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2026-38754.patch      | 155 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.38.0.bb   |   1 +
 ...-prefixed-CVEList-version-expression.patch | 103 ++++++++++++
 3 files changed, 259 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
 create mode 100644 meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check/0001-db_cvelist-parse-prefixed-CVEList-version-expression.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
new file mode 100644
index 0000000000..fa457b3191
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
@@ -0,0 +1,155 @@
+From a448b6d5b21e5b21249391389b6f0551d9bea136 Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Thu, 18 Jun 2026 17:04:20 +0900
+Subject: [PATCH] ash: fix out-of-bounds read in ifsbreakup()
+
+ifsfree() does not only release allocated ifsregion nodes; it also clears
+the global IFS region state used by ifsbreakup(). If argstr() raises an
+error while expanding an argument, ash longjmps out of expandarg() before
+that cleanup runs, leaving stale IFS split offsets behind.
+
+A later expansion can reuse the stack for a shorter string. ifsbreakup()
+then sees the stale IFS state, trusts the old offsets, and can walk past
+the current stack block before dereferencing p.
+
+Follow dash's root-cause fix: when an expansion-related handler catches
+EXERROR and continues, restore the handler and call ifsfree(). Apply
+the cleanup to redirectsafe(), expandstr(), and evaltree().
+
+Upstream commit:
+
+    Date:   Mon Dec 5 23:02:01 2022 +0800
+    expand: Add ifsfree to expand to fix a logic error that causes a buffer over-read
+
+    On Mon, Jun 20, 2022 at 02:27:10PM -0400, Alex Gorinson wrote:
+    > Due to a logic error in the ifsbreakup function in expand.c if a
+    > heredoc and normal command is run one after the other by means of a
+    > semi-colon, when the second command drops into ifsbreakup the command
+    > will be evaluated with the ifslastp/ifsfirst struct that was set when
+    > the here doc was evaluated. This results in a buffer over-read that
+    > can leak the program's heap, stack, and arena addresses which can be
+    > used to beat ASLR.
+    >
+    > Steps to Reproduce:
+    > First bug:
+    > cmd args: ~/exampleDir/example> dash
+    > $ M='AAAAAAAAAAAAAAAAA'    <note: 17 A's>
+    > $ q00(){
+    > $ <<000;echo
+    > $ ${D?$M$M$M$M$M$M}        <note: 6 $M's>
+    > $ 000
+    > $ }
+    > $ q00                      <note: After the q00 is typed in, the leak
+    > should be echo'd out; this works with ash, busybox ash, and dash and
+    > with all option args.>
+    >
+    > Patch:
+    > Adding the following to expand.c will fix both bugs in one go.
+    > (Thank you to Harald van Dijk and Michael Greenberg for doing the
+    > heavy lifting for this patch!)
+    > ==========================
+    > --- a/src/expand.c
+    > +++ b/src/expand.c
+    > @@ -859,6 +859,7 @@
+    > if (discard)
+    > return -1;
+    >
+    > +ifsfree();
+    > sh_error("Bad substitution");
+    > }
+    >
+    > @@ -1739,6 +1740,7 @@
+    > } else
+    > msg = umsg;
+    > }
+    > +ifsfree();
+    > sh_error("%.*s: %s%s", end - var - 1, var, msg, tail);
+    >  }
+    > ==========================
+
+    Thanks for the report!
+
+    I think it's better to add the ifsfree() call to the exception
+    handling path as other sh_error calls may trigger this too.
+
+function                                             old     new   delta
+restore_handler_expandarg                              -      33     +33
+evaltree                                             725     711     -14
+static.redirectsafe                                  141     124     -17
+expandstr                                            262     242     -20
+------------------------------------------------------------------------------
+(add/remove: 1/0 grow/shrink: 0/3 up/down: 36/-45)            Total: -18 bytes
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-38754
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/a448b6d5b21e5b21249391389b6f0551d9bea136]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ shell/ash.c | 24 +++++++++++++++---------
+ 1 file changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index fb887f31b..b8ff67b16 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -5574,6 +5574,7 @@ write2pipe(int pip[2], const char *p, size_t len)
+ 
+ /* openhere needs this forward reference */
+ static void expandhere(union node *arg);
++static void ifsfree(void);
+ static int
+ openhere(union node *redir)
+ {
+@@ -5998,6 +5999,17 @@ redirect(union node *redir, int flags)
+ 	//	preverrout_fd = copied_fd2;
+ }
+ 
++static void
++restore_handler_expandarg(struct jmploc *savehandler, int err)
++{
++	exception_handler = savehandler;
++	if (err) {
++		if (exception_type != EXERROR)
++			longjmp(exception_handler->loc, 1);
++		ifsfree();
++	}
++}
++
+ static int
+ redirectsafe(union node *redir, int flags)
+ {
+@@ -6013,9 +6025,7 @@ redirectsafe(union node *redir, int flags)
+ 		exception_handler = &jmploc;
+ 		redirect(redir, flags);
+ 	}
+-	exception_handler = savehandler;
+-	if (err && exception_type != EXERROR)
+-		longjmp(exception_handler->loc, 1);
++	restore_handler_expandarg(savehandler, err);
+ 	RESTORE_INT(saveint);
+ 	return err;
+ }
+@@ -9792,9 +9802,7 @@ evaltree(union node *n, int flags)
+ 			trap_depth--;
+ 			in_trap_ERR = 0;
+ 
+-			exception_handler = savehandler;
+-			if (err && exception_type != EXERROR)
+-				longjmp(exception_handler->loc, 1);
++			restore_handler_expandarg(savehandler, err);
+ 
+ 			exitstatus = savestatus;
+ 		}
+@@ -14009,9 +14017,7 @@ expandstr(const char *ps, int syntax_type)
+ 	result = stackblock();
+ 
+ out:
+-	exception_handler = savehandler;
+-	if (err && exception_type != EXERROR)
+-		longjmp(exception_handler->loc, 1);
++	restore_handler_expandarg(savehandler, err);
+ 
+ 	doprompt = saveprompt;
+ 	/* Try: PS1='`xxx(`' */
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
index 5ae58ce37f..a75c6394e9 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -59,6 +59,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
            file://CVE-2025-60876.patch \
            file://CVE-2024-58251.patch \
+           file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check/0001-db_cvelist-parse-prefixed-CVEList-version-expression.patch b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check/0001-db_cvelist-parse-prefixed-CVEList-version-expression.patch
new file mode 100644
index 0000000000..ca711b74b9
--- /dev/null
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check/0001-db_cvelist-parse-prefixed-CVEList-version-expression.patch
@@ -0,0 +1,103 @@
+From 8ecb305e08df290abf09dec466aeb9493f4adf79 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sat, 1 Aug 2026 12:32:31 +0200
+Subject: [PATCH] db_cvelist: parse prefixed CVEList version expressions
+
+Handle affected.version values prefixed with comparison operators
+(<, <=, >, >=, =), and add regression tests for range evaluation
+behavior.
+
+Upstream-Status: Submitted [github]
+
+Assisted-by: GitHub Copilot (GPT-5.3-Codex)
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/sbom_cve_check/database/db_cvelist.py | 20 ++++++++++++++++++
+ tests/test_version.py                     | 25 +++++++++++++++++++++++
+ 2 files changed, 45 insertions(+)
+
+diff --git a/src/sbom_cve_check/database/db_cvelist.py b/src/sbom_cve_check/database/db_cvelist.py
+index fdc60a0..f6a437b 100644
+--- a/src/sbom_cve_check/database/db_cvelist.py
++++ b/src/sbom_cve_check/database/db_cvelist.py
+@@ -2,6 +2,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
+ 
+ import json
++import re
+ from collections.abc import Generator, Iterable
+ from datetime import datetime
+ from typing import Any
+@@ -31,6 +32,8 @@ class CveListVulnEntry(VulnRecordDbEntry):
+     Vulnerability entry from the CVEList V5 database.
+     """
+ 
++    _vers_cmp_prefix_re = re.compile(r"^\s*(<=|<|>=|>|=)\s*(\S(?:.*\S)?)\s*$")
++
+     def __init__(self, parent_db: VulnDatabase, json_obj: dict[str, Any]) -> None:
+         """
+         Initialize the CveListVulnEntry.
+@@ -195,6 +198,23 @@ class CveListVulnEntry(VulnRecordDbEntry):
+         if vers_val is None:
+             return None
+ 
++        vers_val = vers_val.strip()
++        cmp_prefix = CveListVulnEntry._vers_cmp_prefix_re.match(vers_val)
++        if cmp_prefix:
++            cmp_op, cmp_vers = cmp_prefix.groups()
++            if cmp_op == "<":
++                vers_range_builder.set_end_version(cmp_vers, including=False)
++            elif cmp_op == "<=":
++                vers_range_builder.set_end_version(cmp_vers, including=True)
++            elif cmp_op == ">":
++                vers_range_builder.set_start_version(cmp_vers, including=False)
++            elif cmp_op == ">=":
++                vers_range_builder.set_start_version(cmp_vers, including=True)
++            else:
++                vers_range_builder.set_start_version(cmp_vers, equal=True)
++
++            return vers_range_builder.create()
++
+         if v_end_le or v_end_lt or (vers_range_builder.vers_type == VersionType.GIT):
+             vers_range_builder.set_start_version(vers_val, including=True)
+         else:
+diff --git a/tests/test_version.py b/tests/test_version.py
+index 97e5335..d001596 100644
+--- a/tests/test_version.py
++++ b/tests/test_version.py
+@@ -3,6 +3,7 @@ from typing import Any
+ 
+ import pytest
+ 
++from sbom_cve_check.database.db_cvelist import CveListVulnEntry
+ from sbom_cve_check.vuln.version import INFINITY, SemVerRange, Version, VersRangeStatus
+ 
+ 
+@@ -379,3 +380,27 @@ def test_create_major_minor(test_data: tuple[str, str | None]) -> None:
+         assert v2.original == exp
+     else:
+         assert exp is None
++
++
++@pytest.mark.parametrize(
++    "version_expr,tested,expected",
++    [
++        ("< 9.1.0697", "9.1.0696", VersRangeStatus.IN_RANGE),
++        ("< 9.1.0697", "9.2", VersRangeStatus.GREATER),
++        ("<= 9.1.0697", "9.1.0697", VersRangeStatus.IN_RANGE),
++        ("<= 9.1.0697", "9.2", VersRangeStatus.GREATER),
++        ("> 9.1.0697", "9.2", VersRangeStatus.IN_RANGE),
++        ("> 9.1.0697", "9.1.0697", VersRangeStatus.SMALLER),
++        (">= 9.1.0697", "9.1.0697", VersRangeStatus.IN_RANGE),
++        (">= 9.1.0697", "9.1.0696", VersRangeStatus.SMALLER),
++        ("= 9.1.0697", "9.1.0697", VersRangeStatus.IN_RANGE),
++    ],
++)
++def test_cvelist_prefixed_version_expr(
++    version_expr: str, tested: str, expected: VersRangeStatus
++) -> None:
++    version_json = {"version": version_expr, "status": "affected"}
++    vers_range = CveListVulnEntry._parse_affected_version(version_json)
++
++    assert vers_range is not None
++    assert vers_range.check_in_range(Version(tested)) == expected

