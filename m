Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAB1CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:32:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19239.1781094758336405017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 05:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kontron.de header.s=selector1 header.b=fE/n5cZl;
 spf=pass (domain: kontron.de, ip: 52.101.69.92, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAIKkuf0xZnOpWX69PK/f4Hw+KPpWQIXxAe/mJwdhbrOA2v3aF/pqnhwgqZAJGqCfGDZDhA++nM9Oy2WPDeoAcUu0/R4limOnxlW/lRtcq7WOfs9NFF5wqWe0kvbHhzRXacVwHSssFE9xYQiWgV3XwkwSg9vC9X48cu2kh6td0WTRZp0duDgDEDmD/e4eEARZieuXjB6yKf8rHeRwclClYpyIMiLdm2T8HNdFmDuXIk+8VNE3mfnWbFlBVcuAzwUVg7BOnwCmIXcaHFh5NjdBD1+juh5rzukLX9+gWqqkOv1l1yjbPBwSntatlPYKTRk4LfekybDaHSjVtLg8+UNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUzfzZ7eWmti8kckzzxIB1W3FYVHVfRuQA1unolJsvc=;
 b=x7YNL2vlvTIpNWn/9C/JMP75toTjbJ4ggrgm02aYhhoBjdusUhkJZYDzzmq6l1qOGFbxFYmKHH3PDXGPH4JxgONJCthqrweRUgwWqqvnwXs2DmP46Nna8bUErqkTtsRFtQjsSRWO2OlQDqVgd7W++VvCnfT4uNuxfmiR+6apk2VNZ+v/lYlQCYF4o4SLSpUAyem+kLnbKa96/Cnui+sqKfGZ1fF3ZFaEpRQrAnxWE0riLHU2WVqED0vf3HhCTMkjUNt7/dDJ3Vzsj3OqlrLjcJiKka+eMPuIy2JIsJ2+FCOun9e3hFEgxh+eJDZdJIvSznBFkcKXxdUaeEU4URb+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUzfzZ7eWmti8kckzzxIB1W3FYVHVfRuQA1unolJsvc=;
 b=fE/n5cZlMiytddyG8wYQy241ELubcA6pUzxkKE3KfebUMQWsZlpNTqu/0lDBH+SL+j/pvaeq9G+W5QprOjdfE3LddIOekaSOYgLiyCcBLOeBhdZNLB77nExcPTwRX3o/BrnOL8IUgmG5/7nJRbYKlmRydnqNMXgs4H3J59eFfASgQ6FncQFUFgk7Qx8rDsPtV4Br5mZ3ZdapvdZU4U+Og5KAu1wGiY4uogPobeFBIg2p3C2hA2eDmA/ToegJ1aUHBk9bqaH3EkGryqWT8fShHVCgMUIypyKdmSg+Am5I+ldhxuuTvD1AkFFza7Wk/lTG6oVGrToWqARzBER8q5b7hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS2PR10MB7372.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:604::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:32:32 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:32:32 +0000
Message-ID: <9ddb97e5-f2c4-46bd-a9c3-ee79b78ab149@kontron.de>
Date: Wed, 10 Jun 2026 14:32:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] devtool: prevent 'devtool modify -n' from
 corrupting kernel Git repos
To: Yoann Congal <yoann.congal@smile.fr>
CC: yocto@pengutronix.de, ejo@pengutronix.de,
 openembedded-core@lists.openembedded.org
