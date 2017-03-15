Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBF6605C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 12:29:25 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 03/15/2017 8:29:26 AM
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Note: SecureTide Build: 9/27/2016 9:09:05 PM UTC
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-56/SG:1 3/15/2017 8:29:10 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.470357 p=-1 Source Normal
X-Signature-Violations: 0-0-0-4769-c
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
	with ESMTPS id 123580658; Wed, 15 Mar 2017 08:29:26 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1co83R-0007aw-75; Wed, 15 Mar 2017 12:29:25 +0000
Received: from mac by chuckie with local (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1co83R-0007et-66; Wed, 15 Mar 2017 12:29:25 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 12:29:16 +0000
Message-Id: <1489580956-29398-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCHv2] ccache: Disable CCACHE_HASHDIR by default
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
X-List-Received-Date: Wed, 15 Mar 2017 12:29:26 -0000

As of ccache-3.3, ccache tries to ensure that the paths in the debug
information are always correct. It does this by including the current
directory in the hash if debug output is enabled. It includes support for
detecting remapping via a single -fdebug-prefix-map argument uses the
remapped directory in the hash instead.

The DEBUG_PREFIX_MAP in bitbake.conf remaps the source directory, target
sysroot and native sysroot separately which results in multiple
-fdebug-prefix-map arguments. Although ccache passes all these arguments
through to the compiler, it only enables the special behaviour described
above if the last one matches the current directory. (See
https://github.com/ccache/ccache/issues/163 )

Even if ccache did correctly honour each of the remapping arguments, the
hashes would still be different every time ${PV} or ${PR} change because
the default DEBUG_PREFIX_MAP contains maps to paths including them.

So it seems that for ccache to be of any use with this configuration,
CCACHE_NOHASHDIR needs to be set.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Helped-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ccache.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 76c8828..9713fea 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -2,6 +2,12 @@ CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
+# We need to stop ccache considering the current directory or the
+# debug-prefix-map target directory to be significant when calculating
+# its hash. Without this the cache would be invalidated every time
+# ${PV} or ${PR} change.
+export CCACHE_NOHASHDIR ?= "1"
+
 DEPENDS_append_class-target = " ccache-native"
 DEPENDS[vardepvalueexclude] = " ccache-native"
 
-- 
2.1.4


