Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC3067702C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9E55118218;
	Fri, 18 Sep 2015 12:46:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jOJWd8JuwIjg; Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 9D05D18217;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 670701407;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 59DC913FB;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 55F3C34005;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t8IAkLQr028414;
	Fri, 18 Sep 2015 12:46:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t8IAkLDW028413;
	Fri, 18 Sep 2015 12:46:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 12:46:05 +0200
Message-Id: <6e1ffe750afa4c9caf4781fef5782e104a204e8a.1442572927.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442572927.git.pkj@axis.com>
References: <cover.1442572927.git.pkj@axis.com>
In-Reply-To: <cover.1442572927.git.pkj@axis.com>
References: <cover.1442572927.git.pkj@axis.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 2/3] oe-git-proxy: Correct the parsing of a port in $ALL_PROXY
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
X-List-Received-Date: Fri, 18 Sep 2015 10:56:14 -0000

Due to an error in the regular expression used to extract a port
number specified in $ALL_PROXY, rather than allowing the port number
to be followed by an optional "/", the port was required to be
followed by "/?".

This corrects the regular expression to allow an optional "/". It also
allows the odd "/?" suffix for backwards compatibility.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-git-proxy | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 2473282..b971c88 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -113,7 +113,9 @@ done
 # Proxy is necessary, determine protocol, server, and port
 PROTO=$(echo $ALL_PROXY | sed -e 's/\([^:]*\):\/\/.*/\1/')
 PROXY=$(echo $ALL_PROXY | sed -e 's/.*:\/\/\([^:]*\).*/\1/')
-PORT=$(echo $ALL_PROXY | sed -e 's/.*:\([0-9]*\)\/?$/\1/')
+# For backwards compatibility, this allows the port number to be followed by /?
+# in addition to the customary optional /
+PORT=$(echo $ALL_PROXY | sed -e 's/.*:\([0-9]*\)\(\/?\?\)\?$/\1/')
 if [ "$PORT" = "$ALL_PROXY" ]; then
 	PORT=""
 fi
-- 
2.1.0


