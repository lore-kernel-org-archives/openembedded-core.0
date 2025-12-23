Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C696FE6B276
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:10:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95966.1766470217510542915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AcQIJs5V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452694da9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5tnB81878464
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=2o4pBMWZKZi/d7IehXnbGO
	+JFMMNyfDEpd5iELZnFKc=; b=AcQIJs5V9UcRMcmYbDLP3BC4VDQZ7zUVxYV10g
	uJVJX25XA/XXleBK3Y7VAQvFRS5vxpvsZHYcVJ8HS4GAWHYWEMSLWtUhMPjAZgAP
	Bq6DV1OT5FWOM3FMP8jx7wKZNCrRkFSuL6BUhZsgnbbT9B26QRGzIW5GQhehDdaD
	FZSwLdDWimVzZNjPSnWNdzM+++UoH4w6LA6Y2+/njsOZ9JCVPhljNWjWbs9jGgMs
	tQAfEWb9D69pK/P/HZQcskurgCgFGKmQDLo9Wc/GWdYWew9RsWQFcVnYdB7XBwna
	CZA13YNdIVEVIPSJlHI9VD/xqAEZBdRzr4rEUtXKLGMDpcRg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjs44-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 06:10:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs1z+H/05Mt+eqjVxA6x6WHnsJShW+BD1R7vqF53N8+TeoyZ4Sw14JOoYitJzWBKy/vbDeF3qDFikdRwDm9VZ6EOB2W2Ge7FHkyLcewfhTjOVUoVD/fNaiwtchVLc8Fh+gd90+TLkebuIQj8U7U2QCi63bhQh1OQCl+4Zg0Ud7QSwbNOQR5N2rdDmxFg30Kn+vDzo6F9+F/D8RfOEP2OlVrEXGzwVM/FuZ+sC/5OpMCOc5ZKncXTHqPzvWfsd4fEd6As+f4Ad8ThhKWy3a+NUhhKBgWSpM5tZ/7atT1y0ZENufNq5SuxnmLnwQ+RV3fIZc+fqBuI8IH98S3XixzfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o4pBMWZKZi/d7IehXnbGO+JFMMNyfDEpd5iELZnFKc=;
 b=DqnMv4mtjxvkJ+yw1ND590hco7YU6oO1kONtyBeakZEa1P3/P9TxG4BYXHhIdpmf58i4ePoXD7xI++B+DbrEzLYR6PGNQ/5A9ToOU7K3cvySaTAHf1uQOnVQnG0pNQHGhnXKszamJfR50rKW5+kh+/EXg0EU1CAc9CHO3GZLxeLFW/7+mY+4/sdhtBOniVz3v8fd+XIXaCVt4CXA0I1wjmX7QRQekkZw6aLebURljZfSjcwpJwFMUBr0WLsr4KFJk/nCfYZKZR7ItC0TVp+Vs3CMYi831eoiwbax/qxvhl0MSQqOmR+PoqKDUt5ElEP8T6eOp/WTZwFwF0YAyNs4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 06:10:13 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 06:10:13 +0000
Content-Type: multipart/alternative;
 boundary="------------pTIKDb0sGe2nuSx6bh7AOzQk"
Message-ID: <cb67ca35-85ee-452c-8359-e5aa7715cb4c@windriver.com>
Date: Tue, 23 Dec 2025 11:40:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: enable default uwtable and ignore arm no_std
 test
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        hemanth.250302@gmail.com, nick.owens@eero.com
References: <20251222093830.2658141-1-Yash.Shinde@windriver.com>
 <20251222093830.2658141-2-Yash.Shinde@windriver.com>
 <c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com>
