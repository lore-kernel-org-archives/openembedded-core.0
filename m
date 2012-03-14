Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7cBU-0006dM-FG for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:35:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2E0QaXP001568
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 00:26:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01207-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 00:26:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2E0QTZ9001562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 00:26:30 GMT
Message-ID: <1331684788.18586.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 00:26:28 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] opensp: Fix unnecessary rpath warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 00:35:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Stale m4 macros seemed to be corrupting the opensp build. By removing
them, we can fix the warnings:

WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/spent contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/onsgmls contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/ospcat contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/osgmlnorm contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/sgmlnorm contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/ospent contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/ospam contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/nsgmls contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/spcat contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/osx contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/spam contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/sx contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/sgml2xml contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/lib/libosp.so.3.0.0 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/lib/libosp.so.3 contains probably-redundant RPATH /usr/lib

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb b/meta/recipes-devtools/opensp/opensp_1.5.bb
index d692137..e225add 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
@@ -29,6 +29,11 @@ EXTRA_OECONF_virtclass-native = "\
 	--enable-default-search-path=${datadir}/sgml \
 	"
 
+do_configure_prepend () {
+	# Stale m4 macros cause a variety of problems
+	rm -rf ${S}/m4/*
+}
+
 do_install_append() {
 	# Set up symlinks to often-used alternate names. See
 	# http://www.linuxfromscratch.org/blfs/view/stable/pst/opensp.html




