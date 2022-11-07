Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE48C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 12:53:41 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.58])
 by mx.groups.io with SMTP id smtpd.web09.2971.1667825616409159849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 04:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=j20JlBL9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.58, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVvL78ixyQCF6EoWj3giR6mtZM/TfNkKKaEcf/vlwgnNwJMeBp94eLe5slBzM3S4BUlkg+Ei5LIgIAvF+p94QeZLeJUXpg1Abo6kN68VgAqK6Eu0fTMnJ3htrdPKdwqkh5FKRtJgxuRPZJ/J0mvmpXNZlGoe032wslvt+/NIO2DgNT4EsqU+9fD+QnhWjqDXXuQmlwacap5HqqDnfCMFjG5AxGjbp7GN4zQW7LGqcxBZcWLtfg1h89eMZzdinuP1fVM3a89McskY4GTnLx6KYe2v04Dwvq2OGfckw8cZ9FUCI98sRlWQBYFVdvdFF/8Pity3k+Az9uD43HZ8kxtuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MlQjFxSn5e4WpU2d4956yrUmnZ8dj1ta/tJlnr60QA=;
 b=HgVQ+sFcjYa6o2bMYqX1gP7l9YUZc8w8SRlaWdw1pyF+ToOIw4f0m9tw1MYoWSQnywS8C7rfS2DGbxhXY/PxMr/p47jZpICESwwmcldOd4xrpHawHyCIQr62RvfjrTG6YMPx3KXxoCvOBK3aatx0IgGvyogXzbPaRlhDLOE7OvYJzq37f8CMg9ixXuS7uasT9Ga9JBgK7WlLehYvMIXzUdOd2JwSF+woenzmp4+osTpga0eAI08/yMKex4tz7k7wYv8UcB+HU+s+iReiFF4N9nrh2RyY7PtoqpvWLHnwGXvEKUr8GKtaJjeOT2GedAU8fjFYdkLF0ujuSQS5HNNnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MlQjFxSn5e4WpU2d4956yrUmnZ8dj1ta/tJlnr60QA=;
 b=j20JlBL9y3fjb2GIi3MrGeu5Q2f8kzCJBqKReqTI4a2V1EPRN6w4nkYJwTcJ8yh/Hprxw0n2/86y1ORfQcD1Qm+WZVhpT1Zzit/jS925Fnuuox9Y94JZrAADXsoww/XyXU8LwC/HR9sVvub9v8G+CbsWzhP6yZi602rnSBbR21epzhfUbmDvinuNt/afiwojDlrQ9VlMub7knn7oq79E8OCjkqq5c/h7xfTcvCbJnq8S/K/Cx2RbH+PEvnNXylXgrsRy5vwolaypA9t1imqeCA2F+W8kFSzJDCKtkDVJ6FzsxxBx1oYYzem1yuMf3H9uOJNMHP+z4pjMEUCPLgJLNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 12:53:32 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 12:53:32 +0000
