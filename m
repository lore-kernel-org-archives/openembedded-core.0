Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110E6CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:37:07 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16409.1792136207389330684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=o1peKZwb;
 spf=pass (domain: est.tech, ip: 52.101.72.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idq48CZNidZm0N4gDSrfPUWxmAOa7KM5BaOZdv1ZLbzlV0Ty/AUUcs/LElF2FsaPsDwxjoZpGRz1vQnh8fMtcTzxUt9VyVLH9yXzW68iFZBKlMR9AvuoUXIt2i0kdVhw00JgtQLkECfajhXgj9v1qZdVi0R5t1KM735rSShqWtzPXNpZxH32WzgUIrb0M7iqwGeHW1IrjUgYBCjB8c2SkIOjEVRz5IY8YFo26njrq+FG/UIf/CldKyeY6Q/mkjEhYUqOwi1WOUo4CMI0Qsncl8j/MUAXBFAIWL55uY46VuztSoyf8AWSuZvl3AvCskZXRi0DeBsE/Uvw1IYYR7JP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aaRmYjswjJWcWm+Q5tdSssvaBzJxXpriqwent2XFXg=;
 b=cCNY3DjLms7xw5Q5qR3/nwHR2iyY622dLultpMi/BBNPHTqamALIxMr/+UccRYSqZjUku+11+xJlnwhpyS4Dhsc+OhQG+gXAENAFD43xtTi1Q/98JzFR6W2AQ9cTgJjZI187slyTQXTCCUoTsPib0yAZqUcVYLVsiiTpT4FjDK5bTDoBgLvvTotqj3ZLrBX47kx7qcOSblnCScNHyW7xmahu5tSyERt+lbUzqxIkchqDFOYGB3iGh7T0kb5Aqlx16c3YqfXbMCZnHIEZZOngwX9rxZvYNxfd13rtef64pJ3+2/JrbA4iiwmWspDaYA5lTF3GrSQlOhXPVdrDK0+qcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aaRmYjswjJWcWm+Q5tdSssvaBzJxXpriqwent2XFXg=;
 b=o1peKZwbvXEG3e0uutxCiDAmOl/8ZB5nDHKeOGjLHjMqyNrolKoM/KyBgbWVrVyuZiHny7XN3/yee8agnhUfbzfA04vxiAoFRi0AhNQNDy+p1Y5kdCR2zrXaIMb0fEufhY0By3+qV8JrlTmeXWQ7NjOLJHy+oPO+rq6Yk2lio4hjj8/9krfxNzPGd4aJhZZ6zeCxHxdrr1VIeiZLeQRAV6QumTSdtZ+UkwfDwJCzqAE/WXmUnIHjMmv5lF1lVLL5At0n75tl5GR4x9d8zGmsWA0lIyHYeuVFk8T6dhI1NX5+oqPaRvvfHnAyCKRUGNfxIE1r39scl0ZP12PckTjV3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::21)
 by AM7P189MB0663.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 07:36:43 +0000
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167]) by VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 07:36:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Volunteer to maintain
Date: Fri, 16 Oct 2026 09:36:40 +0200
Message-ID: <20261016073640.5729-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0340.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::12) To VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2cd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3116:EE_|AM7P189MB0663:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b58111-350a-4808-5966-08df2b583955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Jwfh8qmI2jcwrD8lcO0+64i9gTJZ7VVnD7VJJcshMMfGzp9fMc9I7Q7OvF+R9awN5cbKhQZJ8rfLNqsWRGd7bgBBdW0R3YodCcPvQEfH5lpObq9FWbAJSsfIGLdi6iF3WDFuXhg7Crevl+OQmkJKRHFUAXkZ/wuAxDVxigj8+EKnmQEOtc2ruBtrR8SnzgAAgVPCOjr1kov/ybFZNZoFXsp1ctOjiyQ4fI9hF3rBRCS+FgFbqvb+flXRtlKu2AHZmqya7biauZ5HWmU0FM3jNmo6WkNRHAKkcMYimrnLOpOlJwfzd/lzJmHYOQggXilQ/YnEnXfvzAOpX6P3ZirUZ0A3czGGIzwuCvzJtqXCUDX2shMfetg8VvqLRVD4bv/n3LWdTOa25EIRBz65bmCoGsZmz2deXmGLNzWD9FvggrxYd65bCQq0oJpNj9IkNDuCLyyTtH4EE2XwBPOubP8OMfYVa8a/qBvC+mM6wAMotlXsiokmDm3kZaLk5+HocORSMviNurG8jyrrzIeO9OQYZSO6cgOXmrPJsfsKSN5vY8ognEAHo7HdqwWvvefUi8o5GWsZgzoqn0yVNNUls1CEXJN3A8jPr94yLqgiZB5rSuxnn3bd6lMa67fUHpdRTFPj5fpMd8aX04XPreRk+ArJeq7jp5kZTTG11YT1t32ZfFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3116.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tyfMr91iz/AQvdCzJpw+pOgBI27C8zgS3a2Ct0rGJkrBTasGcG2Sf7ucgjH3?=
 =?us-ascii?Q?YzVX3Wpjq1aF0znAt9SQwVLdEwTzcPfzxCAhZb0MEjGIJXQcbFAJz11rEzqt?=
 =?us-ascii?Q?WNrfFha5CHLNtZPukOQyuwIESivGQ/9kjc5wUMTYXz/nNxZG1V8+74dxC8a9?=
 =?us-ascii?Q?0wrN57a6ROyRN5GYFhsop9lTAMvFuLoGbAXGtlAPAhKwYVft/st3Iru77hE3?=
 =?us-ascii?Q?b6WlluSXFTkK7vNgcnPhs4W433GXT36Qk5vwdLBH9GwxSr9a6bOksfVAhp78?=
 =?us-ascii?Q?1AMLNLhpOEfpN/V9JdzO9AemeghPAKdyy8XBm3HvlMr2EzKcgeH+KKlQQ98G?=
 =?us-ascii?Q?xpiv4Owmw2F+rCtmiEsR3FssKki5fyhdp2W/+K9jUtMsJzDst2QxN/RohR8g?=
 =?us-ascii?Q?vZmwHzXl8ZVvvGjBEVOS+2RmWaENmQR4BhQNrG5IdBCNbdsORK2aXNbatEve?=
 =?us-ascii?Q?66snj12Hn1FEmXQyMyPFo9fdqq15C2u8fC+6VveEzvkgNvawpQjeW2mxfn1a?=
 =?us-ascii?Q?v0YSM3cMac/Xyyv20rB9/lybArK0ly1/6Kpfcy9FH7CC6uJ78e9CwcXaoxN/?=
 =?us-ascii?Q?KLmONtdADEhpEGn718RF/rTU7Nw2s0C7gtTx9xPdUzI5ywWjNLYOerK9EM68?=
 =?us-ascii?Q?s6vR4iZzCVLP32o75bwsK53TMXGtK1sa74diyEBu7OYo7FHWXnM4CyPB0fIE?=
 =?us-ascii?Q?/oxwNcdKQCGWMNAWXitfBZozrDK2sr7tNeJ4dLwvppoHlfzCvjzS4RjDRhSx?=
 =?us-ascii?Q?SohA6BfbDoPC4zx1AMMvSBv3Wk+TeyscxB7J6NM1OyZfsUuJH5UE5P67h58b?=
 =?us-ascii?Q?JGISU5O2YWDk/HKEIJiqUjPVQtk7zU18gAlSCDta9m11sR+FS9j/TAJf4orb?=
 =?us-ascii?Q?lrHuwzb3rTxkRuZeVxBLI+Jy9OghpK+clDc7FRsPQhBB9rF3OZzq7yHBig62?=
 =?us-ascii?Q?uJpE8mHpwzYpD/K3XTYoxJJIfSbgubss4M/ZRlDSeFt9RDyqG6as4SeFM9Tr?=
 =?us-ascii?Q?nssoWneo7a/tyP/hZRDNbZd4mxNwsoXQhB6vqrpEARIj+uK5VQdLCbFhB+Z9?=
 =?us-ascii?Q?5nkl6ShRxU+BQINQj6DTbg26q0r91rOfVgBwOOKBSa0C3OUQ5O/ntdIr7aft?=
 =?us-ascii?Q?A4pe3L+URdVGAER6qvJ2xVBU4JSkYD3hMRUTXw/f5s82AninIsvaK7pbXBpr?=
 =?us-ascii?Q?gOF+hFfIbdvcjBFC7e8nICpSFazNFDTzzKbEqqu7aPzTdwcg4+1HIWVub2qG?=
 =?us-ascii?Q?wM920u+soBGCkfLPTyVEjTDpRaTJx5W2jESMQb/Rr9szWbLEh0++12SF7/Tg?=
 =?us-ascii?Q?HPVCUkdXMdiElxJKQSwZ2L9lZV7NSWLt16JHphZwFzZ5DoM2/RYR0uPuiGFu?=
 =?us-ascii?Q?BVDmtwAy4d/anjvihKVFfJOrQ5OgJ4sqJqKc3KPVPtKF7YJW951hVQ4RCian?=
 =?us-ascii?Q?XFwWVxQXKZz68qYoUaoC4tqAD0QCr4X9pJexEgOjuRe9NUyMZJoUz/ovSFH3?=
 =?us-ascii?Q?2t9WG6JIG8yNMFbfT4k37NNl7zXYotlAIvY4oaYTl0y/FMNohE57dSWOGZbd?=
 =?us-ascii?Q?zIRkju1v2piT98mK4q4mcv3R1zg4rD7jSTSCNnfl53zR5usIF1sBe7cwSQLQ?=
 =?us-ascii?Q?pHxYR6W8inbadzMLDRkWGsMAy+G4pa331vWJYI8/NdtffINAH2gZ7FSgzgfH?=
 =?us-ascii?Q?SAi5bSEOZ1bYhSS9PUS3E57zVKXedZncRrxaxf9LsOA9pNfFSLO8wKCBmrys?=
 =?us-ascii?Q?qkvdQAwcJD1bntC6NE367qDQmmRk6hE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b58111-350a-4808-5966-08df2b583955
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:36:43.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmVXvWlpJekR2aDRXZgVkeUHmoyuP5BDg0u8TITRYTQTC01K8Bc0FXA/Jl3rJubUHj95JhkKGo0FFFpFGO9KbvSbYc3C1sh1Xp2/iTzoY6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0663
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 07:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248001

