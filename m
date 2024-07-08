Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03AAC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 17:57:09 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.68])
 by mx.groups.io with SMTP id smtpd.web11.251.1720461424283041432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 10:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=0pqyGJbd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.68, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErRA1zja2+T2b4AGz2arS4Xyoz24eV9vhpZh/IJSXsBMPuFeRLwSpS7Z1yeBdTX0eXHCe00QaaWGiEb4kC0Ip5JcbDbeNBCUC+A/aeXvlZ7T0szKbCRPPt8lytNLNQQcidwy+srb32zUbedEI8vq7Ts2Wr6Fgk6NKdsCAQ4HCXQ7OMpw/gK3BPS1vYVhSc8HKtLmkEERB2ZytsKdkNWhkswGn38BaRb1Ohd6robyxR2Molcch61oFH/2z5T9YDqqanL/pMm9n+y3w8Wyj7Vf1KpRRkYwOCxPiWzHSJ0oHWQ2Z3s5jzAn6nXDXO605Il3ac4xOl0k4FGuvVuSGE1XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTzec7e9Eop45RLXAGtKl3ADEw0sWS+ldS2n7EIjCCs=;
 b=ktG1PsOfIU6aViUB6aPLLvdihOL/Ui0cFFohSjFa42pww5zCxuxLJS1+sQFtnOrERGflIKzZ+zAAtUkxIv6roUvxPxi0Uv8i31NkdR9vHDetxbSa8ppOilZQxyiROpa1gxHGxu3R2AyKNF19bkaBZBCMWL+6cWlmnXXV/gX0foCpiidjdIcQ7xjFRctbedCzXo2KZWU0m89x/vode3k+4FW14kXFpbZpFX8q8BAFiLETj3HlP4e/A1GrS1f7NvdfziRLKKdcEpdqnoqo18ikQXXaLr4xdvaX7wOLPE2KhB0RQoJpbN2v9K6qht/zdUETE0OUfv8PtRFnvduBqpILBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTzec7e9Eop45RLXAGtKl3ADEw0sWS+ldS2n7EIjCCs=;
 b=0pqyGJbdQM7dKm4RUUEEEV65VcDPyXOEPHGQZWklg1bJdxdaeQeg7JbZF6YVqHAm4e0owGH8hmJOsMXIeOUEHO9uoI0qr7Zr16168OzRMC9OOxDHsORwz5574uBjBOPi2bfKPZFLyEMQV1rZ1YR52HRlXQ/+ekdR+qojYcaI/sU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 17:57:01 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%2]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:57:01 +0000
