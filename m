Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44C9D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 01:52:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9758.1765245144572327186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 17:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bf2eCTby;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4438bd960f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B916g1O2716674
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 17:52:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xv0QEVx2EXdLxFsxAXbzZfh51qPtivhz7rQo1GXlWjs=; b=
	Bf2eCTbylI4cRC8JZgEN+9D8lm9OnwXxxGsDnmpV+aaeGH6LTHIqpdArEwCYVAIk
	04GSuF3FPmNtXkgtlQt521ZZYJhLymr4ZQDp0JFK0qsYGOIAAIDQx24TQMWmZJoF
	ZgUpUPdYscYTBKGVIwQBsXpVDG6kArJjHK8t3C7Xe9clZg9JL5XHjctAow4QXFtB
	If5bhn+qNkSiu36vp9xUKcRbhsY0XBVlpfxLO0pILgej4XEFwDIonoaA8EKa8ZcP
	zzLCUZAQOecCKcwkIHS3RxF4v6iFMj+jLvk+QKqXSK4JK528VwujSMbWU1ZdRWwb
	2XXsTMQZhnfniZuKJvdTqA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avmvha448-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 17:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhXeIGOTBTQFLigHHCZdmaHwpSu59IPW7Y51/AJqfxgQ+LJSVLCcAsDaCYVqd1cov228dyfV1XhAejKkRzm5p2P6s6r9LO+87skjjQ501/3U7kxfjeu3SC7XZMXP+0gkFQ0yL7P1xxnj5KV9mLKCNcN4WKZkgyIIBMPnA5Bwdei6dgpGIXfK50TIqvtuWwj+5SMnmrLVgOa68MnfQGydXOxWDnVhVIkGLe6rvLGS+uBQkCXF+2NEwXzZ/0pk42sUudexPnClyWi51y4DTPykICIL6Zf3HddJtjXM/0r0SydNGDzhVf6fDIfvzBFzRhQ27ziammgu72bijlvdzJnBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv0QEVx2EXdLxFsxAXbzZfh51qPtivhz7rQo1GXlWjs=;
 b=Teu2/Q4cV0o+scTJDNmyXH3vr6EiuSw/pmeil1Fw57W8gJf/42vkxGduykHV+1x3XE7ocntXFUX5+JqZ/gfE7SUsUSheHKFMRayMTqD7xJ/cG7LQBWQyGqxjBagYogKyROispj7QuLHwk253JvjxKT9tBz+NCAQeMUaQBUHchvbLn5tQWa7Z4ys9UtUKoI3xC31VVzvuyk/05BtKxzYGVaHSrA9jpbK+UGnZIBs+JNYDsstsKFsX2dRezxd+pSb4sYQKnUKDb+r6WYnPewdxK4r2jS8eiHZFnVD1HXoi82JvmTykb/tPqJ6FwUsnL0sTvMoIrpmq/pSfwqbY+Z7Rpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 01:52:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 01:52:18 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: RE: [OE-core][PATCH V2 2/2] core-image-ptest.bb: use ?= for
 PTEST_EXPECT_FAILURE
Thread-Topic: [OE-core][PATCH V2 2/2] core-image-ptest.bb: use ?= for
 PTEST_EXPECT_FAILURE
