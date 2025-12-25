Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF726E784BD
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 02:35:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132730.1766630147937525077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 18:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YarwPbJL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4454a2e570=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP2KLTl4000334
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 18:35:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fZ2YDdDCplLoTdxwPdOaOxooCHM52JDIuug5mdmxlKE=; b=
	YarwPbJL3fyEACJaZHiGbBPL3MVp4fTllrcsx1wF1C3yTjyHtcqEBMxlAAu14NMb
	dagbjwpvWODPoh7mdgFgXbDp4rtsin4dn15765FBTG3O+5MQdlVy54lPQ+Pyh07t
	C0C1SsivsvnL1M5gQGjZyGH1IGvSMkz3WoK5JrcFTx3/InmA0drNUPlX3pBH4GUm
	EHd2nZET4eKlaA7LD57FJ2x7KSpor/orvSERjEVK6BqDvOZqOA6ICeijJUpcDssg
	XwH4zkuqag9++hjjtiWwECV1v1P9GHMtdefjdj/35eL47n4QSVgb24f16H8taEBs
	p++rGI/m70BWH8IAmHEhtA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4vjmn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 18:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/APyeBCDxksDEPkgT04gwfGLvoUFBFFW62ogbDLQj7YjiwdSAxpRT1S41Iy2c5La4gekdtg8N9jWJCmKTbJ+Ax4IGHrD1LRjyXVJEcWJUMOWp4dlIk32q7u+8KQSOw1hlPXNSp3/swWh43mwGQx0774xD1B73+5zjP1aWz4kxV1WwGwFZ6a0lVGe1dUYIsQ3mQdOHiYK+FiLioOKTXBF9Hjp+vsIJXNoL4tPmoE1aWaqA996J4biEZP1Q4c3pneoecqcEJggRxKsfMG62mk7iKbr0pzYlyGnoSWLkZ9Eg7eV1oACZGhoVSL3GU9v5joBC8eaT2sD6lFo/uWMvzrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ2YDdDCplLoTdxwPdOaOxooCHM52JDIuug5mdmxlKE=;
 b=v5PBVzWn6bevzQTnYlAAhoaOxyBZIZ7VrVnrCHdGeM67WydcoUH9jSdVu3MaBRqD9MeuWaXj5KVOe3SVsAOgesra579j5cClGoottXwSm71iC47N/ZihVKNyle6MXkk1niaoDc9cF9UOARnT+lHZB6U/Za3noJa8nGZH7j5FOO2gAswIEOyQC7PbS5IuWdfP19nZ7BsQGex5UMmm7F+o1mxmcEy/HkjySCsAJSrrDxMXqPa2KsATx6kORSX4xBucDZXf2R4CPqkCSlpKa6GyOCtW6RpYVbvuFPux80R2oxkyDrhlO1nEbqOAjNUaVSHv8jhUIvcMmGiivwUP1mp/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 02:35:44 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 02:35:44 +0000
