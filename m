Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD9EC44501
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 21:15:23 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1022.1783458913831030919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 14:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=ppfeb2020 header.b=2My3Itsz;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=selector1 header.b=deNAhppc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667KiJSW240806
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 14:15:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	J6BGy28rjdDk/Io3/0QuFCJFiWhzanGBRv69GVdHAVk=; b=2My3ItszO8ENyrCb
	DUGx5fFtM0DstFys5aRh8H/IULl3vaNWRYyh7KnyT/UUWfb73Rb8sjde/qtzv6e3
	NBNo6loT+V2l/0leqTPeqrc/WQ0/SVUAMp5m4eXIuwbhSY+JIw3zfy6e224aZxil
	Vad76skgcT/8jsOfUE99Qcz6ZP/wiNJ3gHWUr0CHsa94Q0L5loKOLzHvv1Bs94RL
	yiybcH3hvGgwQk8wWY8McUCZ9BuSiVzNXvVEvJRWgsGNywn3gJKIXJ5dd1OxpPxB
	9leG3+XxHndJJ7uaQ7T7JsZahky1GO5wKAZkXc44hyqDLRg99UpFlJ2kDoVo3YdX
	dFCFIA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4f98rmg38r-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O570OwrVBHGLsGctGpz2fNaeKj8YwEQEKTfiaLBSTsLBEalWVg0TqlmecRznS3QuLIpevrg8sX1W+MlSPwFq005OHv5totLfUQ6gK7wLz1gxC/2SRl3isEKJAsEt8ZaSuYgT57YxwMQb9rzRKTaBLi8KMVA4TpqVR02f7z1YrAHn7sy3zCj4/joyeOYINyT1kTQGgELBsvvrhCTe5I0yxRaSVjfkhh/GS/cbaFFTibQRG4z1xGFF/XbRX09zH9koUgigkdJ6SowsNJE4BF0tdZBxCdtQk1AQ0KupTpke148OjfSvOy1ONEVT/O5uszTsVQmrN9VlOp5/7M7TOGZtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6BGy28rjdDk/Io3/0QuFCJFiWhzanGBRv69GVdHAVk=;
 b=WrgI/uYy3oE1h4YzdjpxNTA+Ga9h0OqJYU23EEOuB8T8IIIdwxaeoC7OPsIbWX6I0fM/pvv5zCxEufomAHZSjYfFQkyo2kql+NyH4KcmJtlqi8mWxcYUXHgu3afcZ4jax98ngU3Y39vnFsqVxfKyFqfme7ysG8KaznUCsxoggZlG9p9CwGOc+JhLPt1xBckOVGn/MMuiaDlJQVS/WRASmeAeB2iw0rsytpmYGPutS3X6TFggGsf1NfT5pt5nHX10QMyMaRrS5cLTRZMtexYmGpcDS6DOLOCvvV7BsE6ALBlc9JnQU3GkHQMH8xfFNOUIhSSOUKSkXLUwdBuhyc+mmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6BGy28rjdDk/Io3/0QuFCJFiWhzanGBRv69GVdHAVk=;
 b=deNAhppcKpcu0p2zPReVt4lhlgYb83cGvonogkRXtP6Zl4vTzs/PZ6PffGAplJnIYz9NT9RHUzR5nR4mYq6kJWJ0okB0KJWTKBGPs24M2r+9vV+OcOT0WwMnUHcCD6GDISDe++5ZvJa0qp+gcv2nedQuC6vGaHH+WfPuguBaF5w=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CO6PR17MB4900.namprd17.prod.outlook.com (2603:10b6:5:357::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 21:15:08 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 21:15:08 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [OE-core] [meta][PATCH 2/3] oeqa/selftest: Add go-vendor.bbclass selftest suite
Date: Tue,  7 Jul 2026 15:14:55 -0600
Message-ID: <20260707211507.2585072-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783457902.git.john.ripple@keysight.com>
References: <cover.1783457902.git.john.ripple@keysight.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::13) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|CO6PR17MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 573921ea-80f5-4649-3d27-08dedc6cd2b5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|13003099007|3023799007|55112099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0qG9ay865T/SXl7hUhIKRLVLcj5N2mMqjdb4H9/Tzet0Fo3Omp2C6IYOdg66LX57KlOX4/2gp8ORx5CKTH9l/xn8yfaU3cgN9Xgj6eVmZ25ggUcsguJzbd/jvnwkAxCXdJytdkY3yh+XjFotWseJP9WPa12Gs4jCC3mIGBivUR6FTk+rZ4mg/DdUoOQlO8PPdbSvDE3/Yad40vXC1cF3w70MsW7OJR4DhQtOkaRi3wUX06T0SnS2aZjPnGVJoQTjKvoz3X2NNJHx4eulFq7R6sJED1Mhfz4c+vx9iuXWOa4h1y/Coy6qlFbOnvjMzcSh+94Vfkfpgdfo5biSVp/tQ2S3e5c8Qp0uwCCgMHD20T2OR86oc1/GkqYCf1d38pNZZjhEgYT7Qvl+xkbaMbmq9gzD+9JV3Rn8qfVpq7Mk5mXeohx/eLDqgwGOEnxtBeTy3zSdG1hPAGuvrut0xhGO1J3wv/Zyn3rN7PkY06uvri5ryYfUQSOg3c2AyVuR4x997tf3OUtYScbq3sx7sBHyF6Mb8Fptd98LY2J6xMFvGWwDt6YNYtWaIx86cKFRbo/8xvR0ubI9rIGvLmjVMQl71JAkTvPedUJ2n9e9N880kD4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(13003099007)(3023799007)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVdYY0FnbitxS3RMTjBCeTVMUnZZdFBQRXlJditVck00YWN4S1dvL2NIeHFm?=
 =?utf-8?B?KzkwOHpXeWpMQ1BkK0NreW9ybVhaZFZKK3RoallmNlRkM3ozcWdvRlplNzZ4?=
 =?utf-8?B?YlFzaXZLekVjNTlsbDdnVXhOSXlVU2VhLzNZYTNtRkVrd1JNL1gyK2IreFMr?=
 =?utf-8?B?Q2szZC92UjZobkYxRXNCMWh4V2Z2ME5mN0diTVdBSTRaMjVnL2FnQWZVUThF?=
 =?utf-8?B?MmpiWXF4SnRHbWVJejU5UFNEZWg1RjZJbTZxQ25NMjN6TjQveWJRUXBQSHhK?=
 =?utf-8?B?YXhwWTJCRlZmL1NIRnplaHhWQUF2ZjRwNnptdzBpMTNpSDNGYThFZDlHaGVj?=
 =?utf-8?B?UXpSbWdVQ3BVMzB0U1RSQnc2dS9YNllVS2RyN2s5dU04dzlMZGZ5aHg4dkdm?=
 =?utf-8?B?d2krUUs1cG9mNE9FMFM4SzZ2UmpsQ3lJRzB5QUQyWVU4dUNPcXkyZmUzZ3ly?=
 =?utf-8?B?NjMvaHdhaGZRZVJKMWFoSnR3c0k2K2xtZEVveW5hV1hBSVdkYUlyOFpuTUxG?=
 =?utf-8?B?VW1LQWdnM05DT3JKQ28rMyt0Mm4xcDQrVlJ6c0ZyeDdYV0tOL1MraEYvd2ww?=
 =?utf-8?B?OHBlL0VUbEVZWTdoRVpWQjJZYnF0MjFRM25aMmZhblpDR3NwLzJIc3Njb2VO?=
 =?utf-8?B?WlQyaExYaTBlQmZISlQrblRRcUl6M0wxUHpmY3dRbzZVc0pubFpsREpGMm5x?=
 =?utf-8?B?SUNUSGFpemowWDBFYTd4akFTUXdkN0VJL2RMSituMTB1dUlja1ZFZzZRZmNY?=
 =?utf-8?B?ZldoakpjU09xNk9Gb3plTUlUTG9DaXlvSU0zcjM2Y2MzUVpyTjRoZGxvNmg5?=
 =?utf-8?B?SnFOSDIyQkJGaDA5R0tOVFhiTVJBZ2M1blZpMmNXZ0VCaWx2WmVwNTIxeEhh?=
 =?utf-8?B?aW5LUnZ3UGN2dWwxVk41ZUZuMzJjWG8rTDE4eC94RjhNc1ljQk5BQ2tFeW5k?=
 =?utf-8?B?UStkc0NpU0NpZmtDZXJiM09nODlVMFhYQnRTNFQrME9zQ3lhU1cwUmJITXI4?=
 =?utf-8?B?VkVhbjNXQStHSnFVVDBCRUkxcjdiN3EwcTIwRExyVWFWWEluamdYYUt6N1gw?=
 =?utf-8?B?TERpL0lrNTJrNFFOUHN1TWc4Qzc4NFRpL1ZkMTJBVlptNjJOQm95L0hDQTM4?=
 =?utf-8?B?dTFGM0J6amw1NVA0RWdDMEtlK3JuaUNqd3k5Ny9PeUc5KzlMczNVdzJzTGh0?=
 =?utf-8?B?UjUrNU9Sd3hlZWhJZ2JDNjkzelp5VUlCUndVNk5TME1UalRtL2VSWkdDQnRK?=
 =?utf-8?B?QlVmbDM1bm15V1hibllEbnB4ZXZ3aE9aZEJtY29sWG9JM0xCa0FBSlBLc0I5?=
 =?utf-8?B?Y3IrbWcwaUtjS2t3blhVekY1aXJUb0pYZk9pUDd1QlZIRWttMGxmc0ZiODNY?=
 =?utf-8?B?Tklub0p1K0U4blozTXIvdGdTSjdCTmYzNktZbFVHMVBwTUt1eWh1ME1YNFlP?=
 =?utf-8?B?eTE5d1V4R21LYzE3Q3NrQ0JxRythWUQ3ZWgyTFBFVG5PcERIV0dhMGFqakdM?=
 =?utf-8?B?dVdZc3g5S3FWanBxR0VVRXN6M3VHTGZrWkkyaUdpeVpyOTBNeTJLRklHV1dh?=
 =?utf-8?B?Y2ptNHJXMzBNejBoWjFSdERUT3VTcTVMMDFpOXdmMmE0S0hsR3hObGR6ZlBM?=
 =?utf-8?B?L0l5eHJkcVQ5ZlRSWG5ZdlVJMU5MYmZ5OTdSTWpwalRDa1ZpUEdycWtqYS85?=
 =?utf-8?B?ck45a2hCUWFWMzBsK2dsUzdCUGcwTm9uSEtyRmNsV09FY2U3eng4M0hYbHA3?=
 =?utf-8?B?Tm44YmFXZEwvTzJyRWJHb2xRR0daaFhyNGQyMnVqWThrZFJZN3BZZEZvak9R?=
 =?utf-8?B?L0t5RjZOakJsRStZUnRoOG8xbWRPY1hTU1dPblN0a3hyYWN3dUhiZEkySVYw?=
 =?utf-8?B?WTN0UkZZNG1qS1RtTU9LTG5aZ3JRM1Ayd1dNays3UmZxOFk1VDBvaTg3N0I2?=
 =?utf-8?B?czdua2xQcWY4WTB1VnZicHpyQjYvYVlicWVIWVppTUJWdjREdGVqN0dscTFM?=
 =?utf-8?B?ajFNTXk1OGRhUHJqdUEwWlJ6V2pqLzV0cWNURXhBcUhmWEdobEN1WE1DRXJj?=
 =?utf-8?B?SVVoKzJkelg5TVBSY0hIeUkzTXRObmxlOUYrMkZWQnVtL1pLeDcwUng1bCtD?=
 =?utf-8?B?cWFvYkNTNkNNY1hCaUQzTUhpbUt4bWY2RlFnK3oydnUyUExDN2FySm9XQzEv?=
 =?utf-8?B?OERleDJFTUJ0eWtFRHByeGlUbFRXcEtCaGNZeHh0cVFpWWFub2U0VlVwdkk4?=
 =?utf-8?B?TW1LaDN4c2hmNnpEN1dZOUV0YzNCV21sZWd3NGNBYXdEanFrWFp5OVE3Qmlp?=
 =?utf-8?B?NVp5ZjZuSkZaem81S3VDUlhncmpXTm9xb1ZVVG9FN0lyRnJLdVZBQT09?=
