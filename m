Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 342286BB3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id E836C349617
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tWMCIg-Erq3Q
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 4489934960C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2EDB25DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 240EC1C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2302D3404E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r86GCMcY012350
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2013 18:12:22 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r86GCMhu012349
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Sep 2013 18:12:22 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 18:12:18 +0200
Message-Id: <398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1378483732.git.pkj@axis.com>
References: <cover.1378483732.git.pkj@axis.com>
In-Reply-To: <cover.1378483732.git.pkj@axis.com>
References: <cover.1378483732.git.pkj@axis.com>
Subject: [PATCH 2/2] bb-matrix: Make sure local.conf does not interfere
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
X-List-Received-Date: Fri, 06 Sep 2013 16:12:23 -0000

If any of BB_NUMBER_THREADS, PARALLEL_MAKE or SSTATE_DIR happened to be
set in local.conf then the bb-matrix script would not perform as
intended.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/contrib/bb-perf/bb-matrix.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
index 1064565..d5127e7 100755
--- a/scripts/contrib/bb-perf/bb-matrix.sh
+++ b/scripts/contrib/bb-perf/bb-matrix.sh
@@ -53,6 +53,10 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
+# Make sure neither of BB_NUMBER_THREADS, PARALLEL_MAKE and SSTATE_DIR are set
+# in local.conf
+sed -ri 's/^([[:space:]]*(BB_NUMBER_THREADS|PARALLEL_MAKE|SSTATE_DIR)[[:space:]]*\??=.*)/#\1/' conf/local.conf
+
 # Add a simple header
 echo "BB PM $TIME_STR" > $RUNTIME_LOG
 for BB in $BB_RANGE; do
-- 
1.8.2.1


