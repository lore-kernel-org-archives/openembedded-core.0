Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56555D25056
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:54:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29418.1768208067155514181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bvhNR4zA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54729221db=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C5U2fu2134451
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ESvMZEod0ZyT7U+9+ke6
	d35WOvrJkaltW8cTx0PJ2lw=; b=bvhNR4zANsOb9DguLQVVOgj8uxo2t8kxsrHH
	uEOHqxL3jclCnLakiYvyk05FVN72j38Iu08CssW2KT4T44nRFaXQHIDwNLfP1g6e
	H9pIbUu/X8SKoMPjaIq+tkJ0LqRp0dbGM7X2V5eIIL+mBY3BA6NSdm7MzmOHR3rd
	Ml3mP8WyxIyJuYlFIz0CBWCsdL8fEag5baUbOrmcRbY0V9W/Jd9aPj/yxDs8ucYM
	AU7SrVMcmFVCN4wXKTwsJIf7agcepUcMMCTbQ5JBLssv68mXRkhZlSSGaX03Ke+r
	ug7yBR6cocySf9ZQ8f4oECviuxdWehzXylxQJIqqNky2vxfkrg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2hhwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:54:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 12 Jan 2026 00:54:24 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 12 Jan 2026 00:54:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kbd: use zlib to decompress files
Date: Mon, 12 Jan 2026 16:54:22 +0800
Message-ID: <20260112085422.683754-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: S2DXaugzvjBFviRhpG0uVSJti-ZStyil
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6964b6c1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=HhO9nwP9AAAA:8
 a=1wLnWqCVnAeqOcLfaysA:9 a=iw1z1-gYHSUTv57G:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Hfi_5et9FXboTuDuzneU:22
X-Proofpoint-GUID: S2DXaugzvjBFviRhpG0uVSJti-ZStyil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2OSBTYWx0ZWRfXxjeecOlBN8IV
 Igr70/UkvDHrSzk2gycbXLuXTcjqCzTUTbDhbJjGHIWcBfsPhzxcas4KrAIi34HRq5nalCNYFYH
 TjP5vNWW1pzbn/FW7GwjDuW+h333OCG5O4g9ndjvhJHDLUSMFSmWwfY22Je0sdvXZxohbfKGTAM
 x8UIqsBL1fwIiHMRg1UoxcOkrOUliLWwQhmulbbllP+w74MyDPfqh8ZZwnrHye558rXV25C8rgP
 3CmiiZDXSpHvBKKwpsHrSorc7fwqoGIti1bCo5SBDYzC/ycE7d0RsH2QBraLlVb3498e4KPqeKf
 +oIZtByZ/cE4WMQvnEaghdoapig1t70OcThdx1c9xRhhMSVcMQRCsdavKCPuq60l0+t5dv6YcmV
 8CZp1cdoB64o/0CvIIRIWh2K5r8/bakozikzkftskX+A7xWDjYEGA73iincxn0AHXhwXhilxZP9
 nQze5Y7oMQpGwmtFzBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120069
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60C5U2fu2134451
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229194

Upstream used zlib to decompress files [1], add PACKAGECONFIG
zlib to avoid host contamination.

Backport a patch from upstream [2] to fix compile failure while
zlib is used

[1] https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit=
/?id=3D7fdd8debe37ae52812b77d82e08713bd62c607f4
[2] https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5=
932e17f50d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...x-problem-with-undeclared-sym_gzopen.patch | 57 +++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.9.0.bb            |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem=
-with-undeclared-sym_gzopen.patch

diff --git a/meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem-with-u=
ndeclared-sym_gzopen.patch b/meta/recipes-core/kbd/kbd/0001-libkbdfile-Fi=
x-problem-with-undeclared-sym_gzopen.patch
new file mode 100644
index 0000000000..84d273c19a
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem-with-undeclar=
ed-sym_gzopen.patch
@@ -0,0 +1,57 @@
+From 2f9a4e56c2ef245fbe840677aad9d5932e17f50d Mon Sep 17 00:00:00 2001
+From: Alexey Gladkov <legion@kernel.org>
+Date: Mon, 8 Dec 2025 11:28:24 +0100
+Subject: [PATCH] libkbdfile: Fix problem with undeclared sym_gzopen
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A compile error occurs on certain systems:
+
+kbdfile-zlib.c: In function 'dlopen_note':
+elf-note.h:27:30: error: 'sym_gzopen' undeclared (first use in this func=
tion); did you mean 'sym_gzopen64'?
+   27 | #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__)=
,
+
+kbdfile-zlib.c: In function 'kbdfile_decompressor_zlib': kbdfile-zlib.c:=
61:15: error: implicit declaration of function 'sym_gzopen'; did you mean=
 'sym_gzopen64'?
+ [-Wimplicit-function-declaration]
+   61 |         gzf =3D sym_gzopen(file->pathname, "rb");
+
+The problem arises because if -D_FILE_OFFSET_BITS=3D64 is specified, whi=
ch
+in zlib ultimately makes gzopen a macro that expands to gzopen64.
+DECLARE_SYM(gzopen) from elf-note.h then expands gzopen to gzopen64,
+resulting in sym_gzopen64 declared. That's why no sym_gzopen exists.
+
+Link: https://github.com/legionus/kbd/pull/150
+Suggested-by: Jan =C4=8Cerm=C3=A1k <sairon@sairon.cz>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Alexey Gladkov <legion@kernel.org>
+
+Upstream-Status: Backport [https://github.com/legionus/kbd/commit/2f9a4e=
56c2ef245fbe840677aad9d5932e17f50d]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/libkbdfile/elf-note.h | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
+index a0fd9e2..d3b8d5c 100644
+--- a/src/libkbdfile/elf-note.h
++++ b/src/libkbdfile/elf-note.h
+@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...=
);
+  */
+ #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
+=20
+-/* For symbols being dynamically loaded */
+-#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
+-
+ /*
+  * Helper defines, to be done locally before including this header to s=
witch between
+  * implementations
+  */
+-#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
++#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
+=20
+ /*
+  * Originally from systemd codebase.
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/kbd/kbd_2.9.0.bb b/meta/recipes-core/kbd/k=
bd_2.9.0.bb
index ae07979733..79b011e529 100644
--- a/meta/recipes-core/kbd/kbd_2.9.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
@@ -25,6 +25,7 @@ RCONFLICTS:${PN} =3D "console-tools"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://0001-Preserve-only-necessary-metadata-during-install.p=
atch \
+           file://0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen=
.patch \
            "
=20
 SRC_URI[sha256sum] =3D "fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfde=
a1a45120951b02ed"
@@ -32,9 +33,11 @@ SRC_URI[sha256sum] =3D "fb3197f17a99eb44d22a3a1a71f755=
f9622dd963e66acfdea1a4512095
 # 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
 EXTRA_OECONF =3D "--disable-tests --enable-compress=3D'gzip -n'"
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                   zlib \
                   "
=20
 PACKAGECONFIG[pam] =3D "--enable-vlock, --disable-vlock, libpam,"
+PACKAGECONFIG[zlib] =3D "--with-zlib=3Dyes, --with-zlib=3Dno, zlib"
=20
 PACKAGES +=3D "${PN}-consolefonts ${PN}-keymaps-pine ${PN}-keymaps ${PN}=
-unimaps ${PN}-consoletrans"
=20
--=20
2.34.1


