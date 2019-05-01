Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id B4F617D72F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 13:18:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k16so24590230wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kdOLY3QZOqgZ0YWpTMInDQ1qQs0O3ck26kaoMJ9+RhA=;
	b=KmwG8BjIDdNfgMfOLEZFiRr0IcqFLFV+IReGXPRYECKaBivo/TensRpjkQl5jmzLHN
	FqajO1ol2sYbNdq684xzqrLRzXDXbsLu0W08QbQzZVZV2niPKUZE/r8J9CUPdw8GaD3b
	CpTqSvP3sHm//lROhBIvvjb+P76/0I8QynUYpwcPXrW0NShdaODfMOo+WL+7QmUr7d7k
	CCZ/1PGNLbo+DPY1CoFtViISwGRSWi4W/MCug4ur3aAZDMEN6F+8t/6FPqdJZg/2N3Yq
	/Hf+X1DsBtcHDR+6vSTAeNHNVC0XvnOFjLC25EYbk8DpHUlYdmcom2rT3+YrljURNyf+
	C5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kdOLY3QZOqgZ0YWpTMInDQ1qQs0O3ck26kaoMJ9+RhA=;
	b=ONpH26gJQkC9UHptqx1wv3T505cuXFNfEbgS2O4f/2AUzNgd5yO5M2PMFJIFQqEoYq
	WHRSddPI+ZB/6bpqXOoqFloTR62S6RzMVEIc0u5VZpfQ2YWMP2LtY+yWlpiNlOvUsmcT
	wRfZnkYr62Nl4aMx1lSETLemGvhCH30y33NQAasKJEr3z20LlKaMOnKiga3VG15tYbBx
	iJ7QnKhfn/GrPNGCtlnH9Un411hgZyHYynEHz31MttH/eXy3FLvzGBaLN9zWhjJHEvKm
	+VRHgXNRA4Cpb0apu9eSAsZlhhsGPBz+lof6huBkZplhPgd4IhrE9khDuIyXdeVaR0Bn
	hrOw==
X-Gm-Message-State: APjAAAUXk+Ssd+PcuLe3eZz6VczA9q9k3IUOhbhJB+AQpAjfU6grUpJF
	43/ipWiTdWI7xAS3fnz8kEFaW2UUTRU=
X-Google-Smtp-Source: APXvYqzUPMCEyJ/hJgmkLTujMoXhTIujZykaWmMNtAduqiLlsaefjVP8TXhDLXlt1FV4kC9yDj4Lmw==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr28603692wrp.155.1556716718930;
	Wed, 01 May 2019 06:18:38 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w10sm5495186wrv.90.2019.05.01.06.18.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 06:18:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 14:18:35 +0100
Message-Id: <20190501131835.1517-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mpg123: port to use libsdl2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 13:18:39 -0000

libsdl 1.2 is dead upstream, so change mpg123 to use libsdl2.  Luckily the APIs
that mpg123 use haven't changed, so this is just a matter of changing the
pkg-config name.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/mpg123/mpg123/sdl2.patch | 14 ++++++++++++++
 meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb |  5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/mpg123/mpg123/sdl2.patch

diff --git a/meta/recipes-multimedia/mpg123/mpg123/sdl2.patch b/meta/recipes-multimedia/mpg123/mpg123/sdl2.patch
new file mode 100644
index 00000000000..9dc9b923df2
--- /dev/null
+++ b/meta/recipes-multimedia/mpg123/mpg123/sdl2.patch
@@ -0,0 +1,14 @@
+Use libsdl2 instead of libsdl 1.2, which is dead upstream.
+
+Luckily the API that mpg123 use didn't change so this is a trivial change.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/mpg123/bugs/268/]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 6216d4f..b8d3344 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1694 +1694 @@ do
+-			PKG_CHECK_MODULES(SDL, sdl, output_modules="$output_modules sdl" HAVE_SDL="yes", HAVE_SDL="no" check_failed=yes)
++			PKG_CHECK_MODULES(SDL, sdl2, output_modules="$output_modules sdl" HAVE_SDL="yes", HAVE_SDL="no" check_failed=yes)
diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
index ff2b7d893ba..dfb10bb1cd0 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
@@ -9,7 +9,8 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
-SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
+SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
+           file://sdl2.patch"
 SRC_URI[md5sum] = "ea32caa61d41d8be797f0b04a1b43ad9"
 SRC_URI[sha256sum] = "6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023"
 
@@ -27,7 +28,7 @@ PACKAGECONFIG[jack] = ",,jack"
 PACKAGECONFIG[openal] = ",,openal-soft"
 PACKAGECONFIG[portaudio] = ",,portaudio-v19"
 PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
-PACKAGECONFIG[sdl] = ",,libsdl"
+PACKAGECONFIG[sdl] = ",,libsdl2"
 
 # Following are possible sound output modules:
 # alsa arts coreaudio dummy esd jack nas openal os2 oss portaudio pulse sdl sndio sun tinyalsa win32 win32_wasapi
-- 
2.11.0


