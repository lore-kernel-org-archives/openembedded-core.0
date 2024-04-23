Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8920AC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 09:57:41 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.50])
 by mx.groups.io with SMTP id smtpd.web10.14731.1713866240474094336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 02:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=NJrzATmd;
 spf=pass (domain: prevas.dk, ip: 40.107.241.50, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yuzg20Uoh+M6rwodK79i/97mM7j+sy3yZUG/+XdWDfJ+gLjRkhgXu0f1+SIZFcsCHoQ/cVLSU0zrM0J7qld7dGIfJ/a84WK1MYoSjmooF4/LJql0dOxXgkXmUvncRYaGf8//ejh3Ax4xSuaezyywRIP6Cof3Odt5HqqCNS+zInX2zxFepdlzgclmx8nK+GZrrIfPsu0bgf8LndE63d92PN8H6FRZnzmIs0yTKp92cq4Pp5j+M4eeAt+7g/LU0insqmxfrMgoJj0uYk1+2x5/l4tCtsbHD0+qbwxhJWi1ZU3GywwdUDq07ObPPFa1SAH+d8pyD63EEp+kZ3TwvCKVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIwLha9ytFOiyxC8p5f6W3y+oK9CEaubSv1YhWZtAHg=;
 b=gOIr3d2kmTocCUw9N1f7IAnX8YviNN5wV+wFo7kpOJ6S4cMdZBfJE6vdBAagNcjZl4DMH1WpVCUNOHiRZsfOh3hmNsmfC0SMuAYqiWMW9UKcRnGRkhMdW/li8fHdFzsED25iappGnI/ZezaaQwv8YpJkZaQdAjyEU4R8SREkA8RjzaitRbFyoNqlKoP9mH65BBv5fuKJEjUVUc4rSwZCs9CbenAoMG2GQINlnBCfdtwJveRdkcyinMvIhchovB4ryAfQTJ+ylEkReAHLlJZ5FBrTRoCnYq7ZJ1Xp+UwYFxZLUipwuZYaLBSEHeaniK8eT+xnbIHHnMdsl2cyYShzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIwLha9ytFOiyxC8p5f6W3y+oK9CEaubSv1YhWZtAHg=;
 b=NJrzATmdYenw68KuWD66hI87+4UAV82DX7vmAyShlNZ/FjJAoAMmS4s0Eb1jQMfwaFD0uX1PdOjxwc6F+Z7/G2pFjPVrSWUfqu7p0di3lc6M7WX6RHQsdmdKH4hJW3j54nALVmbst/0xudm4F2vlWDBu0wqwuJa+WkTEk5+Q7xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS8PR10MB7184.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 09:57:15 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 09:57:13 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Robert Yang <liezhi.yang@windriver.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] git: set --with-gitconfig=/etc/gitconfig for -native builds
