Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00253E83043
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 02:21:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7825.1770085301949138998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 18:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BSSAYODn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64947f4648=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612NB3aK4115634
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 02:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/Wfp6R24NVeuYfFQMFiYugp64D/PHN6USlNtL9Qnffo=; b=
	BSSAYODnlJXXPvBPzJsm4PBBUabDlI0aRjFZtrjjzNHTh65zg/WOMelTYCJg2Jtw
	cKW81rs/STBbVcOxh1FPsNPiDLnHQ5d0J51TliHQYRTXCrtvYUziQRpb/binB6TC
	o5HVHyBM/uO9wSK4pusz1fMaGJi+CIGr6qMZg8ziqpCXqPF+lS37pMI0czKuKbnT
	hUg67PAT22S9U5OHoON0UqvvNsEiXpTS2pe4j6LrShXOuPeSq1HhaLUEHN6XV1Mo
	fJ33eN55BgDGJBJe7GxUfXbNEZAgli+lVYcP0P0R+m9TCsbzydHIw/Nzu9TDEyi4
	O+9fVHblv9Kga3v+s7andA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c188jtsa3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 02:21:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CubVaW4qeWhawmn907Cs1ziWVc7tAZaJb5KmVqbxSOmPv1vrEdFgPRaHQ6k3X5/9JVzQLMdXa6sUR7UQWR7ra1/tKG/HGnxaYxp488578xLPdMoDgU/WjrzDgt4IZQRMs3KTjrJIHFKKgZLvPwr8VKyZvG4rRPsnUpMYZa+kKZbxPTUN2SLAVezsm8IAx1jnc6zI7A/4yhLAC5SnVdmVdCy6iad+wfkKEa2A+lwmCF/s3mSgDtAmqPcDDGHw5aKjk5pxULPYGZQ5oUsC0y5rrlNNLN/fMgAB2/Z4XRDXIQRivEx9yEj22f9SEueoy5ioPTrYZwSh2xP4bSjuWuo1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Wfp6R24NVeuYfFQMFiYugp64D/PHN6USlNtL9Qnffo=;
 b=HLhZv4kaHtXlsXx43Xt/r1wUu00bYyvFBpvyKRbeglaoNgvFjeJYS3cHUvWIWiKtS2X7KqKXbDHCiRXf2AnPDEXbkv36yy0I9tJgvC/n/Zbv/G0plOIrW3BRrAP3i+RDlsAiiRcF+BpvP3+Vq/KWaJBCFDLTxYzwXPKB+W9mFcbMC9LfjOAx/HDFQz9UXn/rp8gfFxKbDOHITr5mauFdHUvIA4GxKFapB/8LeeGpacrRTKHcNESbMJFrBuPKzALxKh6BUoN+NnCIB5VtDGQU3mli1NT5UeC4eiJ99xaBQAJIQ1xL7hePH9lWeoEa7CcuMqUtvYKW3JP0G20izuDWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:21:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:21:37 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] runqemu: restore support to run without
 bitbake
Thread-Topic: [OE-core][PATCH V2] runqemu: restore support to run without
 bitbake
Thread-Index: AQHckZXtatoQdQbrx0qQrakT+LkeIrVvlLyAgACuVqA=
Date: Tue, 3 Feb 2026 02:21:37 +0000
Message-ID: 
 <CO6PR11MB5602CABDD265D0F875CDCB14ED9BA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260130030601.388697-1-Qi.Chen@windriver.com>
 <CANNYZj8YOfUnv23oOyX6o=BuyX=LRQqoQaeS4osuRRoW4yiS8w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8YOfUnv23oOyX6o=BuyX=LRQqoQaeS4osuRRoW4yiS8w@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=312215b7-d331-4fd7-bb36-422d3f8f42d8;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-02-03T02:16:35Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA0PR11MB7816:EE_
