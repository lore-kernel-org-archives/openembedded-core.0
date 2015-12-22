Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 55484607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 09:50:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 1A50B20552
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:50:23 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Tue, 22 Dec 2015 04:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=lxqrFpUGkk9hXTJx6lQhlGyGDd
	U=; b=DJBb9I1p6Pn1gZlH0MD9EckZU0xELi84F/ilBlkMLIyA3eeL6nllF+DTjW
	+VWSzjW7ksn4xUVlkU5LgW4CWuEDmASJZUmZBMTYm5Dbw8X2TPnMPN89oDJjLDjx
	Gt7iD6s7lX98rDwjPdeBRpdOeQKY4HSAGB9QauKmiV36PXmtY=
X-Sasl-enc: wraXYkMLPdOXk4UaN5DRmpd2aoNwDKKdFRE6ijRyjwkh 1450777822
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 88973680190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:50:22 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 11:49:36 +0200
Message-Id: <1450777776-12195-1-git-send-email-tanuk@iki.fi>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] libsndfile1: enable FLAC/Ogg/Vorbis support
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
X-List-Received-Date: Tue, 22 Dec 2015 09:50:25 -0000

This makes it possible to handle FLAC and Vorbis files in programs
that use libsndfile.

It seems that the external dependencies were disabled just as a
routine measure to make builds deterministic, since the dependencies
were missing from DEPENDS[1]. Therefore it seems likely that nobody
particularly wants to have libsndfile without support for these
formats.

[1] http://git.openembedded.org/openembedded-core/commit/?id=34a14ce3ea78be299175e1a803f92519aa02355b

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
index 3b11568..a5ac84e 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Audio format Conversion library"
 HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
 AUTHOR = "Erik de Castro Lopo"
-DEPENDS = "sqlite3"
+DEPENDS = "flac libogg libvorbis sqlite3"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
 
@@ -17,8 +17,6 @@ S = "${WORKDIR}/libsndfile-${PV}"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 
-EXTRA_OECONF = "--disable-external-libs"
-
 inherit autotools lib_package pkgconfig
 
 do_configure_prepend_arm() {
-- 
2.6.4


