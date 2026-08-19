Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C96C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 12:22:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5752.1787142163556069185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 05:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hiANC5cz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2691123d51=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JAB6oV2700535
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 12:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=JNN1LbYUNSqVpNbPpvKvhR
	mWszUuEh0TC2rtnJC7Xg4=; b=hiANC5czvXiwza/vaLnx5zJp48WbrZPiitTB8E
	DUsye3psiltgjXRWC1m1aMnglryRNeYTJq4fFvZ8SOAXv7JSScYggg8Peqb3xjpK
	z+hGAZ8snsCYJweMVZjclm78zw6spDqsbr88GNZRa+sR0K/T3V6NZTeBEGVJCd65
	9gRkDOiL3WxHtzOuVX84suxqz65f4WMlVoXtreHbL2bA6jEhOFMcagAcfWj4dvsz
	DSCFRp3bIlF8nvj52oo61XGX55isOjlogbUZTjfW8C7Fb0k4+dN2EIDTNIPf9m+4
	nFeqVg8YGUTGaAL59xodZT/X0JR2uvgyCKYUy/fGfa/Ts3GQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022123.outbound.protection.outlook.com [40.107.209.123])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g4ydmh1yj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 12:22:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqF47IPlx6n9VQQE8zVSlrgLc36pMXlitQdE8ZtTNd8HgeiC/KghcpVszucfw5ONrQrTbob7aGJ9UeF8eg+Ok3/d7meSleO3oQLYw2gjIjKPpjxmFDmLyVz1IZI+wEmjNtqymBjEtDKFm+5k9AjZzQTP7JHAUibuUeysuWu+ggdeQTbjN6X0hBJa/m9v5v+Gonp9cB8PHnZ5TSutd4Rfk/wwWWNPii8bszdpsCYYadKPM+xPRWdpoL9ouzBabEz8XqP49kAy7nrlIu8x0vbOzJuCJ7GTKDOenvXzfSr8sFm1CrHpmd/SaQ7zCl2OVdpAX3zTMsuyXoD2OROsRamyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNN1LbYUNSqVpNbPpvKvhRmWszUuEh0TC2rtnJC7Xg4=;
 b=aPU9CjzGz5S7dHAGDVK2v7XVHr5XaM7i0UEtnbgbjABKT2k3C2kOHHIqhcDMUty+DXKcR6LPoRgEuX2EKkioaqKw0tk9U/cZJpZmQEUIYSY8qTz6MmZtqwFIo2/2XKGB+XjS6Rw7YqBiUjtCDRWGqLupcNJxMp4+YtoqP7U887cS/ZQ7ovpRwtmTVGMjx8Oo2ZmFTbRcZkuP9erCnu+I2A9WldD/ArPDi2G5wZLvqp3FfOM8eR3tiomIw1Vvo8JAfKP61hhFk5H+Z/zB41Mcl11/b5WdQZcQ5PTkQS0TfdRoAP9+NaitoLXINKpWnVToEEO3KnUEG9X+jTpTz7Z7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 12:22:36 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 12:22:35 +0000
Content-Type: multipart/alternative;
 boundary="------------j1JTrKsyk2fqeqe3v04mXTJu"
