Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id BDE056C589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:12:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id A9FEF10C0DAB;
	Tue, 27 Nov 2018 11:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1543345981; bh=tfOrSQJ87rND5pmvFArlMrfs56cUMbjJC72xfZaOxbk=;
	h=From:To:Cc:Subject:Date:From;
	b=IS+AiT3JgtuISL0mdOmX6v81AwNi6YDtWoicQlGejAXILeIC4LnBLKcBlN1kJHjxQ
	vI5cmIAZ4liqXngtDwOA+pAjZN7VewiT9tkqx6mn+laiwbCJUIoxvWfkipO2EsNWmj
	DRrDToY7h8voPvo+A3RkXoIfjTfA7+sKkEujREUO2NECTt/VwMG/d3TF5bl+2rFJde
	rujBEfyKOPhrVsTjSI7ytrLrneVKT0EYmVDzVDrNr/1VFwzRzQ861rU792er+ND6yn
	dr1nqMzaMbc28YdOaMoP41EHy2XXQUP4FhZzkn8LcTQbjy1hE2k3s+BpEHrS2V3OzW
	km8iCUlq1cLyA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 8500D5D06;
	Tue, 27 Nov 2018 11:12:57 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 22:12:55 +0300
Message-Id: <20181127191255.39052-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Tue, 27 Nov 2018 19:12:59 -0000

Even though we're not going to build here real U-Boot binary
it is still required to "configure" U-Boot to get get to the
tools building.

We used to use "sandbox_defconfig" for that purpose but
since U-Boot v2018.11 it started to cause problems [1] due to [2].

So to have less dependencies let's create super minimalistic
configuration which is good enough to allow us to run "make tools".

[1] http://errors.yoctoproject.org/Errors/Details/202185/
[2] http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Andrea Galbusera <gizero@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
index 127c4c15d1..d1cfea05f5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
@@ -18,14 +18,11 @@ EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" H
 EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
-	oe_runmake sandbox_defconfig
-
-	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-	# generating it requires bin2header tool, which for target build
-	# is built with target tools and thus cannot be executed on host.
-	sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
-
-	oe_runmake cross_tools NO_SDL=1
+	# Create the simplest configuration which is just enough
+	# to get to the building of tools.
+	echo "CONFIG_SYS_TEXT_BASE=0" > .config
+	oe_runmake olddefconfig
+	oe_runmake cross_tools
 }
 
 do_install () {
-- 
2.16.2


