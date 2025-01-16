Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADA5E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 04:34:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41312.1737002078230247679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 20:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3111185964=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G4JwWo007042
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 04:34:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumsnsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 04:34:37 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50G4Ya7H027755;
	Thu, 16 Jan 2025 04:34:36 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumsnsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 04:34:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3Gm19zcUhMqYSvn8mOV1dXb3xtFbxyyH5yo3HWOaLoUqKhKFa8sG5LCR4rquTuZc0FxtdqrNpgrFlGv5O6BuEDs2DCY3V+WAfjkP1uFq8S0ruj2Uwrsfo315ma1le3UL7qpI4aw4MurL2FlTqoVhTtJKBpFODBxCZL9a1JpELde7f7kIYM4icDD+iHhED67N8QF+19TxpRAAnA6ftpdZX5bPw/v6bgNjBfw5tSU+zS3kW4hxj/xnkp9peU+pAs/joUVqQE4oUdP2XxJfcbWuphLskKUF5wK5A6MAlK/s/qxpD9obXhDahCHrjy+5abws1AVux/qXMU58rUYhYjFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OY46Kpcyg/ui9y1dam6ON8ammkaXQZkugO0CW3rfSqk=;
 b=wnGwqiZVmH1KJC+p7yX+hzU0o6Zo3nPj369qTKfwLyVKfTE/ZW45Ss0wHGbCMh/PiZJVORC0mhHHQg3qdF+2dfI889JjN4KUxfrn7UB/hH5XTB/BcGFADJwI1RZRS/s8B52irglqnEI9tUC+f/ZRoqOlDKM4YlzVIiuEBazLY/btuJR6d006nhUcGqAwvp4uvkbcuT0h/T3C0LB1HljonZQDx2OIxh8WwGttkjaMa2A1A1fBM5Q5UNlLx6nlMZlpalRAA2exX8i55ecEsosXjCT/+JaFe8peS6uuVz7Abau1uYNwCAMQ6vHBJAkzlbyX/Ag0AXNYaarreS9oDY/f6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 04:34:34 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 04:34:34 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
Thread-Topic: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for
 building 32bit binary with 64K alignment
Thread-Index: AQHbVnnBni1XhfuWAkCLP4rNGcYgELMNMTsAgACOqeCACzKfUA==
Date: Thu, 16 Jan 2025 04:34:34 +0000
Message-ID: 
 <SJ0PR11MB561338755650C30798B5992EED1A2@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
 <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
In-Reply-To: 
 <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|PH0PR11MB4839:EE_
