Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F2FC369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 04:09:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3080.1745122159064625057
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Apr 2025 21:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6205c0d41f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K45qIP012945
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:09:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rr17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:09:18 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53K49H3R018547;
	Sun, 20 Apr 2025 04:09:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rr14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 04:09:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+DJ5LMR0wsaEOMU3/iSPMTujaUx/FzvBhbdJeWs3a0Z8z+3qQS3MznbMTBt5R1avbNLHthFEjTWGUdr+n1G9/Md1RYBp3ODkJv2inEoxOMbmNjcH4njybxjlR0L+cvnv1jVfIfT26VwT+m1jHuNVggyqsEpboKTjbbi7gkaicS0p0qaPVoMHWVDSwjfxdC1TPhP94gvyTfcsJqE+bSDb7+9hxxf6k8akoScUH5cJTEgncqOhuRNOcSrs7Yk2NrfvEDks+ZUSqdepzo92Ps+03siRZ+fCYGKQ9Tc0zS1nLyHYUkrbWLa+AkrzDIAPL4Co75ufhivsUeDSAj5AJrt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do+a1FL97HTyoxHxU7mj4Kc+0/NLDotKX2VMxSpVOZo=;
 b=rZVjHFh9AJBaKI4tJAXwXbw9l367nWCZPzAib4wSaN4HrakucAE9r6bOWs4Ee9N3wI1cUEq9iwvpZUqMsq3hNYq6mkj5gelPqyDAfe2zDYi2wVT0kzLsDDH3rJdfiJ6kGGnrp+njM+D4PyjIlF3jLo3cS7mxnsQerSFUlCGk9ICEoytoHAc8I0sKh2KlAgVD2pAnrYx5A4GQI6syspDF8RAGoxr3UHIwTWTEE7EG6q5g8yFe2lBN0YavGuDquHqm/bPBsYsgU2h/V94J6xGyG/UL7Rel6Cw0BmQIu903uulQhL7Wb5hypwVnY03/s8cI1la5GTfIy18QE2bzNQBNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sun, 20 Apr
 2025 04:09:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 04:09:15 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V3 1/5] classes/recipes: remove unnecessary qemu
 inherit and use qemuwrapper-cross
Thread-Topic: [OE-core][PATCH V3 1/5] classes/recipes: remove unnecessary qemu
 inherit and use qemuwrapper-cross
Thread-Index: AQHbrP78vxNn4lPJa0yzhgmf8O9ZyLOmhsEAgACetkCAAIKkAIAEUOeQ
Date: Sun, 20 Apr 2025 04:09:15 +0000
Message-ID: 
 <CO6PR11MB5602E00B5D116441B7735254EDB92@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
	 <c4542dc8cddfd0e401f74629fd7f28e9dd209237.camel@linuxfoundation.org>
	 <CO6PR11MB5602D61A318C6EA7C9E1826EEDBC2@CO6PR11MB5602.namprd11.prod.outlook.com>
 <95a4ea27c60ac88b47ed68d69c6085179fccf9fd.camel@linuxfoundation.org>
In-Reply-To: 
 <95a4ea27c60ac88b47ed68d69c6085179fccf9fd.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA3PR11MB9424:EE_
