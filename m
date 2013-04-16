Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US27i-0003v2-Dh
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 11:24:23 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so123365eae.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer:x-gm-message-state;
	bh=kc2sB8mXPI5kqGZlOGAvUWc+RT6d/JXvtTNMUrRS75c=;
	b=jJchp+LdKTCFASu1Nht6ULjVrWQQazqJn1REUjQPJUDKR5fDWWMK2YG2mJmuG8yhAu
	Zxj7GaMURj4TROiHkHU2pfTx8I68keroqhOI5OvergMPgq536iytkhPFYazb1W+Vc4vO
	ycBeoqD0pR/eXZ1NVCvgRgtvnoi8A8HJRYLmYcURbhbEhkcsv3mlqbZaJUt9YbfiMxTT
	AryD5/2XcvJz14rOOzzNQCmxVCgASUoabJU4tSk+0li50NYQanD0RfLUh3VwoAYvxBs/
	G9se+vicDq6SNN3noByuQa2LNYbdvY1221MqOe6La9CvkiMfp2RhSxfmWD7tYZk59886
	tbXg==
X-Received: by 10.15.76.132 with SMTP id n4mr4375052eey.16.1366103211791;
	Tue, 16 Apr 2013 02:06:51 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j44sm1597776eeu.10.2013.04.16.02.06.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 02:06:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <5B2FD9C3-A643-474B-BC8A-DB24FCCBAA1A@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 11:06:52 +0200
To: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnqiGAh17ca/hkeL61GTi3zVnmo1lh2MXLtd6h6BULi+EINI82G1kdlbpHpo5cregl29i/8
Subject: Libpng 1.6.x is broken, switch back to 1.5.x before release?
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
X-List-Received-Date: Tue, 16 Apr 2013 09:24:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I've been looking into the libpng problems people have been reporting =
(e.g. #4060) and tried to upgrade 1.16.1 to fix those. Long story short, =
1.16.1 doesn't fix them. I'm currently using weston as a testbed and was =
able to narrow the problems with weston down to:

	cairo_surface_t *surface =3D =
cairo_image_surface_create_from_png(icon);

with ends up as:

	ERROR loading icon from file =
'/usr/share/icons/gnome/24x24/apps/utilities-terminal.png', error: 'out =
of memory'=20

Reverting the 1.6.0 update and rebuilding cairo against 1.5.x makes it =
work, no errors in the log and I get window decorations instead of white =
squares. I'll see if I can get libpng-1.7.0beta07.tar.gz to build today, =
but I can't spend much time on that.

All in all I'd recommend adding back the 1.5.x recipe and D_P -1'ing the =
1.6.x recipe. Thanks to shlib renaming the resulting libpng packages are =
parallel installable and PRSERV takes care of bumping affected =
recipes/packages. Switching to 1.5.x "just works" if you have this =
patch:

diff --git a/meta/recipes-graphics/pango/pango.inc =
b/meta/recipes-graphics/pango/pango.inc
index f622903..c1beb9e 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION =3D "libs"
 LICENSE =3D "LGPLv2.0+"
=20
 X11DEPENDS =3D "virtual/libx11 libxft"
-DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo =
elfutils harfbuzz"
+DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo =
elfutils harfbuzz libpng"

regards,

Koen=


