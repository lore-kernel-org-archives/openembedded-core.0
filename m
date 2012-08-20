Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3WpG-0003Al-Ke
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 20:35:46 +0200
Received: from mail107-ch1-R.bigfish.com (10.43.68.225) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.23; Mon, 20 Aug 2012 18:23:43 +0000
Received: from mail107-ch1 (localhost [127.0.0.1])	by
	mail107-ch1-R.bigfish.com (Postfix) with ESMTP id 05B2D2A0337	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 18:23:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail107-ch1 (localhost.localdomain [127.0.0.1]) by mail107-ch1
	(MessageSwitch) id 1345487021658988_19921;
	Mon, 20 Aug 2012 18:23:41 +0000 (UTC)
Received: from CH1EHSMHS025.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail107-ch1.bigfish.com (Postfix) with ESMTP id
	9E40F1A00B1	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 18:23:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS025.bigfish.com
	(10.43.70.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 20 Aug 2012 18:23:41 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Mon, 20 Aug 2012 13:23:40 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7KINdlR015889 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 11:23:39 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 13:23:38 -0500
Message-ID: <1345487019-931-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1345487019-931-1-git-send-email-msm@freescale.com>
References: <1345487019-931-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [for-denzil 2/3] dbus.inc: disable selinux for native builds
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
X-List-Received-Date: Mon, 20 Aug 2012 18:35:46 -0000
Content-Type: text/plain

(Note: Upstream master has disabled selinux for this AFAICT)

Fixes issues such as:

| /usr/bin/ld: cannot find -lselinux
| collect2: ld returned 1 exit status
| make[3]: *** [libdbus-glib-1.la] Error 1

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/dbus/dbus.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a75583d..e9e287b 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -70,6 +70,8 @@ EXTRA_OECONF = "--disable-tests \
                 --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
                 ${EXTRA_OECONF_X}"
 
+EXTRA_OECONF_append_virtclass-native = " --disable-selinux"
+
 do_install() {
 	autotools_do_install
 
-- 
1.7.9.7




