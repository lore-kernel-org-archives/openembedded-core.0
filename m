Received: from eu1sys200aog110.obsmtp.com ([207.126.144.129])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TrHlp-0000JF-98
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:38:04 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob110.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUOdyWR3tCeWrx18EyUkACOy/pJKJN3XJ@postini.com;
	Sat, 05 Jan 2013 00:22:49 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05AF362
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2013 14:06:16 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 381F349AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2013 14:06:16 +0000 (GMT)
Received: from localhost ([164.130.129.16]) by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AUP63231 (AUTH condorg); Fri, 4 Jan 2013 15:06:15 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 15:03:45 +0100
Message-Id: <1357308225-30900-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] gcc: restore FILESPATH
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
X-List-Received-Date: Sat, 05 Jan 2013 00:38:09 -0000

restore FILESPATH to previous setting because the new one doesn't allow the
normal use of FILESEXTRAPATHS_prepend in the case of append recipe.
In the current implementation, in fact, the FILESPATH is statically set into
the gcc-4.7.inc and so the base_set_filespath is not invoked to manage
extrapaths.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 2cfbf99..378caf0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -18,7 +18,7 @@ PV = "4.7.2"
 
 BINV = "4.7.2"
 
-FILESPATH = "${FILE_DIRNAME}/gcc-4.7"
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
 DEPENDS =+ "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
-- 
1.7.7.6



