Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.16609.1630328463276161124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 06:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=gl+1k4Od;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id ECD3880C85;
	Mon, 30 Aug 2021 15:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1630328460;
	bh=t73YiLOb23KVRKtzIR4ahxdZJWtnuzlGFzzab2t1dig=;
	h=From:To:Cc:Subject:Date:From;
	b=gl+1k4Od7LXrL+91DSG+zwJ+wTP2IRgukaHtt1CCjiFD8FGAeo2S207clUU6VXiBb
	 Z9UVLWeDNlxe/TUlpptJIqrXbGWtv2Mt6s4vWA2LFYMr4kd4nzlurQJ59B5hkNSJkJ
	 G/9iGqzWmc1tgC1b20Qw1Y3YV5lg4w+4KW4A860Ih44qAF8YaDlVv8g48YahVs/wG/
	 9VKCyRofJx0bvBHmL7wGfMI9j4NPsGyBuEaJKgrFOAy+nuDevCgOyX2bKxMVBVF+3f
	 nrwSWkNp3KcNdrTNHy7t8BSYOrMmCTV2ktdTIip86penxqrsBjdxWHuWDMv1gqskhL
	 MrPps3cOQkq+A==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] weston: Add rdp PACKAGECONFIG
Date: Mon, 30 Aug 2021 15:00:31 +0200
Message-Id: <20210830130031.10518-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

Weston has RDP backend support. This can be used e.g. for screen mirrorin=
g.
Add PACKAGECONFIG so it can be enabled by the user. By default, this is n=
ot
enabled, to retain the old behavior of the recipe.

Below is an example testcase of using the RDP backend for screen mirrorin=
g,
i.e. two devices display the same content across ethernet link, input on
either is passed across the link.

- Add the following to weston.ini:
  [core]
  modules=3Dscreen-share.so
  screen-share=3Dtrue
  [screen-share]
  command=3D/usr/bin/weston --backend=3Drdp-backend.so --shell=3Dfullscre=
en-shell.so --no-clients-resize --rdp-tls-cert=3D/path/to/board.crt --rdp=
-tls-key=3D/path/to/board.key --no-config

- Generate keys on the board (the board.key and board.crt above):
  $ winpr-makecert -rdp -path /path/to/

- Restart weston on the board. To start screen sharing, press
  Ctrl-Alt-S
  on the keyboard (see weston compositor/screen-share.c).

- Connect to the weston using freerdp, e.g.:
  $ xfreerdp /v:192.168.1.300

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
NOTE: I didn't find any example of setting up the screen mirroring,
      so I hope this example will be useful to someone.
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes=
-graphics/wayland/weston_9.0.0.bb
index fbf181b4a6..295cddc57d 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -32,7 +32,7 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
lto', '-Wl,-z,undefs', '',
=20
 WESTON_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
=20
-EXTRA_OEMESON +=3D "-Dbackend-default=3Dauto -Dbackend-rdp=3Dfalse -Dpip=
ewire=3Dfalse"
+EXTRA_OEMESON +=3D "-Dbackend-default=3Dauto -Dpipewire=3Dfalse"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'kms fbdev wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland'=
, 'xwayland', '', d)} \
@@ -58,6 +58,8 @@ PACKAGECONFIG[x11] =3D "-Dbackend-x11=3Dtrue,-Dbackend-=
x11=3Dfalse,virtual/libx11 libx
 PACKAGECONFIG[headless] =3D "-Dbackend-headless=3Dtrue,-Dbackend-headles=
s=3Dfalse"
 # Weston on framebuffer
 PACKAGECONFIG[fbdev] =3D "-Dbackend-fbdev=3Dtrue,-Dbackend-fbdev=3Dfalse=
,udev mtdev"
+# Weston on RDP
+PACKAGECONFIG[rdp] =3D "-Dbackend-rdp=3Dtrue,-Dbackend-rdp=3Dfalse,freer=
dp"
 # weston-launch
 PACKAGECONFIG[launch] =3D "-Dweston-launch=3Dtrue,-Dweston-launch=3Dfals=
e,drm"
 # VA-API desktop recorder
--=20
2.33.0

