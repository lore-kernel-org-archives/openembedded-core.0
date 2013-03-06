Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDDEQ-0006H9-Qp
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 13:14:08 +0100
Received: by mail-we0-f172.google.com with SMTP id d46so3682595wer.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 03:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=SRwAZWjkIe3vsRegWWcdB5yH53TV3J8QgG9NQ2Hp2Fk=;
	b=nKaOHi7C21BcpVB9UKF/KjvtvkofQtUOsCoY0uLdwReJD6QxfUkIT1wRi2TXTo4Tja
	GI/4119owddLL+tIfmuvTtaDTekooG9nRlhqcQ/2QrkmRI6kIumIRJbwrw/ewVx3kxAd
	XjSVgSetxM1i+Q+hJOh800YsdKSTANNidXAvJOKM9gh5M7txOg41WbeZo+r4Rv+fINqF
	+E0m3w0qyQuKjaeJWOmCmaVLiOYSvi7J0T3ziFHPgrPdVIyuTw1YGrHF7cTQm7EE+v9H
	cENW7U2J8MGEGucpJcPGzJA3VAU6SHvK+utUIbmCM0wzCwWCpx7Z1Hsw8c44aCsDaO0X
	LPXA==
X-Received: by 10.180.88.168 with SMTP id bh8mr25688369wib.15.1362571052383;
	Wed, 06 Mar 2013 03:57:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm16985826wib.3.2013.03.06.03.57.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 03:57:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 11:55:02 +0000
Message-Id: <1362570902-18671-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362570902-18671-1-git-send-email-ross.burton@intel.com>
References: <1362570902-18671-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkgUNGAYk0nFcHbLD0yvTEiVqlzP8QKbtFkrlpoX9Jl2Ia576pNo7vpOHK6VMRH+G6DfgeP
Subject: [PATCH 2/2] pulseaudio: respect the systemd DISTRO_FEATURE
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
X-List-Received-Date: Wed, 06 Mar 2013 12:14:44 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 37621e0..349b643 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -41,9 +41,11 @@ EXTRA_OECONF = "\
 "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk x11', '', d)}"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
 PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 
 EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
-- 
1.7.10.4



