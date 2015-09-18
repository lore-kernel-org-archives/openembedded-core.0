Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9E4277028
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 491AA18219;
	Fri, 18 Sep 2015 12:46:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 47p-dV06uk1H; Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 9B99E180F1;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 57EEF13EB;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 4C53913E2;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 499E23E0BB;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t8IAkL0x028408;
	Fri, 18 Sep 2015 12:46:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t8IAkLMC028406;
	Fri, 18 Sep 2015 12:46:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 12:46:04 +0200
Message-Id: <01273889ff884336a3b1d5e2492758b7c81fb6e5.1442572927.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442572927.git.pkj@axis.com>
References: <cover.1442572927.git.pkj@axis.com>
In-Reply-To: <cover.1442572927.git.pkj@axis.com>
References: <cover.1442572927.git.pkj@axis.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/3] oe-git-proxy: Allow explicit IP addresses in $NO_PROXY
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

Without this fix, if one specified, e.g., 127.0.0.1 in $NO_PROXY, the
oe-git-proxy script would fail with a message like this:

/home/pkj/yocto/poky/scripts/oe-git-proxy: line 64: 32-127.0.0.1: syntax error: invalid arithmetic operator (error token is ".0.0.1")

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-git-proxy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 4873455..2473282 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -53,6 +53,7 @@ match_ipv4() {
 
 	# Determine the mask bitlength
 	BITS=${CIDR##*/}
+	[ "$BITS" != "$CIDR" ] || BITS=32
 	if [ -z "$BITS" ]; then
 		return 1
 	fi
-- 
2.1.0


