Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B5DC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:35:16 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web10.7170.1717072512723736758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 05:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=eHWvP6IQ;
 spf=pass (domain: prevas.dk, ip: 40.107.6.88, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhyLBmz7vq/rO8qEbg4cqszi7ePrzaaxyrV9R7GmKThCXCwTqCLdXWs+ZoLxQcKnmNGh4fPAap/vrjRKinn8BLyoBjmloZvtjY2bAaX+AQR8CdenY2aIE4lQJi7LTbxUvrPQUWvnZdfcrHzPvqqiTR4QUQs9Xaysl+vHWmrNmUFcM/QaI+kyXdkJsQKrUQVFu9BFrPKPctWPDPIICW2j42ckEbOmM/dgHY3Y1wl6HmZzeAVXZ5bdLUWXDQIsQMivmmIvDrHSc0c3CqeETMzdb5lquwdLGbAQbC5My4f25ViYogSomhGv7GdzL6W7fe3Trxv6SorjDM300CavkkDmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS+m+/2Ds4YDVVVjWBwK2+8BhYs3hsWR214kxfIXTXY=;
 b=fN+t8m8AXvH0V27cOE6CIPwarwMk2MMPzgGx4EDigavZGj9iobRYDeQ4s3lKiGW7DJ4LEhtbTnYmcyAXG4KkLtIsIK+PSyoqS62saWlzdyIM4NZHsBazVQwPMOYHpau/VAnBMVdM2lgSWBjrYTBfC2mTAoYzc7uXG+4PkgLVJP0gj9GuZJp74JHF+mrwgPfSUMNNk2QmdfCTtf7IMHth+a5qk//yPcoCMakaeI0PmLmQpRPZMzBbd9Nt5JT0nG0TjcVDc35nsKZYkZOYbb8YNZv42FNBryr8rU3NnveqAQ7JcrShug0PoctRJPyBp07EaWcr1OqM7k2hvQDS4OBolA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS+m+/2Ds4YDVVVjWBwK2+8BhYs3hsWR214kxfIXTXY=;
 b=eHWvP6IQJQ1xCsYkXbAIr6OUG4nYaJ7mvrzsHPMSc3Q6QSJz6MfgCkta5vtaQTrzaTJHm4MHt4ohGRf56IFjpjrISmJ+4BjZbRMFO+z9/VJ4DUtAkXSvQkyLXDPt628QGtdAfjYdG5+rAxjRAwIqo1cpAzRdJmlbp0NVQBrQy4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS8PR10MB6024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 12:35:09 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 12:35:09 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Steve Sakoman <steve@sakoman.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] git: set --with-gitconfig=/etc/gitconfig for -native builds