Message-ID: <58f97151-088b-4b98-ab09-7291b1db7a00@windriver.com>
Date: Thu, 25 Dec 2025 10:35:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
 <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com>
 <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
 <473904dd-5f19-4331-91a3-4ccdab694c1c@windriver.com>
 <CANNYZj9sUP6xxkOLauwXuGAZH17HM3zkmAzQHSp5vx7b5Gy2VA@mail.gmail.com>
 <8da2cc05-7587-4264-843d-aa2e57cbc161@windriver.com>
 <CANNYZj_LgEZvfNiKua=bmTaC0pyvCTKr=fDmWiDRV5Vqp20omw@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj_LgEZvfNiKua=bmTaC0pyvCTKr=fDmWiDRV5Vqp20omw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DS0PR11MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db748e1-1e14-43ee-aa55-08de435e4d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SXhuSnlDMUpkbzBvVU1NNjNVUVhQZ3dteDVpeUtIbURURTZOdExRTlhuZktU?=
 =?utf-8?B?UFU2dTI2WVRTZXpwaS9yTlVjVFFjVHlRSUVQTGpCV2w5cGdLT3pYY3hsVUUy?=
 =?utf-8?B?b0pWaGpYazRHMmw3dTVFVUlOSzdlS2FRbUYrVE5UY05NM05WNnhQcDBJa0Z1?=
 =?utf-8?B?bzFqdnIxUHArcWhTcHRPRXlHbGluaVFWYnozS0l0QUVMd0l6YTEvb0JDSWht?=
 =?utf-8?B?ekYxWVkvQTc0K3lDcXprQXdSY01KR1JmQmRaNWNQWVJSOWFEYWsxa3RLc3Bh?=
 =?utf-8?B?dDBLWVZWMXhUUnV1UzBoOGpCSmpNT1RnM3Z4ZkQ2emNMNElNM2U3RWl0M01Y?=
 =?utf-8?B?MVBScFVTWDlCNjExQ0UybENuME1sbHpJYW90OWRSc1Q0VGlLUTQyV3VXNXlQ?=
 =?utf-8?B?VXpkNzFDN1pZR2RSSXJoQkVVelhLSjc1cEhBd3FXMlJVS2gzU3dMNnF2dlFk?=
 =?utf-8?B?b0NlRDhWSnhqOFJ2c0UrQzl5WjM2aWdYdXVXVTBhdXQ5Z1BtTFNRRmpTNStZ?=
 =?utf-8?B?ZWszbTBrRloySk5KUnloSkF2ZzJEdys2N1MyWHZZSXNaRmlUVm1CSzRYUXBW?=
 =?utf-8?B?Z1I2S2hvNmNDS2Y1MnBVdHJQVkJYUWh6NTE2TTRBeVRYZTRLSkg0RzJNQUpy?=
 =?utf-8?B?NEJYbkZvNWptSEJTQjFqSXVSU3FyYjZOMWNaVXlITDhMQzk0WUQySVBoc2h3?=
 =?utf-8?B?QVBXU2FZMUYxZk9TUW1ZTVZTaE40eGFFWHJzZUFpR1Jla3NGMFlKQVpjUEJz?=
 =?utf-8?B?K1dTM3dRaVhPREptZGFqL3V6cFUwNUFBT05UeHVSRHFHRVZyamZ5UnBqaVdM?=
 =?utf-8?B?KzdRTERvdG1RcUFIdXdLNE1qbTU2NTVVaTkzV2wvbktZSzNYaWxnNUFNNzht?=
 =?utf-8?B?Y0pmWjhzNUIrNDRFcVVOZVZMYWl6RmlYRkJZR2d5VTdYdlZ2bUk4eHNkNXRZ?=
 =?utf-8?B?aStKSS9Sa3pXdmxiYU1UdWRIeWF5U3NIekVMZWpITzZvN0ZhdXhLRWNOTDJ0?=
 =?utf-8?B?NGZrL2l0NWRPa29mUjIrekFkRVlKVGV2elVBa3hKekVxVElGMmI0dFp3KzJo?=
 =?utf-8?B?MXZWTk1NMjNPZ09YVUZaOXM3RzdCL2tBRjRHekRObVZRd1pPcGMwUDFVVTlC?=
 =?utf-8?B?L0JWMVVNMXlhdVRNVUZrelNUV0dvaGtqeTEwS3pWMUMzbGIveXF4V29sSlBE?=
 =?utf-8?B?Qm1rNjY4cFdIY3YvNHVpQ0FLcDJxN0pIbTV0MzdvMm0zK3FLTDloTkNMMXo5?=
 =?utf-8?B?eUR1WjA4bklwQlduQmI2Z01pUGk2VmdmME03OTdkSWxxcDg5OWFCaFhzVEt1?=
 =?utf-8?B?SDcwdWxMcGRkWUVJT1R5UmZRTHB5Zk8yY21wWkhsclBFV2VrZWdMSHV0R3kz?=
 =?utf-8?B?K0ZwQ3RNdUJzcHVzcGZibHJsbXc1Lyt4TVdkcGRIYnZGVmozeUpwME10YUww?=
 =?utf-8?B?TVk4NGhETnBjWmlKN1EyK0h3L25ua0FqTFZhbTZrSFZKaEdEZndzK2FnaEpv?=
 =?utf-8?B?VlZrVHk2d2pVVkpOK3ljMEhwYTFpYWduUVhPdnZqcVRPOFhHOE5aRFU5UGpB?=
 =?utf-8?B?SEVmY3JUWHY0azBYcC9KM3hHTDl1RUdyUDZDbkdhQy96SERmZ3N4YklHVVhL?=
 =?utf-8?B?THlkZnNFdkVKb2U0N2xWS2YzZTUrbWY5M1lCMldRYzJMZGFNTXdVL21VdmhB?=
 =?utf-8?B?L2hYTjJUdzRhVFBXNDNYdWt1enR2dUhXYVJVdGx2MnVtTUo3L0ora0t1RlZr?=
 =?utf-8?B?a1dIcE9ESHNPWk9WYmRWY0Rubks4Vit0TmlhRWpzWVRlYlRVaUxCUzB4dmRq?=
 =?utf-8?B?bHp0dWRFMTBJQlVIakdwMnYxYUhOUFF0SmpkVWVoRXg1UVF6YTdLNW0wZ1hB?=
 =?utf-8?B?Q2JETklZcFV1ZlF0NEJmWmNPeHZqalVnRXVBa25qb2RxV1M0VHI0cG5GbTlT?=
 =?utf-8?Q?vFEtO5fOxLqZRBo+g2eULfq+NnHymEcc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0NuUldkQnR1bzBkZzNMSlRiY0s5VmEzcExtUzAxL2JNeWhZYks2QzRIMUU1?=
 =?utf-8?B?STlPMzBaVWlqVE11OWE5S1F3V25mb29VVFJWS2d5OGVyYjk4MzFQRDQ2QUVW?=
 =?utf-8?B?bUUvMDIzUjRYb2lSL0EzZEhkTzN2M0Q5a3I4T3RvNkgwM25COC9rekpybEsw?=
 =?utf-8?B?VWYxUlRmQW55YlZwWm0wRVMyTzFmeG9aZGVXS1loeGFzcmtsY1JCQy9IOFk1?=
 =?utf-8?B?ZFI5dDc5M2txWGQ3QUJyWHprVmFlSE9YSVRob2RPK1VpelBJMUNudzlsUU4z?=
 =?utf-8?B?eTBycjQrVWFpeUtreU1KL3Z0RDJORkVJVUo1bzBGSGJjd3luQWFpSWQ1bW5t?=
 =?utf-8?B?QWZtcGpnMnUrT1NhclVsNzFxeWlKSEVudElaUUFSV01zMElRK2lnS3VUY091?=
 =?utf-8?B?OUNNNjFZUHZidDJxdmsxZlRBWmtRcFFEbjA4cG9KSWVrMnZ0WGFQbHR0Slor?=
 =?utf-8?B?RHdscjhjMzNXYno5SEo5TDVHRkdOam03V3czMmpJYllaTDFrSmR2c0pVeTI0?=
 =?utf-8?B?ZFlVdFNFTUFpMHpURjRoODA5cVdxVzFhVHZPa25yVVJpazkrUUVQamZ0YkxL?=
 =?utf-8?B?ZWFkVGYyT1ZBeE5jLzZKUUpTQ2wrT3VEV1FXaDlXem1lVktVUGh4SHh1ek5C?=
 =?utf-8?B?bHh0QzdwS3FQMWRBV1dSZy9yZzdreDJrYitmbldjNHhKL1BKZEx6dGUrVmFT?=
 =?utf-8?B?bXRDN1JZNUtQY3FodTllYzFJV21jQWV0Mkd4aXJJV0Zvbmx2S2UwZGNsYTVy?=
 =?utf-8?B?K3NtZjhwVDFUcE9nVUNXR00rRmlJa0RySjZqSm1LSzhTMCtOYjNMSThCRGVT?=
 =?utf-8?B?OVZGVkFBejMreWJIcnd3QXJJRHJId0k5L2g3OEpSZFlsdm4wNWVRbXhPRGQw?=
 =?utf-8?B?c09naERWYWp0Qm5Pb2lIN0JvcEJwRXFGOUlEbDI1YXRaWGRBZEFtR1JRbHZT?=
 =?utf-8?B?YnROS1hsN0d6ejlKMWRqNnp1aHZWcURTN0FMbkNqdE9UL3pVbGJDUzR1SkNo?=
 =?utf-8?B?RE5vT3NOSVJMYzVVWUg0NnNtMlVhUjNEVGdVODIwdHRUT2VvcXRhQXJvRzBu?=
 =?utf-8?B?VHVPWGM0THR2STRRQkhwcldvTysyVHhhQlpaTDdGTmtRUGpzTVcyZHVzbmIy?=
 =?utf-8?B?U3pZVTA4b1BuYUh5b0tuSUdjRnNKUUJtUDNxZmZFOCtEZWU0OStwSEJ6T0Z2?=
 =?utf-8?B?c2Q2TXFKN2lIU1hXL2MyaXBLM0d0Y0VuU1JlT3R5RUI3djJMQldzVW1XTFYz?=
 =?utf-8?B?b3prUC9uVXluLzJuemRjRDE1RjhGekRmbElBMG5mdEtrbTNrQ0x0K3ZmKzdn?=
 =?utf-8?B?cFQxbDlNa1I3QWpoZHdzempySFpLUkJKTGM3WDBJdE12clZKS3RCU0pMZ2xx?=
 =?utf-8?B?Tk5vdS9qTlhMNWZNTWhBOTB6ajd2aXZHU3grRGlqUHl2Q01MazhLUi9SeFRJ?=
 =?utf-8?B?a0kwbC81dzhhT3J1NkFFYS8zZ2Fwakt0WjBkNlErcUF3WU1SVFYwQktWaVlY?=
 =?utf-8?B?cFoxcUNPWkRLSkdTT2cydE9XSW51dUQvczkvNDNMYVdDV2hkWHRneHdUcVJi?=
 =?utf-8?B?V2Z6czIwQktIT1Nwd3BqQkFFTW1WQkJabXNza2pGMnVMU3llOXFQcWZPZGRq?=
 =?utf-8?B?SkhBbUZUTkJFSUxJRHFsdCsxVkV1b1p2ZWVOYzBYS2dETDFUOVY4VUdPU0or?=
 =?utf-8?B?MnBVcFV3QXpPOEE3amF0MlFTaGxWZlhrL29YcDhvbXVzUkRkNENZeEp5TnZP?=
 =?utf-8?B?N1ovQVJneEVlOWppZnIxcTZISjV1U3pIN2JuZXYwaXdQWFdTMjVYY2oyQ1Vx?=
 =?utf-8?B?RXJhUkxSdXYrTzgyZi91S1JaZ2p1ZS9UZDVYNUdMWEI1Qjk3M3QvenZjMUgr?=
 =?utf-8?B?Rk5hc1o3TkdCc0h0VkdGdDk2TWdiT256YVFUSC9jeUVieFdYS29TR2J2N0x4?=
 =?utf-8?B?MUtCLzZpblJLSGFRZ3JvWnNWcnNockUzcTQ0cGJWYVhRRFFPbDYwR21hQnBY?=
 =?utf-8?B?VjlCSnpmMVhWM3FuSGhnRSt6TXJEZFVCckE5eHFNZ3VwMFdaUWhyYmZRKzlP?=
 =?utf-8?B?OHNTUy9qdTVEbHlIOTBxNUEyMDZJNSt4UFZOSnJXME1kb1F2NXVuUmxSR2dE?=
 =?utf-8?B?THZtZzYxcFFJdGN3U0tBa2lOazFDVy9pMUhEMkRPVzhIRWlPU0J1ZWQrSnA5?=
 =?utf-8?B?MllLdGpFaDIxRndrcFRnQlI0VWFvdlljTUZiUm9YKzJWUUtEbTIwUDJrczFC?=
 =?utf-8?B?d1RFTTdJNFNQc3dqcmM2WHFQSWFhRk41RUQ4ckhUWTdLS2tXUTVnaml0QWNE?=
 =?utf-8?B?MmN6MFVrNFJNNjB6T0JYR1VpUXZaenFsYm1IQlkvQVpGNUZ3Zmoyb1NZZGF0?=
 =?utf-8?Q?JAY8qLtC5jNeX2kE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db748e1-1e14-43ee-aa55-08de435e4d89
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2025 02:35:44.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+sTRkPsNan8AkaLbdvQbAdIsvYsgTQMPJP002Umj8IJP3XzHlLv7lD9cosAqarWx2xG90hwgXJ+e5jjQEoo4qWGg3cQtzoN4le5mwNGhHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kmmddx5x2yMueRiHmXZS24YRMdgv1nIR
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694ca302 cx=c_pps
 a=z9epfWMNo9LgPPq3nTJR4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=KN4wSMZ27O074ZDi21wA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAyMiBTYWx0ZWRfX8sNLEN6pttn9
 tjQDf6f1O8I7IpA9clWW91MZxvujN6ud3rHFGDFyCXf47qpj8NOS7BRFLUl0/ARP5aPQ5dBoKMG
 7+ga6Msls+/HL8FiXE8XaAAL4+vnnanM5yU8TXIoR3X6Fery1pcrdH+dHqFXP2lAmYJj+IaRmHG
 Yy3lTqQhPebIzGZjzJKivOijki6P35b8XEWTDB/6dJsjV1aI6sxxtWp23lc0BfD6GPTKPd4IS5L
 vqCHzIFXeqzN+5dwLd0Ny9eYgYik12UuQctrxNbiFB23ICH1ODuvgvyT9/rzOcWWrz1mcK1ZlaR
 /vtJmXPC6id9T0LfUnPCSb7HiVvCwkH80aDhOq3TwgPOh9IkFM1zGmVVAqBCnKysZzEDXihDPfq
 gDheUsjVc7k8IJDfDJgngjP57mjGoVqkCwJH08Dy4mtQ68Wzh0XU89OiUjV9qhmr7HNJ0yFjdpg
 TbtdMyjeGCDI1erKk9g==
X-Proofpoint-ORIG-GUID: jB0y61ZXSuq-Wr3Y0wYq5e_LS4zptHK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Dec 2025 02:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228544



On 12/24/25 21:58, Alexander Kanavin wrote:
> On Wed, 24 Dec 2025 at 13:39, Robert Yang <liezhi.yang@windriver.com> wrote:
>> You're right! All test cases are passed in 6.17:
>>
>> # TOTAL: 1450
>> # PASS:  1121
>> # SKIP:  329
>> # XFAIL: 0
>> # FAIL:  0
>> # XPASS: 0
>> # ERROR: 0
>>
>> So we should hold on this upgrading.
>>
>> I didn't use core-image-ptest-strace in previous testing, but test it manually
>> with core-image-sato, so I got the failures on 6.17.
> 
> The upgrade has already merged, as it was needed for the kernel
> updates. The two failing bpf tests were patched out so that reset can
> pass.

Thank you very much!

// Robert

> 
> Alex


