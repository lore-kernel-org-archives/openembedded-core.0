Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKxPv-0005UL-NS
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 20:48:51 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1352390pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=eW2/mY9QLQgjgBr1zdLs/kRz4e9F2EP44Jfuu/zb6tc=;
	b=Htc2o3Vkw1yPNyprGmZNX47Wtgw0L8Tp89be/1UKtsdVAQZzZHCrPN2NRyxQLlo6F3
	CgIcRC+S/n7oQ+v+ozB5I+CAodN7li4qkiPV7FzPJLEYLy5UQmdSl/IVwhAHvRM4wzeQ
	5hx0B6Paax9NJjDK40mo3mniARjPaUS02xioc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DTWA7w4IihivaPTs1V1r7/LnwbTuKDaRSk4xmiSAT+RoyDg1HEgt45vxVWa2KiwxOq
	6o0YfCW66HcEuHgV+JoRh738yZFuIqQnFHJUQCKe6WYSZ8sve71ehxoYyakUMOfFajhc
	wbQdXEldnUEeR4HD9g3CdbVo/GfiqgTYn6/xk=
Received: by 10.68.32.226 with SMTP id m2mr2600918pbi.444.1305312364005;
	Fri, 13 May 2011 11:46:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j2sm1513965pbo.79.2011.05.13.11.46.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:46:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 11:45:58 -0700
Message-Id: <0ed903cb6e77ae2115739596fffbe6b913c3f9bb.1305312304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305312304.git.raj.khem@gmail.com>
References: <cover.1305312304.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] conf/bitbake.conf: Add MACHINEOVERRIDES variable
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
X-List-Received-Date: Fri, 13 May 2011 18:48:51 -0000

By defualt it points to $MACHINE but sometimes its desired
to have more than one overrides stemming out of a machine
then they can be added to MACHINEOVERRIDES.

e.g. MACHINEOVERRIDES = "${MACHINE}:nslu2"

Note that if you redefine MACHINEOVERRIDES then default
override for machine has to be added to it explicitly
otherwise it will get lost.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7c72de1..8b6236e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -610,8 +610,9 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINE}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
+OVERRIDES = "local:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
 DISTROOVERRIDES ?= "${DISTRO}"
+MACHINEOVERRIDES ?= "${MACHINE}"
 
 CPU_FEATURES ?= ""
 CPU_FEATURES_arm ?= "vfp"
-- 
1.7.4.1



