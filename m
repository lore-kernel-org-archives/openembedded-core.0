Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THacs-0005K4-S9 for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:29:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDGDsD010363
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:16:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10054-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:16:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDG3Kn010357
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:16:04 +0100
Message-ID: <1348838164.15753.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Sep 2012 14:16:04 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: siteconfig: Clear cache before rebuilding
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
X-List-Received-Date: Fri, 28 Sep 2012 13:29:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This ensures consistent build results and avoids build failures when compiler flags
change for example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index ccbe5b9..2de7153 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -18,6 +18,7 @@ siteconfig_do_siteconfig_gencache () {
 		>${WORKDIR}/site_config_${MACHINE}/configure.ac
 	cd ${WORKDIR}/site_config_${MACHINE}
 	autoconf
+	rm ${PN}_cache
         CONFIG_SITE="" ${EXTRASITECONFIG} ./configure ${CONFIGUREOPTS} --cache-file ${PN}_cache
 	sed -n -e "/ac_cv_c_bigendian/p" -e "/ac_cv_sizeof_/p" \
 		-e "/ac_cv_type_/p" -e "/ac_cv_header_/p" -e "/ac_cv_func_/p" \




