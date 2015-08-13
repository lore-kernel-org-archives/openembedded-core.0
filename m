Return-Path: <lee.nipper@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 54CE2605F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 04:09:26 +0000 (UTC)
Received: by ykay144 with SMTP id y144so31837857yka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 21:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=19p9lquA9HfVUzSxiAqMlUgi1rOkstGXla7Z0bvLtM4=;
	b=NykLa+43irVB0vX//Y9ceYEWsi6LHpP9Gb4s6njMmB2x9PiJELAdncI2chgxVeo1vK
	jBKqRtQQ4Rns/T21C3ePscsnbtWm2znyG2WEPJWIltCviTDg2KLNZLYQOpuNccdd+7hl
	yOaPWKSQPV1Tq+mG+Hj7wrjo3tV4Sur745GxmSCUgJdOjCYjoAPymDVEVBTqhXsmCtDB
	mjUsV945vFJU5O8+duWwH47R3Lsvg8etXkquUtfEmdMxOh56/CYuQIFIOtzH4WEHiQlZ
	uyfOQt0s08ypXiv70cgxCtCTaguoYAwGTAs+OLy6tLZmY0D0PqVl8DHzIULS4M0aa3oe
	U4Cg==
X-Received: by 10.170.83.213 with SMTP id z204mr37189011ykz.24.1439438966885; 
	Wed, 12 Aug 2015 21:09:26 -0700 (PDT)
Received: from localhost ([97.80.196.109]) by smtp.gmail.com with ESMTPSA id
	w123sm1038432yww.22.2015.08.12.21.09.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Aug 2015 21:09:26 -0700 (PDT)
From: Lee Nipper <lee.nipper@linux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 23:08:52 -0500
Message-Id: <1439438932-4702-1-git-send-email-lee.nipper@linux.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] u-boot.inc: Add UBOOT_BINARY sym links for UBOOT_CONFIG types
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
X-List-Received-Date: Thu, 13 Aug 2015 04:09:27 -0000

An additional use case of UBOOT_CONFIG is when a machine has applicability
to boards of the same architecture but different in other ways
to require a different UBOOT_BINARY build.

The UBOOT_CONFIG default value can be a list of these board types.

For example:
    UBOOT_CONFIG ??= "boardA boardB"
    UBOOT_CONFIG[boardA] = "boardA_defconfig"
    UBOOT_CONFIG[boardB] = "boardB_defconfig"

Change do_install and do_deploy sections which process a UBOOT_CONFIG list
to create short symbolic links to each of the config types for UBOOT_BINARY.
This is similar to the links currently being created for
SPL_BINARY when it is defined with a UBOOT_CONFIG list.

For the above example, and UBOOT_BINARY as u-boot.bin,
the additional symbolic links created in the DEPLOYDIR would be

    u-boot.bin-boardA
    u-boot.bin-boardB

Signed-off-by: Lee Nipper <lee.nipper@linux.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c76f87f..990ddb1 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -97,6 +97,7 @@ do_install () {
                 then
                     install -d ${D}/boot
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                 fi
             done
@@ -159,7 +160,9 @@ do_deploy () {
                     install -d ${DEPLOYDIR}
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
                 fi 
             done 
-- 
1.9.1


