Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD1DCD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 19:33:29 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.102])
 by mx.groups.io with SMTP id smtpd.web11.20898.1712172804501581081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 12:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Kv9kwLXH;
 spf=pass (domain: ni.com, ip: 40.107.94.102, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kic/MYPGMsA51x/q8OufSBEzqWwt0chy2CKDghmTJPG544z19i+3HIB/7akmYzQdgM2Ksc6/9tgdLYsd8wjGIxA4Uv0i+4NoQesht9WkINYiUKh/G5MSRw6k7V47ZFLTus3rLq1DUSgYy5Yibwbg9zzYBh6gytAdgyUg1viQeMuU8orwDm/VIKp10zsjQSEE+wV3orO8f+FNBPQNAf/4/PvHOVw8UMTGCAe5fbUAtcvGf4kRAIPOyCNGM/tTAtfcqOuW3djricIK8Vs8Yiek2+MN3pu/+J+AynwYWwq2q14PgNxkrYRvoeRXHzEyHw22mtmgPdAoLsuvtXtVr2DK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgZ54Od+9EeyTfSP60MU50oCckdE+qWETvsdYLMgCbA=;
 b=XPw/tGw92D2zfeoX9A/S3wz5FsKs8ZYzFHzHGiRhlKKplsYkLUbCrgLamTvz8S8IF4gzx+7Zfw3WMTUsOja/hXT9fYqV3JLFikq+JmeEuFN7vTA/iehPPWDtVTLywpYGPY9T7NSkeHWfQBbBYszq7B0Mfwuf0Gzd7KUelGW87I8BRvBxh1RZjAkS6byrB3MzYsTvXgFBuXAzdC7mBOQauQ3gpZonBYeBSZ1UggYSp9b1vSeaJiuNz4RPcnGVw8a71kYriiykcp7Dv8ddhLz0R7THg/h73ucFx3ie2nvqC/iUeSPHLbpsLswgvUneXTxP01VQo+qvIK35H5R72PTAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgZ54Od+9EeyTfSP60MU50oCckdE+qWETvsdYLMgCbA=;
 b=Kv9kwLXHcyuHMb1xCKr8lHXRUiFJqLqCCvqvtXIgAJALg2F9pTQKGKONucXu+9HIkDoL1JOSHdvqi/+PJqH5hGLNj5n1tz74xqnQorPLQgV14bRpAn0HRjVP2v5LidkPvxVFyd4Vk30xyTkY5rYEsoSddyeBf7/t77Qmay49qkk=
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by SA2PR04MB7692.namprd04.prod.outlook.com (2603:10b6:806:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 19:33:22 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::b7bb:be37:fcd1:4440]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::b7bb:be37:fcd1:4440%7]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 19:33:22 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][kirkstone][PATCH 0/1] Ignore CVE-2023-47100
Date: Wed,  3 Apr 2024 15:32:03 -0400
Message-ID: <20240403193216.971802-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: QR0P297CA0018.MEXP297.PROD.OUTLOOK.COM
 (2603:10b6:3d0:16::15) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|SA2PR04MB7692:EE_
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mYyqW11lAE+3vhCNwmvMYoF+lO4eJhL9SU9CzkzeAj1Wm64i9+ABiXQ/vNjzUlDnIur//LIDEPmtpj+jkLB9wO8eLj+3RAOVZC7JRC6CNrJwiz+9BVIxMDmRoEzYlom3Q2EXD2a8u91fq4lwssbFa4uxhlrfYvPRZFmpl3lCrwNtFDOD8mpNhxNTfhLtwgu24OE1xM+GEwPZKgeaZ2T+AKa4OY6w3rjXPorUQI0zaUJkZfBjFheXnMb8QRp/QSZQw0jh1PIKIg0sd61WfExBGIFX+dVHtLkY/TBnoF4cHRpPUI8GTAoc6dZyRVhKGxyrMGUNxobtBJJwsnK2RUDHX20kJoSCvcRxA063ciUfugfWRvElcFJelKLUO5M69UlbVttiDxyqLlx4QoGbMCf8y8ccjpnT8uHDBV5mV54CjNT1TUWRvS3aiX1Y8DCCDjC6vdTwORZiwZky3bMF2gdB0ML43iClH/Kdifg0ghrimezMLKtUfFNFnbewO4S8e95mhwID6h8ZFVLQa+LYCtSNqkM+OHNyGesd0psCs/zqZtg/EVRs3es6cHJrxH00OggF/ojyw/PrYcjex/1jlJgxXJkBNoH16q/zTWqh4bnHp5Q8rRZve++3UCs3zY6QO/LBMKoDUYJDhzaX+AHuu0RgGJWYv2sn5wCM44lJ6cNwAMI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JD3A9Sm5uFTvFO22tmHD4Gn+jxKQq+Oyx1vYgGNmJ7l/ht+ddgIjmvhASt0W?=
 =?us-ascii?Q?idoyMQu+v6tIm0JyBass5T1eM2uY1hHreJi2SB9VYFV1XAKPsPkJR7mQB8W/?=
 =?us-ascii?Q?42hsj+/caSCjbN+LMyBylmM2i0/eqBq2zn5eh0zCVLb8e+rFZDO1sxehawb4?=
 =?us-ascii?Q?socoIjj5jNoBhrnamMhg0dPG3GChva03bQi8kw8+J1GgW3iBTnXoCBF7NbbF?=
 =?us-ascii?Q?L0rlpYuRVPK7mPR9Lkc8XLGe4DqcD//DPEMePaPvouSSIEYaqnMiUXTnADqr?=
 =?us-ascii?Q?Jl8uZvJX3+vdk+KeS2YyVIFe6AY4gyP+HlyRElUXyX0MIdBqLPNYaMoJrkCe?=
 =?us-ascii?Q?7RXQDBx+BVDaLKMC2NdOhSHol0lXjC2OlFumL/EEmhjkwWDWtG9X6GZYg3HV?=
 =?us-ascii?Q?6TK6Ll6N6kiOOccrYeOD1r4Qb92g/6MzqFXMD9H3NC4yHyZ3joGVrsSY2j7B?=
 =?us-ascii?Q?3+Qzz8yptm8tpSbz7APP5rlJMSfztADy33zZ1WHPgZ/mAHUiXlpwZHKwScnB?=
 =?us-ascii?Q?qHvT5GA1cYtlZlyVRDcp+5y/UrlAqImrwP8eafC9sFftTMtw15wTD9JeEBW9?=
 =?us-ascii?Q?pk2/H8D+AAQiAOP/tC3lxKc1MLTUozOiF8noxtFNl9EQUuArhZ4r3a8ZGd8y?=
 =?us-ascii?Q?3H7ZrIVUCJT1jUcAbtS6X9pqdIfkEQ5AZCR97z8M9BxK4KqbLFzNiHaOqVIF?=
 =?us-ascii?Q?yXhFPukPUDOenz8tH6UBnhjTTwja7afPOCdlDEekmHO7VCwES9VUelzc0d+g?=
 =?us-ascii?Q?J554CUs0geIIPun46fVvqUcT5HdjfgY4lP1AvWf3OZlq4GghPh5vFSI6usCS?=
 =?us-ascii?Q?XB+/ED3E0JFWlWTVCfqxxPO/0ZEft2DNwSG28oBbT4sWg0DL2AltfV/fG1y4?=
 =?us-ascii?Q?fns1+R4j8yCkbFT9Owd6fVGny2Nrke5R6HEalXKmqrF2f+61EBGKfN10CSzT?=
 =?us-ascii?Q?DOjXENBxpcdPcw3y/J/+CmDD0CANo9zEK15wUuOY1DtnveJI6YbxeF2pMxlz?=
 =?us-ascii?Q?i7mjq136FzKeOKzLrSnL/32w3i5QUGUEfgoPkMo6pXRObYvEnfTh57j+wIGY?=
 =?us-ascii?Q?YOf2Wnu49DDH9ht2XjFLT+keSBz0UleeOO+FvYUcX1KYKmU+m3qn4EYZGn/E?=
 =?us-ascii?Q?1e2c+hzsAcGAzc7DEkYEbUijmok8M1C4TDMq3GhOz6t3XroxYgO55VjxdTwo?=
 =?us-ascii?Q?/Q91LADTmPJnfZpJ6+/D0QBJ2qR/nrNbq1pmLyOrInZu5ENSxdyNCLq1G6vd?=
 =?us-ascii?Q?/wVRwNP/JUbbP2+YvzMQ8/ytxGSfzAd2vomVrjxbXjRUVOaxe2YNTnt3ShyU?=
 =?us-ascii?Q?vg5Sti7N9iDk5RsW3Q/NIfcyGBVy1kY6VEAxoHeqeTXlOff6CiZ/VGtEOMIx?=
 =?us-ascii?Q?+ddL9aZ011l+vhA7VIXcQ/npotLNqiPol0dISt2474UBmop1pEbLxW4RG/P2?=
 =?us-ascii?Q?Le9fi1T+iG4PtPDhgmlc2KFKRdccujiHt1t1Wq8q/0sZ1+Lt2BGLQab7Fib7?=
 =?us-ascii?Q?e/BMZlcb6fmgIXqg/crkBtFzOonAkKj45nX+V0JoRflZhhPXUnFDUbFmzq3U?=
 =?us-ascii?Q?ls+r30Bz+uBdlIXpa8Q05ylC27ArYyNvQ8hB5miD?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f84caf5-537f-4b6a-ba4e-08dc5414ec5d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 19:33:22.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSFRCIIww5IvpDmYOLy5+7G/wk99OxkteUw0HEptF/4DU7RbWfPhfGg0SI9E4Q3l2VpcS+QyGPjFFfTIZyeo3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7692
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 19:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197941

CVE-2023-47100 is an NVD 9.8 vulnerability filed against perl 5.30.0,
through 5.38.2 - which includes the 5.34.3 version used in OE-core
kirkstone.

But the issue and reported fix are the same as CVE-2023-47038, whose fix
has already been merged into the 5.34.3 source. Further, both CVEs have
inaccurate configuration ranges reported on NVD. NI filed several
requests to MITRE to correct the duplication weeks ago, but there hasn't
been any action.

I manually checked the kirkstone perl sources and confirmed that the
common fix for both CVEs is in place.

-47038 is already correctly-reported as 'patched' (due to the erroneous
configuration string). This patchset further ignores the duplicate
-47100 filing.

Alex Stewart (1):
  perl: ignore CVE-2023-47100

 meta/recipes-devtools/perl/perl_5.34.3.bb | 3 +++
 1 file changed, 3 insertions(+)

--=20
2.43.0


