Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004O6-SN
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752313"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:29 -0800
Message-Id: <d1569f2eb4c6c584784f11dbfb6d4b6e0a030a9f.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 103/113] rpm2cpio.sh: make compression tests case-insensitive
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:39 -0000

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
1.7.6.4



