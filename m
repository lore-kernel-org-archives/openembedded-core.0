Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F56DC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 13:09:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.63])
 by mx.groups.io with SMTP id smtpd.web10.11350.1738760950172690651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 05:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Gjok8trh;
 spf=pass (domain: cherry.de, ip: 52.101.65.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em7EsTJIIDDqiShOafPpL0HhUtWqS4cxKUzBsYEUiGZOA//sA7Pc0e7YvBJ7TcXz6O8mljVmLp2SMHMLPg3gBLNlZhYZFPcmNrRgmcrIZfAf/rVaYKLj9CfLR04orte3pgnAUL1DM0+q/S8Rkz1YgFo5zB1S3K/ljhhu/aH9t2afzXIF42ugyNxqaxHGxnVCXmHsv0qFq13jlRBv0AZMejLuLYn0Ict7KsnuxeKrPV+PWwidlymEj76NqLFOygFt1c7mYxJ2ytmlxNcTl33PswaKFs0YjJtFvzbESA0I1bzPwkDnwbLnq+q3OrQifJlC/n5ryE06LvXwGNkjx5FjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpZKPO0Ko3/czVPFW2CG7W+7zrfLahFwP42md/oK1Q8=;
 b=hDH/6PuDc+DgU+ou7TbWm0kv1zcwwOjCt9yy/ZDodXZJdF3+dHHAIE3HAE/BVnJsqly9kzaGFxro5Lhx0jydgrC8Uiv+KKb604I+sXXbnRNaiRkAwUzVZT00BxvRMMnGLOH/anHSgConxvGKtqCx/m+jOWEiCAhMY5uo5o9tCsT6bi9UxsQglzRousNLoaacQLiMsenqimT+Gcei4GGgxwhRobwQbnrBgWxvxaA1Piki5Qxpcv2AMQzOvaGj007Zm3eHAMODn/sJUdONpGO7lMhdP+Y96nw7bQelOgkHiSTmqL/MGu1Y4xyp6IkBpUi7+PHIVHAhOcuHT7QHT5umOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpZKPO0Ko3/czVPFW2CG7W+7zrfLahFwP42md/oK1Q8=;
 b=Gjok8trhi4uOyGtgnlZo4lif1QG3jmCvviYDz10yt1762f0xlZTOZOoQ57WgFmN6UZm6bHhp6xRwPIXQtLkFdvyBmLTOYK/LNkRlhALrWDdh1r0BSFtu5Vz6czJTPA5ByYOwcA4nIRqE40mhjO6DEHNqmeKio9OUeev1ZHCOx4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9949.eurprd04.prod.outlook.com (2603:10a6:150:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 13:09:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 13:09:05 +0000
Message-ID: <5691d776-ffd7-4dbf-b801-f6b66c022dd6@cherry.de>
Date: Wed, 5 Feb 2025 14:09:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] add basic b4 config file
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
References: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
 <20250203-b4-support-v2-1-848008ad29ea@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250203-b4-support-v2-1-848008ad29ea@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P194CA0051.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::40) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: c13dd925-4330-4c58-0661-08dd45e64458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDdmb2Vnays2RVVlbEZmNFBEVDdQZGc3TmFGTDhxeEJvbXpHdE5QMXRWZWk3?=
 =?utf-8?B?SklhaTVMVUhNbGkzWG9BamgyaTBHcWNhcjlMQkZsejQzWkxrL2VrV2NycDVh?=
 =?utf-8?B?c2hIYm4zYjlnKy9ib3BYOTV2U0RVTXF5WnpTblFkUTVNMnJlMFpUektFZzB5?=
 =?utf-8?B?T3dyKzhwUVhoM0NDNkZyandueC8zaXhZdWo2RUVtNEoxRS9nNE5iUFRRNWto?=
 =?utf-8?B?SWlwL0kvUVc1SlFWR1JGTFgzeGI3ZTZUcDZxRVlBbzBvdnNMZzE4b25WTDFZ?=
 =?utf-8?B?d3pmaml1S24rWm9MaCtva25teVRPT3ErWnFZSWtyN1g3aWt6bG9xeFFMcGpY?=
 =?utf-8?B?UUZoS3pBdFloMElmdnpFaG0vSkF5cWZxS1gzM2pVZ1lkbmFJdWRjT3FNN3Bk?=
 =?utf-8?B?dG5hMlc5VHMrQVFkNmd6QjlQVmptbm5QaVNwYmJGOW1BcnQzT3lJTkd4SlJN?=
 =?utf-8?B?WFU2QTR0WWhNNmhjNmlsckRnNmhzR0NkcHhReHYwWlZHZHVOL1k0SlpoelRs?=
 =?utf-8?B?VDNZMUFVdGdKOXVYZ3JZL01pdjFUVnBjY25XY2hycWZLYkxoTXJBd0dEdW9G?=
 =?utf-8?B?b3NGdXhFVUZHZ3BvV0p5SDhpUVNBbDF3eXFBWGlLM1hHR2N6amJ0aWtZbnRS?=
 =?utf-8?B?Y3IrTk03ZWI5SkpKNTJ6VHA0MHVWTzVuc2ZFZnpqcTQ1WGgyRldUTnl2YkhJ?=
 =?utf-8?B?Zy8zL2g1UmFRdjE5dU11QzE2dWNXdVlmTDNXRzdmeFlNQjlYRUt5TWtSa3Yv?=
 =?utf-8?B?SzV3S2hWVzRLSm5iMFJYYjR1R3ltV0FjeGx6QWN6MkljSE1ldHFkdi9DM29s?=
 =?utf-8?B?aE1tSGFDR0NlTHZIaW16Q1NKTzA1UGJmQ1NpSFBVRndSRWtjeThlVnhrdno4?=
 =?utf-8?B?cU9yNHVKOVR2U0M1QW5PVk8rV3hnNWs4eEppZXgxdVdRTUxVb3Y0Y1RNVmIv?=
 =?utf-8?B?cDZlOFNLWElnYzlzS01jMlV0UzJ2M2lzR0Y0eGdtc1hMUE1iZWtOSHY5WUF0?=
 =?utf-8?B?NnJWdzZSaVFFbEp5TWRWb2VteG5FRXJ6TDB0NjQ2ZXppaWJXS1kwaUFWc3FB?=
 =?utf-8?B?OXpHbUF6WUpDek53WTZlYmJZK1V2SHhTM2M4Z21JRkdjZlk5S0luNHh5VW1B?=
 =?utf-8?B?V0theE9BalRHOGpjckhqU01VWjNaa1RETGRzRWRpUEt3K2xCdGtVTEZQNXhv?=
 =?utf-8?B?c2dGZDY2NUtrZ2wwZWU3c0oyYjBNamYvOHVZajRPb0NZUVRKNFpnaWVHZTRs?=
 =?utf-8?B?Y1hTWkpJNXE4REZaSU1udDdyNThoMk1PREY1V3dMM3JuUDBJWFJvc0ZaWGU0?=
 =?utf-8?B?QnM0dXJUTGp3ZUxvUzZMTndXdXN4VlBuOXp3SWpQelowNGV0N2RCM2tCTW5p?=
 =?utf-8?B?VG95VmN1QktPV0pmQ0RxSjRRZFp1ZXdoMWUwZ2JCRVByNjNWZDJQTXpCREMz?=
 =?utf-8?B?ZHpCWjB4eTJLeTRkK254N0FEeFNOemMzUkp5UndCTXY0ZWo5UmVPcGhZcStx?=
 =?utf-8?B?Y2xMdFByUjJGMUpZVUVwVWNxU2E4QWozZ3BBbFRJam1yTjI5Zm5MWXRpVTZ3?=
 =?utf-8?B?VWVaMUFvaWlmN3RYWFlLcVBJMCtkakhaaUJuVVFld2cvYTNTeDRuUmRnSTh5?=
 =?utf-8?B?YXQ0TGZ1aEJtODBJaERNUEk1SDkzZ01tYTdJeUh3TVc2STQ4Qnl5MGJmZlRI?=
 =?utf-8?B?SnlrSXRBaDVnQml5ZXNGd1FTc2ExRVVmTUN5S243UFJRdERvSU5zYUJUWlJq?=
 =?utf-8?B?alkyMVYrM1ZTOXQvb1JpMVloRmdNbVVpaklpQUx0dGQySmptL3dUZEIzRFpD?=
 =?utf-8?B?SE1wQ3A0bnp0cGFTajUwUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFpYV2dYeWtKVndYZGkxLy9uYkRTN1ZSUWViZjZXSGZYdGZIL09BT3NiekU5?=
 =?utf-8?B?MGFZUmF1OEZ1Zm9wcVMyMTIrSkZYdmRRNUlHSmx2a1ZmeE1naHliMUZSWWg3?=
 =?utf-8?B?YXNkNXRRQ0FxbzdTKytDZTVyOFVvejlQNERhV1dqK1BGcTRvUHIrRm9ERFQx?=
 =?utf-8?B?Y0xzZnVrdkk2QkhsakVHMkRETHZhTkNKMGwwZHd4V2p6NWxYcHNpSXVzWGFt?=
 =?utf-8?B?UnlTbWZwS2FNdjV0VmwzN3g2b004cDRxaXFNVTdTd0gxeGZmWUxJOUFtNTRw?=
 =?utf-8?B?bHNRbjRVMXhzZWgreUgreWtxd0tZdWdsVnVqRk5HNmNkZ3Bhd0JkTFc0dW56?=
 =?utf-8?B?S2ZxUm1ybEg5bVUzRG9IU3E1SUpoc1FOSjFrdGlsaDJreW5Yc0kyNUdKYUtt?=
 =?utf-8?B?QWNneTgvSWlqOTlDSXB2bmxhcXZVRS9Da3QyTVRWUnc4UGV6dWNKTmFXNk9E?=
 =?utf-8?B?UkZjRHpLalZLeDA3T29jU3BHcGFkZWNTWExxN0Q2RnJ6OUE0OFB3bk5HQjVa?=
 =?utf-8?B?Q0hhSm9XRE5EVk1aczJBdDEycmVBcW9ORVQrOTVUK2I0LzVGSUpIUFFONzZa?=
 =?utf-8?B?NmVyTFBQVmRNbTl3MnBzVXBNbEZOeHVuTE51NzVwTG5VaWdKRXVoSW9rTmFJ?=
 =?utf-8?B?TkFzYWlLRDJ1S0ZhL0ZTY21ndGlXVEJ5cEdKVi9OY2d1Wk1pQzVHY0hVSXpu?=
 =?utf-8?B?UmJTZnFqWmd1QkFxNEZ2bE5WejdDY2p1M3hocWJ6M0RQb2hSV2lrYkh4eE12?=
 =?utf-8?B?YkRwQVNSbGlmdFhuZmJxYmxWS1F6L0dhSXJySXJQaHVOemptU3dKZlBLT1RC?=
 =?utf-8?B?bFpRZnF4YUdxSUZiNmoxTXN0VWtPT3c1UGFRY2E3UEF2Z1huY1ZmNkVHM0w2?=
 =?utf-8?B?c29iaC9YOHZFLzNyU2RkTWt6d2lKM1lJLzk2eUxrZ2pOMWJOZVZaRUxwQytB?=
 =?utf-8?B?UnFienRFUENaVG1JdktRekxCVXp1eDRuUjdXdjM4RVpCOHZUaEpydGhyek1Q?=
 =?utf-8?B?bHJWUm9aK1dDZEtxUzd1WjNaK3Zrbm91YWNWbzVCclIxRVNKemd2RG40M3Fa?=
 =?utf-8?B?NTd6ZEVSVklhalpaRzh0Skx3b2krY201N1F0aEYxajRaSG9EMTNaMEhzRVlh?=
 =?utf-8?B?ZG1oQ2dRVDEzdlNMSHlEalpmSSsxa1JhU2tJMFJVYjJTdy9QVy9NUUZKeUx6?=
 =?utf-8?B?SnAydlZoc3Zlai9KLzJNNWxJNk1rd2pDKzBQenQzMGxHSjMzMlQvUXVLdExU?=
 =?utf-8?B?eFNndWtITW0xUHBWRURJanNSQ0N4RGNEMjJscXRKUXR6TDFwS0hSd01LOEor?=
 =?utf-8?B?T09LN0IvNlcralc2YWl3TnVDTy94c0VkUnlOeThlSWMzY2hZL1FFQ00yRUt5?=
 =?utf-8?B?REZGbnMrQ2tzM2VPYjBWQjM5cSt3ZXlka0lRWGdCQWJ5bE1YallpVlZmZGZK?=
 =?utf-8?B?OVh6RjY4cmlSOHJFL1YxSTlaYU9HQktrWTlscGdNbEtXMW53TUgzL1NPVVYr?=
 =?utf-8?B?Qm5USFErNmNXd1RDMmNVVldIalNlU2wrQlUzSHpEcmpsSEFlUUs4ZVFha211?=
 =?utf-8?B?WGFveklZc3UyYVprUUlXM2RuLzhxcG52UmRjRFVuK2pYRHJCWVlmcWpZS1dH?=
 =?utf-8?B?S2xsSWRWc2FiTVphelVOTVlsbkg0RHIxS21hZ044TWJyaTFBelBneU41Z1JN?=
 =?utf-8?B?NjBZQlV4NHdRQ3dyNUNRN0N1eWh5c2dTd29rUWV5Rnh3bXVUK0ZweGRjdERr?=
 =?utf-8?B?WTRmVm1qVlZNQjljb2p0cEdjMEJmckhsRzZxZ2g4enBWZWwzMENMZUVaYjNK?=
 =?utf-8?B?WkdXcnRWZ0FnK1VmQmlRaWVhSUh2UzdkSmNqdE0vWGFEU1FqUjBNODc3NU5y?=
 =?utf-8?B?aDR6NFdyZmlrQlR1bVl6T1c3Y0VlMjRmUEtFYk1nekl1dEt0elpiL3dlQVZk?=
 =?utf-8?B?c1cxU2xBTmQrVTVLeHBURHdkTkNqMndYeGZWdmJPNkgzNjlzL1RrV25LclpO?=
 =?utf-8?B?aXVrUURWbllITjdtakVJdTNjNkxuK0xYdms0a1p3N1NZSmV0ZWVWS2VWRDRI?=
 =?utf-8?B?VCtnd1p6cU5TT1F6aENaWnhMWmpha004YXh1bSt5OGE3YUt3d2ZudncwMG1J?=
 =?utf-8?B?bUppb3ZYS210VWdCSmVTMGZ5Z2pVMFhFZWZ6RVFUUm9KTkpJalBqaFVYUDVV?=
 =?utf-8?Q?YoXFe5mT4QJGELB6ZJxyDlY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c13dd925-4330-4c58-0661-08dd45e64458
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:09:04.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMkTPJdhq708wQTfhiWoV5UpuoDq20+DyTzLUGdZTfyCA74aFd9r9TxZUlD6CQsvuswhD3HB80mwfyhRrrIkYNcjBUbDGoKmFOz2I6ArA20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 13:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210847

Hi all,

On 2/3/25 4:17 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> b4[1] is a very nice tool for mail-based contribution. A config[2] file
> exists to set up a few defaults. We can use it to set the Cc recipients
> to always add, in our case the mailing list.
> 
> Because we do not have anything to check for now, disable needs-checking
> so patches can be sent without running b4 prep --check. The
> mid-term/long-term plan is to use patchtest locally.
> 
> Because we do not have any auto-to-cc support (and the implicit one
> using scripts/get_maintainer.pl cannot work for us), also disable
> needs-auto-to-cc so patches can be sent without running b4 prep
> --auto-to-cc.
> 
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   .b4-config | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000000000000000000000000000000000000..8ec5ddd91e1da05f27a53ff6f3d7351317461859
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,3 @@
> +[b4]
> +  send-series-cc = openembedded-core@lists.openembedded.org

Messed up here and should be send-series-to instead according to our 
README.md. Same remark applies to all other b4 patches sent to YP/OE. 
I'll leave a few more days for feedback and send a new version to tackle 
that oversight.

Cheers,
Quentin