x-ms-office365-filtering-correlation-id: d9ca9c5d-feb7-4a2d-2bdc-08dd7fc11d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?a0xjY2hxK25HQno4RWFoSHFibG1kejFyQXlBQ0ZKOEVoZHRyKytiWDZrUEc5?=
 =?utf-8?B?QnZjblVsZVZzajd3OVhhVS8vV2hyUnh6RGltU2FSVy9vc3ZaWko1M21jbGk5?=
 =?utf-8?B?V3Jic3FnTWozZThxMStIeXM0N2JaWjhjdVpCQ0puN1llZ2VIQ0l4SmJNUkdw?=
 =?utf-8?B?RWs0MHFWNFhINWdJbDMrSm0zV2pDT2VIODEyOXVReXFLcW95MEhFczZwWkhD?=
 =?utf-8?B?dE1UMm9lZVVrZDZyMDkrc285TTdlNjhWcXU0Nlp0MUo2VXVIUGdtUkJWUGtW?=
 =?utf-8?B?dXlsR1c0WldZZVR2MDArbGMyTERTcUlJOE1jbXNXZWt6d2R5UHdnejhwZDNo?=
 =?utf-8?B?R2pQQURTb0xqM1dIUTh3LzYyNmFrZjRlMjZhcCtoUjJwaWVwRkI0eVloZDV4?=
 =?utf-8?B?RDh0aVd6cHh5RmRBSHp4aXJ3ZnJOMmwvVlhaTzh4U2E1Qzh3Y1dmdVRvZGNu?=
 =?utf-8?B?c2M0RlV5eEMxZTI2eFFlZ0pzNm01amZ0NEJtc2VvSnA0R0dIbldNbFI2dHUv?=
 =?utf-8?B?NWlobHRjR05pOG1uMjVpL3l6U1ZrNGRLZ2JDcEVqOWVMZlRxNmdSdnRXcE1L?=
 =?utf-8?B?cVFuSWtDOUVPc3Y5TmtPQU1MTGdreS9wRnBuL3J2bGFLNXpZQTBKVUt3dEdN?=
 =?utf-8?B?SnVkS1p5SjNtZGFKYjNUUHRBUXVmOWFWVHB4Nm9pRUdudWxUZVFCb2xwb1B4?=
 =?utf-8?B?cU9jRmdQT1NaK3RJcFBqWk9HY3FDbG42UE1DUFJQd3d0RngvSWhVVTJxd2Q3?=
 =?utf-8?B?Yk9VWHFSaEI1Z3JoQ01JSHBEa1FOd1pNR000WHpER3hld0pDNUtxbXJMYXhY?=
 =?utf-8?B?d3FvMWwwRnRtVE44bVVsd0xXR3E2elBnTGd6YXBoMTZyTHpIaFVMQnVCQ21U?=
 =?utf-8?B?NWhpUjRwaU5LK0YyVVhmaTVJcVNZWW8yVVZnek1uT0xTRkd6MlpMcTdYNkhN?=
 =?utf-8?B?Vlk2a2xCRE4zZFMrK3dJNUN5dk1WeGxrQm5BQVVKLzNIZU1JKzBNRVZZYjQx?=
 =?utf-8?B?Z3V0NkZRazcxd0JLejdjVXh3SVhUNWtWcURqQXJZMTVzYWxxL3NtNGtrV3hy?=
 =?utf-8?B?NkxQVkFkSmZvL1pvQUN0MnNTclM1alg5RC9kbkdhc0lUcGRYUmdjbkhCK0Fz?=
 =?utf-8?B?bXNKS25lWmY0VG5ka3gzbTB2NC92UGxoMkFZZnE3VVljZVVKZ2w2WVdHQ1FV?=
 =?utf-8?B?b0lnZXMvVVkzSVA1c2N6V1VXWHB6eDg3NXhmUy90SU5GZW5USVdOZ0J4N0U5?=
 =?utf-8?B?cG9OZm10VS9wVzJwR3pXdEJXV1c5SXZvblIxTDdjcTRaN1ZsWUFhRlVlV3BJ?=
 =?utf-8?B?TUcycmZJbEZTNEtlV0dEZUhjVVJQaExrcDBoOGNuaU5xUi8xbmo4eHpYRWNw?=
 =?utf-8?B?M0RQdFpQcWpBMnJEVFd5QUsvY0lIRUd1ZHRLMEQ3VzlIMjZTbGZWOStWTnZN?=
 =?utf-8?B?N1oxbTg5RHY3K3FSckpvd0tQbDBTdnJsQkZ2VkFZelVlNnkyT3pWRHhMVnlm?=
 =?utf-8?B?ODlzRHY4eFBjbEgya05vck9VOS9rcmwxRnB4T0s4R1h5aGZhM0hWb1NuWGlQ?=
 =?utf-8?B?YnBweDlwN2NWWXhLeWxDV05RTndaWW5CVUVSNmFYR1A0aXhQVzFZNkl0SDk2?=
 =?utf-8?B?c1djM295cm9uSmFlNWtIY3krcVd5aGFaKzZwZkJCY0M3eXkxYVBZQWxNdGZT?=
 =?utf-8?B?L0dwSFFtSERzV09UZ1Q1cE9QMmtiZHd1V1YzV1A2ajZaMjM2cE1ZbVloTzV3?=
 =?utf-8?B?YTN6VytOVDdtNEMvdEJXQ0RtQlFXMmZnSFJSNU9hWVlIeVBWeGhmT3BFdjlj?=
 =?utf-8?B?MVk5c05EblJIZTNTYXhZVVBwMngrclVXaC9WcWVsU2pRaFVnSGU0Y05nZDVW?=
 =?utf-8?B?Q2F2MGxFZlB0OU9JYW90MzkxTTYrWFhUNXcvNXpxaER2TDdMZFhScWdFNFJC?=
 =?utf-8?B?Q3JvdW15LzJLODR1T0N6bWo1cmQvM0EvVmZya1Y2VkpXREo0enZxaDg4VCtr?=
 =?utf-8?B?VWc1bk5Wdyt3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THQ3bXZ3VkluUGR4WjV6MG9XVDFIemdFU3Vxay95YTcvL0pKUEZ4Z2pLMkpH?=
 =?utf-8?B?TTJTRTFIODFOd0wzQUI0ZkVpMnNIVjExTWN0R0lRQVF5N1czbTBzdm9GYVBK?=
 =?utf-8?B?dUhoSzFZTjhYYWZZejBhZElFbnFYdHNVNHNWRWNuYytsSkIvYmxvcUVGdFVa?=
 =?utf-8?B?VmFhNC95bDlGMWFlUldyV09ONzdYQndTTTlhdXFGQTAvR2Rxemh4MkhxQyto?=
 =?utf-8?B?VzBzR0JsUUs1UlAwK2tRM2lTWTIxZE11SG91RXcrTG9TTnpleXU2SnFNK2hJ?=
 =?utf-8?B?RWdUMXhZUS9nd1UzWk1YamJKMm9SWFBycis4Q1pocFY2ZGlpVGJjQngxd3BK?=
 =?utf-8?B?dk1IdFdHTGF3a2VMb2h5TmJqUzZ6QkIxSzFJZktnSEFDbWFqbmFscTkzVk91?=
 =?utf-8?B?MlF3ZDFROWdwcndEOStiVjh0eEZmNVdyNjJEMUVJc2FPUHhGWCs5NVcxSG14?=
 =?utf-8?B?ZWtzcGViUWw4TXNzTFptUVNNYWw2R29SazE5dWF2eGhMMnFyN1NQc3h5WGtS?=
 =?utf-8?B?bURBZDZoVXhpZkswVGgxRnA4MXFqVEg4YzVTOWNac1VIMHdpbTZZYzE3WGxm?=
 =?utf-8?B?d3dIcXMrMlRxSEJHMHcxK2ZVcG9jczZHRzI1TXlFQnMzZXpjalRHb1R0Rnhv?=
 =?utf-8?B?Y0hReVVzdHJPNXVNS0J0dkdzcktYd3c0LzkzTjZKclJ0TVU0aUtGWFN2Z0NW?=
 =?utf-8?B?d0VCQ3lyNlQ1Rk9ZWFdiM1RBQmhJdXNzRzg5ZmpScjJobGppWXEramd5d210?=
 =?utf-8?B?dWZ1bEovQWFZWDhRTzJ2Uk8yV2VDaGVPd3o3b2NsbnRQNjQrVHJHUFBtanQr?=
 =?utf-8?B?eUk3Nml2NXRKbGtjSjR2eHAxR2VvWUJ3cEU1OHc0VFh3YWwxM0cxeHlBSlBQ?=
 =?utf-8?B?dVBvZGpZL3gyQ0lNOGNacSsvNWlRSTlEY2xvcW1DTlVaY0I5SkVqNnQ2dUFy?=
 =?utf-8?B?UWhPY2UvZUVkM3hTWjZ4ZEVNbkRCdXhUSVhLTVRWb0dVKzh6ZUozVjVjcTNr?=
 =?utf-8?B?cXZwU3FjdGlSdTdrMnRVQ1ZwWGExYnQ4THVTTHpWOTQvZ2h4S1lwWmtWWmlK?=
 =?utf-8?B?Um1xR2ZmUzBsUEJvR1Y5SzNBYVRKNHlMOXdhbWJqWjdObjFiQnBqYkZBeHNG?=
 =?utf-8?B?dXorNTFIeS9XVzlJLzA5OEg5R1lpNkhSODNsZXhjUzY3NENRVE5PSTAwa1Fy?=
 =?utf-8?B?Sm5oMDdsbUpUZzFoa3poMlFydnBzRGxzUlNROWRoZ1NMUUsxbzV4b0t6bTU3?=
 =?utf-8?B?ZGxYY0VVRm15Z0RMQUVCYXVCditqR2pOaStqeG96L2hzdHdIMHFBM3ROMHJB?=
 =?utf-8?B?QWRMb3BkamZEaitSMFZleitGOWRqQ0I4SkFGdXM3QmFDOGdzWkhlUzRqaWlm?=
 =?utf-8?B?SlUvUVhJbnJBR0tWL3J5RkdCUzBDOHlDNFQxTkdFbzlubWRpcTZaMGk3ajJt?=
 =?utf-8?B?QXhlN0lTY2Z0bTE3UXFtWnFqTFAxTTFkano2ckxNdld4R2FOQ2tZMmp0RnVk?=
 =?utf-8?B?MXdHdnRqZkl1bWRpeStXMjFUM2k0ODVpRm11VVpZbWtub0c2MmEvZjZyczFE?=
 =?utf-8?B?OWlYRHNpK09qNnRuWE5SNkJ1OWhlRm5BR3IxQ284Vjd0alZCbGF3VXRwSENY?=
 =?utf-8?B?N1RUWWJvL09KbGdmbmdoeXRUZzE2ZmwyQmsyWDNuVUpLUWNRQm54S0ExTE1R?=
 =?utf-8?B?K3ZmMDRyOE14NDVqQWo5bUF2RzRVYVRrL3JUeGZORmVMRUhJL3dlZS9FWXVw?=
 =?utf-8?B?eEI4TjV4YXBmYnJBeXNMZ08vTXlnS0tDZDMwS1ZFSDdzZzZkVm9PdXU1bXF5?=
 =?utf-8?B?TXBpejZSSkNLM09rUEd6NjI5N2VLelgrVjV0d3IyYWxramJXdGs0dUlFcUlx?=
 =?utf-8?B?ZW9ONGZzQzR2U1dHRVZzQzVQYi9tcVExbnBPLzVVUXlQeWUvT1Yvc0NUNWVZ?=
 =?utf-8?B?RW9vNUZjK0c1cGI2VjRvdStlQng0MVBPV213clhHWGlvQUhqc1ZzTy9pK2dP?=
 =?utf-8?B?ZEoyaVdDRXE2a25WeWZmVlY2Q0UzaS9IQW1yNkdFd0ZvbndqdWhsMTdEdTBT?=
 =?utf-8?B?RlNYZHJIdlkwV0o0UjFmRElyV1lFOTFweE42UjduT3N2aEtMK2ZOekpCT0hJ?=
 =?utf-8?Q?Ap3oj9euzpQOrVYj9dUgmTc4A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ca9c5d-feb7-4a2d-2bdc-08dd7fc11d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 04:09:15.6997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zsr1mTlZ7egNmiub2olxqfpVyJnz9KpiAqbltls41UFhQvIS8tf3D6m1+Ga1ULKGM3mwcd9l5ZmUt8e1+RjeaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-ORIG-GUID: d9TYta-VplYZAwDBUMINfv3bZT3duF38
