Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633F9C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:45:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2980.1753148740792929906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9298947c17=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M002AN2993159
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:45:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu86ce-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:45:39 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56M1jdfl3167396;
	Tue, 22 Jul 2025 01:45:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu86cc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 01:45:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb7Ae5PixFp2teAL0vzmQHPt/E7DEg1Sb4+ZanAWxtJranhkEXfWDWZxKCO0H3jHnB79qZ6vY1J3yKxl3utx/UGiWVphn7OsBkZnJ7mYDDfoZuxO6yN1VSEIB5PAJgcnsJPaHuKEJBn5eTMmZ+l3Ihv19iOWqaZr62Wc/BmZRHSsDPwUJLfbcQ/2a3/xrm8SsOnVeYz6tD2p7MpQH0QhT4y3Do1gmUH+szw5PEW+2uhHHzvgygzpn7axESlCxcCxQx4V0Gf55QZrKdcAekhjriIPSRHt7nLNpqTa9K1WRAL8qnllb2FqD7VMi/HAxV2/OP23Td2hODzFYYjC++zh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E581WfPsZ9s4+eChOtK0B866lMmhd0GRyidxObpAFCU=;
 b=F6WIxFZ/B/4md+Mmg4bOzGI8QiRO+cnb+7kL5LUVwjGhAnmIfaxJEde/Svy9GFbZ+N8rxpPhGZMoMz3KkXIwPj871kgSkC9/1mlIDuI1zns1aNAhvKhwiEhUKESXEvVBlhV235TazZCjI2o6+z9MXf6QYg7nFXC+IN+ADh449L0tiY9NKH+WQ0Vux0GWSm/VfJk++QekbgSlvU1AtEIP4Hd6x7bBnEHRM2B/6+FtBsJYTsSnz0mjCwRkukQFHdQMcWwpFd2bSHHo9YjQddEFXHp68FCs1ouM/uKne/zVjgtInVBsdVU8mAlnBmiD9XoPjf0nYqXAu83PLrQGNqRwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 01:45:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 01:45:11 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] systemd: remove 'serial-getty-generator'
 PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] systemd: remove 'serial-getty-generator'
 PACKAGECONFIG
Thread-Index: AQHb9fzDjMqiWJXlgEqBT4k22RDqbrQ8m9QAgADLU2A=
Date: Tue, 22 Jul 2025 01:45:11 +0000
Message-ID: 
 <CO6PR11MB5602DEF462652D0EF4C8161AED5CA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250716025258.738590-1-Qi.Chen@windriver.com>
 <B4A15273-226F-4688-8BF3-71E1956F4949@arm.com>
