Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T2D8Q-0004Ln-7s
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 05:22:06 +0200
Received: from mail89-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 17 Aug 2012 02:55:01 +0000
Received: from mail89-va3 (localhost [127.0.0.1])	by mail89-va3-R.bigfish.com
	(Postfix) with ESMTP id 6ACA03C02C6	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 02:55:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail89-va3 (localhost.localdomain [127.0.0.1]) by mail89-va3
	(MessageSwitch) id 1345172098959725_30636;
	Fri, 17 Aug 2012 02:54:58 +0000 (UTC)
Received: from VA3EHSMHS026.bigfish.com (unknown [10.7.14.247])	by
	mail89-va3.bigfish.com (Postfix) with ESMTP id E6F7EE0048	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 02:54:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS026.bigfish.com
	(10.7.99.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 17 Aug 2012 02:54:57 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 16 Aug 2012 21:54:56 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7H2sugU021399 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 19:54:56 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 21:54:56 -0500
Message-ID: <1345172096-10260-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] perf_3.4.bb: update to build against older kernels
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
X-List-Received-Date: Fri, 17 Aug 2012 03:22:06 -0000
Content-Type: text/plain

Removes a make install-python_ext when not present since
older versions of perf lack this install rule

This also fixes a library issue on older kernels building with
a newer toolchain where libaries that would previously be pulled
in are no longer. So we add them manually.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 505c7b8..5fb38e6 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -54,6 +54,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 
+export LDFLAGS = "-ldl -lutil"
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
 		O=${B} \
@@ -71,7 +72,8 @@ do_compile() {
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
-	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ]; then
+	# we are checking for this make target to be compatible with older perf versions
+	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
 		oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
-- 
1.7.9.7




