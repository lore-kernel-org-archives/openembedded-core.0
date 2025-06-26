Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E38C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 21:36:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7586.1750973763245291525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 14:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=827273cba7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q5jBSs022431
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 21:36:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2p3yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 21:36:00 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55QLa0Dw019901;
	Thu, 26 Jun 2025 21:36:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2p3yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 21:36:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E54qegQ8Si2o6RKrpqR76/L4gfK7FlOIur7lxlj9xuLpYfzIQ3Y90Ok3RBVnIBLtp6953QkKhx5YnP5oHoobCLXAYC4mhS8icRzRNL+GVFYuBfUzsPSIJ84XdAKaiFiO21DuYemTdI5Z6o+8AS0EDZ/HhzjyfKp6eX+8SSlHWLY7ORHGIz9+m3WUuYx+hLQnJXetnS79an89zLgEcXwXrPP1uRE1CDdQWBbbYFnYlRkE7/61Vf1lkSoCVqsMq5AIKox4Kp77UWhTVO24kj9wUZPynicmm3DJ592CZ7l+h+biXnSaQXNQkJb/k+nnYZZYwErgu4VHUoIbaq3JvMImgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ12xcaNb9c1F3v26+Tkn0KHbYV5OFIJ0kFxfwyKfhM=;
 b=l4q0SEuz0rqvikU14flKWNofqeefPVP3I1wGjeqDyEljwfSANWBKmwJVeBFBHqohJc8i/iUo12QFGGS0P9wPhzhVgBcWAbFPVlofyAPV3BPc56lE9uLBxJNJP2xQano+Jq1yIY6mjlFLXEsgJTYnLmzISzErFspBYjKbgavVX5O5yucCPtornzmYjQ/RPDhhvtC1kfk87S7+9jZ6rJn4XGdLx41ixAFHEma5GohoBAhMwdlA5g+nXmDWP8a2e+O+ulj0thUXf6XztVHq1X4W5yweNdWxHWF9KXvAafqG9BgQryAyfrqqsOo2kBN8xZEIa25IWY8tT16HyYi9Apm4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 26 Jun
 2025 21:35:56 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 21:35:55 +0000
Content-Type: multipart/alternative;
 boundary="------------u0oITK0nH0XegCGxCD3JqXee"
