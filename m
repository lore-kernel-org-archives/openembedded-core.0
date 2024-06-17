Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D468C2BA1A
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 10:00:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.61])
 by mx.groups.io with SMTP id smtpd.web10.53158.1718618411829139777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 03:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=KKz1ftb5;
 spf=pass (domain: prevas.dk, ip: 40.107.8.61, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k76LZXJX+z+4g/Ur36lkcjaGGxIowX/VBMPE69sBtb7y5dlXPlodr1gJvrwQWOFQhhKpG9OewjiB6TVvWoPMp9XMu5lBWI7Sf5NQ8aHC1hdb5Yh6vH396iiVpW9nj8z/dfzKqBTeiliwg1DMKZ3BLw+rZ7DZieriE1Y6kX24NWqvgxSRjCcvBSSS+dQOUf2UsHeYnQaVbLQLmawao3v8gOd0b3dd7uY9jakX6a2yIqn9eGI8zYhZN1bh20+Iqbw2c9cV0og8rp42GhfTyyV9L7V2DFUJv4TihfnDWU5k5lV1VUY90saqBHZhzIQTMsq/fcvg9AXAsI47VVc1LNresw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSsj6Xk2SemOzaITXoNyMVfKFYT4x3XywqNlCXbzK9k=;
 b=fjbk35J6hoWOFwdW6Eifs5TO+8va/a80tXgG4eftjwPRtF8SIAMdsOlZ8145yjlrHYt0Wt9qDB1QYtJcaTWKO5eo1e1Lfazx95qnbDsGgkDC7krGBkcbTYUtHfNBBs1j9F+/mxTMId1altuCY6ztQvgwnKzbj9ECra4H0Ie9ia4ZiO0Tq2PLAhFTIBfAlPfstXyDiiO46APy3tDn41eWdrAgGS6TkFcr3l5P5kIzabau6QzmaCCEGMfCCmW00N/SRtlsG4nTtAy+pBk4Je3yty81aUnvBXddKTfiv8z3kvW9kXllxZz2/Cqw4bR5lQJ+lmdAF8IPHN6HUPNpi7NGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSsj6Xk2SemOzaITXoNyMVfKFYT4x3XywqNlCXbzK9k=;
 b=KKz1ftb52t4bZpp/3rgD1w1fyc6+pp76RCQd/QEjD6A+ERvKsAo7m5y5HbKKHb4zBWbNDp50DPf0bwD3dzFtQL6Qq0bL/yEGRfrr9ziGvVe8UEly2W5GloyxbWsUqRH2bPoAMQPqo2ZE1ODz0sCkNJV17QzNbfQOY3gFAIJ70dY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by VI1PR10MB3471.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 10:00:05 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:00:05 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Chen Qi <Qi.Chen@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] findutils: split into packages
