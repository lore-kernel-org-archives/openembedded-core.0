Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBr80-0003jV-NT
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:53:33 +0200
Received: from mail169-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 17:40:56 +0000
Received: from mail169-tx2 (localhost [127.0.0.1])	by
	mail169-tx2-R.bigfish.com (Postfix) with ESMTP id AC1B9400F6;
	Wed, 12 Sep 2012 17:40:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh12e5h1155h)
Received: from mail169-tx2 (localhost.localdomain [127.0.0.1]) by mail169-tx2
	(MessageSwitch) id 1347471655212744_15394;
	Wed, 12 Sep 2012 17:40:55 +0000 (UTC)
Received: from TX2EHSMHS013.bigfish.com (unknown [10.9.14.245])	by
	mail169-tx2.bigfish.com (Postfix) with ESMTP id 303AB1E005B;
	Wed, 12 Sep 2012 17:40:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS013.bigfish.com
	(10.9.99.113) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 17:40:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Wed, 12 Sep 2012 12:40:51 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8CHep28015713; Wed, 12 Sep 2012 10:40:51 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2012 12:40:47 -0500
Message-ID: <1347471647-2486-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: scott.a.garman@intel.com
Subject: [for-denzil] eglibc_2.15: make patch only for Freescale machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 17:53:33 -0000
Content-Type: text/plain

It's only Freescale machines that don't imlpement fsqrt, we don't want
this to effect others.

This patch was only added after the last release of denzil, so it's not
present in the release yet. Also, 2.15 is removed from master so it
should only apply to denzil branch

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index dc2a546..41f39b2 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r8"
+PR = "r9"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
@@ -23,13 +23,14 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://ppc-sqrt_finite.patch \
            file://GLRO_dl_debug_mask.patch \
            file://initgroups_keys.patch \
-	   file://glibc.no_sqrt.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
 
+SRC_URI_append_fslmachine = " file://glibc.no_sqrt.patch"
+
 SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
1.7.9.7