Message-ID: <bae7bb60-41e3-462f-9be0-bc8bf6ff044c@windriver.com>
Date: Thu, 26 Jun 2025 17:35:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ninja: upgrade 1.12.1 -> 1.13.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20250626002130.791664-1-Randy.MacLeod@windriver.com>
 <CANNYZj_YaUGy9ZXN+MpH-X2v0ZORT2eonYAnDVxxpkKmbyUGXA@mail.gmail.com>
 <cf97cef36e9f78904b09bc88599ec2d21456bcb5.camel@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <cf97cef36e9f78904b09bc88599ec2d21456bcb5.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 03953a43-fae9-4519-d91e-08ddb4f96ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUFpaHZINzY1Qk5OekJKU09tNkFnb2pLaTErTmg5RUdESUlHY3VpdW93U1Rp?=
 =?utf-8?B?L1R5L2lvYzZyQzlYeVRMNm1VQkJyak8rV2lXREF4SHErdWYwbGg5RDAwWjd5?=
 =?utf-8?B?SXVWd3hpQVJSTnZvMFpXdEFOK1JRNEIxRjFseVc4M2VhMjU0SHFPMW5rZGMz?=
 =?utf-8?B?VExQREE3clBMRk1scnk1TFllVlJYQVpIS05FQjY3V01INDExTUE1WXovRVRU?=
 =?utf-8?B?b2c0VGk0QUVDRmd4QjJZQVMyaFdpbDd2eWJjZ3AwTEt0Zy9abmdFWW1sMGt4?=
 =?utf-8?B?QVBBWnU5djJqNkFYMjNWT3BGOHY5cTgxSTZBR2YxMUxqMkpQTWppQnd5NW43?=
 =?utf-8?B?bVdNaHcweVBOL3NMME92U0k3Ym9zMnkraDA4bmRlUDR3WS80SjFNdWZBYTVU?=
 =?utf-8?B?WDlDZGIzL1VXdndXVVM3R1ZISng1NHFEZjNFMlNIZzE5NERBM3p2RjQ5cDBn?=
 =?utf-8?B?MkxDQU9tczhiRkFrcTFVaE8wNWFzaXNxQXNNMjkybDVmZVJvOVVxcXFtTkRD?=
 =?utf-8?B?WDQ1KzFQSmFKb3NzTmdtRnkzZUJFSlI0MHFXVCtSc28wYnN6dFNIMm9HckJx?=
 =?utf-8?B?NXQ3VnRtZEVUUlBmVGpZQk02Mnd2Mlh0YmtxU2dLTTE2OUh2S0JqTVhCY2ov?=
 =?utf-8?B?dmNsS21lY09XbktaRCttRFNRZGhobDUyQjR1czVRK3IxZjEyRnIxRUpzS203?=
 =?utf-8?B?Vi9VWURjencwSnpiQjllandWekQ3UC82OGtMUFZXeE9PZTdZY05QTTFjWWh5?=
 =?utf-8?B?OW9jVEM1RHFlTzR2NFZXSGIyYWRNTmNtNWo3UVlicW1vbzgvaFhqNG4yNXh6?=
 =?utf-8?B?cmJ1a2RmcHUzcTVOMjY1RE1xSWFMRnF6dkNHVkdRejRjeVA5ZWVSMlJRTEl5?=
 =?utf-8?B?RWVXT2IxTFg2aVEwY3llYzlqKzg3dVFqMVJqeHRTem03TEpGQWxCNi9GOFJm?=
 =?utf-8?B?NDBzaUVIOTdaNlZPaGZSSDVHSlZlbEp6bnkzTllNOUQyQXRCLzlqUUh6SjVu?=
 =?utf-8?B?RmFGcmNVcnQ3bFBPR01EbmlTY2xFMEV1OEFtcCtoUFNmVHNhZEFtdUJDZXJj?=
 =?utf-8?B?MndiTjk3K0Nzcm1OUEgzY05jUGdJSGQxM1pZb0czbzVlNWppTjd2Y2VlemdB?=
 =?utf-8?B?a0kvTllzODV4WHRhRXplaTNFaVBCQnNLUlF2blV0aWJlSVZmbjlZRGgybGJR?=
 =?utf-8?B?WXJoaXQzMmErR1JiU2xHUTc1aHQ1WUNqSHVBM1NwV1pnMjV3eTJlYjdDTXNy?=
 =?utf-8?B?VFg3TFpWZzdaSFB3bVFJL2p0VTZkNWN5YmZRZ3h0OXJ1NmhhaG5pT01mRzJY?=
 =?utf-8?B?ZXFqTFhLTFJFeVpLYTFFSTFBa2xPUHBXZWZDTTZLZEJETlJIbEgvdW9iYmJR?=
 =?utf-8?B?WWl1QVoxaTh4VVlrVW9RcW9sRmRoTkxIVmJManJhdDFWOVQ3YVdReWpKYkVB?=
 =?utf-8?B?UHJYcFRJbkF4Vk5EM2VCY2JRQTNFVTZSekhnbzhBWktjOENtR2ljM2ZTRjBn?=
 =?utf-8?B?YUUxSXVYVlh4aFBiTnRZdWRRVndRSU5yUHVwNUp5MCszKzhHbkcwS3cwSjhz?=
 =?utf-8?B?NXBITGRYSjAxU0xsWVA1OG1lNGxnUmtCTTFvaUkrRGZIU0RNb3RYRm44a0NH?=
 =?utf-8?B?cHl2YTZGd2o4akYyY3MxY3VYQnVwbElaWGhQZ2M0MEFnWHRYQkM3SXdKVWM1?=
 =?utf-8?B?QkFnTHZNaUxudXhMSFFXQjR4dHg0U0hxN3pNZjY2OU5IejlpMVVnTCszSkxJ?=
 =?utf-8?B?bmJNSEJuVnpkQ2didmxyejdDd3NPSnBOa2dZeHVtU3pya1F6dnNoY0UvVjZJ?=
 =?utf-8?B?dXdqWEVXWWZBcURKMlJNdzBBcGYzZ3FkdHFyL1pLczRza1p0cy96QXU0dTkv?=
 =?utf-8?B?WkZYN1ovTmVkKytsWkpKWmczWUlIc0VBMEJZWVptUGt4aXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXB2bnBIYzNnSXZWalhxOGJVaDBsL3dGVnkxb0VDRDZaeHM0OVlpNVhQbWVv?=
 =?utf-8?B?L3hTSkQxY21KU0tVRkg4TStYSDY4WnJrWGd3OWxRNFEwTWVtRjBTRklZblJr?=
 =?utf-8?B?eklGVjJHMVA5VllCazM4aUl5aVE5LzFKeTJGQ1EybUVLSFE4dGFHZVVvelpi?=
 =?utf-8?B?emQraENhYWkrcnAvbTY5engvcXJJWU5UdDFjYXR2VTVGazVVV3JBT2QyUG16?=
 =?utf-8?B?dE5XOThrb2dlK2xVMFppS2ZOUkZvbkVUV3lEc00xKys5Rnh4eFYxdld1MEFY?=
 =?utf-8?B?NG9SMlBOc0dMZHFZSzZjcFUwLzNsaHh0K1IrVzl4WThIZUpYSzZORTc5SWp0?=
 =?utf-8?B?dDRVTjNuSGU5S0ZQbTI0S0dHWDE4b3FYZ0NCTUZSY0dUQXhkYUxaMFNDZ2Uw?=
 =?utf-8?B?STNQaythZUtWbWhGaXhmSVJQeEpkdmpiekgrT1UvTWxZOGdrYXFwTm5jVi9m?=
 =?utf-8?B?N0hZZHZYbEUva3RlczRyRTd3M1h0VHBUMlg4N2RabjZmZTJkcXFiN1dObWRE?=
 =?utf-8?B?LytZQ1duT0QxYkMzbWJwdng4QmJzcDRJbEEyb1lua3BSaGlPcHVVWWhnQkl1?=
 =?utf-8?B?WXdza0FwbHFsUW9ka0N1Mk1mRkliMlh6T3Rseks3N3N0Ym1lbzZXRkZhNXpm?=
 =?utf-8?B?dm5XY1hTOHpuWHBZZ2RYanRTVUJCSy83S3ZKeWpkVVQzTzk2VEVHdmtJUnNx?=
 =?utf-8?B?b2I5REF6eE1CR1lmQiszR0dzdnI5VXBaeDFqWWtpSi9HaU81cit5THNuS1Fu?=
 =?utf-8?B?a2JIUXlSbTZRbXp2MXRiT1pyUGxMQkJ0T1VmYnhCQ0svRERna0pDUW04SDA1?=
 =?utf-8?B?WmQ5Z2Vsb0RYbm5rYWtOdGFWeWErc1g3cTgwR2pwSVROUXp3eTY4T0JGbXha?=
 =?utf-8?B?dnhkSU5zcUlCUnNFWGl2Q1Q3MjFtK1Myd0Fac0lWclZWdUEzMUhJT09yTTk0?=
 =?utf-8?B?SEhMZG9rcHpnUDhEeVIxclI1TmZSdytubWNkeG55K1FNa2QxYk9DcVppNWZm?=
 =?utf-8?B?d3ZjOEFGb2YwazE1bGtIQUJ1RHhERFk0Wm9YWE5hcEhqdk1KNUMrcjNRQldm?=
 =?utf-8?B?NFVvTGV5VW9SZS9QRjczL20rUU1OK3RJNjN4WkxIb1JjWmpFaVhRTCtEQ2cr?=
 =?utf-8?B?NGJYMHFPRkdqQ1dHNEN6TC9IQ016anpoT2ExcHU3ZGYvdTN2MnpLNXVHeW5U?=
 =?utf-8?B?MHZMMS85dCtCQWlialAvZXJrWldnZzZ0VHJaV1FVUlJ4L3RWRVhIdjVsWUZs?=
 =?utf-8?B?MG1EWUZIWGc2YmZIOEFQcXl2YzRDU2tWdU5zTnA5WjdjZ0ZHOHE2ZjltQ3lB?=
 =?utf-8?B?dUQxZ2RzVmFvWFA1WWFDQzhiRWV0QW51YXo5bUNvQmNiVXJvTDQvTlViU3pO?=
 =?utf-8?B?UFMxOWE0NWJXbE9HY3l6VGxabU5VeWJBekI3LzZkN2ZJWDk2aVFGUXdVMXZZ?=
 =?utf-8?B?c3NTWGw1MktveXRJNVdvUGRkZmVDTk1uVFppcUdIN09WbUUxcUs0b29WM3lF?=
 =?utf-8?B?YkFLOGl1Q0Z3YmlIbWZUOUZYUEl3K2NaV0dqc1d2eTZKSjFKd05mN1hkOFlK?=
 =?utf-8?B?b1R2eG10SUVDd3UzdkhyUzFYUXphN1BFK3VqYXA2aE1tbjFtZUJrdUhRNWpN?=
 =?utf-8?B?elVxdk5NQm1pTG5oWFhEblNJd0NaY1dGMXdQUVNVSnd1ckVnd0phZTdGU0ht?=
 =?utf-8?B?bStzOHdOTGNwRG1jVmdPQldNU0lPYnVJZ0VUKzFUMTdPSUhqd2NRSkFrS3dO?=
 =?utf-8?B?czhoNUJSVzJicy93ZlNLQTlHUHJWVHJEcmFhV0ZnRmpWTE93aVN2Q0dyWmJo?=
 =?utf-8?B?K0s4SnNuZWZPTlVoODVWQmFqc2F0bkhyTlU4c3ZaVXFsN3NnRWN3bjI5S2dr?=
 =?utf-8?B?b1NaTjlMYVBBdERHNVRwM2pwNzFhMmY2R0trYklOYUZiMFVPOFdBVnZNckxl?=
 =?utf-8?B?M2pqT09pcWRHRTdRU3EvWWIyRklhYXFDQmNXMTBEZjBuYzZudUhIMTJrT3pk?=
 =?utf-8?B?SERMQlhvRVNEbWY2Q2M5ZmdiU3RnV1E1L2lYeDNlVkR2ZDRYTVNNTThPS090?=
 =?utf-8?B?a1BPQkpzZWtoMDF2Qm5yajNZNWxBMVc3YWNvanNibVl6RGNSTlBxWXZIcTZL?=
 =?utf-8?B?QjIrUHFGY2N4c0R5dnNWeVBTcldYbUFEcTFjL3NZaE8xYldKSFdzRVZDNVpS?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03953a43-fae9-4519-d91e-08ddb4f96ecd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:35:55.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llsc5fDbofkF8MeIV8VaqWwqFu1hfbH+fgO4gshRTlKBIWvK4TtYc6TG8L1Fo/DpsZVmidJsWUeEnoMy73PgXVeSnXg6mPiHKGbQN+EI+tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE4NSBTYWx0ZWRfXwsaglDerjdeZ YXCjl2PPkv05G7TnDkhI0yVFVEVGSMrNom7a7XXlzNt78tjXvoxqFrFo+IH6tI3gFcn8fYivO8j BJ7jU2r222qTT6vuOvpCy0w5qtdbwoo10DkETtaYTIfXIOZBi5SWiatxRfktXHUuoc8pxfn27E2
 J1wEjb8tZekUDYJNklK4G6gWdcevv4zehSZgMkaXZhBy1bvzy6eVfoTm97Ee8piNuqel+J9USZC QrGLj3we36FBWP0f9lQzeWqX7qyPqcymkyAQiWsRCHcxisaDsKbouzXjAtSMWL5OGTbZiXqZJQG LdbAC8mmxlm72VOY1YC/Qfg0QMmmQ940Qi2FiI+1umKt10am0Sk2XBMfsuZrK5+hzzeve50BHuf
 ZRJFaGcRU8g5l883DFUubNU8XZ2IsSkRokOzEBDhTFY9EoKnGQ3pzpZP/ALF93eAM0YMSt6U
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685dbd41 cx=c_pps a=w98JavBh/Rfy6fxb10yPhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=jGPkbu0fuskQIkJSZ_kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=4PiGWCd5y5qdShvIxeoA:9 a=wVnMpQvD4x6ohtBL:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: Zu1khi2C9wJ81-ZRG-6QE5e6Hqj40ZQP
X-Proofpoint-GUID: 35ynR6IFGCPSGzpNIk0kHsBUtQ9EtOmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 21:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219374

