Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713F4C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 17:02:08 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.108])
 by mx.groups.io with SMTP id smtpd.web11.406.1737046918726393610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 09:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EWyDosbr;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.108, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUDu2YnzF9jWYqnfPdNRWx6Q3re9qExtaTIv5WgVrjWCrJFK9U0SPOkiiVZZRzTRiUHHlw7xEvzAXot3oW9BSZivqqYTJLCX1laAVVHACC/p0eCqdgCllzasZUwsJ8D4KMJt84yDb3xpGEiB8JFaY6r+vWyzaHqcqOCNwq1RS4LZVV+F4m9fhq9SMDW0lkvROL3CGQoBUBW8aDPSNKRiZAtmEOcaIae6WDLVe0behRQpFxHsBknHXGaISmcV9L62X0pKdyJqalpHNS7NPRpJjp+HO9fVdWq7p2kmWS3NqhJOkViOYGHpUNq59LZYcDD2TOf04hMAoZIaeccgMJAZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+QnFXrbkD2PoJ1DRUaAlHpqi0rWCqD99241/3QPfjE=;
 b=nFpPUwJllQh8qkXiRxyiOJgjpaUSMkRnuScsP9JUcr3cqFRw6ogMaUIk4g0LmvVXPS5Fb5T0639/+2PJqSZwlOCh+bpZG9rMLitPmZXlASbhcVJ5jAIBQuXUzt/0t4Oksj+uibYnxOLev2uI23MnYpchuhRtgpoPSzmVOwmvYNKtRgz9n4/pqH+F/qMqEKnoYiqa4mO+xvXmcRECS8G8p7F4wS3AqWbZw3RlGSnbXyTh66f6FfLMB21BJT2DJ8Rt/s4sJjdPcm2rVjc6giQ6tqT+QkAS3N41PGoItdyLYKY/kXZvzVl4lQvmlqq6cQikpYq9W6rkEKbAq8Ny+XJ0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+QnFXrbkD2PoJ1DRUaAlHpqi0rWCqD99241/3QPfjE=;
 b=EWyDosbrMbaT4MuRGmNO7pyTXABdbEGYHYexx1AzXAJFYpUlsnibLsMzq4UhB/9d2ZtD69ITpdLukvO0F64jz7xczDFF44TyvUwhPz4qu2kxQqOkhzQVNILQ5jFRToCzha4CW/SP58KDbU1rZgYkZiDn9pqbOYDBHV7GhFzpwZnocHbiC98E/yfNoxTz7U8eLEzJ/S9gsOQSIvqBIfy7n0SQsi1yKQx8nB1zAUl8C3a+1yhn4xcMYtMRI3vzR5nOZD67wNBfPkDvCGOA2Vo2ctautdkOruONlzY6aPeomcUvxH15SI6GuI4y8fte3YCfbtZPfCBngbERBlFKoqG4xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB8970.eurprd06.prod.outlook.com (2603:10a6:150:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Thu, 16 Jan
 2025 17:01:54 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 17:01:53 +0000
Message-ID: <0b1361bd-99ce-4c1f-ab41-a06c77fc66fe@vaisala.com>
Date: Thu, 16 Jan 2025 19:01:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] vex.bbclass: Cease forced symlink creation
To: Marta Rybczynska <rybczynska@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
 <20250114153748.2358116-2-niko.mauno@vaisala.com>
 <CAApg2=Sw3-_bLF-ZQB1CW9CqhgsEj9skY_b9-NYCLVau_5pWrA@mail.gmail.com>
 <181AD2F8D760686C.28670@lists.openembedded.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <181AD2F8D760686C.28670@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0000457D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::418) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cd6450-5625-43fb-6b1c-08dd364f7a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?71ZN3iwiRtAHV2380VskKCCBR2wDJlbAZbh+9/WhUwWMXlMHaDiJNArgMCdR?=
 =?us-ascii?Q?4wA1D+NbHff0PlGMkg2mu2ER185//hLKlz1wLLXtWkW4sAFMr05K0Asl6uAT?=
 =?us-ascii?Q?PQe8DoC8zL/yCZwivEjdqSGLnzL73Gr+J40PssTgo3lwc4Elk/ZRwoWbMvxW?=
 =?us-ascii?Q?IXKk4ifjDGToFjUWtYC05VkpPy6wEcufDZGX0Sc8m40nZq9yxkZo0UhEAcnC?=
 =?us-ascii?Q?4v0kKM09w2eOOuHdKo6I4q3SAnPyM5E5uGZdfAaj8znIlReKedMk0UuV4AZx?=
 =?us-ascii?Q?8ChOljpQgYqhBNHxFKLpwcclN5VYNUpGx9A1cw2Rb3ZS8TRTpBczfMSnCp5i?=
 =?us-ascii?Q?u4XPhoxEAGENKH+po2I/NMlggzw3Kfc+W9BRu6daSWJeFsD35QW+BmJBjOmZ?=
 =?us-ascii?Q?dlbwBrISHc+VL3gK5j+UqmcxLIC330R7brUZu6xK9cwaB0FmURkaCW0s5vMQ?=
 =?us-ascii?Q?G9KTfvBS6UWljL9Mzc9bgsKolNxo1fpvCDEb4sndrRWdSz6FqfXkW5J4eEui?=
 =?us-ascii?Q?nQs5tToE3o8OStwO/LGql+tjqVTBRkCuNwsjxXyPZxsPd5y0oYiaepfQY+nz?=
 =?us-ascii?Q?ymXOq91yv4XUdVmiig/kr8bz1nbImCaqSnWpckC3r0xal06G5a8sST+tXZr8?=
 =?us-ascii?Q?t49bJFcTyxjPTtEDP3GZTcC0gmQ6JKtnGw8sJ3W0YaSQl55Oaxlcl3xv+IGM?=
 =?us-ascii?Q?Cxzwq7YPHu3RA3oIolqJF9/eIxLH3yeW5GVX4m+ZbvXg0X4E2OGLwd9+xH6D?=
 =?us-ascii?Q?uEy89HuUUcO3j9iVxlqpTPQWPwFTtCqh02GTOB0HkzDepKamvsqKAvDyPxSV?=
 =?us-ascii?Q?4zpHgKATu929f7eBgNLuhxmPyYm+5F9cOBrAKv1tsPdZ/sa0jSI1yzVmLi/U?=
 =?us-ascii?Q?/v/VTIQ+Uks1/prwFgHsnduvxSKzw9ikTDSRHGOT4r7xcHqIaRbWS+TDZK0U?=
 =?us-ascii?Q?1d5Nyj5dF7H7GOKpgatTu5ILJjAmeyiu/+TD8ml8tP51LjcA7sjWbKYGXQkr?=
 =?us-ascii?Q?N6P/9q3JnH/LsAjHESidJzt2NPDjgRzsJUpFmvckibpS87DNfh9H5OzUs1sq?=
 =?us-ascii?Q?V6dFq3CV4SvPUPE3NVJYfPEVodhKjT8svy6jCwGE0REDZ+1+XPRWpq90bb4C?=
 =?us-ascii?Q?czJO9e0Wd+GcobJQOrgOBdXcFnn4eKUP+AXrDiYifH106Qc19TX7RE3ArgaB?=
 =?us-ascii?Q?5+HuE4M5DwdwTdc7bSjQZwkWD+Hgn3RjXHDtxTJlC4cej/B6VJHiDVvKtGao?=
 =?us-ascii?Q?4qPG/emMCS9GqO2vlfTKM8qv7CLmcUCLQfi43EjT3f9wF7CbzlzPvabyncP4?=
 =?us-ascii?Q?tW0kyd4OA6GYvbHwXswrQM21?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kHvy0K0Na8nlcceaWCjC6mLNZrvLMtspUxMWm/JVT1STXsCGHiGK4jSxLFok?=
 =?us-ascii?Q?SmT5xnWpoQZK11AKZ0zpsqUfEYFX56YvwAw6neZ3tIrxRTNibvZ9I2mKcsLz?=
 =?us-ascii?Q?C73H9bhtibeQYFprb1y3Rg+mgo+hjCwTWGkRp6V35WxF7FGOIkFO//nRHlLG?=
 =?us-ascii?Q?S8Tu6ZRguqCg/fTHA6MIq/zz8uWFZVmy3qHsgyuliT1N5M2udNDL6vOPQOTb?=
 =?us-ascii?Q?DsP7MdMLSnAuCf67rcLZm9+UNMXo+S+Kcn7ghB30Z9jSl1z6I6lVX7jzssz3?=
 =?us-ascii?Q?R75hcqJkMI7pCdPwLfG0GBxrTEYUzUfZd8aUdA2x9wJfkRpZHJxMkfL61LpP?=
 =?us-ascii?Q?iDjcwhmK1HYd/KwJRSiOvGGZICUW1+3tVDAvt2cCQjCFA1NRpfyoqpF6s1+C?=
 =?us-ascii?Q?boff0LSmpn7K89d2FROggndSFUOmZLl/cj9KSfputFwRIMgEl2bWTvUhrKX7?=
 =?us-ascii?Q?uKRLyasDCBkCefsiZ/rwAxbWByUyWw8DUgNXRks1RZfab5QxYu4Nnyyoj2tT?=
 =?us-ascii?Q?ePimZ/TLQ9y0lJ9dM6L7zxMZCZMD2kAwvszQ/hl0oVUJMUxIuYfwxFKk8nXj?=
 =?us-ascii?Q?gJmuJJ3W7J/p9O/xp1HnlCuylmQTdI56PZ8YfR9N9CpCDUGsWXVBF4Xmk/Hj?=
 =?us-ascii?Q?fw406J8wJExaN+kI758qyjQQuouR5iEro8pJxLCyQ5kYuGFr09MaVCB0jdQ4?=
 =?us-ascii?Q?y6jWa/4MqoY/QLEcn6vcTa28tsdpic75YZ1FgZKz2cpwkIMOkHMkzYHjsM1n?=
 =?us-ascii?Q?q21grsxJ2znbOr/YTp+5QCBxggRLlrwtdnpMRYtrr17IeIXUiNOAWz5QeiyZ?=
 =?us-ascii?Q?KQl9XejtuxVJlDUFzvxZ8g2ofXza02gOzd/oKQXZXQ7BS5Sw3EcMGIZIv2KP?=
 =?us-ascii?Q?CyZVeQ8++sW/WCGyVsOTiNhMg+e2lE0x370xBFDg70vKotTOfXilViirxZDJ?=
 =?us-ascii?Q?4+qpKT1D3xE9Tum88XZJhdvMVspuqq50BcBmHEqWH9gzZZMYZKre89itn9rC?=
 =?us-ascii?Q?ewGI+xNgtkTrt/DH+15nATM+1zpuzo60ec4ZJzdKaO0P4KDGFWEdKsp22WBa?=
 =?us-ascii?Q?wN5pxf5K5iUiU7+2ALLD55rZIJ1bspU0U80X5Qah5GTsFR6/3C/TVaSG5IFZ?=
 =?us-ascii?Q?tS2Og06mT9mt4SwOlNShyeg5awDI3VEDqRRybWZggxt/IWllX9l5F7OBC8+J?=
 =?us-ascii?Q?hj4ubmpdiTU0NadrYaqBxKwkCeKKwgg200eKxoY+Eh1lBYH+HYLZesKCEii1?=
 =?us-ascii?Q?pkzkmzQySq2QYgQpqpJXoebr3w47xJelnO/itvRZJ0BFR9REjMF/kI0Dy87C?=
 =?us-ascii?Q?pj1gPQ0X4Ln1fTEocyCxYSYymRuBG1oUAHXGQE75FqPNEO62qtrGipsgD4O2?=
 =?us-ascii?Q?W4n+deljWe59Y+y6AxJUAxQvgxOba5loHQGaT7eVLaQk6yJNWWROflO5eDQk?=
 =?us-ascii?Q?RgCy/+23Q4kRCIJ8Jdj5V1V8kQ+Dc6IJlCouvgqblzszFNVhS3Ekd++sMayg?=
 =?us-ascii?Q?18OPhx5dr/GcW+lXekdUm2oM3TAAZVgNynlsWC8z5pRmQ1e5kiZhBN/i6eyq?=
 =?us-ascii?Q?PhnLdw/FYGypkfj8Y3fYmewDPfbWrFWH7xwsjUFZKK6xU+ezubSh+2gHXCNY?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cd6450-5625-43fb-6b1c-08dd364f7a37
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 17:01:53.8624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ghbnetq273ULJqjl1f02JLGnTM6ITI7ZzVP2TwZxo0zA7O3w0Fl2ALPvF4YfSV1QTEwkH1Wa2zz1gXQ5Cbl+wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 17:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209970