X-Exchange-RoutingPolicyChecked: 
	PUG4e85ys+wHrC8MZXgfC6DaahKwcAg1ZOZ3hDdnqllO39J6YBE2PmQa58fx4epRTuueHkFNeZviZYbRX0xAHfyk8RSURTaT11eCnhkLwdMu31vsMZoF7hBSzPWVEi8zi38Psm6JXAN94MB+sY/TXpBOKRmws7TGeIqxCkZ2oCeIijCWJrefrQj+1fAeArFB/SdYPqEWw5Rjpzvj+vqT3dMtP8kL9kvhxU3lUhcvqPrF16kh8FPQmFUhn6ixhoevf/xkDJYxMgNJhWRlYdHatyLRSxjYVyoMVMbtHgBjeTXE1+2fG1p7NnUd1HbSGuLb4CGyMmvJQs0tzGGeXUDXtA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lzAq4sotLXp9KXBjYH7frDuXvYjxwNU9udHDpwZLpFkgc/AjEfNhp4T/c4mHvnHCrmm71goKX2XbNJeVprKLmQbtnidjPrPw44JLVPBzwrYhBYlHnYG1MXMe1ZZlhpbVpuhtOFqkvMn6LSOv1l/WeYUYyOCDrIsnFpNE2h5zc2pF+CqIejubGOTNw4/n53DECDOykApIg07yR2qUWujLAmyCT+5Gp67dijzX0TsW+dbUaNlXXQxW4Z8fiSGQwB92ys3mJDTd/E8uHUJbljmVqrbYEVy1T2eMOcyn97v4pv5zPbe6VigRl1I7pWLuQMNaEN0maTfLr4GUq495zqImu6vdpHoYOq/XppkSfQreZ+djltc3G1ry7wEx43m3JG0+t3eaCcU6dzduZVy5kA1nVtVwp3oSiJokbsizJY5BRGFulixD8hVNss9Ojl0n0wokYlsmomjZMKn0xar0Sq8Q6StkKd92qAp3UsAtnbUSboCbR/5FYlt1eRSP1I2RkorzaCcTe4YJZt/+TfIwvGfQeB+6Vb2vLQ2DmdvTO5Q2kieCI3fP8CZGIy8ZBLwT1c11+QTGASE+x4hc+jGB6EyjbX9M/XJgSgAAvu4PBlguTbQKgrtr9lCUJnO9nB8/UKa2
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573921ea-80f5-4649-3d27-08dedc6cd2b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:15:08.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdX8t2PCvXr7v4dHNz97a5fPLwG940XoIz1E0sv93SBYkTqlvbsUepsbTAYVLtRxrkRSanwC5mEWrIZLR4RnOYzS2NszWJsCTM67K/oSAxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4900
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfX82dgRtPAvalO
 lnqYLDsr4afnnTWgjn6O2v+2lyppuIZCjCM/Iz3MrpBLoQZkt5LKQt8+bLE5v54tRdFCo/aAIpQ
 qDVxglwTfy8s++D+I7w7cQPzeRH3BYjYOCi5x9PPYAbitvN67Zfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfXyaLFsNx7wRcD
 bT/fQvE+eo6ewN7vRzvStd/Qg/BvIDubqQcb02g5s/JEOnGm6wujn3bfvTSdfc98MQzuP09UgLr
 miJ1z0+xaVCNwnUnE18KuxNncQMW6cJx8B3dHAIzsFe0lLQ9k+Yb4u6SYGuq9O60vVooVlHIaOs
 6Ukrikbff46O6PLfsX+xu0vw5YbhgFYDB0i4eL3Z2n/QTmPWCLfeHk1h90AKKMqIaIqQuCBSwhV
 cwXZp8dGfmSnk5RSiB8j70zTZ/wOS10umVdLyBEEDHji0FbywTRmm4vxQJwIQvccnomTXy7ZH8x
 VhPNq4Y8pL9vuLzgZZkVKVbdClzVJKBshaQGlI/nwbMNJqQtLvQc+EJJO1fGYsIl6pL8H3SKmyM
 hkE9iTeVb/1rsqmM7624mOPd+kqwmVH/Sg2S0NMbEy9X/No5okabIg4p51dI1IjeZEV/pAhQgQC
 ivECZGSF4hCLgJ7hZCQ==
