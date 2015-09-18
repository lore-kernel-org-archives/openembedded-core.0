Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 486 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Sep 2015 10:54:28 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 550D27701E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 359502E4AC;
	Fri, 18 Sep 2015 12:46:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gIAB8+d6-761; Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 98CC12E129;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 730FB13CB;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 640751210;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 61AF534005;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t8IAkLg5028421;
	Fri, 18 Sep 2015 12:46:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t8IAkLC7028417;
	Fri, 18 Sep 2015 12:46:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 12:46:06 +0200
Message-Id: <dac35ecc99acde19aadb0a12ae8af10fb72cdfc5.1442572927.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442572927.git.pkj@axis.com>
References: <cover.1442572927.git.pkj@axis.com>
In-Reply-To: <cover.1442572927.git.pkj@axis.com>
References: <cover.1442572927.git.pkj@axis.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 3/3] oe-git-proxy: Allow socks4 as protocol in $ALL_PROXY
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
X-List-Received-Date: Fri, 18 Sep 2015 10:54:30 -0000

The current default is to use SOCKS4a when socks is specified as
protocol in $ALL_PROXY. However, not all socks servers support
SOCKS4a. By allowing socks4 as an additional protocol, this script
will happily work with SOCKS4 only servers.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-git-proxy | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index b971c88..d2e9f92 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -120,11 +120,16 @@ if [ "$PORT" = "$ALL_PROXY" ]; then
 	PORT=""
 fi
 
-if [ "$PROTO" = "socks" ]; then
+if [ "$PROTO" = "socks" ] || [ "$PROTO" = "socks4a" ]; then
 	if [ -z "$PORT" ]; then
 		PORT="1080"
 	fi
 	METHOD="SOCKS4A:$PROXY:$1:$2,socksport=$PORT"
+elif [ "$PROTO" = "socks4" ]; then
+	if [ -z "$PORT" ]; then
+		PORT="1080"
+	fi
+	METHOD="SOCKS4:$PROXY:$1:$2,socksport=$PORT"
 else
 	# Assume PROXY (http, https, etc)
 	if [ -z "$PORT" ]; then
-- 
2.1.0