Date: Tue, 23 Apr 2024 11:57:02 +0200
Message-ID: <20240423095702.512844-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0025.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::16) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS8PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acacbd5-cbdd-41f2-7f37-08dc637bbffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OHrwsfFcVYRdS1eEN6poDbndh/0iM3PCnqwB46pWdlNh6o11vDr1X2IMY2Qd?=
 =?us-ascii?Q?k6ZU9UKKxkxfsnlcIz/sj3sJGyuyRjSOLGPGARtpnYL/v+KhG4uAWkeCxLjO?=
 =?us-ascii?Q?+TY0JdCiOveuhCjiEqannvev3KDVlvJieoHj+VIe3IRxsPUNr4drHu7VOPek?=
 =?us-ascii?Q?jGiitz99/iSM2/0Mje5VdbmZm9JDeTn4hK7QnWOPJvT++b2pn9Xi0NEH9fhi?=
 =?us-ascii?Q?vJr2ygvmZGjkw6dTK6+4pMsnnk84UF2Y2w+Fl7cZxerO1O9XpCMWCR1iOS3F?=
 =?us-ascii?Q?w79jTGQ1ShfjJ1anNDTijJ/tsyJVIkLoWqvk7D9kBBSAzbqSLJk2ij6KDX2C?=
 =?us-ascii?Q?J7tp1B6w8CaznLP5BHoXd0+vp2b/Q2GJiAeWdk0djI9P0Kg+AyF9WIZImtC7?=
 =?us-ascii?Q?3keEd5cSMMefuwk7tUrOAnLDkquc8s1URtHi9owFIYROxv+Y9oHp6cOlGdbo?=
 =?us-ascii?Q?Q77uB+fo3V+0cpqwRdj7jpzlzm8FBUSKyHnSEy0yO+EsA6GnbmOwUiWn96/p?=
 =?us-ascii?Q?OISGM+/DJFB28mQDNPR1+r8KXPBywQzDcUdVIlhsxHmeJ7Lgq9SmGrqiZfyI?=
 =?us-ascii?Q?SuLIt1LLGRFYByVedOBi1otoEPo2hvfRJ1HWiph7anAWOtHmRczW50Rjz3Zd?=
 =?us-ascii?Q?A1SznfjXG4MGFjNmdoyR9mGuTLCgPcnEem6+uJ/eg3uuppRzZ0yZFR8pEmZn?=
 =?us-ascii?Q?dDwA/CCdj26aXTe4JRrf9FSFdbWKTeAn4UOlzo7/uFnmPWOtRmzl+j3IZRDh?=
 =?us-ascii?Q?g7p7ZS278t79j0lPiTX/tLGVu8icf3EzP/st/j7skrVo4J5BcWEOlRA2ibU9?=
 =?us-ascii?Q?aJf3ElGRWCTalfaYD5dGPG7sCETHxlAlF1pJOrtDWexPl3qaozjTXaPZ558g?=
 =?us-ascii?Q?RAJpxy95GfjP1jt+Gz2F6cTOVjomCcLk5glX7/vgyeIxJJYMAl8Pd2X4eMON?=
 =?us-ascii?Q?OK4oRAy1YQi09JXT645zGrEp8K+StUv595418OlIC8RjU26Nh1MwK7Khwyfn?=
 =?us-ascii?Q?Enbimb5Ep9929zSTmM++13Oy2cG/XP5BfbuZj/fx7sqVRMMQVQObDjgS2tXu?=
 =?us-ascii?Q?r/DflXuvATPVe1km7iG2wEt7Qe+V+IIPYZDxxuqkRLqvhW+cYJVBz4ppITD8?=
 =?us-ascii?Q?clfW3aN2QJoEjeuoN63+2nG3RVedUAWFVWDAk63/yUiDNV1tmta5HOWWDaXf?=
 =?us-ascii?Q?pEvZvVmxZCUvyCABvdQQebIf9e31tcm2y6U0U45ez2p0pg+SF5cQzGbwrI+g?=
 =?us-ascii?Q?yaT5C4HUOF+fqbngEodXKzA7JOFYvf47aFsl+MVIchDON6IfiW/7X226RvPv?=
 =?us-ascii?Q?H2IzD/O2POmVDd1jDkk5iImTzvw9AA8/S3Ua0JmNgucuog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1cEw4gcx70oUrqi8sevIJOvA7D+td3CkPKnCTZS9LTom58BjpRLCH3oNn3uf?=
 =?us-ascii?Q?DIrCjm0/rVRGPSWWBa5CGS0J0SeA+qh/yLgjphW1jsEn67v28BX2CRqmeVgr?=
 =?us-ascii?Q?zkiBHyx0b9hQUbp/Ml2I5xqeto8J/AYEhdAuU6ds2AL2yNtPa/Q2EE9kiNys?=
 =?us-ascii?Q?dua+AeiXyt307fDVLNjOiRcaNvmJ6GE/beBKeIlWVbC6pcSxcMNs3G0UgP9v?=
 =?us-ascii?Q?+nfvI5YdNyQ+ds/KHCCWAuVroLMHfm3RU7TMs/oXntYYHM5bArfrU3XS2KJX?=
 =?us-ascii?Q?qSWcnkOpjULMmLyR1hiEXCBPkbB5R0AngJ7Bjn1ArnlkV3FRkZn70in2K2HU?=
 =?us-ascii?Q?LBjWSo6Blb8HIwO0YHTWSmoa3XSzmK7tJ+8MwnH2Z8hRnFJAgqTxQwM3zv1Z?=
 =?us-ascii?Q?DB6Uw+ONHEBeXDOFBVZ3Iio+0WV4gc00SumjcQGgJYJDmbMmc8fnvZQQScVF?=
 =?us-ascii?Q?l7peqNNJqXHmHsONmc65+3479Cwq5lSbBBuz6G2SA/47ZSDUreMoobpHKpmQ?=
 =?us-ascii?Q?ebkR1ORjfFihmkIqLxJX7itlSQ8+AyVb8dPBtk7u5QUJA11IGs5fahndwFy2?=
 =?us-ascii?Q?E2zlE9q/vdZq21KiFLer9O7/TI6iHoEQXmdcWwAT9xbhn9gP1pQht7QEJd0q?=
 =?us-ascii?Q?BFbWVXKzr1WWSto5P6ZOYJ3KyRkHQ20pyZIrGb83E8r6km14EjvUh+r4vsfz?=
 =?us-ascii?Q?rfMsDXdPw1Pe9QdInC4p4WWnuv8iqludMxymAodjQ/F3YS/L10L+ZlRax1+b?=
 =?us-ascii?Q?Olqt0dDPKCkFH9nVytgDxW4CMyu3v7Z6zkQ5/bibqD9zKIJp3Z83A/JYrRFu?=
 =?us-ascii?Q?2/gnEEP/MZIPuI0v+ul6v5XdNfBCJMnA14hS+wMoRYXj6w+xHW0xonfHXII+?=
 =?us-ascii?Q?zbVvedpK0Z72IAtQgZu75lvFzsXO/UZ4h1n5zffo7ZmFoc3BqYXA1GsdZb58?=
 =?us-ascii?Q?5T/7uzOpLX3LEGzD/6Tt/XQ4p0XHIvHaYWNqNkHYcnET9q/V0GhTJfXaj+Ev?=
 =?us-ascii?Q?WKW0z/XQ3OBfW08hAZ9/ycCbDuggboKv6bYlz0jqEklXo00QqpGRNM6aq7Uc?=
 =?us-ascii?Q?gf2712G3+iyHR7by1OSdVBrvoi/oaOvZeqZ8a1Sn3Utlb/5ooj/87ZLIB280?=
 =?us-ascii?Q?yGJY7HKwvsJAE8c7eOd0Hozm6YFAmsPEQZoHJCZDoLEh24D5FBxFrbEpXSnk?=
 =?us-ascii?Q?PkT/RtEsh07kZokADOeUlahqfP3QnvHXk2r7D9yEeVzqiVjMeYPwvyrI3iDP?=
 =?us-ascii?Q?Kt0Vk/FLbzMUfOBnFXlbwj3W9oFHO13tmgbR6Qe8Gvzzd39sSOjhQcgY/u50?=
 =?us-ascii?Q?Bdh+CLU5zHD6dEif16BvyDPVjqCR4lMZNopMacV3E/k2XprkvnKJj3AlUghl?=
 =?us-ascii?Q?XxAC6CL3hoUNckJdQHTU8XNj88RZq2pNLeEoA3dRlkUR14Vu0nwyjNQP2eJ8?=
 =?us-ascii?Q?z9vVe9nAvXpSoZp1Eml1vqy8sp4PaRf2mqptUVVwi3JZuDNw+bqz3Ii0/rMd?=
 =?us-ascii?Q?HbMV4NLr+xnDF7jiofVCb029WwI4pvQ1cvIvhMwr33oWeW61Fk+jQth5iduS?=
 =?us-ascii?Q?WACPHBfi9AXiEEl1psG9ah0yfZrTQlu8kAhLRpjlui9d7SyZtxHDvPIaX5zc?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acacbd5-cbdd-41f2-7f37-08dc637bbffc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 09:57:13.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dgsnYCSvzorq9rnJYgPnmTWwcz0TZDjTt+jeNP1aaIUQjovQFhKs11nUfbXy/olpQxL7WrEKQDYhJR/jBuqU37JGpTudqpZja9Dh7kR4dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 09:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198611

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Commit 6c2ae2346db0 (kern-tools: depend on git-replacement-native)
broke our kernel builds. For saving space and time, we have a DL_DIR
shared between multiple users/buildbots, not all of which run with the
same uid (and with appropriate sticky bits set so that files
downloaded by one user become owned by a common group and are readable
by others). This works fine also for git sources because the docker
images we use all have a /etc/gitconfig with

  [safe]
    directory =3D *

But with the mentioned commit, the host's git is no longer used for
do_unpack (nor for do_fetch if re-building and sysroot has already
been populated by a previous build), causing spurious "fatal: detected
dubious ownership..." failures.

Currently, the path where the git-native binary searches for system
gitconfig is the sysroot from it was built, which obviously doesn't
contain a /etc/gitconfig. As for the nativesdk variant, respect the
host's /etc/gitconfig if present.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-devtools/git/git_2.44.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtool=
s/git/git_2.44.0.bb
index 90e555eba7..78b00dd19f 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF =3D "--with-perl=3D${STAGING_BINDIR_NATIVE}/=
perl-native/perl \
 		--without-iconv \
 "
 EXTRA_OECONF:append:class-nativesdk =3D " --with-gitconfig=3D/etc/gitconfi=
g "
+EXTRA_OECONF:append:class-native =3D " --with-gitconfig=3D/etc/gitconfig "
=20
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion manpages
--=20
2.40.1.1.g1c60b9335d


