Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660EEC982DE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 16:50:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1624.1768582232422357544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 08:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kkIqu4ts;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54767fcdb5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDs7d32456705
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 16:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=lAykCLJyJK5WxnxbZgVmBx
	EmWcbpz9VS3ejadUYo3Xw=; b=kkIqu4tsgRSW3qQ/CEYldiGNyLe7mGI8TOWorw
	Ahh0D9ZfbBQWUiLLQndo4PO5Ny3YkGQSI1cHXU8+BxRljw8jLz4mz7kJjcsogaOU
	dW5CUZoFMVEM5uSVr4kbaSYSQkpkg6Vq0rhuF5h0XV3yJ1UPTcgN8p6e5VM/7bUS
	U+19ddVUGgfQhE/nadSAdbqqzNsiZaZKrp6Aa/hCy3MDC/z+3ZA7sr8U/hmjBosE
	NuDvfd9AdQzpezBOAddRFDYIcvwcuHIwv/h+bLpT1Jybw9uDCQeDG1bZYziAGDYt
	EyhQZKiLDtw0ZLNBsPbR0PpAAx5G4qmhgv+0tI+KRKM6qsIw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqddvrqph-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 16:50:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IS08WxiP37aj7h2MRbVUnV7b4F7K4en4xHWGZ8FtuJil9AU+xpZKYS41fELma6Zu7vtZc3D8LXQg/RnYEFBEY0niojCGtrGAG9bOLxaClR9qsp0+X3rD9gfFlvMOapjbAeJR0zBFjDbpb/2B2zsOPdVHKzrIuxHzCqSxrZQtauXH0qnqprj6lemsSlW9Sbjz+7xLFhGfhUvhxuXaAJX9ox6ixkB19yMuQ2mCpzURSXxKNhwLLSHpPni8egmEvOhCl6m3kFLraVCGNSETKDrA6/qraqXubeL/vcbAkXxvWss8xJ4W2uCSE5P9usfzPwNcXECKcQiymNmkwdyRBxuD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAykCLJyJK5WxnxbZgVmBxEmWcbpz9VS3ejadUYo3Xw=;
 b=ZnWPZpfEwwK5S1e80AwuKFEz1xf4JHtffNlOy7FLYlti/vdOD7G2kGwswzhLeajFIFgDuWSU25uqHNstRjIOsewS1Ci1wPgX3cfzIIFSEwhyge/hRgMMiVd8witFr8Ro4Ij57qbBpgYFOmay7g1Q52vOgcVzTKJTOHq57xmF13n2aFCfSOYyyHbqDIDjtjfSFuY0DswWGE0PWDby2NSpPrLynWiGeOY+fRy/ZCsnAuC6J++7SjpX0KH4ZZbn7HLBMsQq48evT1mKKN+gptNILMB5EB4k4uLze6CQ9c5P6PTzDYrx1W/4wc+ArcIaqsjiW5uWjbkhDsUo1w/9tmHYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA4PR11MB9010.namprd11.prod.outlook.com (2603:10b6:208:564::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:50:25 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:50:25 +0000
Content-Type: multipart/alternative;
 boundary="------------e1zZIyUCgUJLgHpQLuAVje0j"
Message-ID: <c51b3d11-0820-4538-aacc-b442c7540ae4@windriver.com>
Date: Fri, 16 Jan 2026 11:50:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
To: Ken Kurematsu <k.kurematsu@nskint.co.jp>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Ross Burton <ross.burton@arm.com>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>,
        Yoshitaka Ikeda <ikeda@nskint.co.jp>
References: <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
 <1883AE2C045A1BB3.1614991@lists.openembedded.org>
 <TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <c2a296a3-0345-4814-ae07-257440b67fef@windriver.com>
 <TYRP286MB5995B67B327F77AA92B68533DBB2A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <TYRP286MB5995A204B7B9AF877CD7B64CDB8DA@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <TYRP286MB5995A204B7B9AF877CD7B64CDB8DA@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
X-ClientProxiedBy: ZR0P278CA0100.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::15) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA4PR11MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: b1155fd2-74f0-4b61-1f02-08de551f5877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzVzVGNaMmZxRjR6cUJnRWY4c0h4SnhaUzdHMzl2dWhDVFhFd2FjWkxrdEl2?=
 =?utf-8?B?aHp5bFBUcmFXYzBKVElMU1d6cEdJUzAzdUZHcTVlcUtPcTZEaXJoazlFbzBC?=
 =?utf-8?B?ckpsZzkrTlkxV295V09rRDRidm02TTVNUzlTQVNwN1puZ3N0NmhKNGpITnk2?=
 =?utf-8?B?d0R3NEZsR08vM092T3U4T0VYeERFMzV0SEVaUlJLN2hMNjJUTjV2UGx1aFJN?=
 =?utf-8?B?RDd2RS9temdDNmdKQzJOZlJRbWFPVGMxMEtsbHJ6OXIyMDhrYmFDRlE4a3VB?=
 =?utf-8?B?SGwyVWdiTG45WGpyeTZ2M0lQZUczVHB6NGJoVDUrenFXWUI1Q2VSK0w3alU5?=
 =?utf-8?B?L2VvYm93K1pQOVdzUUp4bUo0SUd2WkkzdnpXakVjL2hYZ0FPRGwzdklKOU9C?=
 =?utf-8?B?bFoxbVJIbGlya2ZpTVlFNUtjbUJSU3pwUm1EOHRkSlBXRkJhZWc1bTBjUmpJ?=
 =?utf-8?B?aWJpaHdmMUo2QXpYcjBlUEtFSWVxUTRvb09aRmZZTUc5ZEQ1My8vQ0I4R0ow?=
 =?utf-8?B?Rmx3L0wzbzBvUXZISXRZUTQ3L3BNaWpqb21HZElZMnp1NllBUlFFM0l6aUh6?=
 =?utf-8?B?M09KenBHNVJXNFpGbU5vQ0JpMUNLZ0k5c0dQeXZqeHovSkd4bTc1bWFERVhO?=
 =?utf-8?B?eDNQTXR6eHNJR0JCUXY0RlZjVFFJUlZsdlpqeFJSY0JpQkRjSE52bGlPbVlG?=
 =?utf-8?B?RFFGK2FPSm5PYXlHTkxZcDhVUVkvTzRoM0hEMnRrQWtTQUJoYjhtNjg3SUl1?=
 =?utf-8?B?OVpFWmdETFY1bG43bm9iaFhtb0p5N0hkQkhKMjRsSVNoVmZSNVdVSW1TQzNs?=
 =?utf-8?B?Ym0rOVo5Tlg2TnNrVTl3SVNTTVhnN3FWQTAwQm80NEhVbjMxVExsUEZ2Uksr?=
 =?utf-8?B?aUFURGIzQk8zd0hMcGNqSjhNTC92R0JLN2pxUUhhUnBFY1BjTGZSVjhwTExC?=
 =?utf-8?B?MUpoc1JUVUVFUmdkWm82U2kzRVp6RU1uQmNkSE1qYUhxcnZjZW5XamFmVnZl?=
 =?utf-8?B?UU05ZkNJUVpiTXJjbmwzZFZUU0xPQzJMUGUvREtJMTlFMVYzRlpueG1pMS9S?=
 =?utf-8?B?K2lKbWFibzZDdEh0Um40YkllZmpteU1vd1NHV1BOT1JWM0RmWEZSZUlnc1hU?=
 =?utf-8?B?NUNlTEJhb0JHbDB4NmJuR243ZjVKWDhtd1NaL3FXS2FpTjEwUTNxNGJSU3pC?=
 =?utf-8?B?a1dtTHMyUE9IY0orUUExdnNmSnN5akx2dUltaE9jaHdtdzVVc3Rib0FWdWR0?=
 =?utf-8?B?cEdEMXIwL3ZrRmZXRlIxclk2RnFmUE9OUk0ySVZacUc4OXMrakl0aUdwWU9l?=
 =?utf-8?B?TEtIQkw2OU4wdldSa3lBSnBIbUsyYk5xSU1WVWlsUWVyaElUdmJNdjFFSmhO?=
 =?utf-8?B?QlVKMGh6UHJaVnZKYWlEVFZGaFFwc1k0czVPRHpSRUpGMTVtL1pFeEpZK2xh?=
 =?utf-8?B?VEl3dEVOSlh5SldyNUdZeW42Yi9QQ3QvOEEwQm42RFhwY1B6Y0M2dkl4dE1q?=
 =?utf-8?B?d0NEdU9KTDlGeTFJbWZ5aHVQM0dIMVF3eGFBbzlQUGIzSlNGWDQ4eDc1K3Zk?=
 =?utf-8?B?YUtvVlVGKzV5T215WHNmUUI4TzhBeldONkdTQkVKYVVMeG80T3h1WkNvTFFj?=
 =?utf-8?B?ZDRsYm9VZFdCdmw0VDBMMzZwdDhKV3NzR0NVdUNnVGJsenZkNktMa2NGWEIv?=
 =?utf-8?B?dzY4VDljRjlMYUpjemc4YStQV0Y1dGdmLytvMDZMUWtLSXEvbEVhcUE0eDQz?=
 =?utf-8?B?NWhNZ25CRHBFSzhJeXdmelMwZm9BQVBkcHdlQitxTS9JWWROVngxbUJwa3Bs?=
 =?utf-8?B?ZmRFRngyTGR4eDgzYmxTdzEwcVp3NVZkK2llUFd2ZzhMdDEvZmMrQ0FuYTB4?=
 =?utf-8?B?aEIxU2pPcUM3NlBJcDFseWo3RUl6SDNveUFYSytSK1FKaXZOcStTalZ2UGJ0?=
 =?utf-8?B?aWhCMWRtd0Z0VXZYM1N3UDFUemhKeEZ1cmNWZEZjeHhqRjBYSnNyMGVJU1Ja?=
 =?utf-8?B?LzZZZGF3QjZHSWthcllTZE52YndxSlh0NUlKNHhQWE96am5ZeURsRVNrcTYx?=
 =?utf-8?Q?S9mA34?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YURLN3RvTkNoTEN5NXd2Ny9MRmpnTHc2Z0RuZWJXWXBrVFlXOW1sb25vL3pI?=
 =?utf-8?B?MDZrUUo2cUFOT29ER0JOeEV3M1NiT2RoZUJmbm1pZmlpS1V5MHZEcjZRNU8x?=
 =?utf-8?B?b0d5UUsveHkrck1lMEpsWS9CbWRRd2ozbzlZWUJLOWpWZ3FjcXdWbVJTWEZl?=
 =?utf-8?B?dmU5TkdvM0NicnZlSFY2cVlieGtpbFNTTngvMTlyVGNPYmJwOXJ2QWF3bUZC?=
 =?utf-8?B?QkdzTHRmRG9lNy93RW5CcENoOUc3NkxKS2RuV0ljMWFyaWg1ejNod0VJSjBl?=
 =?utf-8?B?OGdGZytaTGZvclVNdWFZYzRieEowL2RjdVAwMVo2WU9VM0pjT0d5SFBvekly?=
 =?utf-8?B?dmUwL1EwUFl4dVQ5aHlpTDYwTjFhbTczN0l5WkozVjV4Sm1KWDdYN041azV3?=
 =?utf-8?B?WjJOa1c1U1ltOUR1WG53SGdZVTU2c1BlREhHdFRpWEdyQ2FMUjRkdThkYmdm?=
 =?utf-8?B?dnh3bU96SXJOUGg5cG5QWXV3cE8xbXVtTnc5blFtWEN6SkxmSnhSVGluTFRk?=
 =?utf-8?B?b1VKTEp5cjZ6UDRnS21PcVpReDJmTnp1ZFU3bkZxUDdDc2tXUC9tZURmVUE5?=
 =?utf-8?B?MlR3ZEl3UmpsYkZGNW1ydHFpbFk2Qkk4dytrWXpEQ1ZyR000UE9NdWpXYVJk?=
 =?utf-8?B?OGwxUnFBZUVsYXVUVFNkc3ZYd3o0SEZDUzdhYlI5R1lITlNCeGtXbXJoWHVU?=
 =?utf-8?B?dzhQbW9pNi9lbDRsbWhjdW5CTmNUZmRibWNVQmcvaXM4VFhNVGttUWppVXdP?=
 =?utf-8?B?OUV5OGxUR0pyTGM1REZkd25EVXpkTnM1U3Y4N3hYTFIyVDc1My9kVDd2MzVa?=
 =?utf-8?B?S0tVaWZRRnJGRzh3SUM4VjNoQ2RRUHhMdEs4QnNvOEVrS0hKM3JnOUlKb01h?=
 =?utf-8?B?aFEzWkFPQjhPUW05dUNYTldPdnBGa3F5ZjZEMkhySWFVbW5oeU1icVBoSXhB?=
 =?utf-8?B?N1pXWDE0M0plaDJlVHJxcUk2WDdnc3RLcWpjaE05V01VUWRSVW9EQmlTTmI3?=
 =?utf-8?B?Q3NYVUt4bUx2cFFJS0lPZDJaUTdGU2l3cG92UGdBdk1DeXJ2M0d0S1lPYmtI?=
 =?utf-8?B?dWZrTis4R2lXYmdKaEk4Y2l4THBWYjVSY2tkSDUwZUY2VnpubnF6WHhPcG12?=
 =?utf-8?B?bEowUGU4OEVROEZpTVRVbk9aUVdFMnZqY0FQSzNXK3NKRjh6ZnBnaUVNd0po?=
 =?utf-8?B?ZlVPRld0S3dPSFpmUjVRbG1NU01DcDJtNjBOamRYL0JEM2JlbGQ1ODBNMnVS?=
 =?utf-8?B?eVBuMmkrRzB0QlQ4Um5xMERoQVhZVzRSQ1N6LzFhL05WSitpQXZBMUtjakFZ?=
 =?utf-8?B?V3Bud204YXJERFhVaG5aazFzZzZFc1A0bXFkcytmMjM4dEw4RE8wV2swZW9W?=
 =?utf-8?B?VTEySmVMRTlUUitLVFM3cDd5dThWYnQyRmVGY2ZJamJpMjcvTUttbmFONEJy?=
 =?utf-8?B?Y1N5OGtyY0l5ZDd2YmdFZTVPYUh6T0l1bEFyc0kwOGdmSzBOaGVOMmpoUEN5?=
 =?utf-8?B?R2VrQTVZeDFIRUVNcEF4bzNqdlJBdHZZTFFVS0xHNnovUVg0TjU3QURWTVRu?=
 =?utf-8?B?bkdPWVVuOUVUeXRETlZrVVhjQVRvR2FnNC9WTU1rcGY2QUlaTFNCc0NjUjdy?=
 =?utf-8?B?VDc0T0hwZXJCb0NEWk5VTkIzZE5Ob2FaWnFVemtiWFpiUTQ5eTJXTTd1aDBN?=
 =?utf-8?B?dVorTjRxUGp1Z2FzSXBOSjVqVXJyQS9LbHhCQ3JHbUtLaXAyUnRad1BkUGg0?=
 =?utf-8?B?OHpiY2ZhRm1VWGlxZld6eHhHNjIvOHZ2QzFIOVdDMmtsL0ZOemRIeWJqM1Jq?=
 =?utf-8?B?VXZaTUFHeS93NlBhaEVScktRb1ZBRzVRYVF1dEtUZGI3ZG1wcVkweVlGS1Jm?=
 =?utf-8?B?ZFdGZUdLaHFXdXl3ekhqdmJQUGEvYlBsVEpTdUtNSWpCbVRJL3ZoRGZJWlRm?=
 =?utf-8?B?T0FML1VlWDhhUDkwR2tvOFIxdFZmZElKd25pKzF2Rm53VWtTY0NNTzQ3czNS?=
 =?utf-8?B?cFhIaW93dXZxRU5EeGtrb1dVUjZhZUoraTVOd0hJcnJ3dDdvd3V0NjhlV2ZJ?=
 =?utf-8?B?dzJGdmU1bHhYQUUwT3owZkZZc0hldTE5VThwZWt1Y1Vsd3JlT21BSzZjdHpB?=
 =?utf-8?B?ZDVjRE03ejlzVGpJbzBCWnJiV3pZSjJWaDY4NE9jRk9FT3JKTGJhRmx3Tkpr?=
 =?utf-8?B?Q0NZUVFMOFI5MHREUCtNcHlJUjhsbm0yVVo3WDZlOW03V0VkQkQrazIydW5i?=
 =?utf-8?B?T3B4SkYybE9SSkR3cE1qS2ZNWjFjVks3QTd5L2t3Y3QxcGpDYWRpVmt3TlZn?=
 =?utf-8?B?TjJnczVCeDNHN2NmMzhOMk9HYTFpQkI2YUx6ME9DVjZuemlnUHRNVVEybnli?=
 =?utf-8?Q?ay1sEKEQOIxcso6E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1155fd2-74f0-4b61-1f02-08de551f5877
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:50:25.2856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICA8s53vqZr+aEsvncTuLpciXp19qjJ1WAQDLU/6pvoQ/+DCe0E2k1b28jymlcO6x5ApqMMK2vd2SOrGw1QBthxCpqIj8W4JWTbVuM45Pcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9010
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMiBTYWx0ZWRfX7I04dJFxOSUF
 T1EK2BJdwWA1/kK7u9KDeUWmpLNnZr3MfblM9ggab7K1uNV15zA9KUVxqZhOO15RJCm4sbLuSOS
 RgczsDFgbxQqTODqAVxozeihfVmFVqPwdqLQSOoNKZBOWY4P+J+YcdwmtnVNqzrybIQiFCbr2TA
 ncOsWMmS5NbL4VPvzcZ/iiZ+cabeISjLPZQzH+3wtpdCpLvUQmZmn2MtdNMx3EaIFcr+kWDuN1i
 W3KP+zdVglLYFg9BuTMI//E1ZpTHFSeJjJmcCaWdipLS51VMXhfGXIOrR+HmWlD3OFxp4hlrdk9
 BPM6W+XJaTrc13bxAA3rZU/eIBTIsm0axMR/i4iDza8zHg4fO6rAhoHd1SCbPhAGuvICjTmJw1N
 lnx25bNWnRL0HlEIwazs13b+EDsxa+en1xci3XKMVx9QBSpPLii6tqmP6lP+8hJMeXfEEPmNmPs
 OUsfYV+7BPXVmlDKNgw==
