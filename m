Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAABCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 05:11:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1288.1760591488820208179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 22:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UFQkmAkE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2384ebcd45=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G4Kk5s3790124
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 22:11:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MfiFxffVC
	tEm02Jjh+mFEsaC9xawv75xLC6JoCVSUTA=; b=UFQkmAkEWyM5GMUCBFK0GxjHY
	QOX+65ulAaCmEv9sUZZb0nJe9hD2U/cPYG8THo5N+gLjbvOo2dH3SCxwlHhT4pxz
	g3NaJjjyN6AkLnrlPitn5GzBr56meAfKmZloEuzOwWYwCjY4VEgznSFrnS6T0m5j
	arMN6Nq/kb/JB3Ke75jmLh3fx01jKT64smmNotJ9O5ImahZtc084Txd5JMJ9EGE0
	hnnXpH29LmKeG19JLu0Z50dSbNIDyBto6MQSKCYF+XuAeVOgMgAk6zzKlW8fUM06
	GN2K7N4fZUuQUofgGxNVFdoOeG7gWA7dMjuODMRB8FCZf76//AIKhl74zJjgQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1nn5p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 22:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ0B8uET/OgB4yOWIakWIS7DsZovChSFW+iORfstca/b3cZz3dx+wJQRzOiqTc5DoNU4fPLYRHxXwo4XtWsaIujM5t3Y0575+ckNpEKn3/pwXfAF8HlI1M3rSVRG/uAfq71e8YqRH2zuVyQunenBPSnNBf9cr3NX2e+aU/JXZt6vrDo50qXKcT32WbC9CoOIUpZtAYCfAmaKGDAdyVzEMClcd4w0djvd92mY8n4IFF0rqS66FtMKxgKWg4PDOg7sZcCYerk16FHAd3m6wUjTrF8jaWX1s7sB5n97T0UY4UlQxQRSELCZzAA1rrfWkCKqfj0Q4OxlY5aSD91afsCccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfiFxffVCtEm02Jjh+mFEsaC9xawv75xLC6JoCVSUTA=;
 b=di3PkujyZzAFSiVI1z+Mui+YNBcA8K9sQ0elwiYkjS34QCd2oxrxKZl0ymI3DQskvYZyC+14gdvMDKbRl+TqLxNghIq1aUO1w1XFgy/tbPE1uc2Zj+YDMxKFDqs6fp0dlDb5MfGwv4yVB/UKGahF6nyfqZqHaSP4Ze9xJz2lWTbxoq32IfL4raBJE48j9pnDsl5a8xSdBsQEjnNlfHFNHnjZZtjaPrQMkvPhfeHqJJpBQx8dpw+LZZZ2W94mxvM4AizDs6aRmOVxU1plgxroGFusQ2/rVVel25DGU4777wlOG7nYrd3zVACYcsi6Tgom2uyAkO3Hg6+DX5eknXKa/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 05:11:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 05:11:25 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] llvm: Upgrade 20.1.0 -> 20.1.8
