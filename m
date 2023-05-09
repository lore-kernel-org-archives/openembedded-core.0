Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C6BC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 16:03:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.59])
 by mx.groups.io with SMTP id smtpd.web11.36976.1683648200264077779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 09:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=aidcNX+L;
 spf=pass (domain: outlook.com, ip: 40.92.73.59, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj6yLpdRy6bz9Ti9h3pa45G7u7gRMTjJL2Afj5Jp/DsgFTcxoObX4ZYJS6vEndBnRgAJ/LcXuiLsjzZjiVXxd2T+aE/XuLCw5Z3Q+q3q540FCc9Itp7OI572I/dqVr3uY1v4DotzlSqBDJGgDGekCsEDPjD4DS/rQXXjdvLkvagzEXN85xUeD86Ap2xXPeNKclihpBr9Aq8fs4Wuom9mh9UHzjJI5RngjE/FTBiRa9+ouq9vRYMV4IxRUQSDSx/cgnlsR37xXdULaEv5EWLz06pxwkVZc4zoa4EDWSECNB6IMSWtJPEpQ7psSMydd0u29wOlw75Wq8+SOJTZu3V3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUqiFv2TzVMfPkotKFjleDbwyMcOilH1t91osKAzPyk=;
 b=FY34H9UiA4zfnjIwPK3TTfUuD0r16TdZtWbMD+qcrM3+VkJ1z2wzf4vx/x4lQG00+o90/xr+RXuFM8oC5mTiW6uujvYuLWyC7lepT29NXOgwebEdkMlyF4CU1wd0/7e4DEEzCy8TACD1nP0/0tbG0CeJZgK/s/MAJp4NAJYYif1mDUaDU9OusFpm/9sa9MpccLS6Ni7aoCqheNaEWJr3ohyfFx6DG4KBswBfVd6i5GU9FkdoGhEIJ+lSq+b4ZGon522U7DRcpFMRlc9GnxPUidA2F8BkEtmIqna97zSbdL4nGxI30TgnBlwFOkRkeX9rktfFSUenOhGPxTsFh+Gyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUqiFv2TzVMfPkotKFjleDbwyMcOilH1t91osKAzPyk=;
 b=aidcNX+LnrJo7w2TdZu7DNc9F/tljQ2Bsb+bRe3jcTqzVADcFIts2iO4glIA94fNvxvwUsxPFA6rQU1OpprbRO77atqQnu1uC5eOdlm8tY2uOCJqwMP/P873pTj+xtzKcsaL63LQbu/MLGyNjQJG+E/L4VGnq28zpMMNBuU68BEXbdf/9UUGZjRJRh3y0E3mJNnteKNXhjeKvP5wt3Tknk1QmfFj9+Bd4vKN7N+t2MGpZXYYYpRpTbHAG9mR5oD3CDilx0gJXI9hNBJYFUCtw+N3zTTzLU8OWz17Rcg7NKn5gsPM9+fZ6Vhs82CAF4gLjeV8sS4VMThb5m3YJIA/Yw==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by PAVPR09MB6332.eurprd09.prod.outlook.com (2603:10a6:102:30a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 16:03:17 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::3636:cab7:8be0:b3d]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::3636:cab7:8be0:b3d%6]) with mapi id 15.20.6363.026; Tue, 9 May 2023
 16:03:17 +0000
Message-ID: 
 <PR2PR09MB31000C5F306D2D3B69099E23A8769@PR2PR09MB3100.eurprd09.prod.outlook.com>
