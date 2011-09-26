Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R8CW7-0007Js-DQ
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 16:50:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpgoQ027421 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:42 +0100
X-Quarantine-ID: <HYYHgQqLBwhk>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HYYHgQqLBwhk
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:42 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpdLl027405
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:41 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R8CQl-0007vn-R2
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 15:45:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 15:45:05 +0100
Message-Id: <0ec4a3bc9b98689c2e9b90afb3cbcbe206eb66f7.1317048110.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
References: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
References: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/03] util-linux: Ensure perl scripts reference the correct perl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2011 14:50:47 -0000

Without this change the perl path from the build system is used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index d6d6f9b..5b327cb 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r4"
+PR = "r5"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -44,3 +44,7 @@ addtask remove_lscpu before do_configure after do_patch
 # we need to disable it for older versions
 EXTRA_OECONF += "ac_cv_func_fallocate=no"
 EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
+
+do_install_append () {
+	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/chkdupexe
+}
-- 
1.7.5.4



