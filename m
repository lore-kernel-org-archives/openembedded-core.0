Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA8FCF58E5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:29:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16919.1763584146360319495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dS9QSnGI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418077aaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7si2T2175790
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:29:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=SOENStoetWFUNCyAJHubXu
	DIM4tWlzhY2MeqaKkU4nQ=; b=dS9QSnGIlMuLNWEYsLRVrF6rDN/aZHM5HovpYT
	6nLjT+zsnO4u069FN1FSvfg8080kK1V50ePvO+xHPGZiCaugpr6K6Mis9U+tIs/v
	Qwq4SGERpsnW1jBjXwgycF9XctxFQFUxud4l+oT1SIqz78PFvRm97rJ7key/IsLF
	T4KIreAyUzeHofxQIUD2IMs+a0d6CheNtfLBHOYKZPgqi2f8cK6Ctfi5RTuXf/cX
	SJG9WcPyR+GrwRLWKdGLydXrOzN0IlpI/OnrT0kLPUXo+P/142KXs5Oyz/qdUaDf
	YWrYygx9nAXEf0aWQEfEX/cCBQ9ZLG3XT1X63rLW/JQV8YJA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2wh19-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmWS5FmP5PySjyDXync55ImNe3Lt+yOuticrlYIO1s3pDnd28LRq1N0M9FRVNNOdQOa2uJexedyYsDpC7tlQl0kR1H3zZ1MSekM+NqHF5CIcDoUFUtXch4gGuOlUnHc08bbqTyTl3OYBXu9aCeQn/sR7WwOwVQNAbfYyPOxY5hQti3GQQdkIydsVTYOksRvTIuhMo9M+Onrw9ATYOcWOQhAC/AQTZORkGWLVdPeneE9mhlqkDKrzV9wBdFfQLxUIXpTwFOqjR/D6cK1zASCu3ajxKgygdSXahGLG0/AYLyyl1bgt+3IJtYWWaL0pSxrzrnGzOP3FeumceI/cotyxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOENStoetWFUNCyAJHubXuDIM4tWlzhY2MeqaKkU4nQ=;
 b=gbuOnhPQ/+0/PZMMMlIuO/GfAtBhyGL4PAX15ikFa7nEe76YMRAbBiRU++bSclIUtvetR7ZQKURhjk0gJ9vLT++NqGpWGIzjXMJV9qsilBaTShWRi+wCfO75Z8fjFqgQJKaN126dCrqetWaU95uLoIZxfimUKWyu4QN3sBI3dMTBBckZkc4SWcYP24fzeEk6tEzSjEUCEa+cwcGRmCB/h25ZKATBQQpVixygBe4mI0O/+TsFKJHodnKL+dwVXpzw9sp5vcxWYN/KgJnGDC7ie808Qx+6PNXXRTC0cK1g7nt/C0OB5xiAU5RfOluCs/rVVLXfcUKQ6h0IkbSfu+9RRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:29:03 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:29:03 +0000
Content-Type: multipart/alternative;
 boundary="------------r20dey9CVZiga6Wi8CrU1muv"
