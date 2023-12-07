Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95574C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 22:31:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.105744.1701988272842704092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 14:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 143EC139F;
	Thu,  7 Dec 2023 14:31:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B65CD3F5A1;
	Thu,  7 Dec 2023 14:31:11 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] tcl: skip timing-dependent tests in run-ptest
Date: Thu,  7 Dec 2023 22:31:10 +0000
Message-Id: <20231207223110.1821204-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 22:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191977

From: Ross Burton <ross.burton@arm.com>

There are several tests in the test suite which are very dependent on
timing and fail on a loaded host system, so skip them.

[ YOCTO #14825 #14882 #15081 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 5b9127784ed..51e1e4aa7b7 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -3,7 +3,11 @@
 # clock.test needs a timezone to be set
 export TZ=3D"Europe/London"
 export TCL_LIBRARY=3Dlibrary
-SKIPPED_TESTS=3D
+
+# Some tests are overly strict with timings and fail on loaded systems.
+# See bugs #14825 #14882 #15081.
+SKIPPED_TESTS=3D'cmdMZ-6.6 exit-1.* socket-* socket_inet-*'
+
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
     grep -q -F -e "Files with failing tests:" -e "Test files exiting wit=
h errors:" $i.log
--=20
2.34.1


