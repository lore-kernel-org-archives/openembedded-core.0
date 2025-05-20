Return-Path: <fhoerni@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E912C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 07:54:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.117])
 by mx.groups.io with SMTP id smtpd.web11.15836.1747727650349908187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 00:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=sVosQMnT;
 spf=pass (domain: witekio.com, ip: 40.107.21.117, mailfrom: fhoerni@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPKtKLa9xu7jceB9tDPOWTFIP8FPORcWbOWrkvqb+islSjk58p0VYpW5PVTxww326MjbUaKPacmO7tPZ6PTZt0X+LBfyN20JEdJFmFqUhrc1eFuDqm90GhJU9DWUYCzrdhxOExWlU1vhe9b4DxOM2lSGolHnR+ERROpLzL6vNQNvhJDsvMbu38jEuUuRb4KiAaQWXF2bZAGR4JNtzVFL42p7n10oj8nMGeDmKn58Phm36ls69VMi5SvGJZ6W/zU20w0FZOmmMX46RYgDNvY5D35VfQ7dudn5D8mYy6pwfcMdVnrSkJ/dCznA0pfEIqsN6JSRZTZAzmfVs3W21qNUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl3my/PbJbSD74eAJ47ToGjeSMNyjU2iS6e0j0oWsI0=;
 b=ii+hO+rEOElHP2bx+N5/I+uqDFLFmiOL13Ty8MhnuRyjKMhTQ5Ohd7FtrvyeIHYvvZaAdPpEFOMUJkPJfkQPepA7nr/UokYimBjx6T60ofo56x+KiiGYnN8TllQ7pr5DVnBJjB/KxaxZScq+EFUGzMSUQGjmpBVGAdrWoUzG8saO0rnT0h6icbDrVr3VB4pZqSWOricfUPBgGpGjTZwCakKaU0LlW6OCDaZINStlXrJXUqMSD3DDZU7BN/EIAaaPh330hlxJb4JQUrMTXbpyq/3YsfRmL5ivhuL6DILrRRvY6go7MZyCqBk2JGyGBPlXWE/R7jcq400Eh59nKLJ4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl3my/PbJbSD74eAJ47ToGjeSMNyjU2iS6e0j0oWsI0=;
 b=sVosQMnTVpJXP5FDvzDDbIMOp25QZC+a+E/0IHsw6ivV2TB4Yx1mUq00I8nYMok67XKxId/jjevphT38EQnnc2xLfyiADAtPAY66AxjauE9n9XCYTtNMk+eMBy2slnKcp5ngIciFhfHisnntzUfa2V86BsjC5NPinczFxmbM3ztYommSiVviIwQGOmJAGOJV/Z5AGrBEANU+Xcmj9wxFPQzgBjNhnE4d4bUv3aTlJIDZSKSjcnNgcev5UZ7sMdE+KJmdVwJ5D3d9R6LJjB9XNAFgCwt1Eu7zy082iy/FHPPPlTBW1mJEF7mzWbjr5r9dk2cmTrh0XrUcdj/KRPcTiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:359::22)
 by PR3P192MB0863.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 07:54:06 +0000
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14]) by PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 07:54:05 +0000
From: fhoerni.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Frederic Hoerni <fhoerni@witekio.com>
Subject: [PATCH 0/2] image_types_wic: fix dependencies on wks files
Date: Tue, 20 May 2025 09:53:23 +0200
Message-ID: <20250520075325.64756-1-fhoerni.opensource@witekio.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::33) To PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:359::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP192MB2225:EE_|PR3P192MB0863:EE_
X-MS-Office365-Filtering-Correlation-Id: 0343e695-c6f6-4a77-9d33-08dd97737df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cyaND6saSjSzrbenfnbfucAFsMzH1KaIRFX9Z+GKDogw6MsB36U5ymjm+Zq/?=
 =?us-ascii?Q?4p1F6A72yZ9o8ZdwQuW3bWejkTSlfH9vNj765wBXKt2E/hAerkqnq6l4H5/h?=
 =?us-ascii?Q?5Cdl7jTQ4cTWTgjZVgbGqMOp/YZ7WTxmC6HGzjwi0oHjfUg9ila0Z4Z+I1GG?=
 =?us-ascii?Q?QJWMiQAM+59d2zxeBu3i89XZB0obf53tZQ5yEMjzOI7EKKSl3ldt2FQSNDBe?=
 =?us-ascii?Q?h8TBbkP+N/FKwlYyW2g9wyOJ1iJQ0LALH0+wPuCyp3Ck8mRcf43WoZfE5D1i?=
 =?us-ascii?Q?i6PAsDPWv7zqe8UY1H/HDATW7sbJOfG9Yd6KC4haRwORfcTkQEoO3bwYl4HB?=
 =?us-ascii?Q?9i46K33Uwd6VDivt2Ie5qRBeEhqcB4oiyZpFtrcZec98iM9muaRD+Gi9Jymk?=
 =?us-ascii?Q?E8IHxmGj8U6lAnGWhz2ob9sw4nYF9Oy0eOlc6GMzwgxRhLPUnFhUjVyzRdnz?=
 =?us-ascii?Q?cIW9PxJGHMFI2U1g2VPl/Ycv0oQvhD9jEdymuLIqt0EM11vrj+FTxcQZfmGm?=
 =?us-ascii?Q?Khqes39fA2iqpNvnhYF5+Quqhs6EkvnYFcZ5XiMW0pJlDkk17BrBV+kkre5j?=
 =?us-ascii?Q?loclaxwoWwemVvEVvy1jjrDNxjF6vTHv1Mmf88x24i8C3Kb5/TDZhqIO1ezF?=
 =?us-ascii?Q?yk79LEnCm2S6jhRNuVaI3+2eJiVxhkwgfNinNNHSqR3olMbGnNNCp8D/Ijii?=
 =?us-ascii?Q?EU3GiRWjM/vFjKj88DIpz+atjKMEvaPNYajPUKvojUO9dEWnn4ysZCB5Y0uj?=
 =?us-ascii?Q?IWmsdaznU7qj0n5rOHAkkd9V3Y93vAtA24XCaQsde1Nrs2nzMYv3EsI/9RWw?=
 =?us-ascii?Q?nCaAJp7vLQ1mTv+g6b6DwJIxcyEZW8ceGWGmKMuqOuKKjUFDlOmKM49qEFOz?=
 =?us-ascii?Q?RzMSCuMRr2pYfc7ztPkDovfPMoEdinF4zWJfJYh+R4lftYTPNJOIU0RZKmdT?=
 =?us-ascii?Q?yErRPiiIzmuN2Oek1+mekLaHf+QBHzA2LpmyVpeJ5JC6f1E/l5WV+z+VOO/y?=
 =?us-ascii?Q?W3lkuzxJeLD44I/mX36qEfYdnmGv2iyGREWN1buZ5syVayhOKXsFoU0t1Cez?=
 =?us-ascii?Q?9Zu/5B7TlzybUtqKFwmD+pA8pk3w5dtdsPI0pRLXhg8MnZrgbIwm+Vc8D1Vp?=
 =?us-ascii?Q?zDPJ9//G8cWfJp5gfO80dozCsrCSLeMu/NdIPPsH5UmPwDD6Sh6uHcFrjs9I?=
 =?us-ascii?Q?GvrxA+j+dqsCzOR+mMTk5BH79e0uf7dQejHBbv5k1kgtp2/Ya/OAS7LucjGV?=
 =?us-ascii?Q?8IKzlIw+lUAbYrLrEnl+ftVGXt8jSj5G7SlUmy96GzLaYH+RrcLDqQl5eE/f?=
 =?us-ascii?Q?3yBvDf/AEJS932eXWsqI7F0YJS0iBooktJf7BSC118mDtDCZQkOdPOkd3D0W?=
 =?us-ascii?Q?3H7vPufpIRflqhVul1OiGswuxT4MOcFbkDFRWNyR5slHEpPuGX9mt8aNrLJy?=
 =?us-ascii?Q?yhIieCcg7TY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP192MB2225.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zbe2x1DR8B6KMywKCyG/BqLG5yhyrPFmgLGaJbTebUPRP7ivZSqzu01fu2yG?=
 =?us-ascii?Q?qUqW9lBw9TUUwbIxR2T+Tm5FoAeI0Ly+Sm4kpIN4XFZnGMc0oM0XGKv7RBPs?=
 =?us-ascii?Q?4ZAMYvDmnmBCLcJ0vR3p7EcZaPjMJ3YXCR8Cl7k05duh9m3+d8WXqDUVvB7b?=
 =?us-ascii?Q?4TOqdf0jGWshp+IIeA7SJCCHNATvnOOT+mxh+KRAph+HDBlhznTmdNm8c0ta?=
 =?us-ascii?Q?8rkCHEOyrEpoJhClX31wqydyhzhU15Uq6wVk+XvP+JkXE99PJX1M55qfTfEg?=
 =?us-ascii?Q?iRXbs0aRdIMtGZrYWZQ+lskaebRqfAkhOClbuRaBu20nqcfjyblRjzpGXo+v?=
 =?us-ascii?Q?r9Q4i3WmhC3S9Ty9E0zZ2EiHs7hjQ9p+486ObMpjKeQP/CBp+K5m6q4bCKtA?=
 =?us-ascii?Q?lLSz+iMkzS6D2VpAf5Oz50Y1C1IazTqnNor3k70aNc+hXwQSNLiqTDsyJtq7?=
 =?us-ascii?Q?OAkvStBwRbY0Rl4V4qBiwHOppn8JGy1GxXwDmbBP+7Dx+sd8BYt6D9O07heC?=
 =?us-ascii?Q?arYtFtuGFx1wjR1lwquALKWN58XKfr/0BkCOOcEVWxIDqye88vy4JvAhq44N?=
 =?us-ascii?Q?TgE34mnRlEWD+7rUlMM9S0LV6meRG4NJOMiUc96ISQZbJkKDDNVVkoJXd9rv?=
 =?us-ascii?Q?9dPC2nfKjSJ3ywsznAUfVP23EofinKbhwFEKfm4vIYc4gCbjd8Q4BPoZPuTo?=
 =?us-ascii?Q?FeMyqrlTH5dJivMgs+ETbIzGPclWhnBh4QmyfM31Alc9v9z1Mjkz9iVxWa7q?=
 =?us-ascii?Q?xN+jNrA6vmnlw6YtFRuiRwMt00w+sM2JjckqyK+0MsGmHDDuqn/qeSwEjXYL?=
 =?us-ascii?Q?lww0a9X58oN3SdTO9yUvgU9P+THup4/MVW+/wisAE3vptjrwKsYe8SOc+Vll?=
 =?us-ascii?Q?8oDn+p1FnLDVQOzoawMHGA9RnNaHI5a14W8DhQOO2BBBJ6/+Q9LLVvDIXwMD?=
 =?us-ascii?Q?Zo+f1QNoo5v1SxsdJ4rrImjZLBUtcYcdetHPHSw8ESamycigxgkrrkcdgJzj?=
 =?us-ascii?Q?tH7qIEhbAqKf5ZLIxLqdKK5Qh3BzUP4gAC8/XuFCpbsLKVmP0OyIYzCIKTgY?=
 =?us-ascii?Q?Wql49CEu0G2StCXy+H9JI4jeO0F2y/P5WFrTQa1lDApzA92zJHXUmr7XptNp?=
 =?us-ascii?Q?GuVI33roT1+uSLHaCVsmAA+D/1DNsWyayLpHL6zZ3LQBEKW9e0VYbkeQN9Dd?=
 =?us-ascii?Q?Madawf7YCUA/VdlB+bFON6C/0LU6UVjm8krI+spN76b7FN6+Ti+9vjV/S1BW?=
 =?us-ascii?Q?BDK+Bo8ClP7i8UWdToRJAp03Som1hKzrJOdg3MIG2iaiktudKttd2zKiJA4m?=
 =?us-ascii?Q?rdOChh20x3ZOcUGcliCn1UaGbJQ22UKmxT2c/C7wC6FDkRI3BbIsM2LzOZ7v?=
 =?us-ascii?Q?9uJvpivkUCmx6R9y7snqefQN977avwVBPwhPTtx5UmDMDuCGRxR1dyvNspn4?=
 =?us-ascii?Q?3ob0s3qIPuax/IFKknedQcfuONB3pUyCRSSY6vMfl0hejMy2Azs1fGcHJW7E?=
 =?us-ascii?Q?Wtr5xl265lRGH27Xrfrst191unzbOghzlbL+q6HnW3Iptxut2LKxcQhj5VYX?=
 =?us-ascii?Q?KE5pYcfvumDWYgBlRfnFSlJPX0pZdQ6DaSiUHWLS4NqTopx28Npt79iNt16v?=
 =?us-ascii?Q?I6/9G0DR0jK6bUB2LmwcCWb87p59/aYmGtsr/Mc5UZIK?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0343e695-c6f6-4a77-9d33-08dd97737df3
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 07:54:04.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQES3xeY/qmGeeRfvGDTt6fVTY0cyrz8U0ERMb3oq4ToYoAS5BtDDHOFYrV0oJ6CRVKWl+2tOsVVL1nF44jdEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216887