X-Proofpoint-GUID: MZSRt5N3NiQtApMNlyTv7MAym_HTIFE-
X-Proofpoint-ORIG-GUID: JGXOdHiDx298215dmfoDrhfAhlFhoIqo
X-Authority-Analysis: v=2.4 cv=NqvcssdJ c=1 sm=1 tr=0 ts=696a6c57 cx=c_pps
 a=+JqGDqswvm8kVNJxtWojiw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=vmi6oJg5AAAA:8 a=WfHZuIUsAAAA:20 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=CW74JDvm4frd87rbO7oA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=3DJcHLki_5Nk-VbIstkA:9
 a=bWbtNf8xl8M26h_N:21 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ioboX4i089tB3dTPuEcW:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 16:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229551

--------------e1zZIyUCgUJLgHpQLuAVje0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60GDs7d32456705


Hi Ken,

On 2026-01-15 11:27 p.m., Ken Kurematsu wrote:
>
> Hi Randy, Ross
>
> Ping?
>
> Could you please comment on the post below?
>
FYI:
a8ddda6033=C2=A0=C2=A0 2025-12-19=C2=A0=C2=A0 libtheora: set CVE_PRODUCT

On master, merged 8 days ago:

https://git.openembedded.org/openembedded-core/commit/?id=3Da8ddda60332e2=
a3219e905c1545b5da917f855c6