- Volunteer to maintain base-passwd, openssh, wireless-regdb, dhcpcd

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 94ab0ccace0..6d15e015695 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -59,7 +59,7 @@ RECIPE_MAINTAINER:pn-barebox =3D "Enrico J=C3=B6rns <yoct=
o@pengutronix.de>"
 RECIPE_MAINTAINER:pn-barebox-tools =3D "Enrico J=C3=B6rns <yocto@pengutron=
ix.de>"
 RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <alejan=
dro@enedino.org>"
 RECIPE_MAINTAINER:pn-base-files =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
-RECIPE_MAINTAINER:pn-base-passwd =3D "Unassigned <unassigned@yoctoproject.=
org>"
+RECIPE_MAINTAINER:pn-base-passwd =3D "Jaipaul Cheernam <jaipaul.cheernam@e=
st.tech>"
 RECIPE_MAINTAINER:pn-bash =3D "Josiah Metz <josiah.metz@windriver.com>"
 RECIPE_MAINTAINER:pn-bash-completion =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-bc =3D "Unassigned <unassigned@yoctoproject.org>"
@@ -150,7 +150,7 @@ RECIPE_MAINTAINER:pn-debugedit =3D "Chen Qi <Qi.Chen@wi=
ndriver.com>"
 RECIPE_MAINTAINER:pn-dejagnu =3D "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER:pn-depmodwrapper-cross =3D "Unassigned <unassigned@yocto=
