Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E22BC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 11:01:44 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.34])
 by mx.groups.io with SMTP id smtpd.web08.30331.1652094095934269777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 04:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=cVo2QpuJ;
 spf=pass (domain: outlook.com, ip: 40.92.64.34,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJU6VG1WaohBHnj+7rvKWJsJ5T/FevJQRmgmD/ThkuXYQBEkwtbBqbssLHu2X86AlgBYq1GmumaVGTC5YYp/+FgpYUXpTS3cOMh0PLmmD6y4B7QnVWxfAVQ9hyevdpqEVjc6vB4IS3k6DyvA5m5mR6lkhCwTfSbNEnegS3K/vvsAMGsZOl9/sAh56JCQbLNlGbsjk7UNRyHfrZk55C3em/j9TiyqxU3wk5NTEx4RhGxrrW24/4cP9PsPAMNmZvwrhxiE0Kd5sdnuIqH7HvUVbFX3h2MhNm5mN6BsMPYqXWsKTPwtqx8aoG+8ipHQWLDMBnnHZLEcrp3MYDE/ZMVl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDIwII5SnzY6flt7MZlJ0+9W4XXpOZc4oM4GeUHfmcU=;
 b=NgWBHe05a2vVnyoaaOSqyaiB9gdTQyObQ+TgX1cBgKWxICbYZA0otKIPV0ht+KqfXde7VdtcJovbaxU4fIZYJS6+aufbytbR5Gn4P973WqZAo82W+JX95ZEccAU4urXXWpCSeODaTMsI3dwYZz5aTk523sg4oDGsxWFkBtXtc9/Nthunbgb9zlFhlYgtGPakD/vrhzjc3BgGmOufKPsP+pUHNiHJy8R1LO5WRCLMp6BW7OrUBy7bNBMvz+6rkqB8gVawYbkcBCCiq2OCgrZ0kgZazIwsnlQ/DN9UqUk25aPHjFFruSXWZ9v8uHBWoXIyTouWoA5aQP2AtCmP9AVyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDIwII5SnzY6flt7MZlJ0+9W4XXpOZc4oM4GeUHfmcU=;
 b=cVo2QpuJgjfI45dtBVlapamqT6e4myAMNC1VbNAazMCnDlr2D0SQu2aaK8W7H4r9enSwcud4z4jmRGStqH5KYAb6yDis6wNiyAQXMLyIfy48/uF6vAdZol7g0g/fZ5kkmunEqjQwnLiISx2BFFW7Zc9/VTeGHgBqDaCdKPxHiZXrfSDfkQyx3cQ/kibauafGYyd0buz7yavB252O/+nXK/40emDhRQXQpOf0mxINGNas/+tN0CchQNQtdZA98m5EiS6YYs4uQM8Ok6Ycmf8Xj/ZfBwbYNW4oICb9oOli4y4EkyZx34ErHXwInBpewKb382Mzok8iEOPUKH8Pi2C7mA==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by HE1PR0902MB2057.eurprd09.prod.outlook.com (2603:10a6:7:24::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 11:01:33 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::78f1:8a4c:7a86:b25d]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::78f1:8a4c:7a86:b25d%3]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 11:01:33 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] linux-firmware: replace mkdir by install
Date: Mon,  9 May 2022 12:59:57 +0200
Message-ID: 
 <PR2PR09MB3100A4D0B8A63F6CB67F7597A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [7c+e/bgk+Z+yi+FWdobkzIfdv1NuOlcVyZ46at40hMHis3pAAplTyVX3cKUcitgY]
