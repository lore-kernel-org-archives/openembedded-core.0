Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01CD0782E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:49:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5D9nrjp024617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 10:49:54 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dKiSP-0002Yg-RX; Tue, 13 Jun 2017 10:49:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:49:51 +0100
Message-Id: <1497347392-9776-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 10:49:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/5] sstatetests: Use higher parallelism value
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
X-List-Received-Date: Tue, 13 Jun 2017 09:49:56 -0000

Since the processing code for signature generation is now threaded,
use higher thread values as examples in this code for better performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 8d05e30..feadf3c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -418,7 +418,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS = "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE = "-j 1"
 DL_DIR = "${TOPDIR}/download1"
 TIME = "111111"
@@ -431,7 +431,7 @@ http_proxy = ""
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
-BB_NUMBER_THREADS = "2"
+BB_NUMBER_THREADS = "${@oe.utils.cpu_count()-1}"
 PARALLEL_MAKE = "-j 2"
 DL_DIR = "${TOPDIR}/download2"
 TIME = "222222"
-- 
2.7.4