Date: Wed, 15 Oct 2025 22:11:02 -0700
Message-ID: <20251016051102.1664140-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 6651f8e1-21db-40f3-9374-08de0c727475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bU1RV0VMV0xWUDFic2gwSFZBQVoyWEVzcjFaK3Zyaktxbm82eHNFd1JmdEtN?=
 =?utf-8?B?N0hJaHFZZWVLS1RXU1NJb3lQd1hLVDZvcFZiUEw3VHJINmxZMnpRcEdZL2cr?=
 =?utf-8?B?TWhoVkZNcWs2RG1RaVBQRTlxcTYvWnVPb0lZL2xjREJyRHlucGZjcVl4dzRE?=
 =?utf-8?B?UWVsZ1RBMmRuWE1WYlgxeFhYdWhMQVFnb2ZGeVRhdEkzU2xIOGhGWmRjcFdY?=
 =?utf-8?B?Qk9LbVQyZHpDdGpQN3JaMktIQzVqdDJ1R1prM3ViTTZBUEVTOUNKZHlObWJs?=
 =?utf-8?B?ZVNzL1VrZ2M1aVJGZUh1YkRYTkEvbkxEMjdUYXZxeTd4T2RKbi9LeFdEcllS?=
 =?utf-8?B?NjlKbTF6QmlIVjdxQWdEdFV5bzdRZXkrSFZWQWRnSTdOZTVCV2Y0ZWRSbWtJ?=
 =?utf-8?B?UlZ4YkN0L0NsdjRTYjF6Q3MyT0UxbWk0aGVsUjkyMzZHQ3U0d1RyVjcxejZj?=
 =?utf-8?B?SzdkVnkzSmwyVmdMU0EwSitOVzB2WWtkcXBrQStjOUxXMmhML1ZvLzlwMU8v?=
 =?utf-8?B?OTVENlpvSGJDeFFRQTMwdXErVUYwNzNvYTJFcjhQclpGUEpzb2ZLWElnRE9K?=
 =?utf-8?B?djJWOEpzSm5mRDdONGpyUW0vY2ZEc2ptM3JhSUlxYk9zZUFydE1zU2pheVow?=
 =?utf-8?B?M3BCOVFjam1sYm9BNVdzVXRGeTFFaHN5a2xVOUswWk11YzlaSHRXdmVvSkt3?=
 =?utf-8?B?QU41SitKQlkybFdVTDdGTGpIeEdQTXNDL3VhVkQvTEx1cXRFUmY4Z0t3UWMx?=
 =?utf-8?B?NUxyYWovelREL29tTnVTMTI1MTd1eFNxT2cwSG12cHdFU3RjMW5LbVpjVnl4?=
 =?utf-8?B?RngrOERBcjJETStBRFlvb3k0WTViY3dRRWRZa2lOY0p3OU93MnZRM1ZYb2xo?=
 =?utf-8?B?K2hkOVBOSmdhN013cTVZdW40eXpQVUEzeVRjT0ZzdmxiRmZwMUY3UE1UMUtT?=
 =?utf-8?B?aTN6VjN5aGR4ZHNsOEhQUmcxRDJyK3lld3VDaHZ2Q0hhTFBSRzNVWk1Lc2pi?=
 =?utf-8?B?YmczYVpGb2d2czlDRUl0ZUxFTWNId3FDZER2anNUdnRLck90aGFwWWpuMWYv?=
 =?utf-8?B?dGJqNk1vZUZnSHNnbGZ4K1EwdFpBTWQremUvbzdwV3BwVHdNbmtmWEpWeVB4?=
 =?utf-8?B?cUZHeTg1UXNFTjk4TGxuWmVMREJYRkJWayt5RG9KcVVQV0RsWVFnUGVnOG1q?=
 =?utf-8?B?Mm5YaEx0K01SUGltc2FQTnBEVzc5RlhVSUd2QnFTS2NmTVJJNCs4alZUc0dE?=
 =?utf-8?B?a3RTV2ZvVjlpdGxwTXRrZGhLWHlHSGdFQUw4cGIwRUx0WWxlNzY4V2pwbVpP?=
 =?utf-8?B?VTlhM2ZMYkY5S3hKbmJSRlI2SU42cTArQk15VlB3NHVIY1o4SXV5bWMvOTI3?=
 =?utf-8?B?ekRrNmJKYnhGQ3hOY0ZFQmk0dE1oSXdUNExyWm1FS2diYWFlYk9TZlZxSG01?=
 =?utf-8?B?RGY5VnRkbnRESmFMOHVEaGM2aVFUSFNjRUsrOCthNkN5WnZyZTliRzZPT21r?=
 =?utf-8?B?UWMyK3ArYUQ4L0k3MkdKTmxzek1tZVFJKzlvNzRKVkloODhCOXgxQ3E4aGJ1?=
 =?utf-8?B?bXNQZU9RdC9nUUpxUWVNQWZ5QkxObWxtSmhsY2ZLVUI5QklBU1grdUJtM0ho?=
 =?utf-8?B?RWt6cVh6eSs2akxKNytZamt2V0FSbjdSL3FWZE1sRFZ5K2xUT3czd1hTNmhU?=
 =?utf-8?B?YUppYlBBNGhPZWNQU2FlS1luUGsvcldJdmMxTjV6VUxZbXI5SjJOa3JTajFy?=
 =?utf-8?B?bU9tU2ljbnhwTE1jRGZLeWJwNlF2VnBReE5uVHBZbUo4VTZiYVJ1QXlLVCto?=
 =?utf-8?B?eXR2TndLQklHOUxydHV0NWlzYnBQT2tKdTY1c3E2NHl3QUsvN0lqMVdyc3N6?=
 =?utf-8?B?MFYyYmZlVElTWTRnSy9idEVyTWd6MnIxODA2NHoxMStVK0wxMCtmWG5YdHlv?=
 =?utf-8?B?RzBISWIwWlpOOE5ZcFRTK2x2YkgyOHczMVFMNmpHZmZibFRsMUk0dW5abHhk?=
 =?utf-8?B?R3orMjlsYlRWMWRRVEViS3YranRFcEo4YXNtK3MrUHZmeE1OWkZLUmNQZVhR?=
 =?utf-8?B?Z04yenN6d3JMZUNYay96endxWFFaZ2VUdXBNUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmRuWGQzMG1xUk9FT245ek1QeklXbjdxTmxvSnpkMW15a0ZsZXM4M0xZWHdE?=
 =?utf-8?B?V3A5NGF2RStSV0tMemdkYnJIQ0Q2Nk1tUzRhbTI0WkRleHJXbUhNMHBxcXQ3?=
 =?utf-8?B?NnFIUm9zRHJqTm8zekhpY1BjRVJ4Z29XU0gxUVR0TmU2cUVSL1hkNlVhQ3pl?=
 =?utf-8?B?ZmZZekxxODI4MTR3UWNjTjdsRTArbVhRYk5lN1Rtc05wZ3pBVHhoL3hQMWp0?=
 =?utf-8?B?d0pRaXVsa1V1bkZZWVAwVEdlaW9ERVE3MGxnbXR6c0huaEFlVGVSTTZ3SjYy?=
 =?utf-8?B?V2NkT1U1a1JSYXQyWWlJUTIrZEYrV1h5ZTZsbWhCU2RjS0J0SHhJUnR1K2RV?=
 =?utf-8?B?MW90TktvbE5yOFpuNmdNVXNGeWhMazNyR1RRRmsvM1d6WHhPZHYwZ21TU3Fn?=
 =?utf-8?B?RGZCOEFOS050a2RKOFRlMm0rV0JaK0lMZCt4cDZ2YUk2VStSWGVYT3lCcFRG?=
 =?utf-8?B?a1ZYS3I2OU42akQxR3BRYnBybW50cG1GVlVBUHRNTUxqVGZtdDErTVJvcDBr?=
 =?utf-8?B?aXVsc1gwTmN3TUd0VmZtdGNJYlpUbjVBNjZiTGFxTDhVWXlZbk04NTJPNkRv?=
 =?utf-8?B?bjczeTlkRk5yZSt6TFpIbHBHY2l1UmlRWnU0OVZoNzBPSStBYVVzdnc3Qitk?=
 =?utf-8?B?Y3czRTYwNHk2ZXUvTWl1OXVmMXMvenREc25RaXo5dmlpNHQ4dXAydmw4SlJu?=
 =?utf-8?B?aUJnanAzSjhsbGlzZThVQjVZSUZCUEM5R3Y4MDJjSFhDZWpyN2pQaDRxWlNU?=
 =?utf-8?B?YjJKQ1B0b3lWWDZIYWs3eDMyWmdWdlU0VXdML3V2cG5idm9XbEkxVW4vNGc2?=
 =?utf-8?B?QlQwLytEd0JUZlkvWUpZV2tWTUV2Wm8yWlBTK2o0OERTc1lOZjFjaTJqVGZZ?=
 =?utf-8?B?R0RTWk4xSVJaMUFVcGVBNmNOd05Pa3NKV0FMSjdKUlZiNHZHNmM3blNHUUdI?=
 =?utf-8?B?MyttenErcGd2QjQzaHFXdlJJQUk2alE3eTk2SVRGMm1aRGY4R0QwWmN2clhO?=
 =?utf-8?B?MVNvcjZLTG12ZnhTc1ZQekloYUxkeGNVRTRSSWVVeW1LdWhDd0p3OUpPNGdt?=
 =?utf-8?B?c3FubjE1UGtHSzZ2V0FkOEVjYlFiUXJuNTZ3cHRiRStRdm5TUlpVNWxzYXdU?=
 =?utf-8?B?ZnEyTE1CQ2R0YnFmNC84OWNzL0hWY0JDL1R0ZXJwSktZeFRTZ3VMMVYwTDhv?=
 =?utf-8?B?YzgwZEwxSkFsb3QrRndnVHMzWjh5QnIwM0s1U25hVS85WVhnOVVkWUdMbkd2?=
 =?utf-8?B?R3RaenRPV2tKa0dNOXRzSytoM0ZkU0xnZVhJSHhFcVZKN1Y4ZGpCQUhpb3M2?=
 =?utf-8?B?d254VFdaMk16azZrNHhhWlZidjVlVFkxM1UvWHlKVitHYjQzQ3F2dGNORnBF?=
 =?utf-8?B?N1F4UWl6WGFCVHpJNHhsRm0rd3lrbzJ1TTljRkxxRnVBRE5Oa0RzTzNveUJU?=
 =?utf-8?B?NFVlTTVqckN0OXZoM1JwWWQ2bGEvSmszM0Q5SHhqZVphRzVCK1BCZkZQTDBR?=
 =?utf-8?B?QzhNRnV3enRrNW01eGVONitaZ2IyeDMzME9PZkxDd0ptcWdLVEs4VGkvWjFx?=
 =?utf-8?B?NjJzQ21lU1E2TjBlRS9aNUVHTXJaNXd5Uk1QWjNxSEM5YWFJWDZhblVnQ2RO?=
 =?utf-8?B?dlZ1eW5kK1FiSGJieGZwdmJ4TmcvYlRZVDZ3OGJnS1NYWFIvN3JNK01neTJH?=
 =?utf-8?B?dTA5QlhsTmdiVUxZREg1VEF6QVc4cGpqZGFFRlRqb1dlbGg5TW03M0h3R2RR?=
 =?utf-8?B?WFJ2dU9VV0NLdXo4SmIxMFF5T3NqWVNXV0VNT09GWjNSVnpsbUgyRnBRbFIx?=
 =?utf-8?B?bnYvRjNvNkNUTVBaSnRJblhrK2hXS21CejE2RzBVQkNUZ3VPZExPSmFWTW9M?=
 =?utf-8?B?MktHQzNiL0cxMVFWcFVMR2xPdmMrUjFSRkZOMm9vVFZadlJHbWFyYXcwa2dU?=
 =?utf-8?B?VEZkQ29XTjl5cTVwNFZ0TmZyV09RQ0VOS3VJZExnWjArcy82Wm52NUY3dVJ0?=
 =?utf-8?B?QzJFWW5WRU02UDVxTThNR21hdytpMk5rZFhWRFpIQlZCUHlaeFFzVWtsbzFJ?=
 =?utf-8?B?MnRqU2QrQ3I1Sm1tSUlVZm1wM3g5eU9vVE92ZTMxbllLL21NZGRYclc4Z1Bl?=
 =?utf-8?B?U0EydmVISTN0WDBwTW5Wa0RlWWM0Y2hORnZ1K0dXQ3pjaEV6Nng1VG9FaTdl?=
 =?utf-8?Q?0SzY6jSp8xQgaEZTbUm4jn4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6651f8e1-21db-40f3-9374-08de0c727475
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 05:11:25.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTXgnQJmKc2mc6RX/0u6HvUO+AETz1k2LUzMahZSNY5x016doH5YaB1lY4qLBo46J+vS7CIFecqQWNUoiMT/rlGNG5HbhBSuu3ubtFQCKqwj+yR0eJuGKcS0kLILmLGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAzOCBTYWx0ZWRfX41cn4NYHd7sP
 EHMO37o5YsDz2daehSfJMiORc8D3WJwX4Vgh1SJfXBZ8NDBYk18IAU8LzCXUJxQzRlk1xL9Da/P
 Nmmu5hVEoGAUAl61Pxnbc/u+JKruaFn7EZSLxxXxip52hJ+Pg9dO26awPpveph1lhkNq3B5VPis
 kbGRqxwM5pPC/ftBebjYMPR/l3pG0cj6gYNlptDYVZi6QikC1oFXHlTxCd472tZg9TTjIy0Bs8B
 A/wKvL4t65l/cbOsoASKqbJPhHzU5RrQb9uanmRmx3JVrCgQcGIgrlK51fePd3+E2YphxsjUDNc
 4r5vhMFzrHLijhdSSvGh7z29yZC61Rj31/dUhiRRo8SCvNAvOVGakO2RUbMQMf2RpF0rdNU8+XU
 MwmdGX6UyKT65yZH05EQpjLoh3wJAg==