--------------u0oITK0nH0XegCGxCD3JqXee
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55Q5jBSs022431

On 2025-06-26 3:11 a.m., Richard Purdie wrote:
> On Thu, 2025-06-26 at 07:13 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
>> On Thu, 26 Jun 2025 at 02:21, Randy MacLeod via
>> lists.openembedded.org
>> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>> -SRCREV =3D "2daa09ba270b0a43e1929d29b073348aa985dfaa"
>>> +SRCREV =3D "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
>>>
>>>  =C2=A0SRC_URI =3D "git://github.com/ninja-
>>> build/ninja.git;branch=3Drelease;protocol=3Dhttps"
>> tag=3D... should be added here at the same time.
Okay, v2 sent.
> FWIW after the patch on the bitbake list, we could just go through and
> update the exiting urls too...

There are=C2=A0 ~161 such cases for oe-core:

=E2=9D=AF rg SRC_URI.*git.*branch=C2=A0 meta/ | rg -v tag | wc -l
161

and for meta-oe.git:
=E2=9D=AF rg SRC_URI.*git.*branch=C2=A0 meta-* | rg -v tag | wc -l
731

and for meta-virt:

=E2=9D=AF rg SRC_URI.*git.*branch=C2=A0=C2=A0 | rg -v tag | wc -l
812