Date: Tue, 9 May 2023 18:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Tim Orling <ticotimo@gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Subject: python3-requests broken after urlib3 update
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [+0SJGebJVS2rrcHCHAOzR3gmHRyZRm673g6/q19SEtetdTnzQvPHbxm9RAMIA4YJ]
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <d082e2d0-6ef9-a28e-eb43-f8ffe48428d4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR2PR09MB3100:EE_|PAVPR09MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 26114d21-dbb4-4f49-5bcc-08db50a6e695
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJewtNYgSO2hce6BEqvfnN65ufemh2RXpQDiIJyEvHKRDeYvfq20YBWO78c2MYYyO7LATSnnEIudIGZ4jnp87VLXXkjv57xotERNrHlWTsDPaCsWmwn62mnE1IZUpgLW6650YUbpfOre0lZIB7GbOGc4kd7tONtmGcH8dWTpTg3RCoeTgcwlxxZzFppewlbway8WqYniuWfpRo8WKy4DWb/LMsfv9cTYqGr/y9NwnZ6Ysh/dCCRAaHPC9segKGFEC8WkoxEsfucuY53aTnV0+/FyIhpixhXz8QFoC1GuYNF7YLt3OsqIWUYuh71w6DY4ZdoLOWW8J18eFVWNNkf8E8TEeQYjnbUO5DChespl8h0cCT0P41RKlSx5t+Hj1Q1SgV4S5GiJRXA8bF2PzI+37QHF5S1ZLi/UHimXFys29NI4YyKTy6cNW9d1Y8iwYAC1lHHDEGXEt63lWHMLicVcjZNzy72Vix/8/ezVNnuLYSA40KCNWKXoCO9AfzYg7nV/uO24VcLzosNQpvo4cZ4aqLoGWM99O7JmbC5Il4GFv65VjStIFFLtocNGx9oYkKrf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHpETExmY0FzS3h2Y3NmdXFhcmFra1pzM09XdHZjUTVQZHM5aFZ0WVBReHZy?=
 =?utf-8?B?RUpNdFZKVFNrNzdGMGJPdWhJQmE0bnl5bFdQRFBVN2tXdHFnRkRiTCt3bjMz?=
 =?utf-8?B?dnZMTXh2aE1rUDN5c01mYkJ4bWJIVm12N3MvYWFPazE5NE1GbTljV09FSW9G?=
 =?utf-8?B?K3RyYWsrNUNMT0tlYXhDTnNGME14dVNKZHNHQkd0WndKdU5GT0JTMkVrNkNX?=
 =?utf-8?B?YWU2SVgwSk1sL3NiTVlaMzZ2L2diWnpJaUp2QVl4UGpmK1pvbU9VOEFtVGZ2?=
 =?utf-8?B?OHBxMmNZcDJlWVlpOExGcGltczlEY3FRQ2IyRkpyOWt6SUUyUm9IK1o0MEda?=
 =?utf-8?B?TXFoVnF6UXo3MVV4Nk1QSzA2V2xoeG9Hci9ZY2tUTTg2M0JCQXMxTjRLVm83?=
 =?utf-8?B?dTNpK2ZDRktZNWlESkQvV3F0bEtGYVA0S2QvSmFpaTNwd21qcmtKdHBXM0ND?=
 =?utf-8?B?T2JUckFEa2lDR3hEd2VrbmowditXaHZDU0xVY3dZQm11SFcxK2pGWktLWXBq?=
 =?utf-8?B?bEpzL2hxdVBhOHFsNmE4V2JtN3pLSXE2d25JWnlUbTJIdjlidzZyZTBNZVNT?=
 =?utf-8?B?dGpZZTdxZVpENEdIN1JEc3NzazFKbWNoNWV1ZjJwbmVjRFIxQTNHT3VHRGpp?=
 =?utf-8?B?NWhsWWNUL0VwQm8ycndNOS81U29PRlBhQXFaMWpnbWNiU04zWVk0T2d4NlVU?=
 =?utf-8?B?ZlZqTFN4MS82RVRRU3ZCc2RRMFdROEw5aklReEwxWmlyZUJzVFMvWWJaRVln?=
 =?utf-8?B?ZEVlTVhnNFdGYVA5ZmxyK0RpTG1DSVU3bW1KbGFZOEhaVmViQlBvdXZ5Mjg2?=
 =?utf-8?B?cFpLdUZaTW85ZFhrdmozWmFybXhFaXZ2YlpNaEh2UmpROEFSOTh6L2lzSW16?=
 =?utf-8?B?WFhDUVJVWjFRLzl0SnVJSzNQang4MzBzdkx3K1UrbU5tZnB1VWJmRnVvNnda?=
 =?utf-8?B?QXdRVXJldU4rTHRXUDduVjRMbXZXOVJoSHV5MUZFbG56YUdjNmlrUzE3ZWMy?=
 =?utf-8?B?SmxqbzVBMjk5a1BCWW0wV2gvcytxb2FTNHJkczd2YnJKMjRxOGR6RkgzdXo3?=
 =?utf-8?B?Tlh4MDNhVjQ0ZU0xVmtyNjFFd3Z5YWdkbVJDMXBpZDl0Y1VkbGI4N2U4aU9y?=
 =?utf-8?B?QkhzZUR3dWpDL2dqQXFERnFEU1FYbHh6bXBHMTQ4Znp0QU1LT1g1RjhxQ09J?=
 =?utf-8?B?WWsrczBMYTQ3OWVPTU1OQTc3azQ3Z2VITzRVc0czMDJ5c2FpTlFQSmVXUFFq?=
 =?utf-8?B?THhvSGdUVGZXaEYzK0FMdmNoL2FkYTV1bU5ETk9YdkRiUlZmcVlGenVtSjJ6?=
 =?utf-8?B?SVhhT3dJU1ZDRGw1Q1ZOcE9VQkpFcmFrdDV5aVhUcnJQSGZmRDlSSUZOejZF?=
 =?utf-8?B?WkRSVE11VXlZTzcxMlZvYlIrOE9Rc3dvY1paRFJ0YmpsTmlMa0NibW1VZlA1?=
 =?utf-8?B?MGZOUThNcENUdkhGS3FWUmZJSmJVUU1hMllxd0pmRS94NjdQMUZHUlBNMUtZ?=
 =?utf-8?B?blBSU21JNHRjV0p6WUNVcWM3dUlGTGRvYU5iYzNyUmNZZHlHTGxzK0VtZEs5?=
 =?utf-8?B?dFppQk1wUkk1cXVBUkJ6dVB4eDI1ZzRvU2xZeVdQK3Bpa3pickhQS09TRVFE?=
 =?utf-8?B?RjRJcXZWcCtFY3dZZmJMQ1lVZEQ4aDdVMnRRQXV4K2I4SFpmTlM0VnJjdVZQ?=
 =?utf-8?B?UVdiZ0M4Wk1PYlhhdXNMSzFBWlVoR3ZrWHdsOVZDWlpveXZoZS9HeXhXeTNx?=
 =?utf-8?Q?SbEBCpq4myTUeJAfes=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26114d21-dbb4-4f49-5bcc-08db50a6e695
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:03:17.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR09MB6332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 16:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181048

FYI: 
https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/python?h=master-next&id=4641605c794db6648311b931fb3a36fe9e5dea56 
breaks building python3-requests (as of version 2.28.2 in master).

 > recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', 
'--disable-pip-version-check', 'wheel', '--no-deps', '-w', 
'/tmp/tmptsmcl2c1', '--quiet', 'urllib3<1.27,>=1.21.1' --> exit code 1

Tried with native variants.

An update to python3-requests 2.30.0 should fix the issue.

But I'm not sure how that could have passed CI - so someone with more 
knowledge than me of the autobuilder might want to have a look.

Regards
Konrad

