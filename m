Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265F4D43368
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 02:31:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3819.1765506677984018107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 18:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k1GBBeQ/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4441d9c407=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1SF9Z238593
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SV+fyhUKDmloA40KfCxDODM6R0uus7rD5FQyKzCp5X4=; b=
	k1GBBeQ/p3/7zKXpZuphiyUGG9nLg/ee4HZs+ieIrOZVqp0SevAf8scNha2NVNaJ
	DswCSHir626sVEBWHtSWGmRBU9lMUYVHN/RXjmAlX4iqw8IBaw7dS6+X15QWAO28
	wTZWOHM+s40pNe3Wfyrf4aturrfLXaWDQ3cIIzHddstRmypSBA3cpM2zc4TdLq3i
	6dtaD5WD+UkpBu6UKayrSF2YCvWmSs2o1Lbvyzvk3e4hTGzXWrREhe2+sym3t5cW
	EMl9YzAb7D2nK4xVDEFs3X/gdfaDk3zDXVL+3S068GlJ3wGQwfArFNIPLkJ/6q5Y
	8Pv1iyteSEyo/xpqBtYbEA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07htx40-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 02:31:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ2cdD5iz6ZtkhSfmcPTY8KH57zHxTYGWokCKjJ80ASzeaSEFRkOkpPiEBwX4FJzHvENyj3N/L2CStvK32zqm+hEty1hKM1hhZO48i8KtCajNQQB0eukQXvZNwUUOcosgppzmgznqxW1hpzBy+8/z37KIDYYWh8xHMK7tYbFEd/1shqAkf1mR1xHeueJJYUsVBecVQzZsfZSPwXuTMIXK7xGGenzgae2Tk9cCfyR9O6WsYkPnlmg2S1qxudWgvdg0rs2FyFZalAJn6rXEXjUWai3thFVzmw1YBkEHwtdyzauJ0Vw1kzjIkOM0osU9Z6ABnmQuncQDlb0EH2s+RtVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV+fyhUKDmloA40KfCxDODM6R0uus7rD5FQyKzCp5X4=;
 b=BNLoKeic/IBpSVHAx2p+KPj4xfv/K0NCVwBEQ//XmbZSCslu52QMHIF8lYARGPGrMV7UiduMoFrYbp0wYywC72pBZ3XkfmTqbnUrwSICJI30JR/at9Yx8fy1sdyq332Be0LgQE1G9vHMyhjjjXEcaMY9bAc3zwjlvo0AOD9X9pxesVeF8PDpHMku+2x3Uqt1ffxtLZzjZ64Xt/p5CRBoeEU7q3mfnFEwMohOw8J+ytLAPFwuOW3uGq3I03/+lHHh1lecsP1MQbu1N0/+KlXnT1KoFqo4bnooJUr88CRA8OLKA9FwqNBicoQpcno8C7FszeCtU58XRvUppCwZ+UYu+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 02:31:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 02:31:13 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] qemuboot.bbclass: make nameserver configurable
Thread-Topic: [OE-core][PATCH] qemuboot.bbclass: make nameserver configurable
Thread-Index: AQHcakeVy411CU5Hl0yOM9cSFr6eDbUcI6iAgAEmdSA=
Date: Fri, 12 Dec 2025 02:31:13 +0000
Message-ID: 
 <CO6PR11MB56026B46828EB185D8C02DB2EDAEA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251211024038.4089969-1-Qi.Chen@windriver.com>
 <CANNYZj_20AQEa0DPTiS7Mb+Tr7gHw3dd1+SMz6nDRN+nafQbRw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_20AQEa0DPTiS7Mb+Tr7gHw3dd1+SMz6nDRN+nafQbRw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=802fd4c3-c4e6-4030-bee3-2da984b4bb8c;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-12T02:30:52Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SN7PR11MB6972:EE_
