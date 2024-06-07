Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAFAC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 13:41:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42326.1717767708993448947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 06:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6888aec719=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4575g939017504
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Jun 2024 06:41:48 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f6951-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 06:41:48 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 457DbodC014697
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Jun 2024 06:41:48 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f6950-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 06:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U81duMjtFb0GeEqLcma5nLG4sV9ISmkbX0aMyuoSxdW7FgVgxaZSCZ6uhOml0pEV+e78MEWCY6vp+cB9O6wP3jIJPF10TI6Qye3Py+T0nVuH+/AMXh+7JA+fdkpDkyFqaQar7+NHsMFc8BLmG4enrjaBU5opFMfuKb2jOh5giuF43sFFIG+fvPS+rwQ6x38UvLLDaDoQ8VGBQNY9YPLz6gK8Mf73bktJKa1Y0G21GwAjHUlxw/OZrPG9wscq/D2Zh0n6NlAnLniP6e+dttWZw9TfJ7160eV4H8XyeWbLa/0YfWKSz5lqIiWHi892wGXxBXSYl2VArVwd6WDv9twrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd996Py1tPLBve+nyoqWaGwKzNizOtWBq8gDdsrhqO8=;
 b=JR5lEL8Vc7XIMwS2sqqcHRyuI9tECBjj899qSX/Y8DfwrSTkUM2E3RFdMp14TVWTvPpKcAytJ1DaPNz/p5tClTqcQqveZlJytiFCe8xMebxTHfZA/K4tiCJnZnzN9XswuE77k5nrOcQ+Eks/bbecx1snYQsCc8f4r2bcIKEDt4digjq2+ceqdfF7Qc8bM3mzQKykMzVTk6oyr9p7LLyFexb5N7R7+ulED2niNpUHH/mdhlmU1b5HAg6zw/n4DSxyrE/kptgkM7l1pb8oGcR0f9cu2BQPpV+E4he9Lre8ooNXu9S1V/qqZ0lDb9eP+k26Ga6+rSuRIFf8h2rID8DVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 7 Jun
 2024 13:41:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 13:41:44 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Topic: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Index: AQHauAvrr6OpDiBe8ESoHWLmXtKWGLG8TomAgAAAn5A=
Date: Fri, 7 Jun 2024 13:41:44 +0000
Message-ID: 
 <CO6PR11MB5602F9E6285EBA317395BB3BEDFB2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240606122013.145187-1-Qi.Chen@windriver.com>
 <F1C4FA48-6A4A-4471-8AE2-1C1E3AC20A97@arm.com>
