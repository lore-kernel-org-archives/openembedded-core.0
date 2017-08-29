Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BC6D17830F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EA43F2E2F6;
	Tue, 29 Aug 2017 23:21:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0aqZIOrF-X3Z; Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E00AF2E329;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A84931A0B2;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CDCA1A0B0;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9148C2144;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLfi3030209;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLf8f030207;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:03 +0200
Message-Id: <8727628d6f2177d4aeef6a4b1b56a66901f0acc9.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 07/25] buildhistory.bbclass: Improve the generated depends.dot file
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:45 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

* Convert incorrectly formatted dependencies such as:
    "bar -> "foo" ">=" "1.2.3"
  into dependencies with edge labels:
    "bar -> "foo" [label=">= 1.2.3"]
* Remove rpmlib() and config() dependencies such as:
    "foo" -> "rpmlib(CompressedFileNames)" [label="<= 3.0.4-1"]
  and:
    "base-files" -> "config(base-files)" [label="= 3.0.14-r89.49"]
* Remove the trailing semicolon that was added to each line. It fills
  no purpose.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8eafdc9f72..3823c664ab 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -446,13 +446,20 @@ buildhistory_get_installed() {
 
 	# Produce dependency graph
 	# First, quote each name to handle characters that cause issues for dot
-	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps.txt > $1/depends.tmp && \
+	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps.txt > $1/depends.tmp &&
 		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
-	# Change delimiter from pipe to -> and set style for recommend lines
-	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
+	# Remove lines with rpmlib(...) and config(...) dependencies, change the
+	# delimiter from pipe to "->", set the style for recommend lines and
+	# turn versioned dependencies into edge labels.
+	sed -i -e '/rpmlib(/d' \
+	       -e '/config(/d' \
+	       -e 's:|: -> :' \
+	       -e 's:"\[REC\]":[style=dotted]:' \
+	       -e 's:"\([<>=]\+\)" "\([^"]*\)":[label="\1 \2"]:' \
+		$1/depends.tmp
 	# Add header, sorted and de-duped contents and footer and then delete the temp file
 	printf "digraph depends {\n    node [shape=plaintext]\n" > $1/depends.dot
-	cat $1/depends.tmp | sort | uniq >> $1/depends.dot
+	cat $1/depends.tmp | sort -u >> $1/depends.dot
 	echo "}" >>  $1/depends.dot
 	rm $1/depends.tmp
 
-- 
2.12.0


