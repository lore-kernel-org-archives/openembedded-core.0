Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9EECD342C
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 00:43:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29216.1777941835709904510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 17:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UnY2SELm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=958555ecb6=quan.sun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6447Qp5v4045031
	for <openembedded-core@lists.openembedded.org>; Mon, 4 May 2026 17:16:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MTue6xNbdrhZ+KSeM3ru
	kdU97IqWGUzJBwHLKlmyCYw=; b=UnY2SELm0kv7N0WtqCKZh4+Hq1gjqI8nmgz0
	3NkIx69zzkgmxUBB1Po/MlYnsH8bFi/5KnV2J05hpniWzW94ZF6uKyljvIUBYkew
	TtQmsg1hYGY0ni2EmRcE41Jm+Sx1frsOdsGoadpZZx//oXR8Vyi497jpjDIAWIlq
	1LRI2G8i36CCIDaoB6R01PO5TopiAuQx2zou5wV8GDLeq3BYaKkoCOkAF4YFfKu/
	7ZHowWIl6CWgo3TdL/TZb1icx88qcEswhPZZmy7HL/gVSUO5Q1BGdtlzlHwG4uCB
	5VqzxpaGQq3RlKVgVpI0v0usTWauIztqnh4J/1YrwFkMZcTiYg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchytgw3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 17:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I12PVblFYJsnYT0QkmBp8MScG6ARPRtCRQpUlX2I3r1ElxYz9zehOfUYu49lbUixHL7CcOCTgQGqDqqGfFfBcRO3WB0je01JCaoycoAn0cp2/gIMbGDH22mTtHrkd2zWVSReSYzX4EkgSULJLJYcipQi+cFZBwmYYkDJjdSHn0ASflprNoIGCUUyMJadlsjSz9RO5xggR70DeIqyPEsjQ5fY0oD0K7NuXCbE/dIqu33ai2s6vEcjAJUN518uG1KPlLzQFO9HGT/8uHpbJHOtReEacYKDKAOdAj0fvATxxMUgs1YmOag5Zw89HxUD53N6yeQjXZ9nxQ1j1D7chVlPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTue6xNbdrhZ+KSeM3rukdU97IqWGUzJBwHLKlmyCYw=;
 b=JkmZUslzqLGYOCDAh43mB7DBHkDVr9boHrUdTURjCp2L/yk7Cs0t2eP5dh+4sXjFRCiYCMb2J21msJbmamXS8LbHugrN00w/+YgsoDqEpZyY9NI4oTENYRUz/1DGb1mJCZurpUA+Cb4kxwoXjzTudkL5B1ZSSU9dCvvzIFnXTILR/2YYbH1lF6HtIRiBB7WhRnrwLS6x3cnLSdry1We95IiXe26fvZ1i0n9cKKBtfZULSMKmpkaxl9jxDygTcipJd7V70m5H0CEnLE7vBj3vrcApjw+eNOJL876dQ+iHOZsHgee71YsMII4AyPboJce6bLsj57a0p0Xg3AvGJf0vIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 00:16:40 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 00:16:40 +0000
