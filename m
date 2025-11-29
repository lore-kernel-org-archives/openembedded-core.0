Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CBFD116EA
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 03:43:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9118.1764387805752181181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 19:43:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MJq0UqOW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3avVr2701724
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 03:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t+13Ma/Op6qx7p/WKoIMJVGv0GGwt/s2EwzlIBd29L4=; b=
	MJq0UqOWBWJS44FqvYVkTPUjWQ+MUFvJrj2TnXeHzMpuEiLVlcUaauzN45c702gE
	mGp1oasv2cF/rJaSLpsHrMk1KPalS+quLZHQwvwkpgS7olTKvkbiYDq+XZSD2NIB
	2uNXKxIFCY/2xTJCcecDw7EdbSJdT8zMBLxeOVxhJElZqmZcotsafZv32g/4z1x8
	4lP2zxnxVmF/gHB/eC1IZxS3/XcsOfreSZofg6bcuJ2682mLKnbcL8vetmeoNx5B
	lhg9mrQFaHFgMmJjgjoGcqouGRjgw5ZsF4+YCd8vUFnf9YpA44rVeDwWU/3lbrDg
	Ib300nvQyZnf7pvnxEITfw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21r3aa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Nov 2025 03:43:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr4lqbeO1yfIpm+Y+xEaQ0oXl6XUs1zfKveTE8IFrWj91L93CGIsxf94A7M+eens7hpvE0IJUlznugnga8eGHEvMcvUFAQzrtP2yeVvViR4eMjf5eJ7fvRQbFANcO6BUdB4xyGkNCTKKyMoEz3IrXAnLrhFgxyLZmMwuhyAmSm9FW/vI+jnrwH93wupXkSpPWzp+XP2Tn3Sh0wYxkPSXkBuyRbeMyEYghi8FXndN3zhDIaxadBW7OKW4kNC1E/i9ULul4vVZnxPxCOMe/jf8riZ/YhyhmqsLFD5zqeUBExP23LljpzFSWBlX2XfcRTgIeZDVhM/l8Vb35GvtgCjmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+13Ma/Op6qx7p/WKoIMJVGv0GGwt/s2EwzlIBd29L4=;
 b=g8W+tGUV6rUNNmISAjP6m12ZtTmkfVOzGqj8AUD/FFxBX+VxcZ3tGyplQtVPEQvyq193Ye60vRhbxjiQ6MeYtXqxeLw81Md9fuQkNC4cOa38IHVACMy8lcz6jXdfgX2DiB09T1sghJmWVaYWbvoODSfSFEX0AQwype/259r3xv8nfNzi9DLcWz8SCfV1CiJDnyanEchvrxaX1451rlqEFLm6NuejGsk4mDO4PCUnk1wE5d03sfWAhiNNwOM072LC8t8lMYWgebw/Je7brqp/ZGfB+fS7WiSXSFWi1H3I+sQN2uBYsRYUUgJ5rC2ncdfzXl7qhE6IpavB12WdS2Y5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ5PPF0F15BC42D.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::80e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Sat, 29 Nov
 2025 03:43:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 03:43:21 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH] rootfs-postcommands.bbclass: fix adding 'no
 password' banner
Thread-Topic: [OE-core][PATCH] rootfs-postcommands.bbclass: fix adding 'no
 password' banner
Thread-Index: AQHcYHDcD/ukEwzieUWwfCMeZbjjZLUJACHA
Date: Sat, 29 Nov 2025 03:43:21 +0000
Message-ID: 
 <CO6PR11MB56020A23F1FE26218B8BE05EEDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251128091606.3465381-1-Qi.Chen@windriver.com>
 <CANNYZj98Wvbc6dnt6cKT59VyBB7XtO+ywj4XzB2zJH0KzgLEzg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj98Wvbc6dnt6cKT59VyBB7XtO+ywj4XzB2zJH0KzgLEzg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=1f922a46-eff1-444f-b140-693dd92a2ca1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-29T03:30:27Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ5PPF0F15BC42D:EE_
