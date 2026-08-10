Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4CCC5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:56:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34389.1786380099976993655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 09:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hVQHdbT4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26820e4fc3=venkata.navuduri@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGCYVp2428035
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 16:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6o98b4wB/p1113fk2z6YZG
	eMs3AtjFP1sjlmZevjXQg=; b=hVQHdbT4QEqtlRJoIQH7xCoQVEk725y2YMgM7O
	y9Fox2Lwq51KuT757zzQCP9FhZuCdfUau9a+NrgvTlLTaPEOqwZRrSxuRQ1xLtBs
	5DBC/q/JO4d2cvYIE1AWdViOGPXXjzgP87lgFn+9+G30VywMsJQaowKaxlZnPg69
	qNl3ZcZWmXz00IrJCr11LfO8lI+FG0uMZFhRte69g9yyTQpJfSObYD76bXkFoeXx
	ExksRKNmV7Fu7dJezDjq8f8Gp4Ei7uqz7r5xOyfpa6s6IKDhcKk0DC73W1HsUYW+
	N55IA/LTosGnquTBRkJpFhi0YUhbboeyTWOKbZ1TN5/fcHDw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023124.outbound.protection.outlook.com [40.93.201.124])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwsnwjuch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 16:17:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz/MhARkX8JIx8omCW5FwG60u9mO08uFE9S+qIAwg6GLKxGvL5MdBmeZDZgmGEljeJpLrDdZk2boXTucyvo6+iV6zq1TtT/YOSxsNUCfvsm5O6G2i26fGwOKyMPe/bolVA+pgM5J1i441ysHJiRbPI7QvAa6sadUtFmkgzyxOKv89Go7nwnjmu3Emd3IjUhA/dtirFEJBIwxhqofC4rGEwYNmck/mAioeg9fBDHgTRVNsKr3Vb/O5jpnoaw5n664nV7Ww/GDo7JB/iYfrb3BEHeP3/feiyqDYMMDuP8V9iZnmYCRDJM6HnOEDpO7FnaGlPvNo92BLw17Q8+FkuNiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o98b4wB/p1113fk2z6YZGeMs3AtjFP1sjlmZevjXQg=;
 b=RfUwEoXVwSFI0ASR3fJPdNgb5aosomC7XnjYwo5QIsugieJ4tSlYtVj3T0kAlDPdkvcVMl+ADFKSOXCrqhpEIJM/bL5Q1CvN7+krtSArUNQ0v63OEPYBBXAiclUV/DtuRHlgxug6IiJFpw1GBnTP/Cbv0jh+tiRdZwSUaxTtUFQ2hTrRyE7dmM11ccx/ilT2CkXUVTiITw139x+p+LA2+CipwSNAzKilPjDO8tUHc3fLS+qyKHsq5kWOustt8SpZIl38Hoq1rjJTcf5h+cOfxC5YaQFW+V1lM5ItomeeSIFalpkn65oH7xDmEI1o7JpHNQOXQ+UpSB6H6kcGOOJgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13)
 by SJ5PPF7CF5FEA5F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::838) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 16:17:51 +0000
Received: from MN2PR11MB4695.namprd11.prod.outlook.com
 ([fe80::80b6:ff6e:fabd:e873]) by MN2PR11MB4695.namprd11.prod.outlook.com
 ([fe80::80b6:ff6e:fabd:e873%3]) with mapi id 15.21.0270.015; Mon, 10 Aug 2026
 16:17:51 +0000
From: "Navuduri, Venkata Adhitya" <Venkata.Navuduri@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        Venkata Navduri
	<vnavudur@oak-lpgbuild12.wrs.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [PATCH] cve-exclusion: set status for CVE-2023-3640
