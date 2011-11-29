Received: from 15.mo3.mail-out.ovh.net ([87.98.150.177]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RVM0C-0007zS-1U
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 12:37:32 +0100
Received: from mail171.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 51D3510286BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:00:52 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Nov 2011 12:54:16 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Nov 2011 12:54:12 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Date: Tue, 29 Nov 2011 11:53:40 +0100
Message-Id: <1322564020-13593-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1322559291.2140.2.camel@ted>
References: <1322559291.2140.2.camel@ted>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13390327593627069890
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefiedrudejucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpeen
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefhedrtdelucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuc
Subject: [PATCH] base-passwd: fix race between the populate_sysroot and package
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
X-List-Received-Date: Tue, 29 Nov 2011 11:37:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

without this fix, we get :
ERROR: Error executing a python function in sources/openembedded-core/met=
a/recipes-core/base-passwd/base-passwd_3.5.22.bb:
IOError: [Errno 2] No such file or directory: 'tmp-angstrom_2010_x-eglibc=
/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master'

fix suggested by Richard Purdie on IRC

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/r=
ecipes-core/base-passwd/base-passwd_3.5.22.bb
index 5feb924..62847d9 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Base system master password/group files."
 DESCRIPTION =3D "The master copies of the user database files (/etc/pass=
wd and /etc/group).  The update-passwd tool is also provided to keep the =
system databases synchronized with these master files."
 SECTION =3D "base"
-PR =3D "r9"
+PR =3D "r10"
 LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
=20
@@ -23,6 +23,8 @@ ALLOW_EMPTY_${PN} =3D "1"
=20
 SSTATEPOSTINSTFUNCS +=3D "base_passwd_sstate_postinst"
=20
+addtask package after do_populate_sysroot
+
 do_install () {
 	install -d -m 755 ${D}${sbindir}
 	install -o root -g root -p -m 755 update-passwd ${D}${sbindir}/
--=20
1.7.0.4



