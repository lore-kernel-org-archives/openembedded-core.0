Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ronunes@gmail.com>) id 1UNBvp-0007Kj-Vy
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 02:52:10 +0200
Received: by mail-vc0-f179.google.com with SMTP id gf12so1057050vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 17:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gUOg7fWIka4V045oi08J52O3RujnHFhYulDafB97iyc=;
	b=HunZtSeN9B762INrJea/zJpjE79d5d1r22Ca4O0r2jBoNiufJdRfBjYhzsQqMl8ssp
	g0sXS/mJwBuqtvwFW6hriWAgUJuhN8ShX0/tIlU9znojMyAUw+P+PJiSaL2G/M8XW1DH
	n3+1waXf0C2SUufr2xwQRgj5py3jQlX29wOraM+dwxN52vy5Nctz0Dje6+YvTQhgCVaU
	ZjwAO0xmv067tom8SflzkfFpgGdMWD+5ZueYkc1/CvYYCj5Kr9ry6+K6ThS8MUb/H4S6
	JPtjTVmpp0k9gorfRM5JmlVYopN8Egh3YkYQVGzhczvxM/EoeTKXe/c133PtQ58J0HV8
	UHZA==
X-Received: by 10.52.68.235 with SMTP id z11mr12179395vdt.107.1364949295216;
	Tue, 02 Apr 2013 17:34:55 -0700 (PDT)
Received: from B35650-11.home (pool-173-76-33-241.bstnma.fios.verizon.net.
	[173.76.33.241])
	by mx.google.com with ESMTPS id zd13sm4489818vdb.1.2013.04.02.17.34.54
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 17:34:54 -0700 (PDT)
From: Rogerio Nunes <ronunes@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2013 20:34:44 -0400
Message-Id: <1364949284-32569-2-git-send-email-ronunes@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
References: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
Subject: [PATCH 2/2] gst-plugins-bad: disable librsvg when x11 is disabled
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
X-List-Received-Date: Wed, 03 Apr 2013 00:52:20 -0000

librsvg depends on gtk+, which in turn does not support framebuffer
as backend in current version (2.15.24). This patch disables librsvg
when x11 is not in the distro.

Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 9039f97..eb289c7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base tremor librsvg curl"
+DEPENDS += "gst-plugins-base tremor curl"
 
-PR = "r3"
+PR = "r4"
 
 inherit gettext
 
@@ -16,6 +16,9 @@ EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disab
                  --with-plugins=wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink \
                  --disable-orc"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'librsvg', '', d)}"
+PACKAGECONFIG[librsvg] = "--enable-librsvg,--disable-librsvg,librsvg,"
+
 ARM_INSTRUCTION_SET = "arm"
 
 do_configure_prepend() {
-- 
1.7.9.5



