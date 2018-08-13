Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 6801478F2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MtIO3+f1dKbGmWyqApwtv4SLwe9Nj2sLBvyi8egpqtw=;
	b=wYdJyIhoPgRpZl1FezMMY9h1Cd
	wWRD1WiAf7B6XSjeI68o3bg15e0dfuldnAUn/oaJWxaj8/Cmj+KsH7exwtUbj8fBEP27obS0cYnX5
	vP04kNKkOva1K3ijctG5IHRMR0nWWhMZ43cGaydYA/DqgYLTpnUSpEJz8/W/CJiPk4tuNiBiG/Rll
	RlNeEMG82qR3zo7ubBkU1JQO7mZhLJr2SVWwuZUkbfZVK2kkTo/+gK9VMALg3vnnyo3oDbWE9TQqW
	79kpPxlEfKpxbnwsbxBokWhfhury508xeybgMv8LwaWJUZiK7mtwUZzKtiMK4Iw5xLTt5vOJp0y5K
	l4sFAFUA==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1fp9Mu-0004vW-Bo; Mon, 13 Aug 2018 12:42:33 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1fp9Mh-0007GU-La; Mon, 13 Aug 2018 12:42:19 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 12:42:17 +0300
Message-Id: <1534153337-27563-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.1
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH v2] perf: fail if src path does not exist
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
X-List-Received-Date: Mon, 13 Aug 2018 09:42:33 -0000

A missing src directory from a broken kernel recipe resulted
only in a warning:

WARNING: copyfile: stat of /home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch failed ([Errno 2] No such file or directory: '/home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch')

and the build failed horribly.

With this change it's an error which can not be missed:

ERROR: perf-1.0-r9 do_configure: Path does not exist: /home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch. Maybe PERF_SRC does not match the kernel version.
ERROR: perf-1.0-r9 do_configure: Function failed: copy_perf_source_from_kernel
ERROR: Logfile of failure stored in: /home/builder/src/tmp-glibc/work/target-linux/perf/1.0-r9/temp/log.do_configure.21083
NOTE: recipe perf-1.0-r9: task do_configure: Failed
ERROR: Task (/home/builder/src/poky/meta/recipes-kernel/perf/perf.bb:do_configure) failed with exit code '1'

To get get perf compiling from a custom kernel, a perf.bbappend can be
created which defines PERF_SRC as list of files and directories needed
from kernel source tree to compile perf. This varies between kernel
versions.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

v1: http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154028.html
Added PERF_SRC variable to the error message and commit message
as suggested by Martin Jansa in
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154038.html

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2c6bbb4..c1ce4b4 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -147,6 +147,8 @@ python copy_perf_source_from_kernel() {
     for s in sources:
         src = oe.path.join(src_dir, s)
         dest = oe.path.join(dest_dir, s)
+        if not os.path.exists(src):
+            bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not match the kernel version." % src)
         if os.path.isdir(src):
             oe.path.copyhardlinktree(src, dest)
         else:
-- 
1.9.1