In-Reply-To: <B4A15273-226F-4688-8BF3-71E1956F4949@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=28afca71-c40b-4529-9649-379baa804d85;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-22T01:40:12Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA1PR11MB8350:EE_
x-ms-office365-filtering-correlation-id: 924d88ee-17cf-467c-779d-08ddc8c1659f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RWM5V2gwcytIYjNReER1TGdaSVJ5YmRDWFhjallxdlQxSW5RRFFQNmZ4c2RE?=
 =?utf-8?B?RkdHaUJhS2tBRXFDTVI5NklyUHBKbVhqSElMWUdPS3QzNk10ZHd1dUJLZTBW?=
 =?utf-8?B?U3NEcVM3Y2Z5Wm5wZVZRSi83OHMzM2VERnVzdkRSTXlpQ2VlYS93S0J4ajB2?=
 =?utf-8?B?UVRKMVErT0dYR24xRUtXSlE5a3hRWURtQk9aS1o3aDdIOTFRbklYMXVLVWcz?=
 =?utf-8?B?MjVhVnV2VktjNUhjTlVvT1J4dXZwWERrNkFpNThMZUdqcER6VkRCbm0xWXQx?=
 =?utf-8?B?NndlRzR0Y3BIdTlCMFZIdzRTcGxqNEpqdVFXemtKbEdPcWVSYnczTEVXSE9Y?=
 =?utf-8?B?R3QzSWF6VW0vTjJPR2VCQnFCdktOZWFUNFFoZk1kUXJLYWxHNXkwcDlLb2JF?=
 =?utf-8?B?cXFnSkZqc1ZDVXBSVDJrWkZ4QkV6dUJSSnBMMFpPUlUzRG5VSVpNUFdXaldJ?=
 =?utf-8?B?ZGF6c3AyN3pzNW5nYXVjdk9ncGZIVGZ1ZmZqVExYbmhhWkpDajRucHhvN1U1?=
 =?utf-8?B?amJEb3dZZFV4OFpQZWV1M0t2QllPQjB1c3JrdU5sQ1MyZVg5NG5ScGc0Sk4r?=
 =?utf-8?B?emRUMUsySkFCcUVTMkNZdnRJeHlPN2haL1dLZHh0VkFkcUF3S1RhRHF6Z1FP?=
 =?utf-8?B?dndtNWl6OVpBNjlrNEhiakJ5UTRIa1V6ejBEOVNxSzEwdThNWm5lb01GYXda?=
 =?utf-8?B?SUZ4dERQbU5vNzJWK0FOYnlFanNmSnJ6VEFNUllFbkhUd0U0cnBZUDYvbzF0?=
 =?utf-8?B?Y0tSOStXWGFYOG5OUXBHL1JiMy9nVk84SEFkTEtwdUlZekhmNFAzRm1rY1lN?=
 =?utf-8?B?b3piVFRTclJXc0lNLzZMakdIMURmUzFPYzhBSkxsbm9qNmd3ZElvcGtUbERi?=
 =?utf-8?B?cFhyTVNJZWszY3RNa1dWdUxYQ21EQ1cxMEtucnYvN1lsc294VXAxTUw3Skhj?=
 =?utf-8?B?dHZTS2tJaTcxam5HV2tKaWNEbUVkczZiTjdmZnBPcnFxS1UvM3h4TWJqZEhI?=
 =?utf-8?B?TmFPMmdRT29hRlBZRm5LVktncHR0NEFXVDBHZ2N4NkhWSzhzTW01TmdEeExY?=
 =?utf-8?B?R2VwR1JDblVyL1VQN3NBUTR5Y29uQ3Vka2FtK1pISFp1MThueDVPaEsyTzQ1?=
 =?utf-8?B?SFp0bHZESDVDNDVESk9XVzhxT1JYbnNSR1lvc0M2dVdqd3N6Ky9ZcUhncGhQ?=
 =?utf-8?B?M2FwVWtZWWtpclNJZmdDNklGQVpxSDlXWHFhb1FNL1d4bGM0KzhlbUZCbjhU?=
 =?utf-8?B?Y1dKSWp6Q01IQnhkSWdBSnFjZy9RblZoSUxUVjlNUEIvL1hlUFRObkZ5ZGVK?=
 =?utf-8?B?K0dRSHVkcUVWU3VLMGVSaHl3OC9YRVdwMTVSdUJwNmI1dURSL1NSZ3JJdDZF?=
 =?utf-8?B?YTdtZFpjVFVjZkt0YncyOWQvNGdwand3WW0valFXRXpqelJOZk0xdXQzQS90?=
 =?utf-8?B?cVR4MmNoWW9QVUZySi9kS3dqUm91Mkl1RUl2SHVvS3h2OXUxSnZUd0p0WllX?=
 =?utf-8?B?WXJXY0RaQ2k3Ym5lOUZwNGVjUFJpM1U2U0tuc25CUXF4aktZRkFzQkI4WWJK?=
 =?utf-8?B?SE1iNERGUW8vd3RXSW5yS3l5VXMrc0lRMm9kek1WTDVKZngza0xHdjFHdG05?=
 =?utf-8?B?TUxZT1plT1JEMmRwbVFJYnZuUlVpWU81SEhDeWxibWk2aWN1QnhpRWd3cEo0?=
 =?utf-8?B?alVOYTdWQmdyYkpBZDF3YkpSTkRBUmRTWjBYWmpaRXI3UGJnR2pFQjNOQTdL?=
 =?utf-8?B?b3hlUGs2NEJNalJWbUdWdVUxdzEyUG9BVXl6MTkwVDkzYnJ4TjlaUko2YzZM?=
 =?utf-8?B?MzNPR3ZFbVdHY3RlWXduTHNGYlQvQld0UnF2UFg3Ty9DeXk0R2FJVXY5VlBn?=
 =?utf-8?B?ZnlqYWRHSDZVNlRjVW9WZktta0FhR2VLTU51MkFxKzN1d3ExRGlQSVZsTkh0?=
 =?utf-8?B?RE5yN2lmU0JybFFMbEhVWi95U1dWaXZsSEpTMlRLSFZQUVEvTFJQWFZxMitU?=
 =?utf-8?B?ZEp3d2hGV3pRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q25STGM1ODJKeWFZQnNjakd3Si9GMElUc1hhR0pNaGpWU1g2Q210NGdtNmlp?=
 =?utf-8?B?cXgxQXpoVjFVT3dIS3k1SVRVcVdPYWpLVm12WDF5VDVqc3hjR2ZIeUp1U1F4?=
 =?utf-8?B?NG9ja2xIOS84VUdVNGk0MlE5bXcvcEhDYjNuNTVVQWVFcGM4ZWFSWWpIcWRO?=
 =?utf-8?B?a2MwT2xCNGVXUVBpbmxjNnRqRDRZOVoydmQvNGpPQkJpb2NrNENhTWFPbzVR?=
 =?utf-8?B?MTMzTWdUOW00em4wNGtGam1raDlJRFBmNzBxdDJmK29GRkM2dDd5a2VrK2da?=
 =?utf-8?B?VUpnTEJXM0ZscnA1SDE4aExjOVNRbDZONERlOWx2Um1yQXdIZmlXSVkrOW11?=
 =?utf-8?B?RTlYUGkycytlL2x6dGlVRk9JZTU2ZGxZQlZPUmFTeE9LaXJsM0VUTWI1eWha?=
 =?utf-8?B?b1FQd0VJZkJQck9uS002aGM4NHhXUGNuVXJqVE1rUUxQRndObUVHUUdDRDNN?=
 =?utf-8?B?dVpTZVJVQzJQMWpJVFNaaGxUWnZOeDVPemIvY0NSYXZLWWxzRUUremVSdjV0?=
 =?utf-8?B?Y0pRT0lyaWwyWGdJQTVZcHV3ZXczRXhRUjA3RnBUZDRmTnE4QUNNbys2Wlp1?=
 =?utf-8?B?YVBPZUoyZEgwVkc2S2VXWS8yVnBFOWwzcHk2M21BdVhvZ2V2RmdpMmlMSDlG?=
 =?utf-8?B?dTg5SnVTcjdjYUVUNDVRUmJPVmN4Zy8zbUgwTnZqN1M1aDc5Mi9pS2dEbTRU?=
 =?utf-8?B?MCtyMGd4aWJFTnpxRlZwUFdpdE5TWU9ISzhTcGwrMDB4ZXA1NWM5SThWS1NE?=
 =?utf-8?B?ck1GMGNmcTBIeHp4UjBCWkgrZWJ4N3IzNEdkbEVwbkF3NTNMN1oxV2Mvc3N1?=
 =?utf-8?B?cmM1empsdlQvZ1FCN0JHc3FZUHMzNU9BTWJJSC9XbWhnYndWUGFWUldIaUdX?=
 =?utf-8?B?K0VVcnBOOUoyR2lRZWpLY0cxTlkvT0JybDlwL0MyYVFtdGU4WGF3WERSUXJn?=
 =?utf-8?B?YVlMczZuWTQzZmRscUZjYzNVaUFqNDNPZ0lUL003THpwVkpLTjFlMlEyeElv?=
 =?utf-8?B?UE13Q0UvQWd5V0orWVdDRFJOdVlFYzZhZGlHUGlJQ2REOFJMUlQ2ZmdCUk9D?=
 =?utf-8?B?Y2ZvY2ZEVG1zZXNVZHBpZU5jQXBIYzJnam5tbzYrZWxhQlEzQVcyOE5waWpB?=
 =?utf-8?B?dWV0bzRGcmJSSHVLSWVJNkduV2M0ckpweE5tYm5XaEo1Z0lmSHJDTDlhVDBR?=
 =?utf-8?B?RjdMTFFMVTNvTWZSK2lZSnZPUVdwV0pXN0wydXVPeEZYSUFJQXNqUlk1TVE4?=
 =?utf-8?B?WUNHcWdCa3Btcmt1aHZYcjVkc3hBWDI1RThaRnNMN1poNU5OUGpVekJTSDI3?=
 =?utf-8?B?c3ZYL3E4V1dnenVtbVZPUmVlWkhhSmtlRFY5VjBHNDd4dGRJVFQwUkxId3Zr?=
 =?utf-8?B?M0QyWEFFb1BsNUhFZGZoazdpT2xnRjIxYzRpTVZYTjd2b0FSQThURzJaSHZz?=
 =?utf-8?B?MEV4Vit3OS9RdC9vT1pXaTEzdGZMUklkcllIenFBUmV2OGRtRUwxUkNXeEEw?=
 =?utf-8?B?L1BiVHhTSGxZVi9iY1JmNTNVMFhEVmttL1VWejVxOHIvKzVuUUowSXc2blp3?=
 =?utf-8?B?VC9nTmJnMzhJbzVEWDVyZ1o1OWV6NTFreFBvcDJlZGkzYWE0UjZyY0tXSlV0?=
 =?utf-8?B?b2V6MFNqdFFJalU1TEZUZ2FDMGFYb1lidTJJRmdreUFQYysvSDhZSHJHMzJH?=
 =?utf-8?B?WE5DSlQ3WUsyVmJGb1VaSE10MlkrekNnTWo1eVRnYzhrbzhLY2R0ZjRYbVln?=
 =?utf-8?B?NzNOSzk2Q2dOalNmd3lNdEczWm55NjNCL2Jqb3FHTWFsb09QUHhWY0huckNr?=
 =?utf-8?B?L2VreWtGcWw2RURUSFoyNUdzMFoxUmhSZ2tjRnUwYmlONHljSE4rWENVTERG?=
 =?utf-8?B?Z1J4c3dPOVJSeXBtQVB2Slh4NVNmMDE3ZUtNbkFLQlJuT0ZORnRndm5wMG5Q?=
 =?utf-8?B?RnRQN0svQkFvdmh4RVZnMGU0RXNlQmxKSjZzc3YvWnU2cHhNS0FxbkUyZGlk?=
 =?utf-8?B?VUI0QXZ6YW5nSXhOVVI0dHl5VEJjWER4UU11QlRUQmtrcFgvY05jakluQVFN?=
 =?utf-8?B?ZElNUklWT2VOS0Rrd1ZtYTQ2N1pNVHdLOUwrLzFqakRCaUhDcmVEeGNidXBu?=
 =?utf-8?Q?sj9A+yEe0JxeuDBeWQK0hYOKX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d88ee-17cf-467c-779d-08ddc8c1659f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 01:45:11.5061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GVemjcI1KfRBsNmfPhLq3Cw/fdl77XlG++9bPsUHj44i0B5Jtet0V2ByU/fXQ/9Uf5JW4GMwAta/HH6+GrHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-Proofpoint-GUID: HxIbLb4byxdMLQ0bJpsJLHftVOhIw1Qu
