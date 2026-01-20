Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4202D111B0
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13443.1768933889284820153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LgPS+yNJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K4fuoV2877846
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZvKo+6P9iOAPrSYXpXs5GsvzZCQrrJY5130rRZo5kgc=; b=
	LgPS+yNJA8ctJkP+M1wxZY54xjV6PQ+r/MUrgdNtPs+S68lEL/m42DqG+HmAzyPm
	FqwbHP/4d4jhF1sVN+dTyu0ogle2jEef+myuigv8Rxgf/stxOYaNkV+8JAbUrR65
	Dee2bUyajeLCWN9DHHHzKzWH0boAKPgnkV928cFpPzN4uM8/A2ylqoJlZ1zg6aDO
	vCVC4/byESrxDBjVZUexjHgMJp16ztpfKAB2RYhYpk7UMBcecmtL0F3xulxqXLJH
	+gTuQj61uQRVnB8gz+zSuFBA94AyZnXe4v0QDXr2dXHyxyO3+G+csE47V8HWRh4C
	63bcAZ7HhgqQssSzUuXNEQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukgy0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7aG7RY43oaNEn4FlefCQg3nmv0EzX7wRobeS5Pwiy0lIX6iGyWULVxQdM5RVopwr0v0sjrq9uG655NUlG+hFyiRjIYDB0xUbq+wKMTPzHQ5ZTHvvai+94qokVWKruOs6qlxzAnmZon+42Pw+NrUKiMyXzb4em5OS6E+LskNDBeqWLvyeQbmInuBTbvvI9/ToTuXZ013hwbmfU8V8/Ul2DtwFqgmWVfxYxQJl1n8UWeDvTW/G5y8AmLqf56egoWuDR5bzUv+XRisB4HCHK/kqYJAMc80NxuxSTwLAUYo9XKtGpamyHReWvm6ET50Ug973mu7KnH0IQ6/JDPHlJlw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvKo+6P9iOAPrSYXpXs5GsvzZCQrrJY5130rRZo5kgc=;
 b=ayH4UdYyBhp9CqUZ1xsc00em01GkHNSvrPHtVIEBFhcpPeFLrDhTKG7FdtS2wyG2hOc+KpVVH8+ANKHUqQq92TP+Hw1P0wULsIy6Gs3Vw85XA8bZZNPQeJF4u70px5mqpm4kXqLAlBreSEperq6zBJZapNY49JH65bUpbZIo9v4Ra60/BWmvoUiOgLRgn0DL2SgkHurNemSmpNeJeDxzyQ54ujaNMi/H075mgB61HZ81sfMNxnBRW6Ig9s04pKxkIjNEMaFXCSTfOTYj4DrLxZVIq18HRJwtNLp3JzinSo8DHAyCzWRzuKVzW9yzABt+mn9rceXA+mQYqD0N79Z7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:25 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 05/16] linux-yocto: enable Rust support in kernel configuration
