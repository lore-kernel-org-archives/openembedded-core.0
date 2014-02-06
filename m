Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id A949560155
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 14:13:16 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u57so1347666wes.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 06:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yTE3aOGwAywBPBVXUtQ2fLZV9lOCzljyOF2O2p3XOqY=;
	b=XhMESalrM68me/AKvpcWZAOjWaSTydv7BgQqhCMOY9MXHgl90ahcOBsdiI2iN5mwGg
	Vx/j/+Ijm099nIYbHGcwEg4/ph7CZU6hYZMaJ5dEOne30z0hslaj1Pp/zyBOF+D8QlUm
	zX0EQkVyuBlhbvgmV7ZymwO1whdNSEEOL9EfbC13QkHoPP6FvL7Zl6LMF8FCZAm5d6LF
	UBNH8e6qdy0ac0Cal0FmznmxW35tBlim/anOBoV/a7cGwA6w7LHB3kNC3S9oopmZfRK2
	KtJRlqMPk1oE9csya9wrd1f5OoKsMC/ISbSQyca6GmsK3U9lMSNLXBLKdiUdXd2HEeyc
	pCDA==
X-Gm-Message-State: ALoCoQl7VstGSH3GvqkQq3YO/LFIMsBFWUYZ5F61QmwSEU0UZaMCY6LWdDi5zMLsnMYR1r4ZRXjH
X-Received: by 10.180.160.206 with SMTP id xm14mr7042118wib.25.1391695996616; 
	Thu, 06 Feb 2014 06:13:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id q2sm2738827wjq.0.2014.02.06.06.13.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Feb 2014 06:13:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 14:13:12 +0000
Message-Id: <1391695992-29453-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: add a hard dependency on udev=$EXTENDPKGV
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
X-List-Received-Date: Thu, 06 Feb 2014 14:13:17 -0000

If the systemd/sysvinit DISTRO_FEATURES are changed without wiping the package
feeds it's possible to build an image that pulls in mismatching versions of
systemd and udev.  This leads to images that are broken and don't boot
correctly.

Prevent this by adding a version-locked dependency on udev in systemd so that
images that attempt to install mis-matching versions don't build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_208.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 41a106a..5ed31c3 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -225,7 +225,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
-- 
1.7.10.4