From: Quan.Sun@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
Date: Mon,  4 May 2026 17:16:12 -0700
Message-ID: <20260505001613.1203967-1-Quan.Sun@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DM6PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::40) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: e07b0f18-e31c-467c-c2e3-08deaa3b9468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|29003799003|56012099003|18002099003|13003099007|38350700014|25016099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	4AZeoX4PuT6nrHAgko9YpqEuWwCeRMrwriu4ipg2h8YMmzYhIR6mgmzrDCSEtg6HPX7EedUMENUzOibdlX6jG00gdIxWUkBWocjPA7GhmznxoYojMEtQWgKO+mbkz5mBXv9DQJUFYCMNyrm/m45X1eIdG4B0OR8fcEXEAPd/NMla0IGTA4izlyEdfTUF5gNv9cL85WMQfejG7qi1zBIZPz7ckAlKm83hJDs/G7Fw7uyNi7r1aLeygHQXW0bIH3nyrsG6ThECzK/Pjx0F+Lk+Qsv3f+N6z4L7/+oWL2fFnzzf5fVRi/lSh8am7mXkBQbufwUUrE00xQwn3ER9+POESzXKZXP0rf3jCW0cSVwaYTwFMLedb65n2Y7iyKqGqtMvHYaK05i4CCXr7F+4mSsJiOJ0vxLTcil1iu+PMjHUX9NhPz2wa3VnKJyGZNEjLJ9v0oqBZd588A4vr3S7HamvIJvtqglK+JDd+NUIe3nhiK2uApieBou/Bs8Ek3w1ehF3DOhZLF4SdxOodsfUDkqDYJBGhmsf/DhXrJVgyQcr++KPAmBv3t4J/bFGI4DLrTKU0XjTW6xH3vJrcrC5+CtA7DLFa6YqAfA3ohnmK1d2m9se32Ml5t8wBsvqNCC0+xhtip07Ctcfcw9JACTDpuLXXfwzmKW7gVxA/sYAWUhFRYvstOul/ErwdLNj0N4LHsJp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(29003799003)(56012099003)(18002099003)(13003099007)(38350700014)(25016099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUhTL29vRC9lR0dCYlNYQXRMZ0hhc096NkhHa1psUXZ3TS9QbFJSU1BjUlZy?=
 =?utf-8?B?bHVkZEkwYkhXZUpVZklnVTM1RVZtTTdPb0g0SCtVSHMrQjVqeHZ1emgyZ0dF?=
 =?utf-8?B?d21LNzZSaHpIWEZEM1NxY0lVVUN2U2N2bGd4bXBYR3J5RWs1aEo3aHVXdkR4?=
 =?utf-8?B?RE0raXZWdisrdVVFODJXZTl3RnJEeDNzdlcvQTkwcWdQVXZCaVJzUG9FS1gw?=
 =?utf-8?B?dlo3djZSZGJvNkZJb3JPeUtobHNSS3VjV3EvV2FIcGlLMGJUZDkySEcraE4y?=
 =?utf-8?B?alA3TW5ia2piZ2Y0ajJQTEl6Rm04K3RsQ1VlclI3dzZBV3FUNHJqMURBQzlj?=
 =?utf-8?B?MjJiSy9xcldMYzhPMitlQXczQnd1WVlmUjNjTVNKZ2QzWlk1RTY5RzM0b200?=
 =?utf-8?B?akN6bGVvaGVVL1Z2WFNLclR6a3dscFoxUk82SldRWXU2Qi9VUGRkR3RZdEc3?=
 =?utf-8?B?ano3N3JIa2x6UkVPU2QyZEI3RHkveGFSNEhzMlRKRzVub0tUQkFHeWdZdldl?=
 =?utf-8?B?RS9CQmlLM0ZFbm55eVhkc0RlL1FjT2R0Umhaay96cVlSZkNZUmlRYndMb0ZE?=
 =?utf-8?B?Q0FhbjdNUkJLTmdaVkdsMWx1WDlOdGVUNHJQMW55bmtwcTBaZ0IyRkFKNk1D?=
 =?utf-8?B?bXBiOCtQOWhtMUYrVWIrMWJLSzNkOXhKLzRna3dkc3JNbXltaGlzaFBoNVIw?=
 =?utf-8?B?Ymx1SWZoWmRYckZIcTlsSjluUkVuRWxZN0tybVFMcGcyZ2QxU0RVS2RDVXhO?=
 =?utf-8?B?YXlOcFRaMWVRTGtvbUtlTVYyMld5NjVWNTdnWWlGM0xzdmcvdU1HV0UySGJZ?=
 =?utf-8?B?UE1yWm9NbFdHRmhBK3lWVjR6Q01VRXo1ZWU2cVA2Z2M4OFJXbjloKzY4VlF3?=
 =?utf-8?B?VDdONG5QUEl0VWw0RDlhV2I5NzNqZ3V6aW8vUUZJeEJqSnZJRkQxblZWbXh3?=
 =?utf-8?B?V0I2Wko5QkdOamNqRG13dEVoQlRSa1loSmxXdlRqa3N1VnZSNWg0MkhVQUJP?=
 =?utf-8?B?WVNZRGlLSDlVcE5YQWlsTVRXNXhnK1NHamVodHR1ekgra0tvQkdjZWtQS3JE?=
 =?utf-8?B?bHVLREJzZmdISmxPR2JsVkJnd2ZtTXlVSVFvUlpiYjVwSTFaL0xKekE5andK?=
 =?utf-8?B?UVgzVjFtMVJLTWt6WXFqTEZ2czJ6aU5ndVVOK2p2azB3UDBMYkxRVWZFdUhH?=
 =?utf-8?B?S0NSK1lXdWFIUzBCV05JQXJ4RzBtNWVnamRLU3hTSlNhRXdFTFpnVDFFK3A2?=
 =?utf-8?B?WjBlSTNYTGVUSjZJbm1yKzRyYnpQMFZ4VU5LTGhsUTIzcXBUN3BmbnFBdVJw?=
 =?utf-8?B?cnY1K1VoMllzcnc5eXI3RGNEU1VuUzFySk9XcWpDUkFFenRMeDZpRHBFMWRZ?=
 =?utf-8?B?ektRd3VaNDF5SXM0WHVZaTRjd3NTNER6cTh4YXNGYVRHMEk2MHVCNzJsLytO?=
 =?utf-8?B?SlJvdzZ2MG5qSTBJcVRwL2R3cUtIV2dYZzBmcmM4azJBRFhwL0pSaWVWMGh1?=
 =?utf-8?B?RW5DelpDTktHemdPZmVNYlVncWp3TUhQV3NTSFJPS1RoWkRESGNNaFd5Qmo5?=
 =?utf-8?B?c2tzMDBlamJvaEx3RUV4dWZyWjBHL2F3bVNCdkZsM0pXRzRwajY2N2Z3cHA1?=
 =?utf-8?B?dnFUWVpmaHNWK1Rick9UYnRJVUNuMGpEUjZQUldnVnhJanhUQkkwWmZBSmlM?=
 =?utf-8?B?clprRlBFNzgxakNsU3JUYkZXbW9KQk9PS0hTc0pFdWkrZElrWTNMNEtzWU1a?=
 =?utf-8?B?ZzAxZlpHb2hDcWlyNi9DUkl0cGFyZFFNTm1OMG1WaGRtN0tkUzZ3aTdjN2Nk?=
 =?utf-8?B?dmIzamV4dC9ndlZxNFZmYkUyQ0Z5L3NQQ1FPejdlSXZDTEM5U2U5NnZjN2N3?=
 =?utf-8?B?cDZvT21KWklwZ2Q2S0hDSXBWV1Q5QkFPb1VsRDArbGRkWnFqcUx5VXpmQXA3?=
 =?utf-8?B?MWdMNVZYc2R4ZlJPQy9MbnpubFRKZGdkRmh5MUFyeVZGdGlKV3RCcCsxdFV3?=
 =?utf-8?B?cUorQXRhUWxwYytnSHRPb1lUVHFlYXZZNjIxQVJaVTA0b0tHVElqdHlFQlIx?=
 =?utf-8?B?ZTRRRlU5UVFSTFdxSEwzVmFmVDI4bE1RR1NQUmVzRHZMVTM5dHVrRmhjSGZI?=
 =?utf-8?B?cVRHeTU0OHN1V21LZ3Jwb1h2WmRPb2lCKy9wMSt2V05jK1pUdmhua2o1Q002?=
 =?utf-8?B?dm1PT0tjRDZOYS9oSEVwMGp5c1VuaElwSW1iVzBOMXA5cmZrdlZwV0JzNEZ2?=
 =?utf-8?B?NUNSd1I2T29NQ2NRNUlUTnExOEtrVkdNS3p0VEtmaXJyazZIMnk4aTJzay9E?=
 =?utf-8?B?eWs0Rm5qblIrcHl2L0ZrUVVlU0trN2J1RUgrM3FEdGdLUlJNdU5Pdz09?=
X-Exchange-RoutingPolicyChecked: 
	NSUt4jJW40khbAFukK1YmQlvuEk0+5EXN4LJeGBKP09kSY3clHazYFDOJ5YQpCrCMEjs8Oreg3pLdlpOcIsQ0ajwTUBLo7q+zr6vparNpBIqIFVlBxXLVkKbIW1bZiaF+nI+1JqFIRzRd/URGM4wkxLYPZMmdxc48QwE1C+c48LTv/P44K6/9D5MEuc4AZ62yke5Q5G+Szk5lllSsQlvc0sdxOyeMfxKrKdnQvI8Ekr2Oszq4Ghe/k3iu3KquNJKXA50ZUOjb4ObXaqTFE+HqTdxAIHmvee04O3nEBKpnJG4KB8b7JowQhK0Qf8lKF6Tf0JxjpDsF/uloeknCpToSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07b0f18-e31c-467c-c2e3-08deaa3b9468
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 00:16:40.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dZU57xyyAZaThGtKWxBDC2jpgdt4skpRulNjn++jJTdQz4u1pKMIdiqHNjnbUr3Oof508K917CyRwr3uebkug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfXyOt3Jmrg0hmX
 c3OHQO5/6pSEjnqoFc60Kq3N7QEAVNoxhNLexgpSB6VG4ju4qqzv8fFqu91qGRKNfhg+AOrdAkR
 3V3PkEdLeGDn3gxf0d8hOa9uvJafHOi7LhUdvnVIjNBA1Q32qNIA2NZdji4sG2t5/E0j6OPP+El
 8gNI5o3hLEF00NiqAK2MqHWELlOsVkTkqHejV8ihXWOCKmSWu3D/rZNvDOK5/vhUC83Ij4yIXLQ
 2EMnN4Hvbm7iTlgW5mqUyoAFIkTQK76jdT0fVfm5Pe9X8w6x7/Jz96Yw+iTtN3PDhKbWVmvIvuE
 1kYRD/2NgD3yTaPddx0bNzmTpKi/u4YqC/fVj7rc3rc4g43BXpmEX062MX0dtsTeD2EvRF742I4
 zpDMDt0tKDkj1LYw6qj50hNCMS3moj1tZxW7TwvyiYzRUCPF/w0eBBeh8QtV13FFwPJZBlwXQ3t
 5vjGr+cpYC37m5wLBgg==
X-Proofpoint-ORIG-GUID: Z9u7AAKbSEE202MfRzjUwbGoIHWNS8se
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f936ec cx=c_pps
 a=w38J/P5V5yn3hHxCpGhwCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=ID6ng7r3AAAA:8 a=p0WdMEafAAAA:8 a=mDV3o1hIAAAA:8 a=D2nq_zG4AAAA:20
 a=kmYkUENqAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8
 a=AUd_NHdVAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=ilKATfAMAAAA:8
 a=1UCvcV92f6mJzpsoR4kA:9 a=h6vx3w8tfw8l7TVe:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22 a=p9kz6gysRiz6SGr9lVkz:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=73awMTU50e6eLoBjGbzZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Z9u7AAKbSEE202MfRzjUwbGoIHWNS8se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050001
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6447Qp5v4045031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 00:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236459

From: Quan Sun <Quan.Sun@windriver.com>

Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
---
 ...native_10.2.0.bb =3D> qemu-native_11.0.0.bb} |  0
 ...10.2.0.bb =3D> qemu-system-native_11.0.0.bb} |  4 +-
 meta/recipes-devtools/qemu/qemu.inc           |  7 ++-
 ...load.c-Correction-to-HWCAP2-accessor.patch | 42 ---------------
 ...n-environment-space-to-boot-loader-q.patch |  6 +--
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  6 +--
 ...mu-Do-not-include-file-if-not-exists.patch |  6 +--
 ...er-space-mmap-tweaks-to-address-musl.patch | 22 +++-----
 .../qemu/0006-qemu-Determinism-fixes.patch    |  2 +-
 ...d-use-relative-path-to-refer-to-file.patch |  6 +--
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch | 10 ++--
 ...ject-include-paths-for-standalone-bu.patch | 52 +++++++++++++++++++
 ...and-the-python-venv-aren-t-used-for-.patch | 10 ++--
 .../qemu/qemu/fix-strerrorname_np.patch       | 35 -------------
 .../qemu/{qemu_10.2.0.bb =3D> qemu_11.0.0.bb}   |  0
 16 files changed, 87 insertions(+), 123 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.2.0.bb =3D> qemu-nativ=