Message-ID: <04d0dd97-6e67-4d5c-a82f-e4ec5f0465f6@amd.com>
Date: Mon, 8 Jul 2024 11:56:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] wic: engine.py: use raw string for escape
 sequence
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Hatle, Mark" <mark.hatle@amd.com>
References: <20240604080621.1885249-1-ejo@pengutronix.de>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20240604080621.1885249-1-ejo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SA1P222CA0153.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::17) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e43400f-e3f8-41f1-bb39-08dc9f775e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SDtLiItl9a4ylDSZdtru0ZtxDxI/YqAIO+euLYLuseXp+Bq4NQCDuIuKX/1X?=
 =?us-ascii?Q?K7sLt6r9GmTgk4KuwwlgG6INRTSlt7jXA9HI6ariw2bjo0G4Sds1B3JllC00?=
 =?us-ascii?Q?YSfGRkj4L+aRSWMexnTcPg9m1eN3WxW7nSIhpvnkoGI9q4u6yV1yK5dqE0AN?=
 =?us-ascii?Q?+KkujvQuHybHyGkj0K0xek2HWpZXDcIQjV4yBmVG29iEHnUkEAL5Ez9yT2JU?=
 =?us-ascii?Q?4WWQiOEprU40sGUKDm3teS1DajjMBDK+jw9ZJf0fenbExCWHrlabVUw+VSdC?=
 =?us-ascii?Q?8np7aYjOnQ8CoaDa/W1CY4fFZXDGggzAAfIFO/eLWWTs5JqXrC9K4ZQJtvMp?=
 =?us-ascii?Q?PTEujx5dzl0cwDTQfGAY8p7NoxD+xPDUK0xpXf6pBRDMo427uH3LLyS+CPgz?=
 =?us-ascii?Q?Gz3+Hnp0qFYJPi6HEexyTP2b9cKL9NZI638lkonqmGKiry1BQBM2vQ/o9Cn8?=
 =?us-ascii?Q?vbDkE+IwypILZczZuW1nRnpcKulYsrZ26veRlgrkr1ClVlvIJbbqDzYMScQO?=
 =?us-ascii?Q?L1aB0a30rZUVv4BKHwmf+/8aEDmQ6oC3j3XjzbP98f1U92e6b75B3Njtt4Xd?=
 =?us-ascii?Q?86nZAcMkFqy+cRza5nBWIEcUedDTgLUOkGyaRxpxP6ahowy3ixSKpOlHJ0qB?=
 =?us-ascii?Q?U1slR5j3esk1j7aES7niWko6Hxm420jgCdF23TbeFuhcnTw/Y555tWPy1iML?=
 =?us-ascii?Q?mTOr4U5fF6rKGnO2TmQZcR5tRhgcv2cMivfXe0XR0zmBnRy8VDRkMuUXdKn1?=
 =?us-ascii?Q?kUMhl+h+PvqgYYUE3+7CNvXwW306+0bzezM+NVFGXn8+tDFeNAf4wjMJASaz?=
 =?us-ascii?Q?B/HpBGM772/ZajubePARpfYCFAz37YUpNcspy9BaNadwDWQvAbmdkg0ogJMr?=
 =?us-ascii?Q?nlXvGRBOszRx53uKN06+sQ3qidY5FxyDc5Ex1nCddxneF4iUrecFJmXKNL66?=
 =?us-ascii?Q?WvpZpPq1GlSuiG743JP3YP7S13gRYwZ1IO7cMHNhZ5m5HnbYSZZPIIdJT1Xs?=
 =?us-ascii?Q?LjMPYJvA4FFyQ0FoGLEMFn5iFvk6+306Kwiu1ugDQbJZ7EvBz2IQZGsttAvH?=
 =?us-ascii?Q?ayy0sAWjIFCoQ1/OPWzISRj8DpNx7+RNdBum/u9npVkGBIkWlDXcVUr36bPL?=
 =?us-ascii?Q?+CueFAmVoVgD4/RmzAiUtLeD0kMRXoxgkw/ZqUUnU/Tvvj7qWW42LqL/OV/5?=
 =?us-ascii?Q?cc3nEJ2o8i9bwT1CobPHQPBbAsrmK0FwODyBmkLMPUCLw4jSxuwq7HSfnuW6?=
 =?us-ascii?Q?RYsMaOrmMEh1e3JeZwAIu198VQ1HHJ4W2JSRzRQEIpGS+dXYeMfcQ9UlhYtF?=
 =?us-ascii?Q?ef4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FfxC3Oa3S+Y4XqsjD2O7Qd9aNubathwKYDlXau2vwmzQbHdf0oZdCPVUWuht?=
 =?us-ascii?Q?Vg3b9/f4raKaRlRVgkD0SDIE+ozw8ZqJRTIvJUBQvzHcF0tE6Ln3fYSTwc+t?=
 =?us-ascii?Q?3ygj8ZeA278pc/yRDwpYXicCU0UjFrnZkgr3KueVWhbTJgm9OWbWbX5bj6AH?=
 =?us-ascii?Q?uv4CiCElJ4cAXtst9j19MOjE3p5N7ZO7p5Z/Cttn3Z1fUVrf3LKgEAl1cFZe?=
 =?us-ascii?Q?cGG1UqHSu8LD82gkXWyv6Qq7XsRMJwHCVVikQTtHFPJF6fUdT+zpBfBlQpDJ?=
 =?us-ascii?Q?si+jJTkDKtTIJcaciuxd5PGsuhg024J1jCvvyFFD3KiSlvVV9fC2CtGN2rT7?=
 =?us-ascii?Q?x5lsRquIf43YveLZtdh66Qy40rxMAzLJKzhApn4V0TMhaEvDlbYPshZV9rlb?=
 =?us-ascii?Q?MYaWW/LA6vZToNrt7OSyyoXbENYIeF5AptGZ1WwToEQYmqM2ahLsllrMECKv?=
 =?us-ascii?Q?8HXusMm4Qek6DBOeQHJefTlfJfOwJRyr+ylAw1hCaJ1hBoYamZJRyvMslzki?=
 =?us-ascii?Q?xDrFSPzRd7UloSLeFoXA5c2z4D4vPrtYTcUI1h3uGoziP7Ey4yg0QT+4VNQj?=
 =?us-ascii?Q?giUUAO1jRlfuuW6dRGefJoVV9VOVMeYYzLaSa4I1Z8GQbtDBcRk8g9Q+9QGl?=
 =?us-ascii?Q?uQBJe0AonKHyY6huTMCLBOdMTFgP746+PGvXaqG7IEGvo1w9+GtOP8Mf1kOw?=
 =?us-ascii?Q?D3mGD41/A07uIVu8EpRRD1BorGP1IHHFQowNb8n0HZbZEGCJjFENMOpu0UGT?=
 =?us-ascii?Q?QXtY5A6u3KE1bHQ9DJJsTAuks0oS5xZ2qf31c0RdpjHeoWOcwh6Gd1ttjszk?=
 =?us-ascii?Q?3rSNNxMd2rSAANIeadec3FPERvYZgZ6itFion15CVHSdl1ZZjj+tMoTftkHs?=
 =?us-ascii?Q?tZRb0WTyknIctivf76WIk8rgp1ZIzKW25CSiIYJQ1klDV+69eZummg1H8OA0?=
 =?us-ascii?Q?gR/D0Ev4x0bRK8xza4nJ3te4ko5aTj6Vg1VlENnN4bkgrzrvJS0LvxjD0OXY?=
 =?us-ascii?Q?3OysITemdtKycngxI58CHE2qRKNgsEzOegJBaqchxPWnLslrXfbP0cwTc9Q3?=
 =?us-ascii?Q?9mbOePTb5egGFo8YbgTGvl5I68ZLpLLfvS68IYaDqFZcuIsSdMSZigvIeXrB?=
 =?us-ascii?Q?XreD+OWTn1MaMbA3ghkNjlCDf3iu6Q8R4A//amB9w8g2cOvPK547sWp0Zqvh?=
 =?us-ascii?Q?/zXF42BKjWBpFm4B0ie/0mQFoWwmE4kCWiLW3UPAQWtWOakyNK7yqsadUaO7?=
 =?us-ascii?Q?bs9P8Jn+kHIXEhju1NuQv7vZ0QOUjx4BJ18eFTOlJ/MBKN4HSVAlxfyaEiaq?=
 =?us-ascii?Q?y3uBE63i3/GaZOjUKWG2DGpx5vfCMj6eXR9uF5Bgt/G6s+HM0wYxPjXM2yMC?=
 =?us-ascii?Q?lW4NTGWdWBYhQzsICdjf8ddYPS0OUH5nA7HOHQgb5QzeUVIiBF43CSZ2RlMD?=
 =?us-ascii?Q?2Lf3TBW7U61vaOzoig3P3aZmfLm/BDkJX2ztSi6Yd2InDNc0tj41w1OAc+m0?=
 =?us-ascii?Q?A+Lr5/BkPRhtqgEbTZzgEo8CRzWtrggGMm+ubQ9Jmwb38Y6/JkNKacfDQQL/?=
 =?us-ascii?Q?+YS9xpcHwGj+j7XF9QvjD+8xebKSrUeVoSmF+jmY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e43400f-e3f8-41f1-bb39-08dc9f775e4f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 17:57:01.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3ysxRLPIUmvYtzwj0UbmL55spA5XhhQRsi8eBIXGDypSKF50ufO4o6Uy8lYBKw8T/TAQpjgYsfO1xJUKSVvtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201636

Hi RP,

We do see this issue in scarthgap, Can you get this patch backported to=20
scarthgap branch?

Thanks,

Sandeep

On 6/4/2024 2:06 AM, Enrico J=C3=B6rns via lists.openembedded.org wrote:
> Fixes:
>
> | poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape seque=
nce '\/'
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>   scripts/lib/wic/engine.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 674ccfc244..ce7e6c5d75 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -359,7 +359,7 @@ class Disk:
>           Remove files/dirs and their contents from the partition.
>           This only applies to ext* partition.
>           """
> -        abs_path =3D re.sub('\/\/+', '/', path)
> +        abs_path =3D re.sub(r'\/\/+', '/', path)
>           cmd =3D "{} {} -wR 'rm \"{}\"'".format(self.debugfs,
>                                               self._get_part_image(pnum),
>                                               abs_path)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200302): https://lists.openembedded.org/g/openembedde=
d-core/message/200302
> Mute This Topic: https://lists.openembedded.org/mt/106478736/3619217
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
ndeep.gundlupet-raju@amd.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

