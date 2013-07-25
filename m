Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8FA6B254
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 14:52:19 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so1899961wib.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FyNoWncJqwbEe9dyutCEFaehRhPEu1KiSqG31h0HKOY=;
	b=KRBCCVQqkpsZX49GaFact9wg4IpCSmf++jyIh58Pmu244G/xbEQD9IyfSc49sBIdxn
	y0UuohBW7If+kNnDHLO8DZMPadMXqNaLzbBs2xSfualdQIDlJBOHJOi27A7Y86yIeMMk
	D15U5Th/DK4DjkHYvwPaAxpDwcpJ8NMDw6hAC80Pm+qwtuFv+SaCPBJ2dQvC/Ygyo3ho
	N1Pk8Q8HnMrzfw0XZya4SGQ8E6zEH3Irp33E6kUV41ZNQGHm5HiCrt+glbi6PiypucpU
	z0uzitWjgol6p8Ch6SWnTC8Wko1xIYedqmQTclsYT+zWBuwP0GdSfLDpgKv5w6ZkrT0A
	7iLw==
X-Received: by 10.194.172.228 with SMTP id bf4mr30491379wjc.36.1374763939045; 
	Thu, 25 Jul 2013 07:52:19 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id eu1sm4260885wib.8.2013.07.25.07.52.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 07:52:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 16:51:28 +0200
Message-Id: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.2.1
X-Gm-Message-State: ALoCoQmPCjR4pXrT8N5+B9fZCmDgCjIS92P2ZNnte7WccaGUm9iqKmvXJSWQsOn7vr3hnWdtSJr0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] util-linux: fix PACKAGECONFIG options
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
X-List-Received-Date: Thu, 25 Jul 2013 14:52:20 -0000

The ??= operator is too weak and it's setting a non-existent PACKAGECONFIG option ('libpam' instead of 'pam').

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d373cec..3d1198a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -47,9 +47,9 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
 		usrsbin_execdir='${sbindir}' \
 "
-PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
+PACKAGECONFIG_class-target ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                                 ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
-PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, pam,"
+PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--enable-socket-activation --with-systemdsystemunitdir=${systemd_unitdir}/system/, --disable-socket-activation --without-systemdsystemunitdir"
-- 
1.8.2.1


