Received: from 8.mo68.mail-out.ovh.net (8.mo68.mail-out.ovh.net [46.105.74.219])
 by mx.groups.io with SMTP id smtpd.web08.10029.1606324991188649286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 09:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.74.219, mailfrom: norbert.kaminski@3mdeb.com)
Received: from player729.ha.ovh.net (unknown [10.109.146.240])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id B678418036E
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 18:23:08 +0100 (CET)
Received: from 3mdeb.com (178235223047.warszawa.vectranet.pl [178.235.223.47])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player729.ha.ovh.net (Postfix) with ESMTPSA id A008618AA9781;
	Wed, 25 Nov 2020 17:23:05 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-95G0017e8cbd77-ef9d-463c-8b88-d92610e3af75,
                    06A5F23BA766A6310EC3945B632C27E5C8A418EB) smtp.auth=norbert.kaminski@3mdeb.com
From: "Norbert Kaminski" <norbert.kaminski@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Cc: maciej.pijanowski@3mdeb.com,
	Norbert Kaminski <norbert.kaminski@3mdeb.com>
Subject: [PATCH] grub: Add support for RISC-V
Date: Wed, 25 Nov 2020 18:22:49 +0100
Message-Id: <20201125172249.1067599-1-norbert.kaminski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10591340427435940289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefpohhrsggvrhhtucfmrghmihhnshhkihcuoehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepleegvedtffduhfdtgfegffeiiefgvdelheelieevtdfhgfekgfejheffieetkeelnecukfhppedtrddtrddtrddtpddujeekrddvfeehrddvvdefrdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepnhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Transfer-Encoding: quoted-printable

This patch adds RISC-V to the COMPATIBLE_HOST. Since GRUB 2.04,
the source code supports the RISC-V, thanks to Alexander Graf.

Adding the GRUBPLATFORM for RISC-V prevents autoconf problems.
Also, the patch appends the __anonymous method with RISC-V architecture.

Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 4 ++++
 meta/recipes-bsp/grub/grub2.inc        | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.04.bb
index 30d95f95e0..f80afd95cb 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -26,6 +26,10 @@ python __anonymous () {
         grubtarget =3D 'arm64'
     elif re.match('arm', target):
         grubtarget =3D 'arm'
+    elif re.match('riscv64', target):
+        grubtarget =3D 'riscv64'
+    elif re.match('riscv32', target):
+        grubtarget =3D 'riscv32'
     else:
         raise bb.parse.SkipRecipe("grub-efi is incompatible with target =
%s" % target)
     grubimage =3D prefix + d.getVar("EFI_BOOT_IMAGE")
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index ff17dbe8b7..d020103605 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,7 +33,7 @@ SRC_URI[sha256sum] =3D "f10c85ae3e204dbaec39ae22fa3c5e9=
9f0665417e91c2cb49b7e503165
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
-COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.=
*)'
+COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|=
freebsd.*)'
 COMPATIBLE_HOST_armv7a =3D 'null'
 COMPATIBLE_HOST_armv7ve =3D 'null'
=20
@@ -42,6 +42,8 @@ COMPATIBLE_HOST_armv7ve =3D 'null'
=20
 GRUBPLATFORM_arm =3D "efi"
 GRUBPLATFORM_aarch64 =3D "efi"
+GRUBPLATFORM_riscv32 =3D "efi"
+GRUBPLATFORM_riscv64 =3D "efi"
 GRUBPLATFORM ??=3D "pc"
=20
 inherit autotools gettext texinfo pkgconfig
--=20
2.25.1