X-Proofpoint-GUID: LrvLU4Xs0d3btPV_c0Scvc7M-1nwftJ9
X-Proofpoint-ORIG-GUID: LrvLU4Xs0d3btPV_c0Scvc7M-1nwftJ9
X-Authority-Analysis: v=2.4 cv=HuFG3UTS c=1 sm=1 tr=0 ts=6a4d6c61 cx=c_pps
 a=pvbKGUK/Si0pumwNLfsG/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=mOSSRekXLlsqcmK058qe:22
 a=F6MVbVVLAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8
 a=5cgIs88SztoUVwLlgL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6mxfPxaA-CAxv1z-Kq-J:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11840
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070208
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-003cac01.pphosted.com id 667KiJSW240806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 21:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240409

Add govendor.py with two test classes that cover the behaviors fixed and
defined in go-vendor.bbclass:

GoVendorSrcUriTests (offline, ~10 s): unit tests for go_src_uri() parsed
via bb.tinfoil; verifies the basic URI shape, path/pathmajor/subdir/repla=
ces
encoding, and that non-git VCS omits the git-specific nobranch/protocol f=
lags.

GoVendorTaskTests: runs do_go_vendor once against the real recipetool-go-=
test
project and checks that external deps land in vendor/, *_test.go files ar=
e
excluded, pathmajor=3D/v5 falls back to the repo root when no v5/ subdir =
exists,
modules.txt is reproduced in vendor/, a local replacement (./is) appears =
as
a symlink, and the S/src/GO_IMPORT/vendor -> S/src/import/vendor symlink =
is
created.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/lib/oeqa/selftest/cases/govendor.py | 264 +++++++++++++++++++++++
 1 file changed, 264 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py