Date: Mon, 17 Jun 2024 11:59:53 +0200
Message-ID: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.45.1.1.gfd858efe53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0130.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::35) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|VI1PR10MB3471:EE_
X-MS-Office365-Filtering-Correlation-Id: b2411e44-3a55-4c8b-8d42-08dc8eb4435d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|1800799021|366013|41320700010|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z1wpX3CViqzFvQWXg18k0VJ+FhmzN/hFGVynikoQtybAVTXvl33cHc5l+QcZ?=
 =?us-ascii?Q?mmNFmc9eDVD4xqRXPiyJvrLu018ab4Qo4vaUhNYvOEaTku+FAFOWYVL0rcw8?=
 =?us-ascii?Q?w4dizVGzxxl7vdXqGa5xw/YBUn1DkDhHvSmTiFRJqHfD2ceUE3ibzBTzCZko?=
 =?us-ascii?Q?GirFRvwO3jdbplcqh7/r9bGm/Z0ZPkd/9lOzUm1CezPMassLuEZdjT8ckdLb?=
 =?us-ascii?Q?NZAnWgHRRHD9Gqcc0xYyoyGranD3G43U7YiJWM9lti5Om6ZQdgy1UQBcIJ+Q?=
 =?us-ascii?Q?iL9nFq5QgA0hrgD7p28X2oURJthFFv6Q2iR/283Ekewo+SyIVb4KQ8+4/yEW?=
 =?us-ascii?Q?SnUskJ8DkeuatVCLsZrw01L/aP3PB53WZmpzpQHMfYu2+3ezPXdM3pt8Knwj?=
 =?us-ascii?Q?L4dqyQaW8yBQNoq6BxFbzD1973tT2C/Rli/IM40FqGrKqX+gGccGs8uAuX+0?=
 =?us-ascii?Q?kBkJk2OFB5Ah4QLORANHoDYXZHMQ/6fgTImSbPiPctT6SAhyeuGVmLmnVvhs?=
 =?us-ascii?Q?M0YG/LNrLGgNiJxaVMAMuKDD2ey2qxGBvEE3eRLkkby1kPtVqRF485+wZR9V?=
 =?us-ascii?Q?74RbM8V9C5w3aH8EbApXE6jPhuYdQsVIeHqIf7u2VDlPkMNeZ/z28tBYCpf6?=
 =?us-ascii?Q?504o99JJIEO2m2xC5FhMl+J0kK6SCqa2fRY4qz2aiHFz3orClTiE8py1Z+5D?=
 =?us-ascii?Q?hdxyJuzifcqftAgBdWD+15TfyXo5syb4P8KzMrgyoa21O4mPalwVcl3ZM2+4?=
 =?us-ascii?Q?bsLMEk0p2iA0MVSdxfGTp/qskY6ItbeJXrClQA9K5IrKxNz8gMxqG46nJrQ8?=
 =?us-ascii?Q?OMmyWjIhJiSr4a3tKg+ij25XRyxftCa3Ojh3iggR2VJBg+M5SBcxcNeIq9cd?=
 =?us-ascii?Q?awD549b1svxDt01dD2X9E1S624M6y5GEm0DHtfcM1tE05kzojxABSbEuR4vX?=
 =?us-ascii?Q?dJ85EfFx4+AbaKcr1dT4g0T2aM/Up2FzcUYSaLPSlW6oBgCFimNzxdvRD98E?=
 =?us-ascii?Q?biEHyDEsLpX6kD8r//fQD3QuLW0xA77oFx+0wv9qjE/B2GoXwoi/N7ataMpN?=
 =?us-ascii?Q?0D4JrHi5fXMDSY/CHIbmAhxkJXeLUZXNOlbseB5e9Hk71RSeicC0J26yMToG?=
 =?us-ascii?Q?gDuCRwG6d6NUmaQwI997NcekRSmv4kqWYYrf/bRT7gpOC1teB+D/QNjbeLtf?=
 =?us-ascii?Q?cREIeSVkNbgHKpN0jPrjw0LYlLmJIKaOD9RjR8cnVfaiDygRNK7j/d3qKRK6?=
 =?us-ascii?Q?zDRi0w0gJseFpUAALVpdaZC5amoRK8UIGfgDvL/ike+6Mm0HYeBX1DmUo0ie?=
 =?us-ascii?Q?3Mpd8OmvQwlusmbKbN2SPknJWi5I7tWHB9f8BzEwSIZjOqigj2Hinf2iTg7M?=
 =?us-ascii?Q?ahfo/CI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(1800799021)(366013)(41320700010)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1hYu4S+nKV7jiAlkSrCEHDdPofSr7aixhC/3ZqBLROq0OYV8ZiuetWGmeeXg?=
 =?us-ascii?Q?+S48grM0DHN02EP7p82h6jiDznJe5a3bAUsso8ZQ4ggBh0uWUbxABynAt+vI?=
 =?us-ascii?Q?IpBzNsRXmIJ7SElDVr1Dvxh0XPtIvj4m2hrLdJJzZC+mIAkpgUN0JN6AAj9k?=
 =?us-ascii?Q?sS22xpvwsFlODoVJ7s4D6LxmZrEltCAzZ65+QHwdSrGIiXwYr/Pd2z6g5PAj?=
 =?us-ascii?Q?ZW5S42yANUoF+joEIF1iFUQU66q+oV1FRlSoLD3dqD9nei7hfKV7FpRqoGop?=
 =?us-ascii?Q?jpKd7+Bu/QTbxpEfwrrGPNhR+vsLGjcfdFPjjPB42vI1Wrcj1tm4pWPukRAJ?=
 =?us-ascii?Q?/0STTuBgOTFrCMjLhs42g9pbNfg9cfxDstC9F9wVp2vs6jjfQ11AnPQc3MZ3?=
 =?us-ascii?Q?DBNYOxanRdPoYtD2HqMVTvTqOo3imnACrqw1G5fVpFyFG8oLjrVLLcyggJKh?=
 =?us-ascii?Q?AYAPmjH8kVAK29fQzf2MtcQitKWvA34t3v8f218TsGi+1nAh0whAf+UFdlj4?=
 =?us-ascii?Q?Lk+2VDNMGonBeGD0qvt4ARrt23wGmYXDt86Ex9E3vUTMDoEJ/aToTsu1/aja?=
 =?us-ascii?Q?+GuidrvvYsotDaxYYfLFQHwI0SIpi9Pr8uXBP4Hjf1ANJwW+aOQ/8GEw+ane?=
 =?us-ascii?Q?hewm4ET4gOuSVC55SfiPGLScs8D65W0qA7Qg/F6QwrDMiV3HL0tWwfDM9MmI?=
 =?us-ascii?Q?p2eBbbBiUCLRUWMQNjHHeEYFN+/Nm9xb+HcoaI9u94rG0rnSmD96Wpxd6a2r?=
 =?us-ascii?Q?SAxfmJqnJLydueOz+YynSDckFbpU72TIT7UR8bi30utjWOy3BqxV3a2WcZb2?=
 =?us-ascii?Q?CqvlcQJ4lcgZzatssOXhvebIG9ZfKUOhgDLqtZDBLNWyOxTEf8bUOLHSgjgs?=
 =?us-ascii?Q?R6CTXevFIb81QTKZGunOFVOAp0+E2TnIcGFlttVxcnXd1Pg3nYoVsIiy3F6f?=
 =?us-ascii?Q?nQzrz1zB8Do9dON6EiKzAZ3V4S4LM7JK3XFNHS9UaeQ9K+slFod9nRP5PIoT?=
 =?us-ascii?Q?9eo9NeIGbUd1jRKf5YHxoygUL5J6qRYzSGfT1R7G7qGN4SkD3QyXnoVO3+nM?=
 =?us-ascii?Q?8Hf15ZCfFcrZwqqXnrPlWB9Xd90bBWK+0iTYSklXtcOLVfeO7vHZBLDqhyLn?=
 =?us-ascii?Q?0NjwgsQVbMR5w9DJZTQpH9k5J+aitti/Y32iQYDANagyPy0vsRVQL3uNhAtA?=
 =?us-ascii?Q?dqCsfaLcS8vVONrUTyFzFK2WPUKBuBJ/FfWktOcib/uhOtKpyMuG4SSJoC69?=
 =?us-ascii?Q?F/svV6V92DGO8pcwxOShgbFcLK4A9iaslcWNRcZB4Za6fcxhTByMFNXT2rVO?=
 =?us-ascii?Q?HoSggBGcdswB2R1/KBL3oQGooGFdz0jBIt793GHW8tyrZSZSbHfY9Se2q4/O?=
 =?us-ascii?Q?WlhwtSIwMZL/PqrtXEzqgWrmWSZXdlbrNuGBLtllrO/6zVHdkz4RvaF3e0Pw?=
 =?us-ascii?Q?4VjhjrtAVbtJg/IUf2QhFpB359ThCQW2HePHTZN+5el2U8J8BtFVJJEClFMW?=
 =?us-ascii?Q?n2llZsjmAE8h81YxkOrJQL+/Is23ykCS9ZFWEktb+VJZJiTM6Gh9oCKWzJxy?=
 =?us-ascii?Q?u1lNd3rKR2lY3GEAR/dOOMgCawVi9emgSA+oPQnzyoW5E9l2k9QIzakXSLI4?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b2411e44-3a55-4c8b-8d42-08dc8eb4435d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:00:05.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4C8TSVixn/Pr83EXp23NraMlumZjNTCh/KY5/WcO4F47X3vluShHDcv45l+lpjm1sKpzTPxv4SApiGpsrOiMVWjM+fuw2/wmYWvy/rBLbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 10:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200803

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

