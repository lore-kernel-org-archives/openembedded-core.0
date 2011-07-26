Received: from mx2.ll.mit.edu ([129.55.12.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=6188cc0d54=jmitchell@ll.mit.edu>)
	id 1Qlpuq-0000II-Dx for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:15:52 +0200
Received: from LLE2K7-HUB02.mitll.ad.local (LLE2K7-HUB02.mitll.ad.local) by
	mx2.ll.mit.edu (unknown) with ESMTP id p6QLvZOR012193 for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:57:35 -0400
Message-ID: <4E2F384F.6060907@ll.mit.edu>
Date: Tue, 26 Jul 2011 17:57:35 -0400
From: Jeff Mitchell <jmitchell@ll.mit.edu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110721 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.4.6813, 1.0.211,
	0.0.0000
	definitions=2011-07-26_06:2011-07-26, 2011-07-26,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=4
	phishscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
	reason=mlx
	scancount=1 engine=6.0.2-1012030000 definitions=main-1107260204
Subject: [PATCH] bb-matrix.sh: check for the existence of time
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
X-List-Received-Date: Tue, 26 Jul 2011 22:15:52 -0000
X-Groupsio-MsgNum: 6764
Content-Type: multipart/mixed; boundary="------------000001030101080001000204"

--------------000001030101080001000204
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

What an existential subject. The patch is quite self-explanatory.

Thanks,
Jeff

--------------000001030101080001000204
Content-Type: text/x-patch;
	name="0001-Check-that-the-time-binary-is-installed-in-usr-bin-t.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-Check-that-the-time-binary-is-installed-in-usr-bin-t.pa";
	filename*1="tch"

From 62972e71cd952a890068a1f6b6e2234608747a1c Mon Sep 17 00:00:00 2001
From: Jeff Mitchell <jmitchell@ll.mit.edu>
Date: Tue, 26 Jul 2011 17:45:58 -0400
Subject: [PATCH] Check that the time binary is installed in /usr/bin/time when running
 bb-matrix.sh. Also fix a typo.

---
 scripts/contrib/bb-perf/bb-matrix.sh |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
index b9edd5f..66bd567 100755
--- a/scripts/contrib/bb-perf/bb-matrix.sh
+++ b/scripts/contrib/bb-perf/bb-matrix.sh
@@ -18,7 +18,7 @@
 # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 #
 # DESCRIPTION
-# This script runs BB_CMD (typically building core-image-sato) for all
+# This script runs BB_CMD (typically building core-image-minimal) for all
 # combincations of BB_RANGE and PM_RANGE values. It saves off all the console
 # logs, the buildstats directories, and creates a bb-pm-runtime.dat file which
 # can be used to postprocess the results with a plotting tool, spreadsheet, etc.
@@ -32,6 +32,11 @@
 # Darren Hart <dvhart@linux.intel.com>
 #
 
+if [ ! -f /usr/bin/time ]; then
+  echo "The \"time\" binary was not found at /usr/bin/time -- please install it!"
+  exit 1
+fi
+
 # The following ranges are appropriate for a 4 core system with 8 logical units
 BB_RANGE="04 05 06 07 08 09 10 11 12 13 14 15 16"
 PM_RANGE="04 05 06 07 08 09 10 11 12 13 14 15 16"
@@ -48,7 +53,7 @@ TIME_STR="%e %S %U %P %c %w %R %F %M %x"
 mkdir $DATADIR
 if [ $? -ne 0 ]; then
 	echo "Failed to create $DATADIR."
-	exit 1
+	exit 2
 fi
 
 # Add a simple header
-- 
1.7.3.4


--------------000001030101080001000204--