X-ClientProxiedBy: MA5P287CA0173.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::9) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM3PR11MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: ec5ded0c-d1e6-49ef-e73a-08de41e9ef01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vm9FMlZBRmM3Rll6TS9aMUl0Qjk4Um04RnZPSjRsa0xZL3p1cld0Ymo2ZVd2?=
 =?utf-8?B?WG5weEI4RDV2K0tOUm5IYTJNbHJDcEVRTWFJZ0didytwd3M4R2RwS3AwZito?=
 =?utf-8?B?NjRiR0hVVVY0aDFocHdGMWxoQVQyUVZnMkg4Y3dIQVJBMitNbTB6OHV2QWxZ?=
 =?utf-8?B?ZnRHQmo3eFI2b3VMTkRHNlNna1g2bXFya25weHRiK1hCVTIyY1A3R1RLYWVP?=
 =?utf-8?B?Q0VTczYxSnhDSUJjRGdiTGdVTDBtalF3UEk4OWZ2SmRuRlRXY3gxVmsrSUFI?=
 =?utf-8?B?WWtRblZ5RnV3b1lQWGNobzJ4VzluYksyRXdZYjQ2ajVyUDB6dytsaFJBb01h?=
 =?utf-8?B?NXRUM3VEOU1RVXRXQ1hQTUp2RlhFc2tpWVM5OEcrRUMrd0M5V2xvTTlpRW44?=
 =?utf-8?B?QUlBUEpIT3lrQmZUMWdoK3JNUkNteStkeDR1aloraW5wNHNGdzJPeTBGVmdQ?=
 =?utf-8?B?QUt1Z0xDczdlKzlCczM5dTdVSXJhc3RIR1VaTVZaRmw2dVZWaGtvTGgxSDdN?=
 =?utf-8?B?RUtpVGlIWEdsVXo1SFRobG8zUHJLMVR0RnJHOE5YL3p0VHJCeWZvL3ZDTjVh?=
 =?utf-8?B?eTg5T1JUc1BzSkxPRUE4TW5XL1AyWkxGMDAzUDVNWUNmbnh3bWxuTU9WVisw?=
 =?utf-8?B?R3VFTWhDaEFpL1poWkRzWjRVLzZSNkcyZUtKeHRodDJlcjFpYjdVS2xlZDBt?=
 =?utf-8?B?bnVRaXpPdnR3RGx3TE1yMVlvSHE1RkZ1VzRRRjhibkphY0tyMnpVenNSWHla?=
 =?utf-8?B?MDRRN09ERDhhcUtYa0M0bHZvbHhXK05XU1dpZHVCTjhHR3VHRndsSUVPQzJM?=
 =?utf-8?B?VHhJMEdxZjRGUitIb3FnRmdoTTNOOVFGZGhYdEJkanZHMC9Sanl5Tytsc3lD?=
 =?utf-8?B?TUF5ZUVucVlaZU9BVzkzeEVhbnhkdS9lVU9jOXJTK1FCZ1pvODlwZnJTY3lJ?=
 =?utf-8?B?Mjl3eHN6UEU3VEc2enJTcXdXSncvblMwQTdRZXczenV3NXRKYjZWekliTWxu?=
 =?utf-8?B?WFl5Y2FZT3JtWVNmOXNKdTF5eWtYVUZSWEFETFpFRUltcDBQb3g3K213SXdp?=
 =?utf-8?B?NXIrSW80MkVqT3djajFtcHhrc1ZVZ0tCWXIzUkVwSDI2REMzQXZKQUxyZjBC?=
 =?utf-8?B?c3VpRjdtR0FudlBqTXhCaGxoUDEwbWl4T05qdndvbW05SVUyN0p3MEFZMm5n?=
 =?utf-8?B?RXkrdXJOSk8veEliTWlTOXpsVXlHaGRwSUplUHdWRWZHeGNNUE14bHdPNWV4?=
 =?utf-8?B?eDB0UzdEVTJ5dG1ub2dtQkxpVnNLcFY2Q2hLZCtpRnBYanlPcDMwUWhXMWFw?=
 =?utf-8?B?bHNWL0laL0Qza3ZwVjhIOTB2dFFnYnlrWTFjVDZVUGs3ckpPL3h3WVAwdTlB?=
 =?utf-8?B?eHlwRUdXaHgvUXFYMnBUZEVsa3ZjZk1pTTNOMmN0VUp3b2hMazZIQnlSM3B5?=
 =?utf-8?B?bWpNYWlGbDJUYzBHdG5od2grQ2lDWFFJZ2dlRThlNDBVVXRWRFhOOExZWXAr?=
 =?utf-8?B?TDQyZG03VjFQYVJHaWJhTTJGYU0xVlVyOVFWaEUwc2lKb2U0dzdsaWwwb3lj?=
 =?utf-8?B?TS9jdWV1alNSRG1FUGdQSTdVVGFCMzdHV00zYXVyUjZhcWJjbWhjNjNXSGQv?=
 =?utf-8?B?dURhaGNpc1VNb1VscmJsa1dscDZqVjVUNHpMNEpDMU1OdGFndiswbnJKdDBM?=
 =?utf-8?B?L3JFVmc0cUFHT2I3RmFVVDA2Y0grWjMza0xwVyt0d2diYU5kUlBWUEZSeVZD?=
 =?utf-8?B?THhvU1JKc1R2c0hqNGdaT1FsVkpVZmU4THdkSXNuU3ZmN21LdDZzVXVmZitK?=
 =?utf-8?B?eklCUFQwY1VCejVXOFkxWFU0d01sTjdaczdJS1pRTlJWN2ZBYVROMDZwYVhU?=
 =?utf-8?B?ZUhEVlNIci83TVZ0MEFhc1JjdGNjQ3Y5YnRiTkR5VzUwZEs5VTc0d2lObE9o?=
 =?utf-8?B?NmJBTlhBVUIzY1V1VkpJVXBjY1RLc1V6V1kycnREWktSTVp6eXZjYnpXLy84?=
 =?utf-8?B?QXdOR3ZXTVlBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDJyWWVBRnNLU0lMM3c4cnF2azhvQWc2aDZRTWpKb29Ga25la1BCQ1lWbmNU?=
 =?utf-8?B?WVFXcDBRRytlL0ZXVCtZbTZmeThkRFcwYXU5bmxUcmtYcGdqbE1YY21TYnlX?=
 =?utf-8?B?bElYUlhtNVJyanhnWm84RFdxcjg5cm5lMmtzQjFIdVZsaEovRGpISDFlTk9a?=
 =?utf-8?B?ZDdLMHVZZjdoaTQ3RW84N3NzT0xUSXc2cnlGQmtWb1BoUkliOE9UQTZ1Z3My?=
 =?utf-8?B?T0Z1SjY4bzdrZCsvalEvS01qMFgxai9xM245cFlUcldxVEhZQS9tZHUzQS9j?=
 =?utf-8?B?TVgreUVZRThwZE1IMmJPVUM0b2FmaHNPaWI2bG1ITndwOTQ3cithNHozdmkr?=
 =?utf-8?B?cUoyeFFqTW9TTzFIZVFWbDU4MGlzOE83Z2pPajlXSUxIUnN2aENKcXFzc0FY?=
 =?utf-8?B?RnJYTm91aDBCM0RlZ2x4NGpRS0oybm95YUpndXhDU00xbmJxRVdyUmxKTTZX?=
 =?utf-8?B?MVJOdzRMNllxLzFzWlIyUDU4RVdRS1VtaEZ0RWxFQm1tRGdRamtIbitRMnd1?=
 =?utf-8?B?WnNvYWUrdE5aRFFyZGVFdmVsYVZkaHZkVU9lcXY0WG5TSkJMY2VFRnZUNUI5?=
 =?utf-8?B?bjhZODRMeDh4dlVlNkhQUVUrVFRBaEw0SjlnTTJ4VCt5WWsrSHNRV0ZqKzF2?=
 =?utf-8?B?MmxVZ3R3aFBSemdQRWNUaFpjdm0xVzdKa1pWamEyNmNXbnMzdE44dDM2Z01y?=
 =?utf-8?B?OVM1NVRUSkJ0NlUrKzVYVGFlbk11TXFKTlpsdmpFU1FzTEdUQ2dZU0o2clpN?=
 =?utf-8?B?blRuTm11SmVuRDBieEt3U2lqb1loaWlLcVk5T1hpaTA3a1RSSk1mNmtpY2la?=
 =?utf-8?B?LzBEaEg2V3ErYUQwVzNnYUNFYkppWkloWXk2TDFlWFdCUWpXaXYxS3czZVFj?=
 =?utf-8?B?b1NsaXBYTGV2Y3ZSYzF6TnBEa0JDb0QxU25GdWg3V3R4dDY5VTNHN3ZDenU4?=
 =?utf-8?B?emJFOUJYWE9kd3lYSTBhb3NBVjVXMUJESWY3NC92YWp0ejhmQjk5R2lxVXVS?=
 =?utf-8?B?dmo4Q2pQKzdwU0QreWlYUUt5aUNmemxpTHFpMGpQdHZwcm1GRG9JZ2VTa1dr?=
 =?utf-8?B?NThWV21XOW5TMXlDZk5DM0c3VEF0eHJyWExFNkRYYVFxZjU2R0ZYOFNJMk9r?=
 =?utf-8?B?b1ZpeHVQRmVsRjRXUzZMb1B0TlV4VDFFekZHeERpUGx3dWNJYnVCaWhqSzJK?=
 =?utf-8?B?OFJocUdkbkxWVFdiaGZJWlY2MDVMTWtvWkhrd0hNTytTd3llcWQrTFJuaUxq?=
 =?utf-8?B?bS9rZXFnNlFuck0vSU1vOGNISzNQemdteFhkNHkxVHFIMXRvYnFLMXY1WDVp?=
 =?utf-8?B?WThSOSsvSUlZQmNRWmZXWGRWcEVYVXVRYVhrM1owbWRDbEI5N1VsZS9yT0NK?=
 =?utf-8?B?eDB5NFNFUzFXMVE5NXZhTmdma0pZblFOZlVMenlzYitBeFJjbDNVa3NRaWZ6?=
 =?utf-8?B?TDRXRGpTZzBzOTFHcnNIMmVqK0l4UGhoSEtvWGlOcVdOaTJGb2dqb0QzczA1?=
 =?utf-8?B?dGFtQnRvNzRGWHBlYTkxVzJiVDkxRnI1YWU3ODhKcnZSb1VzL05NZFZ2bUlU?=
 =?utf-8?B?SFRnYzBJV2d6Z1UvS2JoZ1RranZRUzE0MS92bURhNTRib2NJWTBqTURacncx?=
 =?utf-8?B?K3RwZ3Y5MklQajRvR2I1Z2JTMENnN3NYU3hvdDAyNUxjVXdYOTduOUkrZHRs?=
 =?utf-8?B?aE9iYW4wZC9iU0RYSEgwUWpoTzR6MFdtdWowZlB5VkVWbkxFejdWbEJqalll?=
 =?utf-8?B?bFh3Nzd2d2V3QjdjdngrUU44eWdmVkdIeGJudlFHVXFvUlZ4TUF4NE1na1VF?=
 =?utf-8?B?T1kvNTZmb1BLWGxWWkZ5aCtLMmJNQnlCYU81bWxRd3RsUnhtVFhuY2grcGd4?=
 =?utf-8?B?M0JPemNzTUlQZUZ6ZGZKSEEySk81aGNGZ3lKd1FtclAvVC9Wa05NMDBsTEJu?=
 =?utf-8?B?dE9rWGc2NXpMcU9RaEJYMzV2SDl5VWZlYzF4NnZxRWJua3BMME9IZXgvb3pz?=
 =?utf-8?B?cmpCVXY5dkxhd1hhY2JHVnpialRGdE9BNU16KzBBUktOK2hPOEZpeUhQT1po?=
 =?utf-8?B?OEllUml2TzVKaUhPL2VuMVNSMFF6NVQ1MjQ4MWcyQllNTmxjL0VtekJsRndu?=
 =?utf-8?B?WExuL21QQm53ekhuazVEYjVTRXJvalhCd2hpOHBZeUdsVG9yZkNWdmhGZHE5?=
 =?utf-8?B?TVpiTDhGOGNma0VjSUp0S2t1dldlcis2VTNsdXVuSXJHYmQrYzQyQisrK3Nn?=
 =?utf-8?B?Yi9naVlmci9SanRzWEtXRUFJWXhIZVBhczZrVXMzU2Q2M3ZqMnp5Q2FTUjhB?=
 =?utf-8?B?TE81TXdKQzRhcHVyaTlaZ2JwVWl6REtySU5xdWc1NllHRjNNRHJtK0ZoMzhC?=
 =?utf-8?Q?eGlW6v8rHhoH4FT0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5ded0c-d1e6-49ef-e73a-08de41e9ef01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 06:10:12.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eazDtPNreVniVJAxdDCZLeOC7SCG17RNWvsUudRduRs9FzPrl5grGx99aPJ1a/h0I9J8EAMv4AvlWkAPim2EyX0qTLM9o252u7POh5Isq+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: qaaMPnPJy7knlHhBXYggcEC-k0vNhH0Q
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a3248 cx=c_pps
 a=zrUOGFyhpnkGsAL0isy7CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=jCe48yrmGWrrPl10UawA:9 a=QEXdDO2ut3YA:10 a=yw3zE31SmrWE2ZnwqCYA:9
 a=NmpB2aXt5C5Z11rZ:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: h2-9iw9G6lcTrTbdiLfqV5SZcsVpsmIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1MCBTYWx0ZWRfX4/eHAFtBXuzm
 B/zsZlEYoh2rQOJZ/xVmxVGh37xA9KkcQeW01D+WFQHye+IjhsLauo9w9MZTzHRLf0ynSJ3yuEt
 F2YXpHflDPjGT8uW922UUJ+tVZC6grSDwsi0g2NfY0sWVREmUFX7dlDdypb+vqoTcfVXcUxejz3
 1p92nm6fd6Zpw8ucSidWumhs0GfAVhSQpf3NakFVuQ9JyC2PjXxMSHqijsF/hxNgK8R/2bYN35i
 M3UGE7Ogyxw4wx3o4crQdC+kZZdOMKOrEQk0/3msmkRQLiWm4uU+S/3TGrTqko8r3jelin854A3
 mgiZ2x7lUPnEc17lX9ov1a1v2o0kMkYoIaIho3RA13Qb4Hz8gDKHRUx/W9+Uyako9ILG8JLoOIw
 AQuPb6GKglNsnQldogUFXMoiIlXm3bGk8AIHcEGIEBpHVZNGcpYknXOJFArJvcWLFpBSUvICHVZ
 a3QI00ZCsEkZi2ucrLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228448