x-ms-office365-filtering-correlation-id: 7009ba19-5e26-4045-5db6-08dd35e713c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NzIvZ2lJMDNWTS9TenZ5b2EyK2lCeTVQYThhZXFZZFRRemdqSGtBVFgvTHE3?=
 =?utf-8?B?QU5GQm1wc01Rb1NybFhDUGUxN1FpR0paOWc0L3g2dnJIcXdCRkFZQkpGek5C?=
 =?utf-8?B?ZDZIVnhkdDZtTnByaUZXOGlUcnV0ZFFDSVIrOHlyUEk3Q2JWY2IzZWFiam5S?=
 =?utf-8?B?VTVWODdkTnVDdWhkUmNQejVuVjVmd2IwcE9oRmhVQ1RrUmZtek0yK0ZiRDE4?=
 =?utf-8?B?U1c2VUJlMTYzNi91RVowQzFLMERsZlVoVkRONXZNNGpWeCtOY3c1NFZsaGJJ?=
 =?utf-8?B?U3RqeHZVS3kxMkRMSmMrTHNCakNkNi9mRk94WDNNdTF1WGk3RHZJbTREOFd2?=
 =?utf-8?B?VnBDMm5mMUUzNU5LMFAzQzhQby8yZlZiVjIzUEoxZG9qK3djRW81ZHBsWmZy?=
 =?utf-8?B?L0RKR2xnN0w3U1d4bURVcEQ4OUduaFhMKzBKdlRTTGZMT0p0UWFoSkVMdDNo?=
 =?utf-8?B?bHlneDdSQTBpT0ZHejNRTVF1b2ZLM3BhNnhxaW9mTTMxMG9YQ1VqaHQvMENt?=
 =?utf-8?B?Rnk3TEpaa1hzTTVIeXlhc0RFVnBuSThpdUtjMHdXVlFJYVEvMjlCc3pFb0tF?=
 =?utf-8?B?aEZnYm4rV2tGbzVsTmFEK2JCQlQxOE1LNmpiL1BjTmUwNjVoa3lKeE1kUHZn?=
 =?utf-8?B?TnZ1YmdJVGE0c1lZazIrZTMwclpvS2FvUkY2dlMyV05qTUlFKzZGR0tLZlJ1?=
 =?utf-8?B?d09GTFJiWGFSQmZ3Z1NsdU1YQldOeTd1ZUFtVHlkSStGRUFhd1BHd3dDNnBN?=
 =?utf-8?B?RkJEcFdBK2Q5MUpzQVVmbnFRc01iM3A1UU1Jb1g1UVJTU2tITGlVTkZzWHB4?=
 =?utf-8?B?dmM2amRMTEtxL2lNSlhHWHB2aEZYRThtcDJ1RytWUnJ0Nk4yZE9JVXNDMVZy?=
 =?utf-8?B?aVNDRkNicnNnSTZXYUVHMERLdUM4RFNHZVJwLzJhbU43dVJ4TEZqaXpqRU5J?=
 =?utf-8?B?cCtKRVdKblpVYTQ3dStKOVlHOFFub3BWbXlick93cWpPV1JOSGI1cXRVamtX?=
 =?utf-8?B?cE9TWEtNWWE0OXVCaW10UGpFci9BR3BVayt2UmxFY294aytkZDA3bXNkWmQv?=
 =?utf-8?B?YjA3WmFxbFUzUG9KUkhLM3BBSkN6SXExa2x3dEEyZnBKcVRlTWt1Rm9INDlM?=
 =?utf-8?B?dXdQZGZML1JLUzV3T0Z0OXU5VGxYekpqbk1LWElsUlo0WHdnVDNyanpFb1I0?=
 =?utf-8?B?bmZDTlgzTjFFc3BUSkZhNlV6cmd2MHVQalk0Y3hnNGYwaDk5MGhZWTBVNDQr?=
 =?utf-8?B?Szg1TGFvLytoSnB0NzN5a0V6RlNkTGJRd3BSTFVncHNaUi9mZlcxQmNJWFlN?=
 =?utf-8?B?OVJtaG56ODlxUjliQmRqUFJPOGxIL2E4TUxoWUZUaC9rWGlVUE1Kd1MvNVEv?=
 =?utf-8?B?a0szMmpXTUx2bkpINGFpL2dvalVKdnUvcXBDcGYzaTJ0aWhOajJZTXUraCt2?=
 =?utf-8?B?OXNqNGsyT25WUm5MYVIyM0srKzdrMVRIWDcyN3pEak9WbVpqVGxrODgrVDV4?=
 =?utf-8?B?WXFaNExpcDhrNDVTOHJFNEd3T0orV2FjY2hpNVdCakMySHFjV2x3emJJa1Vj?=
 =?utf-8?B?dlRJN1pKeE9uZnd4cnllclZleS80MUJVZmhoSTIyODhsb2pmaXlJa081Q0xJ?=
 =?utf-8?B?c0k0Z2xhSW5zYXFub0k0RXA0RVVlWkZNcEEyV2Z0ckRTN2Zhc3BuYzhzZkYx?=
 =?utf-8?B?Uk14N0w4RXdGTDlwOTVJeUZKZ3FuRkJ6RmV0N3lqaGR6VDg5dGlNOEkxNHUr?=
 =?utf-8?B?dmZrV1lsbXk4TU83NWlLTlFKZW81VkJBdVZRdnBDYVVtUVRiNGREaXF4K3Zr?=
 =?utf-8?B?b29ndEVIQUJ2RWdVN0NnK2xQM3pENzBnNEF3Q0RqWkgvbkVkTFdlQXQ0SnpQ?=
 =?utf-8?B?UEllalQ2dHN6OG1qL09YSlgvditYVW51bkU4TVlkbHhIOFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?REF4cDRjTUtDTUE1WDE1Y3lMQ1pqR3FMWitZRnFKQk0rMGsrWjhsWlZGbVhC?=
 =?utf-8?B?NDVEaGYycUp2QzM2TW85b09YbURWcDN2ZmZPdmZqK1Ztejk2aUhsN1I5UDZX?=
 =?utf-8?B?Mk94K05WbHkycmVkcXFwS3daMEtBTmRFSFF0WldkelliRUg2OU9sZUVNUWN6?=
 =?utf-8?B?emFxQTFSR3Z1VGtKdy9TM1FtUFdOYy9pUmpMOThlVUZXMXBydzhLNDFXdFQw?=
 =?utf-8?B?SGgrcFdzLzdBcWIvVCtmak5sQktOc2RvaTFLWnZiSzlTU3M4TFlxTGlXb09R?=
 =?utf-8?B?cnJmdFJKeFlJTFI1VWovUjlqMHFqUkF0YkthWlhyTEcxNUpDQXJUNFdJeXV4?=
 =?utf-8?B?NXVtQkhtWWY2b0NreGQ2R1FXSUZiVUt4cFZhYTR4V0dzOWtqSWxKaXoyQldN?=
 =?utf-8?B?Znl2RXREZGQwSVFjSy9vakMzNGliUkVUQldMRCtKR043V29PTkYyd0VRd1Ba?=
 =?utf-8?B?aGg3cTVVeUowcEhIZGVZSjVUOXNxeTF3UU9JTjdUb1dFV3o5SlpxckhmSjhu?=
 =?utf-8?B?V05jaFlTaGFubGxSbkhDdjNFN0F1c1lJS0R3SUFhNHY1UHQyY0dtcWcxL3NS?=
 =?utf-8?B?SFJSYmxJZU81NklPZzE3YndwZ3ZLelN1WHdMY3p2QkNVOWM2MkV0dHNkUEZV?=
 =?utf-8?B?TzMvTkZ6S3dyamF3LzREVFlCZXZwWVZLZWZ2K2RYTUZZWHZVQS8zdnFmckNh?=
 =?utf-8?B?YnRBbXQzTVNlUGtWQXEyTUFwb2dGS2xldkdOdWZ1V2tPai9HNEFPYnB5NE1r?=
 =?utf-8?B?WldzMEJoZ2JZSU96aFAvYm1EVXU2SWYwMlF5a2RHMlBCeGgwVFlJc05YRzUz?=
 =?utf-8?B?dGRWcm1oeVk0NllWdmdqZ0RoMW56UUY3QTlySTArNzB5ZnlReHJCL05lSVBF?=
 =?utf-8?B?d3EyK1VDOUEvRWxZSWZGOVRTUXRRZ0UydjNzMHplUkxsMHpYcDdMYnhaS1Zl?=
 =?utf-8?B?YmhrVTZqaXNtMFBOWEQ3WnlOeldHdStjQXlTWHdpNSt3RWVnVXdIWkNFZ2R6?=
 =?utf-8?B?QUJTUUkxVGVNMTVibWljRVBpeFB4TnY2K0RSNkhYT2J5WnB3cENZYmxDSGFO?=
 =?utf-8?B?YUV4SUpRczd5N20yZFlncHZTYjQ2OFd1UnBBd1dYMFRjYlgvU091S3ZOR1NG?=
 =?utf-8?B?a0F3cDluOGxNVGZRSlRFQ3pOYjlTZFdQcGdDZTJlb2YyaE4xNW5jd2poaVpu?=
 =?utf-8?B?YU16dXYza2huUThVdHVMellMTmJaYTZ6S0h0VmF4YTZCNmRFSUZJVTZtSnJr?=
 =?utf-8?B?dXZZOVNWb0NzUFdjM1R4WHF0SEtldnJPRUtydHRwbmNBaysrT2VhNXI0R002?=
 =?utf-8?B?aUhPZmtTMU8rWllkQkRZWlRnQ0lhVzdha2REb29FM2FKL0RURmFrZk1oQmNz?=
 =?utf-8?B?NFRmWWR1bVdVQkJZbHUyMWRaNWFPTkVlKzZZNHJIL3RVbjd3RFEyM3hiU3dO?=
 =?utf-8?B?YTZLaVZaYzRybEdYd0k2cVFmTzEwWHJtbUlJNnY1Q1ZQUGVkYjBNVTdJODhG?=
 =?utf-8?B?bzBRelh4UWdUQXRoTXo1YnJFVVFnWVVzdjhWNkxtV2tVb3dyZlpTSTNGOERK?=
 =?utf-8?B?NjM0UTloK1VsczV4cnNId0daQ3BjUmZxVGtEMlppK1g0NFlIWUdpbDdwOFpI?=
 =?utf-8?B?OTR0dWkrenhCOFVucVFiSTR4anNza1lUaFM1cHlLNFdnTWMyejUxZ01EeU8z?=
 =?utf-8?B?aldGY0o4LytnRFNobm5vRnBtM3BVc2dJTWVhTUlJd3JZaGh4NEh0bUp5SmxW?=
 =?utf-8?B?MEZqWkdpTkJtaXNrQnRHbm91N0ZKV3kzNXVjTXJ6d2Z4VXdNdFNmdzhJMVFD?=
 =?utf-8?B?UjNLZjNCQXc1MlBhK1E4TzlvZnV4Zzg2aWlqUC9CL0VOZGNvZjZLMVREZEdi?=
 =?utf-8?B?NFNzRnFSRURNOTE3ckQ5MTJJSUVzTzBYU1A2Rnd5ZU1nbC8yMk9CNUJJeFhS?=
 =?utf-8?B?cm51cjlMVGZ5TnpsWG9JcnBNa3ROR0RkNThmdGxhOFdSMnR5SCtkTzRIVEFC?=
 =?utf-8?B?WWZEQUJhZW9BK1JqZXVQU1IyRlByUHBxS0ovVXppSVIxdUtlb21ZRkJjMHVv?=
 =?utf-8?B?emh5TW8rOVVoUWdDclcvZWFNTmJUb2M1TWxnb0xlT2kwdWFIVGZoS2pza05v?=
 =?utf-8?Q?2Zv1ncq41Z+xcinAiOsMDBigL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7009ba19-5e26-4045-5db6-08dd35e713c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 04:34:34.1894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Piz8IsZGBBKVbsdsG3zCyWpkZNCKNNL8QwSuMyf84yWqgQxMQynYSrUoabGKkfayFG2mCTvmVwc1HAUj9EJfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
