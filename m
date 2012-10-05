Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TKE9z-0000fN-92
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:06:11 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D22782FD1D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 15:53:02 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:46 -0700
Message-Id: <b21d1daf709ddce14c93a5f16c91ff702e1cb7ff.1349466569.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D22782FD1D.E7263
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/6] siteconfig: Clear cache before rebuilding
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
X-List-Received-Date: Fri, 05 Oct 2012 20:06:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This ensures consistent build results and avoids build failures when compiler flags
change for example.

(From OE-Core rev: a5ff8396cad130f809f8f8da49bb38e6f80f923c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/siteconfig.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index ccbe5b9..3701b7c 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -18,6 +18,7 @@ siteconfig_do_siteconfig_gencache () {
 		>${WORKDIR}/site_config_${MACHINE}/configure.ac
 	cd ${WORKDIR}/site_config_${MACHINE}
 	autoconf
+	rm -f ${PN}_cache
         CONFIG_SITE="" ${EXTRASITECONFIG} ./configure ${CONFIGUREOPTS} --cache-file ${PN}_cache
 	sed -n -e "/ac_cv_c_bigendian/p" -e "/ac_cv_sizeof_/p" \
 		-e "/ac_cv_type_/p" -e "/ac_cv_header_/p" -e "/ac_cv_func_/p" \
-- 
1.7.9.5