I think we decided that most bugs were tracked by that name.

../Randy

> --
> Ken Kurematsu<k.kurematsu@nskint.co.jp>
>
> *From:*Ken Kurematsu <k.kurematsu@nskint.co.jp>
> *Sent:* Wednesday, December 24, 2025 12:55 PM
> *To:* randy.macleod@windriver.com;=20
> openembedded-core@lists.openembedded.org; Ross Burton=20
> <ross.burton@arm.com>
> *Cc:* Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda=20
> <ikeda@nskint.co.jp>; Ken Kurematsu <k.kurematsu@nskint.co.jp>
> *Subject:* RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
>
> Hi Randy,
>
> *From:*openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Randy=20
> MacLeod via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!fmr8c03Dewg4g-sO5zs4RWftsjbML8Q3D7lw0sPbzUH0B9a9RMJFbC6fn6aGOaUO_S-vC=
lYLLXRUdsv3E6qaTTYi2jDOYg$>
> *Sent:* Wednesday, December 24, 2025 10:48 AM
> *To:* Ken Kurematsu <k.kurematsu@nskint.co.jp>;=20
> openembedded-core@lists.openembedded.org; Ross Burton=20
> <ross.burton@arm.com>
> *Cc:* Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda=20
> <ikeda@nskint.co.jp>
> *Subject:* Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
>
> On 2025-12-22 7:05 p.m., Ken Kurematsu wrote:
>
>     Hi Randy,
>
>     Let me confirm one thing about your comment.
>
>     If I make the corrections as suggested in the comment, when I
>     retrieve CVE_PRODUCT with bitbake-getvar,
>
>     only "theora" is included, not "libtheora".
>
> I expect both libtheora and theora to be valid matches...
>
> I see.
>
>     (This is the result of an old test environment, but it was the
>     same in 1.2.0)
>
>     $ bitbake-getvar -r libtheora CVE_PRODUCT
>
>     #
>
>     # $CVE_PRODUCT [2 operations]
>
>     #=C2=A0=C2=A0 set xxx/create-spdx-2.2.bbclass:11
>
>     # [_defaultval] "${BPN}"
>
>     #=C2=A0=C2=A0 append xxx/libtheora_1.1.1.bb
>     <https://urldefense.com/v3/__http:/libtheora_1.1.1.bb__;!!AjveYdw8E=
vQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67=
Ekm6WVIz8qZmIROdM8lL0jRA$>:23
>
>     # "theora"
>
>     # pre-expansion value:
>
>     #=C2=A0=C2=A0 " theora"
>
>     CVE_PRODUCT=3D" theora"
>
> but=C2=A0 it doesn't look like that.
>
>     If libtheora should be included, I think the following correction
>     would be best. What do you think?
>
>     Sorry if I misunderstood.
>
>     CVE_PRODUCT =3D "${BPN} theora"
>
> probably not.
>
> Ummm=E2=80=A6
>
>
> I replied to your email in response to a discussion in the Yocto patch=20
> review meeting.
> IIRC, Ross Burton was the one who suggested the +=3D.
>
> It would be a good idea to attend the Yocto patch review meeting and=20
> talk to you.
> However, I'm not very good at English. Sorry.
>
> I don't often use the CVE check scripts in oe-core so I'm not sure=20
> off-hand, how to confirm
> that the BPN is the default.
>
> The default value is defined in cve-check.bbclass, which can be found=20
> at the following URL:
> https://github.com/openembedded/openembedded-core/blob/48e98a6e3fd26c41=
8902b76be8865102bd903189/meta/classes/cve-check.bbclass#L31=20
> <https://urldefense.com/v3/__https://github.com/openembedded/openembedd=
ed-core/blob/48e98a6e3fd26c418902b76be8865102bd903189/meta/classes/cve-ch=
eck.bbclass*L31__;Iw!!AjveYdw8EvQ!fmr8c03Dewg4g-sO5zs4RWftsjbML8Q3D7lw0sP=
bzUH0B9a9RMJFbC6fn6aGOaUO_S-vClYLLXRUdsv3E6qaTTYvcb6Quw$>
>
>
> Ross ?
>
> Ken, please be patient, it the winter holiday season so Ross may not=20
> reply for a week or two.
>
> Ok, I'll wait for Ross's response.
> I will also be on vacation starting next week, so the next time I can=20
> reply will be after the New Year.
>
> ../Randy
>
>     By the way, the NVD records have the following values, so I think
>     theora alone will be fine.
>
>     (itheora is a different product)
>
>     $ sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep theora
>
>     :
>
>     INSERT INTO PRODUCTS VALUES('CVE-2008-0797',
>     'itheora','itheora','1.0_rc1','=3D','','');
>
>     INSERT INTO PRODUCTS VALUES('CVE-2024-56431',
>     'xiph','theora','','','1.2.0','<');
>
>     $
>
>     Best Regards.
>
>     --
>
>     Ken Kurematsu k.kurematsu@nskint.co.jp
>     <mailto:k.kurematsu@nskint.co.jp>
>
>     *From:*openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org><openembedded-core=
@lists.openembedded.org>
>     <mailto:openembedded-core@lists.openembedded.org>*On Behalf Of
>     *Ken Kurematsu via lists.openembedded.org
>     <https://urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveY=
dw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mq=
Mu67Ekm6WVIz8qZmIROdOLXrdmwg$>
>     *Sent:* Tuesday, December 23, 2025 8:43 AM
>     *To:* Randy MacLeod <randy.macleod@windriver.com>
>     <mailto:randy.macleod@windriver.com>;
>     openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     *Cc:* Masahiro Mizutani <m.mizutani@nskint.co.jp>
>     <mailto:m.mizutani@nskint.co.jp>; Yoshitaka Ikeda
>     <ikeda@nskint.co.jp> <mailto:ikeda@nskint.co.jp>; Ken Kurematsu
>     <k.kurematsu@nskint.co.jp> <mailto:k.kurematsu@nskint.co.jp>
>     *Subject:* Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
>
>     Hi Randy,
>
>     Thank you for your review.
>
>     I will reflect your comments and post v2.
>
>     Best regards.
>
>     --
>
>     Ken Kurematsu <k.kurematsu@nskint.co.jp
>     <mailto:k.kurematsu@nskint.co.jp>>
>
>     *From:*Randy MacLeod <randy.macleod@windriver.com
>     <mailto:randy.macleod@windriver.com>>
>     *Sent:* Tuesday, December 23, 2025 3:58 AM
>     *To:* Ken Kurematsu <k.kurematsu@nskint.co.jp
>     <mailto:k.kurematsu@nskint.co.jp>>;
>     openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     *Cc:* Masahiro Mizutani <m.mizutani@nskint.co.jp
>     <mailto:m.mizutani@nskint.co.jp>>; Yoshitaka Ikeda
>     <ikeda@nskint.co.jp <mailto:ikeda@nskint.co.jp>>
>     *Subject:* Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
>
>     Hi Ken,
>
>     On 2025-12-18 11:01 p.m., Ken Kurematsu via lists.openembedded.org
>     <https://urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveY=
dw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mq=
Mu67Ekm6WVIz8qZmIROdOLXrdmwg$>
>     wrote:
>
>         In the NVD database, the product name of libtheora is theora.
>
>         This was set to ensure that cve-check works correctly.
>
>          =20
>
>         Signed-off-by: Ken Kurematsu<k.kurematsu@nskint.co.jp>
>
>         ---
>
>           meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
>
>           1 file changed, 2 insertions(+)
>
>          =20
>
>         diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.=
bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
>
>         index 04de8507fb..bacaf3aee6 100644
>
>         --- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
>
>         +++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
>
>         @@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e42=
323844fa09502b34eb1d1fece7b5f54da41fe
>
>          =20
>
>           UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+)\.(ta=
r\.gz|tgz)"
>
>          =20
>
>         +CVE_PRODUCT =3D "theora"
>
>         +
>
>      =20
>
>      From YP patch review,
>
>     Please use:
>
>     CVE_PRODUCT +=3D "theora"
>
>      =20
>
>     to catch both libtheora and theora
>
>      =20
>
>      =20
>
>     Thanks,
>
>      =20
>
>     ../Randy
>
>      =20
>
>          =20
>
>           inherit autotools pkgconfig
>
>          =20
>
>           EXTRA_OECONF =3D "--disable-examples --disable-doc"
>
>          =20
>
>          =20
>
>     --=20
>
>     # Randy MacLeod
>
>     # Wind River Linux
>
> --=20
> # Randy MacLeod
> # Wind River Linux
>  =20
> --
> Ken Kurematsu<k.kurematsu@nskint.co.jp>
>  =20


