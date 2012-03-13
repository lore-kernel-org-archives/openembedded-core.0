Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7TUF-0005Tv-S4 for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 16:18:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DF9OpD028188
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:09:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26998-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:09:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DF9FAu028181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:09:16 GMT
Message-ID: <1331651355.17122.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 15:09:15 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] ppp: Clean up PACKAGES vs. variable mismatch and drop unused RDEPENDS
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
X-List-Received-Date: Tue, 13 Mar 2012 15:18:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The RPDEPENDS format is wrong and couldn't have been doing anything useful. The
mismatch between PACKAGES and the DESCRIPTION_* and FILES_*  variable names could
confuse the system under certain conditions so this is a good cleanup to make.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 13216e3..9232e6f 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -52,7 +52,7 @@ do_install_append () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
-PACKAGES =+ "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-l2tp ppp-tools"
+PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd"
 FILES_${PN}_nylon  = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${sbindir}/tdbread"
 FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
@@ -64,15 +64,14 @@ FILES_${PN}-minconn  = "${libdir}/pppd/${PV}/minconn.so"
 FILES_${PN}-password = "${libdir}/pppd/${PV}/pass*.so"
 FILES_${PN}-l2tp     = "${libdir}/pppd/${PV}/*l2tp.so"
 FILES_${PN}-tools    = "${sbindir}/pppstats ${sbindir}/pppdump"
-DESCRIPTION_ppp-oa       = "Plugin for PPP needed for PPP-over-ATM"
-DESCRIPTION_ppp-oe       = "Plugin for PPP needed for PPP-over-Ethernet"
-DESCRIPTION_ppp-radius   = "Plugin for PPP that are related to RADIUS"
-DESCRIPTION_ppp-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
-DESCRIPTION_ppp-minconn  = "Plugin for PPP to specify a minimum connect time before the idle timeout applies"
-DESCRIPTION_ppp-password = "Plugin for PPP to get passwords via a pipe"
-DESCRIPTION_ppp-l2tp     = "Plugin for PPP for l2tp support"
-DESCRIPTION_ppp-tools    = "The pppdump and pppstats utitilities"
-RDEPENDS_ppp_minconn    += "libpcap0.8"
+DESCRIPTION_${PN}-oa       = "Plugin for PPP needed for PPP-over-ATM"
+DESCRIPTION_${PN}-oe       = "Plugin for PPP needed for PPP-over-Ethernet"
+DESCRIPTION_${PN}-radius   = "Plugin for PPP that are related to RADIUS"
+DESCRIPTION_${PN}-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
+DESCRIPTION_${PN}-minconn  = "Plugin for PPP to specify a minimum connect time before the idle timeout applies"
+DESCRIPTION_${PN}-password = "Plugin for PPP to get passwords via a pipe"
+DESCRIPTION_${PN}-l2tp     = "Plugin for PPP for l2tp support"
+DESCRIPTION_${PN}-tools    = "The pppdump and pppstats utitilities"
 
 pkg_postinst_${PN}() {
 if test "x$D" != "x"; then