--------------pTIKDb0sGe2nuSx6bh7AOzQk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23-12-2025 04:10, Randy MacLeod wrote:
> On 2025-12-22 4:38 a.m., Yash.Shinde@windriver.com wrote:
>> From: Hemanth Kumar M D<hemanth.250302@gmail.com>
>>
>> Rust 1.92.0 adds new test that require unwind table support to be
>> enabled by default. Set `default-uwtable = true` in the generated
>> target spec to match upstream behavior.
>>
>> ref:https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805
>>
>> Also ignore the no_std simple-runs UI test on ARM targets. The test
>> fails with panic=abort due to a known unwind table issue on 32-bit ARM
>>
>> https://github.com/rust-lang/rust/issues/146996
>
> Okay and I'm glad to see the upstream issues linked.
>
> Should we make some of these tspec decisions set-able by well-informed 
> users?
>
> Maybe they can already do that using this horridly named "FEATURES" 
> variable.
> (rename to RUST_FEATURES maybe ?)
>
Most of the tspec features are set explicitly here.
We are analyzing on the possibility to check and set them using FEATURES 
to make
user-configurable.


Regards,
Yash

>
> For example, this bug:
>
> Unable to produce a Rust static binary with TCLIBC=musl (oe-core/master)
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=16076
>
> seems to be due to hard-coding dynamic-linking to True below just 
> after your:
>
> +    tspec['default-uwtable'] = True
>
>
> change.
>
> I've CCed Nick in case you guys have a quick work-around to enable 
> static linking.
>
> ../Randy
>
>> Signed-off-by: Hemanth Kumar M D<hemanth.250302@gmail.com>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/classes-recipe/rust-target-config.bbclass       |  1 +
>>   .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
>> index 33a290412e..2a06c4ae8b 100644
>> --- a/meta/classes-recipe/rust-target-config.bbclass
>> +++ b/meta/classes-recipe/rust-target-config.bbclass
>> @@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
>>           tspec['llvm-floatabi'] = "soft"
>>       elif fpu == "hard":
>>           tspec['llvm-floatabi'] = "hard"
>> +    tspec['default-uwtable'] = True
>>       tspec['dynamic-linking'] = True
>>       tspec['executables'] = True
>>       tspec['linker-is-gnu'] = True
>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> index b39b326455..d1fba81612 100644
>> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> @@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
>>        fn linux_hwcap2_aarch64() {
>>            let file =
>>                concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_data/linux-hwcap2-aarch64.auxv");
>> +diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-runs.rs
>> +index af44dfe..e6674e5 100644
>> +--- a/tests/ui/no_std/simple-runs.rs
>> ++++ b/tests/ui/no_std/simple-runs.rs
>> +@@ -2,6 +2,7 @@
>> +
>> + //@ run-pass
>> + //@ compile-flags: -Cpanic=abort
>> ++//@ ignore-arm FIXME(#146996)
>> + //@ ignore-wasm different `main` convention
>> +
>> + #![feature(lang_items)]
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

-- 
Regards,
Yash Shinde

--------------pTIKDb0sGe2nuSx6bh7AOzQk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-12-2025 04:10, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com">
      
      <div class="moz-cite-prefix">On 2025-12-22 4:38 a.m., <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:Yash.Shinde@windriver.com" moz-do-not-send="true">Yash.Shinde@windriver.com</a>
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20251222093830.2658141-2-Yash.Shinde@windriver.com">
        <pre wrap="" class="moz-quote-pre">From: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:hemanth.250302@gmail.com" moz-do-not-send="true">&lt;hemanth.250302@gmail.com&gt;</a>

Rust 1.92.0 adds new test that require unwind table support to be
enabled by default. Set `default-uwtable = true` in the generated
target spec to match upstream behavior.

ref:<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805" moz-do-not-send="true">https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805</a>

Also ignore the no_std simple-runs UI test on ARM targets. The test
fails with panic=abort due to a known unwind table issue on 32-bit ARM

<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/146996" moz-do-not-send="true">https://github.com/rust-lang/rust/issues/146996</a></pre>
      </blockquote>
      <p>Okay and I'm glad to see the upstream issues linked.<br>
      </p>
      <p>Should we make some of these tspec decisions set-able by
        well-informed users?<br>
        <br>
        Maybe they can already do that using this horridly named
        &quot;FEATURES&quot; variable.<br>
        (rename to RUST_FEATURES maybe ?)<br>
      </p>
    </blockquote>
    <p>Most of the tspec features are set explicitly here.<br>
      We are analyzing on the possibility to check and set them using
      FEATURES to make&nbsp;<br>
      user-configurable.</p>
    <p><br>
      Regards,<br>
      Yash</p>
    <blockquote type="cite" cite="mid:c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com">
      <p><br>
        For example, this bug:<br>
        <br>
        &nbsp;&nbsp; <span id="summary_container"><span id="short_desc_nonedit_display">Unable to produce a Rust
            static binary with TCLIBC=musl (oe-core/master)<br>
          </span></span>&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=16076" moz-do-not-send="true">https://bugzilla.yoctoproject.org/show_bug.cgi?id=16076</a><br>
        <br>
        seems to be due to hard-coding dynamic-linking to True below
        just after your:<br>
        &nbsp; <br>
      </p>
      <pre wrap="" class="moz-quote-pre">+    tspec['default-uwtable'] = True</pre>
      <p><br>
        change.<br>
        <br>
        I've CCed Nick in case you guys have a quick work-around to
        enable static linking.<br>
      </p>
      <p>../Randy<br>
      </p>
      <blockquote type="cite" cite="mid:20251222093830.2658141-2-Yash.Shinde@windriver.com">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:hemanth.250302@gmail.com" moz-do-not-send="true">&lt;hemanth.250302@gmail.com&gt;</a>
Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com" moz-do-not-send="true">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/classes-recipe/rust-target-config.bbclass       |  1 +
 .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 33a290412e..2a06c4ae8b 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-floatabi'] = &quot;soft&quot;
     elif fpu == &quot;hard&quot;:
         tspec['llvm-floatabi'] = &quot;hard&quot;
+    tspec['default-uwtable'] = True
     tspec['dynamic-linking'] = True
     tspec['executables'] = True
     tspec['linker-is-gnu'] = True
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index b39b326455..d1fba81612 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
      fn linux_hwcap2_aarch64() {
          let file =
              concat!(env!(&quot;CARGO_MANIFEST_DIR&quot;), &quot;/src/detect/test_data/linux-hwcap2-aarch64.auxv&quot;);
+diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-runs.rs
+index af44dfe..e6674e5 100644
+--- a/tests/ui/no_std/simple-runs.rs
++++ b/tests/ui/no_std/simple-runs.rs
+@@ -2,6 +2,7 @@
+ 
+ //@ run-pass
+ //@ compile-flags: -Cpanic=abort
++//@ ignore-arm FIXME(#146996)
+ //@ ignore-wasm different `main` convention
+ 
+ #![feature(lang_items)]
</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------pTIKDb0sGe2nuSx6bh7AOzQk--

