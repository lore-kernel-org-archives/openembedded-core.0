Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A7CC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 10:42:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.43])
 by mx.groups.io with SMTP id smtpd.web09.30375.1652092934301023641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=TD2aBNfg;
 spf=pass (domain: outlook.com, ip: 40.92.73.43,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls6snlntkFQjm/YJXkUKiCNJyVKPPxsV1ZoqB+xXUQzLAoPyFOf356cgkz5hul6ZfxLjpDWFRDx06gwGJr1JmPEX5gXqpFu5kt6SKI7SyZeLpqQL+SScUTkbT9oNOgxAnYeL5nVv6iGL2h3r4GL3zNeztYTx97vVBW/lWzI9I4cyDMrUFQmTNb0vZ8h4M9TkzavuuCIS9zH8chIsEKM41pUJkcvmrUHrx5wIMqkf3BQvj1VjJEGPsLbEKERu4C2qnC3vCIIrlc9N59IxB3CBtb4Rac56TWu8StsZD1UzlXSifY3Yl75t5TQShfcAhDnOh3BaU66goAxlMBE94IE9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0yoB7GXCY15lN1VVOQSL3XLzxLe7emfC8YLqfXZJig=;
 b=LMP+AR7QEhryjIR1iG9ap2lbZ1AmdHMAJ61XDsC4FI4dTrZX0EEOU7lVqfTWOX1uAo57VQ5EstoZThtjQTArEmhk615zNUX3yNi21ierWHcqzbpzRmNoh1DYh0rGi2zsPy9g58y08hBSLg7UsnY7sl//lMo0iz4Wra6P8wB4NO2OdMn/OAEFKWhP7GWd3XBUr1IPdXMOA+zupv0/3Y38E2RkwLAp9vVRA3CPK0eUsxFbFhMGyXCeKB1OB52Ieodjee4F5rHyTfZev4lLfT2lDv4MrXX/VByOH8uXSspj8ZFvfTooduZ3f878h0Ta1KQJq2Il7Hneo6VQk8hyypyrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0yoB7GXCY15lN1VVOQSL3XLzxLe7emfC8YLqfXZJig=;
 b=TD2aBNfg/j8bkgGYQpSLuAhlq1SwtRxyeQBpRhOaqcE844bYkDc0gPKO1219of/xA9TWnG5V39/sdm4eWmosYv/5utOw+7XOs39K67aQHMTdpJdxYEI+bhxyDxiiyWzibPPQ4excva6MXYeDs76RIPXsvw3/0wIb4xjLo5cMU3owL6QF2GNs0USeDR+4btktjaobDofnlilO21cGPxomCU5T1asJmXgUSx7CCeFJi1Ck2XHrvInHSccxylOCyl6V2DVeiOCb8CPpey3FbnjY69b3Os1wGBPydK1vt+ccSSVcVRJ/ZGexc8dnVfZHD0FI10HlFKZhYf4QvJaPV+9xPw==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by AM5PR0901MB1539.eurprd09.prod.outlook.com (2603:10a6:203:4f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 10:42:11 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::78f1:8a4c:7a86:b25d]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::78f1:8a4c:7a86:b25d%3]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:42:11 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] linux-firmware: replace mkdir by install