Thread-Index: AQHcZdKgboGuOtJ9qE27C2EBxVlqarUYkLmQ
Date: Tue, 9 Dec 2025 01:52:18 +0000
Message-ID: 
 <CO6PR11MB56024B5412ACDD2F34A20C6DEDA3A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251205083202.330982-1-Qi.Chen@windriver.com>
 <20251205083202.330982-2-Qi.Chen@windriver.com>
 <187E4882ECCAA683.722109@lists.openembedded.org>
 <CANNYZj_cgLPNMUo0L1bo_TvMWPQJNXZseUprAszpAR2VL38giQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_cgLPNMUo0L1bo_TvMWPQJNXZseUprAszpAR2VL38giQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=3d2866d8-b0ec-4bca-95c3-96ca562d4e86;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-09T01:50:24Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: a379b061-cd1f-4c7e-7a68-08de36c5962a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NWVwVFVrM0duU3RuVEJlTWxLZk5uejRpK3N5bGJ5M25QUmFhWUVNNXNPbHho?=
 =?utf-8?B?aXB5Wm14LzdvYk9PNHorcGU4cTlDVVFUWmVQWHYrQkNoSk1pZ2d1azRtODBT?=
 =?utf-8?B?STdtRjVtbFhJY2YvS0lxY0VYaUpQREtLM0dvUmxITnlEcmFHNi81MHN5WnhM?=
 =?utf-8?B?azB3ODRKclJhWU9kMXVaMXB5VWtKeXUyd3NSUktnSVRkd0dhWXMrdHBlV0Iz?=
 =?utf-8?B?dy9jdjhlTUxwcDNjQlo5QmxNT2V3N21ERXRpR3l5TUd3NlZYNWpJenFTcGth?=
 =?utf-8?B?Z2NvVmhkMnpZNllPMUdLaTVYWHhpVVBMU1FJUG1jMWtPeUNORUJsb2VVNEVj?=
 =?utf-8?B?MXd5eDNWV3dSa3E1USttMHM1R253dnpqNjlidW1iT2ZwbTNQQWNPcGpzaHFv?=
 =?utf-8?B?STV1bWQrZGMwRHJHU2NneWtRVzZkY1pjKzBUZlhydTdPelY1K3hoSXphV3pU?=
 =?utf-8?B?YUttN243UGtRaXB4ek8zTHphZ2ZrOXl2THR1aG5yaTA2WXdNaGM3NkZMNHQ4?=
 =?utf-8?B?bUtaZWJzUG1sUEJtMG9PMzRCTU9JYkJrY3VYWUY3a0grY2I5NitJR3l0bDJH?=
 =?utf-8?B?VXdLTUF5QU5NdXlNRzFGUmlmT2JRaDdjU0lSMVd3bWRpb1ZoZEVXNW9KOW05?=
 =?utf-8?B?ZUhUdHdmbm5kTDRGODhXaXBTYnBEVTdJeTBEQ0dDQkdDSm5makdXVGtVM0pr?=
 =?utf-8?B?WlpwM3ZFZnhDajM3QkowVjZ6Q0NsVmFiZ1FhNlBtaks3emV4WXpSOXRkZ21B?=
 =?utf-8?B?T1NQVFhJWjNuVDFsVTcwZUJ3bWpEUzI0aVVTR0xTYU5IMTdZaGZtaEJidHB0?=
 =?utf-8?B?TXF4SThBYkMxQjJtbC9FUVEyVytnRmpjTVEzQkhFLzE1ZzJBWWR5VmxoTXhI?=
 =?utf-8?B?ekNjTXRySUg1TEZyZ3dNNEloTzl1OGxHNUdKUklaMTdYKzJHS1V3N0pFUXBG?=
 =?utf-8?B?aVFVQ0hGWVhyVkE0S042NWNSNXRyZnJhWEJSaXNCK3hQdFhpVVAwSlJyWmRp?=
 =?utf-8?B?VmZNVjZORkNLeCt2M1FGVFczLzNuclllQmdUMnFVR3JXY3pVVDRHQy8wQ084?=
 =?utf-8?B?amo1ZW9YQlI2cks1bWwrSC9iK3RHQnpqYWRhTFpwM2cydVZZd20xY3BnVjdP?=
 =?utf-8?B?S0tMRG5pZXR4UWljb0FsUmVtanRjMkRXaHR2SUxOV29lZ3hCQmJWU0dqMkVU?=
 =?utf-8?B?TDA2bmR4NHVzSVVEWXBtRFAwTlNVTmJrN01zNUVaWjdreUdDTDRGRlErSWJm?=
 =?utf-8?B?WnZvaDdLb0RUMDVsUWw3eHM1d2VNQldXZ0JNbGNYbDJJbnM2OWpJaW9BRVlS?=
 =?utf-8?B?N2crNFBkMjlsS3hSZndUV2c2SG9TRFArbUVBY2kzR2kwa2xISEtpRStTSlND?=
 =?utf-8?B?ZGxWeGgyYTJ2Q3pCejFoa1FVZ3hBZEVCT0VkSUFpZzJGTXVkTWxFaG5XMnhP?=
 =?utf-8?B?WGI3K0ZtMFhTV3JhenZacm1XVDZWRzBiZjUwUnlydDMvQ2RtNlc1TjFSc05M?=
 =?utf-8?B?aCtwSzRGdElWS1JTRlB1T1ExcG9NVFN2L25SRTZBeFJwbGs1dUJsMEE4cEVH?=
 =?utf-8?B?czhNclF1c1Q3R0Y3akVYeWhrLzE4akNCS1VwZTN2WGx3SFNUcllFam16UlBR?=
 =?utf-8?B?bGxjbWVXc3BoeUhxZkNFRDdsYTBSSUkxMEE1Y0FtR0JCOFRmck5LV2FIUHNU?=
 =?utf-8?B?a1duV0J0MGY2cTZobUJ1WXNnaHF6ckN6WTluZ1NNY3A0ZXpwQmJ4L3BtN09j?=
 =?utf-8?B?R2w4S2I5d28wUElIY1dZbkNqZTc3WXVuMFBscDBZOVBuQmRrQ0prTlZpTGU3?=
 =?utf-8?B?RElKTWhvb2J5aDY2SXJDVHcvV3A3SFBidXVUS2lXc0FUQXE5OFFrVE10cTR2?=
 =?utf-8?B?K0tEK2ExdTBpQzRUT0VaaGxjakVhbjhlQ015Smo3OFFMcmNLMnlGQUZBNlJv?=
 =?utf-8?B?Ry9KYWJJQWlxSHIwMmY2MklmNmhFYm9qWkxSOGdwcEdLdFRpZElBM1crMVRE?=
 =?utf-8?B?dG0rVzZFaFRCNDE4U1lCMFFyUjN0VXVLMmpOdXZpdWtJS2dTeGVBTSt4Tm82?=
 =?utf-8?Q?5x8aZ6?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmJCVmF5blAxeVBreHkvSTZUTUpxOTZNeVVabU14ZUVwVm5NYXd2SkVoNmdn?=
 =?utf-8?B?Y2QyUCtobXFMUEdvb3UzQUlDMVllS2RRbUpkYjNNdFp5RnUrU0Y1UGVpWU5w?=
 =?utf-8?B?QXU2bjJTckI5Q3V2RzJGMmlmVU1TNEp5QVF3aVpPSmltd3pBUU5pMnhRSlpt?=
 =?utf-8?B?SG5UM2VYMVpUTmpzYmJEQytuKzBadnRXN3ZTMndoVGNJNTNuRG9jVUJPaFlX?=
 =?utf-8?B?QVlkNG9nN0d1a3l5QXcyR1JNU1UySVMrd2tLTTVSSkxMNFcybU8rNmZHaC9K?=
 =?utf-8?B?UzhRTXdqV1ZMV0pXL1U1NGtVR0FZTTlWdThSMkZVNm9pa0lyVFRJcjZSSWtN?=
 =?utf-8?B?OTU1WWs2MG84dmNBU2FScWUwdkZONjdOdkphYUE3VW9tbkpjWGxWT3pLMGNn?=
 =?utf-8?B?TExxN1VOMlBPd2FCcGFobmtuUmMvR3pjRXpuaWlldDU5eXUyN1d6SVBwL29y?=
 =?utf-8?B?b2YwZ2d3dzJNZ1hKejFoL0h4NVQrMkMyWnZsZzQwSEhvZGd3RWxjck1Idyt6?=
 =?utf-8?B?Si9UYjZtL09JUjFDaUFqeklDSFROcFN0bXR5cUY5SnR5WE0vL1hMSklsV09F?=
 =?utf-8?B?QVZIQW5xZkQvQzhZRkI3eGJKaW5taktJZEZ4MnFXVjRwSGRsa0RQQ2U3S0hu?=
 =?utf-8?B?T2lGK3FZeGJxNDVXNjVFdGdWUUFmMEJYN0dIb0tWcFVpMTR6QlhTUWlSaWEy?=
 =?utf-8?B?eXFWeDlGTXN2TlpHU1Y0TEIvWkV1cnlxS0UzbUQzZEczb3IyVVMyRXhGMFVK?=
 =?utf-8?B?azlzQjVMUGlldUJReDdmVDdwaHZobWtCQTdTNi9QSi9JdzArMWpDbWFNMzZx?=
 =?utf-8?B?NXdCU1QrQnF3SHNrRTJFNGZyeGE3TW1SaE56UllUb0Y1SGYwOU1ubG1aNm1F?=
 =?utf-8?B?eUY3WHNwRDVyNmgyS1RjY0pWR1hiT0ljcVppQzErTkgxM1hjSkxYcnpJcVpq?=
 =?utf-8?B?VHNRWlpnbURpQmV5Rnd3Q0VWbzVXN2FrRlNaUHIxRnVybHVMZ2dqeEZPcEQz?=
 =?utf-8?B?dlFaaitCaDMwQ3VWYUtpam40SWVhK3NnR1UvbVBkZFViMGdZWFdGVms1N3Mv?=
 =?utf-8?B?MHRtUkQxSnFVbEttQVM2VFlCWFRqaVMxME1XR0p3Y1RQd3B1Vm9WTm9adk1r?=
 =?utf-8?B?VzQ3SHY5aHdRRXlWc3dvTHY1cnJVbjFSYTdxMmxOV3JoQzM1aXRMaFBWazZX?=
 =?utf-8?B?YVMxTmd6bjY4dE1reW5sUmRDWHIwczZRZ0VXSmlhalpuQXpFcHpCeXd2RDhj?=
 =?utf-8?B?NXhWZnlRUEU5MjNmbGFCWHA0Z2I3c2tFaXlPWUlUUHltR0ljVXVJOTBad0ZG?=
 =?utf-8?B?MXY4NitjSVBuQjZ0alhVWlYwVjRqZWVMY0U4cmlNL21DakljWEZaSnc0Rmo4?=
 =?utf-8?B?YndybW12Ymo2YmMyNHI3YVNpMnFYZGt4UnJWelkxZ2dzd0l2YXM3YkdQdE5j?=
 =?utf-8?B?MEtCbFFJVkpqMmQ3UzJwcjhTdjRWaURIMExadHYzd2RaelhMalFqdytDckZz?=
 =?utf-8?B?MG5jRkhLbTRkbGEzdWdsK3JTNFF2OGx3MHoxZFozdXdEUEtrOWFyNWV4RkY3?=
 =?utf-8?B?QjdKbjRVWDQ3dEJEeCt1L0NqZ3RMTHZJNjJDMVhnZzdmaDdQemRMZ2dadTVy?=
 =?utf-8?B?b1F5cXdGWDM3bVNqSXU0b24ybndxM25pUVVhd0xNVzVFUmdmZ2lMNnpzcGlX?=
 =?utf-8?B?U1pHN0xNYmZjeVVZdkF1cGZXS3U3QTJRYjNjWmFPdzZMbkJSc29nZm9jWENH?=
 =?utf-8?B?amUyNTV4N0plSnJmR1dTOWkzdEQrRU1UNng4c1NYYmY3VW8zVmt4cDh1RlNi?=
 =?utf-8?B?YnN4T2FBWkhENXUxdmV0eEJlM1hmZDd6OVc5QkJoK1YwQ0dXSy9NUEJSamdQ?=
 =?utf-8?B?NU9ROC9TenJ6TmM0eDFMdC9VU3N2a3JvQ2hwdmNkNHpGS0JaZTdFTk5qaXBN?=
 =?utf-8?B?L0hTUlE4c3hzR0JFNE1mdEVHeXFoekVaV3N2YmlXMnpyaitEaDg4N1hyM0kr?=
 =?utf-8?B?OXBEbjJ5b2xtSjA4eUpCZVVRREFyeGdHUHNEdmZEc2NWM3BPU0d3OUpsa2pG?=
 =?utf-8?B?WVhYYmgzSFZWYjFudTlZUmdRajQyY3g0WHI5TTlhSlMvWFFkeGV4eDBKc1ll?=
 =?utf-8?Q?5Jw719/dJWZ2xLKB8oVDzXSJ4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a379b061-cd1f-4c7e-7a68-08de36c5962a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 01:52:18.8396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht5k57mPzcqJT7vvsezNtbNR2Bhe7Z5bELOsW5NrNMppSQJIic3ECFknZukKRldao2LFipPfy21ObuMfZ0cNSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 0sKjyLmPTDLRBlDQDmLNXqtSQ35DwooN