X-Proofpoint-GUID: AJNtPy9gfsRhL-m1ggUdeBQjOWm9WwDd
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6804736e cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=TXdbqNWE1nxHizhmzfsA:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215150

VGhhbmtzIGEgbG90IFJpY2hhcmQhDQoNCkkndmUgdXNlZCB5b3VyIHN1Z2dlc3Rpb24gdG8gZml4
IHRoZSBxZW11d3JhcHBlci1jcm9zcyBkZXBlbmRlbmN5IGlzc3VlIChlLmcuLCBjYW50YXJlbGwt
Zm9udHMpIGluIFBhdGNoIDEvNS4NCkkndmUgYWxzbyBmaXhlZCB0aGUgbWVzb24gKyBhbGxhcmNo
IGlzc3VlIChlLmcuLCB3YXlsYW5kLXByb3RvY29scykgaW4gUGF0Y2ggNS81Lg0KDQpUaGUgVjQg
cGF0Y2hzZXQgaGFzIGJlZW4gc2VudCBvdXQuIEl0IGhhcyBiZWVuIHRlc3RlZCBhZ2FpbnN0IHdv
cmxkIGJ1aWxkICsgJ29lLXNlbGZ0ZXN0IC1yIHNzdGF0ZXRlc3RzJy4NCg0KUmVnYXJkcywNClFp
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgQXByaWwg
MTcsIDIwMjUgNjoxMSBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+OyBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09F
LWNvcmVdW1BBVENIIFYzIDEvNV0gY2xhc3Nlcy9yZWNpcGVzOiByZW1vdmUgdW5uZWNlc3Nhcnkg
cWVtdSBpbmhlcml0IGFuZCB1c2UgcWVtdXdyYXBwZXItY3Jvc3MNCg0KT24gVGh1LCAyMDI1LTA0
LTE3IGF0IDAyOjI2ICswMDAwLCBDaGVuLCBRaSB3cm90ZToNCj4gR290IGl0LiBJJ2xsIGxvb2sg
aW50byB0aGUgcHJvYmxlbSBBU0FQLg0KDQpJIGRpZCBsb29rIGludG8gaXQgYSBiaXQgYW5kIHRo
ZSBpc3N1ZSBzZWVtcyB0byBiZSB0aGF0IGZvbnRjYWNoZSByZWNpcGVzIGFyZSBhbGxhcmNoIGJ1
dCBjYW4gY2FsbCBpbnRvIHFlbXUgdG8gcnVuIGZjLWNhY2hlLiBBbiBhbGxhcmNoIHJlY2lwZSBj
YW4ndCBkZXBlbmQgb24gcWVtdXdyYXBwZXItY3Jvc3Mgc2luY2UgdGhhdCBpcyB0YXJnZXQgc3Bl
Y2lmaWMuDQoNCkkgZ3Vlc3Mgd2UgbWF5IG5lZWQgdG8gZXhjbHVkZSB0aGUgZGVwZW5kZW5jeSBp
biBsYXllci5jb25mLg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