Date: Mon,  9 May 2022 12:41:55 +0200
Message-ID: 
 <PR2PR09MB3100ABEE6886A2DD315983E7A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [JYugiXqKCD2SXRY3qKeGJQKIOyag0x2f5bn6wC9QrfsV6agmYL9gSb80iWuI+lKh]
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <20220509104155.3015038-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab86afb6-715e-4979-8a35-08da31a89282
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPclzr7L5QrdXFswbNEuTUuraBtfjTP/jhd4r5jPQ5fwjaGjYXrFO+H+5Ol52bqW7/pCH9UdYorFavWkPv1H+lHXMGlbnmtWvoCmLqE0V7MmRv5K1k3bzrXAdKsKR0qu9e60VCtoiuyG4WFMzTC8yU/If7OnASJm2XTLxV9iPzGCoKnB8CAA322qRyvho8UeuStnLRWdLn8PRvG5ZFLDDrxw/Z9+pMPL4nhsQYD5WpvmhUpUPLc01A0dGD1HM++DE/xTujTlbhFueJlWk6JaF/kE6YQFSadlPAoiWZ/7m/6bB1r4JYV2/ZT6M46SFuCoFXT216XqDvzc85qVt3HPzuAyv9ozAUtLssvzO7Ai6GuvQGZNxNcE9K6mWPqnNNld16tjT+GVpjSaGzJV11jFvMZxDRk6X3YTeld+4SEpuNoKcGAvBStgYSPs1HH/gRO1VP410nRJ93L5Mfv2ZGTVV4JdL8NlkYgqbGXWmNJvFi+NeVIBdKxn8KqpXvrmWDckP2ImVX96IcxT4llqvu6//4A90lcBFUFc5pFlp0m4uk4qbs+JlY1ju2t+MvVROKTu/a6bM1o+xykk1VYm8ibmWR3N/uwUrhMsFSfeFyDZMDC7TkNenYYoZ19m3P56euHWxgJDz+SRdZKCUC5jd1JeD/0Gk8BQe7AYLKls5VyTly8D7z2dPJMVqw/WKPFtCwdty+DrXpkl/Od9q4yW9CnR/ih0pU1IVq0OsRzqFZ+GS+M9mNngAoz3Hhag2u0eHzwM0fps=
X-MS-TrafficTypeDiagnostic: AM5PR0901MB1539:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z87+7dQUANmOcOoiIsgI8fLdHBa20YHPbNfPa5PkrC+HfR9/CiesHK8GdPE6FrXyU7iCtnSF7j38SvYilfPheBRlEJy5WncuPf+5SdEwMaTxvjPfEiWUv3EyuAEcUcU2CgM1NbupUGSMZatm6JIQ9c/7vhdl9h25TtlahWk1GGJiBSbSYQtCq50SrIPwHTD9VSBkMb4jWMRmHtWugKOeHFdJ4TNVNlS2sABvea6vjHtQDn3kBVywgWZ+jsbk7n2Bb8uMYRz1Bw3jBVnEMx4pr3SGCeXvWo5UdKrw0AdIGokowx6kCNYFYBRqaHIUNPwBwDfDGGgzkGpzf+b4pgGti9UZRawyalmUQDcVgspUVOBvSsoNqdRoUjOFCnUXOhybXzlHXvLyzKe8XOaCVk3hqyWfy9Z8Sve+qTmQdYs2H58j9GsAX669hR44gySAzUQUzE3CO+IML/m7NFgW83BJUyJfNCCYzwsnJL1Zc6sjklrPLt4jjn0WT441F/WuABf1IBECA/C+OrIVgB7Uj2wpiQ60UPoepVMlTDhHIF/pObbfiaUl3rYF8Zjd77zc6dwjz7E7jKYLiFrChZUtkrLYJsZ6QN/noLid9ea7MVMYCjfzeU9TY+XyDPua57iZzUV5bSvSFPu4fFNqumIZSnqZ2A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RLqDEn0a+03XakrR6uBoy2e4hw4hTeIfWM8GsHiXjpXdv+TU9g57nquNGlf0?=
 =?us-ascii?Q?tbFtadWwhx2uZGozAicR0Vacj0XxQ9eBnrGrnDivqTspMyRvnF+dPEJmaZg3?=
 =?us-ascii?Q?8gZWZ4RfZAUZvyeW/mXx0VbJpdn7NUdg9h9MtpGS5+lka8ZfqP9oggplyuZj?=
 =?us-ascii?Q?oa5UbL9b7WsjrlOJ1Sa0CKMKLvKEEJchXvtA3QNsWrPcp/ex6mc3R+GshRlV?=
 =?us-ascii?Q?P8Ng8byE+/yUvZyeYukm0wTTJoVLF9lRa12iCfunM6HlrGuvtCo5bSBeSvfC?=
 =?us-ascii?Q?QfGBHNG0XSIvmAItHx7IoRN16UznhZwLfGv7KhVgsJrWJqJH6OOpIPZwywx2?=
 =?us-ascii?Q?pIM0Q5ggG4g0SQrugAIRr2sRy+AadCFY7F0/KUgxEmMcfHD7jso1IjK3o3+t?=
 =?us-ascii?Q?5E4VUmVnedPmJmr8D5AFuZED0Jdgp7WjnGKghP3Gs59b7dgKHS4AH4RcvaXv?=
 =?us-ascii?Q?HUla1LWJsq88HlrNyS9L+MUgDZosR7xt2vwghgwe6U0cDUBCnGk1+4aNmYhz?=
 =?us-ascii?Q?iSAFl5UndqGeWoOOVcT0+vsQZ+MAsi07YNwa7rcR6Djvzw8W2n/MeLBBS+Fm?=
 =?us-ascii?Q?AuMMquH0IGoKeSVwTRD7j0enP0qg236xoxk2Y+NZraWZBrmXB14sMI0uGcbL?=
 =?us-ascii?Q?RpZqzHsgDvJ+ApBegJqUQeKwqyTtHlTBK8B0jBHKpBf4s1MKhPXKxKm4dNVA?=
 =?us-ascii?Q?u2Awqc+IBpvOcG8A7j7HdKxEsceA3vN9eVm1DyPi7whOUXiBFCBBINRt7HkS?=
 =?us-ascii?Q?o6lWLYvw6BgLc6BXwpIcHKp+qf5TTiFxF4hRl7iRVj+DnQMMi+ZHHoWgvj4k?=
 =?us-ascii?Q?ZmDQTUL/D7OZm4l0qDc/ECnjHGofjG7P4o0JJDEL6qOzUzC/90TVoK9sWWkv?=
 =?us-ascii?Q?EBZVh8uoWttg3TsIXgMLbW5q7a3DkMxJD86Ms2VsK1Yxpd8bk+LXSvpRiFJM?=
 =?us-ascii?Q?KXxX6pispsFWmORR+PFeLI3/kNqha/H3TYTnco//jZgbLK34S9Dp1mf5cag6?=
 =?us-ascii?Q?RFm+MJs4sXjHAhOKaNphD8yMmqRY0U867tY8Ca400cR/Jk/NceQjGCxtXng7?=
 =?us-ascii?Q?zQGCxcOhEx6ygm9/sb0jAxfMvlzQCA+aeRmo2bX6rNYcIkskEWAQF4+khy8K?=
 =?us-ascii?Q?kx1tw0sgtdTrRFUcLjftpZaHCdC2nOZe/os2v/VBksBQwh5PRxbgdivHtnrs?=
 =?us-ascii?Q?oZRY2KvYf9XFiZbFo1no8QF+3EpSF4dKIrloEl1nTgsuqD7+917uUPUpDZmW?=
 =?us-ascii?Q?/a5PIkAbvmBHjwKFBLe/j+XkH7qX18Twp4nbzPjUTdMIFbkmQFelwz4cLMz3?=
 =?us-ascii?Q?DMgACvg/BBVhlNfn1HAp2wbQHJo5cVSonW3Lx/zoEu8GreHlTxZREa2OepNK?=
 =?us-ascii?Q?+RziJovQ1li10jRQtwD12UjYSrr7GyXMSu7sUi62B+onQuvc4eogc7762JzC?=
 =?us-ascii?Q?H9MYPuq4cPjP9AgT/jOjTpSucRrTW0k4qUGj/LGWfdaioDQx7MOv3dDDwL8z?=
 =?us-ascii?Q?b/8i0Rm1ts3xgSs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab86afb6-715e-4979-8a35-08da31a89282
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 10:42:11.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0901MB1539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 10:42:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165392