e_11.0.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.2.0.bb =3D> qem=
u-system-native_11.0.0.bb} (86%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-elflo=
ad.c-Correction-to-HWCAP2-accessor.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-meson-fix-subpro=
ject-include-paths-for-standalone-bu.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.p=
atch
 rename meta/recipes-devtools/qemu/{qemu_10.2.0.bb =3D> qemu_11.0.0.bb} (=
100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb b/meta/reci=
pes-devtools/qemu/qemu-native_11.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb b/me=
ta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
index 2e4f7328ad..506559a09b 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
@@ -26,8 +26,6 @@ do_install:append() {
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
=20
-    # Install qmp.py to be used with testimage
-    install -d ${D}${libdir}/qemu-python/qmp/
-    install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
+    # The qemu.qmp library from the main QEMU repository has now been re=
moved.
 }
=20
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 7aa593bc5d..5cadbaa03e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da3b50d8b88dc=
c0eb3d7d39b760b9e821 \
 SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
-           file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loade=
r-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
            file://0004-qemu-Do-not-include-file-if-not-exists.patch \
@@ -32,15 +31,15 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
-           file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accesso=
r.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://0010-meson-fix-subproject-include-paths-for-standalone=
-bu.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qem=
u-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-SRC_URI[sha256sum] =3D "9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c=
0ca6d6672785883a"
+SRC_URI[sha256sum] =3D "c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b6=
3e4932052a4854d6"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
@@ -74,7 +73,7 @@ do_install_ptest() {
 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs -i rm =
-rf {}
=20
 	# Don't check the file genreated by configure
-	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}=
/tests/data/acpi/disassemle-aml.sh
+	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}=
/tests/data/acpi/disassemble-aml.sh
=20
 	# Strip the paths from the QEMU variable, we can use PATH
 	makfiles=3D$(find ${D}${PTEST_PATH} -name "*.mak")
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Co=
rrection-to-HWCAP2-accessor.patch b/meta/recipes-devtools/qemu/qemu/0001-=
linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
deleted file mode 100644
index 47d6f41385..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correctio=
n-to-HWCAP2-accessor.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c333f9c4ee212297f3b9a8a6ef62396a63c48e61 Mon Sep 17 00:00:00 2001
-From: Jim MacArthur <jim.macarthur@linaro.org>
-Date: Tue, 6 Jan 2026 15:40:48 +0000
-Subject: [PATCH] linux-user/elfload.c: Correction to HWCAP2 accessor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-get_elf_hwcap was used when get_elf_hwcap2 should have been.
-
-Cc: qemu-stable@nongnu.org
-Fixes: fcac98d0ba8b ("linux-user: Remove ELF_HWCAP2")
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3259
-Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Message-ID: <20260106-fix-hwcap2-sve2-v1-1-1d70dff63370@linaro.org>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/c333f9c4ee212297f3b9a8a6ef62396a63c48e61]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- linux-user/elfload.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux-user/elfload.c b/linux-user/elfload.c
-index 0002d5be2f..35471c0c9a 100644
---- a/linux-user/elfload.c
-+++ b/linux-user/elfload.c
-@@ -708,7 +708,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int =
argc, int envc,
-     NEW_AUX_ENT(AT_EXECFN, info->file_string);
-=20
-     if (HAVE_ELF_HWCAP2) {
--        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
-+        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap2(thread_cpu));
-     }
-     if (u_base_platform) {
-         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-envir=
onment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/000=
1-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index bc8dace013..98aa6b6387 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From f2d9bc614f7edf66412209aba78aa086e65dc75e Mon Sep 17 00:00:00 2001
+From a84184c98cf296954e0c757604e969b8565eb474 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index cbdbb2105..62681fdae 100644
+index 812ff64d8..daf929943 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -65,7 +65,7 @@
+@@ -66,7 +66,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthroug=
h-to-PIC.patch
index bfc85f4842..ad00f24482 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
@@ -1,4 +1,4 @@
-From 945af9ecc80653955cbdbb7d3e28dce61795b251 Mon Sep 17 00:00:00 2001
+From 0a688e763d91c2e0e11cbe960f405442a9f35417 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index aad253a..212b01f 100644
+index 8766ed00b..581fc6deb 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
 =20
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-fil=
e-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-=
include-file-if-not-exists.patch
index 2e738abaa3..4b6ac54445 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
@@ -1,4 +1,4 @@
-From f8c1614b204c1d64af906dc70dbf4a1534eb6b38 Mon Sep 17 00:00:00 2001
+From b38315a5a6f9fc033c72bb94ff258bb4b1ac8dd3 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com=
>
  1 file changed, 2 insertions(+)
=20
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index c236b2834..2a3527a87 100644
+index f4b74ad35..3da51ea83 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -119,7 +119,9 @@
+@@ -117,7 +117,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-spac=
e-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/000=
5-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index ffbbb1ab32..f270c6a035 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 3621615790270449bf9c8a0777e8ef28eb762bf9 Mon Sep 17 00:00:00 2001
+From e4abb937ba5a6a476d31886e71e67006df22a664 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 3=
2 bit
@@ -18,30 +18,22 @@ rather than ENOMEM so adjust the other part of the te=
st to this.
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2021-01/msg01355.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 ---
- linux-user/mmap.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
+ linux-user/mmap.c | 5 +++++
+ 1 file changed, 5 insertions(+)
=20
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 002e1e668..912839dec 100644
+index b635b6a21..a5a617516 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_u=
long old_size,
+@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ul=
ong old_size,
      int prot;
      void *host_addr;
 =20
--    if (!guest_range_valid_untagged(old_addr, old_size) ||
--        ((flags & MREMAP_FIXED) &&
 +    if (!guest_range_valid_untagged(old_addr, old_size)) {
 +        errno =3D EFAULT;
 +        return -1;
 +    }
-+   =20
-+    if (((flags & MREMAP_FIXED) &&
++
+     if (((flags & MREMAP_FIXED) &&
           !guest_range_valid_untagged(new_addr, new_size)) ||
          ((flags & MREMAP_MAYMOVE) =3D=3D 0 &&
-          !guest_range_valid_untagged(old_addr, new_size))) {
--        errno =3D ENOMEM;
-+        errno =3D EINVAL;
-         return -1;
-     }
-=20
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.=
patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 5b24c18916..b54149cb8a 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 8b28a9376074067bc2d84d4f77d5c7a42433b31b Mon Sep 17 00:00:00 2001
+From e891928d2248e186c65979cf5a2ba0cff9d00824 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-r=
elative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/000=
7-tests-meson.build-use-relative-path-to-refer-to-file.patch
index a58c936d06..275c500894 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 097b75ad8310143decab92f6d1744144e7a4809f Mon Sep 17 00:00:00 2001
+From ac9a866ac807cb1542f26df07b4aad3a06342a99 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.c=
om>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index d5248ae51..2c581f055 100644
+index 41e8b06c3..ce5df4957 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -127,17 +127,17 @@ endif
+@@ -124,17 +124,17 @@ endif
 =20
  if have_system
    tests +=3D {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP=
_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/000=
8-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index af0eafb65f..f6e563ad80 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9d5deb767523ea0d1aeecb9960244c702530acad Mon Sep 17 00:00:00 2001
+From c0bfd2c5556afcf4413c81b3fda54a62f2bdd8c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-=
exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure=
-lookup-meson-exutable-from-PATH.patch
index db88766cf6..430b1aa509 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
@@ -1,4 +1,4 @@
-From aaec67c133dddda7204d23964732b4b788cbc9ce Mon Sep 17 00:00:00 2001
+From e357ac91b04f733148defe8c133ae8b2085a9a23 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
=20
 diff --git a/configure b/configure
-index 82cace1..83bbda9 100755
+index eea903067..217af781f 100755
 --- a/configure
 +++ b/configure
-@@ -993,10 +993,7 @@ get_pwd() {
+@@ -981,10 +981,7 @@ get_pwd() {
      fi
  }
 =20
@@ -26,5 +26,5 @@ index 82cace1..83bbda9 100755
 -fi
 +meson=3D`which meson`
 =20
- # Conditionally ensure Sphinx is installed.
-=20
+ # On Haiku, meson might show up in a "non-packaged" subfolder instead, =
see
+ # https://github.com/haiku/haiku/blob/r1beta5/docs/user/storage/storage=
intro.dox
diff --git a/meta/recipes-devtools/qemu/qemu/0010-meson-fix-subproject-in=
clude-paths-for-standalone-bu.patch b/meta/recipes-devtools/qemu/qemu/001=
0-meson-fix-subproject-include-paths-for-standalone-bu.patch
new file mode 100644
index 0000000000..b7d31f0ed7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010-meson-fix-subproject-include-p=
aths-for-standalone-bu.patch
@@ -0,0 +1,52 @@
+From f013e84d382bc1bd7d49206bdf47c689b0c6fbb5 Mon Sep 17 00:00:00 2001
+From: Quan Sun <Quan.Sun@windriver.com>
+Date: Fri, 1 May 2026 13:53:24 -0700
+Subject: [PATCH] meson: fix subproject include paths for standalone buil=
ds
+
+Upstream-Status: Pending
+
+---
+ subprojects/libvduse/meson.build      | 3 ++-
+ subprojects/libvhost-user/meson.build | 9 ++++++---
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/mes=
on.build
+index 3e3b53da3..80114f431 100644
+--- a/subprojects/libvduse/meson.build
++++ b/subprojects/libvduse/meson.build
+@@ -10,7 +10,8 @@ add_project_arguments(cc.get_supported_arguments('-Wsi=
gn-compare',
+=20
+ libvduse =3D static_library('vduse',
+                           files('libvduse.c'),
+-                          c_args: '-D_GNU_SOURCE')
++                          c_args: '-D_GNU_SOURCE',
++                          include_directories: include_directories('.',=
 '../..', '../../include'))
+=20
+ libvduse_dep =3D declare_dependency(link_with: libvduse,
+                                   include_directories: include_director=
ies('.'))
+diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhos=
t-user/meson.build
+index a18014e7f..6d469038c 100644
+--- a/subprojects/libvhost-user/meson.build
++++ b/subprojects/libvhost-user/meson.build
+@@ -14,15 +14,18 @@ glib =3D dependency('glib-2.0')
+ vhost_user =3D static_library('vhost-user',
+                             files('libvhost-user.c'),
+                             dependencies: threads,
+-                            c_args: '-D_GNU_SOURCE')
++                            c_args: '-D_GNU_SOURCE',
++                            include_directories: include_directories('.=
', '../..', '../../include'))
+=20
+ executable('link-test', files('link-test.c'),
+-           link_whole: vhost_user)
++           link_whole: vhost_user,
++           include_directories: include_directories('.', '../..', '../.=
./include'))
+=20
+ vhost_user_glib =3D static_library('vhost-user-glib',
+                                  files('libvhost-user-glib.c'),
+                                  link_with: vhost_user,
+-                                 dependencies: glib)
++                                 dependencies: glib,
++                                 include_directories: include_directori=
es('.', '../..', '../../include'))
+=20
+ vhost_user_dep =3D declare_dependency(link_with: vhost_user_glib,
+                                     dependencies: glib,
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the=
-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/001=
1-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index d04596d313..040931a941 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From c9f174b2f7b43e59e91f88c75c8b3e2ee30bfcdd Mon Sep 17 00:00:00 2001
+From 70fa360e5bf72b28960747da47d9b85e650ad312 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for me=
son
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/configure b/configure
-index 84e429409..1a9585e8e 100755
+index 217af781f..cf8666337 100755
 --- a/configure
 +++ b/configure
-@@ -981,14 +981,14 @@ python=3D"$(command -v "$python")"
+@@ -951,14 +951,14 @@ python=3D"$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
 =20
@@ -47,5 +47,5 @@ index 84e429409..1a9585e8e 100755
 -mkvenv=3D"$python ${source_path}/python/scripts/mkvenv.py"
 +mkvenv=3Dtrue
 =20
- # Finish preparing the virtual environment using vendored .whl files
-=20
+ # Finish preparing the virtual environment using vendored .whl files.
+ # Even if PyPI is allowed, we disallow it here to force installation
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/=
meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
deleted file mode 100644
index 524e20a3dd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 475dbdbee7ff878d113f45a1a623e9abbf0e55f3 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 18 Sep 2024 16:19:37 -0700
-Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_=
np()
-
-strerrorname_np is non-portable and breaks building with musl libc.
-
-Use strerror(errno) instead, like we do other places.
-
-Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stabl=
e/2023-12/msg00069.html]
-
-Cc: qemu-stable@nongnu.org
-Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg=
' error
-msg)
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
-Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
- target/riscv/kvm/kvm-cpu.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index e06d2126b..e1cc02fba 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1994,8 +1994,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **=
errp)
-     if (riscv_has_ext(&cpu->env, RVV)) {
-         ret =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON=
);
-         if (ret) {
--            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, co=
de: %s",
--                       strerrorname_np(errno));
-+            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, er=
ror %d", errno);
-             return false;
-         }
-     }
diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-dev=
tools/qemu/qemu_11.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.0.bb
--=20
2.49.0