X-Authority-Analysis: v=2.4 cv=be9mkePB c=1 sm=1 tr=0 ts=693780d7 cx=c_pps
 a=33ZETTsaPBFHggYVnTYjDg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=9rwKC8I2095BUxySetMA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: fcP3S-II6gfB8Z71h8tgglo2MhM_Eepg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxMiBTYWx0ZWRfX9m0tx/+AQjhq
 IRJl7Va2NukGe6aZrisTY1oWuCnJJnT6uvbOFAw/4UjG7bBgiRWB3pVGtQItwO29XZC57JksVoj
 lbGSPcIiENqcN65Qw9ZZueT4Bnpe9SG8MqwOT1flDRXpEuZE+EzRDsy9bsf8x3/IK+CHGWes0T+
 9m5x0PJRyTsmma5srBR2jLnDRmnl+Ven5hO8Qx1SuV+NcQalZOZhyrfLQOvoegYybVwhEYfYqJM
 QoHo02R64nKTuNSRu6SwOy2Wcb9l8J7w74s2mAjsrtYXUen4KhGcfKkz4Onhru7uEjXQwySfiWD
 gIkOP7UsM3AIqcl6qWakVtx7tHs0zc+u40k53zR/2xHOPqHNKVkOmRT9+kGt4gQpRVkjVvGLwXQ
 k156nWFIiGFkDFEJZESwWpXHt+fF+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 01:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227410

