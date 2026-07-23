Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4BBC531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:41:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18529.1784792467119693342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 00:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Z94sOIh0;
 spf=pass (domain: prevas.dk, ip: 52.101.65.48, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBQ1/EB+pFbQqGQzmgBKcGhbsx9UAh6VgJhow8nDmFWLRq8ynz68C6QmJ1bhbowH9We3UGqdIYEhi0lnzW3Sk5fKt5TtsclqhQ3uXv7L9GUo6kRGnMEhF/LjC4cwme+UGGG8t1JPl7zkzoM59HLV3AcZsR2DtEj67Pzvb+y8RMH1jvsw3uAqtOLi2+pjC7brGZ0wf2uZxJE4WKm0KY/Wr79Xzuv7o5JPLhPPqX4Kat+ge8Lv3ZlcRUp2OL6uQKfvCXRsqEOKL+CQ8xAzfcJU6Pwd3EE/o/lCNLY3LIAHCyJ8aCn/Qa9ugFkdwvQ8Ufd/ZLUcyItPOVg7ptN9SCCvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07kOcIzN7RkOT/4eG3Ab5Ho13XehvudSNv7pvurPt6w=;
 b=QnNBY5yNmng4ecLhWNv/UTxIBeeWXOJglPdu6INu0JWKXK9kY26jegaX/EGpEZtaPooKY0FPnW4P+180iJrz3n0AKCab8m+Xdd98rf3NT5pJ6e6Z00yQ+r35QR011lpfkqTyuL3hKFkGcChNciHi3Xfm3eXQrXm/hLVB6yyQY5IyNdtZmHLAEFLBiEi2XNtCBnsE4P/cFbGqRTPv0YdltaS/Ar4+AsDoWJTwq56GtakcJfm7l9gerWeiEcwozRvgJ2cr8PiSU7kNwpI3MLvH4X/1GiFAqy9lTVxMdEK8k4veHhE2/fU2dL9UZ7/W56sQYMYSLmp6ncY0a/lN6fcC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07kOcIzN7RkOT/4eG3Ab5Ho13XehvudSNv7pvurPt6w=;
 b=Z94sOIh0OiZlaBnmFOIa6X0tW1ypUkHegWroGBb819/r1JXm20BYSrT4ev5GP4Z0sRK5V/ttOFsCkJO6WzKGc/mEk03viCrttsCBexj5q6C5myMBsBZ4nIMtpB4F7ffhhgWrLlilYmzAFo1zZ+EPtzvgb6bhGqbsAR8h8sXrQfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GVXPR10MB8454.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:41:02 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:41:01 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH 2/2] ncurses: stop moving terminfo files from /usr/share to /etc