x-ms-office365-filtering-correlation-id: 42094ff2-9cc4-49f2-c359-08de2ef9713a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RjFJcW5xOTdseFF0U2E5bitlWG9ibGpOL3d4Y0dpN2RKWlRiZGpCamlNSW85?=
 =?utf-8?B?RTdDbFZQdG40SE0yanNHMUg4NmdoK0lpUmdMaHRLclQ1cDljUXI2TWVUQ3Mv?=
 =?utf-8?B?MlpGYWV3NmdRR2RtM1VuOXNFeWtYZTVGdjZXd0xYL1FRNC95c2FMK1dSY1Ba?=
 =?utf-8?B?bU1BeFJJL3lVYXdHNFVHZVhCbkVIQjdKOXJHOFRBTTFtNTJ1RWxLSk82QjlH?=
 =?utf-8?B?Z25La1JQTGc0MVJQMUdZZE5hc1dFVGNVcDN2YTJpUk9zbXY1Q3FsL1Y5R0ll?=
 =?utf-8?B?RTBaR240T1JHTFU3OVZhOUt6S1VxRW5hWjlZdWtOb2NKVGtwM0gvNDN3Q0kz?=
 =?utf-8?B?ZVdrcWxyT2tDSFRLS096N0doRWJYTm10d0lQajhUY0IzS0YrUnY4aVhSaCs4?=
 =?utf-8?B?NVlZRkdFV28rQUFQaGtzb0lEMDVyWUp1djgxQi9kUzhUS254UGtDU2R2ZUhX?=
 =?utf-8?B?VldiMCtkN1pOelpvV0FQL2pJTHIrQ0lvRVAyVHhkWHVRaXcySmRhN1pWNk1T?=
 =?utf-8?B?UzV0OWt5LzRVcHJUSG1vZHM1blhKTzg3SG14ZkY4SjdzWURRR3JVQ1ZYWTN1?=
 =?utf-8?B?ZzZCMGc4eFpLVkQ0STFEUmtjTW5QSlVOcXJQMlRVdjRDYk9pNCs1MlV1Mmhz?=
 =?utf-8?B?YkNIa0RrTUMrL1pnUTFrbWk1MklQdFExZFhwaFkxTzZoZzJZQi9YcmVJQWFP?=
 =?utf-8?B?NUltMWgreGNtT2w0VkF4dG02MFVZclVadzczZ2o0TEtCcnQ5L1dEaWMzdGZ3?=
 =?utf-8?B?WitCbEZPeFVGOGd3d1NBZEtKWEw1SUc0b29NeGd0cjd0UFlRZTY4Z0NBMlBy?=
 =?utf-8?B?UXY2Y1dVZkF1MitRb0Y3TUZCanl1eXRGS2U2MjRQZzh3WjFMUHNuaHlHK1Y2?=
 =?utf-8?B?R2UzVVFmOU92ekNPMGRKSHBLSmJoR0lnVmw2VjJxOTlCUXEwNG02UnV0cnZj?=
 =?utf-8?B?a3RLazF6UU54RkRTWHRaZ0xoT3ZtVVFhSTJNMzlJajU1T0c5RWpJekR2V20v?=
 =?utf-8?B?Mk0xM0o5dHI1QlRac0RtUGJqMjFvMXY1cGF4andDVUd4UXd6a05qYWc2SmRU?=
 =?utf-8?B?eGt4U0VKNThia0N3R1Z0U1RPQW1hdlpGVHlqa3U0bEkyNEEzc1l5QTNaQ3My?=
 =?utf-8?B?U2pYdXhTRStYRktWNXFGaXFHSVFaNU1VN3ErVVVrNTVaUjhpVWQrTjZrOWtR?=
 =?utf-8?B?OFNCN2h0YlJHUjJLb0YySUVVZTk0SDVrc3RNOWg2WGVhUW9ZUEVuYzFzWXQ1?=
 =?utf-8?B?cmFXU1F5WlR6L2tPM0krSnNUUUd3eUU1MlM2Smc0aTVyeTJvQVNJTEIweHk1?=
 =?utf-8?B?RnRVUFRvRzVXNXYvNWJ5Q2VKczVHUWhQOFF6R2NucnNJMzNVbHBCck85alV3?=
 =?utf-8?B?NE0wRTV6eXpRN0dlVzB4TjlwaEc2QlJKMnNsNWNmVis4ZnV1YmtvcXE3TjhL?=
 =?utf-8?B?N1RtQit2a0FWZE1xVEYycmVIOFBZem5WYmZXS2Y1QVdQRFMxRnREOWNrcmNa?=
 =?utf-8?B?MTJkUmRNSnFDai9wZ2NEdW5GbHB4RUd3dXZ2SFYzKy81ZGQ4MTF3Z2dwOExv?=
 =?utf-8?B?bGJyMVFXVXdWM1RxU01HZlRld2ZRcFpERER3Sm1QanNYeWI4MjQySGJKcjBX?=
 =?utf-8?B?QXJoOFZtV3lEb0FuVnNyOHRmY1Blc0ZPbDZHWEtYVHhzZDZqNU9hc1N0STZr?=
 =?utf-8?B?eXJBeklLOXRuVDNzWCtlOUllTTh3M3ZXS2FwMnVaMEd0cGNqODFEZFdWSGJF?=
 =?utf-8?B?VUxvTzRXaXRLYjZhV3NBVEV3ZWhHeEIzd1JzSzBMR1RYU2QyZ3h3MGkzMENr?=
 =?utf-8?B?Z05ENzA2Yjg5Skl5dTNCY1A4VytQajM2ZjRkRWFqN3J1ZUZkL04vR0hrbVEz?=
 =?utf-8?B?dmR3d2w2MVpMeHAzQ3RMdTBGeHBPUDduT1F1RjZxYWxnZTZ6VVVxb2V5aEhw?=
 =?utf-8?B?U0thUGhQTVlISmpRSjVYVHpMWW9GeFIxY0ZWeGtNTCtjdURiTDZyRUY2U05D?=
 =?utf-8?B?b3o1cm8rS29ZUmJOT1ZPNHoyYlQyRjI4QVhPa3lCY1lXd1FlTk9DRFRwcDNo?=
 =?utf-8?Q?e5Urk6?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmJVYzdmYWhqeGNtcEF2UFNXN2pBaXBENW5FM2J6cEtCb0RDK2JwSFQrclBs?=
 =?utf-8?B?YWFzV2QyamYyUSs3NDJ1OXdEY3hnbkE2b0dzWWZWM21CeVNENGdtMUFUQ0tI?=
 =?utf-8?B?c25wQlcrd1dzUUNHeHNrRTJmenFHNmdjZUpxS1d2WGJ1cEJGYityQjdDUmtq?=
 =?utf-8?B?b0J3UTRJK3d1eDdOcEdCVFhVdWdaSllTMVU1WURSeVBCK2NKWW9BMVdyNEtH?=
 =?utf-8?B?V1M0Y2hiamNlaVFTNGNtTVdPSUZsZ3dOK1VZb0lsejc3d2JhUHVVV0ZoemdZ?=
 =?utf-8?B?bjdLaGpmaWVOWWx1eUhWalVNeUJuWG55SFBDdFJiOVNNaXNldURJc1A3RXps?=
 =?utf-8?B?WHVHa3JZQXIvSmRBK3NrOHBBazBWTWxHbS81b1FxbitpUFAxSjZMTkt5d2hX?=
 =?utf-8?B?K3lSWFFpUWxyd2tUU24xQkpNendJa2p1dkd4YU1zRndHaUZ3enZFRnc0Nndn?=
 =?utf-8?B?cjRVVzdPUUtSVHBScU1HSCtVelBPSkxTWXpiR0JXRTdDeUw2cnhic3l1bld4?=
 =?utf-8?B?QTZNelEydHJMc0lhS0ZtMnpZNngrSGVvQmZEcTRKK3FmaERrNUs1MENlL1o5?=
 =?utf-8?B?TmwzNmFGZklUVTh6eXFGM2NrRFpWU0EzQkdqa2JuekRZTnFPN3VlcUZZcE44?=
 =?utf-8?B?ZnA2M1JWNHJIeTZyN0J5K3BEc2hlKzkvYi9sa3c4MVlTSDFudXkyZGVuT1Rj?=
 =?utf-8?B?ckd3dTVQbWlEVXUvYWpTS1dzMVEzd3NSdGN0RnBmN25yR25sU2R4K0VsMjI4?=
 =?utf-8?B?bkFoeFJ0ZExmN3NSTHVrUmdGR1hqMVV5MHBPMncyY09mR2hrenVrdytXWGgw?=
 =?utf-8?B?RzdBNS9TZGU1Qnd2Z3NlR2ttdFNoOWpkUFN6QUhmNUhncTBNUTllQmM2c2p6?=
 =?utf-8?B?NEszY2xKM1ZuREdlUGwwbE9lQ25FbmcwckNTRFNvVGZKMldFNG9LVkx4SFg4?=
 =?utf-8?B?SmtOamZ5MmR2TUtvemxhand3K24reDNnL0I3N3VyNng4UWZNRXpRSXFNSTdU?=
 =?utf-8?B?L1duMnRKSHNRcmFKQnF2ejBTYTFMaUVSYVRGdng4VFJNUTlnb29xL2tGOFRC?=
 =?utf-8?B?T3ZTdFlzak5GWkNzZ2E0RmJYSlpYUUVNQTFmWGo5MjQ4azVoQkp5S01xcjFZ?=
 =?utf-8?B?Wmc4YkdqTFNWdGg2UlhkaGxTQW1tMGIrelBzVkxyc1NNYS9vMnlERmtlcTQv?=
 =?utf-8?B?aWNrN2IxVlliTXEwYlNzOHdwOThJZDlwbjJDZERrTjIySTFaOEVxZ0xXRDZu?=
 =?utf-8?B?N1I2Y3FhNXhPZ2xtRkpTWWRaSm4yWjc4T2g2dzdzNk1sVUZaVXNrUys5RTVR?=
 =?utf-8?B?VCtBTCtqY3g0L1Q0UTIzd3B5WDg0Q2YwUTlKb1JlL2Rybys3eVBiZGpOR1Np?=
 =?utf-8?B?ZE1zZXNYdHd5cEc5eTRjRlN1eFZBblM1TnBERzJFVTMyN0ptNnE3UVRzdjVZ?=
 =?utf-8?B?VzdralExR2Qwamg5MlREdlJaOXVIT1RFWUhMUjgweStOVzNQc0hlWEljeEdI?=
 =?utf-8?B?RWhQeDJLU2xNYXlnQlZacVJ0U3IxcjZrMVB0aDdCR0VVeXkrbUI1UUlhZ0xT?=
 =?utf-8?B?VFA3Ny9wS2N2Rk1lWnBMOXpsaWpDOUI5dTl5U3ZhUWw4SG4xTW1zTVFCOUMz?=
 =?utf-8?B?UmtBbXNwUmtlckZLS2hoaW5TS0FWQndKeHVuY004MTYwOEtVWVZOOFVnUVFv?=
 =?utf-8?B?SVkvUWRUTTI5clQ3QTRpWDZNSlp3Q0tNVWZFNnNPZWJZTWZlK3VxMEd3bS9E?=
 =?utf-8?B?eWhLV3FwUHhMVEU3QjNCVWRsbm9PcUxsRWtQUFF4c1BtcEF5Y240TnZMRlBa?=
 =?utf-8?B?WkxzWnRoTzdCUkhYRVR0aW5VZTY4TU1OMkd5bExhbXBEbThYOWdDWnBad291?=
 =?utf-8?B?VkdUZjAwQUVzazIrdnYvYlIrSldBWlBkUWNnRkdZWjM4a21wcm5Gb3VkazF3?=
 =?utf-8?B?K0ZQdGRJTjRwY2lBNVBRUWNkUzZ2ZnpObmhRdkxvSlNvdnVyaG9VVTNLcVJa?=
 =?utf-8?B?dVo5NkRuUTJhY0hBamVJbmxiWkpkWGJrTlZjMVV5bEJaMXA3SkZZQVZ0MXZM?=
 =?utf-8?B?aW5BNFVKMkNpeStNNXMwUTl4SW9JeFRhNk5PYkxrYUFSZW5vYlZ3WHp5UU9N?=
 =?utf-8?Q?V6XbfZvYda9x9/SlpzOwMPBRs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42094ff2-9cc4-49f2-c359-08de2ef9713a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 03:43:21.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9aaXgChtMUh1zPqwe0EFWNxay62FSSFo14ggFD/fdFh2VAGm9sYFXAOQCQTqLh/sGYvSgpMAfG+IXB+6ooKPrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0F15BC42D
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ILMw-mrZbKViOHru9Cnf3HPx1gpnfy_O
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692a6bdc cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=LDXqaFFI47Iy5-tFYDAA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyNiBTYWx0ZWRfX9otNSoh6b3HN
 DJPO+Y3A8IecG4jBjP6PjkMl5LxF9hd5duM0yNyhU82oGK+3w9k8loi8RTIVrv/C6pa3znDfK8L
 L+Hc0kUyaCK0WI+IPhiwod0amGxqQMncmfoGDOjM9jtgCeZDZRAFYUfeS7yB5I97vH3aVqdCZ7d
 B37MmldsrU5QMXblXAES1r+x4gt/Lf0ZIkFTvTOvzxpSSEsk+PUtFGoETrT9TrRhmcRB35c8Nrm
 W0ZVVnVMMrUXxY7mzd5+0AD5rJkKlA5muhkFNrlh80rCGoDJM9nnxsfV/IJyH1zTrJVevzDBhap
 0gjawaUFP7t78b+ohIQurtG1j3GO6WR/g0uPU6z9/mhkJI0BUHbqs+JMGpyGEvK5jHTPDnGpROV
 if8EQWlR0QcCwsZpoB4qb6OMwMYIgA==