x-ms-office365-filtering-correlation-id: 20d29535-6d7d-4756-bf5a-08de392684e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bktFUW0vc2p6K3J5MGtlT3JGYVJyUkR2MjVSNzlpckkvT3Npbm5nQmJtWTZG?=
 =?utf-8?B?MEdKZ2NmRGsrdEtFY25RWnF6ZVArVmJwNG1udnZWeU9nSU5kL1g4MFh5K1J4?=
 =?utf-8?B?TkFIRXVUMU5FUURETnVuZkNDOHVPeGJNZVdLRkZoUG5ZMy9OOG1hMitLeTc5?=
 =?utf-8?B?VDB5RmN5SGR0RXphNFRTZ1YwRDdxSVp5NE9FQXpCNVgvNkl1SGt3WldLMTBO?=
 =?utf-8?B?ZWNSYmlYMTd6UHppRGs4Y0JQNUtkaCtrKys0aVl0T1l2b2FUdk9iWHBtM1ho?=
 =?utf-8?B?UFhvTzYzTzdPdmNHanc2YWV0MFFReXVrcXMrbG1rMDlKWHoxQTBwU0JvY1NR?=
 =?utf-8?B?OHZKMWNEVjl0NUhWVTRsSEdONWZDN0RsZUcwbjQva3I1SS8wMzU1djQwb2E5?=
 =?utf-8?B?dEJtWmp6c1kvWWV0N3d4TGJqWU1QUXZQUWhmYjZJTHptWmRmbmhjQUJIbG1E?=
 =?utf-8?B?MXY2SDd2bzlVaUdFa1E1bWtNRXV3bEE5ci9DWkczRU5RcVNyNXhxOEhUSmJD?=
 =?utf-8?B?azBuQjBsQ0FDQkhjRnVQZ04rR0VjRnFCL21nZGszQ3EzVTh5ZlNjN3BRNDcw?=
 =?utf-8?B?em9wSWx3MWh0ZDJLU1lrUEptYzRvcllBVGZJd3ZkOTIyWUpxb2E4NUVRbGJP?=
 =?utf-8?B?UExja3U5NW50YnlVem15bUI2bW1LejZEbVYvOXA1amE1K1kxeVdBL0h0ZmpN?=
 =?utf-8?B?RFpaYXllQXRyalV1WnFVMnpxMFdSYlp3dUhtSzRlYjFmNVcyVXFITEl4R1dV?=
 =?utf-8?B?eENGQ1hoOFlBWkZWRXdZSHAzVkZmUmRwZnFiQ2tVZkhiK0hlT04xTmFabnVi?=
 =?utf-8?B?ZHlxbXpuczJMRndsUUtsS0NiM3ZmQ3JXV0ZvQlJzejFMWHY1djNkZ3k5WG5V?=
 =?utf-8?B?VlFlbEZsUlVwRWFCUm53NEhucXNrSFNwMFNsVWV2UEtPVkNkZDVMUmpSSmJv?=
 =?utf-8?B?S3R1UFdzTi9ZaUY0a3c0ZHNvYzBRajA0SkRxdEVTb25ucXZjUjYwM0o2L2gz?=
 =?utf-8?B?dGZYZmNCemJERjRXeWNrWGpUVWExbjVNa0VhT1NUUVBSUnVzTWhrTmtzc2RR?=
 =?utf-8?B?bDRuSDVDUndaNi8zN3RLTEJST0FQRUR4ZDFLRERUMlhhU2IwaTRTTXRBRi96?=
 =?utf-8?B?VXd5UHhGNFZPM2ZsTXdJZXlLNTd3OFpUR3ZwMktRcTJKWUVJM3I1RmRlZ3Y2?=
 =?utf-8?B?bEZmVVJIamNGaDZGU09vZEF5SWc4N29sRG12cGh1b1g1bEdlTzR6NzQ4V1Ri?=
 =?utf-8?B?NkN5L1VORHlQc01WWmluL1UvUyt3aS9MSzRlVzNzVG1zdUpidU1jaTZGWHJy?=
 =?utf-8?B?dmpqZDVIVDlDeGl3U3VucVlwYkRuYmkwLzllbHRrczlwenpLZDIrYU8wdlpj?=
 =?utf-8?B?L3hEYWV3RUwwY3RpOXB2SGI2V29wQS9PNDZnTUdMTWQ0YXlOSjV0VHJKVTFm?=
 =?utf-8?B?ejVUOXZSQzVVUWVIU1dsTzNzbFpJNVdMUmV5Vkk0YkRRMk94UUdQV3h2RkIz?=
 =?utf-8?B?czdvTjF0dTg3UGxhOENoNjV6cjVTZTNOcmpVb3lhc0UzU3Y0MWsvazl0WXJi?=
 =?utf-8?B?dU5rYkVrOURDY3BiK2dFeUJKZXA1NVV0TVRjYnY3a3hwVTlEaENueGhEMUQr?=
 =?utf-8?B?QzU5NlRaSjBEeHZtTzJWL0VadlZSY3c4TzR0TklpSHliODNnaXB2Z1NFL0RU?=
 =?utf-8?B?UWZGeWplazAzV0pWd2NXL254S1V4c1k5Z1BsWVlBelBYUE9Ha2pneVVxaGlH?=
 =?utf-8?B?Ny9qWWgrdVJFK1RyK2NRMlkzZTlua0R4MjJzUkxIRnZJWVJjcXUxc0hHWVBC?=
 =?utf-8?B?dlB0T3hIWXFSMGZESXF1ZXRCRkJQWWZaZ1hvNmNyYXkyR1MxN2Q2NVJ5cjc3?=
 =?utf-8?B?OWZoMmdIRzE4bEpXbzc1L013QVdONkh3TWFwQkQybXQ0ZTAyTHptZEpKTzNQ?=
 =?utf-8?B?Z0xOWXNXLzIyUUZzOWNkcTV3MVRacjhSd21UUFhBblhFdHBpWEpINk9nUUhj?=
 =?utf-8?B?WjZaTUdVREYzYUxxak15emJhRHNOQ2xhR1RuRWtHdVpqdlhad1ZCY1JxOVdJ?=
 =?utf-8?Q?MC5hfF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TnRNTkhJQ2RhWW15Y3ZFczkvSjdWazhqTzRNWndxQXNPbi9WMmlQN3d6b1la?=
 =?utf-8?B?dDF1MU9Sd1U5SFExRzNFZm0xQ0F6M3d3STJLWDN2bHVodExaNmVTQzhDTHNp?=
 =?utf-8?B?Tm0yL0pHNm5qNnZZdXovTEpwTm1aUTVBM1dXRGVJbnIybU1EOHJVekFNMG8r?=
 =?utf-8?B?RWpPQm9LZXYwa2wyNzBHemM1V0hlZlc2WGorRXoxdWw5d2p0TXhHcmUwOHFW?=
 =?utf-8?B?Zm9Yek1uemJ4TDJDejJMWlZwOCtwT3ZPR0c0SzFzSHViVUk5TUM2b1dvcVpx?=
 =?utf-8?B?dkU4dEt2cWxvUDFlaVpycUN0MlZuVG95NmJtSmw1YXJFRUVFOFVkOTUyZ3gr?=
 =?utf-8?B?a0d1VW5SeWVqdW51SDkvTTA2VVNZNEc3bE12Vm94aDNwWU9kUjJVcUZuM256?=
 =?utf-8?B?UWVtQS8rYmltQ2k0QVhic2RQcUY5RDRuUVhTTUFSWWg3ZzhvdEpwb2UvR0J3?=
 =?utf-8?B?ZmNEKzhwL3ZVOGlmaHpLam94WFVQa2xRZEJTdFpDc1ZXMGVZNlk5TXprQXp3?=
 =?utf-8?B?UWV0eFllM2JreUlOWlZxQmMrblB4UVdPbTdJQmIzVFdOZDZYTjlLNlFiMVlG?=
 =?utf-8?B?Ui9EQ0QzOWNhb281aWhodW1lam5ub2lUTE9HZ3RRVkVjZFIwYTRzcTh5ek5X?=
 =?utf-8?B?eWRlVm1sRkEzeEtTbTdIOG55VCtEREhsSDk4aVFHN05tWlNhTlRPTlBTc0Vl?=
 =?utf-8?B?QmQ1M0svb0FYeFYrdFljUkJHcWcxTUUrRFRTcHJvbTRPRFlKaGJWN0pYZll5?=
 =?utf-8?B?RllPRTNkMzJJV1daaGpLSEhINUl3eEg3SXdKcVc5Z1dMV0pHOWZ1ejhJcUVR?=
 =?utf-8?B?S3NNaXh0OXBlWkxVZXpabTlSZ2s4cXBVbDEyczA5R3hWRWVHSEppRWhqMm9z?=
 =?utf-8?B?WG56cnJFL05xK1RSaWFXa211Rk8xUVU0bnJYMVkzcjVwL1IySXloeFp5Snpq?=
 =?utf-8?B?aDFTYjBIWGZoUldncmo2WEZUVmhCenNwQ255Z0VNNWZRR002Z1l4L2hlR29z?=
 =?utf-8?B?ZHhNaVNkbkplUGJCalh3SXBlUDZmRGRrUHFrK05Bby80bzM3S1c4bmhkdFoz?=
 =?utf-8?B?K0pkT1RpWFJGYUpzZVB1WWlkSWxTeHFHV1p5VnRVbGdlS0dHYXAxcnlMSTgz?=
 =?utf-8?B?Y0htV1BqMTZ4R0FjS2diZkw4WmVUWHZXNVIxY0NqbEtaK1VFWldpbDA3T2Fi?=
 =?utf-8?B?WVE0RkxuN0hmY2Y5enRsWXVRZmhleTMzcXhwYWxmOG1hakR6T3A3Rm91c083?=
 =?utf-8?B?LzZEMEJETjlnOXJFdmdkTGozYWRyMGFPZ2pGdDFBYlhUOXZzWUVwSmdvZFM5?=
 =?utf-8?B?aTFnamxBT1hxcEticmZJdWx2SURBelBNai80Y0R2N3RLRGJuSU1uTWdDdmtO?=
 =?utf-8?B?TjVXTFVJMmpKQlBha0czQnFmM2grSDlHbmNtTVAwUTlBNXA2M0VvcnkxTUVV?=
 =?utf-8?B?NWx1RjgyMjNxbUhEc2hzcitCWHJYd3NOekxGZitMcWNCSjBEUFpKTW0rM0Z1?=
 =?utf-8?B?M2J1MXhkKzF3TTZTL0ZqWGJoWTBrd3BlQzNoU24wRkExUEoxMkZudzkwSDVq?=
 =?utf-8?B?WGViMElRRTlxd0hMQkw5V3F2RTJuU2Z5THlrbmx5RmkvT0RhUWkvdFE2VzQz?=
 =?utf-8?B?QlkwblNtemdacEhURFdkVG5VZjdId3o2U240TU5Ob1ViSFFQcGRRdEhiRjY1?=
 =?utf-8?B?encvSUNvVGZsTW1TbXJVNEo4bWk0Z0VmdXl6NmxURmd5R0NtRGVhRVRQL0ZE?=
 =?utf-8?B?WFROMEg2dzUrUTVqU1d4NlJJL1hGdVJ3a29Gd1R1VmlrRUJRbGxLQzhaOHMw?=
 =?utf-8?B?dDlJN3c4c3Zuanl3NlQxYlZodXhDM2JMT3Q1azMxZjZEVHdRMXdGcGZuVDBM?=
 =?utf-8?B?M043cG1YSDRnVzhybGhkbUFBU05LNTR0UWFJckxHQ3BzNTJPNWYvVDdadUVZ?=
 =?utf-8?B?akFxMFRpM0krbGFDbzZRZ1U5VXhYWTc3VWEwWTlRaE1GMG42MnlMMkhCb2Yv?=
 =?utf-8?B?a2loRExHdjdVdlNkdlp1VGFZUmYzRzJMNStMZDY5UXJjWGV0RmErRFdDS0VH?=
 =?utf-8?B?Wk83Y3Y1SUJ3b0xvaHIrdWFrajhGUlc0L3pFVUNjUEV5SHlNSTU3aUJLYWYx?=
 =?utf-8?Q?M5NcrMzs7cPjztq//Ln6u6kNP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d29535-6d7d-4756-bf5a-08de392684e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 02:31:13.4488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: si9uasNJyV8rXkyMOtTL7IZGP8s9ttfVcPXy5PTdwM0mFINskzNk2oAmRCPIuKfc+r0TpUxJyP82RtibxyES9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAxOSBTYWx0ZWRfX46j6qqWpTLcy
 BC3PsMHFkHlyW4lcrCatBPjw8N3eJV0QfJ77ya10YxGQrdolIHcQ7WOIBEL8R2US3ihpipWu+iS
 ycoW9xbALYz6oX/+y+D0GSu48I9RJp6jjkgUM2ma17eXWzTHoj++4x7T0YliHBDIsjaScGc9JLq
 bEUXTbaioCFTPH/4jnOFWvYWyzbGl+uaAcAJAKkyTJ6vGpJZSQwNEdYtAGc36K5A9XP3OkvLLY8
 3Uoj5UV84DzwovsA0X4XehEIx9OoC+yaXGtO+2X5rWunyCMlJB8+DYUAR3E0+GznnD1ZarSA3Z6
 cDJXHrUFFvja6RukeSsEGctQZVYswr4MSJM07yTZWqHotVK/mXbP6E1Q/NcMD2Yc8Yq/uD+oFcT
 SYAotbflce5+Z/CcfaP5UG8ymozsrA==