It's not easily script-able since everyone has their own tag=20
prefix/postfix style. Fun!
There's probably a way to get the format of the tag with a bit of=20
scripting...

I'll likely work on and send these changes for oe-core by recipe-foo=20
sub-directory
unless I get it fully automated.


../Randy




>
> Cheers,
>
> Richard


--=20
# Randy MacLeod
# Wind River Linux

--------------u0oITK0nH0XegCGxCD3JqXee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55Q5jBSs022431

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-06-26 3:11 a.m., Richard Purdi=
e
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:cf97cef36e9f78904b09bc88599ec2d=
21456bcb5.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, 2025-06-26 at 07:13 =
+0200, Alexander Kanavin via
lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, 26 Jun 2025 at 02:=
21, Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">-SRCREV =3D &quot;2daa09=
ba270b0a43e1929d29b073348aa985dfaa&quot;
+SRCREV =3D &quot;b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638&quot;

&nbsp;SRC_URI =3D &quot;git://github.com/ninja-
build/ninja.git;branch=3Drelease;protocol=3Dhttps&quot;
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">tag=3D... should be added =
here at the same time.</pre>
      </blockquote>
    </blockquote>
    Okay, v2 sent.<br>
    <blockquote type=3D"cite" cite=3D"mid:cf97cef36e9f78904b09bc88599ec2d=