diff --git a/meta/lib/oeqa/selftest/cases/govendor.py b/meta/lib/oeqa/sel=
ftest/cases/govendor.py
new file mode 100644
index 0000000000..a56cb93698
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/govendor.py
@@ -0,0 +1,264 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Comprehensive tests for go-vendor.bbclass:
+#   GoVendorSrcUriTests  -- unit tests for the go_src_uri() helper (offl=
ine, ~10 s)
+#   GoVendorTaskTests    -- integration tests using the real recipetool-=
go-test project
+#                           (network fetch of git.yoctoproject.org + git=
hub.com/godbus/dbus)
+
+import os
+import shutil
+import tempfile
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp=
_layer
+
+# Module-level temp layer shared by both test classes
+templayerdir =3D None
+
+
+def setUpModule():
+    global templayerdir
+    templayerdir =3D tempfile.mkdtemp(prefix=3D'govendorqa')
+    create_temp_layer(templayerdir, 'selftestgovendor')
+    runCmd('bitbake-layers add-layer %s' % templayerdir)
+
+
+def tearDownModule():
+    runCmd('bitbake-layers remove-layer %s' % templayerdir, ignore_statu=
s=3DTrue)
+    runCmd('rm -rf %s' % templayerdir)
+
+
+# ----------------------------------------------------------------------=
-----
+# Class 1: go_src_uri() helper function
+# ----------------------------------------------------------------------=
-----
+
+class GoVendorSrcUriTests(OESelftestTestCase):
+    """Tests for the go_src_uri() Python helper in go-vendor.bbclass.
+
+    Parses a single fixture recipe via bb.tinfoil (config_only=3DTrue) o=
nce per
+    class so the function runs inside the real BitBake class-loading mac=
hinery.
+    All tests are offline and complete in ~10 s total.
+    """
+
+    @classmethod
+    def setUpClass(cls):
+        import bb.tinfoil
+        super().setUpClass()
+
+        recipe_dir =3D os.path.join(templayerdir, 'recipes-test-src-uri'=
,
+                                  'go-vendor-src-uri')
+        os.makedirs(recipe_dir, exist_ok=3DTrue)
+        recipe_path =3D os.path.join(recipe_dir, 'go-vendor-src-uri_1.0.=
bb')
+
+        with open(recipe_path, 'w') as f:
+            f.write(
+                'SUMMARY =3D "Selftest fixture: go_src_uri parameter var=
iants"\n'
+                'LICENSE =3D "CLOSED"\n'
+                '\n'
+                'inherit go-vendor\n'
+                '\n'
+                'GO_IMPORT =3D "example.com/testpkg"\n'
+                '\n'
+                'GO_SRC_URI_BASIC     =3D "${@go_src_uri(\'github.com/fo=
o/bar\', \'v1.0.0\')}"\n'
+                'GO_SRC_URI_PATH      =3D "${@go_src_uri(\'github.com/fo=
o/bar\', \'v2.1.0\', path=3D\'github.com/foo/bar/v2\')}"\n'
+                'GO_SRC_URI_PATHMAJOR =3D "${@go_src_uri(\'github.com/fo=
o/bar\', \'v2.0.0\', pathmajor=3D\'/v2\')}"\n'
+                'GO_SRC_URI_SUBDIR    =3D "${@go_src_uri(\'github.com/fo=
o/bar\', \'v1.0.0\', subdir=3D\'sub/pkg\')}"\n'
+                'GO_SRC_URI_REPLACES  =3D "${@go_src_uri(\'github.com/ba=
z/qux\', \'v1.0.0\', replaces=3D\'../local/baz\')}"\n'
+                'GO_SRC_URI_SVN       =3D "${@go_src_uri(\'example.com/s=
vnmod\', \'r42\', vcs=3D\'svn\')}"\n'
+            )
+
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=3DTrue, quiet=3D2)
+            rd =3D tinfoil.parse_recipe_file(recipe_path)
+            cls.bp =3D rd.getVar('BP')
+            cls.uris =3D {k: rd.getVar('GO_SRC_URI_' + k)
+                        for k in ('BASIC', 'PATH', 'PATHMAJOR', 'SUBDIR'=
,
+                                  'REPLACES', 'SVN')}
+
+    @classmethod
+    def tearDownClass(cls):
+        runCmd('rm -rf %s/recipes-test-src-uri' % templayerdir,
+               ignore_status=3DTrue)
+        super().tearDownClass()
+
+    # --- individual test methods --------------------------------------=
-----
+
+    def test_basic(self):
+        """destsuffix uses expanded BP"""
+        uri =3D self.uris['BASIC']
+        expected_ds =3D 'destsuffix=3D%s/src/import/vendor.fetch/github.=
com/foo/bar@v1.0.0' % self.bp
+        self.assertIn(expected_ds, uri)
+        self.assertIn('go_module_path=3Dgithub.com/foo/bar', uri)
+        self.assertIn('nobranch=3D1', uri)
+        self.assertIn('protocol=3Dhttps', uri)
+        self.assertIn('is_go_dependency=3D1', uri)
+
+    def test_path_override(self):
+        """Explicit path=3D sets go_module_path independently of the rep=
o URL."""
+        uri =3D self.uris['PATH']
+        self.assertIn('go_module_path=3Dgithub.com/foo/bar/v2', uri)
+        expected_ds =3D 'destsuffix=3D%s/src/import/vendor.fetch/github.=
com/foo/bar@v2.1.0' % self.bp
+        self.assertIn(expected_ds, uri)
+
+    def test_pathmajor(self):
+        """pathmajor is encoded as go_pathmajor in the URI."""
+        self.assertIn('go_pathmajor=3D/v2', self.uris['PATHMAJOR'])
+
+    def test_subdir(self):
+        """subdir is encoded as go_subdir in the URI."""
+        self.assertIn('go_subdir=3Dsub/pkg', self.uris['SUBDIR'])
+
+    def test_replaces(self):
+        """replaces is encoded as go_module_replacement in the URI."""
+        self.assertIn('go_module_replacement=3D../local/baz', self.uris[=
'REPLACES'])
+
+    def test_non_git_vcs(self):
+        """Non-git VCS omits the git-specific nobranch and protocol=3Dht=
tps flags."""
+        uri =3D self.uris['SVN']
+        self.assertIn('svn://example.com/svnmod', uri)
+        self.assertNotIn('nobranch', uri)
+        self.assertNotIn('protocol=3Dhttps', uri)
+        self.assertIn('is_go_dependency=3D1', uri)
+
+
+# ----------------------------------------------------------------------=
-----
+# Class 2: do_go_vendor task integration =E2=80=94 real project
+# ----------------------------------------------------------------------=
-----
+
+class GoVendorTaskTests(OESelftestTestCase):
+    """Integration tests for do_go_vendor using the real recipetool-go-t=
est project.
+
+    The recipe fetches git.yoctoproject.org/recipetool-go-test (commit
+    c3e213c) as its main source and github.com/godbus/dbus/v5 v5.1.0 as =
an
+    external vendor dependency.  The project also has a local module
+    replacement (github.com/matryer/is =3D> ./is) that lives inside the =
main
+    source tree.
+
+    do_go_vendor runs ONCE in setUpClass; individual test methods inspec=
t the
+    resulting vendor directory without re-running bitbake.
+
+    Verified behaviors:
+      - External dependency files are copied to vendor/
+      - *_test.go files are excluded from the vendor copy
+      - pathmajor fallback: when the /v5 subdir is absent, repo root is =
used
+      - modules.txt is reproduced inside vendor/
+      - Local module replacement creates a relative symlink in vendor/
+      - S/src/GO_IMPORT/vendor symlink is created pointing at S/src/impo=
rt/vendor
+    """
+
+    # git.yoctoproject.org/recipetool-go-test main branch HEAD
+    SRCREV =3D 'c3e213c01b6c1406b430df03ef0d1ae77de5d2f7'
+    GO_IMPORT =3D 'git.yoctoproject.org/recipetool-go-test'
+    RECIPE_NAME =3D 'govendor-real-test'
+
+    @classmethod
+    def setUpClass(cls):
+        from oeqa.utils import ftools
+        super().setUpClass()
+
+        # overlayfs-user.bb in meta-selftest requires a machine-specific=
 mount