X-Proofpoint-ORIG-GUID: Ga1mI-qwUowbGN-EPiehm2YKhFwmuDD0
X-Authority-Analysis: v=2.4 cv=AbqxH2XG c=1 sm=1 tr=0 ts=687eed43 cx=c_pps
 a=gvNdZeZLI4sMnB7r/Qo1Rw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7CQSdrXTAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=9JKC8sTnbbmlfcilWFYA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAxMSBTYWx0ZWRfXyMkH5HoOG22U
 64PChTW6NMDbz++mOY7xO0DOBzn0//AKTpUQxRUA9oddUV01saeR6DFwsP5J3rFdu0vu788aiC6
 SnGSY/FJtwc3Iaha6JXQLCVUNcxCcNqp56DK0/Vxrwfcw3/ndWbGxnKNhnZxK76yFKozIqj7F9P
 uHbjMdqDRaVbf4V9f2p+GK21a80WdS4ijrbjA+s9GDJzZwjegO2UoWIB1gonN9Zs3kD0RSGPc+I
 s3OojoPD6YUk717bTM9B5MjGcvV1j9QlXMh32hR8sHW57dQv500ue5ElrC4KhTidbrOfYYJ5oNg
 NGUruj5s5e7kigLGLgc6QIV47yVIYrISICgU7qLKpt5uOc0G8AJclMCF2D04aOZkaOe9POrwRu1
 nsIuYjnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220716