X-Proofpoint-GUID: jG2U8sWT_z4aUZvTJ3qsxbK83D8ijhus
X-Authority-Analysis: v=2.4 cv=EeoyQOmC c=1 sm=1 tr=0 ts=67888c5d cx=c_pps a=YmitjTGdGiwdiEq1Q8pHfg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=7CQSdrXTAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=yLRRl8fl34JnaJj8QgIA:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 05wPiaLf6FQiEGhjLxm5r_mEC0BBkoK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_01,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 04:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209933

UGluZw0KDQpSb3NzICYgUmljaGFyZCwgaXMgdGhlcmUgYW55dGhpbmcgZWxzZSBJIG5lZWQgdG8g
ZG8gZm9yIHRoaXMgcGF0Y2g/DQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogQ2hlbiwgUWkgDQpTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDk6NTQgQU0NClRvOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCkNjOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSRTogW09FLWNv
cmVdW1BBVENIIFYyXSBsaWIzMi02NGstcGFnZXNpemUuaW5jOiBhZGQgY29uZiBmb3IgYnVpbGRp
bmcgMzJiaXQgYmluYXJ5IHdpdGggNjRLIGFsaWdubWVudA0KDQpIaSBSb3NzLA0KDQpUaGUgIi4v
YnNwL21hcnZlbGwtY24xMHh4eCIgZXhpc3RzIGluIHlvY3RvLWtlcm5lbC1jYWNoZSdzIG9yaWdp
bi95b2N0by02LjYgYnJhbmNoLg0KSW4gaXRzIG1hc3RlciBicmFuY2gsIHRoZSBtYXJ2ZWxsLWNu
OTZ4eC5jZmcgYWxzbyBlbmFibGVzIENPTkZJR19BUk02NF82NEtfUEFHRVM9eS4NCg0KVGhpcyBw
YXRjaCB3YXMgdGVzdGVkIG9uIHByaXN0aW5lIHBva3kgKyBxZW11YXJtNjQuIFRoZSB0ZXN0IHN0
ZXBzIGFyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEkgZGlkbid0IHRlc3QgYWxsIHNvZnR3YXJl
cyBpbiBvZS1jb3JlLCBidXQgYXMgbGliMzItY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUgc3RhcnRl
ZCB3ZWxsIHdpdGggbm8gZmFpbGVkIHN5c3RlbWQgc2VydmljZSwgSSBhc3N1bWVkIHRoYXQgbW9z
dCBzb2Z0d2FyZXMgc2hvdWxkIGFsc28gYmVoYXZlIHdlbGwuIEkgYWxzbyB0ZXN0ZWQgbGliMzIt
c3lzc3RhdCB3aXRoIGNvcmUtaW1hZ2UtbWluaW1hbC4gDQoNClRoZSBoZWxwIHRleHQgZm9yIEFS
TTY0XzY0S19QQUdFUyBjaGFuZ2VkIHdpdGggdGhpcyBjb21taXQ6IGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9jb21taXQvZGI0ODhiZTM1NGJjODU3MjRkN2I5NTIzZTk0NDM1ZmRh
YTc2MWEzNQ0KU28gMzJiaXQgYXJtIHdhcyBub3Qgc3VwcG9ydGVkIGF0IGZpcnN0LCBidXQgYXQg
c29tZSBwb2ludCwgaXQgd2FzLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KU2VudDog
VGh1cnNkYXksIEphbnVhcnkgOSwgMjAyNSAxOjAyIEFNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFYyXSBsaWIzMi02NGstcGFnZXNpemUu
aW5jOiBhZGQgY29uZiBmb3IgYnVpbGRpbmcgMzJiaXQgYmluYXJ5IHdpdGggNjRLIGFsaWdubWVu
dA0KDQpPbiAyNSBEZWMgMjAyNCwgYXQgMDM6MDQsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gV2hlbiA2NEsgcGFnZSBzaXplIGlzIGVuYWJsZWQsIGZvciAzMmJpdCBtdWx0aWxp
Yiwgd2UnbGwgbmVlZCB0byBidWlsZCANCj4gYXBwbGljYXRpb25zIHdpdGggNjRLIGFsaWdubWVu
dCwgb3RoZXJ3aXNlLCB3ZSdsbCBzZWUgZXJyb3JzIGxpa2UgYmVsb3cgYXQgcnVudGltZToNCj4g
DQo+ICByb290QG1hcnZlbGwtY24xMHh4eDp+IyAvbGliL2xkLWxpbnV4LWFybWhmLnNvLjMNCj4g
ICAgU2VnbWVudGF0aW9uIGZhdWx0DQo+IA0KPiBtYXJ2ZWxsLWNuMTB4eHggaW4geW9jdG8ta2Vy
bmVsLWNhY2hlIGVuYWJsZXMgQ09ORklHX0FSTTY0XzRLX1BBR0VTPXkgYnkgZGVmYXVsdC4NCj4g
QW5kIHRoZSBpc3N1ZSB3YXMgZmlyc3QgZGlzY292ZXJlZCB0aGVyZS4NCg0KRG8geW91IG1lYW4g
XzY0S19QQUdFUz8gIFdoZXJlIGlzIHRoaXMgbWFydmVsbC1jbjEwMHh4eD8gIEluIHlvY3RvLWtl
cm5lbC1jYWNoZSB0aGVyZSBhcmUgbm8gdXNlcnMgb2YgYXJtNjQtNjRrYi1wYWdlcyBhbmQgbm90
aGluZyBjYWxsZWQgY24xMHh4eC4gIElzIHRoaXMgYSBXaW5kIFJpdmVyLXNwZWNpZmljIGZvcmsg
b2YgeW9jdG8ta2VybmVsLWNhY2hlPw0KDQo+IEhvd2V2ZXIsIHRoZXJlJ3MgYSBrZXJuZWwgY29u
ZmlnIGZyYWdtZW50IGluIHlvY3RvLWtlcm5lbC1jYWNoZSB3aGljaCANCj4gZW5hYmxlZHMgNjRL
IHBhZ2Ugc2l6ZSBmb3IgYXJtNjQ6IGFyY2gvYXJtL2FybTY0LTY0a2ItcGFnZXMuc2NjLiBTbyAN
Cj4gaXQncyBlYXN5IGZvciBvdGhlcg0KPiBhcm02NCBCU1BzIHRvIGVuYWJsZSB0aGlzLiBBbmQg
d2hlbiB0aGV5IGRvIHNvLCB0aGV5J2xsIGhhdmUgcHJvYmxlbSANCj4gd2l0aCBtdWx0aWxpYi4g
VGhpcyBwYXRjaCBhZGRzIGEgY29uZmlnIGZpbGUgdG8gaGVscCBwZW9wbGUgYSBsaXR0bGUgDQo+
IGJpdCBpbiBzdWNoIHNpdHVhdGlvbi4NCj4gDQo+IFRoZSBtYXgtcGFnZS1zaXplIG9wdGlvbiBp
cyB1c2VkIHRvIGZpeCB0aGlzIGlzc3VlLiBUaGlzIG9wdGlvbiBpcyANCj4gYWRkZWQgdG8gYm90
aCBDRkxBR1MgYW5kIExERkxBR1MgZm9yIHRoZSBwdXJwb3NlIG9mIGNvdmVyaW5nIGFzIG1hbnkg
DQo+IHJlY2lwZXMgYXMgcG9zc2libGUuDQoNCkZpcnN0LCBJIHNob3VsZCBwb2ludCBvdXQgdGhh
dCBjaGFuZ2luZyB0aGUgcGFnZSBzaXplIGlzIGFuIEFCSSBicmVhaywgYW5kIHRoZSAzMi1iaXQg
QUJJIHdhcyBmb3JtYWxpc2VkIGxvbmcgYmVmb3JlIDY0a2IgcGFnZXMgd2VyZSBhIHRoaW5nLCBz
byB0aGluZ3MgX3dpbGxfIGJyZWFrLiAgVGhhdCBzYWlkIHRoZSBsb2FkZXIgc2hvdWxkIHdvcmss
IGFzIGEgZGVjYWRlIGFnbyBiaW51dGlscyAyLjI1IGNoYW5nZWQgdGhlIGFsaWdubWVudCB0byA2
NGtiIHBhZ2VzIGJ5IGRlZmF1bHQ6DQoNCmh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJp
bnV0aWxzLWdkYi5naXQ7YT1ibG9iZGlmZjtmPWxkL2VtdWxwYXJhbXMvYXJtZWxmX2xpbnV4LnNo
O2g9MjgwZGI4NDIyMDhlMDZlMzIzMWVjM2E4MzIyMzY5MTkzNjMwYTA3ZDtocD0zNTg5MWYxZmM5
MWJkZGQwMzY3N2FhZWZkNzE0NmFlNTMzM2U2Y2YwO2hiPTc1NzJjYTg5ODllYWQ0YzM0MjVhMTUw
MGJjMjQxZWFhZWZmYTJjODk7aHBiPTgzMzVkNmFhMzRiODhjZTMxYjYyZTFiNTc4ZDU0YWI0YWEz
NjQ0MzUNCg0KVGhhdCB3b27igJl0IGhlbHAgc3BlY2lmaWMgcGllY2VzIG9mIHNvZnR3YXJlIHRo
YXQgZWcgYXNzdW1lIHRoZSBwYWdlIHNpemUgaXMgYSBidWlsdC10aW1lIGNvbnN0YW50IChhbmQg
dXNlIHRoZSB3cm9uZyBjb25zdGFudCksIGJ1dCBoZWxsb3dvcmxkIHNob3VsZCBiZSBnb29kLiAg
Q2FuIHlvdSByZXBsaWNhdGUgd2l0aCBwcmlzdGluZSBwb2t5IG1hc3RlciBhbmQgYSBtaW5pbWFs
IGNvbmZpZ3VyYXRpb24gaW4gYSBxZW11Pw0KDQpSb3NzDQo=