--=20
# Randy MacLeod
# Wind River Linux

--------------e1zZIyUCgUJLgHpQLuAVje0j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60GDs7d32456705

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Hi Ken,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2026-01-15 11:27 p.m., Ken Kuremats=
u
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:TYRP286MB5995A204B7B9AF877CD7B6=
4CDB8DA@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered med=
ium)">
      <style>@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}@font-face
	{font-family:"MS PGothic";}@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"MS PGothic";}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	margin:0mm;
	font-size:12.0pt;
	font-family:"MS Gothic";}span.HTML
	{mso-style-name:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D";
	font-family:"Courier New";}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style>
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;">Hi
            Randy, Ross<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;">Ping?<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN" style=3D"font-size:10.5p=
t;font-family:&quot;Yu Gothic&quot;">Could
            you please comment on the post below?</span></p>
      </div>
    </blockquote>
    FYI:<br>
    a8ddda6033&nbsp;&nbsp; 2025-12-19&nbsp;&nbsp; libtheora: set CVE_PROD=
UCT<br>
    <br>
    On master, merged 8 days ago:<br>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/openembedded-core/commit/?id=3Da8ddda60332e2a3219e905c1545b5da917f8=
55c6">https://git.openembedded.org/openembedded-core/commit/?id=3Da8ddda6=
0332e2a3219e905c1545b5da917f855c6</a><br>
    </p>
    <p>I think we decided that most bugs were tracked by that name.</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:TYRP286MB5995A204B7B9AF877CD7B6=
