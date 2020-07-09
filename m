Received: from MTA-05-3.privateemail.com (MTA-05-3.privateemail.com [68.65.122.15])
 by mx.groups.io with SMTP id smtpd.web11.3015.1594322540851921074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: whitetree.xyz, ip: 68.65.122.15, mailfrom: charles.davies@whitetree.xyz)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
	by MTA-05.privateemail.com (Postfix) with ESMTP id 9F93D60049;
	Thu,  9 Jul 2020 15:22:19 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.229])
	by MTA-05.privateemail.com (Postfix) with ESMTPA id B2F1C6004A;
	Thu,  9 Jul 2020 19:22:18 +0000 (UTC)
From: "Charlie Davies" <charles.davies@whitetree.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Davies <charles.davies@whitetree.xyz>
Subject: [PATCH 1/1] u-boot: fix condition to allow use of *.cfg
Date: Thu,  9 Jul 2020 20:22:08 +0100
Message-Id: <20200709192208.137165-2-charles.davies@whitetree.xyz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709192208.137165-1-charles.davies@whitetree.xyz>
References: <20200709192208.137165-1-charles.davies@whitetree.xyz>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable

U-boot recipe supports .cfg files in SRC_URI, but bug in conditional
statement meant that the code was unreachable and the .cfg files
were never applied.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index bed759c7c5..23cc795cab 100644
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