X-Proofpoint-ORIG-GUID: DiSTt0YLbSwqT-_EaxAnBijJdfBHGt06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 03:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226923

SGkgQWxleCwNCg0KQWxsb3dpbmcgJ2VtcHR5LXJvb3QtcGFzc3dvcmQnIGltYWdlIGZlYXR1cmUg
KyBzZXR0aW5nL2V4cGlyaW5nIHJvb3QgcGFzc3dvcmQgaGFzIGJlZW4gd29ya2luZyBmb3IgdGhl
IHBhc3QgMTArIHllYXJzLiBXZSBzaG91bGQgc3RpbGwgYWxsb3cgaXQuIEluIGZhY3QsIHdlIGRv
Lg0KDQpCZWxvdyBpcyBhbiBleGFtcGxlOg0KSW4gY29uZi90b29sY2ZnLmNmZzoNCk9FX0ZSQUdN
RU5UUyArPSAiZGlzdHJvL3Bva3kgY29yZS95b2N0by9yb290LWxvZ2luLXdpdGgtZW1wdHktcGFz
c3dvcmQNCkluIGxvY2FsLmNvbmY6DQpJTkhFUklUICs9ICJleHRyYXVzZXJzIg0KRVhUUkFfVVNF
UlNfUEFSQU1TICs9ICIgcGFzc3dkLWV4cGlyZSByb290OyINCg0KVGhlIHByb2JsZW0gaXMgdGhh
dCB0aGUgYmFubmVyIGlzIG1pc2xlYWRpbmcgd2hlbiByb290IGhhcyBhIHBhc3N3b3JkIG9yIGlz
IHNldCB0byBleHBpcmUuDQoNClRoZSBzb2x1dGlvbiBvZiAncmVmdXNpbmcgdG8gc2V0IGEgcGFz
c3dvcmQgZm9yIHJvb3QnIHdpbGwgc2VuZCB1cCBhcyBzcGVjaWFsIGNhc2VzIGluIHVzZXJhZGRf
YmFzZS5iYmNsYXNzLiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYW4gYXBwcm9wcmlhdGUgc29sdXRp
b24uIEFuZCB3aXRoIGRvaW5nIHRoaXMsIHdlJ3JlIGJyZWFraW5nIGNvbXBhdGliaWxpdHkgd2hl
biB1bm5lY2Vzc2FyeS4gDQoNClRoZSBmdW5jdGlvbnMgbmVlZHMgdG8gcnVuICphZnRlciogc2V0
X3VzZXJfZ3JvdXAgYmVjYXVzZSB0aGlzIGlzIHdoZXJlIHRoZSByb290IHBhc3N3b3JkIGlzIHNl
dCBvciBzZXQgdG8gZXhwaXJlLiBUaGUgY2hlY2sgaXMgdmFsaWQgb25seSBhZnRlciB0aGF0Lg0K
DQpJJ2xsIHNlcGFyYXRlIHRoZSAnXG4nIGNoYW5nZSBhbmQgc2VuZCBvdXQgVjIuDQoNClJlZ2Fy
ZHMsDQpRaQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIE5vdmVtYmVy
IDI4LCAyMDI1IDEwOjExIFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
CkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBhbGV4QGxpbnV0
cm9uaXguZGUNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHJvb3Rmcy1wb3N0Y29tbWFu
ZHMuYmJjbGFzczogZml4IGFkZGluZyAnbm8gcGFzc3dvcmQnIGJhbm5lcg0KDQpPbiBGcmksIDI4
IE5vdiAyMDI1IGF0IDEwOjE2LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxR
aS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IEl0
J3MgcG9zc2libGUgdGhhdCB1c2VycyB1c2UgRVhUUkFfVVNFUlNfUEFSQU1TIHRvIHNldCBwYXNz
d29yZCBmb3IgDQo+IHJvb3Qgb3IgZXhwbGljaXRseSBleHBpcmUgcm9vdCBwYXNzd29yZC4gU28g
d2UgbmVlZCB0byBjaGVjayB0aGVzZSB0d28gDQo+IGNhc2VzIHRvIGVuc3VyZSB0aGUgJ25vIHBh
c3N3b3JkJyBiYW5uZXIgaXMgbm90IG1pc2xlYWRpbmcuDQoNCldhaXQuIFRoZSBjaGVjayBpcyBm
b3IgdGhlICdlbXB0eS1yb290LXBhc3N3b3JkJyBJTUFHRV9GRUFUVVJFLCBzbyBpcyB5b3VyIHNl
dHVwIGhhdmluZyB0aGF0IGZlYXR1cmUgZW5hYmxlZCwgYW5kIHRoZW4gc2V0dGluZyBhIHJvb3Qg
cGFzc3dvcmQgc29tZXdoZXJlIGVsc2UgYW55d2F5Pw0KDQpJJ2Qgc2F5IHRoZSBjb3JyZWN0IHRo
aW5nIHRvIGRvIGlzIHRvIHJlZnVzZSB0byBzZXQgYSBwYXNzd29yZCBpZiB0aGUgZmVhdHVyZSBp
cyBlbmFibGVkLiBDYW4geW91IHNob3cgd2hlcmUgYW5kIGhvdyBpdCBpcyBkb25lPw0KDQo+IFdl
IG5lZWQgdG8gZW5zdXJlIHRoYXQgdGhlIGZ1bmN0aW9uIHJ1bnMgYWZ0ZXIgc2V0X3VzZXJfZ3Jv
dXAgZnVuY3Rpb24gDQo+IGZyb20gZXh0cmF1c2Vycy5iYmNsYXNzLiBTbyBjaGFuZ2UgdG8gdXNl
IDphcHBlbmQuDQoNCldoeT8gV2hhdCBkb2VzIHRoZSBmdW5jdGlvbiBkbywgYW5kIHdoeSB0aGlz
IG5lZWRzIHRvIHJ1biBhZnRlcj8NCg0KPiBCZXNpZGVzIHRoZSBhYm92ZSBjaGVjaywgdGhlICdc
bicgYXQgdGhlIGVuZCBvZiB0aGUgYmFubmVyIGlzIGFsc28gDQo+IHJlbW92ZWQuIFRoZSAnXG4n
IGluIC9ldGMvaXNzdWUgbWVhbnMgaG9zdG5hbWUgaW5zdGVhZCBvZiBuZXcgbGluZS4NCg0KUGxl
YXNlIGRvIG5vdCBidW5kbGUgdGhlIHVucmVsYXRlZCBjaGFuZ2VzLCB0aGV5IHNob3VsZCBiZSBh
bGwgc2VwYXJhdGUgY29tbWl0cy4NCg0KQWxleA0K