T0suIEknbGwgc2VuZCBvdXQgVjMgdG8gcmVtb3ZlIHRoaXMgdmFyaWFibGUgc2V0dGluZyBhbmQg
cmVsYXRlZCBjb21tZW50cy4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4g
DQpTZW50OiBGcmlkYXksIERlY2VtYmVyIDUsIDIwMjUgNjozNCBQTQ0KVG86IGFsZXgua2FuYXZp
bkBnbWFpbC5jb20NCkNjOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTWF0aGlldSBEdWJvaXMtQnJpYW5k
IDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQpTdWJqZWN0OiBSZTogW09FLWNv
cmVdW1BBVENIIFYyIDIvMl0gY29yZS1pbWFnZS1wdGVzdC5iYjogdXNlID89IGZvciBQVEVTVF9F
WFBFQ1RfRkFJTFVSRQ0KDQpPbiBGcmksIDUgRGVjIDIwMjUgYXQgMTA6NDMsIEFsZXhhbmRlciBL
YW5hdmluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQp3cm90ZToNCj4gWW91J2QgYWxzbyBuZWVkIHRvIHR3
ZWFrIHRoZSByZWdleHAgaW4gDQo+IHlvY3RvLWF1dG9idWlsZGVyMi9zdGVwcy9vYnNlcnZlci5w
eSB0aGF0IE1hdGhpZXUgaGFzIHJlY2VudGx5IA0KPiBpbnRyb2R1Y2VkLg0KDQpBY3R1YWxseSB0
aGlzIGlzIG5vdCBuZWVkZWQuIFRoZSB3YXJuaW5nIHRoZSByZWdleHAgbWF0Y2hlcyBvbiBpcyBz
dGlsbCBwcmludGVkLCB0aGUgZXJyb3IgaXMgYSBzZXBhcmF0ZSBwcmludC4NCg0KQWxleA0K