X-Proofpoint-ORIG-GUID: Z7HSK4LRYD8m9W9RnCACZg1N6acBFguH
X-Proofpoint-GUID: ml-ik3VSOId4Zy6yHmMb3MWacP8Xu_Cf
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693b7e74 cx=c_pps
 a=8tq6Qs2DEm6oQ1m+I15oQA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=8pif782wAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=tCCxIq9WfBpQReofmUEA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227568

T0suIEknbGwgYWRkIGNvbW1lbnQgYW5kIHNlbmQgb3V0IFYyLg0KDQpSZWdhcmRzLA0KUWkNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxMSwgMjAyNSA0
OjU3IFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVd
W1BBVENIXSBxZW11Ym9vdC5iYmNsYXNzOiBtYWtlIG5hbWVzZXJ2ZXIgY29uZmlndXJhYmxlDQoN
Ckl0IHdvdWxkIGJlIGdvb2QgdG8gYWRkIGEgY29tbWVudCBpbnRvIHFlbXVib290IGNsYXNzIGV4
cGxhaW5pbmcgd2hhdA0KOC44LjguOCBpcyBhY3R1YWxseToNCmh0dHBzOi8vZW4ud2lraXBlZGlh
Lm9yZy93aWtpL0dvb2dsZV9QdWJsaWNfRE5TDQoNCkFsZXgNCg0KT24gVGh1LCAxMSBEZWMgMjAy
NSBhdCAwMzo0MSwgQ2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8UWkuQ2hlbj13
aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPg0KPiBGcm9tOiBD
aGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+DQo+IEluc3RlYWQgb2YgaGFyZGNvZGlu
ZyAnOC44LjguOCcgZm9yIHRhcCBpbnRlcmZhY2UsIHdlIGludHJvZHVjZSANCj4gUUJfVEFQX05B
TUVTRVJWRVIgdG8gYWxsb3cgbmFtZXNlcnZlciB0byBiZSBjb25maWd1cmVkLg0KPg0KPiBUaGlz
IGhlbHBzIGltcHJvdmUgcnVucWVtdSB1c2VyIGV4cGVyaWVuY2UgYmVjYXVzZSB1c2VycyBjYW4g
ZWFzaWx5IA0KPiBjb25maWd1cmUgdGhlaXIgbmFtZXNlcnZlcnMgdG8gYWNjZXNzIHRoZSBuZXR3
b3JrcyB0aGV5IHdhbnQuIE5vdGUgDQo+IHRoYXQgdGhpcyBtZXRob2QgZG9lcyBub3QgY2hhbmdl
IHRoZSBjb250ZW50cyBvZiB0aGUgcm9vdGZzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFp
IDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgbWV0YS9jbGFzc2VzLXJlY2lwZS9x
ZW11Ym9vdC5iYmNsYXNzIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUv
cWVtdWJvb3QuYmJjbGFzcyANCj4gYi9tZXRhL2NsYXNzZXMtcmVjaXBlL3FlbXVib290LmJiY2xh
c3MNCj4gaW5kZXggNjljZDEyZWM1NC4uNjc3OGMxNWM0MyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9j
bGFzc2VzLXJlY2lwZS9xZW11Ym9vdC5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNp
cGUvcWVtdWJvb3QuYmJjbGFzcw0KPiBAQCAtMTA2LDcgKzEwNiw4IEBAIFFCX05FVFdPUktfREVW
SUNFID89ICItZGV2aWNlIHZpcnRpby1uZXQtcGNpLG5ldGRldj1uZXQwLG1hYz1ATUFDQCINCj4g
ICMNCj4gIFFCX05PX1BOSSA/PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJF
UycsICdwbmktbmFtZXMnLCAnJywgJ25ldC5pZm5hbWVzPTAnLCBkKX0iDQo+ICBRQl9DTURMSU5F
X0lQX1NMSVJQID89ICJpcD1kaGNwIg0KPiAtUUJfQ01ETElORV9JUF9UQVAgPz0gImlwPTE5Mi4x
NjguNy5AQ0xJRU5UQDo6MTkyLjE2OC43LkBHQVRFV0FZQDoyNTUuMjU1LjI1NS4wOjpldGgwOm9m
Zjo4LjguOC44ICR7UUJfTk9fUE5JfSINCj4gK1FCX1RBUF9OQU1FU0VSVkVSID89ICI4LjguOC44
Ig0KPiArUUJfQ01ETElORV9JUF9UQVAgPz0gImlwPTE5Mi4xNjguNy5AQ0xJRU5UQDo6MTkyLjE2
OC43LkBHQVRFV0FZQDoyNTUuMjU1LjI1NS4wOjpldGgwOm9mZjoke1FCX1RBUF9OQU1FU0VSVkVS
fSAke1FCX05PX1BOSX0iDQo+DQo+ICBRQl9ST09URlNfRVhUUkFfT1BUID89ICIiDQo+ICBRQl9H
UkFQSElDUyA/PSAiIg0KPiAtLQ0KPiAyLjM0LjENCj4NCj4NCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjI3NTA5KTogDQo+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjI3NTA5DQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNjcyMzgxNy8x
Njg2NDg5DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiANCj4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21d
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQo=

