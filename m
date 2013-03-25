Received: from 16.mo1.mail-out.ovh.net ([178.33.104.224]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UJxCB-0005yR-FZ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 03:31:55 +0100
Received: from mail630.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 9A0E5FF8B6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 02:12:29 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Mar 2013 02:55:12 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (mail@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 25 Mar 2013 02:55:11 +0200
Received: from b5-vm-mint0.betafive.co.uk (b5-vm-mint0.betafive.co.uk
	[192.168.0.100])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 482AD1607DF;
	Mon, 25 Mar 2013 00:54:41 +0000 (GMT)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Mon, 25 Mar 2013 00:55:06 +0000
Message-Id: <1364172907-14541-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1364172907-14541-1-git-send-email-paul@paulbarker.me.uk>
References: <1364172907-14541-1-git-send-email-paul@paulbarker.me.uk>
X-Ovh-Tracer-Id: 11560458768870050242
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrieejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrieejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [PATCH 1/2] gnupg: Replace manual link with update-alternatives
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
X-List-Received-Date: Mon, 25 Mar 2013 02:32:04 -0000

Removed manual creation of '/usr/bin/gpg' link to 'gpg2' and replaced with
proper usage of update-alternatives.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
index 8cd793b..2322a9e 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -9,7 +9,7 @@ PTH = "pth"
 PTH_libc-uclibc = "npth"
 PR = "r5"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://GnuPG2-CVE-2012-6085.patch"
@@ -25,6 +25,7 @@ EXTRA_OECONF = "--disable-ldap \
                 --with-readline=${STAGING_LIBDIR}/.. \
                "
 
-do_install_append() {
-	ln -sf gpg2 ${D}${bindir}/gpg
-}
+ALTERNATIVE_gnupg = "gpg"
+ALTERNATIVE_TARGET[gpg] = "${bindir}/gpg2"
+ALTERNATIVE_LINK_NAME[gpg] = "${bindir}/gpg"
+ALTERNATIVE_PRIORITY[gpg] = "100"
-- 
1.7.10.4