Message-ID: <e6e0a6c5-8a3b-6431-3f4e-bc04d621b340@theobroma-systems.com>
Date: Mon, 7 Nov 2022 13:53:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [master][PATCH v2 2/2] image_types: Set .7z extension
 for 7-Zip conversion command
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <20221107123733.912-1-egyszeregy@freemail.hu>
 <20221107123733.912-2-egyszeregy@freemail.hu>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221107123733.912-2-egyszeregy@freemail.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a425921-65b6-4ebd-686a-08dac0bf1364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MeY0Ey134EqIuNRmx4lKJnSxX1uqjEUTRONRJyw+YE60RglPxYG1jJBrKqgeZiHIT01eJ8QyAuK/m+i/G8G8DK+uIqlv52HJWwFyQk+rF5b88akAqpI7cBhqnmFOGpp8hQeJVyRhtkRSL3PQRmNHYUxczB302qq8Z71ZKHf3CWBKq1o2g6bab8w+fMqAzLuS1dwLgT7YpYaUZJhQ9JP5ZOuBQxaQBuqnDpm3ovdl53SU0vLIlRQJos7pvFeBUa/iirihIY0tFENz+6zJCPhVVmsc8ZdbE0Do7l0bbYdUQCYxDzTcm/CJMX2A4Bkhe4PVTD41iJkDVFbEoPG6DeZy3k7WrweMkpXR5sUuv2yMWicM0sDmc0/CzXMszm40WtGk72xM19u1/sMOEfnQ8SyIHrNRYZ4nwolVTfFvKfNKR0p98xBg8ANY0qoTc0rxHJqjpuZqmnir8Gc6XH2QcEiFB/5HgNffuhVOeJnCiXz2e4BbKw2QWHpa164T1wVkCSrB7JyeRmkl9HiKKIC+dEMCUEnpa5AcWXcCOJqIuLaLjkDW3k4WDvkk7Vs2BVJZIxGwa4NMT1dE5pOTHRz8FNWQuNgif7wrtGGl4rpWYqUF8xWVy4IkcPO+I5BXOF8AxJfoAHhTX0ct8+D00/wtI3PqCZwOmQ2DU7f6o6rWRrzBqAR31CjJqsgCd70jqfzzDOyosZ5QEtXcH9D28JMpcDuUcL53wsi6mkGonYweVny8Rl4AcwtGeXfYKtUHynZ5FeSMAWPwRzw2ggQnQgi7CW0DOG9USnPyVwEiLORCIBTDjIjX3jtbXMq5PQSu/8hUBi8e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199015)(2616005)(66574015)(83380400001)(186003)(38100700002)(44832011)(2906002)(86362001)(8936002)(5660300002)(478600001)(6486002)(26005)(6512007)(53546011)(6506007)(66476007)(8676002)(66556008)(31696002)(66946007)(316002)(41300700001)(31686004)(36756003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7/nFS2BqBLawiZMv3gCEPmJ/2pCd7KD7ezzzOChzkkoUTXv83AK4zlvpROkI?=
 =?us-ascii?Q?/gYnBNbpJhIFiLbQG1upM6XMkB8fIcaUgZZLRGinNV8VV7IBOC/S13560y2O?=
 =?us-ascii?Q?Q5snGx7z/jK6MYxpX1GdA6urd0YXsR32gOyVqD9fwbZOynQnqu8c1D6Xd8QJ?=
 =?us-ascii?Q?/t2qv6TIftabn1J2G8Ajeo3V2M0f0/lpC3/r5rnmQB57pGQtiU/7Nza/JSyL?=
 =?us-ascii?Q?X7FvozSqrjMuzWFIkI/E9yQbprnYp+9bJM4i7MNIZ12PUtxgatk+p0IsqCE7?=
 =?us-ascii?Q?/Nux9gVtHenuetriJGYSWvZ2XlKP4I1/+8oY89BZembkKSyEDiuY9YT0eSQB?=
 =?us-ascii?Q?0B3hDAE7Tq1dJfWFCJdJxIpsHHOb5TuIzWz/l/1G5xXJSObx9RAYCj3jKOtu?=
 =?us-ascii?Q?WonPXtdgMo1JrBhPHmtaRxSGaZ1SB22mez8sgCCLMD1laPrCpwRcE24Vee48?=
 =?us-ascii?Q?zd+PvUdkAYZeMlNqp2geBx5l8h8RLuUqLuUzz+osSyryZkOlM+o1IHLqiqzl?=
 =?us-ascii?Q?jFDWEybrZYg5XLxc7Nj3M5thABDhg3A0WKeWNfhzmpfOSWrL53ruHUdDasaY?=
 =?us-ascii?Q?PurA1heMDFZh80i9EtNGYI9/gJnpXQzd29cNG3RyPbMh+mhaVf8gP/7p05U/?=
 =?us-ascii?Q?kCjA+9dTJOrYXiUlPkhoSmE71Vi+ktdcNrAVNrbqyh/SX3NWQtxnwWNDGxyq?=
 =?us-ascii?Q?RpwO+zu53hfESm8QyNNsGCKhCvKpvD7UGQH0Kmim5ErlXHEKmTTJ748PI18t?=
 =?us-ascii?Q?M+HrkDBjhQ2fyJaXsS//Y7ZR51DU0v3cyJ6iBUpg2NQjMv5gDNXsJfcCsnQF?=
 =?us-ascii?Q?q59ibLlx93Bqh9xCeIJIJB1nrWrEbM8g3suKRbUIdeyYoKX93jS5fGrHXHhs?=
 =?us-ascii?Q?B3xAF0O5iNXfcxr2ZTya/7W6ZOpD5VNZtElkZeg3sxAPIzz6T8vYUgdL3aM3?=
 =?us-ascii?Q?kdnkSixwLYjFeWXWf/kWn8gp4MbJO8eIE4tVCV9bf/Cjc6GZ7K1m/tIf0xZu?=
 =?us-ascii?Q?W4TSyAZ+eZLJ5jBAqObXdxkHKS3eIL9DqzNTteeyLOeaQYigHskOSbI4kHJj?=
 =?us-ascii?Q?WzHpay8jOaZZCrwqygomen/Y7OKmNzxr2Z5mf4ZrwZrF4LwMLhmWxR9nuJCk?=
 =?us-ascii?Q?LV/WfKo0g1I/+XzBJkhRpdrV1aF/n3QZpfrITGmhMfUYXQWrcaxahW+eLNY2?=
 =?us-ascii?Q?B4TASjKHI6yv26+v5lIXCQlqmfCzrP3crAR++vPLipkb2YxWZ90yxzAcQBqV?=
 =?us-ascii?Q?iseUdScsrzZkKVcQIRYKdb+agBX3DXIh66gOw4RTDiTfWMzyy95rQigdu22u?=
 =?us-ascii?Q?S4Qi0/B/Smh2a12/VFK1tA07WRHDCEGiCpJXdPD/nJXElmphSJ3lJJHgYtB3?=
 =?us-ascii?Q?mVRutcRLEjIrLHBuogV/39SIJcWtVKZH5QYvQFuSddGMxsBNDPyjRpyrh4WY?=
 =?us-ascii?Q?nshZQeDshtbD0yOveS7Gtdr0C/HpiUUNb3Zc+5zkW0tjxq5IHmN3nFC5mpiy?=
 =?us-ascii?Q?ddP7YEgPPuwy8TKsKbJ6QOHcNHzBqllMkEh6IS041YF/NA6wS32Q0AjDyivN?=
 =?us-ascii?Q?k++cBlVJs2CXi7i86Qu2NQpjYAeFmi/DzfJRLm9psb8VJtOjzemMwE1rHYG4?=
 =?us-ascii?Q?3cdyjbRMgsPUf2VrAJhW+Iw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a425921-65b6-4ebd-686a-08dac0bf1364
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 12:53:32.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqLY9SkOX33gh+gv6/UIIYsBoqC4icxs/a4aLekGVjLujDx8Y3ZhU/8jiUNj+UXKYE6giYaYRN5TrL9JzKxbftT/tf41JtJ11a+XGp9UoOQrL5YxcAaRk63RiKVUh0BI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 12:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172839

Hi Benjamin,

On 11/7/22 13:37, Livius wrote:
> From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
>=20
> Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
> ---
>   meta/classes-recipe/image_types.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index f70c71b9d4..ae00728a74 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -61,7 +61,7 @@ ZIP_COMPRESSION_LEVEL ?=3D "-9"
>  =20
>   7ZIP_COMPRESSION_LEVEL ?=3D "9"
>   7ZIP_COMPRESSION_METHOD ?=3D "BZip2"
> -7ZIP_EXTENSION ?=3D "zip"
> +7ZIP_EXTENSION ?=3D "7z"
>  =20

We're almost there :)

There's no need for a second commit since the issue is introduced in=20
your first commit. Instead, you should squash them together so the issue=20
does not exist in the first place.

You can do so by doing:
git reset --soft HEAD^
git commit --amend --no-edit

This can also be done via git rebase:
git rebase --interactive HEAD^^

then modify "pick" for "squash" for the last commit, save and exit.=20
You'll be prompted for commit log modification while rebasing, save and=20
exit after your changes have been made (if any necessary).

You should only have one commit left, the first one, with the=20
7ZIP_EXTENSION fix applied.

Don't forget to send as a v3.

Cheers,
Quentin

