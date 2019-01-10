Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6020C6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 13:53:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z5so11425193wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Cb0X64sgGjKWoPaviAeDNkt7HW4ZsrG5MZnol6eQbXU=;
	b=2O90jOMXGE60HX+gv1yGGlpOTjxA3qY4EqG+F8B0lQiYYUd8diRRMsb4pyHitGb6k2
	w4JDdEv3JlBQxYuja0SKS8qxtMOu5RfLcMAbVPBC3idSzNr+UN5zB6lYFVnG8U+RObIs
	gLO/ApXbaWT9X+m8qEDyN1E82HbXSuLj17/vTRg+iC3C7Ugb06KKd/2SG8zEM7OtsiA7
	xKsF3q1wIA9pcTrCKStSUTFDoGjUn2pdCag8p+fTwXV5lJOYi2IFXgGqGgjzE3SrEnk7
	XedE3muaGqwF+i4TV1SsijzJxat+mDVp8S/V2PyjMvuS9U4RX/dF7pbswa+Tqaxevixq
	f6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Cb0X64sgGjKWoPaviAeDNkt7HW4ZsrG5MZnol6eQbXU=;
	b=FK4GuayRbafyFSzqPZgGXYpy0iA2mkFHAmagX+G4jyXHMlrvcDm7yHjxEmBv6aWDmM
	v/N/E15fyZaGu1tA0bi5E2jMJ/pB24euDJiTRNX7GROVWn8W7gxPtPnMCNwwg2Zw32aJ
	dWTj8w+mw6UbcFjb58VmxXnnj3BXy8Ew//jYhEnaOJbpSr9FnkZ2hQpV9qwtvuh/Gv/t
	XSYf77DUCMrDoUoTOs5hCHXX1wqjCGHL2ZAWOWMkkKzlnSqNz2LXs/xxRSJKyOhxheAE
	/PkJPHUs75EwQcb/2CA6q9OOiAmmtuLHvfJ3Cr3AGi4pfKTynLYMDUwHuwgcqFY5Pc3w
	zzeg==
X-Gm-Message-State: AJcUukcAFxiGZNuXOUAPTfBt90T/EnHtHkWO831QyljdJUVJtgds+7h2
	87AvPQbuYKmQIU7EejgxPY0E8afpiCk=
X-Google-Smtp-Source: ALg8bN4laykTpQZlIadSYOiq9FSDIER3MvbiaVGXd96MelD9lCYZIWysmL/P/ofRA1mcQgUxARHNYQ==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr10020533wrp.59.1547128383772; 
	Thu, 10 Jan 2019 05:53:03 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q9sm78248587wrp.0.2019.01.10.05.53.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 05:53:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 13:52:57 +0000
Message-Id: <20190110135301.1888-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/5] pulseaudio: fix multilib packaging
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
X-List-Received-Date: Thu, 10 Jan 2019 13:53:03 -0000

The magic multilibisation doesn't quite catch every instance, so replace
'pulseaudio' with ${PN} where needed to ensure the packaging is as intended.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index f526690390f..82b31580b7c 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -210,11 +210,9 @@ pkg_postinst_${PN}-server() {
 }
 
 python populate_packages_prepend() {
-    #d.setVar('PKG_pulseaudio', 'pulseaudio')
-
     plugindir = d.expand('${libdir}/pulse-${PV}/modules/')
-    do_split_packages(d, plugindir, '^module-(.*)\.so$', 'pulseaudio-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
-    do_split_packages(d, plugindir, '^lib(.*)\.so$', 'pulseaudio-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
+    do_split_packages(d, plugindir, '^module-(.*)\.so$', '${PN}-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
+    do_split_packages(d, plugindir, '^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
 
 RDEPENDS_pulseaudio-server = " \
@@ -250,8 +248,8 @@ RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
 RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
-FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
-FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
+FILES_${PN}-module-gconf += "${libexecdir}/pulse/gconf-helper"
+FILES_${PN}-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
 
 # The console-kit module is good to have on X11 systems (it keeps PulseAudio
 # running for the duration of the user login session). The device-manager and
-- 
2.11.0


