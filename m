Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SWbsx-0002c0-F0
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 01:19:31 +0200
Received: by dalh21 with SMTP id h21so6529193dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 16:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TeF+SWGHNpHUfLGz2gUIPXZNMdtknqXN4HetIclpg9g=;
	b=Mq4ShDqCiLGPTOTE4luo2Y2xV/0XDUtDw5GA98zbmF/uAEzluvEYewjBASuzuGuwMU
	4avLeEWAL2xESz2SW13eoilsI9AkMqbfy1+Bep0h6bF5QujKc2oWSSrmigSZwJXYd4Kg
	OAX4/wA88Sg3tNIxP9zUDTK7gbW0ESDi5r/fM5Buhld8Q+/TDvY6iwwejwJ9WeSPdb7g
	3bIB0w+yiFLR4oshjz38uVFkQCfDTjTDoQDKk6JubYq8hs7uQkaEkfwVMjsSdPoQIsc6
	0oyfTFVPXbKL3YCuYY/xGNTyc4mUAGr8jody68rYFLdLH3V6UIn29q8hdXnBG2+/YQuI
	sywg==
Received: by 10.68.132.199 with SMTP id ow7mr45584690pbb.144.1337641762860;
	Mon, 21 May 2012 16:09:22 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242]) by mx.google.com with ESMTPS id
	po10sm12643702pbb.21.2012.05.21.16.09.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 16:09:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 16:09:12 -0700
Message-Id: <1337641752-1521-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <1337641752-1521-1-git-send-email-kergoth@gmail.com>
References: <1337641752-1521-1-git-send-email-kergoth@gmail.com>
Subject: [PATCH 3/3] external-sourcery-toolchain: ignore GNU_HASH issues with its packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 23:19:31 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-sourcery-toolchain.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index a14e958..b8cb6d9 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -92,6 +92,12 @@ PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux
 # This test should be fixed to ignore .a files in .debug dirs
 INSANE_SKIP_${PN}-dbg = "staticdev"
 
+# We don't care about GNU_HASH in prebuilt binaries
+INSANE_SKIP_${PN}-utils += "ldflags"
+INSANE_SKIP_libstdc++ += "ldflags"
+INSANE_SKIP_libgcc += "ldflags"
+INSANE_SKIP_gdbserver += "ldflags"
+
 PKG_${PN} = "eglibc"
 PKG_${PN}-dev = "eglibc-dev"
 PKG_${PN}-staticdev = "eglibc-staticdev"
-- 
1.7.10.2



