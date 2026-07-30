Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D87C55167
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 20:36:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20891.1785443767037348687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 13:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=JePFHpTN;
 spf=pass (domain: prevas.dk, ip: 40.107.159.12, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8LdUQZ1wFM5biK7eLesmkFAXT9Hg9Pa/4Fqp2aV1CeU3iMFmxBNWzZEY7+fjm8M3UyNurDibeX1IyWlYymzuwxUuzkDdrqzNkkTmYiM3j2Ybky/q3d3PwxGHTUoW2JPTN1mU31spruQC/ZiXVZjbi3RAgRTgxZXgFjx1kLAtIm/RVMcWCfB2RxstR6aMtPprlouCzqthn5q7gERrHMT0AtQ1cH0CISDfUvSid4Ve8nFZj5Q7Yp7lg4BtvBNdDJr15sm0veArBkwQxOb4goBJGpqd2nNX52seODa8nC9vGloCmrwIpCKAAIUBcCbBeBLnu08mpSveZwqvKyJNDL9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMqU89lizJcFJs6CfsjXQKNiZLRYZmFtiZraloIx+4s=;
 b=hSvfdyN7j1j4E/nWMCPhYYulUUZ78/otysNrcTHn6M1N2I5nOvMcR4yj7qcEAR2FIFgI/sjac4ySTHb0gUOuXY4t+mEqMm+3JUcVwxaRc8PFaQJ05t76CxYGfM+LmaK6WS7ouZqwlvK+nLU+aoBUihu1ZHW8VZrI6E3VmrW4ruKqHobCnxvmBDL6lnoFEVsX39F7fn9mm/oFHV6v0M3bRAEXQU3ZEhwK1aaj7n3vBbBlbWIbhl/9enRppFgy9/urcaUv4C9IaBgk9e2azemgRjLWQ2GseBPbJpXYAFUxQIBp2s8XBdRtaK7sta0Ic+uv/rPbqKn+5pL9y78HSiKzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMqU89lizJcFJs6CfsjXQKNiZLRYZmFtiZraloIx+4s=;
 b=JePFHpTN2IY2gb34rFVf+aFMKwnqil9ZeQV4c/BsdVta4NyC3o3xE2G/5sRWUj6mUuk8iqslk/yatDeSpxTCiVqbrDbbEFKqbG08FQYG66YA5aviJmaJ96kdiL6pDiCOjhT8FN2sbgVGVxjZStG02pnDuCU+Ye+6jHf6wI+AD80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by DU4PR10MB8922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 20:36:00 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 20:36:00 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Paul Barker <paul@pbarker.dev>,
	Sam James <sam@gentoo.org>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH v2] ncurses: stop moving terminfo files from /usr/share to /etc
