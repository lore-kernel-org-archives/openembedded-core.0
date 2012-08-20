Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3WpG-0003Ao-EI
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 20:35:46 +0200
Received: from mail20-ch1-R.bigfish.com (10.43.68.230) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Mon, 20 Aug 2012 18:23:43 +0000
Received: from mail20-ch1 (localhost [127.0.0.1])	by mail20-ch1-R.bigfish.com
	(Postfix) with ESMTP id 6AAA32002F4	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 18:23:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail20-ch1 (localhost.localdomain [127.0.0.1]) by mail20-ch1
	(MessageSwitch) id 1345487021998144_16621;
	Mon, 20 Aug 2012 18:23:41 +0000 (UTC)
Received: from CH1EHSMHS011.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.232])	by mail20-ch1.bigfish.com (Postfix) with ESMTP id
	F21A04E0059 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 18:23:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS011.bigfish.com
	(10.43.70.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 20 Aug 2012 18:23:40 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Mon, 20 Aug 2012 13:23:40 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7KINdlS015889 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 11:23:39 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 13:23:39 -0500
Message-ID: <1345487019-931-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1345487019-931-1-git-send-email-msm@freescale.com>
References: <1345487019-931-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [for-denzil 3/3] glib.inc: disable selinux for native builds
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

In addition to dbus, we also need to disable selinux for glib as well
otherwise we will get the same link error

(Note: Upstream master has disabled selinux AFAICT)

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/dbus/dbus-glib_0.98.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.98.bb b/meta/recipes-core/dbus/dbus-glib_0.98.bb
index bd9389a..e2c6a0c 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.98.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.98.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3f7f117dc7c8d899d9acfdcbf9253fb8"
 SRC_URI[sha256sum] = "297c81d6bb8b1c312e9b0ccfe91eb28ec0672756abb64dfb7bbe2b5f1ae5d111"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
index f1f9217..81037a4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 835743a..8eda116 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -26,7 +26,7 @@ inherit autotools pkgconfig gettext
 S = "${WORKDIR}/glib-${PV}"
 
 EXTRA_OECONF = "--disable-debug --enable-included-printf=no --disable-dtrace --disable-fam"
-EXTRA_OECONF_virtclass-native = "--disable-dtrace --disable-systemtap --disable-fam"
+EXTRA_OECONF_virtclass-native = "--disable-dtrace --disable-systemtap --disable-fam --disable-selinux"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no --disable-dtrace --disable-fam"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
-- 
1.7.9.7