On 15.1.2025 11.16, Niko Mauno via lists.openembedded.org wrote:
> On 14.1.2025 17.57, Marta Rybczynska wrote:
>>
>> On Tue, Jan 14, 2025 at 4:38=E2=80=AFPM Niko Mauno via lists.openembedde=
d.org <http://lists.openembedded.org/
>>
>> What about a common function to use in both cve-check.bbclass and vex.bb=
class?
>=20
> I have so far been exposed to using cve-check.bbclass only, and I thought=
 it would make sense to fix the symlink-less use case in both bbclasses whe=
re they seem to appear similarly. Making an architectural change was not in=
 my original scope, particularly when I am not familiar with vex.bbclass co=
ntext.
>=20
>> Also, it would be helpful to document what happens when the variable is =
empty.
>=20
> My intent in this series was to mitigate the behavior with respect to wha=
t is described in https://docs.yoctoproject.org/ref-manual/variables.html#t=
erm-IMAGE_LINK_NAME namely 'It is possible to set this to =E2=80=9C=E2=80=
=9D to disable symlink creation'. So my assumption was I could just update =
the document regarding the 'you also need to set IMAGE_NAME' part in case t=
he topmost commit in this series is integrated.
>=20
>> Kind regards,
>> Marta
>=20
> BR, Niko