Thread-Topic: [PATCH] cve-exclusion: set status for CVE-2023-3640
Thread-Index: AQHdJcXIBIQskWPsykGDJGfpPGzfP7aSXSeAgAUe4QA=
Date: Mon, 10 Aug 2026 16:17:51 +0000
Message-ID: <cb9553f1-4a80-476a-a261-31812f1b61ef@windriver.com>
References: <20260806170452.1411788-1-vnavudur@oak-lpgbuild12.wrs.com>
 <96bda687997ea3315101939f266b402138a931b7.camel@pbarker.dev>
In-Reply-To: <96bda687997ea3315101939f266b402138a931b7.camel@pbarker.dev>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4695:EE_|SJ5PPF7CF5FEA5F:EE_
x-ms-office365-filtering-correlation-id: 5c8db2a8-0edf-400c-6f55-08def6faed41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|13003099007|38070700021|4143699003|11063799006|56012099006|10067099003|8096899003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 VIjDMD40SZzbm2cZBgyzSZkov6Dp/4+PCe1e+45ZjkR/yVksYP1bY4QUHMecisxd1e1PhtRPOOBewpNktds+zvePOdiHGUL2pMM6GFZHTFFI+xIzRq+8hFwpHEINM24pUt348Tdcs66QyAZOzfn5BFsS8h5m9ysRS0NKSJ5P/Gesk8nLXhNBjNW3Hm1jCKiSthJDYzv4dnSQrpAoBwmQ0PVqtcoTcjrSBL4/3ZFCn7xoF3UETGoxG8vihXAVv5yIIpFOs3TwBfTep24wStTGDO/ycT81xtmrc0DplFRJl1YiFnBNJfoP7ToHqucdTpQ9ZjMaPou4D+14fK3HPWC3cu7yfIyckSV9hL+RRHfARe1CyvU6JVx+vaKWFQLVWmoHAGcxMTbkCx6Lc73ge2laZZN58YRIvDneGDQx7Qkg9tb+GqHkbG1oJJmO08LjmwZkr5XyjFUe1PspdJdGwgDzmy39Tj7MfujlGNv8jrMxHmiKK137aubMimpqx3B2b4hI89LjbugsYOzpac45TjJE9rw9f0u4fQp2ngG/wpG1C7ENpsDlJkmVRkLfc1oC5qGeWRck1Ek2UVh3M4N6ldQgOsj8kiSyXbJmZnc5455C4LV9OEyR+2JSSLx71iKMD1SczeuvVshD0IaodHvwEU4veQxJu68YsfKTg06p0W40BHNZZJoyRv+zbVUnysjACAiCOc7ZxhvhlRlqtl/yWJ8T212tPXuD1fSAtBtx0+qg0sY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4695.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(13003099007)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(8096899003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TldES1pield2Ulk3cjVrRTNOSHg1MSs0dEY2cVdUQXFqL2szdkFXeFJjSjVa?=
 =?utf-8?B?RkVETGFUY1FJUTZlUjBydjVOQjlrQi8rV1NBN3lMWVJkcnNXZ01vcHdyU0hp?=
 =?utf-8?B?TVJhME9hQnFXUmdwSVkyeEFiVzFYNGgvd0pKVGE1YmV0T09FZWxVZFZpMjl1?=
 =?utf-8?B?MW1nZGxKUEd3R3hCOTU3MW5BNXpRMlZJOVV6a1FYcEV1VTlSbU5Ha2NKRENW?=
 =?utf-8?B?bldwYTNvZ1RhQmJ6elBSbDZFSC94cGtCb0tWMnBKS3pnV0tTY2JONXFFb3Ur?=
 =?utf-8?B?bzVwRTVJV1g5MHM3MVF1QUNBdGZkSGx1Z2NkRTlRR0djTDhsNWYrdnJtVVQ5?=
 =?utf-8?B?VEVtaitLOVViVHRqc0tyOStFN2o2UUsvRytVbGdUK3B4OWIweU1SRHE1WjF4?=
 =?utf-8?B?a2R6TlFrWU13bjNMcEt4MEpaQ0FBcERGZjBBMU9uOUQvUEhGcHl4dC9BcG4v?=
 =?utf-8?B?WWF3QzEzVERIa1p6Y0ljNEE0c1lrbTdDZ29HN0pyQzd0VUtUeVVGVlByNjB5?=
 =?utf-8?B?V1dKSVdqa1RBSzhXbGlCWUdiNFRWMC9UbUtZZm01WHBNV2hRR3A1czlMQjd1?=
 =?utf-8?B?ZkF2a0dnVXdpM0xocmZmUGpKQnVxTFdEdjFudUFhVHpzdGdUb0ZGQ25OM1Er?=
 =?utf-8?B?RFJYbmJYdVY2ZlU0Sm1xNkpkelFLYWtpak1YbTJzMkRuOUtNc0hFU3VZWmVh?=
 =?utf-8?B?RlN4emkxVnlsMk9uQ3JtbmN3QlhPODQ1LzU3bW9kczNxL1JPaDFjTC8zcFdJ?=
 =?utf-8?B?QWJmZFVTWUtld2JzM2IrRHFtL0M5TnMxc3ZDNWVaSFZLV2FyYnJNV2plMTV3?=
 =?utf-8?B?RkNkbmc4aWt4NVZEUzJCUTlEVGFrVDFPYUlUNnpPckZESlFKM0V4ZFhUNmlq?=
 =?utf-8?B?S2dlNm03cDJRNXVnZFkzSXpsVCtUaEcydnY2ay9mbFFDY3o5VnJKQ2tobVpH?=
 =?utf-8?B?TEtQdXJ3T3ZsVGFERStsaE1WcGlEd0lGQnlTWVZFZy85VWprd2pKVUpod0c5?=
 =?utf-8?B?dFl5TkRYdU1PWmdWQjVnbnlFeXp3aVBZYjVTTnlQRHRpVEJvb0x0ZjQzRGRC?=
 =?utf-8?B?eEdWdXlUaHE0ZEZkYVVMYUhJd2M1bGd0VEs0Rjc5V25YeHErOFpmUmxmY2ZP?=
 =?utf-8?B?S3E2R3NsYzBNQ1E1c3ozNk9MTW1SK2kwLzRrdElmQUNSKzdJbXBKUGYxaEZ0?=
 =?utf-8?B?dUlWZ0JiTEJPN0JXKzRVcWRwYU51UjF3YStBakluMjBMOVA2U2VZanBxemZW?=
 =?utf-8?B?Q3ZCa21KZGttQ0RFaDBtNXFjZTYrcnVCS0k0aUtGRVF1dUlNTklSNlRaL0Jt?=
 =?utf-8?B?SHFMcnZUWUVxSXo0ZWxheEZCUEgxY1Q1dERLb3dFZTRvdWNVT1d5N3NlTjBi?=
 =?utf-8?B?V2RUUE4rUFJTUjN2KzR5b0hGTllPOHdnbTBLNjAxSERZZjVtQk1NdUFKeWRB?=
 =?utf-8?B?a1ZwOENuSHpFcURGRkFjSmlEc2N1N3h5MVVJY0hGZFFseFR6Wkdrem43Undw?=
 =?utf-8?B?NGJYdjFzQ044allMNXRsMlZQTGFQQjdqNkdya2IvKzNDa2RHOWMyS3d6b2d0?=
 =?utf-8?B?aW5kL3lmMXZqNFdSOVI0NTZoY0FNUmxYSDJmcWhNNFAwbjBuMTFZQ013eG5i?=
 =?utf-8?B?WlUzdk1YdTNUMkJJK2QrMTNVUUlPSFdBTzJHTTZtbFNwblA2YmpIWmRGTVhO?=
 =?utf-8?B?ZDJxZzBacGJUZGh0YkN4alBDaWVIY2Q4OFNiNlc4Q0ZTclJWNFZHWFhQMW5m?=
 =?utf-8?B?ZGI4Vml2eENpdnlUUWd3V2RZL1hnUUFZMFNLeTlMM01IbmV3dXJlWVRqV1pj?=
 =?utf-8?B?MTFEMUhyVFRyMHRKWnVNVk84RXg0NkVqQVhjTHdZS3ZVSVhldURsU2xOcmxS?=
 =?utf-8?B?WWFnMG9lRVpMYitReFFZUkQydHBxd21QYjVDS1h5M3hpc202RmRXWWMzZ25a?=
 =?utf-8?B?emYzMEVYK2VCemVQNFFyOGMyeWYrNmdkNVN5OG1qUW9IQjNHbjVqQng2bVVw?=
 =?utf-8?B?MmgvUXhKQStINmxyTktodjlNUmdqdnJNZkVLbElDbVJnT1oyeFJpenBFc0Jh?=
 =?utf-8?B?Mm9jSEQxMGxUa1FFeGQxZlIwL1QxZVZiRllwelpVL0FqQ1g5STVtaXpQRHIx?=
 =?utf-8?B?UTFObHZ1ZlNjZHp5allLYnIwS1dEQ0FuVmlSVGZEaU5aWVlRemRQcWJXcXRp?=
 =?utf-8?B?QVN6cjZBMGQvVW1kNnM1cmFwdU0rc0dlWksrcW02MlVabWVhVFBjUXF5MUlN?=
 =?utf-8?B?azlOYmNVOENtcjcyNkNFTHE4Nno1RzFWRDZFaWNwWk1ubklRVUxhVFNYSHNy?=
 =?utf-8?B?Y0hDSWlZWGpFdWJNU0hCMmVON2lmLzB1S04rc0htcnRTaHJGNGtxdmRZRWNh?=
 =?utf-8?Q?1LRyp4KwPCMDOSN3guSrLBIEsRb0YzAJ69LphmGpFAkxJ?=
x-ms-exchange-antispam-messagedata-1: 
 hyaa/JQ24Jhm42JNRoMGd2mA/2U6B8ZIMFUKp3jp+GGsIf5E4+/KHltO
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fnIjjZTgh6WvDnImHupiRicg28v5XbDT2xUtTtycWohxsluXZTPvJgGYSmIVNNo7dfGuiK5vffC9ouhmXg6supPDxC/IoBpaJdQETTVecSlVIEh3HBorbTXIvf90g5UqsQU1B01qmZpc7Rwbkfkp2zHJ/NNKUO/iH7UL87kJGCs9NohxM6qknyi0nmLEb4jHarGlQWCWS5NZY338OEOScEtmLVfDOmv9dHxXex84Y5JNN/t+5VVT+O0VeH4zBNT9Hj7PL0Uh8+K0qJkb83YR6uN9Dt+qzCcbEcGkFcQI5LeePfTt/J5enNE2sXYEbf8FB7PQqGHP1z0S1HoL6dfHIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8db2a8-0edf-400c-6f55-08def6faed41
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 16:17:51.5516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+N6EDadbA9u6nr6GozIwZ8NqKHMqoRjIeXeqwVAy9knHfe3gsOurXLfQFQyrLGxY6iubbgaOD5TzLgTrOib8EoMcjxBOuNg/KH/N+SfXRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7CF5FEA5F
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzOSBTYWx0ZWRfX9xBSP8Z8GQV/
 T6jmkQgyV0dqCuDPqBAiUPq3pjDdnsco2Q1YzO9kupj6lx8OGPQ2Q2K6gqc0dkW9XTsbbCsBvGD
 ICyHmgnCb/MxWA6YXdxlRlu0+jOUqn5Lzl9xoappnVWgc+Csmi9Q
X-Proofpoint-GUID: Ha-FfTg-rTaMhN3iJSGD0wamaiqibqxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzOSBTYWx0ZWRfXwVnZr9pFGZBE
 dWm37aqfhsMymed3jXlbIztt0FT0FsbVypb8QyeQs48l7m0iZJ4Ba1wMkvMyHMJ4J+fCKONSJoS
 AiHn/jHX6UCBtIBT6lgyUJfAxeXWk7pLu+VIATxgLQseCeahYjp7dz0jf7ox+18H5G0d1eCbgty
 odZLMmRIK3yQwwECWm99cGFV9+Xwa7aQ9qWJaKLAlFEuIbZiASZk3RTISx8BWLgOmMgA6k8h9XB
 d6VxP84vI52TWNIlbxzeWFy7JzJLjti/bun3IY5hz08v69AZTfcjYVrqMOXe483eif7irLSzbq3
 7YVqS1sD7MX1jy5nFIp+fMBF7qEAkghP5U77Wi85t3+dqj6ZIIBc/v2Pq6MCK42PQzxzJUmFgXq
 G1hX+AXwYoWyJj8jPtsRyWGGcG6MnIkAE6C8YP7C3RURX1VvGnL7UC4WZSFst4xmcVWfstkcGBL
 duheKaWU/ZRvj8MNxew==
X-Authority-Analysis: v=2.4 cv=ZZEt8MVA c=1 sm=1 tr=0 ts=6a79f9b3 cx=c_pps
 a=3zFA2TB6y+4Z7TVRdmCe4w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=20KFwNOVAAAA:8 a=BZ99uTNJPQa7Zx1IoF0A:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=EkX4TQMSMt75w7BRZq8A:9
 a=O31KnfvRQUXvdUu7:21 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hC07s4tH4VcRYEL9x6FF4ngFdgxRdAGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100139
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_cb9553f14a80476aa26131812f1b61efwindrivercom_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243143

--_000_cb9553f14a80476aa26131812f1b61efwindrivercom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gOC83LzI2IDA2OjA2LCBQYXVsIEJhcmtlciB3cm90ZToNCg0KT24gVGh1LCAyMDI2LTA4LTA2
IGF0IDE3OjA0ICswMDAwLCBWZW5rYXRhIE5hdmR1cmkgd3JvdGU6DQoNCg0KRnJvbTogTmF2dWR1
cmkgVmVua2F0YSBBZGhpdHlhIDxWZW5rYXRhLk5hdnVkdXJpQHdpbmRyaXZlci5jb20+PG1haWx0
bzpWZW5rYXRhLk5hdnVkdXJpQHdpbmRyaXZlci5jb20+DQoNClRoZSB4ODYgY3B1X2VudHJ5X2Fy
ZWEgS0FTTFIgYnlwYXNzIChDVkUtMjAyMy0zNjQwKSB3YXMgZml4ZWQgaW4NCnY2LjItcmMxIGJ5
IGNvbW1pdCA5N2UzZDI2YjVlNWYgKCJ4ODYvbW06IFJhbmRvbWl6ZSBwZXItY3B1IGVudHJ5DQph
cmVhIikgZnJvbSBQZXRlciBaaWpsc3RyYS4NCg0KVGhlIGZpeCBpcyBhbHJlYWR5IHByZXNlbnQg
aW4gYWxsIFlvY3RvIHJlbGVhc2VzIHNoaXBwaW5nIGtlcm5lbCA+PTYuMi4NCg0KU2lnbmVkLW9m
Zi1ieTogTmF2dWR1cmkgVmVua2F0YSBBZGhpdHlhIDxWZW5rYXRhLk5hdnVkdXJpQHdpbmRyaXZl
ci5jb20+PG1haWx0bzpWZW5rYXRhLk5hdnVkdXJpQHdpbmRyaXZlci5jb20+DQoNCg0KSGksDQoN
CkNvbW1pdCA5N2UzZDI2YjVlNWYzNzFiM2VlMjIzZDk0ZGQxMjNlNmM0NDJiYTgwIGlzIHRoZSBm
aXggZm9yDQpDVkUtMjAyMy0wNTk3IFsxXS4NCg0KT24gTlZELCB0aGUgZGVzY3JpcHRpb24gb2Yg
Q1ZFLTIwMjMtMzY0MCBbMl0gaW5jbHVkZXM6DQoNCiAgQmFzZWQgb24gdGhlIHByZXZpb3VzIENW
RS0yMDIzLTA1OTcsIHRoZSAnUmFuZG9taXplIHBlci1jcHUgZW50cnkNCiAgYXJlYScgZmVhdHVy
ZSB3YXMgaW1wbGVtZW50ZWQgaW4gL2FyY2gveDg2L21tL2NwdV9lbnRyeV9hcmVhLmMsIHdoaWNo
DQogIHdvcmtzIHRocm91Z2ggdGhlIGluaXRfY2VhX29mZnNldHMoKSBmdW5jdGlvbiB3aGVuIEtB
U0xSIGlzIGVuYWJsZWQuDQogIEhvd2V2ZXIsIGRlc3BpdGUgdGhpcyBmZWF0dXJlLCB0aGVyZSBp
cyBzdGlsbCBhIHJpc2sgb2YgcGVyLWNwdSBlbnRyeQ0KICBhcmVhIGxlYWtzLg0KDQpTbyB0aGlz
IENWRSBhcHBlYXJzIHRvIGJlIGFib3V0IHJlbWFpbmluZyBpc3N1ZXMgYWZ0ZXIgdGhlIGZpeCBp
biB0aGF0DQpjb21taXQuDQoNClsxXTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Y3ZlLTIwMjMtMDU5Nw0KWzJdOiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9jdmUt
MjAyMy0zNjQwDQoNCkJlc3QgcmVnYXJkcywNCg0KDQoNCkhpIFBhdWwsDQoNCllvdSdyZSByaWdo
dCAtIEkgY29uZmxhdGVkIHRoZSB0d28gQ1ZFcy4gOTdlM2QyNmI1ZTVmIGFkZHJlc3NlcyBDVkUt
MjAyMy0wNTk3IChsYWNrIG9mIHJhbmRvbWl6YXRpb24pLCBub3QgQ1ZFLTIwMjMtMzY0MCAocmVz
aWR1YWwgbGVha3MgYWZ0ZXIgcmFuZG9taXphdGlvbikuDQoNCkkgd2FzIG1pc2xlZCBieSBSZWQg
SGF0J3MgYWR2aXNvcnksIHdoaWNoIHN0YXRlcyB0aGF0IHRoZWlyIENWRS0yMDIzLTA1OTcgZml4
ICJhY3R1YWxseSBwcmV2ZW50cyB0aGUgZGVzY3JpYmVkIGF0dGFjayB2ZWN0b3IgZm9yIENWRS0y
MDIzLTM2NDAgdG9vIiwgYW5kIEkgaW5jb3JyZWN0bHkgdHJlYXRlZCB0aGF0IGFzIGNvbmZpcm1h
dGlvbiBvZiBhIG1haW5saW5lIGZpeC4NCihodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NlY3Vy
aXR5L2N2ZS9jdmUtMjAyMy0zNjQwKQ0KDQpObyBtYWlubGluZSBmaXggZXhpc3RzIGZvciBDVkUt
MjAyMy0zNjQwLg0KDQpUaGUgcGF0Y2ggdjEgY2FuIGJlIGlnbm9yZWQuDQoNCg0KQmVzdCBSZWdh
cmRzLA0KQWRoaXR5YQ0K

--_000_cb9553f14a80476aa26131812f1b61efwindrivercom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F7EB12D2782AC642A8BAA55F0B20AD6B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVu
dC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9oZWFkPg0KPGJv
ZHk+DQo8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDgvNy8yNiAwNjowNiwgUGF1bCBC
YXJrZXIgd3JvdGU6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJt
aWQ6OTZiZGE2ODc5OTdlYTMzMTUxMDE5MzlmMjY2YjQwMjEzOGE5MzFiNy5jYW1lbEBwYmFya2Vy
LmRldiI+DQo8cHJlIHdyYXA9IiIgY2xhc3M9Im1vei1xdW90ZS1wcmUiPk9uIFRodSwgMjAyNi0w
OC0wNiBhdCAxNzowNCArMDAwMCwgVmVua2F0YSBOYXZkdXJpIHdyb3RlOg0KPC9wcmU+DQo8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIj4NCjxwcmUgd3JhcD0iIiBjbGFzcz0ibW96LXF1b3RlLXByZSI+
RnJvbTogTmF2dWR1cmkgVmVua2F0YSBBZGhpdHlhIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpWZW5rYXRhLk5hdnVkdXJpQHdpbmRyaXZlci5jb20iPiZsdDtW
ZW5rYXRhLk5hdnVkdXJpQHdpbmRyaXZlci5jb20mZ3Q7PC9hPg0KDQpUaGUgeDg2IGNwdV9lbnRy
eV9hcmVhIEtBU0xSIGJ5cGFzcyAoQ1ZFLTIwMjMtMzY0MCkgd2FzIGZpeGVkIGluDQp2Ni4yLXJj
MSBieSBjb21taXQgOTdlM2QyNmI1ZTVmICgmcXVvdDt4ODYvbW06IFJhbmRvbWl6ZSBwZXItY3B1
IGVudHJ5DQphcmVhJnF1b3Q7KSBmcm9tIFBldGVyIFppamxzdHJhLg0KDQpUaGUgZml4IGlzIGFs
cmVhZHkgcHJlc2VudCBpbiBhbGwgWW9jdG8gcmVsZWFzZXMgc2hpcHBpbmcga2VybmVsICZndDs9
Ni4yLg0KDQpTaWduZWQtb2ZmLWJ5OiBOYXZ1ZHVyaSBWZW5rYXRhIEFkaGl0eWEgPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlZlbmthdGEuTmF2dWR1cmlAd2lu
ZHJpdmVyLmNvbSI+Jmx0O1ZlbmthdGEuTmF2dWR1cmlAd2luZHJpdmVyLmNvbSZndDs8L2E+DQo8
L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxwcmUgd3JhcD0iIiBjbGFzcz0ibW96LXF1b3RlLXByZSI+
SGksDQoNCkNvbW1pdCA5N2UzZDI2YjVlNWYzNzFiM2VlMjIzZDk0ZGQxMjNlNmM0NDJiYTgwIGlz
IHRoZSBmaXggZm9yDQpDVkUtMjAyMy0wNTk3IFsxXS4NCg0KT24gTlZELCB0aGUgZGVzY3JpcHRp
b24gb2YgQ1ZFLTIwMjMtMzY0MCBbMl0gaW5jbHVkZXM6DQoNCiAgQmFzZWQgb24gdGhlIHByZXZp
b3VzIENWRS0yMDIzLTA1OTcsIHRoZSAnUmFuZG9taXplIHBlci1jcHUgZW50cnkNCiAgYXJlYScg
ZmVhdHVyZSB3YXMgaW1wbGVtZW50ZWQgaW4gL2FyY2gveDg2L21tL2NwdV9lbnRyeV9hcmVhLmMs
IHdoaWNoDQogIHdvcmtzIHRocm91Z2ggdGhlIGluaXRfY2VhX29mZnNldHMoKSBmdW5jdGlvbiB3
aGVuIEtBU0xSIGlzIGVuYWJsZWQuDQogIEhvd2V2ZXIsIGRlc3BpdGUgdGhpcyBmZWF0dXJlLCB0
aGVyZSBpcyBzdGlsbCBhIHJpc2sgb2YgcGVyLWNwdSBlbnRyeQ0KICBhcmVhIGxlYWtzLg0KDQpT
byB0aGlzIENWRSBhcHBlYXJzIHRvIGJlIGFib3V0IHJlbWFpbmluZyBpc3N1ZXMgYWZ0ZXIgdGhl
IGZpeCBpbiB0aGF0DQpjb21taXQuDQoNClsxXTogPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVl
dGV4dCIgaHJlZj0iaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvY3ZlLTIwMjMtMDU5
NyI+aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvY3ZlLTIwMjMtMDU5NzwvYT4NClsy
XTogPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9udmQubmlz
dC5nb3YvdnVsbi9kZXRhaWwvY3ZlLTIwMjMtMzY0MCI+aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVs
bi9kZXRhaWwvY3ZlLTIwMjMtMzY0MDwvYT4NCg0KQmVzdCByZWdhcmRzLA0KDQo8L3ByZT4NCjwv
YmxvY2txdW90ZT4NCjxwPkhpIFBhdWwsPC9wPg0KPHA+WW91J3JlIHJpZ2h0IC0gSSBjb25mbGF0
ZWQgdGhlIHR3byBDVkVzLiA5N2UzZDI2YjVlNWYgYWRkcmVzc2VzIENWRS0yMDIzLTA1OTcgKGxh
Y2sgb2YgcmFuZG9taXphdGlvbiksIG5vdCBDVkUtMjAyMy0zNjQwIChyZXNpZHVhbCZuYnNwO2xl
YWtzIGFmdGVyIHJhbmRvbWl6YXRpb24pLjwvcD4NCjxwPkkgd2FzIG1pc2xlZCBieSBSZWQgSGF0
J3MgYWR2aXNvcnksIHdoaWNoIHN0YXRlcyB0aGF0IHRoZWlyIENWRS0yMDIzLTA1OTcgZml4ICZx
dW90O2FjdHVhbGx5IHByZXZlbnRzIHRoZSBkZXNjcmliZWQgYXR0YWNrIHZlY3RvciBmb3IgQ1ZF
LTIwMjMtMzY0MCB0b28mcXVvdDssIGFuZCBJIGluY29ycmVjdGx5IHRyZWF0ZWQgdGhhdCBhcyZu
YnNwO2NvbmZpcm1hdGlvbiBvZiBhIG1haW5saW5lIGZpeC4mbmJzcDs8YnI+DQooPGEgY2xhc3M9
Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9hY2Nlc3MucmVkaGF0LmNvbS9z
ZWN1cml0eS9jdmUvY3ZlLTIwMjMtMzY0MCI+aHR0cHM6Ly9hY2Nlc3MucmVkaGF0LmNvbS9zZWN1
cml0eS9jdmUvY3ZlLTIwMjMtMzY0MDwvYT4pPC9wPg0KPHA+Tm8gbWFpbmxpbmUgZml4IGV4aXN0
cyBmb3IgQ1ZFLTIwMjMtMzY0MC48L3A+DQo8cD5UaGUgcGF0Y2ggdjEgY2FuIGJlIGlnbm9yZWQu
Jm5ic3A7PC9wPg0KPHA+PGJyPg0KPC9wPg0KPHA+QmVzdCBSZWdhcmRzLDxicj4NCkFkaGl0eWE8
L3A+DQo8ZGl2IGlkPSJhdC1tZW50aW9uLWRyb3Bkb3duIiBjbGFzcz0iYXQtbWVudGlvbi1kcm9w
ZG93biIgc3R5bGU9ImRpc3BsYXk6IG5vbmU7IiBjb250ZW50ZWRpdGFibGU9ImZhbHNlIj4NCjwv
ZGl2Pg0KPGRpdiBpZD0iYXQtbWVudGlvbi1kcm9wZG93biIgY2xhc3M9ImF0LW1lbnRpb24tZHJv
cGRvd24iIHN0eWxlPSJkaXNwbGF5OiBub25lOyIgY29udGVudGVkaXRhYmxlPSJmYWxzZSI+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_cb9553f14a80476aa26131812f1b61efwindrivercom_--