Date: Thu, 30 May 2024 14:34:58 +0200
Message-ID: <20240530123458.43196-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.45.1.1.gfd858efe53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0095.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::13) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS8PR10MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d442886-a116-4ff8-6ab5-08dc80a4f15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BUtnYNsxe7DeJrzTWs7IAAtiOaYn+B1pthjeSUtVKTiDah2pVGB3clqH0Jzq?=
 =?us-ascii?Q?ep6bdEEdNXGn08iZ4OKvee/g7eZc3ij+YEMK9GlACy3tBscDgs7jIMlwABND?=
 =?us-ascii?Q?tZ1BrYwGP3TzzrMidGBwrfbP+C2XMVEeh6S+YC9hzyLFUpNosVmJqDojc0tZ?=
 =?us-ascii?Q?sMPUEZg5NTIDCa/mHrCK060sLgCse+enkKpkSjpkpnsEa0HlNNH6bRPNZkEw?=
 =?us-ascii?Q?BopnzvgicopD21FHrfHFzewbyiaZC3XtzMbAk+7GuzBk2PrjM8Js3II4Rc9p?=
 =?us-ascii?Q?MLR30nG0FSqetYg2Q34GiT9SQvuAUt9PkuoDRmidRKZ5Ix+FSmIXYrQJqz1X?=
 =?us-ascii?Q?CZP1eesi+RWjKcb+BqnypF0rPVmAaXeoFrDemWbhdlw0dXJ55Q6Nme0C3b6u?=
 =?us-ascii?Q?04jWMz5bS9WDfP/rhjEg1S0wGvSFWrxxie9vUrDEqM6+LiuimYm5/iuYnRFb?=
 =?us-ascii?Q?/0DZEsnV7vtqvVaYSiTwdG5EAPpueTp3RFitNjoJ1MHAzthIxKLgLNf6gxAZ?=
 =?us-ascii?Q?fbsX2hy85KuxViTkuF9Ynz3Mn1i5lfkgXzGbJ2hAHEw5jqaJlF8bGizMupvz?=
 =?us-ascii?Q?oWYTbjqTvoivkw0DWF1bZ8o1MqVKx1q9ZjP8PQNSp86avGGQrOBnv232UnUb?=
 =?us-ascii?Q?m9gGmivPhHTgNz4nAJwcvj9P+QBgmQmhIkhy+M4xkIO8indTH4zK81J8nwzD?=
 =?us-ascii?Q?K16RXPevT5xnEbn8hAfstE1rj8mfBPJpA6jKZZPwQVbY+xRQf9OoJ46LXG3T?=
 =?us-ascii?Q?to7J6/ayoyE+1S9arI50D4eylcyVQpnUNJ+BN3XNzJOzrQyT7F/DV161cOAw?=
 =?us-ascii?Q?mH057Xo/EehmPyUMZRq7QRkIMrR8sgwLmDSJePcHKMBSCb6nE5ttePXNSG1z?=
 =?us-ascii?Q?8TRYNDEMJ5pj1bszTlxsuU+eQT3e94/rt1gRlEYGAnWNZrMMQR9Bd2ua8TzU?=
 =?us-ascii?Q?OunOM6EzSK3z8G2vWv3/UTwqFwA43CcWoq8px5Rfx6kDEejg3waWKwlcYPwe?=
 =?us-ascii?Q?lMX8ZuqZDpfw3fwJWsiAFDOzDxBbORx5emNBzysv4A9LjQSpQhWA3PtzGS8+?=
 =?us-ascii?Q?ldIjvv2fDU5bYGPr4lKbU+dBWOPA1m+vMsvO4WkZW+wmS/NZ2YqlTT9WDrtb?=
 =?us-ascii?Q?wYu/+0boyFtom2AfVY9jd2mZTOHWeb3CTY9e3PtoPUn7welDhhsW7+f5ddHY?=
 =?us-ascii?Q?pvAlN0IV9hO41fbLFCG+MgNmCDRgiaFtmBTyia2S0IMwvn8iRUfP1kYdLHsC?=
 =?us-ascii?Q?HHTbD6rTNfMzCF8nSS0J2VSA2M6lBtR2QlwhskgT8nE6/QbH2NP+IRF7JxbF?=
 =?us-ascii?Q?8pIXtVd1Cl4dY1o5uI1EX651Q/vlIlaecz5TD5bo0xccWQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PfMqWNMId1k593+eVYIziXb7RqKGnXWEQ8RTBLrUleY0IY36ImjDtmyvYqWs?=
 =?us-ascii?Q?ajavKrxFVeLzEvWwoTbHZfoMGH/bFNzMJJH934mXiTp73jWUgedw0txSZb/x?=
 =?us-ascii?Q?0UALShdFS0v6Fj11OhTcvgOLbtMEHurRMeEfGF4bUzudkbY0INUEIlR+LBja?=
 =?us-ascii?Q?g0raZ3t4R93FNuKgCb3RS+VQHIN9MLXdWOzyFqIrXMjjxfOKSr7yTHqMunvF?=
 =?us-ascii?Q?xr38q96DRJ8WHYK9yF62i6B4v48x/hN0fWO20A9JN/wASWzXwhXhBZCcfiwl?=
 =?us-ascii?Q?N+rw9uk2ruDNE5UoXN1qxjGJmvkVCnTTHMjfGvB1BKc0ciNuVXBEKEwG/OQx?=
 =?us-ascii?Q?G2U/cs/N5cantZrt8q6YdRkrwowkQILkX5CAKlEtGP5Cqk0Zt2/NuvWsQ+Td?=
 =?us-ascii?Q?C/uwbnJ/vC/1KKLQ5GirexfkXoWBXJIu6HRtKB7KucC8w4TaEeW5MBj0Mej/?=
 =?us-ascii?Q?Apy610zlDttL77WJK7ErYNJcSCCk+ozFHOZKQ4BbOQWV2YZgkSphXfiqMz8s?=
 =?us-ascii?Q?f22HLhvVvlfRB7Gv4irYu9mYaUciNDzeyUX54m2P67J7tgfAdgwSkeeNoHML?=
 =?us-ascii?Q?2FeJk6U6kxIk8FY/3EyrmyKhtttikAsaBYMsndMA+Qc8tlZGdNrcIGvvlRHi?=
 =?us-ascii?Q?p7RF5P0fSShVI3EWgfxO7Bp3WhJXogGSIpViYmDcfpc41iwVhwnA3+vT5gU5?=
 =?us-ascii?Q?0Udvu98pxabaKOl1Qmuq1IdZIvPZY5vFoCboJWGeYagXz+HlBtOVf/c1mAoG?=
 =?us-ascii?Q?nKnvlhTsu9td2vHLXGjjq/mEtBuTHCSS3pDLTn6KfpdjfLE+n8fQjEd19SfP?=
 =?us-ascii?Q?onI4JuEmaGBIInzwXkHA6AuIlTWgXCXidxTz4onbg7Gl8cOi7khleJkLrUJe?=
 =?us-ascii?Q?aSZswemVj/Ol633yztoxDgo82Bu+aXFVLkeO6aRUTxXu9yngQ3CT6OrQQzEW?=
 =?us-ascii?Q?NRYOFYSZTp14GELka+DACwreHObLFatn41rKhkc6GOi3qJsy8KNKSNXvzd+V?=
 =?us-ascii?Q?VTg6yQMOly1Ov+NKScnZRAeBamYaHfKpwneZQXAykCIrpycyKactWjEsDy92?=
 =?us-ascii?Q?jB+ywpijZE2XjCh9M4NxnMmFdAcGX6qoJlAXirrg+c1NLJBRj7Ok7ZBXYZqD?=
 =?us-ascii?Q?V3aHFtvCN05YSS/WeEz1V4XdwQVDvciFmZjTnZO9llv+ot7enyA9Vk3ps5Hb?=
 =?us-ascii?Q?nQz8zD5wHBIneMbYg5Qr8KSIBQurDKUtEc4CRuFT9aL/Y8uoS0pjLZZBPZy5?=
 =?us-ascii?Q?og27mFbQ7Bi4f//2nfCXQp9nrBhbLsMoQrLy4AtYzWMrGAPw40B8g2oaxx7N?=
 =?us-ascii?Q?41XKuhNcleAha8NbkU0t6tl4DbpjovBXo+ELos45dVh+tB1j7WKb/5ClUNZD?=
 =?us-ascii?Q?toTiyOLZrLjZMK5pWkfQ3F7w5TDek1ZfGsSnRVpmt/x4QISBf7XenUx/I/wg?=
 =?us-ascii?Q?20a91zLf2sCap1FurVRNLMp931wzvJilRJ6do0ai1rjX/QA9DncKwG92BWf6?=
 =?us-ascii?Q?rJ86h5pyAdRqxRLe/b/f9lUQEJObXbd8n1wYFz5JvxO97Rof+SxTZXqiRc4H?=
 =?us-ascii?Q?5LOiTuExLvFrhwvK/bczG2wYFQQShWMgu+enqi5uI2X0qhjf7y5jkpk5d44L?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d442886-a116-4ff8-6ab5-08dc80a4f15f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 12:35:09.3595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iPYyq8NhQCzB3VTUSjRWY+dTgBtGvj9UmckpVkE2wCS1YU3C5NTSszqfBXp6AsPiLm+PfsCQu0KbZol7ZlBg1C5hIDFtchN7irh5Xzeeig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 12:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200021

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 572f511f7ff02fb559ac42d2d5dbd09fec478d97)
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
2.45.1.1.gfd858efe53


