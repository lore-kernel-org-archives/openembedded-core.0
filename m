Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D88B608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 14:45:41 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so1495252ead.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 07:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kVIxulVF791rosnnrL6IDDq6hZcxuRJoFzNCbgTt2z8=;
	b=e8dpkQW3j3FqvSEQE5HS/snVwjyB7Su1Ltxad4AD+FWKIj60SQ5z4N54YgVvJCk4a4
	GUMzBbG5i6+9ZKuafittg8HzApOLfmEK/328l3s3jyjZTK6LY8t3spyrBe81EWXswD+D
	z7OFCR6Q5gf4U1MQuviEnxx+IsggpPBMXgab8WJooyaK4P4nV6Tq97k0q0GO3oc5r0xZ
	DFcHPSN8Y/M2qcJZACUvKM7hakAcN5WAnGkAWY/y1+IzomLoADh631pGYFL+KDpaLUVs
	CniTWISIza8hkpt1ss7NmqVeuhUp3W/ZTFy5Gb26xQUgaL/P4Z3sgDIph9px2rYvMXFy
	NBkw==
X-Gm-Message-State: ALoCoQk391ppQYcqO214JzhJDWgYWhBnZC0aI6gOL8OatcetNE9/hykKKTs2Yt6eeynbY/V4iKYA
X-Received: by 10.14.174.194 with SMTP id x42mr8621516eel.87.1375973142247;
	Thu, 08 Aug 2013 07:45:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t6sm19729421eel.12.2013.08.08.07.45.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 07:45:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 15:45:36 +0100
Message-Id: <1375973136-11264-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Thu, 08 Aug 2013 14:45:42 -0000

oe-setup-builddir substitutes ##COREBASE## which seems like it should have the
same value as the variable ${COREBASE}.  In reality it doesn't as ##COREBASE##
is substituted with the value of $OEROOT (the location of the oe-init-build-env
script), whereas ${COREBASE} is set by oe-core to the parent directory of meta/.
If oe-core's meta/ isn't a top-level directory then ##COREBASE## and ${COREBASE}
have different values, which can lead to confusion.

To resolve this, deprecate (but still substitute) ##COREBASE## and substitute

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_3.8.bbappend |    2 +-
 scripts/oe-setup-builddir                                    |    5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_3.8.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_3.8.bbappend
index c4c005d..7882ba1 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -1,5 +1,5 @@
 KBRANCH_atom-pc  = "standard/common-pc/atom-pc"
-KBRANCH_genericx86  = "standard/common-pc/atom-pc"
+KBRANCH_genericx86  = "standard/common-pc/genericx86"
 KBRANCH_routerstationpro = "standard/routerstationpro"
 KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
 KBRANCH_beagleboard = "standard/beagleboard"
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d5d8d98..adb55c7 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -101,7 +101,10 @@ EOM
 
     # Put the abosolute path to the layers in bblayers.conf so we can run
     # bitbake without the init script after the first run
-    sed "s|##COREBASE##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
+    # to replace it for compatibility.
+    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
 fi
 
 # Prevent disturbing a new GIT clone in same console
-- 
1.7.10.4