In-Reply-To: <F1C4FA48-6A4A-4471-8AE2-1C1E3AC20A97@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA3PR11MB7413:EE_
x-ms-office365-filtering-correlation-id: 4729b778-cccb-4803-c7e0-08dc86f7922d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aFhZVWRCUWxtTStFYlhqYUQzejM1YkQxZWd6aitWTHNoVE9kdXBFMkN3L0NN?=
 =?utf-8?B?T2hYSXVsS2R1ei9tenZjV3EyQTZNL3BVZ0JUNGdWVHk1d2dBZXFQc1dkMFhw?=
 =?utf-8?B?U2tGekVtSE1QSzJkWEVadzM1MmI4cVkrUWtWRXVSV1hOVFpKSWJkRkVpK25J?=
 =?utf-8?B?ODRPZmNOaGJnUlpxNGw0UkZHR0krVmplSk1aYzliOVBYTkRsRlV1Y1EvOEdt?=
 =?utf-8?B?bGJKZ3hoRTFQVTROSFRUbm5GdWNIbEE3SEkyeDk5ZUowbXlaSlUwOURqU0tC?=
 =?utf-8?B?eEQ2YVJ6amVRMERQM1Z2TUYzZEJpQlRsV3htb3RKak1nSjVWYjJ4aUp3bmF5?=
 =?utf-8?B?NDFMbi9iT09Tb2R1Mm92Ty9LOSs4OFhnM3l1SXFNa05LWUNyb2tyZm11MUwv?=
 =?utf-8?B?WWtUT1F5RjZETmlIZjRIOFBwbjFWMmtxVllTaGh6T00rWWEwY01kZnN5VXJX?=
 =?utf-8?B?TUlZNDlicDRVUUZVTkNSQTZpSXhIMVhERGZkY0JWOXJlOGR2YTFRZUs5QXlt?=
 =?utf-8?B?MXBrTDZjc3MxcDRzTGJrK1grVXZoa1hpV3FtVDZpZmNSSVFObzlqc1ppMGF6?=
 =?utf-8?B?aFZXeHd0Qng4RmhLZTJ4VkNLbFgyMDBwU0IzV2p1UWswemRVOEpUOWxSeHNh?=
 =?utf-8?B?L3YwejArZWFpNFlTSU5UamxlK1hBQmQ2KzNLV3ViZWQ2djVUbGxvdW9sZGhD?=
 =?utf-8?B?ZkVXVGE0dWRVMndyNytEc0l5dHR6eC9SckdGM2FyWFBwZzhjaHlUUnN5aFpV?=
 =?utf-8?B?ZmdFWHQvNUw5UXZFdjB5c0JnVGJUZGY1ZEM5K1RXTmU4UWY0STFUTnhWVGlD?=
 =?utf-8?B?Z0pSWHkwdVlHZk10NDUvbllIZXg4cTJPZTFEQjVoUVpGamlFQ0NsTFlYcjhs?=
 =?utf-8?B?SmVobGI5YkxzaTZLdGxuNFYyNGhPYk5FS0dITVJDanpMN0ovZVI4SGcvOGNF?=
 =?utf-8?B?MnIyUHRQdmk5UnZEd0piZDUwNkZnV3RqT0JXa3J2T3QrUk93QkZOOXpNS1hD?=
 =?utf-8?B?K1Y3eVIvS0poNThWR2xFejBtdjFvZzhOa0RQZUZWaGYxNGh6UUZQNlA2OTJT?=
 =?utf-8?B?QTNJblZLeDk0bXR5akErZndjS0J1UVZJbnF0UFlzZXpsdzVsWncxd0FJYS9N?=
 =?utf-8?B?SVlpR0paL296UFc5UXRXWWZDWm1LbENiTm5hZDhLTkp0M1NORUlzbmdLaEky?=
 =?utf-8?B?TTNNRm44ZjRjSDZmZEtHbFAxNlFnNjZ1MUNZN0JzTThseGcyL2Z3U2tTMlRZ?=
 =?utf-8?B?NmE1dVNOM3N0TGM2eE9Ba3hVT283eGJxTVpRM3IwWEttYXN5Y05jRVEyQ1J3?=
 =?utf-8?B?aitnTThtYU5janNmTGlaNzZDK2tKOUtxbzdadGQwOWp2U25pRi9PaWovU0hh?=
 =?utf-8?B?eHZaWFY3VDJiOWlxYmtEQW9IMVhxdzFGR3dLWk1CbExRQkZyTEpPYURLMWhD?=
 =?utf-8?B?TWIvRjMxeUxqU2x3MUQ2NDFDbDV6eHVBNDVNc1d1RnJORHU4ZVM3bmRoUFl4?=
 =?utf-8?B?bnQ1NWlqWTNtYXdxNWR6NGlkVTBnWEZ2SHJJZTZUQlNwVVd2Z29tMEhvQXBW?=
 =?utf-8?B?UTduNDEwd3c2ZEx5UDJZcjArdVVuL1RpTVk2ZXFyZTBTU1htUDBOQS9PQWRK?=
 =?utf-8?B?R1NsMStqamNic252aVphS1JwWVRCVWRuelBNN0ZRYnRFOEZXL1JRRzcrendW?=
 =?utf-8?B?emQydjJyaklZeU1Nd3RqdXRjR2xpWUh6bktyYXZzeGdpaFZxUGpzcUhodTlN?=
 =?utf-8?B?WThWdTEycy9PU1AwWUNZOGkwYm1PTk5pb2IzajEwWThtK2V0NWZJWWxqemxq?=
 =?utf-8?Q?v5z8akEisPd2FAeXCvpYgTKluLxyXTGy+Wtyc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXhCWEh1TS85ZThRMm1MclZycFQzbFVNMjEyakwzYWw2TlkvbzFNNEdDd3Fq?=
 =?utf-8?B?Q0lqT0d2VGdnUjkyYklGb3NRNk1GMmFmeWg5cGpGc1ZoK1g2b2s1SjJwMjN5?=
 =?utf-8?B?a1owditRNENUNjROZFBEMCtsYVRHQVBwRldJNlRsN2VZQ25NRDlsbFZmazFp?=
 =?utf-8?B?Vi9Fdkkxa1RaQlRqWlJnQ0FiclNaTzkyNkdJVTF6WE51N3A5eEswMDNreW9o?=
 =?utf-8?B?Z3RjV3AvZ01SQ0EzR3RteUZLNzdSRklSMFBVN3cxV08wVDV5L1kzZGZBNWdx?=
 =?utf-8?B?a0xRa3U0L2F4QTlYRVNBNElWcmJsS1VkV3QvWXRzMmtUazBDWFJ4VE5mMlJj?=
 =?utf-8?B?a0ZjK1FPUHZ6UHBtU1AyNHExRVhrQ2NNMmZiWldzTUFjcUxvMnlCTGFZTXdl?=
 =?utf-8?B?M0FpZmNycjE5aG5tVGVsQkRvY0MxS0hZdmQyb2E1WXhWcXQwQlV3bXBWMWl0?=
 =?utf-8?B?bWdUYUllREMrb09SQ0g1TXFPOEsxaitlOXJsVElwS2E3Tkp3UzF6c1FBcmZE?=
 =?utf-8?B?UStWRHFhSFQyeW1JZWNGdmE2QzEwY1FqMkswdnlyOU5Ma29BenNON2RTUll2?=
 =?utf-8?B?ZjdUUUNoQVZyZnN5Uy9yTHBmK2xGbGQ3UUdoTW5CWXhDcmZZdGloeFJzK2VB?=
 =?utf-8?B?VUd1aU1pT3lOQTdPVGJ6LzhBbElHN1N5ZE5PN3JJWDlhMTdDU2s3LzNDVGNm?=
 =?utf-8?B?WkorMVd5WkRvYmtDZjlkNkJ1OVQvWDFhSU9LQkdEa3kwUElkdXIzYjN2NXhZ?=
 =?utf-8?B?bTR5SUpyS1hUa2QzVVczZ2RqWm0zZDVPRDVISGQrSDNvZ1ZEZS9mT29qMkhH?=
 =?utf-8?B?dHdDMStYMmVFNEl4L0hBT3ZlYmt5QURnVzd6bFFkNVIzNXBHMzNVeXBkNXEw?=
 =?utf-8?B?d2xkRTdEWDdha1BzamhTNW92YmR4Sm1wYjZNNlJsYWhySFJwY1FueEdONjhy?=
 =?utf-8?B?V0djZDRjNVdZL3dQNjJqZGVTald0TkFta3Jqc1NVSzVjVjlOZHJIYnpPNXY3?=
 =?utf-8?B?SS85bU02LzR3d2pNSVNTc0dvVmFwQk92OFMvdGtTN1Jnc09jdEd2ZFA0RVE5?=
 =?utf-8?B?Zi8zZ2NBdDR1K0wvQU9ocnMyTVcwLzAvZG9FT1pTU1QyOXovUGsvdStzSnVT?=
 =?utf-8?B?blhoTXhTZkphZ1FXZE42Rnk3d01MVUJUTTliVC9ZcU5LUDBueFpUMDRpZWZY?=
 =?utf-8?B?ZFdwMmZkMm9sYWk3VG1oU3hNSVFqWkN2TGZobld3VnQ3dVphaFpaUnlMUW1Y?=
 =?utf-8?B?Qy9BNkxQV0R1VDNqZkJHdVdiQTZOWDlYOTdTcWozcjhldndVYmxhazlSejJZ?=
 =?utf-8?B?YlJZamdrWkxRWFJKOHBBSHUzSTFsdTFCcFhJQUNRUGhYVXdxRjVDV3hzcGFt?=
 =?utf-8?B?UHduWGduVTlDTjJwZlBQWHNIZy9HZnVRVnhaa3JuMWFkQmkxeEcyUUFSaVNv?=
 =?utf-8?B?Wk1KTWJSbEthak1aUkVUcTV1Z2VHS0Z0dmpzdTB2TjdQdE1TWHpVMU1xVmZL?=
 =?utf-8?B?VDFybk55UFJESDEyN3MxNGZ5OEEvRzBURkgwTUxTUHdZVWYzdWpZdXJuTlF4?=
 =?utf-8?B?VDdXbDNiRkd2V25iczVldjVPNEgrUGdFbEFqNng4TkZhQ2pXK1FkbjIzVHJu?=
 =?utf-8?B?YWd0ZTZ2NXl6byt0VjZrazdOcmszb3dVV2hFbXkrSUhzNHI3WlhjZjFTWDVO?=
 =?utf-8?B?Q3JxbFAzdUpKaVlCUXhPT0dCYmtISitESUVjTExPM0Y5OU53NmRjRUM2dHp5?=
 =?utf-8?B?N09LeWdBM0taVGd5SjB4OW5nU1lSTGpmME0xeGZ3d2tlM1k3L2RYTUp4MVFD?=
 =?utf-8?B?VHNLNlRGSjBCaVB6czQvVmVmTmhZUURBYldaQkNRNzllK1A3VEtQWnN3Q1k5?=
 =?utf-8?B?SzM1b296bDRyQm41QnRFOUk0NzdGUGZzL1N0UGR2ZFNhKzRQYzhEdWJwYVc0?=
 =?utf-8?B?UWtRdGpHdnBtQ2R6U0QwUEQ0a2Y5U0RTVHU5aStzNDVDbWNEcUdEY0c0WE5q?=
 =?utf-8?B?Z0kySDdjdVR5eXFvNzJ5dEVkT2tkTUFoTUhhNHBjZWl1YndoWWdDa0FFZ21y?=
 =?utf-8?B?RzVFWmNqc2Z1Z0czNDhmSDRaTmV3ekgrSFRlcHNiMzQ1VDgxR1JjSHBXRFRv?=
 =?utf-8?Q?Hp8PrIGUjd9Cpgtr0SvA3VgpS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4729b778-cccb-4803-c7e0-08dc86f7922d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 13:41:44.6715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7e4sdXh3AF7bUiG7CVF6z30KjlvPU0QFhuEkE8dJcg/4sNxjDUYmLa7O5Fh4xA0Qv/+Slj1rDmwIlx52BGYe8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-Proofpoint-GUID: IppYUGVdxo4ggdiiKPyOd75nGabaO-6b
