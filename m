Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Px8HI-0003HN-Jp
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 02:33:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Mar 2011 17:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,287,1297065600"; 
	d="scan'208,223";a="399727801"
Received: from unknown (HELO helios.localnet) ([10.255.17.23])
	by azsmga001.ch.intel.com with ESMTP; 08 Mar 2011 17:29:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 9 Mar 2011 01:29:37 +0000
User-Agent: KMail/1.13.5 (Linux/2.6.35-27-generic-pae; KDE/4.6.0; i686; ; )
References: <cover.1299544029.git.sgw@linux.intel.com>
	<1299610544.602.109.camel@rex>
In-Reply-To: <1299610544.602.109.camel@rex>
MIME-Version: 1.0
Message-Id: <201103090129.37429.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 0/8] Numerous bug fixes
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
X-List-Received-Date: Wed, 09 Mar 2011 01:33:28 -0000
X-Groupsio-MsgNum: 333
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_BgtdNcfeg2fG2ze"

--Boundary-00=_BgtdNcfeg2fG2ze
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 08 March 2011 18:55:44 Richard Purdie wrote:
> > Saul Wold (3):
> >   gst-plugins: Added hal to DEPENDS
> >   attr: Added ncurses to depends
> >   lsb-live image: add lsb-live and lsb-sdk-live image types
> 
> Merged. I'd like to drop the hal dependency if someone can send me a
> patch which disables it and everything works.

Patch attached to do this (against oe-core) .

Cheers,
Paul

--Boundary-00=_BgtdNcfeg2fG2ze
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-gst-plugins-good-remove-dependency-on-hal.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-gst-plugins-good-remove-dependency-on-hal.patch"

From d6f52ebf89e8413f8e24bbc9ab58a0d0e5c45c09 Mon Sep 17 00:00:00 2001
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 9 Mar 2011 01:21:25 +0000
Subject: [PATCH] gst-plugins-good: remove dependency on hal

Disable hal usage at configure time to avoid dependency on hal (which is
deprecated). Only affects "halelements" which is of no use without hal.

Fixes [YOCTO #810] and reverts changes from c6b0c5720fa.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.26.bb          |    4 ++--
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
index 78b24fe..ac47ecf 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
=20
 DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag=
 flac \
 	    speex"
-PR =3D "r0"
+PR =3D "r1"
=20
 inherit gettext
=20
-EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disabl=
e-libcaca --without-check"
+EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disabl=
e-libcaca --disable-hal --without-check"
=20
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recip=
es-multimedia/gstreamer/gst-plugins.inc
index d1abd36..4edca95 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
 BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstream=
er"
 SECTION =3D "multimedia"
 PRIORITY =3D "optional"
-DEPENDS =3D "gstreamer hal"
+DEPENDS =3D "gstreamer"
=20
 inherit autotools pkgconfig
=20
--=20
1.7.1


--Boundary-00=_BgtdNcfeg2fG2ze--