Message-ID: <ba437265-d16c-468b-bd1a-8126df4732a3@windriver.com>
Date: Wed, 19 Aug 2026 08:22:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libyang: upgrade 3.13.6 -> 5.8.6
To: Gunashree K L <Gunashree.KL@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, Shiva.Komati@windriver.com
References: <20260819075854.2101225-1-Gunashree.KL@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260819075854.2101225-1-Gunashree.KL@windriver.com>
X-ClientProxiedBy: YT4P288CA0072.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eab40b-bd96-41a6-ed67-08defdec8d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|13003099007|3023799007|56012099006|10067099003|11063799006|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QBLs9szlmgsCN852PAPpPXRqWJlf2Q2r2MSNiqQJEhsh8ACixNsE/t7G7gPlo9D+z+enWXSDsqUNkiN7fBA8mZfV+uwWZvkTgHWV70H7JfJssfIv6DJu9xmOTY5AcxUNMkWYPjovAbd6tts5mSZcK8LZEGg1ehP1r8yxwNvObRrCJmOju5Trznq8KJmLvMK4NdIGMlBg02OnYQb9eiTw8NGFY4+tsD6qfpvmp0v2/iG4h5lSyadfTzzH5h2pIoU46G5H05JV43kmIl22nWFENPhlz9xNthMzxgcNZgTZhhhkpRYVGvNico+dLGb3qvcav8g94SGItfvvWUPOLYv5J8d9yiB+5Ovzs1Mu1X9X9G+yH8W+K3GxGVMvvk5AHyPYuOoXhMi+HG1THB9qvN7CurNpwt683CjOTfXLhDLjkvBdKYxwah2zMFBOxpSxwfYnCE7OQpwF07flvBDl6qkNe7mvApWccxd353BIyyhJeqoZxXy2MxyVC1yDHKQMVGLEr2vk4itHcwbCLVrT2gmCp9pHV9C7ni+PoK9tDDs1U6AkTJhYjyRAhjoEF2skb/8UbjLCKgdbfMETUG2SRCAa+MfjYZyxiM3bqavpUQzL/IMAVMzVbhQvffreKt/EodF3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(13003099007)(3023799007)(56012099006)(10067099003)(11063799006)(8096899003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXBiZlY1RHV2Sm9BWklhMFF1RVB5RlBQMzA3aWJDUXBVQ2ZIaUdUbE9GMll3?=
 =?utf-8?B?a1BCcnhRV2daVnpXQnBIRkh2UHljVkZMSXc3ZDdHVDBmMXQvVGhJM1JmTzlU?=
 =?utf-8?B?K3BwZWw3elJNZ20zOW45L0xwbkRZdG8wRkp5V2xGK0JrVysxcmlqdVhxSlh1?=
 =?utf-8?B?RzB0OStpRUQxU3FjU3ZWN0NSQzA3TDNYaXZzdFRDRkRoZlNOa0F3MS9ZUXht?=
 =?utf-8?B?ZkxRSlRHc1llLzFMQ2NxbGdKaFI0WVpHNUR3cHFOd3NTVWZYSldrRThYNmpw?=
 =?utf-8?B?MWFraFQ4bjFFMVFzakIwcHE2UFBVZkxpUGlHQVliNHNvZTFBZEsvSFhBYnls?=
 =?utf-8?B?N2lyV3JMQ01Rb2t2Q09neTlaZzhwY29IU2RtV3g0YTlGVmp2Z3RWQXJvNWlZ?=
 =?utf-8?B?cmhVNUpHODhqWVFOUW83VGhqWFJpQ1JLM2RGelR0OGhNeEZPR3dOMTNsQXBH?=
 =?utf-8?B?RDNXdlRTZ1N1aCtyTkg4c1FtUjBMbllwRnNIZEZ5dUtTT3V2SWxwSVovUWpJ?=
 =?utf-8?B?L2hWdE9HbjNncEpOSFhORnhTc3M5V0xVa0RmakZqTzJNNWlMMnBIYkx1ait3?=
 =?utf-8?B?QkNucVBjUnF1bE5KUzUrUFFwZjI5c2I0WmJ1b29kYks5Rm9YYVdNY3N0TC9u?=
 =?utf-8?B?SnErSUZVS2NTVlEvQWx2NFlRYjlmL1Yrc3o5SDNYL3FNUXpONFFQYnpKd3E4?=
 =?utf-8?B?bjdwVUl2ZTRPNjBjem9ES3BiN09XbXYzOFdSWHpPWlpzQ2tYY1RRdC9ic2FJ?=
 =?utf-8?B?Z3E5NmphSG5mSGljWXhMY1AxMTRIazRSMU5zNDZsOFhUK0JPb0ozenRFT09L?=
 =?utf-8?B?NEVXR2lEeTlPbUNma0tiL2ZVVUVtQk96ZVNuVFMzT2VlV2VDMnhCOUhjd0RQ?=
 =?utf-8?B?cC92QVRBYndJejZ2WnlaTkxVTDZMOXp4WXBaN1NWRTJrbDVsV0duTkNHUFhE?=
 =?utf-8?B?Tk4veDZuWkZ3OWhrM0xvYUROTTN5R082VFcxUmFQcnBwSHY2WGh4Sm9sdzBW?=
 =?utf-8?B?ZFNlQ2M3RWFJYkc3enc2Sk1kS1dVbTJWSUFVL3lORkdBeUVCcE04andTbEZG?=
 =?utf-8?B?TWVjWmZ0WWYxWGcwWUduUGFxa050NGFqZE92VnF4Qk0xdHJKeXIyQW1hMzA4?=
 =?utf-8?B?NXdYNFdlVFdRWWlsNXB6ZVFkSEJpSXdESFEzVnYwd3dCdmpmWWR4SzE5YkhC?=
 =?utf-8?B?cFpmQVlKSlFDcnBwUVJOTlcvcldGWWtTWFZ6N3pQTG1haWhuYktLZGZ3UGkv?=
 =?utf-8?B?KzVOaFR4YXdrNVdKYmhZK1JVZFA5QnpDTGs3QjBvYmNLRGNjWWZMenN5WTkx?=
 =?utf-8?B?MzljUG5lN21rdWtSa1p2NUpVMHFoNFdnK1c1eFE2dUx4a0dJK0ZZWjNtNldE?=
 =?utf-8?B?N2FELzlJVWZCMlVENENQcmRDc2l3S3JXRGVYNkhTdFYwNmlYdVB5Z29iNGZx?=
 =?utf-8?B?bmVhK0Iza3YwVlJhZWlpQVVPc1VhOU0yeS80b0YwQmY5eHpuWUJoR2w4VmxS?=
 =?utf-8?B?VDdxcDR1NzQ3aUZPWEZYUTVVNVJYbExOOGhtMUZCWElOMnQ5MzFjTFFySWRW?=
 =?utf-8?B?UFR2ZGpkL3lkeDE0eTE5bUlobnhrT2JXRmtSbW1HT2gxOHlQOFB4cnk5c0lE?=
 =?utf-8?B?WmFrU0Ryc2g0ZGM3SmNXMHZzOXUvNVZQYk9jSlVCOXVWelJldGZmRjFvYTgw?=
 =?utf-8?B?Sm5HYjA4enR1aitDMkJ2VHMxRU1zR05YQnFkSnI0NEFJTURyblJnNzRWOUNS?=
 =?utf-8?B?Vm5PWnV0Z21COHAxMHpKL3U4ZUFhaUJ1NTdnVmVVOWNNaTF0bTlpY3BhOTlw?=
 =?utf-8?B?MzNyaTB5SlBVeVZCMWlYWGNXU0d4dlFSZDA4MGJUanVlK3dZaDArRmR4ejZy?=
 =?utf-8?B?TkZnOUpEUm5SZ2dseUI5QzRrVmlHZlhNR1lWc0dnTExRVWdsczRzQnpsMGdD?=
 =?utf-8?B?RjVwRW91Q09zOThZQnFyUnFXNVZtZ0c1MUdWTnA0Z0grOXkxejBnM2JhZUJv?=
 =?utf-8?B?UDF1TG1Lb21naGdPZjQvTzlNQXFRM2l6aU9ITGJocnhsVXd6MDBKUFRwYmt3?=
 =?utf-8?B?c1BOU09sWmlqbWZpWWZoUW9idWVUMmpreENkc2tLOHJhZ2ZlNXdqRE1sSGdF?=
 =?utf-8?B?cUtMT3krc05pbCtHSDlMSTJ3QVpLSCtIVzU5WXIxUVBkVUs2TlFaVDYrLzh1?=
 =?utf-8?B?Y1o5MlpPYTh5WTdWT0NtR2JEWG9LZGJHWDdsQ0FDSUJSNmxYMDJlOVVxWFVi?=
 =?utf-8?B?ZVFWRmJQbkZwU0VIU2d4cng4cUx2djN5eU0zWjNPTXhsRkZDTDNGb0NDYlpN?=
 =?utf-8?B?T0J6T1oxRFE4ek5RV1JFRFBENUc3ZWZ4TXNDcE44VTJsVVZ0aTM2TTg4MEVn?=
 =?utf-8?Q?GVUNg8Atf4NP1ze0=3D?=
X-Exchange-RoutingPolicyChecked: 
	MTKD5fFweOwlgZPHukiyutOOdOXwLjhGwwWIieiAAjwfjVDrZg+Itw5rzh+6ya7E8G2zjGof2oiLPVCf6mdByRaXEVlw2HYZSUjhyu5s1Eh97WTetawNBKYTFBLd78VbFLW0fK/nPAJFclkT9RuUoYomywa56h0Rzh8M9SNhKUK5Okd1TtvNi863BGvcWFpZNLLgkr8cWUH1gQXO0YkKUFbN0xVMfTZSSAKBTkiSXkGkLCvvk8m1pKIz6DQtH9Z87gPCGLB2LRrKnckcxGkrD2xLpB899UU+gsnNiQiK3d8dMjJkxSzPS2+Ox8i0t4PH0WL6cBWyo9rexVZ3/pmW0g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eab40b-bd96-41a6-ed67-08defdec8d3e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 12:22:35.8471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9phGdvQn1fKYDl3h/X2mZbYirXdY9rqfFqDzRDDtfMQE57pGappad4he3VWbzQ2Bz6XYj4s5796qYfyVGXFNcEymAA7jon+wshPN3OxHJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5NiBTYWx0ZWRfX+xmnTinOYB/a
 /xPduo2IOz/yoIZ5ODnHTQzaoW+AO17WoGszKvggT6cvGo8XdphCPca+ae1vDV37Qy3D7nS2nQf
 4b+ResTPol/Alo5D7Wh/HeVM/IHdxNCv8AyqvHOP7iMAAGQKdwJa
X-Proofpoint-GUID: Xo605bT5q2wTdDAeeHb9vvkcHen0UOZj
X-Proofpoint-ORIG-GUID: Xo605bT5q2wTdDAeeHb9vvkcHen0UOZj
X-Authority-Analysis: v=2.4 cv=PY3PQChd c=1 sm=1 tr=0 ts=6a85a011 cx=c_pps
 a=EEuUCq1UVZeKBjwkVe0TyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xKi3oGM_E3k6BEys4R8A:9 a=QEXdDO2ut3YA:10
 a=-C-yVwkIWC4mTrPf_bEA:9 a=YaNDXEbv67QlYVog:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5NiBTYWx0ZWRfX8Jtzlr054w0p
 qrnhucitRzQugBLsSg7FzUNE9bofvfiB/jgpMSF3lUgakME6UaoWhNIiTTXmHhPC/BpvlnzA3cO
 JlJCs7ScqTife9FMNSito0dRVZtgRBLZSm8sXTTPkxV2azQazKZSF02I3VgF49JYYaLU12RRr7g
 ln/wWOWaz6ksiVviNg+sEIm/FXxKfytU4zAxUOFS1VtSWm3nZRVySC2pWJTJQkfEPzWoSb1tg/k
 R9PO8vhicW/eOHGnkZqZY7WThj0Wl/TBXXCslrAjpumE2fK9vIrpElLobeGI38itlY+4kvCRYC2
 xHKP1tb6jmFEVmJ0Ksivitm2n+ZZR9DH9ggzEB6fhdusj+m7JUVLaggOARwdzQ0jSZaMjR5V4Ok
 Ps8my48MDM7ij2n7eqh0l7TRVWJOeF22X//NoKJs+IbVr780cC0mL5O2g0H3EhQIMzQf0Xw6JkP
 XOwlzyx/R1SLGxeIJlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 12:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243729

--------------j1JTrKsyk2fqeqe3v04mXTJu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Gunashree,

Oops - wrong email list.

libyang is part of meta-openembedded:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb?h=master

../Randy

On 2026-08-19 03:58, Gunashree K L wrote:
> Upgrade to latest upstream release. This also resolves
> CVE-2026-41401 (heap use-after-free in lyd_parser_set_data_flags).
>
> Drop 0001-test_context-skip-test-case-test_searchdirs.patch as it
> no longer applies to 5.8.6 due to refactored test code:
>      https://github.com/CESNET/libyang/commit/c889ee0ed
> The test_searchdirs test still references build paths but this only
> affects ptest execution, not the library build.
>
> Fix buildpath QA error: LY_SRC_DIR in src/ly_config.h.in uses
> CMAKE_CURRENT_SOURCE_DIR which embeds the build source path into
> the installed header. LY_SRC_DIR is only used by tests/fuzzers,
> not by the library itself. Reported upstream:
> https://github.com/CESNET/libyang/issues/2553
> Fixed upstream in commit 68263438a but not yet in a released tag.
> Sed workaround kept until next upstream release includes the fix.
>
> Signed-off-by: Gunashree K L<Gunashree.KL@windriver.com>
> ---
>   ...ntext-skip-test-case-test_searchdirs.patch | 26 -------------------
>   .../{libyang_3.13.6.bb => libyang_5.8.6.bb}   | 10 ++++---
>   2 files changed, 7 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
>   rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb => libyang_5.8.6.bb} (76%)
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
> deleted file mode 100644
> index 70890e2485..0000000000
> --- a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 24ec37bfe5c4c248dda0e80d6e7ab27afca1d60e Mon Sep 17 00:00:00 2001
> -From: Yi Zhao<yi.zhao@windriver.com>
> -Date: Wed, 22 Mar 2023 16:03:56 +0800
> -Subject: [PATCH] test_context: skip test case test_searchdirs
> -
> -Skip test case test_searchdirs as it searchs the source code directory.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
> ----
> - tests/utests/basic/test_context.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_context.c
> -index 116b2ce36..4e96f4e96 100644
> ---- a/tests/utests/basic/test_context.c
> -+++ b/tests/utests/basic/test_context.c
> -@@ -1110,7 +1110,6 @@ int
> - main(void)
> - {
> -     const struct CMUnitTest tests[] = {
> --        UTEST(test_searchdirs),
> -         UTEST(test_options),
> -         UTEST(test_models),
> -         UTEST(test_imports),
> diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_5.8.6.bb
> similarity index 76%
> rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> rename to meta-oe/recipes-extended/libyang/libyang_5.8.6.bb
> index 822c30ba24..3d7b6eaff0 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_5.8.6.bb
> @@ -6,10 +6,9 @@ LICENSE = "BSD-3-Clause"
>   
>   LIC_FILES_CHKSUM ="file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a"
>   
> -SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
> +SRCREV = "47351e59e2965e350f9d4098f15ecbe6b3850f6f"
>   
>   SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
> -file://0001-test_context-skip-test-case-test_searchdirs.patch \
>              file://run-ptest \
>              "
>   
> @@ -33,7 +32,12 @@ do_compile:prepend () {
>   }
>   
>   do_install:append () {
> -        oe_multilib_header  libyang/ly_config.h
> +    oe_multilib_header  libyang/ly_config.h
> +    # LY_SRC_DIR embeds the build source path into the installed header.
> +    # It is only used by tests/fuzzers, not by the library itself.
> +    # Remove it to avoid QA buildpath errors.
> +    sed -i -e 's|${TMPDIR}[^ "]*||g' ${D}${includedir}/libyang/ly_config.h
> +    sed -i -e 's|${TMPDIR}[^ "]*||g' ${D}${includedir}/libyang/ly_config-64.h
>   }
>   
>   do_install_ptest () {


-- 
# Randy MacLeod
# Wind River Linux

--------------j1JTrKsyk2fqeqe3v04mXTJu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Gunashree,&nbsp;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Oops - wrong email list.<br>
      <br>
      libyang is part of meta-openembedded:<br>
      &nbsp;
&nbsp;<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb?h=master">https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb?h=master</a></div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-08-19 03:58, Gunashree K L
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260819075854.2101225-1-Gunashree.KL@windriver.com">
      <pre wrap="" class="moz-quote-pre">Upgrade to latest upstream release. This also resolves
CVE-2026-41401 (heap use-after-free in lyd_parser_set_data_flags).

Drop 0001-test_context-skip-test-case-test_searchdirs.patch as it
no longer applies to 5.8.6 due to refactored test code:
    <a class="moz-txt-link-freetext" href="https://github.com/CESNET/libyang/commit/c889ee0ed">https://github.com/CESNET/libyang/commit/c889ee0ed</a>
The test_searchdirs test still references build paths but this only
affects ptest execution, not the library build.

Fix buildpath QA error: LY_SRC_DIR in src/ly_config.h.in uses
CMAKE_CURRENT_SOURCE_DIR which embeds the build source path into
the installed header. LY_SRC_DIR is only used by tests/fuzzers,
not by the library itself. Reported upstream:
<a class="moz-txt-link-freetext" href="https://github.com/CESNET/libyang/issues/2553">https://github.com/CESNET/libyang/issues/2553</a>
Fixed upstream in commit 68263438a but not yet in a released tag.
Sed workaround kept until next upstream release includes the fix.

Signed-off-by: Gunashree K L <a class="moz-txt-link-rfc2396E" href="mailto:Gunashree.KL@windriver.com">&lt;Gunashree.KL@windriver.com&gt;</a>
---
 ...ntext-skip-test-case-test_searchdirs.patch | 26 -------------------
 .../{libyang_3.13.6.bb =&gt; libyang_5.8.6.bb}   | 10 ++++---
 2 files changed, 7 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
 rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb =&gt; libyang_5.8.6.bb} (76%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
deleted file mode 100644
index 70890e2485..0000000000
--- a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 24ec37bfe5c4c248dda0e80d6e7ab27afca1d60e Mon Sep 17 00:00:00 2001
-From: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
-Date: Wed, 22 Mar 2023 16:03:56 +0800
-Subject: [PATCH] test_context: skip test case test_searchdirs
-
-Skip test case test_searchdirs as it searchs the source code directory.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
----
- tests/utests/basic/test_context.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_context.c
-index 116b2ce36..4e96f4e96 100644
---- a/tests/utests/basic/test_context.c
-+++ b/tests/utests/basic/test_context.c
-@@ -1110,7 +1110,6 @@ int
- main(void)
- {
-     const struct CMUnitTest tests[] = {
--        UTEST(test_searchdirs),
-         UTEST(test_options),
-         UTEST(test_models),
-         UTEST(test_imports),
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_5.8.6.bb
similarity index 76%
rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
rename to meta-oe/recipes-extended/libyang/libyang_5.8.6.bb
index 822c30ba24..3d7b6eaff0 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_5.8.6.bb
@@ -6,10 +6,9 @@ LICENSE = &quot;BSD-3-Clause&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a">&quot;file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a&quot;</a>
 
-SRCREV = &quot;c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb&quot;
+SRCREV = &quot;47351e59e2965e350f9d4098f15ecbe6b3850f6f&quot;
 
 SRC_URI = &quot;git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
-           <a class="moz-txt-link-freetext" href="file://0001-test_context-skip-test-case-test_searchdirs.patch">file://0001-test_context-skip-test-case-test_searchdirs.patch</a> \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
            &quot;
 
@@ -33,7 +32,12 @@ do_compile:prepend () {
 }
 
 do_install:append () {
-        oe_multilib_header  libyang/ly_config.h
+    oe_multilib_header  libyang/ly_config.h
+    # LY_SRC_DIR embeds the build source path into the installed header.
+    # It is only used by tests/fuzzers, not by the library itself.
+    # Remove it to avoid QA buildpath errors.
+    sed -i -e 's|${TMPDIR}[^ &quot;]*||g' ${D}${includedir}/libyang/ly_config.h
+    sed -i -e 's|${TMPDIR}[^ &quot;]*||g' ${D}${includedir}/libyang/ly_config-64.h
 }
 
 do_install_ptest () {
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------j1JTrKsyk2fqeqe3v04mXTJu--