4CDB8DA@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;"><o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <pre>--</pre>
        <pre>Ken Kurematsu <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a></pre>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <div style=3D"border:none;border-left:solid blue 1.5pt;padding:0m=
m 0mm 0mm 4.0pt">
          <div>
            <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padd=
ing:3.0pt 0mm 0mm 0mm">
              <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b=
><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif"> Ken
                  Kurematsu <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a>
                  <br>
                  <b>Sent:</b> Wednesday, December 24, 2025 12:55 PM<br>
                  <b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>;
                  <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:op=
enembedded-core@lists.openembedded.org">openembedded-core@lists.openembed=
ded.org</a>; Ross Burton
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ross.=
burton@arm.com">&lt;ross.burton@arm.com&gt;</a><br>
                  <b>Cc:</b> Masahiro Mizutani
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:m.miz=
utani@nskint.co.jp">&lt;m.mizutani@nskint.co.jp&gt;</a>; Yoshitaka Ikeda
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ikeda=
@nskint.co.jp">&lt;ikeda@nskint.co.jp&gt;</a>; Ken Kurematsu
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:k.kur=
ematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a><br>
                  <b>Subject:</b> RE: [OE-core] [PATCH] libtheora: set
                  CVE_PRODUCT<o:p></o:p></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></=
span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:&quot;Yu Gothic&quot;">Hi
              Randy,<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
          <div>
            <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padd=
