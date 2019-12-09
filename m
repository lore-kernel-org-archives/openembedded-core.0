Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7297CB4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 18:27:12 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k25so7517560pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 10:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tsub6EUGUkzkLjBdW9uiuM403fLnh/COELnjSpFFQ2s=;
	b=qeC+gOBtKtpFSwBDx0MuK7i7e2xvj886I8SFTj1qvcjSj9Oo9mg1Rhw2czC+MlxBC3
	eF4Zp5XzhEcJFa5ZFZgdrLyPxgOlK+lugX+LwbolQ4RgTY//li69iZuRaoaR2gABKyTn
	2ZslrSIKsQApnkh/Ixpi3pWV/QO9w0OuXzmOj/GpfQXrydtodJr7BzQYa2q5o8G4gNXx
	u8tebmn3wD0KJ/Z6CEdCaXtu5TfoKpRaNRGPRfhbaL47KGHkNGqbIGWDbH5vWtl80r9O
	92OWZ+eyPA+W0pptN2ntXWgMfrCxTP/dEvX1duTP2a/3tFpSABl6gl67YNcDToEzUjRx
	V8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tsub6EUGUkzkLjBdW9uiuM403fLnh/COELnjSpFFQ2s=;
	b=pZHSXpINGzca1OEODb4pqSKWsOa31wJD7ygiaoK2gQbjdsGjGpzt9tHcC4wmQnqAN/
	Y33k+M6aoH/96dAap10TduHiwADyhwcxjIDFMLe9/WN3BvVg9jeGtqjKOVIlk/369zpm
	mFwgz1mzb1165TLGizRurVjwqcAsrf4TbJJdtZBOVfry1BR8q2ymBuEj1WWVtfI00v4t
	6W4KTtkmPf3pmdq/cnvqUNbDIU7b5ax/9METHORQdNvH7umOBPfxvx+lvufvjEY8HDqY
	3Joiz0tjSFGb5raumn5MtcsiJwdzYguhh/YhhRMH1iLCm/gt+eCBRLpWP7UVofu2Yv7/
	1Xvw==
X-Gm-Message-State: APjAAAUz3Qh209DvKAxZKg4P1I8srStWmvaLhMtqv1oRUqNKeAZloQsB
	1KV91AHxkwjY0xQp9soJNK2DTO6w0q0=
X-Google-Smtp-Source: APXvYqywkQTLpAF/4Rzv/RIjYONR38ti/DWy6ULv5rc0Cpy2hdUoqR5JYI8+5hUuvW/4yRG17eaCwg==
X-Received: by 2002:a63:4d4c:: with SMTP id n12mr20543046pgl.212.1575916032608;
	Mon, 09 Dec 2019 10:27:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id 20sm237465pgw.71.2019.12.09.10.27.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 10:27:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Mon,  9 Dec 2019 10:27:01 -0800
Message-Id: <20191209182701.4120643-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] kbd: avoid vlock conflict with busybox when pam is enabled
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
X-List-Received-Date: Mon, 09 Dec 2019 18:27:12 -0000
Content-Transfer-Encoding: 8bit

busybox as well as vlock utility from meta-oe provides vlock utility
which can conflict when with kbd if pam is a enabled distro_feature

Fixes image build errors

update-alternatives: Error: not linking <rootfs>/usr/bin/vlock to /bin/busybox.suid since <rootfs>/usr/bin/vlock exists and is not a link

ERROR: yoe-qt5-wayland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Check for pam in distro feautres

 meta/recipes-core/kbd/kbd_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
index 9556302ab5..5270508b36 100644
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
@@ -62,6 +62,8 @@ RDEPENDS_${PN}-ptest = "make"
 inherit update-alternatives
 
 ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey"
+ALTERNATIVE_${PN}_append = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', ' vlock', '', d)}"
+
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
2.24.0