if a setup is using RPM for packaging and there are multiple
recipes that install to ${nonarch_base_libdir}/firmware by using
install -d ${nonarch_base_libdir}/firmware, it will create installation
clashes on image install, as linux-firmware in before this patch
used mkdir -p, which creates different file mode bits (depending
on the current user's settings).

In a particular example
linux-fimware created /lib/firmware with 0600
while other-firmware-package created it with 0644
making the combination not installable by rpm backend

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 ...01-Makefile-replace-mkdir-by-install.patch | 84 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20220209.bb |  5 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-=
replace-mkdir-by-install.patch

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace=
-mkdir-by-install.patch b/meta/recipes-kernel/linux-firmware/files/0001-Mak=
efile-replace-mkdir-by-install.patch
new file mode 100644
index 0000000000..16e0fa8986
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-=
by-install.patch
@@ -0,0 +1,84 @@
+From 81bbf4495ab59979948043fa13f1c18db249fbdd Mon Sep 17 00:00:00 2001
+From: Konrad Weihmann <kweihmann@outlook.com>
+Date: Mon, 9 May 2022 12:23:28 +0200
+Subject: [PATCH] Makefile: replace mkdir by install
+
+mkdir -p creates paths that are bound to user's settings and therefore
+can lead to different file mode bits of the base paths accross different
+machines.
+Use install instead, as this tool is not prone to such behavior.
+
+Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
+Upstream-Status: Submitted
+---
+ Makefile                      | 2 +-
+ carl9170fw/toolchain/Makefile | 4 ++--
+ copy-firmware.sh              | 6 +++---
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e1c362f..83a0ec6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,5 +9,5 @@ check:
+ 	@./check_whence.py
+=20
+ install:
+-	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
++	install -d $(DESTDIR)$(FIRMWAREDIR)
+ 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
+diff --git a/carl9170fw/toolchain/Makefile b/carl9170fw/toolchain/Makefile
+index 2b25ffe..aaea8e8 100644
+--- a/carl9170fw/toolchain/Makefile
++++ b/carl9170fw/toolchain/Makefile
+@@ -46,14 +46,14 @@ src/gcc-$(GCC_VER): src/$(GCC_TAR) src/newlib-$(NEWLIB=
_VER)
+ 	ln -s $(BASEDIR)/src/newlib-$(NEWLIB_VER)/libgloss $@
+=20
+ binutils: src/binutils-$(BINUTILS_VER)
+-	mkdir -p build/binutils
++	install -d build/binutils
+ 	cd build/binutils; \
+ 	$(BASEDIR)/$</configure --target=3Dsh-elf --prefix=3D$(BASEDIR)/inst; \
+ 	$(MAKE) -j3; \
+ 	$(MAKE) install
+=20
+ gcc: src/gcc-$(GCC_VER) binutils
+-	mkdir -p build/gcc
++	install -d build/gcc
+ 	cd build/gcc; \
+ 	$(BASEDIR)/$</configure --target=3Dsh-elf --prefix=3D$(BASEDIR)/inst -en=
able-languages=3Dc --without-pkgversion --with-newlib; \
+ 	$(MAKE) -j3; \
+diff --git a/copy-firmware.sh b/copy-firmware.sh
+index 9b46b63..bbacb92 100755
+--- a/copy-firmware.sh
++++ b/copy-firmware.sh
+@@ -34,7 +34,7 @@ done
+ grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; d=
o
+     test -f "$f" || continue
+     $verbose "copying file $f"
+-    mkdir -p $destdir/$(dirname "$f")
++    install -d $destdir/$(dirname "$f")
+     cp -d "$f" $destdir/"$f"
+ done
+=20
+@@ -42,7 +42,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> =
//g' | while read f d; d
+     if test -L "$f"; then
+         test -f "$destdir/$f" && continue
+         $verbose "copying link $f"
+-        mkdir -p $destdir/$(dirname "$f")
++        install -d $destdir/$(dirname "$f")
+         cp -d "$f" $destdir/"$f"
+=20
+         if test "x$d" !=3D "x"; then
+@@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> =
//g' | while read f d; d
+         fi
+     else
+         $verbose "creating link $f -> $d"
+-        mkdir -p $destdir/$(dirname "$f")
++        install -d $destdir/$(dirname "$f")
+         ln -sf "$d" "$destdir/$f"
+     fi
+ done
+--=20
+2.25.1
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
index fe51892eb4..4758466aa9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
@@ -203,7 +203,10 @@ NO_GENERIC_LICENSE[WHENCE] =3D "WHENCE"
=20
 PE =3D "1"
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz=
"
+SRC_URI =3D "\
+  ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-Makefile-replace-mkdir-by-install.patch \
+"
=20
 SRC_URI[sha256sum] =3D "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994=
b4bfc35394d177"
=20
--=20
2.25.1


