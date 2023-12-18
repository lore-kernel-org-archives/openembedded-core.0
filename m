Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE365C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:08:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48783.1702919285033770200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC5852F4
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:08:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E6513F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:08:03 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] tcl: skip async and event tests in run-ptest
Date: Mon, 18 Dec 2023 17:08:01 +0000
Message-Id: <20231218170801.1029196-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192667

From: Ross Burton <ross.burton@arm.com>

These test suites are full of timing-sensitive test cases, so skip
them too.

[ YOCTO #15321 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 51e1e4aa7b7..87e025fce12 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -5,8 +5,8 @@ export TZ=3D"Europe/London"
 export TCL_LIBRARY=3Dlibrary
=20
 # Some tests are overly strict with timings and fail on loaded systems.
-# See bugs #14825 #14882 #15081.
-SKIPPED_TESTS=3D'cmdMZ-6.6 exit-1.* socket-* socket_inet-*'
+# See bugs #14825 #14882 #15081 #15321.
+SKIPPED_TESTS=3D'async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet=
-*'
=20
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
--=20
2.34.1