Date: Tue, 20 Jan 2026 10:29:36 -0800
Message-ID: <20260120182947.857242-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f4b94c-4b4b-4cf2-aae9-08de58521e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cpe1gaIWYcyhfI0M2u7wnsDbHiXo8u3JbPQPydQUQAWFyTl3/Ef0g30xcH50?=
 =?us-ascii?Q?n97GGNMtc6e265cA4Nx5bOkfuVETRIITvAKJeWDU97/K9iazt9AfYSjKH8o3?=
 =?us-ascii?Q?FOTVa26JpEfv41xC7in9E8qXSihavw0qbemc5l/KbcQdwAEs9PvgaLKDcwyV?=
 =?us-ascii?Q?bCspQsmwHH4xNfeP0vnZ5G40YCoCi36PJCGvJBWRr19u7i4OHGMorjdoQL+n?=
 =?us-ascii?Q?e5sRgLjLzJOG8rFBnS50mVyyQqPKLWzcGpqSCpL2Wx487zOmUYDoqgGKt7CA?=
 =?us-ascii?Q?dyQETOmI2qMUCjoWhJ8kJwxyhCqRo+aSzoASMwFHb+M3OHIBXFf0yum2BhsG?=
 =?us-ascii?Q?Q26vjCo1miR+cFP1Tsc8KExjR03wm1VODruvt55Ezz2EUpRuWZqN9ZDNL80i?=
 =?us-ascii?Q?E85iyFQN6oPS0zeL+2LMVENXRWR0Q0JjJ4v9pLIdzjUCFpHp/S44YnDkj3BN?=
 =?us-ascii?Q?3hCz/2EZvybUJMINhm7Xvzjnb72VbpcBX34O6rbOcGLFAwSHfZBVtDOoQEGw?=
 =?us-ascii?Q?6p5wE81mfkL5QtP6fAOY2jwpVwJwmErHk3/ozGIrQ35jwCGLZn2w+k8kB4py?=
 =?us-ascii?Q?h8TsuQgCuDx2Z50Kjk/8l86UhK7fSlbf7vOeMIh1e4BAhbFzIVWO2LuGiMtq?=
 =?us-ascii?Q?clcu0nS4xWNWCAfkbSzk3WDDYakL9np53KRYhlyLVBwZDseFYszgLw0kEnAo?=
 =?us-ascii?Q?tbtW/0XvhCwTpQjjf+QctPJRjbgs/M+vznuaVHMELPGQBTfhLg5ghiczntXP?=
 =?us-ascii?Q?TP6kOn7KV47AHNpSpBitzM85cUU1/1cTqstvPOqqhx0FHZIIS0BahjhtyeaU?=
 =?us-ascii?Q?rCwFDPVqdk59U7OQMLeu6YtjKjeKqjDVUbfOUb6IS1Cx7YD8oCmGYLsZoZUs?=
 =?us-ascii?Q?VJEZWyIe8AAZM/4yqHdCMNDfcnCEBEeDid6QEXyauyRuYD/COwzfu1Qz92To?=
 =?us-ascii?Q?/LympDHakkAKT7sMh42zinPTz58Ipw7Shf4TX2OSJtU9SZHNOEtnhbzYoLEo?=
 =?us-ascii?Q?8J1ZEPIirH48/43CHf+yeSSWzcz3Z9YQBbZXZZUr+ze1HqMoMp2i2TwED+7n?=
 =?us-ascii?Q?YLzR5ve0S3skhHPX3b2t4F5rKLcKRwgbtcHgzvCACEGkqNisWZTIqV7ZipvS?=
 =?us-ascii?Q?mgulDcuroe+Mu9mQxwahHdyu+gmATjTajNgyuBZrJEFOkzJ5/eJvydkeVvyz?=
 =?us-ascii?Q?UVRlmbQ6cb9lcYhMNgTNLR/XiyqJS3UG6qnQXRWCz4gJgRTErCHIfla5aK4b?=
 =?us-ascii?Q?Gx/Brkj4vdN/zUrOHZ4Z5tRuGS0riMwrxZYSXcCiUrO/FzvWAoCGK+Acxrod?=
 =?us-ascii?Q?EaRNZRGeB/Om5bsqRUtZiPj9zS2H8NRb+CztrMTXx/il+VjzlgJU2h2WK3bg?=
 =?us-ascii?Q?pS8ap75xd3MudGsHTQ1AVyQLNim+nvTshVJuoJmZigOdAPOl2H31wbkLeLOb?=
 =?us-ascii?Q?Fn1UPCBKMPLBxjOMrZ+XJo2FMgZi+GRAgUkOzTfhkXMP9H794msIwl/CeAr6?=
 =?us-ascii?Q?PZmQw1YRtUDDE81T7kkB9qYYUVe1ZO84PHspkJxYk+pdJc8J5W1uaeHmOq5L?=
 =?us-ascii?Q?4tYePU1+SDDSs3h01BmYXYnVf25ddiaAhupZyRnJ+bX0eN7C91Gay8CBlIPE?=
 =?us-ascii?Q?FJxi8mlmTlKv2DbQF3aQF/E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?llc8Vk/Ag2JmjYyn0cdU3G2mLQMwA5eU6/ujTuX8RetFFiLr/0v+8e7hTans?=
 =?us-ascii?Q?sylvH7RGwY9O/UE/TBEzoUYqTecDURnbvgniIogx+0XeqBO4ZNYggR45wa7X?=
 =?us-ascii?Q?tTByUXMxSFmS5iRRzKldxamJAXYNFH/4xVS7ZD1qMSRJbqoBDeCZey253pst?=
 =?us-ascii?Q?4cj2CZLcoYRZYkpDdEThHh4ajv5cqb7HoUREed8+vfwm4fE2GDCDu9mCSYSA?=
 =?us-ascii?Q?6TZn41t9O1l2ItNwQX/bYnDoRpPgY91Ij7Q1FvShOJ3Iiz7VBWnngwY/zb0F?=
 =?us-ascii?Q?GTTKPay9BYGol/WwW8QvAFDe3lR8qTSj31uii1BbO0oUCXFsRaVdhODT7Pdp?=
 =?us-ascii?Q?Dqk4xc03b0nYswEaQqHNXUK+owl5F9AblMVKDCgiitt4AXphPfuPhANSYcsN?=
 =?us-ascii?Q?8YBHJC04GSTrTn9Rw4IJtQdTyyHzf3rgIL9L+xQPfWX/jEkPXYNc/kCW+I40?=
 =?us-ascii?Q?nTUhQVzfLYjgB6f/+aQoGW8iy7va1PscAJjOsdE7pXtHm6Q+H1NV3O8pLuIn?=
 =?us-ascii?Q?xA8Tz5mmgWJf8E7Dw50bD6OkMnOGlSUQi2yD3C5WvZgs3XL18HbgSwbu/CSw?=
 =?us-ascii?Q?YblKuHJYOO5vz92mxTBs6S6PceeKp1JAHQA5k+8tcddVdx71KyHflhw5oRUr?=
 =?us-ascii?Q?7K0MH6PKfeZrL/78s7Uq36uAus8NsRoMyxLdJEOyBmSS9YS+5oqUUrTjDr7t?=
 =?us-ascii?Q?0lH1o9lOuiWhv5vDQHWUQGmSsMTdTSUBfx7QNT7LheAecwvZpemGjr1W1dZ6?=
 =?us-ascii?Q?XXLuVMYToizYfKN5H+vEh7B4xEUjE0vaSEj/BYfnF/b/omR5NV4TZMkD73Ky?=
 =?us-ascii?Q?OFKsOhdHcOyNarOOYBguxJ5kFFxUDsvKC2jA9KgMhMd5sUYVjg2h1BA1/+SL?=
 =?us-ascii?Q?x9YQtFUHbzoqvz9aLPB0mgq8breohzIJubJn9UNyROyPWPUhtZ7WX9G3jxGZ?=
 =?us-ascii?Q?Vau0vJy+e2ROuW/dWqxKpOObWGZu+V/l/JfB2a7jGcrHTG4Z4gVZD1v/+zH6?=
 =?us-ascii?Q?6RWRuDKAUF01Sc2j0l6edPHZSwiTf1aiIw1ICtt527yOvzMsnbasuaxaFcn3?=
 =?us-ascii?Q?CFJ3nvtHaUnedT4j+9XTUaf1OGavId9h2ErEx2OrzR9YesrgdmXsHZtHNpSI?=
 =?us-ascii?Q?mSe7eErIlNi/G0pm5WrK2cwMv9mUF9uRVT7+Gr/N32fOerm3uAi0UyXynnSd?=
 =?us-ascii?Q?PU8ZXbsmovRKLNaoeg57yXms1480FFDypIvrQsOPKrog3+a9DTW4P/+cwSUl?=
 =?us-ascii?Q?RA8NG2hlqoH7r8ESJE00Oon47B8/F3eqr5ss20zKdxQEAYcvoNxplU6jBbjV?=
 =?us-ascii?Q?vTLLPDlR5VMYAXNiuUjG6uJmU223MjawR+iS3sewNBldfwQNUT+qHLYbI1Ji?=
 =?us-ascii?Q?Iz6wK3ouriUn2xoGIfBZe7oY3lTX2eTjoinnU1pEzDsqX1eeUy+skxEtcq4b?=
 =?us-ascii?Q?5gldtLYw/DhhaNprsxWDMs9ZfAHES3duzAFKq5sxKy1y2Smo04ZIIw+4MsQe?=
 =?us-ascii?Q?2+ZKv2hHXGdm2+ubaxDVPfwr3ViIxGBqWdy3qasOdJ5WwLp0fb4wOWFwK9nI?=
 =?us-ascii?Q?yhUS/I5vtCX5KnGwCInC4587W0xjwDRAeDaqzfKDeOY6/Gsg6Sw0Y2Ss7KB4?=
 =?us-ascii?Q?mriRbk2G7oB9qT3yzoVVQ5YO0ctVCzMVTv6VMm49fDetqJfJa4kg7rKeBDKy?=
 =?us-ascii?Q?obeqqvn5TOFBRrvY+vyiTDFJt2gkzPQTzEd9esB2gqDc6Z7bUcU4tkyVyXoY?=
 =?us-ascii?Q?dQQUklSNDZuYMotA07RdvnnAPXKDFQk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f4b94c-4b4b-4cf2-aae9-08de58521e6f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:25.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDqcwPnN2/sDrsmPseulJCVP63my6X4N2cBgRBj8meKyN2M7f3lhvEREDcCFp6pKz2Wol7dLqh3NDO1vHBD7Pz8XEXM6SQq3rfhJh0wRU/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca00 cx=c_pps
 a=n/3lZCR83+ZXmFnVV+4wNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kTXbhV1z-sDWePnKdRVX_-UwwC7MUux9
