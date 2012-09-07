Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TA1G5-0002lx-2l for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 18:18:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87G5obm031000
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 17:05:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30887-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2012 17:05:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87G5g2f030994
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 17:05:43 +0100
Message-ID: <1347033943.8619.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Sep 2012 17:05:43 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Fri, 07 Sep 2012 16:18:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately whilst reruning configure and make against a project will mostly
work there are situations where it does not correctly do the right thing.

In particular, eglibc and gcc will fail out with errors where settings
do not match a previously built configuration. It could be argued they are
broken but the situation is what it is. There is the possibility of more subtle
errors too.

This patch adds a "make distclean" call to recipes where configure is
rerunning and the sstate checksum for do_configure has changed. We could
simply use a stamp but saving out the previous configuration checksum
adds some data at no real overhead.

If we find there are things out there which don't have a "distclean" target,
we can disable this behaviour with CONFIGURESTAMPFILE = "" in the recipe,
or users could disable it globally.

[YOCTO #2774]
[YOCTO #2848]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 4c4bf87..1ab2e0c 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -89,7 +89,16 @@ oe_runconf () {
 
 AUTOTOOLS_AUXDIR ?= "${S}"
 
+CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
+
 autotools_do_configure() {
+	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
+		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
+			echo "Previously configured build detected, running make distclean"
+			oe_runmake distclean
+		fi
+	fi
+
 	case ${PN} in
 	autoconf*)
 	;;
@@ -180,6 +189,9 @@ autotools_do_configure() {
 	else
 		bbnote "nothing to configure"
 	fi
+	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
+	fi
 }
 
 autotools_do_install() {




