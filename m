Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DD2D172DC
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 06:47:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47098.1770014874256688574
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 22:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=YUxp9+Hz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6493f4f895=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6126A3kf2351266
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 06:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SiuqXY0SO32unt0yn2Qw
	uvuWieywwEZFMw8dcBPkvtA=; b=YUxp9+HzVTWWyZ57slAzniphHuQQKeqXyNi1
	QOKC3y6jNhMK/U7IyH9VPxiUnFikO6RLVXj0MlfUg/dVjSSBcQ7dbxdQtIOYfgi3
	jLvw2hMPSo2cDMK//0cBeJLVsiayDi20k0e1WRsum2cQNAYD+UGPQ7ooPHsBSjWE
	u/QBBy+E5PTeaeTccbLu7yaypz8dhxiZTv2J/vpl3J7WMb2iOwZQ1v3R+eWLjaOU
	PYFMqyjBAxYINLbc0JL2kJA6Qp84y6nmB+nP0EPwQx4CDL23kCRQNU+/o40MKVBN
	sWboZS7/hnzdP1H10O/qAgatWiNmFICpNs9W/zLPWnU2qFQ6Ww==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c188jspyj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 06:47:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoOrnx0MHCLNDzC76iUaKN0ElJ5JrJQrdZa0bMHr1ctWr89o1StfK+hU5d29rpqz3U1gNOD9XSVUXV1AJ1EmJD+yC/uizffBJ/WXyg1oLbgegzsuqNeWXnEiAvvLdpFhRKQtb00iQlYcFXatmXmL8CxPq8jU8f8SJQMauIPWlhwoIdOA5FC7t2mmbh6kqA3hv2WTGcxWZLNRN8gfnM6zD4UUQ14WGOx2rqhU9h3xiQQm4IH1mHgxZf0c/8Okt7SehmljMWpZWJQPxb2KrDGGBJD63jhxM6KmCeRzK73moXEo38zDaqN1rfDpi94tiLiyUZGhljLk2H4Xp5i55htXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiuqXY0SO32unt0yn2QwuvuWieywwEZFMw8dcBPkvtA=;
 b=QeWqwLtslfxJSTDQHLdQC7jQSoc7li6L6rXLYGxzzO2ohPeGQykB+lCbpxYsiHyuGIVLOuYEMWac5/xonMN57LN8H9xYx/6IYxaCHvfjkSjw18I8GdKYi1BQVmTxNupWTVfk5bzThr4bpXhxDBuc4pq09xpARyQjR2D0cYKWySAe7pturshMHEZLavEclqOeHDow9+PIFPNgCvlfTc80S4IBQk/zCmNFxmTwsDbDhjls9/Vby+vyeW8xVTQkbmumTtK2q3qU5WQ+99ovQFSxKyp+viFVo6ThtDHLd/YFYi26d7xjEAW0fybWIi2I8hcSfJkRUBwnZQsrNyJnISDgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PPF83579A393.namprd11.prod.outlook.com (2603:10b6:f:fc00::f35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 06:47:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:47:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: fix regression for ppc64
Date: Mon,  2 Feb 2026 14:47:34 +0800
Message-Id: <20260202064734.3870731-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM3PPF83579A393:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae1e3e4-1c1c-45b8-a03a-08de6226fb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QktvSjZPNDdDYk81UUpzWmorY0E5Ym9Ha0ptTmk2dlpRbjJaL09kOXNmNHht?=
 =?utf-8?B?NDBIYWkxR29NSjNUWklHSmRGTFNpQ3A1a3U3bjNOb0tyUktNQWVIRzFGWlRR?=
 =?utf-8?B?K3paZzZBWm5kdDlwK281d0J3ZmVsN1JoOWFQaEdWaEh4NFQxVmJpbDVlSktw?=
 =?utf-8?B?YVY0Z2dDZHRPT1c0VXFmaTlxQWhPNHpCWFNDZ3NobENDZHpwdzRxTVpVbVFR?=
 =?utf-8?B?WEo0aEdqYloyRE9uQnlqd3YzZ1BZOUoyakRKczA3azdpOCttOWdNVWJUVElS?=
 =?utf-8?B?Y2N6cDhjeU9uN0JqK0pTMjVmTW1iQUZPZjNnSUg0OSs1bkVIcEYraVBlMEZp?=
 =?utf-8?B?L2R2QVorbndZRGt1b3NoN0QwRTlidklXTjlzNjl1K1ZVdUE4K0oxSDVhTzlw?=
 =?utf-8?B?eXBPOVBrbmZlaTRaQzRadmhPMXorVjZ0SGVxdTJQM1huRTlNcUtJVHYvZHFs?=
 =?utf-8?B?cVFtMGs2MVZVVEh1cUx2QVYyRWNDS3prT0R5UWJleUFad1UyYW5qUEFkU0E1?=
 =?utf-8?B?Rm43eUpqd2dFWnRtYWtzZUJTSEdNaFl4UTQrTDlZeG0xa2k3SGsvc0MrVXQ0?=
 =?utf-8?B?azZGWUVmWUdLK0hxUDMrQkVvUEplbVJVS3FBRnRLeVc5aGppeGF2UUJ3aUs1?=
 =?utf-8?B?ZnhaYnhjZnA3UDh5YTNYalhvNkZaUDNoZUF0YnpQWEc1dDhNd01VdkcyZitY?=
 =?utf-8?B?c3YxR2tOM0FtTGlHRHppMHV6UjhobkJQOXI5NGpqSEhJRTQ2Ti9KcGdnWjJn?=
 =?utf-8?B?ZUhsR2lXQnFpTzVRNzRLUEgzMERpc2NBMTBWOUc3dHpvbW9KT3NZU1AzcHp1?=
 =?utf-8?B?K3RoQ01QOUlpMFZjZGRDRTJtdVRoUCszcWpSYWRTZTVuU3J2TzA5bm9OVmRH?=
 =?utf-8?B?NlN0eGpwK2x1cTkxb05ZRDQ5MXdrZWlnSGZqaXliYmh3WG40Y3Yzd21NK0dI?=
 =?utf-8?B?VGNOU0NVNXgrWjBybVliYnlJbnJxTWdqSmRwTzZFSFZKZGVXYy9nTnpZcXpP?=
 =?utf-8?B?TmxCaXdPN2czSitZbXJOU25KeGt4TUlpekpyRHg1Q0kzcEErZFBOcXJna01N?=
 =?utf-8?B?U1lJZ2E3RWJSOHJoU2sxSjBVZUE2dDM3cVhObm43TTBvd25GVXRnSGs2WG1l?=
 =?utf-8?B?QmJJM0kwdkJadlVPVE5FRStabytNOEczSXUvcldCNTJKR2RRc0NsUFJEZkM2?=
 =?utf-8?B?YldYanlGSmFJNnpwaVhLTjNVUHM2MldIcHMxY0thRlExZnRFU3Qxazh0T0pQ?=
 =?utf-8?B?K3JwbUFWUU1PdjV6WE9aeW9KbmdCd25RcU05SW5FUUxQVm1SamxuR2hvdGsv?=
 =?utf-8?B?ejBFV29OejdJNEU3WG10ajBwRFpiUllXYjJWcE1aZC9udGN3aW9UZndpRmxM?=
 =?utf-8?B?OHdwc01VeDZxeTZZcWlEM1BSR2wybU5hQkNvUFk0bFRvclgxTU84NVh3c0hW?=
 =?utf-8?B?Uk5TYkNZTVRIZXpheDFKSE9JbnNxdEV6SFd3TWJ3ZWNmeDYvMnpQMHRNZ1Zw?=
 =?utf-8?B?dUtWU0RaUHFzWFVET0dVaWszVVZkaXU2ZitIaFIwMEZaanQ4anZQM3dxZng5?=
 =?utf-8?B?azBmK1BONXpFVjZveFZ1Q245dVQ4YmZoaVRRWjlSTlY1NlBWMndFd1RFMW44?=
 =?utf-8?B?R1FTU1BFc1U5YkZqZTU3M283RjdXYnZ3Q2FVZzdBbzlFN3k1V0duMTMzNSs0?=
 =?utf-8?B?TGtKOWpGZ21KVldiOG1LbTJZUWJZcWhiQy9Bbm9YT09JNzNxUVlZMUx6RVBz?=
 =?utf-8?B?b3lENXczSzUwZXNVM0Y1K1dkRmpGenUzV0NndExKcHRGeDM2TGd6RW9JaUI0?=
 =?utf-8?B?OTd6MEVzZWRGTUtxY1FUQmlSTUNzcWI4MlBEb1lyK2ZORGRrZGNqWldaWFN6?=
 =?utf-8?B?S2VzMzJ5RkNZVnV2K2RIWk9IaEM2SldQM3R4bjFQaGNHL3lFM0hSSHFzMGt4?=
 =?utf-8?B?UTUzVzRvcy91STl0c3krazI3Z0trOTRJUml3ZjRaNFIvdHBvZ1l3S0pXYm8w?=
 =?utf-8?B?ZlBXK1dKNml3VmZVT3RybnYrOGlJdjFqQW0rcXB3dVhZaDdZUGwzSzE4VVZl?=
 =?utf-8?B?OW16VEtjVy9MZDR2alg0d0ErVmRCSFNWcDJ4dnZxanVpbGdTY29GT1RyRVUw?=
 =?utf-8?Q?U9N1xSh8sVG5ZicRsdH/Q6ri+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFcyMDNWd2tVR2RRVUVjU2ZzZlFLM1VNb2x0TEtSN1orUEhiajI2OU9KNlNI?=
 =?utf-8?B?bHh5ajByek9wN1RjM0Y3dzUvRmZGVTNwL3ROZHZvMVpFMWVWNlBzVXZvZjd1?=
 =?utf-8?B?ZlZxSUpuRFBKc3YxNzc0NTQ0UVNFYVRNNEVsc3p3Y0o0cFhaZU5mb3JtSmUv?=
 =?utf-8?B?eUx2YWdqZUY0a051ZzFaenNyLys2MGZtRlJrazZFUjR0SFBxSlRDbG81VlFZ?=
 =?utf-8?B?c3REbk1GY2FQOG9yNnJ3QmFVbDZKcHltUGNIYmxnSCtRaC9uYWI2TzNGYlBz?=
 =?utf-8?B?NFRxR0dMMFBTNU1DRGRadGJFUkF3R3NCYUNuNEdsWjV1NXJyMWxNbUN5SUlV?=
 =?utf-8?B?YkNuTDZ6bG5wd24xV3ZHOEM0d3VRanBLTks4QlEyNGNjUzBJYnRBWXBmTHh0?=
 =?utf-8?B?ZlBxM1BnNk43NW5xL3BaczJlZUVEblVrQWQ5TFEvNzBIaUNpTDNuS2JKRDdB?=
 =?utf-8?B?Q1AvM2lWWnlBOElkK2F6S1NCMVlwS1E1TUtWbUQ3OXdhYjFoR1U1NVNzWTNt?=
 =?utf-8?B?eTR1YlIxcEVvSEQzdStqYXRZd0VWREh1OS9pSDJydHRabUc2NzJiOGJvYmd3?=
 =?utf-8?B?cTdCRGRYSmtGQU5UU3hYTHR2TjNXYnEvNUkybEJCMUszdi9kUWdVVVdGRDdI?=
 =?utf-8?B?VmhjZENCNFoxcGoxN3R5MEZsYUtNZXl2NHlmZ3E1WE9PQ21mQWNicGpIdzVz?=
 =?utf-8?B?UnovakJMNjVKVHVBbmF0ZWpJZHU5V1Z6eFpiSFA0SmFzOVZ6RkFDWmtWbzFu?=
 =?utf-8?B?Q3NKMHhsSjhwaURvY0ZWc0UxUWVWN3BLUVR0L2dpcHRCV3pNY0F0K3dWekYv?=
 =?utf-8?B?ZVZMdE9KTlJhcUtBWWVyRDlHUmhrdk41ZUI4WVNYYVpCZDlZS1YzeUNXcS9i?=
 =?utf-8?B?MVlhYXMrMmRiTTFxNUFEVU1zeUQ1cHV4T2hLaE1Jcmd1Q1VVRnpMeFhob1N1?=
 =?utf-8?B?OFMxZjF1dURka3hmNlpyMnVCU0dXN1l2aGx2V21naWVTRjlMU0dyMmtKMnNj?=
 =?utf-8?B?cEhCZ3g3dkdnbHlvUUNyK3BFUmh3VXJWNUd3cWhXSG5HeFdhb2VkSU1WamtF?=
 =?utf-8?B?Z2FXUEJtS1kremVaUnBYbFJlRHlnY0JER3NHcmdlWkJDajFESi9FK1o2anpQ?=
 =?utf-8?B?eklBajlKOHZFNUwrNTdTN0g3TjhTRytaendxUHk1UVBLTnV3Q3IxMFBRNjVu?=
 =?utf-8?B?c3dnL2pvN2NQc0xrQUpDOFIxOXZJalhpYTNBcUlFeElCMmRBTUdJSXhRZkhF?=
 =?utf-8?B?cEJYb2NkcXdOYWU1T09lQW80ZUtKRnVtMmpHb2pldEFMWjBiY2d4MGZ1TzBJ?=
 =?utf-8?B?N3ViUkNQS0tsZUpLRHErTkZLMzl5Zm5adGpBcXJWbG5FSVBWeExwamQ1Q0hQ?=
 =?utf-8?B?bzBkMzdFV0VEc2thUzNVa2FQVUhYajVQWG5EQ2xGLzVhQ0JCMnlpNzhyakRr?=
 =?utf-8?B?d3pQbUpvNDdwWlRuK252SXhtN0ozRXU5c2dhbkQwdkF2SVc3dTVvQzZmZ2dk?=
 =?utf-8?B?R25qZ0tITUVWNmlIWTlhTjN5UXZPTXNtaDQzQ2dTUUlmQVBTVU1vRGNqdGdj?=
 =?utf-8?B?dXlNdUlob28zUTkwd2JobWszbmtWUnJuUlN4UHZlRVpOTHhPMjhSclg2YS9B?=
 =?utf-8?B?WlczNjI3eWxWYVJPNnVDazlJanJHSUM5V3Q2S09PejN1UzNFUmNpdkt3anVh?=
 =?utf-8?B?RzhwNkY4d1BkclhXTE5JbzdPYmtkdTRLZDFmWk1VUUFOZE9CNHBZZ1lWdlJi?=
 =?utf-8?B?WTV3R2lENUhINTFUaDhoNmZ3eS9kaENyOTRYbVBsNGVsbkFBQTByamQycFVr?=
 =?utf-8?B?MXRsREx2YWY4MlVabE1BajlsanZBZ3VXdm1hRy9iQTFhYlhjUmVzby9jSDlo?=
 =?utf-8?B?ajI5RjJTUmViMlV1V2tPS00rSlhtaEkwaGorY3QyMmxZajRGNHN3RWlXa1lm?=
 =?utf-8?B?KytEbS81bVQ2RWYyemlDRC9xRTR3V0FPSzdDdXpMdXAyOWU5bGZTdU9XUEo2?=
 =?utf-8?B?dkN3b1NtaUVZc01neC9aaWxDV0xxRGFaUXdmT2JQYmFuVHBCOW5uMXhmZUNL?=
 =?utf-8?B?ZlFwb3FmODM0a3NFbGpqYlFYWUdnQzZDbFRmY2h2VEhQVng5VTdsbWcvaXd0?=
 =?utf-8?B?cXlXeCtEK1JZN2lobnQ2bUdpYkgrUDJVTm5nMFhtY25vSCtzejBRcXJ0V1Z0?=
 =?utf-8?B?enFKa1Vlb0V5bjVNZ3lhR3BPK3kzaUhOYlIydmlpVExvZEdiSmxFc3dMdDRZ?=
 =?utf-8?B?UWhjOU1nRFlLeU1OWWxvMWhEeFpPVFJPOENTRUhFem84b0xtOTBqTjAxdlpa?=
 =?utf-8?B?T2Q3TkVVT2tJOHRGYk9VWDVTMnJJekhyKzJQMGIzOWIydm1zWGtHZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae1e3e4-1c1c-45b8-a03a-08de6226fb7b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 06:47:50.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWs/GeeQcCvFeF6PbZu350GFj71e5GvpetEAGIyDNQfozoZ44lP769l3YULRJ8tenGOztt6r0NqbUORkkIai9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF83579A393
X-Proofpoint-GUID: pu7CM542hIYSldJvcy9RK5oJ8cLuhim3
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69804899 cx=c_pps
 a=nfJ3K52CLbhVQgIdADXVOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ID6ng7r3AAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8
 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=yQrtj3nMDOdTYHu_ew0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NiBTYWx0ZWRfX6Hws/74Iz0CZ
 Bs/pCfjXqek3S3bSjcndwIZXfspMzwWiV5oeiCyQ5jENNngorm1Gn9rixaFprUcLC4RzkFdP5Eb
 zCqZGM6qAfx9HQ3BvctqDKV7Lwc3H9mZ9NXVmEG809SycZwhjszMNLdm/siNViy6Ao9Xjdo/+8j
 q/Srpev87aWmrTQaCPd2UpZnAxaLf26a8caK02mJhI6lrxM01OPBPp1N0zp8CCpGHbntxxgGp+M
 zNLwK0KNf9brH4u8YbPZLQ8JC0ynWMxUetjABp0G4haQmxECxKgVUrNU6XVGWdxeRz7jXI9CmGY
 lzXSg3XzsLAfDtfApCx6xJb6T+yK7/MpeNttvH+yrtLclN77LjsFfsnI0mWdLQjwWCcc22dbKY+
 VNCibhdO10xSjJMvoscTnmsLmTtll71YEWEwLCjhBab7V9WOdIxudnWI50OnFfLF2wiEjwao4pD
 GVW8d4WTHNUN+3yzi0A==
X-Proofpoint-ORIG-GUID: pu7CM542hIYSldJvcy9RK5oJ8cLuhim3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6126A3kf2351266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 06:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230346

From: Chen Qi <Qi.Chen@windriver.com>

The qemu upstream commit, fcac98d0 (linux-user: Remove ELF_HWCAP2),
accidently introduced a regression. It used get_elf_hwcap where
get_elf_hwcap2 should be used.

With recent qemu upgrade in Yocto (10.1.3 -> 10.2.0), qemuppc64 build
is basically broken. There are a lot of do_configure failures with error
message like below:

  Fatal glibc error: CPU lacks ISA 3.00 support (POWER9 or later required=
)

Backport a patch to fix this issue.

Note that although the problem was only revealed for qemuppc64, some arm
and arm64 machines will also likely get the same issue, as in qemu source
we have:
  linux-user/aarch64/target_elf.h:#define HAVE_ELF_HWCAP2         1
  linux-user/arm/target_elf.h:#define HAVE_ELF_HWCAP2         1
  linux-user/ppc/target_elf.h:#define HAVE_ELF_HWCAP2         1

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...load.c-Correction-to-HWCAP2-accessor.patch | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-elflo=
ad.c-Correction-to-HWCAP2-accessor.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index d320b13ba7..7aa593bc5d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
+           file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accesso=
r.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Co=
rrection-to-HWCAP2-accessor.patch b/meta/recipes-devtools/qemu/qemu/0001-=
linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
new file mode 100644
index 0000000000..47d6f41385
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correctio=
n-to-HWCAP2-accessor.patch
@@ -0,0 +1,42 @@
+From c333f9c4ee212297f3b9a8a6ef62396a63c48e61 Mon Sep 17 00:00:00 2001
+From: Jim MacArthur <jim.macarthur@linaro.org>
+Date: Tue, 6 Jan 2026 15:40:48 +0000
+Subject: [PATCH] linux-user/elfload.c: Correction to HWCAP2 accessor
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+get_elf_hwcap was used when get_elf_hwcap2 should have been.
+
+Cc: qemu-stable@nongnu.org
+Fixes: fcac98d0ba8b ("linux-user: Remove ELF_HWCAP2")
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3259
+Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-ID: <20260106-fix-hwcap2-sve2-v1-1-1d70dff63370@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/c333f9c4ee212297f3b9a8a6ef62396a63c48e61]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ linux-user/elfload.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux-user/elfload.c b/linux-user/elfload.c
+index 0002d5be2f..35471c0c9a 100644
+--- a/linux-user/elfload.c
++++ b/linux-user/elfload.c
+@@ -708,7 +708,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int =
argc, int envc,
+     NEW_AUX_ENT(AT_EXECFN, info->file_string);
+=20
+     if (HAVE_ELF_HWCAP2) {
+-        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
++        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap2(thread_cpu));
+     }
+     if (u_base_platform) {
+         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
+--=20
+2.34.1
+
--=20
2.34.1