x-ms-office365-filtering-correlation-id: 5f11023f-c3cb-4d6d-e43e-08de62caf572
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Rm9VWEhDK3JaellVZWdCZFJYM2J3a1BWU05LUDBVZ3F0bmgxNWpLSTRkdnNK?=
 =?utf-8?B?N0FTa1U5dzQ1OFdxM3B3OVJWYUpTMG94UmE3KzZ2K3Z1ck9Bc28vLzRtb1lC?=
 =?utf-8?B?VjJJeFRKRlpicVNWRk96OXNqTExhZXZwbndkdUt3dktkd3ZOdTJkWVE0aTlu?=
 =?utf-8?B?YmRmemVJQ2pIT1NWKzhRWnV4VW4vTVJFcWZCbGFaRlZLMVZ3QnhrUW9HaXFD?=
 =?utf-8?B?VjRUTnlGTCszN0JiL01TNGc2SVJXWmpCVkdQS2ZPTDU5dHBXMnZ4MnhVVGFl?=
 =?utf-8?B?ZVVKTDhKSk1GazFzMGRBMmVOaTJXanlKQzRBNkxNR1VtTFJDdC9xR2c0anov?=
 =?utf-8?B?bUozcXdoeFNZampoZUR4SjhIUnVBTXBscC9PdGdYYlRpMEJ5TUVVSjQvZ3J4?=
 =?utf-8?B?SGRnR3lLdENVamJQNWJVQitlUEpkNE9DKytKMndQakR6bzhybCtDTFhrU1Iv?=
 =?utf-8?B?ZkZILzBFQnpLc3JUYjh1aTZwSy9pUm1PRjV0NFdsZk1vek0vd0VMMThyT1dL?=
 =?utf-8?B?d0RvcE5hUEw4Y1hmVWtENDAwVHZVS0hMQjJESXgwRndsSUY4ZFltOGpObmZX?=
 =?utf-8?B?NGsrSXV4K1lmYXBoTG95Y0doNXBEcUZWemwyQ3RPWFphSm02dGliKzlIa0R6?=
 =?utf-8?B?K3d4dEFQSWpjOThQci9WSXltQTlpM2xmT01xQ2JzOG1YNE5KeE5jelo0T2Y3?=
 =?utf-8?B?NHI4bk9lWTEwU0gvaDVzQmkrcGdzNGhCUmtjSXlkTGdhaDZCdkdiUXBMMXVW?=
 =?utf-8?B?dms1WkFuQk1pTjc3bzljMThiVjB3UDNrbHlLZXBkL1kxc2FuY3g5QVloY0d0?=
 =?utf-8?B?TEh6UnZkQ0FHeGFuR1JQalZ1OFJPS0oxNkNLaEN6M1JSSWI1V1N3OUhQNnVw?=
 =?utf-8?B?aHBFK2NRbXNEeXdHWFJoTE9HdHRiVEFITjIvcWdvNDA3NEYxKytFYWhkVG9n?=
 =?utf-8?B?RjlXa2t2WDB2cG1LL0NHSnBmbysrdFBET1ErUGpKaDBlRE5QRDIvbXhrQW5u?=
 =?utf-8?B?dm9aUFB1R2JPSk1yVnlqVEtUcm96YzZVZU9VeXVsR3Q4U2h6THNqa1FGMFFm?=
 =?utf-8?B?c3lzMDZGV05JUmlCRVlCVUNlQWxKWVNPU0pvZ283dzUreVpVK3RnSFo0ellG?=
 =?utf-8?B?WEJLWnVTbGt1K0Z4WjI4QkRLUmlLSnR3RUs2N1hhMWUycFZkaitieFhGT3Z5?=
 =?utf-8?B?YTVkY3BDWEpoRWxxUExFSXdTTXExMnNVWmJ5ZDhHU3R2ODNyVlg3Y2IrQTJC?=
 =?utf-8?B?czRkVjcrZmZneFhiZG1mbWtHck5oTkl5ZUVRZWF5eTFDYlgrQTZQaTcya0RH?=
 =?utf-8?B?cHNwWlZjdUczWmUrOEh5QU16QXJCNUpvWS9lYVVVUzlsTVhXTHVPN1pYNjli?=
 =?utf-8?B?WVFScGNjN1Y2TGQzK1BVVklpQmdkVk1WRldnTWpEYkEyTFNTU2VISm4wTHpB?=
 =?utf-8?B?Tm9qeVloTzJyMXUzbmlTYkJXaTNrM01MbTdsaXErL1NadXVyeXNVbzkzWFVq?=
 =?utf-8?B?eDNNZkhSd01SSnRBd0pwbEttR2lJa01XRlY1ZGVkWG5nYkZ3TGRHbEdhdWVU?=
 =?utf-8?B?WTl0bDlKaWtvUEN6Q3FrNEh1ZlhJbnBPK1F3eGdCVjF5c3o0UzRmYVVlQWV3?=
 =?utf-8?B?bUxlSGtFNlVBU2ZRZkVESVFHYjRoOW54MERXT1ozYXdoS0lKYnp3SSt6elhh?=
 =?utf-8?B?NmlrdVB4dWRQS29PQzc1V3VkQTNwQW41clNreXNNb05rWGRtNDFkWDJWVTBu?=
 =?utf-8?B?dExUaEtwRXlQekNLVkxLOHlibmlmRUE4UnZVMGZqK2FpeXlpeDdaTG54Uy96?=
 =?utf-8?B?MjZoSjdPSXo1YVBzano0U294VWNQM2wrdm4xL1oxbGRSQm5va01jVDJYaGUw?=
 =?utf-8?B?L1BleFc0eXpLVTdxNnkvL2xMdUl4YXVqU3hmdEJYckQ3TVFycWY4NGx0ZVpl?=
 =?utf-8?B?cEtpUUtXNldqeWtZbC9CVmlKVHVhYmxyOUhBTmVFOHgwZkxnVVRIM1I2ZmF1?=
 =?utf-8?B?N3lRMW9sVkRDUUdGODd2ZWF5elZEaTlscDVKUWxQRWxtd0VSZVc4cldDQWtJ?=
 =?utf-8?B?ZGZoa09KK0RodldjcVc5VDZqa3g3TlZ6RkdBMm1lZ0hFa2lySTlNZzcxdGdX?=
 =?utf-8?B?VU9xdmI3czFHV1NFZ1FzcWxERzkzUHVOc0ZEZzdsZU8rSVJkUUhaQ0lBL0xK?=
 =?utf-8?Q?Os2L49M7pHkgpOeNR6bwQ/g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NEVNZzM1aU1HVW80YXVPWVN3NmVydHVSYzdFaGZBVUJwbzIzczB2dkNrSWhi?=
 =?utf-8?B?WHAyRVY2Qm9nYllIU2tLdFNJZjg3OGI2VmZFN2FObjlvQ2tXclFpclNVZkVG?=
 =?utf-8?B?d0J1NDI0NXVDalJ2TldBbFpWNVRkaHJPb3dvS0NVNXRxYllYcHY4UmZTbHhM?=
 =?utf-8?B?T2ExTUYxaVBmL1FvREtTbGY2VFQvM0xhQXdBSGJCRFNuemx5bjAvMlBKdWd2?=
 =?utf-8?B?OWdPUDh2dlcrR2F2SjFoc3VWS05wQURmRVBTTEhidFptcHpoUEdUeWNEL2VH?=
 =?utf-8?B?RFVGMTk2Rzd1TzlsZWFFK0Y5VWtOMUhNYzE0MmNlY0JUOXJDelhsTmdwREJ5?=
 =?utf-8?B?eXNlVVkzUDdXcGxDZHJhUUptQU9zbGVBTGVmVTZEWE1hR3JPZHd2NjRmVkgy?=
 =?utf-8?B?Sjc3cUpSVXJydVhjZW9Qa1ArN3lwVzNCSnh1R1FpNEVVclZBMEhvd1hiMXlI?=
 =?utf-8?B?OGFjU1BDZ0prOGdLMEQraGZDeXpYR2huWnJrM2FFVW5sMVMxVFRYbU5QcEc3?=
 =?utf-8?B?R244RHkzdWo2U2NqSFB6QndHT3VVTkNUYk56dHVEK05KZWZVZE52OE5NSEI3?=
 =?utf-8?B?VFVqV2p2djh5YSsyOVdETFFZSUhmeDhxanVLWkc5Vng3VE1kL013MExkS3VU?=
 =?utf-8?B?WUhzQlZzWWcrOUxYejE5L2Z2dTY1dC93dE9YblNtZWZiQk5jQ3RnaVQzRiti?=
 =?utf-8?B?aG03V3llUDVjRnBnNWM0Q1ZsK3RSdURJSGlNZlFjR1pqOVVtUjd1U2lrZzl4?=
 =?utf-8?B?Z21GeUpkYUJpdVB3SXAzR2cxNFJ5aVV2R3pkQjZLaXFXWDkyTjBhblZjYkxy?=
 =?utf-8?B?UnhWOFpKWmwzandOKy9vUGFLaTZHemg2Z2oxajZaKzFrVXA0SmdTRGtTUWRJ?=
 =?utf-8?B?V2R6SzRtYk5iNmt3alNjQmRlUlE3VDBCM2RGM01pci92bnVNLzZ6bVRYR3Ju?=
 =?utf-8?B?OEN2MHZmbzJnS0JXSnJxVFJDY2JFUG8xY3lPai9acEY2dCtxWVRROVZ6MjlT?=
 =?utf-8?B?Vk53NlFIQmJMUExHRHNyK0JrQ3pKOTJFanBxa1NhYWVoYUVMRk1RektZZWFS?=
 =?utf-8?B?K05MWWh0NzQrT3V6K3BKcFRCSm5WM25VSFlLMDVEWitVc0VDQXdkZWhiWk9X?=
 =?utf-8?B?R0FQK0hEd3ZJcjNCL3JKaTZJc01UaUFITDRaZ0l2THFXTk1BckRjYkNETml4?=
 =?utf-8?B?Z0hUYnlrNXczb1BNaGlKQjhzdXY1UTJidHVDTlFvMzhMNksyWTJDaVJuaU1k?=
 =?utf-8?B?L24zTVk3U0lPcEhiVGR6QUZPK3prQmFRVXJSTlc0VEJmTFNaekg2OEx4d20r?=
 =?utf-8?B?cHFvU0ZnZXRjWndEZHJsM3hYWndxVnI4cFRQd2VGT2ZXSGZLeGtaS0J5N0Yr?=
 =?utf-8?B?ak9Qci9tTVVvY3lTa2VjWHJEa1BFUGdDRHNwSGdmd3ppQXhCWXQ3bHIxQ2N1?=
 =?utf-8?B?WE5nNEFBWDBKeVNNd21waE04UE0walFsdWFoaVdUenFwUGwvT3FzWHZhTUs3?=
 =?utf-8?B?UFpONnlBVWhDanJYbUFRb0tFSy83T1ZjeCtHaDRILy90YWZPVUpCQWFReENy?=
 =?utf-8?B?OERJTWNPVDY5cnV2bzU0YnBsb0ZudGtWWXVzdWNtcW5PTkViNWZZRktOQzFC?=
 =?utf-8?B?U3JnTTAxeWFDM2MvZW9uM1pKcHhwVS9hS0dZR1JCMVlRVTR5WEJmYjlvUzdZ?=
 =?utf-8?B?TDhUSHFkN1NGOFc5cGNaRzZzbU5lWWIyNE9wdG1hNGhTeTJVRlpndXVUbm9p?=
 =?utf-8?B?M09lUlQ2aHo2dEFFRUYvVk9xYTJBWFpvbklYeEhaTHdFV2JyeTRJR1dPNG1t?=
 =?utf-8?B?eDBtdEFJMGxpOHNmVjg2a1pKWkt6QmN1dFR5NUExd3Vub3VVY1BPRElYWW15?=
 =?utf-8?B?YTl0RDZ3Y3pIam5WSUFDZ25mRTdWWm9naXFyczZRQkRhelQwL0h5SmVnVytY?=
 =?utf-8?B?NGs0dWhOdTcyYXlaQTNobjNkUFRtNVZsQmJsV3ZmU3lNanZXcEhVVFVDbUV5?=
 =?utf-8?B?WElIQXhFaW5uelJvYXgrMzZENnM4T1kvemFqWmpURWVSUDFLTWdQNTdIb29z?=
 =?utf-8?B?QVhoNTN0OXNjbEx6U1hheDZaeWZYeGplak1ndnB0YkZnemk2M3NtdllFZGZO?=
 =?utf-8?B?d2UzbXkyeHFPMVJsVnd4OHI0bzE5alE2SkZvTm04ZnVUcmh1U2hJblZCYTFL?=
 =?utf-8?B?QUVsdTNncUtGMVVQUW9CVkhWbEFaQXBZMEp0TFYrYmtSZlkxcTNRdmtJSzM5?=
 =?utf-8?B?SG05cEMvbmNhb0Q0a1lXUFNqTWg4OU1RZzZ1bGcwWXg5SVgyOUdEYXcycCsv?=
 =?utf-8?B?MVVVby9ROWtpRmRQWlcrRjRTQ2lUSzBmTURaeGVrN28ySERzc1kzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f11023f-c3cb-4d6d-e43e-08de62caf572
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:21:37.3771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxcMVWQ/mItdZUIkck2mi2hHNfXUPzNqAqjnplzuG3yt1ExreDsiQxF47JgKrM4H81SXXWdIpliGz8NQXv1LjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: tuNia8nLYRv9y1P8efMWrn8pZbavipJ7
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69815bb4 cx=c_pps
 a=hJOwGQj5EtsonyTFrxeutQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=FLAKdco8JnsOo3_I_JEA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAxNiBTYWx0ZWRfX8drrUKhNvg8S
 BBSO2jo0WIoRJITCrUseQ32Lo5imYzuYzgjJcBl0hS2G1JO5lWKTDVwvyj4+++U9eOKlp0K0ozU
 Z0W6nNKFIYDhf2Pgg1HY7zvtgKdTgzRcd940jyrVkRLFkOaT5xqXJqf2E/NbmT3xRtZCNjOcIau
 MeP0z21Rgm6yaxSdveQAjGDBj5/0WRvo85mBNSqM5wtMZIIsIqxMsIo6A3L+NowWN3gaBlyeA/N
 N89zt8piJq39hLf3NUtmHgUhdWSyhuBMd5pXSdo1QiU1CAtI+X+faGipKoj+AROBFQWKuKI+jVi
 izLU+S16ZNE+9NqzJREKOGO/mEfnEP+BSIFN/Hz/tSX2dpU6SG5tITAd6Qo+JDhfYW+6QZPHvh4
 kTWoEt09HSIKnoZsVzl3gliIZIpWqWe0e89ns4aDN8I9uIGhBpVzeXMSD1twK/g7bMQbQlCSTGM
 60edLFn7kDhv+wbB+Ag==