ing:3.0pt 0mm 0mm 0mm">
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fon=
t-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif=
">
                  <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">openembedde=
d-core@lists.openembedded.org</a>
                  &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">openemb=
edded-core@lists.openembedded.org</a>&gt;
                  <b>On Behalf Of </b>Randy MacLeod via <a href=3D"https:=
//urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!fmr8c=
03Dewg4g-sO5zs4RWftsjbML8Q3D7lw0sPbzUH0B9a9RMJFbC6fn6aGOaUO_S-vClYLLXRUds=
v3E6qaTTYi2jDOYg$" moz-do-not-send=3D"true">lists.openembedded.org</a><br=
>
                  <b>Sent:</b> Wednesday, December 24, 2025 10:48 AM<br>
                  <b>To:</b> Ken Kurematsu &lt;<a href=3D"mailto:k.kurema=
tsu@nskint.co.jp" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext=
">k.kurematsu@nskint.co.jp</a>&gt;;
                  <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">openembedde=
d-core@lists.openembedded.org</a>;
                  Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ross.burton@arm.=
com</a>&gt;<br>
                  <b>Cc:</b> Masahiro Mizutani &lt;<a href=3D"mailto:m.mi=
zutani@nskint.co.jp" moz-do-not-send=3D"true" class=3D"moz-txt-link-freet=
ext">m.mizutani@nskint.co.jp</a>&gt;;
                  Yoshitaka Ikeda &lt;<a href=3D"mailto:ikeda@nskint.co.j=
p" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ikeda@nskint.=
co.jp</a>&gt;<br>
                  <b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set
                  CVE_PRODUCT<o:p></o:p></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-mar=
gin-left:3.5gd"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
          <div>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US">On 2025-12-22 7:05 p.m., Ken Kurem=
atsu
                wrote:<o:p></o:p></span></p>
          </div>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">Hi Randy,</span><span lang=3D"EN-US"><o:p></o:=
p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">Let me
                confirm one thing about your comment.</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">If I make the
                corrections as suggested in the comment, when I retrieve
                CVE_PRODUCT with bitbake-getvar,</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">only &quot;theora&quot;
                is included, not &quot;libtheora&quot;.</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
          </blockquote>
          <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-mar=
gin-left:3.5gd"><span lang=3D"EN-US">I expect both libtheora and theora t=
o be
              valid matches...<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:&quot;Yu Gothic&quot;">I
              see.<o:p></o:p></span></p>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">(This is the
                result of an old test environment, but it was the same
                in 1.2.0)</span><span lang=3D"EN-US"><o:p></o:p></span></=
p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">$
                bitbake-getvar -r libtheora CVE_PRODUCT</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#
                $CVE_PRODUCT [2 operations]</span><span lang=3D"EN-US"><o=
:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#&nbsp;&nbsp; set
                xxx/create-spdx-2.2.bbclass:11</span><span lang=3D"EN-US"=
><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp;
                [_defaultval] &quot;${BPN}&quot;</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#&nbsp;&nbsp; append
                xxx/</span><span lang=3D"EN-US"><a href=3D"https://urldef=
ense.com/v3/__http:/libtheora_1.1.1.bb__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3g=
Ms8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdM8lL0=
jRA$" moz-do-not-send=3D"true"><span style=3D"font-size:10.5pt;font-famil=
y:&quot;Yu Gothic&quot;">libtheora_1.1.1.bb</span></a></span><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">:23<=
/span><span lang=3D"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp;
                &quot;theora&quot;</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#
                pre-expansion value:</span><span lang=3D"EN-US"><o:p></o:=
p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">#&nbsp;&nbsp; &quot; theora&quot;</span><span =
lang=3D"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">CVE_PRODUCT=3D&quot;
                theora&quot;</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
          </blockquote>
          <p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0mm;margin-r=
ight:0mm;margin-bottom:12.0pt;margin-left:42.0pt;mso-margin-top-alt:0mm;m=
so-para-margin-right:0mm;mso-para-margin-bottom:12.0pt;mso-para-margin-le=
ft:3.5gd">
            <span lang=3D"EN-US">but&nbsp; it doesn't look like that.<o:p=
></o:p></span></p>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">If libtheora
                should be included, I think the following correction
                would be best. What do you think?</span><span lang=3D"EN-=
US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">Sorry if I
                misunderstood.</span><span lang=3D"EN-US"><o:p></o:p></sp=
an></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">CVE_PRODUCT =3D
                &quot;${BPN} theora&quot;</span><span lang=3D"EN-US"><o:p=
></o:p></span></p>
          </blockquote>
          <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-mar=
gin-left:3.5gd"><span lang=3D"EN-US">probably not.<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:&quot;Yu Gothic&quot;">Ummm</span><span style=3D"font-=
size:10.5pt;font-family:&quot;Yu Gothic&quot;">=E2=80=A6<span lang=3D"EN-=
US"><o:p></o:p></span></span></p>
          <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-mar=
gin-left:3.5gd"><span lang=3D"EN-US"><br>
              I replied to your email in response to a discussion in the
              Yocto patch review meeting.<br>
              IIRC, Ross Burton was the one who suggested the +=3D.<o:p><=
/o:p></span></p>
          <p><span lang=3D"EN">It would be a good idea to attend the Yoct=