References: <20260323232008.3456362-1-ejo@pengutronix.de>
 <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
 <DIO7KBAHLD5C.WFRWBJQPZE1N@smile.fr>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <DIO7KBAHLD5C.WFRWBJQPZE1N@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS2PR10MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7786799b-c47c-49ef-3179-08dec6ec56d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	OvrVAIYNgR7o3R4JqWEJjxLdv3Rc2Chzn3FiRb+8JRJxRCLwzeSTGFSS/rNvUkaAVWQTts53chSNLYq4ym5rImOTTOL2D+dB/BOF018xVvPgsPPnYb5lceOKmXdTH3KvYjbWNs+UxxgUD2afbj0zgm6ZJTVwycYQzwGl6nK7Rl5Q9fCtVc9TpkJ0RO7PLwog3lxxtEg2od5728U63/mT9n60BaRQBt8L84IvskOSb9nhJNyHgRmUiY9MRP6Ms0D/PydwO1Cz/XerPZmWQ6jkrqRb8cpO+LmlVTMBCooZW9ptCY3hrpOlElyOoEzeCIOCoFbJ+N11J6DWACTrCULdNVnXiT5MQ+JAp36qs6/K524zQWjwHjKYhXSL4dn2PFtKz1bn1EhPIGuzBCge3ZCKFYcTqzjHtMP+jlaf51Po97QDZMre03XdGMETORX49Q3UOdOgeCR7i3Dlcg8ZYdPgy/QZrxawVzPbkJN/NrgVZdeSqyN1trwTPk8VZoN7qdNgRbFuf/qlFFxPeBuDCKx06ahJuhzL9z1VfdhXzDIlnvYfxQL7nBKyVs9emCNqBdVlvVh4REyPgrKUBoGHWXhonemRCjx0wcAy2fDG/x3o5NsIwJVOM4UsxPrmtmBwi7YdMbGnOPBVRVDT+8sXMXCIwA/HtUb8wlZqnRJSmjpCuH8vBGMm3Xp0JapEf3VNDEgF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gHhjmAMiVPIfkSNumDFA2sUn9oycydvBwAjmSDkoPaPotGb+wXgceFsC1nFv?=
 =?us-ascii?Q?oYigRF34eWyY9YMmT/NvWvu3uuWifp3AdMWDO/COc48u05+B9xS6AOV0Woem?=
 =?us-ascii?Q?hTD41bSgZRRD0484ogQDeOAEkJ0V7OAwYY7ZexmJBt8o+/HT9rRQuvCjtSEj?=
 =?us-ascii?Q?jjpHMV3P7ZhECRWsNucKTjRszDNTkM9ZAxb3yAAepJ40JXaAo8OwANYxBgrG?=
 =?us-ascii?Q?HkAlnp8mPEhqScG7MGyP1j919Dg+INWZVh16F2zuTLzucNDNp84lVWfoENpI?=
 =?us-ascii?Q?6xeF11/pOj1/JJRr0PH5E+fAd2YOC8h+7mFis+2GSi6o/H1sJ0jR1fRnJsen?=
 =?us-ascii?Q?JBhKTvc5X+w+gCaEZYTYUsmAUiKIsSDn2fIuNGOGeQlhe2ZM32wNUGzycVpj?=
 =?us-ascii?Q?p/Zy3fuAxg5yKNuM1YO2CleF5VhZ9dExA+xHE0LMSlWh1IA5RFKhSxaMIxZ3?=
 =?us-ascii?Q?t3dc0cf3/cK8tYWkSdhl5OU2zKC7zHerRfnT073tuj4HrFrrCsz5RRsL5qXI?=
 =?us-ascii?Q?PLjYbd3x+ZFo87QlhLpWQT8YH8FfmckxDx2qL0moIk0ZLzJLUxkG/aeVq/41?=
 =?us-ascii?Q?QWdHdpy6IRHdcMEpZ0nnDLEZHlw6slQj4xFLhCNSkGaaBmBnGa+45OyVg+c5?=
 =?us-ascii?Q?Txul29JBXqMKro1W90SqsEv45qF0IOaXkwxrDQBIg5nLHvcR7mcVRHc15PrN?=
 =?us-ascii?Q?Gje1fsTVOQ6Jqf030FA4z8I9HSWXfCpbN3Ap1phD7n0uvIyj8xoboA2/V+Yv?=
 =?us-ascii?Q?T0m4tp8NVRZ7Fuvjz+J9+qRdS3IC6vKY6TwMjnsZNOqW7z/qpUBB6gwKhsTg?=
 =?us-ascii?Q?Oqh/zepbKmJfu0ckT4zN4XHfklBBSIxEW8S35cIo/dCKcVOx8NrW8c24CWxz?=
 =?us-ascii?Q?3dVIhWIF4ci9mfw6dRlMMxoaOSXp9VTGyDYK1UJGJwPAUflYkomio77gpJmp?=
 =?us-ascii?Q?Lt35u2sj6SB5lVOwZJ7fzYEb6L+hk7z31iCLvslVEUtDRT6jVBodAYeOGaHU?=
 =?us-ascii?Q?L+sBGRPx99HO8fk+hrGrh1FBFhUxzYRP31TKMXXsg1k/wyFXxYT1aSGM/l/h?=
 =?us-ascii?Q?iQcr8jGbJVRsF2KI4ffgjTeWhxBxhoS79ws0YAz47Gkc7xOxG/XoxaKcjqTA?=
 =?us-ascii?Q?wvNNYryV0aKng2XqwozzywsGp7kFBeSryS5uO760K442gWzvDVuaDjY12fwk?=
 =?us-ascii?Q?9tlJsRgtvWs/mUqZjLm+gWSJN032cEMwqGJUYBJGUopEAv/jmm1XyM3ptv22?=
 =?us-ascii?Q?lECZwTGMG15HnOpZdLO8M1vWEXjYEhLq1Z39gigbPDMy2fQoErlfMA9txA4x?=
 =?us-ascii?Q?2w9miyLvACNuV9ZS/YoricxeoafaOlX3GLCJZM3/wcUhM1T3O+Nl7s6z9LCd?=
 =?us-ascii?Q?XcMHbY3QP59HjjVF0cQQ0sPpEFK6BxRZlV55OnRNfapzwO3INOvaGRcPsg/b?=
 =?us-ascii?Q?xUUkt16JByeAkBtGGpfWIYacMNd/tAHE8Nk9Ptp6YMStH/RP13Gj5ygfSdec?=
 =?us-ascii?Q?L4mGz9WsqaWanLyh0cOGezbSKJvHDTzyGYvTqNYAfdIBZwSiJ0AriIpskBka?=
 =?us-ascii?Q?I5iGCXegXw12OtUBlheiUwVcFK9yS3vAHC0ydiBxmU2xu6Ig+L1k9PBsQ3ax?=
 =?us-ascii?Q?svbfdCjG8ra4u5KEG3SfKlbNNy5JICNX6Bil0b/m+852AjOhaTNpwuULcJ9N?=
 =?us-ascii?Q?ShwOLj2QAopVRUP5abU83bAnjIU11JVn7Xi3ykRUNooAW66i9CkakZrNLY7o?=
 =?us-ascii?Q?iY2fkejLgk//AssnALaraTsXOtdvU+8=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7786799b-c47c-49ef-3179-08dec6ec56d5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:32:32.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLA9mN3wW3bES2EvsY82u4vLUuyNoDGUa4JpIPZsDeJm4O3dsc/wMMBVh1u3oQHYdjHX+qHqILDqg1olbOyATyUSK6VG9KuA/R4nKJZq7S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7372
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 12:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238355

