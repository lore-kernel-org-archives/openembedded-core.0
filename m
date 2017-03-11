Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 958BB77964
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 16:54:35 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 03/11/2017 11:54:37 AM
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Note: SecureTide Build: 9/27/2016 9:09:05 PM UTC
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-37/SG:1 3/11/2017 11:54:36 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.598531 p=-1 Source White
X-Signature-Violations: 0-0-0-3860-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G266 G267 G268 G269 G273 G274 G402 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 121866152; Sat, 11 Mar 2017 11:54:37 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cmkHr-0006A7-QU; Sat, 11 Mar 2017 16:54:35 +0000
Received: from mac by chuckie with local (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cmkHr-0008IO-Nu; Sat, 11 Mar 2017 16:54:35 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 16:54:25 +0000
Message-Id: <1489251265-31851-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] ccache: Disable CCACHE_HASHDIR by default
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
X-List-Received-Date: Sat, 11 Mar 2017 16:54:37 -0000

As of ccache-3.3, ccache will always include the current directory
in the hash when the compiler is configured to output debug
information. The current directory will change every time ${PV}
changes, which will invalidate the cache.

ccache apparently does this so that paths in the debug information will
always be correct. In an OE world these paths may already be missing or
incorrect due to rm_work or the use of a shared sstate cache, so it doesn't
seem as if we're losing much by disabling this feature.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/ccache.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 76c8828..6b20846 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -2,6 +2,13 @@ CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
+# As of ccache-3.3, ccache will always include the current directory
+# in the hash when the compiler is configured to output debug
+# information. The current directory will change every time ${PV}
+# changes which greatly reduces the utility of ccache. So, let's not
+# consider the current directory to be significant by default.
+export CCACHE_NOHASHDIR ?= "1"
+
 DEPENDS_append_class-target = " ccache-native"
 DEPENDS[vardepvalueexclude] = " ccache-native"
 
-- 
2.1.4