o
              patch review meeting and talk to you.<br>
              However, I'm not very good at English. Sorry.</span><span l=
ang=3D"EN-US"><o:p></o:p></span></p>
          <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><spa=
n lang=3D"EN-US">I don't often use the CVE check scripts in
              oe-core so I'm not sure off-hand, how to confirm<br>
              that the BPN is the default. <o:p></o:p></span></p>
          <p><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&=
quot;Yu Gothic&quot;">The
              default value is defined in cve-check.bbclass, which can
              be found at the following URL:<br>
            </span><span lang=3D"EN-US"><a href=3D"https://urldefense.com=
/v3/__https://github.com/openembedded/openembedded-core/blob/48e98a6e3fd2=
6c418902b76be8865102bd903189/meta/classes/cve-check.bbclass*L31__;Iw!!Ajv=
eYdw8EvQ!fmr8c03Dewg4g-sO5zs4RWftsjbML8Q3D7lw0sPbzUH0B9a9RMJFbC6fn6aGOaUO=
_S-vClYLLXRUdsv3E6qaTTYvcb6Quw$" moz-do-not-send=3D"true"><span style=3D"=
font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">https://github.com/op=
enembedded/openembedded-core/blob/48e98a6e3fd26c418902b76be8865102bd90318=
9/meta/classes/cve-check.bbclass#L31</span></a></span><span lang=3D"EN-US=
" style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p></o:p=
></span></p>
          <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><spa=
n lang=3D"EN-US"><br>
              Ross ?<o:p></o:p></span></p>
          <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><spa=
n lang=3D"EN-US">Ken, please be patient, it the winter holiday
              season so Ross may not reply for a week or two.<o:p></o:p><=
/span></p>
          <p><span lang=3D"EN" style=3D"font-size:10.5pt;font-family:&quo=
t;Yu Gothic&quot;">Ok,
              I'll wait for Ross's response.<br>
              I will also be on vacation starting next week, so the next
              time I can reply will be after the New Year.</span><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"=
><o:p></o:p></span></p>
          <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><spa=
n lang=3D"EN-US">../Randy<o:p></o:p></span></p>
          <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><spa=
n lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">By the way,
                the NVD records have the following values, so I think
                theora alone will be fine.</span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">(itheora is a
                different product)</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">$ sqlite3
                downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep theora</sp=
an><span lang=3D"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">:</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">INSERT INTO
                PRODUCTS VALUES('CVE-2008-0797',
                'itheora','itheora','1.0_rc1','=3D','','');</span><span l=
ang=3D"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">INSERT INTO
                PRODUCTS VALUES('CVE-2024-56431',
                'xiph','theora','','','1.2.0','&lt;');</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">$</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">Best Regards.</span><span lang=3D"EN-US"><o:p>=
</o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">--</span><span lang=3D"EN-US"><o:p></o:p></spa=
n></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">Ken Kurematsu
              </span><span lang=3D"EN-US"><a href=3D"mailto:k.kurematsu@n=
skint.co.jp" moz-do-not-send=3D"true"><span style=3D"font-size:10.5pt;fon=
t-family:&quot;Yu Gothic&quot;">k.kurematsu@nskint.co.jp</span></a><o:p><=
/o:p></span></p>
            <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-m=
argin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
            <div style=3D"border:none;border-left:solid blue 1.5pt;paddin=
g:0mm 0mm 0mm 4.0pt">
              <div>
                <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;=
padding:3.0pt 0mm 0mm 0mm">
                  <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-=
para-margin-left:3.5gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D=
"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-se=
rif">
                    </span><span lang=3D"EN-US"><a href=3D"mailto:openemb=
edded-core@lists.openembedded.org" moz-do-not-send=3D"true"><span style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">openembedde=
d-core@lists.openembedded.org</span></a></span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                    </span><span lang=3D"EN-US"><a href=3D"mailto:openemb=
edded-core@lists.openembedded.org" moz-do-not-send=3D"true"><span style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;openemb=
edded-core@lists.openembedded.org&gt;</span></a></span><span lang=3D"EN-U=
S" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                      <b>On Behalf Of </b>Ken Kurematsu via </span><span =
lang=3D"EN-US"><a href=3D"https://urldefense.com/v3/__http:/lists.openemb=
edded.org__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF=
-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdOLXrdmwg$" moz-do-not-send=3D"true=
"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-se=
rif">lists.openembedded.org</span></a></span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
                      <b>Sent:</b> Tuesday, December 23, 2025 8:43 AM<br>
                      <b>To:</b> Randy MacLeod </span><span lang=3D"EN-US=
"><a href=3D"mailto:randy.macleod@windriver.com" moz-do-not-send=3D"true"=
><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-ser=
if">&lt;randy.macleod@windriver.com&gt;</span></a></span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif=
">;
                    </span><span lang=3D"EN-US"><a href=3D"mailto:openemb=
edded-core@lists.openembedded.org" moz-do-not-send=3D"true"><span style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">openembedde=
d-core@lists.openembedded.org</span></a></span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
                      <b>Cc:</b> Masahiro Mizutani </span><span lang=3D"E=
N-US"><a href=3D"mailto:m.mizutani@nskint.co.jp" moz-do-not-send=3D"true"=
><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-ser=
if">&lt;m.mizutani@nskint.co.jp&gt;</span></a></span><span lang=3D"EN-US"=
 style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">;
                      Yoshitaka Ikeda </span><span lang=3D"EN-US"><a href=
=3D"mailto:ikeda@nskint.co.jp" moz-do-not-send=3D"true"><span style=3D"fo=
nt-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;ikeda@nski=
nt.co.jp&gt;</span></a></span><span lang=3D"EN-US" style=3D"font-size:11.=
0pt;font-family:&quot;Calibri&quot;,sans-serif">;
                      Ken Kurematsu </span><span lang=3D"EN-US"><a href=3D=
"mailto:k.kurematsu@nskint.co.jp" moz-do-not-send=3D"true"><span style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;k.kurem=
atsu@nskint.co.jp&gt;</span></a></span><span lang=3D"EN-US" style=3D"font=
-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
                      <b>Subject:</b> Re: [OE-core] [PATCH] libtheora:
                      set CVE_PRODUCT</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
                </div>
              </div>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">Hi Randy,</span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">Thank you for
                  your review.</span><span lang=3D"EN-US"><o:p></o:p></sp=