Date: Thu, 30 Jul 2026 22:35:57 +0200
Message-ID: <20260730203557.620819-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPBP307CA0003.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::15) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|DU4PR10MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 6597fe53-b13d-4a9f-cb91-08deee7a2a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wqFYQ8sXmpnheFhPxn5jY2Hs83XdTEWLum/c9LaLG4ydXVyxJv+j4ukS3az6dwiYrrJslhVGoLKe2nkKxReUFKistgAt0R8xZDm8Qpk+R9d5vUyqMSIcLl02ZGFGOxJa10x7iZUAJLWJuQtJCaoSYyIgENDasnNmKvB+/+eLnaOWgRfZUd7avUnLGRcmNqL88lvnRgmfFTbOrcDp1wRVOYw7lak9uU8XB4RgnlGej7s7bacLuxnEt0Awk9F16pI0IBIkH0fvqjNM/ATRW0ytjlHdr962Vh/M0/wVYteh/iD8qxWtjCrlxw3A0YZmBdpiuhUkGg4yzlbFhhjYpH4+75SvAEEOgv2DtSfDlONbSd79DwgnFLEG2x9ExpKk1/DoQZFsw6dYin3SA7yFZoKQrzZZYM3ouqFuCCn3373mCuNlrSl4ocwFfLDC88Lm+jgHxyQGYmbwqoZmko/DV8OSpqkq0h9bT/zAC/qcfk+A2jJZ21wBkvp8rVK++E3pOqM4e3t2PsyVQPeamDE3xqHqvagw+vzdsqPffdxytWXb5Awf0o6y6EXb7EiVePDF45f4H692wS5BquPy9aHnwFY+1lMtvuFtxTy3IUN1J4ZI2VGtCg3IlfSvEwGlZJp2zPLBwh5AKO+uDoGjCzaRT71dlF2ddsXeN0TondQH9tUOWdQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s0tAtMqacH/yv/QqUVSdkhoIa3PonqJddakJ51tfAsSalfbtzJk+/J0J8h3r?=
 =?us-ascii?Q?6d3ReQAjQgGsu/iGfbn722gL+EgsaoLggPwmS3nrnrn9c98Y0Hsj4Y76EdCl?=
 =?us-ascii?Q?7FNid8XW7zEDP1HTTIkVnxoM9kYUt4zxYJl6AYO8xBDJ/PhfzK/Qh0bWqR6x?=
 =?us-ascii?Q?0rYPdnU98F1KpdAd90bGjGED1VMhnNnJ4jtN1rJAwAjB2WUQtNH9VSq98dOk?=
 =?us-ascii?Q?F9rLd4x8gOnm4hMy/lLQK0oNMsGb8Cn2LfE9xQ5b3YCIltKslXIXhjdJe6Bq?=
 =?us-ascii?Q?YYYwLNeXLcWY86OF3DtXqhdtsXjQCkEMT32lOFbsCvo6l8ODFe35TkRWcLJy?=
 =?us-ascii?Q?ky2MOxQCh0Oj/3E+DFKLqpU/Yq6ohQP6xzTz7EuUYk2Ojbl7OHcj25TabAxx?=
 =?us-ascii?Q?JHb5bzdErXZFonJ5MKcHiFVhxRYw4R6zn4KQumRCn5tFtDUqU8+1VcLB1c3C?=
 =?us-ascii?Q?s/nOmLqLWUEFzdvDfIsDIJ/k7qfrAmUxhwNYcIWgun/E3WRffUAZ9k2pFbt4?=
 =?us-ascii?Q?b/25aJzU6IhQQBA05cB0o9HTcf9HfGbPDxKoPzH8Tvy5DAC7wwxM/EwvD5Iz?=
 =?us-ascii?Q?xpITirHdC9y2MFOCNNxIBEYuQevFOFkDRducAvq8V3cUeBE3mFe4BJeExbaq?=
 =?us-ascii?Q?eNCYYD+BKsa83449+rmOAbOTcNdPBILn2cuUHoL1gEU/SF2eP8f1OZveGDIp?=
 =?us-ascii?Q?eLvEoMuu6f8rdBY9Z9kbg/UEuFp/bhCKK6BxFKnCcXqjJOBTW42bi9s2Uh4J?=
 =?us-ascii?Q?DE142ki+jKeyn2MFLg8X+QAeFNy0aX3uDtj2jt8CoTx6fjeS0HtHrjJ8XFRx?=
 =?us-ascii?Q?+5qzkMaalTT0j7j2tQDGlAa6LVwBAhSWqi9jOmLwpsf8gsVx4SmGaCS7+y8w?=
 =?us-ascii?Q?oqtacQZmEX2Tmv+xgBVPS385wX9+zxWW8awZtlawYOVjBMhPFYlqIQw+Skpa?=
 =?us-ascii?Q?gisQzrejasi7zIvj4vSaTU8Wc/T9BRFml1wXsPG5WgSGqPY+FV5rvQlbepqr?=
 =?us-ascii?Q?mU6aLNQldlFrd6oSG6MD3WKedvrnOE5N5pTswjcl0bVWTAI+vmlxxtizXCYQ?=
 =?us-ascii?Q?dShBog8h/9ixDrQaPHUlKvy0nnsfMh12b6tpNaqFO+ATGqtEsc2WaPdfRdtX?=
 =?us-ascii?Q?OjUEdj/HVgVb5qMJs4CQJk+isbCh6hyfWmN1Lw3ZEgqY4WCS7uyn35guUX1/?=
 =?us-ascii?Q?/07uQWuY4kKjXvDG2i/E6TcJvxDemJWk8uxNEzGmxn9diVkhNKo/DhW13cc8?=
 =?us-ascii?Q?f5A0IzhIgeeuwVAZFQhqbKFfBRNRuqpC+a16Vw9kzgCtfDYFaPiiG6NPeXRE?=
 =?us-ascii?Q?Z53bOF8H6NQWBMyMqBiYrvMP5Jg3fwHflx25tHOYcbA5hY3AwKBg9vmG2QF4?=
 =?us-ascii?Q?NwyQ8QETaKRCtnZVmI9CBY9bpuZTDHpkZo+vBTqr9+9qIB/nFcu9lIMJNfiA?=
 =?us-ascii?Q?TindkJWMJWfZdvdxcMqH7yHTMNaDoC6I4n1K3eRy4eqKnEDS/9qGxbzjEPKc?=
 =?us-ascii?Q?cIOowx/6EoASvaPUhtmA6vYI0eTU9zLmGbPkOeBTyzNeZrmaVC9eA5crzgCj?=
 =?us-ascii?Q?9D3KWeBBADvF3zHyt9e3vevdj2mxeAWjDAMNbUbyixq1WNvZNpXaNEd+z63M?=
 =?us-ascii?Q?ReLjFaKHcSadF5rMu+NjV0+W8jKuTnyy87lmDrSJvJU5O6f99iytYNqYPZfd?=
 =?us-ascii?Q?HHbjGrCrc84DAw7T+cumTa1uH0iwKD+8HWGUUIeA49nc427FvCr6hi3rb78C?=
 =?us-ascii?Q?HqYeaTPdmBf555CpkFvn9x/9vGYRwGc=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6597fe53-b13d-4a9f-cb91-08deee7a2a7a
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 20:36:00.4441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3gsx0WsKPsHAasB//mI2k4CgPSwcYVHtVTNX7GBPBevX/xgfGjnY23GGKyhx8GJTZkjW51/8Q0tCsXV6aShbgmJSbmAmPH/2Ct8E3tfzg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8922
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 20:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242379