Hi Yoann,

On 21.05.26 10:23, Yoann Congal wrote:
> On Wed May 13, 2026 at 12:41 PM CEST, Frieder Schrempf wrote:
>> Hi Yoann,
>>
>> On 24.03.26 00:19, Enrico J=C3=B6rns via lists.openembedded.org wrote:
>>> Running 'devtool modify -n' on a kernel recipe that inherits
>>> 'kernel-yocto' can unintentionally corrupt an existing Git repo or
>>> worktree.
>>>
>>> The work-shared optimization introduced in 3c3a9bae ("devtool/standard.=
py:
>>> Update devtool modify to copy source from work-shared if its already
>>> downloaded") is not skipped when '--no-extract' ('args.no_extract') is =
set.
>>>
>>> As a result, for kernel builds where STAGING_KERNEL_DIR was already
>>> populated when running 'devtool modify -n', the existing source tree is
>>> overwritten (via oe.path.copyhardlinktree()) with the contents of
>>> STAGING_KERNEL_DIR.
>>>
>>> Fix by adding 'and not args.no_extract' to the kernel-yocto guard
>>> condition.
>>>
>>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>>
>> Can you please pick this devtool fix from the following upstream commit
>> to stable branches scarthgap and kirkstone?
>>
>> d383ea37e4 ("devtool: prevent 'devtool modify -n' from corrupting kernel
>> Git repos")
>=20
> Hello,
>=20
> I've added it to my scarthgap review branch.
>=20
> Thanks!
I'm not seeing this in your latest scarthgap patch review. Am I missing
something?

Thanks
Frieder

