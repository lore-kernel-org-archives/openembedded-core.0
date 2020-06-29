Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web11.14983.1593422213524415184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 02:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: ahsan_hussain@mentor.com)
IronPort-SDR: 9xTGuePgFsmldX8pfA2B7qOm7v47FZq9IewzpmAFy/p/VLWCTVf4ItyoGbgiZuyQblQUH7QDl8
 nDh490jLPpb3ONM6EF8m2dcprS+TjwcfTm4NX49QuQV6/ZfxPQv07/7HDPY1eEeLRECKdOuzcj
 FAt96X72m7wWguVoVsdx4ZMkMCV7aRNagBmAy0GMExmrK2VBc2zscdgojJfxOsztIhN0F91qEi
 clo/s3jVweKwqXjUhy+3YB1f2B4uegNBYeALOn85WckSQHn1xd2EbvkiMKN0kSCxIx9p8QUowi
 4qA=
X-IronPort-AV: E=Sophos;i="5.75,294,1589270400"; 
   d="scan'208";a="50280484"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 29 Jun 2020 01:16:53 -0800
IronPort-SDR: sPGMvx6ZQ15GZ4FST0YtFuPsZ2tskOj7is0Tn+q+D1PS7N/OOQuMiIwBMW+5jtlQcklo3E3HVZ
 00yRz/7iDe3jy08VAn3m0b/BC0TSCDQmh2wEGyig80mQIG/c9frUghThClKMU7bGFyew1h9jBY
 +aEwMQsyCDjK015XnDCHx09vpvxAe2ypPABuvWr92tsohaHoWe0/lwePQ7DPyk0miT8rtTgUnx
 Pu9r6UJ/gpX3Xv4SmpyLQAJm6rC5IziJQNbyPOO7FJwoXhIQVwMtB79EluPL7gOJk3FF3/akfv
 Tag=
From: "ahussain" <ahsan_hussain@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH 2/2] u-boot: avoid blind merging all *.cfg
Date: Mon, 29 Jun 2020 14:16:19 +0500
Message-ID: <b240c5b9856a3ea0f1b7612622d8fdbef38ccd9e.1593420599.git.ahsan_hussain@mentor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1593420599.git.ahsan_hussain@mentor.com>
References: <cover.1593420599.git.ahsan_hussain@mentor.com>
MIME-Version: 1.0
Return-Path: ahsan_hussain@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Jens Rehsack <rehsack@gmail.com>

This fixes u-boot-qoriq breakage of:

    commit 4fde8c8f479f5acd24fb6e0d0b9b4dc94d6f560b
    Author: Ming Liu <ming.liu@toradex.com>
    Date:   Wed Jun 3 13:56:01 2020 +0200

	u-boot: support merging .cfg files for UBOOT_CONFIG

	U-boot recipe supports .cfg files in SRC_URI, but they would be merged
	to .config during do_configure only when UBOOT_MACHINE is set, we
	should also support merging .cfg files for UBOOT_CONFIG.

The intension of 4fde8c8 looks more than append delta-config snippets to
u-boot config and should probably be rewritten to express that much better
than implicitely assume all "*.cfg" are for merging into .config.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 8cfd25020c..7d241916eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -85,8 +85,10 @@ do_configure () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]; then
                     oe_runmake -C ${S} O=${B}/${config} ${config}
-                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
-                    oe_runmake -C ${S} O=${B}/${config} oldconfig
+                    if [ test -n "${@' '.join(find_cfgs(d))}" ]; then
+                        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
+                        oe_runmake -C ${S} O=${B}/${config} oldconfig
+                    fi
                 fi
             done
             unset j
@@ -119,7 +121,7 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
 
-    if [ -n "${UBOOT_CONFIG}" ]
+    if [ -n "${UBOOT_CONFIG}" -o -n "${UBOOT_DELTA_CONFIG}" ]
     then
         unset i j k
         for config in ${UBOOT_MACHINE}; do
-- 
2.25.1