X-Proofpoint-ORIG-GUID: pLMKmqdRn-iFKZd5ofYc3ScjQdOuyXE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230416

SGkgQWxleCwNCg0KVGhlIHN0ZXBzIGZvciB0aGUgdGVzdCBjYXNlIHNob3VsZCBiZSBzaW1wbGUg
YW5kIGVhc3kgdG8gcmVwcm9kdWNlLg0KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gaG93IHRv
IGZpeCB0aGlzIGlzc3VlPw0KTm90ZSB0aGF0IFNESyBkb2VzIG5vdCBoYXZlIGJpdGJha2UgYW5k
IE9FIG1ldGFkYXRhIHRoZXJlLg0KDQpPciBkbyB5b3Ugd2FudCBtZSB0byBmaXJzdCBzZW5kIG91
dCBhIHBhdGNoIHRvIGFkZCBhbiBPRVFBIHNlbGZ0ZXN0IGNhc2U/IFdpbGwgdGhhdCBiZSBhY2Nl
cHRlZD8NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4gDQpTZW50OiBNb25k
YXksIEZlYnJ1YXJ5IDIsIDIwMjYgMTE6NTMgUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5k
cml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
ClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggVjJdIHJ1bnFlbXU6IHJlc3RvcmUgc3VwcG9y
dCB0byBydW4gd2l0aG91dCBiaXRiYWtlDQoNCk9uIEZyaSwgMzAgSmFuIDIwMjYgYXQgMDQ6MTAs
IENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gVGhpcyBwYXRjaCBpcyBiYXNpY2Fs
bHkgYSByZXZlcnQgb2YgdGhlIGZvbGxvd2luZyB0aHJlZSBwYXRjaGVzOg0KPiAtIDBjMTBhNzg3
OTYgc2NyaXB0cy9ydW5xZW11OiByYWlzZSBhbiBlcnJvciB3aGVuIGJpdGJha2Ugd2FzIG5vdCAN
Cj4gZm91bmQNCj4gLSBiOTMxZjc0NDQyIHNjcmlwdHMvcnVucWVtdTogcmVtb3ZlIHRoZSBjb2Rl
IGJsb2NrIHRoYXQgd29ya3MgYXJvdW5kIA0KPiB0aGUgbWlzc2luZyBiaXRiYWtlIGVudmlyb25t
ZW50DQo+IC0gODE5N2JlNGRkMyBydW5xZW11OiBlbnN1cmUgdGhhdCBiaXRiYWtlIGVudmlyb25t
ZW50IGlzIGVpdGhlciANCj4gcmV0dXJuZWQsIG9yIGFuIGV4Y2VwdGlvbiBpcyByYWlzZWQNCg0K
QWdhaW4sIHlvdSBjYW4ndCBqdXN0IHJldmVydCB0aGVzZSBjb21taXRzLiBQbGVhc2UgcmVhZCB0
aGUgY29tbWl0IG1lc3NhZ2VzIGZvciB0aGUgcmVhc29ucyB0aGUgY29tbWl0cyB3ZXJlIGFkZGVk
LiBQYXJ0aWN1bGFybHkgdGhlIGZpcnN0LCBhbmQgdGhlIHRoaXJkIG9uZSBhcmUgcmVhbCBpbXBy
b3ZlbWVudHMsIG9uZSBnaXZlcyB1c2VycyBhIGJldHRlciBlcnJvciBtZXNzYWdlLCB0aGUgb3Ro
ZXIgc2lnbmlmaWNhbnRseSBpbXByb3ZlcyB0aGUgZnVuY3Rpb24gY2FsbCBBUEkuDQoNCj4gVXNp
bmcgcnVucWVtdSBmcm9tIFNESyBpcyB1c2VmdWwuIEhlcmUncyBhIHR5cGljYWwgY2FzZSBmb3Ig
aXQ6DQo+IFRlYW0gQSBidWlsZCBkaWZmZXJlbnQgaW1hZ2VzIGFuZCBTREtzIGZvciBkaWZmZXJl
bnQgbWFjaGluZXMgYW5kIGNvcHkgdGhlbSB0byBhIGNlbnRyYWwgcGxhY2UuDQo+IFRlYW0gQiB0
ZXN0IHRoZXNlIGRpZmZlcmVudCBpbWFnZXMgd2l0aCBkaWZmZXJlbnQgbWV0aG9kcy4gRm9yIHFl
bXUgDQo+IGltYWdlcywgdGhleSBleHRyYWN0IFNESyBhbmQgdXNlIHJ1bnFlbXUgZnJvbSBTREsg
dG8gdGVzdCB0aGVzZSBxZW11IGltYWdlcy4NCj4NCj4gQmVsb3cgYXJlIGV4YW1wbGUgc3RlcHMg
Zm9yIHRoZSBhYm92ZSBxZW11IGltYWdlIGNvcHlpbmcgYW5kIHJ1bm5pbmcgcHJvY2VzczoNCj4g
MS4gbWtkaXIgZGVzdGRpcg0KPiAyLiBjcCAtciAvcGF0aC90by9idWlsZC90bXAvZGVwbG95L2lt
YWdlL3FlbXV4ODYtNjQgZGVzdGRpciAzLiBJbnN0YWxsIA0KPiBTREsgdG8gZGVzdGRpciA0LiBT
b3VyY2UgU0RLIDUuIHJ1bnFlbXUgcWVtdXg4Ni02NCBub2dyYXBoaWMgc2xpcnANCg0KU28geW91
IG5lZWQgdG8gc3RhcnQgd2l0aCB0aGlzOiBhIHRlc3QgY2FzZSBmb3IgdGhlc2Ugc3RlcHMuIFRo
ZW4gd2hlbiB3ZSBjYW4gc2VlIGhvdyB0aGUgdGVzdCBjYXNlIGZhaWxzLCB3ZSBjYW4gd29yayBv
dXQgYSBmaXggdGhhdCBkb2Vzbid0IHNpbXBseSB1bmRvIHRoZSBjaGFuZ2VzLiBJJ3ZlIGFscmVh
ZHkgc2FpZCB0aGlzIGluIHRoZSBwcmV2aW91cyByZXZpZXcsIHNvIHBsZWFzZSBkbyBub3Qgc2lt
cGx5IHJlc2VuZCB0aGUgcGF0Y2guDQoNCkFsZXgNCg==