an></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">I will
                  reflect your comments and post v2.</span><span lang=3D"=
EN-US"><o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">Best regards.</span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">--</span><span lang=3D"EN-US"><o:p></o:p></s=
pan></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">Ken Kurematsu
                  &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:k.kur=
ematsu@nskint.co.jp" moz-do-not-send=3D"true"><span style=3D"font-size:10=
.5pt;font-family:&quot;Yu Gothic&quot;">k.kurematsu@nskint.co.jp</span></=
a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot=
;Yu Gothic&quot;">&gt;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para=
-margin-left:3.5gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Yu Gothic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
              <div style=3D"border:none;border-left:solid blue 1.5pt;padd=
ing:0mm 0mm 0mm 4.0pt">
                <div>
                  <div style=3D"border:none;border-top:solid #E1E1E1 1.0p=
t;padding:3.0pt 0mm 0mm 0mm">
                    <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;ms=
o-para-margin-left:3.5gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0=
pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif">
                        Randy MacLeod &lt;</span><span lang=3D"EN-US"><a =
href=3D"mailto:randy.macleod@windriver.com" moz-do-not-send=3D"true"><spa=
n style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">r=
andy.macleod@windriver.com</span></a></span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;
                        <br>
                        <b>Sent:</b> Tuesday, December 23, 2025 3:58 AM<b=
r>
                        <b>To:</b> Ken Kurematsu &lt;</span><span lang=3D=
"EN-US"><a href=3D"mailto:k.kurematsu@nskint.co.jp" moz-do-not-send=3D"tr=
ue"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif">k.kurematsu@nskint.co.jp</span></a></span><span lang=3D"EN-US" sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;;
                      </span><span lang=3D"EN-US"><a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" moz-do-not-send=3D"true"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">openembe=
dded-core@lists.openembedded.org</span></a></span><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
                        <b>Cc:</b> Masahiro Mizutani &lt;</span><span lan=
g=3D"EN-US"><a href=3D"mailto:m.mizutani@nskint.co.jp" moz-do-not-send=3D=
"true"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif">m.mizutani@nskint.co.jp</span></a></span><span lang=3D"EN-US" s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;=
;
                        Yoshitaka Ikeda &lt;</span><span lang=3D"EN-US"><=
a href=3D"mailto:ikeda@nskint.co.jp" moz-do-not-send=3D"true"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">ikeda@ns=
kint.co.jp</span></a></span><span lang=3D"EN-US" style=3D"font-size:11.0p=
t;font-family:&quot;Calibri&quot;,sans-serif">&gt;<br>
                        <b>Subject:</b> Re: [OE-core] [PATCH] libtheora:
                        set CVE_PRODUCT</span><span lang=3D"EN-US"><o:p><=
/o:p></span></p>
                  </div>
                </div>
                <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-pa=
ra-margin-left:3.5gd"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
                <div>
                  <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-=
para-margin-left:3.5gd"><span lang=3D"EN-US">Hi
                      Ken,<o:p></o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-=
para-margin-left:3.5gd"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-=
para-margin-left:3.5gd"><span lang=3D"EN-US">On
                      2025-12-18 11:01 p.m., Ken Kurematsu via
                      <a href=3D"https://urldefense.com/v3/__http:/lists.=
openembedded.org__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3=
zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdOLXrdmwg$" moz-do-not-send=3D=
"true">
                        lists.openembedded.org</a> wrote:<o:p></o:p></spa=
n></p>
                </div>
                <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt=
">
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">In the NVD database, the product name of libtheora is theora.</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">This was set to ensure that cve-check works correctly.</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">Signed-off-by: Ken Kurematsu <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a=
></pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">---</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd"> meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd"> 1 file changed, 2 insertions(+)</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b=
/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">index 04de8507fb..bacaf3aee6 100644</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D &quot;ebdf77a8f5c0a8f7a9e4=
2323844fa09502b34eb1d1fece7b5f54da41fe</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd"> UPSTREAM_CHECK_REGEX =3D &quot;libtheora-(?P&lt;pver&gt;\d+(\.\d)+=
)\.(tar\.gz|tgz)&quot;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">+CVE_PRODUCT =3D &quot;theora&quot;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">+</pre>
                </blockquote>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">&nbsp;</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">From YP patch review,</pre>
                <p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0mm;ma=
rgin-right:0mm;margin-bottom:12.0pt;margin-left:42.0pt;mso-margin-top-alt=
:0mm;mso-para-margin-right:0mm;mso-para-margin-bottom:12.0pt;mso-para-mar=
gin-left:3.5gd">
                  <span lang=3D"EN-US">Please use:<o:p></o:p></span></p>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">CVE_PRODUCT +=3D &quot;theora&quot;</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">&nbsp;</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">to catch both libtheora and theora</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">&nbsp;</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">&nbsp;</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">Thanks, </pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">&nbsp;</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">../Randy</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">&nbsp;</pre>
                <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt=
">
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd"> inherit autotools pkgconfig</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd"> EXTRA_OECONF =3D &quot;--disable-examples --disable-doc&quot;</pre=
>
                  <p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0mm;=
margin-right:0mm;margin-bottom:12.0pt;margin-left:42.0pt;mso-margin-top-a=
lt:0mm;mso-para-margin-right:0mm;mso-para-margin-bottom:12.0pt;mso-para-m=
argin-left:3.5gd">
                    <span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                  <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3=
.5gd">&nbsp;</pre>
                </blockquote>
                <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd=
"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd">-- </pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"># Randy MacLeod</pre>
                <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"># Wind River Linux</pre>
              </div>
            </div>
          </blockquote>
          <p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><spa=
n lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
          <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd">--=
 </pre>
          <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"># =
Randy MacLeod</pre>
          <pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"># =
Wind River Linux</pre>
          <pre>&nbsp;</pre>
          <pre>--</pre>
          <pre>Ken Kurematsu <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a></pre=
>
          <pre>&nbsp;</pre>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------e1zZIyUCgUJLgHpQLuAVje0j--