Message-ID: <53f0656a-90db-4c8b-b628-7c1d0cb1c584@windriver.com>
Date: Wed, 19 Nov 2025 15:28:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 10/11] kernel-devsrc: copying rust-kernel source to
 $kerneldir/build
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-11-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251119164804.256364-11-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: FR4P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a83cd72-65e1-4336-f741-08de27aa4756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bXhLbitkb3BWcFFGV3lOV3h1T1pnOStDbmNWT1hJTXdUYml3UW1UblpKbjZ3?=
 =?utf-8?B?aW5hTjFnNTJjSGpmWTlaWlRxNlN3NG9lek5EYmt3c2w4ZlcvUlljaDU3dG5t?=
 =?utf-8?B?T3RuWjlobWZCZ0NjNHJuVklwcjBXaVJMbENVVWdIc3NDemxxbWpDSzVEY3Np?=
 =?utf-8?B?bUN5M1JnK2sxUE10L1ArR3Z2Zk4zMXV0Nm5CeXo4UVNja0U2S0dZZTNLVzl3?=
 =?utf-8?B?YW9Wbk45MmhZQWovSzRIKy9SaG0yTDduUEVWTEZJYTFKSWhMSnFYQzM0bUp3?=
 =?utf-8?B?OGVaNGIzV3UxVFc2TzIyb2U3MWk1ekZnODJpYTdnaHdYSlVrbnhNS0pWTnRh?=
 =?utf-8?B?eWd1Q2FZaTM0WDRzYTgySHVibHY4S2h5VDZyTUl2bEZBTjNrb1pBZCtwSWoy?=
 =?utf-8?B?OFBRSGNONEdhWXBseEVYcnB1ZGdNM1lzclkrNkJRZlcxUXBjWUJkTzJ1dzdl?=
 =?utf-8?B?Y3psaDRLVEU3dnJQMHJhZW9wc3hiYkNoM0JlOS9va01Sek05TldqSThNOHo5?=
 =?utf-8?B?SXFmRkNpVDhhOXNuT0ZVMWF2Z2xEYnpHb3dGNTJkM2FtK01tV1puMzlraFov?=
 =?utf-8?B?YjlPY1IzNHFycDlYSWo4Tkc5cFBTYWpOUkw4cUZsR1NQRDFMOHJBTzFRSlFR?=
 =?utf-8?B?YlhxL21UU2lZOUdNUnBBS2hySkR0d3JXcnpiVWFoTkNDVDVaVndiVnZ1MDhx?=
 =?utf-8?B?WENvREV2QVNDY1FhYWFtTEdrVkhTT0R4RytWNHJGVEozZ0JhSnlVUkMvNWJE?=
 =?utf-8?B?OGExTS92SmhnMlpaT0QwMnR4MTNDQmdIZ3A4eXVGTzVDeVBLZGNTU0dmODlU?=
 =?utf-8?B?TmVVdnNBbVg1cHBlNERNZ2l3eWVSTkRDcFlJMmhTU3hRTldRZlZlSWdNR1lU?=
 =?utf-8?B?cm40N0NPTW43VlgyaE5yZFdXZXBGZjVHUWFGNENLWmF3Tk9BblJoQzVRRW9J?=
 =?utf-8?B?K01iRmZzQnpFRkplYUI0cVlVWkczUVFPK1BibGVQVnkyVkJSYUZPZG5vcEhU?=
 =?utf-8?B?aEhKb05QcXV2cytZaXhnQSs5ZlB0Und6Q1pSRmRFejJmTHNVSTVyeW1nc3R5?=
 =?utf-8?B?REp0ZXRUanUwbHNyR1ZWNktnNVYxZG5BSTNHQ0RQVG5YKzZSTElwSHV2d2lo?=
 =?utf-8?B?OVlBSldSdXVCa25Hck5SdGNNSDZJWFJaYnlFSGcrTkZGd1NrRFp3YWlFSXZV?=
 =?utf-8?B?clZUaTdicDZONE9MajBnNWFyaXN3d0hobjBKNkRIZTluZHRsSHNsTHk0S2th?=
 =?utf-8?B?Um02N0M1dm1NaTdQSWxnNmhsOXNQanRGa1RpcGNobVFnTUJ1YnZPTEZOakZ6?=
 =?utf-8?B?RHZjRExXNTNTeUVHbHNCRzU5dXdjZXA5bEg4NlVzVzNnVzNlMGJnRjRBZGNp?=
 =?utf-8?B?S0Qva0VpaTBmWEJ2YlY0REsvQTllMmJyVE9kRWlvNk80dGE2RTFBcXdMd1pP?=
 =?utf-8?B?SHl4MTVmdWJ1cFlrR0lQbGxaaDJta2VUUDZDaEg2RU5lR3hXYVAwbEF0ZjZT?=
 =?utf-8?B?OVVDOWtDWThzVEpiL2VVNll0dENHdFRidlR5MjArVFZUV0J3WGNsMXY2c3lO?=
 =?utf-8?B?RWorRFdiRVhhTHJ1Y0FVYlRycDdDZm5Qc3VGOS9KU0FpOUQ4WnduWFk4clAr?=
 =?utf-8?B?V0lVenR3WCtWNGVZRUJzQ2FlbjdVdHpCdG5xT2tyOVBMa2JtUDVwMTR5a3Y0?=
 =?utf-8?B?dXhHdW5mZGN0MzNGVEF2elpheUhrN25STkx4eE5xc0lURVhEWlVTejArUjhR?=
 =?utf-8?B?VDBDYjgrMHZhVjErMmVIcEVFT0ZvZ1Jqci80bUgxSFVsblh2K0tDaG55L0ZF?=
 =?utf-8?B?RWVDQVNqQXo2NGZKUFZxaFV4cjA5V0ZiUEczVm5YRzl6cVJQVUVzR2M0a1F2?=
 =?utf-8?B?bE5BMWNiaGNMakJyT3I2NUovaThuaGJFbWJzU2VCMU1NdmUyK0RpaEhnZVll?=
 =?utf-8?Q?C6lVR3B8Bbt8Jlgzvy2NMl+DFlMQVCZI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SnBvbXYzMk02NmxGdWdlNW5YY3lZYVI3dlRCY0daNFNiWUJweTJTRmxkVHVt?=
 =?utf-8?B?enl2RDJoNHQ2d2JDQlpUVHJ2YzhHK01IYTJ2amd0YU85TzFic1dtU2o3OHJQ?=
 =?utf-8?B?VmxteFBXL0EwM1ZxSHIyajhCdngyUTdabGdKQkhFSXZpT25KeVR1NDZncGd3?=
 =?utf-8?B?TWxPa2NYL1NRRHVEdjJURUpyYXV1QUplS0hZTW5udGQwNklFeHhSbWN0dkw1?=
 =?utf-8?B?bEtlc1gwQ0hmYlBvbjVhY0xjN2dmbnVUczQ3dlNYSHhZc1dyTTFoYmJwbXBr?=
 =?utf-8?B?UEwyRGV1TWxZRWF1SHU5TEpTWVl5TWVwU3B3bHg3d2ZGRHF2Zmp4WHA5amZI?=
 =?utf-8?B?Q0dsRjB4TkthU0NKa3cvNGZxK2ZPblFsMFRGbEJETlMrOUIwS0x6TGtXNk8r?=
 =?utf-8?B?Rll5clJtdVBDM0NPdTBWZWtQR3J0U1g4RmZiM1hFaWNHeHlkYXpyTVdqZE5W?=
 =?utf-8?B?bGlzekEzOElTdnB0SWczVXg0TWV4bnJrRC9haEpVanFYd0NRZmJWTlBCUmxT?=
 =?utf-8?B?VUtRTG82VUorOVJnZC9xdUhpRGNYVFhNQ0EyczNIS3VBWnRheW1OSndxazVz?=
 =?utf-8?B?Mm1NanhCRFFaRnhkVXU3NWNxQ1ZrVm9lTXpaSk51Vk83OXN3ZXNPS0VyMlpB?=
 =?utf-8?B?d21JbnpLbldNLy9HLzVPaGlMZU55LzErL3IyczU3MXU1d2ZUK0tQSHcxdFMw?=
 =?utf-8?B?Z3RIS1BvbThVRHdGMVlKeENpdU91YzFLT3dGMnA3N3VTSjlCWFJDcUoyVmtl?=
 =?utf-8?B?SGNqM3I3TXJmUzdPNVZ5ZDNYTWNaM2tJc1lSRjh3THpob0dBZW9CTVdOT000?=
 =?utf-8?B?TXZjT0hTWFdITW02UktlT3B3TWZoNU5pZ2hYb3V2dlR6OW85dHFoYVUrUXp5?=
 =?utf-8?B?YkxQYjhWalZ6NFJLNFFHWElmdHE4VU1ibVZ1RkE0WmdKQUduNmlFMmNOVGxp?=
 =?utf-8?B?STMvUzJldWdGUmF2ZDVYMitKempQYllkSkNENiszYlY1b0NySU1PWk9VS0sw?=
 =?utf-8?B?eGNiV3AwMThRR2s1NFdLT1JPcUpMMDdtZkN6NU80WFZOcmxpWXBGbVpnL3pC?=
 =?utf-8?B?bFE3MVVidHJTTEl4REcrc0orMFltQjhNVUhXdzBVeVRnMTZoTWo2WkdQTEN3?=
 =?utf-8?B?RVViTmtabko0eUVCQTZUMWlYenErMS9wSG1EV0VLK3ZXOEZPYUtORXd3aHdD?=
 =?utf-8?B?OU03d1Zkb3kxdGUxbW1wN0xOVGxSOEhBZGJaT2p5MkRZclJzZzV2azVGaTVt?=
 =?utf-8?B?RTlOaXNDV1daSlVDZ1dxSlg0bzcrRFQ0TWlMUk96bkFUTEZWQWtnLy9Yc1I0?=
 =?utf-8?B?c1cwWDBoUS9JYmE2NHNnYzFBdGFZNlNGRWFpK1dzWXZQZEFJQ3Z3WEpyalBE?=
 =?utf-8?B?aG9KR0lrTUV0R3NqekhiTTZWS3RUdlR1QlFYblhBWXBoVUtrSmdqSGxlMldH?=
 =?utf-8?B?alk2WC9kbHM0eFdYUlRkblNZdEhTUFA2VS9QM1F4RGx4WWNCU3lwa2NZcDhC?=
 =?utf-8?B?cEIzUW5GaFpFWGlCWks3cXo0VC9mRUlWVVplc3h1K05Tb0VBMEtXRlpYVW5E?=
 =?utf-8?B?S2NBWHFzMmtLVDdKOWQvQ2U2S3d4VXYrZjZLVVlYS3hxbTV5bGFJSDNFR1ZY?=
 =?utf-8?B?UFhPb3pMR3pFaVd5aEszdTgrcVhLREsxTHdsUmhqOVF5TzhuajBSTEhvVWJs?=
 =?utf-8?B?ZXJUR2tNc0xEVHNSZHZVdmFiTkZNMVF4Qm5QKzg1SmV4ZUtlcDcrNENqZ1k3?=
 =?utf-8?B?TjJOdXRjSVM1Y2RNZkNVV2JETGZ0ZWFhdVZLeHJod2xjY3F0RzlseW5sMUJZ?=
 =?utf-8?B?U2xxZ2NYRXZFdXZZeWpqS05JK0dQczkwUE0razhrM3ZDcDNReDROY2xkZUZU?=
 =?utf-8?B?ZS9pc2kyYmZnMkt4UTRIeXV2TnVmSmd2ZEs4OTkzTEJySm16RFhXZ0JDYlNC?=
 =?utf-8?B?emlMamd2S1g3SzF6Y3dJWVI1Sk9OUi83K3V3ZkUrejJTZ2MrK3hWMUhtOXo0?=
 =?utf-8?B?ckFjWXVhOWpCRVBoNmROVVJFOWlweXNoZkNOVThrdW9neW5lSXUxYnZ3WGl1?=
 =?utf-8?B?MHpwRWl0MnFBaUtSejYvS0ZRQXF3dWJqOFFkR1YxNFFkZldSVWQ5ZUxuMXlG?=
 =?utf-8?B?WWFpc0NZRVRnaVQ1MHFyajI5eFdoaVZEK1FzbGhLODcxT0VsSmQzeWc2eGpn?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a83cd72-65e1-4336-f741-08de27aa4756
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:29:03.0867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O38ZSz+PBZ/u2bfIEb32RFwlg3ppad5qeWXal+bdcATUonNUaFi2mx68zS8fgV1OlhB2oti3MdoOOY0QmAOPEt5Qs5dmpvNZ1NR66pBgjHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE2MSBTYWx0ZWRfX6zOjRVAU96gO
 hkqcYR+6fpw29YmgWSd1tEubLUfNcSQYY6jRoaCX6n13hUWOwjYI4dNZAQ7XFYSbwjuP28ae3sq
 HHo6VhsN+qDZZU0H+WZZZucXcS5nTs0zh3S8EvY3mdmwu6/4jFrr9BSHFV3xbaqndjleSUn30nT
 bLJynvPKgZSPX8L2irUz2Vjl3y0wS8N7C9uIAd6Boxpn9qCcTVuLgVEmScjPrhwSHHglzvn/btS
 3EYdJys1LCj7Kr8J3rX9VgAaMipg/zp1Yz83KtkQm/ez74716mzcll5tbpFgpCnhaLeRGSEox0D
 uAYF7SGiCi5GCGyQ9Pi7RkWYOrghfePo58B0dLRb+D7JikZi7Q3ssrxdiAn+4xiSAv44EgqtSuL
 m5KUfxF7wFBWuJANIA57Y6JBsOXZ7g==