X-ClientProxiedBy: AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <20220509105956.3025837-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e556039-c299-42d1-32b9-08da31ab4716
X-MS-Exchange-SLBlob-MailProps: 
	6rN1YWC+iUVNWio5vJ6/fbrTLv36gFhH42PbXthmvsnsM1cooSiblVkQEGhKpbeR8FZ7MEDDseNn8Q5kEGlKZ9yK5vv4RUzHD61F89EQKzb2QaEqI11SsbS7jkyuAormW2xIAzXied4+OofXV1pw9ipxoRGP4X2knS+UQXaA/JkFe/xoExmCWulcSH2fezS2ls0GbEPbVZvSwF0zhX99DmL9dpBOM2RvxGFG35rCRFfyyfbKTIuprQ/GIX138K+N8JEZwwlKSEV/Rl9ApiB9R3SGh/4LRYC73kW2jtau/avRAEVjxf4LAFo6cdlXAVtabAHXEP17CpPTSq+w7ddWdIVTYuX0p0oZ3bHUIMkO8zyAM3u91IxmA0vIMUx9N/Fd1Ok1kC4Yinm7Kw95zzbREpZ7qm9Ffp4kx/VU36C2VnoNflM6JYmAYafZSMPB7o7qfLQfL0diq1VTcX4E6SpFgsHrcavSjU3WmJCU3vKPDFqhyLBYczz/xjcuL40lPjKDyA84yLOC7zdw5OcMqP01arfCDU/XlTugi/dv2kquzmD88/Tns8JClSg72m9vl8yzL2d8/Fpdn9NP7XH3yMiEYTRZdDd5s6RdxmZR/eiJv0xO4SffszoBTT2be1xAfgc7dQd4LXQMxLLrGQkrIkaBKDlWGOUPFLNwUIywnro5Sl+tkEOfaQJ1cQWifv0t5iLbT/o83ToxASAy12pXbKoKNHba4y0ZbeBb9aw5qMZKc0spc8Gv/ku9rOaDHDcFfSVPcg0XOm/zGyLtR3MXgHPnPHWQ56uK6orEZ+5eAw62K3M5hxc7TkR11YAE5aF2X909