From: Rasmus Villemoes <ravi@prevas.dk>

Why it is done that way is mostly lost in history. The gentoo
reference leads one to [1] and then to [2]. But the small set of
terminfo files needed for "recovery" or an initramfs or similar is
exactly what we're putting in the terminfo-base package, there is no
need for those files to not just stay under /usr/share.

This also drops the xterm -> xterm-color symlink. I don't think that
symlink is appropriate nowadays either, as running

  infocmp -L -d xterm xterm-color

shows that "xterm" (aka xterm-new, aka xterm-p370) has far more
capabilities than "xterm-color". So instead, just add plain 'xterm' to
the TERMINFO_BASE variable. Incidentally, gentoo had xterm in their
"basic" list as of their initial git commit 10 years ago [3].

Moreover, as the xterm -> xterm-color symlink only existed under /etc,
people who install the full ncurses-terminfo would have a
/usr/share/terminfo/x/xterm which did not match /etc/terminfo/x/xterm,
and which one an application would pick up is not obvious.

[1]
https://codeberg.org/gentoo/gentoo/src/commit/bebd3a1055b402d62afced244235e=
6fc4917cbd2/sys-libs/ncurses/ncurses-6.6_p20260411.ebuild#L414
[2] https://bugs.gentoo.org/37026
[3] https://codeberg.org/gentoo/gentoo/src/commit/56bd759df1d0c750a065b8c84=
5e93d5dfa6b549d/sys-libs/ncurses/ncurses-5.9-r3.ebuild

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---

v2: Updated commit message, replacing incorrect gentoo reference with
somewhat better researched ones.

This was originally a 2-patch series, patch 1/2 is already applied to
master as 9aee6b23a9 ("ncurses: put symlinks to basic terminfo files
in ncurses-terminfo-base package").

 meta/recipes-core/ncurses/ncurses.inc | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncur=
ses/ncurses.inc
index 8fff9a226f..89668be363 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -162,7 +162,7 @@ _install_cfgs =3D "\
 "
=20
 TERMINFO_BASE =3D "alacritty ansi console dumb linux rxvt screen screen-25=
6color sun \
-  tmux tmux-256color vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree8=
6 xterm-256color"
+  tmux tmux-256color vt52 vt100 vt102 vt200 vt220 xterm xterm-color xterm-=
xfree86 xterm-256color"
=20
 do_install() {
         # Order of installation is important; widec installs a 'curses.h'
@@ -183,27 +183,6 @@ do_install() {
=20
         cd narrowc
=20
-        # include some basic terminfo files
-        # stolen ;) from gentoo and modified a bit
-        for x in ${TERMINFO_BASE}
-        do
-                local termfile=3D"$(find "${D}${datadir}/terminfo/" -name =
"${x}" 2>/dev/null)"
-                local basedir=3D"$(basename $(dirname "${termfile}"))"
-
-                if [ -n "${termfile}" ]
-                then
-                        install -d ${D}${sysconfdir}/terminfo/${basedir}
-                        mv ${termfile} ${D}${sysconfdir}/terminfo/${basedi=
r}/
-                        ln -s /etc/terminfo/${basedir}/${x} \
-                                ${D}${datadir}/terminfo/${basedir}/${x}
-                fi
-        done
-        # i think we can use xterm-color as default xterm
-        if [ -e ${D}${sysconfdir}/terminfo/x/xterm-color ]
-        then
-                ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
-        fi
-
         # create linker scripts for libcurses.so and libncurses to
         # link against -ltinfo when needed. Some builds might break
         # else when '-Wl,--no-copy-dt-needed-entries' has been set in
@@ -311,7 +290,6 @@ FILES:${PN}-terminfo =3D "\
 "
=20
 FILES:${PN}-terminfo-base =3D "\
-  ${sysconfdir}/terminfo \
   ${@' '.join(map(lambda x: '${datadir}/terminfo/'+x[0]+'/'+x, '${TERMINFO=
_BASE}'.split()))} \
 "
=20
--=20
2.55.0