X-Proofpoint-ORIG-GUID: XFjdXWSzAwlIiQnNNa98wIHduILBnUFE
X-Proofpoint-GUID: 2b9Y8ikLz5mf0ReSnlvjjFhScG4W0UTu
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691e2891 cx=c_pps
 a=QNQPV3WJHVGG3OZWPlqtww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=8AFfWwfpIlDpDho13wcA:9 a=QEXdDO2ut3YA:10
 a=fVzwJZrXj5cDK8Fuv0EA:9 a=dhqxbbPLJQ5fR5Tk:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226589

--------------r20dey9CVZiga6Wi8CrU1muv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-19 11:48 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> In sdk while running make prepare in kernel-source directory after rust
Style and an extra word: 'rust':

In sdk, while running: 'make prepare' in the kernel-source directory after

> enabling rust config. it will throw erros since only makefile is present

s/./,/


s/erros/errors/
> in rust kernel souces.

s/souces/sources/

../Randy


>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 411c99ba30..615c53dd22 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -139,6 +139,10 @@ do_install() {
>           cd ${S}
>   
>           cp -a scripts $kerneldir/build
> +
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
> +            cp -a rust ${kerneldir}/build
> +        fi
>   
>           # for v6.1+ (otherwise we are missing multiple default targets)
>           cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :


-- 
# Randy MacLeod
# Wind River Linux

--------------r20dey9CVZiga6Wi8CrU1muv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-19 11:48 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251119164804.256364-11-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

In sdk while running make prepare in kernel-source directory after rust</pre>
    </blockquote>
    Style and an extra word: 'rust':<br>
    <pre wrap="" class="moz-quote-pre">In sdk, while running: 'make prepare' in the kernel-source directory after

</pre>
    <blockquote type="cite" cite="mid:20251119164804.256364-11-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
enabling rust config. it will throw erros since only makefile is present</pre>
    </blockquote>
    <p>s/./,/</p>
    <p><br>
    </p>
    s/<span style="white-space: pre-wrap">erros/errors/</span>
    <blockquote type="cite" cite="mid:20251119164804.256364-11-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
in rust kernel souces.</pre>
    </blockquote>
    <p>s/<span style="white-space: pre-wrap">souces</span>/sources/</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251119164804.256364-11-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 411c99ba30..615c53dd22 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,10 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2&gt;/dev/null || :
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------r20dey9CVZiga6Wi8CrU1muv--