X-Proofpoint-GUID: qIYfunPuf5dXJxfNjT08OgjbO5zZd6X5
X-Proofpoint-ORIG-GUID: qIYfunPuf5dXJxfNjT08OgjbO5zZd6X5
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68f07e80 cx=c_pps
 a=0FlYyfQadWprtAtRvkXThA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=cEQ-yW-P5nCu5rWi3rEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59G4Kk5s3790124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 05:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224945

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 20.1.0

87f0227cb601 (HEAD, tag: llvmorg-20.1.8, origin/release/20.x) [InstCombin=
e] Avoid folding `select(umin(X, Y), X)` with min/max values in false arm=
 (#143020)
df43f93388b7 [PhaseOrdering] Add test for #139050 (NFC)
25bcf1145fd7 [RISCV] Fix assertion failure when using -fstack-clash-prote=
ction (#135248)
6fb913d3e2ec [RelLookupTableConverter] Drop unnamed_addr for GVs in entri=
es to avoid generating GOTPCREL relocations (#146068)
0c9f909b7976 [AArch64][SME] Fix restoring callee-saves from FP with hazar=
d padding (#143371)
fa792cd4c630 [AsmPrinter] Always emit global equivalents if there is non-=
global uses (#145648)
ce455b382c08 [objcopy][MachO] Revert special handling of encryptable bina=
ries (#144058)
0de59a293f7a [X86] Ignore NSW when DstSVT is i32 (#131755)
9af763f038f7 [gtest] Fix building on OpenBSD/sparc64 (#145225)
1daceb20611f [LoongArch] Pass OptLevel to LoongArchDAGToDAGISel correctly
b21155f97a0a [LoongArch] Precommit test case to show bug in LoongArchISel=
DagToDag
da18fb9f04ce [LoongArch] Fix xvshuf instructions lowering (#145868)
65ce78f338cf [LoongArch] Pre-commit test for fixing xvshuf instructions. =
NFC
5532d5b745e4 [AArch64] Ensure the LR is preserved if we must call __arm_g=
et_current_vg (#145760)
5ac3ce819688 [WebAssembly] Fix inline assembly with vector types (#146574=
)
b83658b7e2c8 Bump version to 20.1.8
6146a88f6049 (tag: llvmorg-20.1.7) [LoongArch] Fix '-mno-lsx' option not =
disabling LASX feature (#143821)
9ba132be8eea [clan-reply] Backport PTU error recovery to 20.x
199e02a36433 Disable clangd/test/module_dependencies.test on Windows
02aec86e4d0d [clangd] [Modules] Fix to correctly handle module dependenci=
es (#142828)
c4f257cb74b5 [llvm-rc] Allow ALT on non-virtkey accelerators (#143374)
6fa0cdf3720b release/20.x: [clang] Don't evaluate the initializer of cons=
texpr-unknown parameters. (#142498)
337beb73abfe [libc++] Add _LIBCPP_NO_UNIQUE_ADDRESS to flat_{,multi}map::=
value_compare (#137594)
b8e10ca59b6a [libc++] Fix check for _LIBCPP_HAS_NO_WIDE_CHARACTERS in fea=
tures.py (#131675)
2da24c36c7df [libcxx] Provide locale conversions to tests through lit sub=
stitution (#105651)
253e9321c8b6 [release/20.x] Update release notes for SystemZ changes (#14=
0060)
acf86c5c4dbe [CVP] Keep `ReachableCaseCount` in sync with range of condit=
ion (#142302)
2481e590eec7 [AArch64][SME] Fix accessing the emergency spill slot with h=
azard padding (#142190)
22a3e6b19409 release/20.x: [AArch64] Handle XAR with v1i64 operand types =
(#141754)
e5dd4f129454 [clangd] Guard against trivial FunctionProtoTypeLoc when cre=
ating inlay hints (#143087)
f6532710ace8 [clang-format] Correctly annotate token-pasted function decl=
 names (#142337)
e0586e278f96 [RelLookupTableConverter] Drop unnamed_addr to avoid generat=
ing GOTPCREL relocations (#142304)
7759bb57c243 [clang] Serialization: support hashing null template argumen=
ts
7cf14539b644 Bump version to 20.1.7
47addd4540b4 (tag: llvmorg-20.1.6) [libclc] Include isnan implementation =
for SPIR-V targets
4b6e5a286653 [clang-format] Handle Java text blocks (#141334)
0e1ef696f1fe [Driver] Fix _XOPEN_SOURCE definition on Solaris (#137141)
5d99a97583e1 [MachO] Improve bounds check (#141083)
aa804fd3e624 [sanitizer_common] Remove interceptors for deprecated struct=
 termio (#137403)
53393e26d5f4 [LoongArch] Prevent R0/R1 allocation for rj operand of [G]CS=
RXCHG (#140862)
6fcb1c127b40 [LoongArch] Fix assertion failure for annotate tablejump (#1=
40907)
15ec590e389b release/20.x: [clang-format] Fix the indent of StartOfName a=
fter AttributeMacro (#140361)
802f4f75372e [clang-format] Handle raw string literals containing JSON co=
de (#140666)
9b0832508ede [SDAG] Ensure load is included in output chain of sincos exp=
ansion (#140525)
8a36b8e3ab46 [clang][analyzer] Handle CXXParenInitListExpr alongside Init=
ListExpr
070cf62530ea [Clang] Demote mixed enumeration arithmetic error to a warni=
ng (#131811)
a169f5ca4e4f Correct position of CFI Instruction for Pointer Authenticati=
on"
5befd1fb3c97 [Clang][AST] Fix HandleLValueBase to deal with references (#=
140105)
e3d2c00ccee4 [LLD][COFF] Allow -arm64xsameaddress in ARM64EC directives (=
#139631)
85e06a761483 [LoongArch] Fix fp_to_uint/fp_to_sint conversion errors for =
lasx (#137129)
ff2e8f93f609 Fix test pfalse-v4i1.ll added in #138712 to require asserts.
1e4d39e07757 Bump version to 20.1.6
7b09d7b44638 (tag: llvmorg-20.1.5) [analyzer] Workaround for slowdown spi=
kes (unintended scope increase) (#136720)
a708fb737a78 [RISCV] Allow `Zicsr`/`Zifencei` to duplicate with `g` (#136=
842)
1c0368417f55 [clang][analysis] Fix flaky clang/test/Analysis/live-stmts.c=
pp test (2nd attempt) (#127406)
0439d1d36312 [Clang] Fix handling of reference types in tryEvaluateBuilti=
nObjectSize (#138247)
74ed1ac61104 [sanitizer_common] Fix build on ppc64+musl (#120036)
2d079b96a5fb release/20.x: [clang-format] Fix a crash on formatting missi=
ng r_paren/r_brace (#138230)
2cacf46f35c8 [X86][TargetLowering] Avoid deleting temporary nodes in `get=
NegatedExpression` (#139029)
f233430d977b [AArch64] Fix feature list for FUJITSU-MONAKA processor (#13=
9212)
41c36d940804 [clang] Fix unused variable warning in MS mangler from const=
ant matrix patch
72ad9be1e337 [Clang][MicrosoftMangle] Implement mangling for ConstantMatr=
ixType (#134930)
0019b7d0ae0b [wasm-ld] Refactor WasmSym from static globals to per-link c=
ontext (#134970)
b7b834e2a20e [RTSan][Darwin] Adjust OSSpinLock/_os_nospin_lock intercepto=
r and tests (#132867)
f811c7df0a10 [rtsan][Apple] Add interceptor for _os_nospin_lock_lock (#13=
1034)
4370072022e5 [clang] Forward TPL of NestedNameSpecifier
d34d5296095b Support z17 processor name and scheduler description
a7166c373946 release/20.x: [clang-format] RemoveParentheses shouldn't rem=
ove empty parentheses (#138229)
5429418cb064 [clang] Add support for Debian 14 Forky and Debian 15 Duke (=
#138460)
be087ab35970 [libc++] Re-introduce _LIBCPP_DISABLE_AVAILABILITY (#134158)
2b34040173f7 [clang-repl] Fix destructor for interpreter for the cuda neg=
ation case (#138091)
ae97a56d363f [Hexagon] Add missing patterns to select PFALSE and PTRUE (#=
138712)
2386c377db4f [BasicAA] Gracefully handle large LocationSize (#138528)
961ce35e2957 [OpenMP] Add pre sm_70 load hack back in (#138589)
009f3c10d1c1 [LLD][COFF] Don't dllimport from static libraries (#134443)
70eed33971d9 [InstCombine] Do not combine shuffle+bitcast if the bitcast =
is eliminable. (#135769)
6ddf2e5d10f8 [clang-tidy] Do not pass any file when listing checks in run=
_clang_ti=E2=80=A6 (#137286)
8272e451613d [flang] Exempt construct entities from SAVE check for PURE (=
#131383)
069ef671e0ab [AArch64][SME] Allow spills of ZT0 around SME ABI routines a=
gain (#136726)
a38e1ae2041d [AArch64][SME2] Don't preserve ZT0 around SME ABI routines (=
#132722)
be4097b6ee57 Fix crash lowering stack guard on OpenBSD/aarch64. (#125416)
aecbb2364a7c [Clang] Fix the trailing comma regression (#136273)
ebfae55af454 Bump version to 20.1.5
ec28b8f9cc7f (tag: llvmorg-20.1.4) [libcxx] [test] Extend mingw workaroun=
ds for armv7/aarch64 too (#136419)
8c2dc1b5aa7f [clang-repl] Implement LoadDynamicLibrary for clang-repl was=
m use cases (#133037)
02afcbf63fee [SystemZ] Fix compile time regression in adjustInliningThres=
hold(). (#137527)
c877757659e8 [clang-repl] : Fix clang-repl crash with --cuda flag (#13640=
4)
f4779c389868 [InstCombine] Preserve signbit semantics of NaN with fold to=
 fabs (#136648)
57a31e183dc8 [InstCombine] Do not fold logical is_finite test (#136851)
1cf8c7797d2b [GlobalOpt] Do not promote malloc if there are atomic loads/=
stores (#137158)
24805c2e0817 [lldb] Use correct path for lldb-server executable (#131519)
182e8b7f8a71 [clang-format] Correctly annotate kw_operator in using decls=
 (#136545)
425d1aad294f [RISCV] Handle scalarized reductions in getArithmeticReducti=
onCost
2d7ad98ec0a8 [clang][analyzer] Fix error path of builtin overflow (#13634=
5)
e7ae5532bc27 [clang-format] Fix mismatched break in BlockIndent (#124998)
8f288eb619db [lldb][test] Adjust TestTargetReadInstructionsFlavor skipIfs
d76ec6a75d39 [lldb] Fix  SBTarget::ReadInstruction  with flavor (#134626)
62072e7f877e [clang][AST] Handle implicit first argument in CallExpr::get=
BeginLoc()
581772ed077e [LoongArch] Don't crash on instruction prefetch intrinsics (=
#135760)
89adc2d4f93b [HEXAGON] Fix corner cases for hwloops pass (#135439)
78f6719ca9b5 [GlobalMerge][PPC] Don't merge globals in llvm.metadata sect=
ion (#131801)
ab0074fe306f Bump version to 20.1.4
923a5c4f83d2 (tag: llvmorg-20.1.3) Revert "[ARM][ConstantIslands] Correct=
 MinNoSplitDisp calculation (#114590)"
86f5891c5986 [llvm][Hexagon] Promote operand v2i1 to v2i32 (#135409)
d55c3c20520a [libc++] Fix misplaced _LIBCPP_POP_MACROS (#134874)
9420327ad768 [Clang] Fix a lambda pattern comparison mismatch after ecc7e=
6ce4 (#133863)
4da7285e636e Silence -Wcast-function-type warnings on idiomatic Windows c=
ode (#135660)
c5109be53b7e [LV] Disable epilogue vectorization for FindLastIV if start =
is poison.
91a3f14d9497 [LV] Add tests with FindLastIV and epilogue vectorization.
2131242240f7 [LLVM][MemCpyOpt] Unify alias tags if we optimize allocas (#=
129537)
86c98536380b [libc++] Fix deployment targets that were incorrectly bumped=
 (#134278)
dfd6f123362a [libc++] Guard additional headers with _LIBCPP_HAS_LOCALIZAT=
ION (#131921)
dc9d4f9a7008 [lldb] Respect LaunchInfo::SetExecutable in ProcessLauncherP=
osixFork (#133093)
9c7d72869876 [LoongArch] Move fix-tle-le-sym-type test to test/MC. NFC (#=
133839)
0c30835a63db [X86][AVX10] Remove VAES and VPCLMULQDQ feature from AVX10.1=
 (#135489)
2e0966408283 [X86] Backport saturate-convert intrinsics renaming & YMM ro=
unding intrinsics removal in AVX10.2
0dd4235473d4 [SCEV] Use ashr to adjust constant multipliers (#135534)
a141e58685fd [llvm][CodeGen] avoid repeated interval calculation in windo=
w scheduler (#132352)
d88cd35023b4 [llvm][CodeGen] Fix the empty interval issue in Window Sched=
uler (#129204)
73d1e8598eda [CodeGen] Avoid repeated hash lookups (NFC) (#130237)
7034995f1029 [clang] Handle Binary StingLiteral kind in one more place (#=
132201)
2e7710eaffdd [clang] Introduce "binary" StringLiteral for #embed data (#1=
27629)
e0db588f3db4 [IR] Fix assertion error in User new/delete edge case (#1299=
14)
d5bb7b866e59 Avoid a race condition in opt-viewer/optrecord (#131214)
d15fef4209f1 [IndVarSimplify] Handle the case where both operands are the=
 same when widening IV (#135207)
91647ae0dffe [X86][SSE] Don't emit SSE2 load instructions in SSE1-only mo=
de (#134547)
d05543ed0796 [clang-format] Keep the space between `not` and a unary oper=
ator (#135035)
81220e68a496 [fatlto] Add coroutine passes when using FatLTO with ThinLTO=
 (#134434)
edb54a7821fe Release/20.x: [clang-format] Set C11 instead of C17 for LK_C
4181e829d1db [LLDB][LoongArch] Fix build errors about NT_LOONGARCH_HW_{BR=
EAK,WATCH} (#126020)
7436329bfee9 Revert "[clang] [ARM] Explicitly enable NEON for Windows/Dar=
win targets (#122095)"
a0c8959cc880 [X86] When expanding LCMPXCHG16B_SAVE_RBX, substitute RBX in=
 base (#134109)
a8b5fe017a5e [libc++] Add missing release note for LLVM 20 about zip_view=
 (#134144)
41aefdbebe64 cuda clang: Fix argument order for __reduce_max_sync (#13288=
1)
19c2e1c12d47 [clang-tidy] Fix broken HeaderFilterRegex when read from con=
fig file (#133582)
ac31db0463c0 [Sanitizers][Darwin][Test] XFAIL malloc_zone.cpp
53141e4e3c65 [clang] Do not infer lifetimebound for functions with void r=
eturn type (#131997)
cf7bb13f0c7f [TailDuplicator] Determine if computed gotos using `blockadd=
ress` (#132536)
656289ffa0a6 Bump version to 20.1.3 (#134187)
58df0ef89dd6 (tag: llvmorg-20.1.2) Define LLVM_ABI and CLANG_ABI for __EM=
SCRIPTEN__ builds (#131578)
e256eda15377 [LoongArch][MC] Add relocation support for fld fst [x]vld [x=
]vst
ba00d9f641e9 [LoongArch] Pre-commit test for #133225
f07f96873aa8 Backport/20.x: [LoongArch] Fix the type of tls-le symbols
e7406753caf3 [PATCH] [clang][modules] Fix serialization and de-serializat=
ion of PCH module file refs  (#105994) (#132802)
2f6c5807ca7e [workflows] Add missing -y option to apt-get for abi tests (=
#133337)
bc65196c0919 update test due to https://github.com/llvm/llvm-project/pull=
/126880 not being backported
d6d1dbf22181 [ARM] Speedups for CombineBaseUpdate. (#129725)
5ba194972878 [MC,COFF] .safeseh: avoid changeSection (#132624)
943b43250b55 release/20.x: [clang][docs] Move -Wnontrivial-memcall to add=
ed flags. (#132367)
44a6f6abbdb6 [libcxx] [test] Fix restoring LLVM_DIR and Clang_DIR (#13283=
8)
c1c4d7191d70 [clang-format] Allow `Language: Cpp` for C files (#133033)
2406e0d4467a Revert "[MC] Explicitly mark MCSymbol for MO_ExternalSymbol"=
 (#133291)
3d5f5ef6b784 workflows: Add missing apt-get update to abi tests (#133264)
d1f5a9f66ee2 [hexagon] Bump the default version to v68 (#132304)
90cc9ca8bcb2 [Hexagon] Set the default compilation target to V68 (#125239=
)
3e2801eb634e [PowerPC] Support conversion between f16 and f128 (#130158)
d60baf3d4786 [HEXAGON] Fix semantics of ordered FP compares (#131089)
1a76c29a9ba8 [hexagon] Enable --eh-frame-hdr (#130225)
ecde8c235e5e [clang] fix matching of nested template template parameters
c86df914dee1 release/20.x: [Clang] Fix various bugs in alias CTAD transfo=
rm
f7b6f23c6bb7 [llvm-dlltool] Add a missing dependency
a311bc81d957 [llvm-dlltool] Implement the --identify option (#127465)
6034661369c4 [LoongArch] Pre-commit test for fixing tls-le symbol type
95763651e25c [HEXAGON] Add support to lower "FREEZE a half(f16)" instruct=
ion on Hexagon and fix the isel-buildvector-v2f16.ll assertion (#130977)
e0e8071815c7 [hexagon] Prevent alignment search beyond a label (#130631)
2198410a8a8a [compiler-rt][Darwin][x86] Fix instrprof-darwin-exports test=
 (#131425)
0383020b6c1a [llvm] Fix crash when complex deinterleaving operates on an =
unrolled loop (#129735)
dc7b743515d3 [AArch64] Fix SVE scalar fcopysign lowering without neon. (#=
129787)
fcd0ad23f668 [AArch64] Add test for scalar copysign. NFC
66825a89b8e0 [LLD] [COFF] Add a few more mingw libs to skip autoexports f=
or (#132289)
9710e9963455 [X86][AVX10.2] Include changes for COMX and VGETEXP from rev=
. 2 (#132824)
3f957cc67cff Bump version to 20.1.2 (#132293)
424c2d9b7e4d (tag: llvmorg-20.1.1) [libcxx] Add a missing include for __b=
it_iterator (#127015)
2cc53628fbe8 [SCEV] Check whether the start is non-zero in `ScalarEvoluti=
on::howFarToZero` (#131522)
0619bbcbbd86 [BPF] Add default cpu change in ReleaseNotes (#131691)
2dc152fb40db fix abi (again)
2044b18af046 fix abi
e3f0ce3ef803 [Clang] Do not emit nodiscard warnings for the base expr of =
static member access (#131450)
0ceb4efefeaa [CUDA][HIP] fix virtual dtor host/device attr (#128926)
1058e693f090 [libc++][test] Skip a `is_virtual_base_of` test for apple-cl=
ang-17 (#131438)
1f9d00524b8c [libc++] Forward-proof some tests for AppleClang 17
1515c4ac202d [LAA] Consider accessed addrspace when mapping underlying ob=
j to access. (#129087)
1cfbb9f33436 Backport/20.x: [Clang] Fix an incorrect assumption on getTem=
platedDecl()
0fcfeacd8b99 [BPF] Fix BitCast Assertion with NonZero AddrSpace
0b23d98dceaa Reduce memory usage in AST parent map generation by lazily c=
hecking if nodes have been seen (#129934)
073ae08864b4  AMDGPU: Fix broken broken negative test for gfx950 assemble=
r (#129667) (#129686)
cb50aaf8a11b [llvm-objcopy] Apply encryptable offset to first segment, no=
t section (#130517)
63e63f306128 [Clang] Fix an integer overflow issue in computing CTAD's pa=
rameter depth (#128704)
b09b05b8e7c3 [MemCpyOpt] Fix clobber check in fca2memcpy optimization
64ae6413559e [SystemZ]  Move disabling of arg verification to before isFu=
llyInternal(). (#130693)
548d057ebcfa [VectorCombine] scalarizeLoadExtract - don't create scalar l=
oads if any extract is waiting to be erased (#129375)
7c154dad4d15 [Clang] Fix GPU intrinsic helpers incorrectly sign extending=
 (#129560)
946780474f3b [libc++][test] extend XFAIL clauses to cover Amazon Linux to=
o (#129377)
f09bcfbdc90b [LoongArch] Relax the restrictions of inlineasm operand modi=
fier 'u' and 'w' (#129864)
f62b50e0e8f1 [ValueTracking] Skip incoming values that are the same as th=
e phi in `isGuaranteedNotToBeUndefOrPoison` (#130111)
50343e517992 [HEXAGON] Fix hvx-isel for extract_subvector op (#129672)
0412f708c380 [TailDuplicator] Do not restrict the computed gotos (#114990=
)
72c4a3f419f4 [clang][test] Don't require specific alignment in test case =
(#130589)
fbb2a7e74d91 [clang] Reject constexpr-unknown values as constant expressi=
ons more consistently (#129952)
9010db1b84ef [Clang] Treat constexpr-unknown value as invalid in `Evaluat=
eAsInitializer` (#128409)
32ce5b043c2b [AArch64] Fix BE popcount casts. (#129879)
05be3ca72e39 [AArch64] Add BE test coverage for popcount. NFC
0e96713a3b29 [ValueTracking] Bail out on x86_fp80 when computing fpclass =
with knownbits (#130477)
0fda7e633255 [X86][AVX10.2] Fix unexpected larger scope (#130767)
f7a4e3a4d45d [clang-format] Don't remove parentheses separated from ellip=
sis by comma (#130471)
1d4d84c89be6 [AArch64] Don't try to custom lower fp16 selects with nofp (=
#129492)
0064565bce3f [DAGCombiner] Don't ignore N2's undef elements in `foldVSele=
ctOfConstants` (#129272)
54c90e4cdf2f [lldb] Fix manual CURSES_LIBRARIES tinfo finding (#128245)
712d3c7f0944 [lldb] Add terminfo dependency for ncurses support (#126810)
6525b151fe77 [Hexagon] Handle Call Operand vxi1 in Hexagon Backend (#1280=
27)
dcc378e862de [libc++] Guard <codecvt> contents on _LIBCPP_HAS_LOCALIZATIO=
N (#129112)
0f5e7e86e38e [SystemZ] Add header guard macros to vecintrin.h (#129170)
5b552d780ae8 [LV][VPlan] Prevent calculate cost for skiped instructions i=
n precomputeCosts(). (#127966)
20adce87104c [libc++][ci] Update the Windows toolchains to Clang 19 (#129=
232)
0e537474ea59 Bump version to 20.1.1 (#130806)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/llvm/{llvm_20.1.0.bb =3D> llvm_20.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_20.1.0.bb =3D> llvm_20.1.8.bb} (=
98%)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-dev=
tools/llvm/llvm_20.1.8.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_20.1.0.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.8.bb
index 7ffc6ec1cb..22b054553d 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.8.bb
@@ -27,7 +27,7 @@ SRC_URI =3D "https://github.com/llvm/llvm-project/relea=
ses/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch;striplevel=3D2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] =3D "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e4429=
3d7ee9a7f62aad9a"
+SRC_URI[sha256sum] =3D "6898f963c8e938981e6c4a302e83ec5beb4630147c731118=
3cf61069af16333d"
 UPSTREAM_CHECK_URI =3D "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX =3D "llvmorg-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.49.0