Just to elaborate a bit further why I feel it makes sense to avoid the forc=
ed symlink creation, currently if my local.conf has following overrides

   INHERIT =3D "cve-check"
   IMAGE_NAME =3D "${IMAGE_BASENAME}"
   IMAGE_LINK_NAME =3D ""

and I issue 'bitbake core-image-minimal core-image-base' what follows is

   Image CVE JSON report stored in: .../build/tmp/work/qemux86_64-poky-linu=
x/core-image-minimal/1.0/deploy-core-image-minimal-image-complete/core-imag=
e-minimal.json
   Image CVE JSON report stored in: .../build/tmp/work/qemux86_64-poky-linu=
x/core-image-base/1.0/deploy-core-image-base-image-complete/core-image-base=
.json
   ERROR: core-image-base-1.0-r0 do_image_complete: Recipe core-image-base =
is trying to install files into a shared area when those files already exis=
t. The files and the manifests listing them are:
   .../build/tmp/deploy/images/qemux86-64/.json
     (matched in manifest-qemux86_64-core-image-minimal.image_complete)
   Please adjust the recipes so only one recipe provides a given file.
   ERROR: Logfile of failure stored in: .../build/tmp/work/qemux86_64-poky-=
linux/core-image-base/1.0/temp/log.do_image_complete.2654424
   ERROR: Task (.../meta/recipes-core/images/core-image-base.bb:do_image_co=
mplete) failed with exit code '1'

-Niko