X-Proofpoint-ORIG-GUID: 7RVX8KJHq1rdILkzYpUGD61saizBCbQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_07,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=892 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406070100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 13:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200443

QmVjYXVzZSB1bmxpa2Ugb3RoZXIgY29tbWFuZHMsIGdldGxpbWl0cyBpcyBhIG5vaW5zdF9QUk9H
UkFNLiBJdCdzIGV4cGVjdGVkIHRvIGJlIHVzZWQgYnkgaXRzIHRlc3RzIG9ubHkuIEkgY2hlY2tl
ZCBVYnVudHUsIERlYmlhbiBhbmQgRmVkb3JhLCBub25lIG9mIHRoZW0gcHJvdmlkZXMgZ2V0bGlt
aXRzLiBTbyBpZiBub3QgZm9yIHRoZSBwdGVzdCBwYWNrYWdlcywgd2Ugd291bGQgbm90IGJlIHVz
aW5nIHRoaXMgY29tbWFuZCBlaXRoZXIuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+IA0K
U2VudDogRnJpZGF5LCBKdW5lIDcsIDIwMjQgOTozNCBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVu
QHdpbmRyaXZlci5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCAxLzJdIGNvcmV1dGlsczogc3BsaXQg
b3V0IGNvcmV1dGlscy1nZXRsaW1pdHMNCg0KT24gNiBKdW4gMjAyNCwgYXQgMTM6MjAsIENoZW4g
UWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4NCj4gDQo+IFByZXZpb3VzbHksIHRoZSBub2luc3RfUFJPR1JBTSBnZXRs
aW1pdHMgaXMgcHV0IGluIGNvcmV1dGlscy1wdGVzdCANCj4gcGFja2FnZSBpbiBvcmRlciB0byBl
eGVjdXRlIHRoZSBwdGVzdC4gSG93ZXZlciwgdGhpcyBjb21tYW5kIG1pZ2h0IA0KPiBhbHNvIGJl
IG5lZWRlZCBieSBvdGhlciBwdGVzdCBwYWNrYWdlcy4gQXMgYW4gZXhhbXBsZSwgZmluZHV0aWxz
DQo+IDQuMTAuMCBwdGVzdCBwYWNha2dlIHdvdWxkIG5lZWQgdGhpcyBjb21tYW5kLiBTbyB3ZSBz
cGxpdCBpdCBvdXQgaW50byANCj4gYSBuZXcgcGFja2FnZS4NCg0KV2h5IHdvdWxkIHdlIG5vdCBq
dXN0IHB1dCB0aGlzIGluIHRoZSBtYWluIGNvcmV1dGlscyBwYWNrYWdlPyAgV2hhdOKAmXMgc28g
c3BlY2lhbCBhYm91dCBnZXRsaW1pdHMgdGhhdCBpdCBuZWVkcyBhIHN0YW5kYWxvbmUgcGFja2Fn
ZT8NCg0KUm9zcw0K