+        # point that this test environment does not provide.  Mask it so=
 that
+        # bitbake can parse the full recipe universe without halting.
+        ftools.append_file(cls.testinc_path,
+            'BBMASK +=3D "meta-selftest/recipes-test/overlayfs-user"')
+
+        recipe_dir =3D os.path.join(templayerdir, 'recipes-test', cls.RE=
CIPE_NAME)
+        files_dir =3D os.path.join(recipe_dir, 'files')
+        os.makedirs(files_dir, exist_ok=3DTrue)
+
+        # modules.txt for recipetool-go-test at SRCREV:
+        #   - github.com/godbus/dbus/v5 v5.1.0  (external, fetched via g=
o_src_uri)
+        #   - github.com/matryer/is v1.4.1       (local replacement =3D>=
 ./is)
+        with open(os.path.join(files_dir, 'modules.txt'), 'w') as fh:
+            fh.write(
+                '# github.com/godbus/dbus/v5 v5.1.0\n'
+                '## explicit; go 1.18\n'
+                'github.com/godbus/dbus/v5\n'
+                '# github.com/matryer/is v1.4.1 =3D> ./is\n'
+                '## explicit; go 1.14\n'
+                'github.com/matryer/is\n'
+            )
+
+        with open(os.path.join(recipe_dir, '%s_1.0.bb' % cls.RECIPE_NAME=
), 'w') as fh:
+            fh.write(
+                'SUMMARY =3D "go-vendor integration test: recipetool-go-=
test"\n'
+                'LICENSE =3D "MIT"\n'
+                'LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;m=
d5=3D4e3933dd47afbf115e484d11385fb3bd"\n'
+                '\n'
+                'inherit go-vendor\n'
+                '\n'
+                'GO_IMPORT =3D "%s"\n'
+                '\n'
+                'SRC_URI =3D "\\\n'
+                '    git://${GO_IMPORT};name=3Drecipetool-go-test;branch=
=3Dmain;protocol=3Dhttps'
+                ';nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \\\n=
'
+                '    ${@go_src_uri(\'github.com/godbus/dbus\', \'v5.1.0\=
', \\\n'
+                '        path=3D\'github.com/godbus/dbus/v5\', pathmajor=
=3D\'/v5\')} \\\n'
+                '    file://modules.txt \\\n'
+                '    "\n'
+                'SRCREV_FORMAT =3D "recipetool-go-test"\n'
+                'SRCREV_recipetool-go-test =3D "%s"\n'
+                'SRCREV_github.com.godbus.dbus.v5 =3D "e523abc905595cf17=
fb0001a7d77eaaddfaa216d"\n'
+                % (cls.GO_IMPORT, cls.SRCREV)
+            )
+
+        bitbake('%s -c go_vendor' % cls.RECIPE_NAME)
+        cls.s_dir =3D get_bb_var('S', cls.RECIPE_NAME)
+        cls.vendor_dir =3D os.path.join(cls.s_dir, 'src', 'import', 'ven=
dor')
+
+    @classmethod
+    def tearDownClass(cls):
+        runCmd('rm -rf %s/recipes-test' % templayerdir, ignore_status=3D=
True)
+        super().tearDownClass()
+
+    # --- test methods (all inspect cls.vendor_dir, no bitbake) --------=
-------
+
+    def test_external_dep_copied_to_vendor(self):
+        """godbus/dbus/v5 source files are copied into vendor/."""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        self.assertTrue(os.path.isdir(dbus_dir),
+            'vendor/github.com/godbus/dbus/v5/ not created')
+        self.assertTrue(os.path.isfile(os.path.join(dbus_dir, 'conn.go')=
),
+            'conn.go not found in vendor/github.com/godbus/dbus/v5/')
+
+    def test_test_files_excluded_from_vendor(self):
+        """*_test.go files from godbus/dbus are not copied into vendor/.=
"""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        self.assertFalse(
+            os.path.isfile(os.path.join(dbus_dir, 'conn_test.go')),
+            'conn_test.go should have been excluded from vendor by *_tes=
t.go pattern')
+
+    def test_pathmajor_falls_back_to_root(self):
+        """godbus/dbus v5.1.0 has no v5/ subdir; pathmajor=3D/v5 falls b=
ack to root."""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        # auth.go is at the repo root of godbus/dbus, not inside a v5/ s=
ubdir.
+        self.assertTrue(os.path.isfile(os.path.join(dbus_dir, 'auth.go')=
),
+            'auth.go not found; pathmajor=3D/v5 fallback to repo root di=
d not work')
+
+    def test_modules_txt_in_vendor(self):
+        """modules.txt is reproduced inside vendor/ and lists the extern=
al dep."""
+        modules_txt =3D os.path.join(self.vendor_dir, 'modules.txt')
+        self.assertTrue(os.path.isfile(modules_txt))
+        with open(modules_txt) as fh:
+            content =3D fh.read()
+        self.assertIn('github.com/godbus/dbus/v5 v5.1.0', content)
+
+    def test_local_replacement_symlink(self):
+        """go.mod local replacement (./is) creates a symlink in vendor/ =
to S/src/GO_IMPORT/is."""
+        symlink =3D os.path.join(self.vendor_dir, 'github.com', 'matryer=
', 'is')
+        self.assertTrue(os.path.islink(symlink),
+            'vendor/github.com/matryer/is should be a symlink for the ./=
is local replacement')
+        expected_target =3D os.path.join(self.s_dir, 'src', self.GO_IMPO=
RT, 'is')
+        self.assertEqual(os.path.realpath(symlink), os.path.realpath(exp=
ected_target),
+            'Local replacement symlink does not point to S/src/GO_IMPORT=
/is')
+
+    def test_go_import_vendor_symlink(self):
+        """do_go_vendor creates S/src/GO_IMPORT/vendor -> S/src/import/v=
endor."""
+        link =3D os.path.join(self.s_dir, 'src', self.GO_IMPORT, 'vendor=
')
+        self.assertTrue(os.path.islink(link),
+            'S/src/GO_IMPORT/vendor symlink not created')
+        self.assertEqual(os.path.realpath(link), os.path.realpath(self.v=
endor_dir),
+            'S/src/GO_IMPORT/vendor does not point to S/src/import/vendo=
r')