It can be useful to have find and/or xargs by themselves without
pulling in locate and its associated binaries updatedb and frcode. In
my case, I just need xargs in an initramfs, which is a 42K binary; the
other binaries add over 300K of dead weight.

So split the recipe into -xargs, -find and -locate packages making it
possible to RDEPEND on just, say, findutils-xargs.

For backwards compatibility, make ${PN} pull in all the new packages.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-extended/findutils/findutils.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-e=
xtended/findutils/findutils.inc
index ddcc05750b..9c8296a9d6 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -12,7 +12,16 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
=20
 inherit autotools gettext texinfo update-alternatives ptest
=20
-ALTERNATIVE:${PN} =3D "find xargs"
+PACKAGES =3D+ "${PN}-find ${PN}-xargs ${PN}-locate"
+
+FILES:${PN}-find =3D "${bindir}/find"
+FILES:${PN}-xargs =3D "${bindir}/xargs"
+FILES:${PN}-locate =3D "${bindir}/locate ${bindir}/updatedb ${libexecdir}/=
frcode ${localstatedir}"
+
+ALTERNATIVE:${PN}-find =3D "find"
+ALTERNATIVE:${PN}-xargs =3D "xargs"
 ALTERNATIVE_PRIORITY =3D "100"
=20
+RDEPENDS:${PN} +=3D "${PN}-find ${PN}-xargs ${PN}-locate"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.45.1.1.gfd858efe53


