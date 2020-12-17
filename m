Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web08.1944.1608233279656378867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 11:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Pw3XiXEL;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailforward.nyi.internal (Postfix) with ESMTP id 0550A194345F
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 17 Dec 2020 14:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=xeH+jXBygewwNHJYKgqrJxr9OTvD2r/i80GegnUojYs=; b=Pw3XiXEL
	sxxS8kigDW6545VHO7wdOcdL//GQsc4QVLCni7uszwpUAvdyCK2y9wmnTfO6pqVL
	mKSTAjTdttpES4Qf4Y4JDDcE+6gpzLDzD94e/AtnvJX5F5KB1kj6/ib2lHZyMVEL
	ED+fJQ1wuNPUql5CbduGkxgBxRpLcRZwtNHK06ixCLlQ7ZS14RrigIzxJVhcfTjS
	3v2pf2kU7tPcq4BiChb62lVJkCIw21367UfgqSHdgipGceLs13Se09/viWzeZnRN
	yu4EON1xanshBKj8BWBpZdsZ+EehvuYo70CyipXbuerW6G5QqeDznga503cldsvR
	82qo1x0q+ku3Vw==
X-ME-Sender: <xms:PrHbXx_IchpAjLIC93SkQsT1SFfQS-Ts-Ekdx9CJs7rB4SoPccMrkw>
    <xme:PrHbX68YPtClhMPKMcpAVJqvz-T2-sdrcUYroz-rGN5Rg8kjVVdOnBjMqK3Nx3aIR
    tmALmdbJ8pBJyZq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
    ihdrfhhiqeenucggtffrrghtthgvrhhnpefgueeuudekfeeltdetieetueejffdvveetge
    ffgeehieeuueefkedvgefffeeifeenucfkphepudekkedruddviedrkeelrdehvdenucfu
    phgrmhfkphfpvghtfihorhhkpedukeekrdduvdeirdekledrhedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:PrHbXwtchdAgnqInkfV0uXeYe2UDrxfdlzrggUYsFi18-xGzbR20bg>
    <xmx:PrHbX9oI5zH-2c5L1-dJB08d5_cf-TJSFgVnHSqDFypmZ4t6g_yefg>
    <xmx:PrHbX9npJC6T3XvLHqS-di3zYpEjtF2PL5V1XrzmDV8H0XG68tGQow>
    <xmx:P7HbX7o-OmjhN9cGJe39kSYL4RR12qR9mV-V5J7Twwa2_8tSTZN0Qg>
Received: from localhost.localdomain (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 88679108005C
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:58 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] pulseaudio: disable GConf support
Date: Thu, 17 Dec 2020 21:27:37 +0200
Message-Id: <20201217192738.14311-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217192738.14311-1-tanuk@iki.fi>
References: <20201217192738.14311-1-tanuk@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GConf module is only needed for older versions of paprefs, other
applications shouldn't be interacting with PulseAudio's GConf settings.
Paprefs isn't packaged in OpenEmbedded, so there probably aren't any
users of the GConf functionality.

My immediate motivation for doing this is that I'm converting the
pulseaudio recipe to use Meson, and the GConf module isn't supported by
the Meson build system. Adding support for it would be possible, but
pretty pointless.

The GConf module will be removed in PulseAudio 15.0.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ad059404f8..48759bca62 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -80,6 +80,7 @@ EXTRA_OECONF = "\
 		--disable-tests \
 		--disable-running-from-build-tree \
 		--disable-esound \
+		--disable-gconf \
 "
 
 # soxr (the SoX Resampler library) doesn't seem to be currently packaged in
@@ -108,7 +109,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5'
 
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
-PACKAGECONFIG[gconf] = "--enable-gconf,--disable-gconf,gconf"
 PACKAGECONFIG[gsettings] = "--enable-gsettings,--disable-gsettings,glib-2.0-native glib-2.0"
 PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
@@ -265,7 +265,6 @@ RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
 FILES_${PN}-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
-FILES_${PN}-module-gconf += "${libexecdir}/pulse/gconf-helper"
 
 GSETTINGS_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'gsettings', '${PN}-module-gsettings', '', d)}"
 FILES_${PN}-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}/GConf/gsettings ${datadir}/glib-2.0/schemas"
-- 
2.20.1