SSBqdXN0IGRvbid0IHRoaW5rIGFueW9uZSB3aWxsIGV2ZXIgZGlzYWJsZSB0aGlzIFBBQ0tBR0VD
T05GSUcuIEJlY2F1c2UgZGlzYWJsaW5nIGl0IGRvZXMgbm90IGhhdmUgYW55IGJlbmVmaXQuIFNv
IEkgc2VudCBvdXQgcGF0Y2ggdG8gY2xlYW4gdGhpbmdzIHVwLg0KDQpCdXQgaWYgeW91IHRoaW5r
IGRpc2FibGluZyBpdCBoYXMgc29tZSBiZW5lZml0LCBsZXQncyBrZWVwIGl0LiBJJ20gT0sgd2l0
aCBpdC4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gDQpTZW50OiBNb25kYXksIEp1bHkg
MjEsIDIwMjUgOTozMiBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQpD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6
IFtPRS1jb3JlXVtQQVRDSF0gc3lzdGVtZDogcmVtb3ZlICdzZXJpYWwtZ2V0dHktZ2VuZXJhdG9y
JyBQQUNLQUdFQ09ORklHDQoNCkhpIENoZW4sDQoNCk9uIDE2IEp1bCAyMDI1LCBhdCAwMzo1Miwg
Q2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8UWkuQ2hlbj13aW5kcml2ZXIuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBUaGlzIFBBQ0tBR0VDT05GSUcncyBu
ZXQgZWZmZWN0IGlzIHRvIGRlbGV0ZSBzeXN0ZW1kLWdldHR5LWdlbmVyYXRvciANCj4gd2hlbiBu
b3QgZW5hYmxlZC4gQnV0IGRlbGV0aW5nIHN5c3RlbWQtZ2V0dHktZ2VuZXJhdG9yIHJlYWxseSBk
b2VzIG5vdCANCj4gaGF2ZSBhbnkgYmVuZWZpdC4gSGVyZSBhcmUgdGhlIHJlYXNvbnM6DQo+IDEp
IFRoZSB1bml0cyBpbnN0YWxsZWQgYnkgc3lzdGVtZC1zZXJpYWxnZXR0eS5iYiBoYXZlIGhpZ2hl
ciBwcmlvcml0eSB0aGFuDQo+ICAgdGhlIGdlbmVyYXRlZCBvbmUuIEJlY2F1c2UgLi4uL2dlbmVy
YXRvci8gZGlyZWN0b3J5IGhhcyBsb3dlciBwcmlvcml0eQ0KPiAgIHRoYW4gdGhlIHN5c3RlbSBh
ZG1pbiBkaXJlY3RvcnkgL2V0Yy4gU2VlIFsyXSBmb3IgbW9yZSBkZXRhaWxzLg0KPiAyKSBUaGUg
Z2VuZXJhdG9yIGNvdWxkIGJlIGRpc2FibGVkIHZpYSBrZXJuZWwgY29tbWFuZCBsaW5lICJzeXN0
ZW1kLmdldHR5X2F1dG89Ii4NCj4gICBTZWUgWzFdIGZvciBtb3JlIGRldGFpbHMuDQoNCllvdSBs
ZWZ0IG91dCB0aGUg4oCcd2h54oCdLCBhbmQgYWZ0ZXIgYWxsIG9mIHRoZSBkcmFtYSBhcm91bmQg
Z2V0dHkgdW5pdHMgbGFzdCByZWxlYXNlIEnigJltIHZlcnkgY2F1dGlvdXMgYWJvdXQgY2hhbmdl
cyBoZXJlLg0KDQpJIHRoaW5rIEkgcHJlZmVyIGhhdmluZyBhbiBleHBsaWNpdCDigJx0aGUgZ2V0
dHkgZ2VuZXJhdG9yIGlzIG5vdCBpbnN0YWxsZWTigJ0gb3ZlciB0aGUgdXNlciBoYXZpbmcgdG8g
Y29uZmlndXJlIGtlcm5lbCBjb21tYW5kIGxpbmUgYXJndW1lbnRzIHRvIG5vdCBkaXNhYmxlIHRo
ZSBnZW5lcmF0b3IuDQoNClJvc3MNCg==

