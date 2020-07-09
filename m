Received: from MTA-11-4.privateemail.com (MTA-11-4.privateemail.com [198.54.127.104])
 by mx.groups.io with SMTP id smtpd.web10.4685.1594327682482430193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 13:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: whitetree.xyz, ip: 198.54.127.104, mailfrom: charles.davies@whitetree.xyz)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id 024188004A;
	Thu,  9 Jul 2020 16:48:01 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.243])
	by mta-11.privateemail.com (Postfix) with ESMTPA id 2027380041;
	Thu,  9 Jul 2020 20:47:59 +0000 (UTC)
From: "Charlie Davies" <charles.davies@whitetree.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Davies <charles.davies@whitetree.xyz>
Subject: [PATCH] u-boot: fix u-boot.inc bug to allow use of *.cfg
Date: Thu,  9 Jul 2020 21:47:55 +0100
Message-Id: <20200709204755.138771-1-charles.davies@whitetree.xyz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable

U-boot recipe supports .cfg files in SRC_URI, but bug in conditional
statement meant that the code was unreachable and the .cfg files were
never applied.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index c91da02959..2666de647c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -89,7 +89,7 @@ do_configure () {
                 j=3D$(expr $j + 1);
                 if [ $j -eq $i ]; then
                     oe_runmake -C ${S} O=3D${B}/${config} ${config}
-                    if [ test -n "${@' '.join(find_cfgs(d))}" ]; then
+                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
                         merge_config.sh -m -O ${B}/${config} ${B}/${conf=
ig}/.config ${@" ".join(find_cfgs(d))}
                         oe_runmake -C ${S} O=3D${B}/${config} oldconfig
                     fi
--=20
2.27.0