From: Frederic Hoerni <fhoerni@witekio.com>

This series of patches is meant to raise an issue about missing dependencie=
s on
wks(.in) files in WKS_SEARCH_PATH, and proposes a technical solution.

The issue is that adding a wks file earlier in the search path is not taken
into account automatically. See the message of the second patch to get a
detailed procedure for reproducing the issue.

I propose here to define a lib function 'search_file', that is used by
image_types_wic.bbclass but can also be used by other custom recipes.
This lib function is in meta/lib/oe/searchfile.py. Please confirm if
this is a relevant and consistent place, or if it should be grouped with
some other existing file.

In meta/lib/oe/searchfile.py, I wrote the docstring using the same formalis=
m as
in bitbake/lib/bb/utils.py (command 'which'), but I am not sure if this is
relevant and if this formalism is actually used somewhere (especially the
double-backticks).

That being said, there are still missing dependencies on files included fro=
m the
main wks file, not resolved by these patches.

Frederic Hoerni (2):
  meta/lib/oe: add searchfile.py
  image_types_wic: fix dependencies on wks files

 meta/classes-recipe/image_types_wic.bbclass | 18 +++-------
 meta/lib/oe/searchfile.py                   | 37 +++++++++++++++++++++
 2 files changed, 41 insertions(+), 14 deletions(-)
 create mode 100644 meta/lib/oe/searchfile.py

--=20
2.34.1