21456bcb5.camel@linuxfoundation.org">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">FWIW after the patch on the =
bitbake list, we could just go through and
update the exiting urls too...</pre>
    </blockquote>
    <p>There are&nbsp; ~161 such cases for oe-core:<br>
    </p>
    <p>=E2=9D=AF rg SRC_URI.*git.*branch&nbsp; meta/ | rg -v tag | wc -l<=
br>
      161<br>
    </p>
    <p>and for meta-oe.git:<br>
      =E2=9D=AF rg SRC_URI.*git.*branch&nbsp; meta-* | rg -v tag | wc -l<=
br>
      731<br>
      <br>
      and for meta-virt:<br>
    </p>
    <p>=E2=9D=AF rg SRC_URI.*git.*branch&nbsp;&nbsp; | rg -v tag | wc -l<=
br>
      812<br>
      <br>
      It's not easily script-able since everyone has their own tag
      prefix/postfix style. Fun!<br>
      There's probably a way to get the format of the tag with a bit of
      scripting...</p>
    <p>I'll likely work on and send these changes for oe-core by
      recipe-foo sub-directory<br>
      unless I get it fully automated.<br>
    </p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:cf97cef36e9f78904b09bc88599ec2d=
21456bcb5.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Cheers,

Richard
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------u0oITK0nH0XegCGxCD3JqXee--