project.org>"
 RECIPE_MAINTAINER:pn-desktop-file-utils =3D "Unassigned <unassigned@yoctop=
roject.org>"
-RECIPE_MAINTAINER:pn-dhcpcd =3D "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-dhcpcd =3D "Jaipaul Cheernam <jaipaul.cheernam@est.te=
ch>"
 RECIPE_MAINTAINER:pn-diffoscope =3D "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-diffstat =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-diffutils =3D "Chen Qi <Qi.Chen@windriver.com>"
@@ -576,7 +576,7 @@ RECIPE_MAINTAINER:pn-numactl =3D "Richard Purdie <richa=
rd.purdie@linuxfoundation.o
 RECIPE_MAINTAINER:pn-ofono =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-openmp =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-opensbi =3D "Thomas Perrot <thomas.perrot@bootlin.com=
>"
-RECIPE_MAINTAINER:pn-openssh =3D "Unassigned <unassigned@yoctoproject.org>=
"
+RECIPE_MAINTAINER:pn-openssh =3D "Jaipaul Cheernam <jaipaul.cheernam@est.t=
ech>"
 RECIPE_MAINTAINER:pn-openssl =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-opkg =3D "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-opkg-arch-config =3D "Alex Stewart <alex.stewart@ni.c=
om>"
@@ -895,7 +895,7 @@ RECIPE_MAINTAINER:pn-wget =3D "Yi Zhao <yi.zhao@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-which =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wic =3D "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-wic-tools =3D "Trevor Woerner <twoerner@gmail.com>"
-RECIPE_MAINTAINER:pn-wireless-regdb =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
+RECIPE_MAINTAINER:pn-wireless-regdb =3D "Jaipaul Cheernam <jaipaul.cheerna=
m@est.tech>"
 RECIPE_MAINTAINER:pn-wpa-supplicant =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-x11-volatiles =3D "Unassigned <unassigned@yoctoprojec=
t.org>"

