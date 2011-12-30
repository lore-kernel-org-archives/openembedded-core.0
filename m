Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RgRT5-0008KT-0c
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 02:41:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2011 17:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92753308"
Received: from unknown (HELO localhost) ([10.255.15.202])
	by orsmga002.jf.intel.com with ESMTP; 29 Dec 2011 17:33:54 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 19:29:06 -0600
Message-Id: <0cb3e0ec1947d62587792ad883c8926e8f39072b.1325208086.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325208086.git.tom.zanussi@intel.com>
References: <cover.1325208086.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] rpm2cpio.sh: make compression tests case-insensitive
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
X-List-Received-Date: Fri, 30 Dec 2011 01:41:11 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

In the rpm2cpio.sh script, the output of $COMPRESSION is tested for
certain lowercase strings such as 'xz' in order to determine the
decompression to use.  The problem is that the output strings tested
are from the output of 'file', which uses different cases in different
versions e.g. file-5.09 prints:

tmp/sysroots/x86_64-linux/usr/bin$ ./file xxx.tar.xz: XZ compressed data

while file-5.03 prints:

tmp/sysroots/x86_64-linux/usr/bin$ ./file xxx.tar.xz: xz compressed data

In the former, the XZ string causes xz compressed payloads to
incorrectly fall through to the catch-all lzma case.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 scripts/rpm2cpio.sh |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 426fd77..5df8c0f 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -27,13 +27,13 @@ o=`expr $o + $hdrsize`
 EXTRACTOR="dd if=$pkg ibs=$o skip=1"
 
 COMPRESSION=`($EXTRACTOR |file -) 2>/dev/null`
-if echo $COMPRESSION |grep -q gzip; then
+if echo $COMPRESSION |grep -iq gzip; then
 	DECOMPRESSOR=gunzip
-elif echo $COMPRESSION |grep -q bzip2; then
+elif echo $COMPRESSION |grep -iq bzip2; then
 	DECOMPRESSOR=bunzip2
-elif echo $COMPRESSION |grep -q xz; then
+elif echo $COMPRESSION |grep -iq xz; then
 	DECOMPRESSOR=unxz
-elif echo $COMPRESSION |grep -q cpio; then
+elif echo $COMPRESSION |grep -iq cpio; then
 	DECOMPRESSOR=cat
 else
 	# Most versions of file don't support LZMA, therefore we assume
-- 
1.7.0.4