X-Proofpoint-ORIG-GUID: GWiP5rlXY9VPhcAzolMLt-Zqti2EawI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfXwYAhC6bJ60DP
 Y8f0eBilPzqS/W74kEwLyg3zQCqPSxTD9tyOzhJnmngNAB/Io8V8QG1rnigq/XxTYWzzyQkNzCc
 ruSKr0zIlrx0cDSngOEwM4AcqjfFSoIuYCZrdxVX076W78ej9yVFF7mEqsRY0clcGbzc4wXD01B
 eLEcnOnoy+khg256R0QcOOpvy8xjLcWSTxELGJZKH1SDD3m4/taXCh6h937de+ZAUlZpkbIxFwQ
 wY7Aug8vh3NugeGTm0j9ovwnQIikltkNewRv21m30ndf+rpTnuQF1IPNk2S36AwUOQlHWGY18Ha
 UnMqP4NM/bzCDkZyV354DMC8mbfYgo0uXDQurYLmkme+0F+aOQ3TT09s1anZ8oTrlpotWeaP3YH
 qZw8P76ycMR5P0ZDdqFOwAjndmUdFL5mV9Ih1myG52Jqac/Zobp8kiXuQM4f7fgyDybLvXS6G2u
 2jKDH4Zg+T5JXef1HYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229772

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..e468fdc0d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 599a3d13b8..3c2bf02221 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0