Date: Thu, 23 Jul 2026 09:40:54 +0200
Message-ID: <20260723074054.2125126-2-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723074054.2125126-1-ravi@prevas.dk>
References: <20260723074054.2125126-1-ravi@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F6D6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::1f1) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GVXPR10MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: d8364731-cc8e-43db-c1f3-08dee88dbdd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	idadR8BRCR5f+rwKwM/tUVnGt31kq9E/oF5WzKsmfCBXA0URYX/iFdxlHFvTb4VcWpPIcllYLK13dYq+WoAsgz/mML2BihtZlCaRJJ3mwhRDkSWXf/AD9BxoitZZy8/3ViXUgsySXT0kFSImfSa05qgSlPHyaJx9Q7b0mpa+N1Zspm7lQpU1wvMljrAwdEnY/xs1tdMemaWbaEQW2cbpmDQHRd38teZrPwPo/TFw70N4q2AfMPqO+nWzzx2DO7GvInan4/kdPa2enZa862WmEQxn9/tjBCHPdvplb4NBYgiIWFOPLXN/L2qGD6RVviVOY50f1raxUK/pfX55JIKZZAukfzBR6r1vQb85F0yMPqTiWJw7uarZKfIXjwHIXDutrUuA+zXydf4BsIWJFEx6Lyvh8fNCynGQXWzT9UjW6rRoYcYnbgFDrjy49kROnOQ3OVcMv1qO0rmUSZxOxIpM2S/lxLLvcCIkU9TK7SXLxw0OlcO4o5nxcylQ7BJmXYPzQwLduWZD5ZtWjWRdR5/VSH5eY/kIVvuw1B0IV+BCdgp/TiL0JY0rcqoWT8FfI4X85gwJmwQtkYuA/8wrnAnq9zJL6ajUlT/qTa27FaTGpNhBoolD5ZmTtKj6GshAfDADI6L/z9fDwXhxf82EtrR2AsZzMy0aArq4vQke861pL+k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8iv1fNmKrgtsen6BLZi8WUjxJVd8XUIKyBqfEeH3bF8LUQXXOAPuXxIwZdYe?=
 =?us-ascii?Q?ZLiMDuZoySjFV8511SfRVZAsnna8QKILrkaec+9er8NewCBoKrhfVbVxUOYi?=
 =?us-ascii?Q?MUQBkiLPW00uue1W6KO497xDh2Ne5rf6CrSdJlYvIX0yjVJqq6IIbg0hW3ET?=
 =?us-ascii?Q?UkWBAjyE/RB2ckuiP4O4Tn8OeCqlRyboRlCyORpZH41NGLtPNCMkjvr1Q92P?=
 =?us-ascii?Q?aBSx5d0CzK571w1NZVBhbyftFt8zqfYhcrOyuh/IRr0kHLM58hiPznBtEEEn?=
 =?us-ascii?Q?gQIzFtCnKldKXglvaSXMaK7Yr6neZVDvj59lUat6MDljA3TvA7x7BvPjq9gQ?=
 =?us-ascii?Q?4Wrq16Kd2b7Rbh9GGAFnLxClRN46zrRcOTklHtUlKXy18kTWqpfvHWzO9q+h?=
 =?us-ascii?Q?StF+/fp5t3IzRAXPi5wzJNxJfUE9tn8lJypS8u8EpRgkNOLNnnecRhSb5gsp?=
 =?us-ascii?Q?bP/pAFRmZraWeBMKXADeoHT2qLyp9gduxaur+FqxVYBKAHShGGoR0kQutaly?=
 =?us-ascii?Q?KVa5/DaOK+MikA3B8aqbFyhYTPWaJndD8JCGK/GxJAUd4dPA7GPWXafNAmEL?=
 =?us-ascii?Q?OticG3baIIZaAtYr/4l+kfqVEggJ510JO5uiMxW1MmlaeSIQyr1bMHYzvwcH?=
 =?us-ascii?Q?iNzZCE2eCVgtFB90bfxbEcMsjfpjMLIxn77WYqI5tMJThHYy9hJUa31eqKvs?=
 =?us-ascii?Q?ljNBs01i5NP9OOocMmtipdFhuAgJy3t9Kjx2+uvHD8Mo8Ha5c4jpIVzg5HN5?=
 =?us-ascii?Q?epJHBOy0E08oqvF6XrtAZnrATN1Ns1hW077IVVZfaWDNGz3/AoQz9dDkDIfy?=
 =?us-ascii?Q?nrlYMIoTmjrAAo+dmVEJJnM+WhA9rvZizXke+WQZmfJYBmicFg0WYTFwdudV?=
 =?us-ascii?Q?UfxsrHY+Ttcm89VFg2pcp0GXBvH8QD3uRx6hubuPvxplPwI2DO5qXNkUl9nv?=
 =?us-ascii?Q?g7gVjelp6Wi4HRUiLQCCujRxyNaPB9R5V72sNE+leYqlYSC5ouzlItz3ycWe?=
 =?us-ascii?Q?brp+onJn3UwMxFvo/WkKG+L5nu1EdcfZS+BmVCuiJ+hoJYjSZUXhPTayeKH/?=
 =?us-ascii?Q?sUpBvhKhoulbdCGWUMHHMuqyzSwmWctua8hJefXuuZmVId4KWModPzL4BOfb?=
 =?us-ascii?Q?MXLKIvjx2i9kuI3PUPrZe7CkWPp8ijdjvc9NkbY3pgTcAmuVR9KPCnvRqnFE?=
 =?us-ascii?Q?aZiN/yFNwTIDU/0LoouddK6SnZVXF53n5yiecqYy8j+lxaqBJqZhlp56IBvx?=
 =?us-ascii?Q?ONBwSJCGhVGmPAbNYcYW3p7SD+4L2kz83xbHLfI9nTpXeLkXtZ4FYEOxK03f?=
 =?us-ascii?Q?x8RHI/Y2DgUThzUnmz1zQbqYlfrmq1RSHGIjOA7j9OOx2KmKsweoJmbSnGbj?=
 =?us-ascii?Q?/hL1QEivbt/geim603JmZZ66rZ3fTXq68Ql2gNqOqJvJkIgOikrEIUq4t35S?=
 =?us-ascii?Q?QnK40ugkPTlcKQXZvqSHwvGpge7DReDanIGTK/g8q+CabJ8Oi1/cHeVSueIh?=
 =?us-ascii?Q?IM/vsaih3JOIddEFykgukHnb35JcGLSoXaUPBVn13+wk9u7lub/cuZF4i03D?=
 =?us-ascii?Q?W8E2i6SJfBIV8oE7UQFusk8VRQF2+m1M63ws/PU9zyxoEjvq9sj9OO9hIGPh?=
 =?us-ascii?Q?VtYr0vlOsrSp7X/r8h7epXJsuvQzD5Ve1QgHz7RIav4SAsGeOn21ho5eOGht?=
 =?us-ascii?Q?oHKIdFsMIHvwOP4I2abf7zABdsS3hX5cLKkUz56oh87ERHxk/jcsVGJJHelB?=
 =?us-ascii?Q?46/agakQceIX84ae0ypSuov/1tPGN/8=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d8364731-cc8e-43db-c1f3-08dee88dbdd0
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:41:01.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kuW17UtHXC7hjYsMME7pwgq46gbtSvgKZjwuQPqmLu7LvUZY57qYEr/B2/jj58LYi6/eD7IlRzSlkrOvPozlSmIg5TKyNcYukpmhkUT30U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8454
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241782

From: Rasmus Villemoes <ravi@prevas.dk>

Why it is done that way is lost in history; the gentoo reference
doesn't help much, as gentoo nowadays certainly doesn't move the
terminfo files around like that.

This also drops the xterm -> xterm-color symlink. I don't think that
symlink is appropriate nowadays either, as running

  infocmp -L -d xterm xterm-color

shows that "xterm" (aka xterm-new, aka xterm-p370) has far more
capabilities than "xterm-color". So instead, just add plain 'xterm' to
the TERMINFO_BASE variable.

Moreover, as the xterm -> xterm-color symlink only existed under /etc,
people who install the full ncurses-terminfo would have a
/usr/share/terminfo/x/xterm which did not match /etc/terminfo/x/xterm,
and which one an application would pick up is not obvious.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
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


