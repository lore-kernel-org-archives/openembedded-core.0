Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105A7ECD983
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 16:12:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24389.1770307969376635299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 08:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 652EC1516
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Feb 2026 08:12:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BC433F632
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Feb 2026 08:12:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/logparser: ignore comments in the test log
Date: Thu,  5 Feb 2026 16:12:43 +0000
Message-ID: <20260205161243.3884987-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205161243.3884987-1-ross.burton@arm.com>
References: <20260205161243.3884987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230584

Whilst the log format is normally pretty simple:

  PASS: foo
  SKIP: bar

It's entirely possible for there to be an explanatory comment:

  SKIP: bar # only runs under Windows

We currently use the entire string after the test state as the test
name, which includes the comment.  This can lead to long test names, for
example:

  test_dtype.py:TestStructuredObjectRefcounting.test_structured_object_
  create_delete[ones-1-<subarray>]_#_SKIP_Python_3.12_has_immortal_
  refcounts,_this_test_will_no_longer_work._See_gh-23986

Whilst these test names are very long it isn't normally a problem, but
some packages have non-deterministic skip messages:

  test_ufunc.py:TestUfunc.test_identityless_reduction_huge_array_#_
  SKIP_6.442450944_GB_memory_required,_but_3.366531072_GB_available

This leads to churn in the test reports.

The comment isn't needed, so strip it out when computing the test name.

Note that this will result in a number of tests disappearing in the test
reports, with an identical number of new tests appearing.

[1] https://www.gnu.org/software/automake/manual/automake.html#Scripts_00=
2dbased-Testsuites-1

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/logparser.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logpa=
rser.py
index 496d9e0c90..c479864162 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -77,10 +77,18 @@ class PtestParser(object):
                 for t in test_regex:
                     result =3D test_regex[t].search(line)
                     if result:
+                        section =3D result.group(1)
+                        # It's possible that the output contains a comme=
nt, eg:
+                        #   SKIP: test_something # only needed for Windo=
ws
+                        # If there's a comment, remove it.
+                        if "#" in section:
+                            section =3D section.partition("#")[0]
+                        section =3D section.strip()
+
                         try:
-                            self.results[current_section['name']][result=
.group(1).strip()] =3D t
+                            self.results[current_section['name']][sectio=
n] =3D t
                         except KeyError:
-                            bb.warn("Result with no section: %s - %s" % =
(t, result.group(1).strip()))
+                            bb.warn("Result with no section: %s - %s" % =
(t, section))
=20
         # Python performance for repeatedly joining long strings is poor=
, do it all at once at the end.
         # For 2.1 million lines in a log this reduces 18 hours to 12s.
--=20
2.43.0