X-MS-TrafficTypeDiagnostic: HE1PR0902MB2057:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vH6WO83p/+/5q8bCZqjaKQmRlVFo/kg1YhrEFPdEN18uquqqzT9tnCb9UiwzYEG6xR7oYNNk0VooSm0x2hOvAhr20xvXoC9m2cFcQ0zzrf4JIKOJ6Qn4iVfpWOXwxf4bni3hziQNgAhrAtjZ/vmJUoPD+vDpdWC+aYDxcuk5m48k6YTu1KoJxzy+i7/+cm5ysWxfACfZ9/6JR/KWo28UIMgzvyrUGC6O2TyDtekvz4+23ZVk1++S87pnXhZgx+ABaZwbbLGfj8s4ImbMZQZAAwbEJQqS1dUiMtJFHMphWGSxJWL1QsUbjHMqfmvi91Hf5NKTjeq4iKt9nPaCtWSnwomiphfYRz2+7EHSu6apbkC9pgUz3QTHxW0cL0uAtafIIyBWnBj9yjvir1aZXQQ7nOC6CDo6s/7B+2dgmufir3dghd+F48dlMtDf2iVAcNxrgY2ngugHHgs0Is3cnD9QCdNPkB7mP8mCRRtzqCeJubAOxeSHr0iPP+PRkPSudhA7RuF0XqH+tbmBjEcAYclM9K8O0xu9bXXb7VB7EEcWkrEqXDiRo02MB1wUA2FMXbW8oy+8cIANlCyKA2X82mwuRLWmydE4vRYdj+ih6z1aY8vVOSVrFXmloQb5k/1fIKnuZ7dvLoEbT2xIb+HpWvZpEv6rDML6fLkgrLx9J0Xg7GMLAlfxuVe7xKErTEmOC/VO
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wnKr8yTkX+n9ZvufJhA5d1mCir5baZN9JYQw9Z52lAQLVk6BNcxhipqLtI5J?=
 =?us-ascii?Q?HlMARpW4qtjTFaqcm6NqgOYFcqPE546/+QooBeww3MWRWU/a1XT/8LNxi2Up?=
 =?us-ascii?Q?EHVq65hm3hQMoT6LEP512qr6U8OXhoRcJiDf/lPZ5kXppULN8hZ5HQVaPVAb?=
 =?us-ascii?Q?dTstC4zCgu70IN7vdA5z3/atgvs51Xg44pVuNPO9NKR7Q2nHzBkz1SRGHLpg?=
 =?us-ascii?Q?6FHGYOdoYKySDTJHBjGjmxZzQSB7JczhI0BIZW3AoG3gD+ivX/s1GCvY4H7D?=
 =?us-ascii?Q?Uoup8wlMq4t30Buk7C7QXveS/7r9zH0c+pOPvvNaBYA3NZH3lHnkvyULeKgC?=
 =?us-ascii?Q?7XKMtTevQKQ+NQiJPl44La9RWXqrhiQQYiv19W/BVZi1TpHrUenr2+tGVjwt?=
 =?us-ascii?Q?T8WRmilB+ew8QQrxF2FDZjtgtngdX+Jifv0X7MnCupsToIYOUqZ3aT5gsHVf?=
 =?us-ascii?Q?YVAzQ3od4FDhyMYwtOOkPm1mJvkJ24ub/1ywuhtx7rao+o8MxryC5p62DTdn?=
 =?us-ascii?Q?2Shvy11y9Y45XE/X1QqeWgjkq7Pa9xPyb+lz0X7xc6qMp8qOIXt5cjlUP71g?=
 =?us-ascii?Q?b2Tf9gHKXRCShRP+ACrWSHCalSCQzDHYd8vi5D8fQlPH7/qFeBfWumIRkX7V?=
 =?us-ascii?Q?4dnVuFxR2w22RERW4blRcZ6mdOTU19Ro9Xyr22YUvRVlH1QF/wmxw+s48fbl?=
 =?us-ascii?Q?7/WjX7+bK2Fe5Jbw57X2X3Tbyf+diZdlFvm4w74i0JybwuIGKed8PgXyJ7yy?=
 =?us-ascii?Q?InGD87qwwsukNKlGLmboF/dZ9Q+FB47BIxbjsWl50IVakqnaE0mVXbg3iUYx?=
 =?us-ascii?Q?d4j5ZWw8HUckT0ugOJaTlXAfuvhXePeWljeqDofeGYcGC4Ab1wpzL91XFSkF?=
 =?us-ascii?Q?pIOzk2ljoEH6uOExGZuW42pzRdrZNrxT9dObH+qpKysQGJCjyp9Y64VpNwTm?=
 =?us-ascii?Q?+NUs/JGgNwZcBpwI4+n4mveuuN4QzSfUMiyOJvjWzmRkvnsUPVYPd9EWj+JM?=
 =?us-ascii?Q?eUxwSphZGVnzcxm7YUIJH6n3SN7dxzmWSVBRtp6bLGHyI5iFO6SlGGmIpBel?=
 =?us-ascii?Q?CF/r2fZrbc/ksEvfdfi2z22+fB8zcNxBM5yugbjllj9xNPr7rTaE5FPNplsW?=
 =?us-ascii?Q?EfwPsMac7PIxjeFwP+WrMGhYQKP3PvDh4mEmrcGIW6Ezs2Sv0TyawayVTe2E?=
 =?us-ascii?Q?kC3jprRFZIM2qIry8rKEnDjwPjuw+JZgAJf9qBMYSVpMJ9MQ8n9AQqyBiSfn?=
 =?us-ascii?Q?sXVPnsAVRHutUfikr+D1MqRvOAwyEGsQu0Vqb2F7bV08EWx7lC0yxvxXixhq?=
 =?us-ascii?Q?rd/dfveyN8BoJvC7T4zl+Rqw9T+TWed9rgbsfNPBVS9/bZ7PJUDmv/+uzlmB?=
 =?us-ascii?Q?EF6Tqu//N/ecn5VLi/ufxERreeaftmtw0l0Y0d/Pb82aLkXuBqUkAkeGAlvD?=
 =?us-ascii?Q?eZf7OwcpXA1sCFHJF6R/qmJM1t6kunWGobxLL9uZbXXPaFdOFNiCFb1ec8ir?=
 =?us-ascii?Q?x7loas6+b3l0d60=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e556039-c299-42d1-32b9-08da31ab4716
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 11:01:33.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0902MB2057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 11:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165396

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
v2: - add ML link for Submission status
    - rebase on latest master

 ...01-Makefile-replace-mkdir-by-install.patch | 84 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20220411.bb |  5 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-=
replace-mkdir-by-install.patch

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace=
-mkdir-by-install.patch b/meta/recipes-kernel/linux-firmware/files/0001-Mak=
efile-replace-mkdir-by-install.patch
new file mode 100644
index 0000000000..b1ac5a16ab
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-=
by-install.patch
@@ -0,0 +1,84 @@
+From 71514e74f35f2b51ca24062573d6d913525b30db Mon Sep 17 00:00:00 2001
+From: Konrad Weihmann <kweihmann@outlook.com>
+Date: Mon, 9 May 2022 12:57:57 +0200
+Subject: [PATCH] Makefile: replace mkdir by install
+
+mkdir -p creates paths that are bound to user's settings and therefore
+can lead to different file mode bits of the base paths accross different
+machines.
+Use install instead, as this tool is not prone to such behavior.
+
+Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
+Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/PR2PR09=
MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com/]
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
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index 89e1b8cbaf..19b970c091 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
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
 SRC_URI[sha256sum] =3D "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d2=
06ec9840363849"
=20
--=20
2.25.1


