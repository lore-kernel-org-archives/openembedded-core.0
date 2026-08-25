Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65135C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:28:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21992.1787664484911712527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 06:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CePN20TS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAwcLc1427779
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=JQ+gORzsPpivAlcOYRX4/Y2gAI+acJmxIRyxJSsgvF4=; b=
	CePN20TSFvG9DENVk28GL+vCkohbo1xErR5z3rhDkVbZBdvwwriyR9870Ed18UO3
	BA6SXy/M8DtdNweUsEXbylFgveZYl/EmXpnoEG+6AgwRJ+dWsy3/kwtZp0n6CLrN
	8T5k6DXFXtf+DZclH0EBmacoYt+FlCeegyct35od4ez1+uekkfqVziIy8+oI+oD6
	vM6O2tXlNK2D7Nf3ioLblw+CoKWg3Sge8gFvDuVVoKXbLEEzh8qhJP7hdp5+yGn+
	FLDJnSRiCW4dXWthDBfxbwwUJvjcRAm3ew0jMBIfe/L3ViJ/jekd2+zmYKVxRH96
	42VgN4P6tecpHOq840pXJg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020109.outbound.protection.outlook.com [52.101.61.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100mups-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:28:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Su69Bv2IPYLsGXl3kuxXJBlwf6akafh1R78bOSR+Otu/xkXJRHW/Q5H7N5EI6uEPLoo6FYtgnN32Rz/wsPv8NVx+50cu2gV7r7S5eHlbfjV7a1/at/YPkrUm4O9U8g/9XNQsw55IFpkHTvkJj0+Q6rZDGlOvuVsYPMOFemsZTWGBbGrzgqFNp38rEyAEiZKG/Rxb0u9kzgtdimfFMjoiQhVv0tgBZVXvmYIgysFvahTM+br17sF5UcRD142RGOk/244XhQtYj+ltFPb7GGVDg/s2eZ0e2bgXEtxWSRYSnip3orknyx9wLRbWL3t9nnXg4R5nkx/lYts4UsB/xrFufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ+gORzsPpivAlcOYRX4/Y2gAI+acJmxIRyxJSsgvF4=;
 b=MpVs1DZl9g0/lVhXgc9T2Q+2bmoV+VKJQtEpcCMMzaC54CHGmpB4/RxIQRx4HFdxLJ7Cdtcx49LSZje3FZOnm8Wx5AsJdnDNX1NxyqsXElgN5b2NrNGrXzFW+n4TxjnbPkDhxX1sHroDydqiTq0qYHhBnd3sRJgVz2izivxZaDwT8SGME5ojJF5H7M9RmXG1L+bDgN+uq9XB1bsTxp0pzvRWAUSYWZtwOxqbKmfOZVaZ11F/SWd75QD2B2d36ui/BO4xzVEJ1NJyuJmw1dhKFM7r1wLkHFod25/Mnyl1lED6XNMcfXQgDsCMR78cS6iQjBaMX4RhxnXqxa+4eq9Bfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 13:27:59 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 13:27:59 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "mattware@cisco.com" <mattware@cisco.com>,
        "esparlin@cisco.com"
	<esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v17 10/14] libarchive: Disable RPM filter
 auto-bidding and update huge_rpm test
Thread-Topic: [OE-core] [PATCH v17 10/14] libarchive: Disable RPM filter
 auto-bidding and update huge_rpm test
Thread-Index: AQHdNDG+gXZkWtenB0ufEqKUgXAu4LauTeQAgAB0zgA=
Date: Tue, 25 Aug 2026 13:27:59 +0000
Message-ID: <e39c4cf1-c617-4fc3-88ae-bdc8c95a4fb3@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
 <20260825013312.2695028-11-sumanth.gavini@windriver.com>
 <ed480f0c689e6f49c7f71306a55ec328a74d68ec.camel@linuxfoundation.org>
In-Reply-To: 
 <ed480f0c689e6f49c7f71306a55ec328a74d68ec.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|SN7PR11MB7973:EE_
x-ms-office365-filtering-correlation-id: 5267bb6b-65a0-4eba-3399-08df02acae55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 +C1zMz+fdVNFVOhVT14AmiHOmLUZ0+f+s3d9j6St8a6NJLKh+V/QiTXbZziCMf5u3101H3H+gCpSsOhYvdv5M5uZ6OokUpmlKaGnYHiMK3NYW1dEfLEgYomcWcMMArw+vsQeeTTZVIeK3Oml94aqkqYRp184M6OnI5Es2r+AG2J3yXN21AGkS3GhMjEhl2PLjP0eP6bT2Xq4jguy5KxoiNns91EYdpj6KkPK+V5Vagi4BzxHTrYe5C+4LutNLFSof32hafmeGHknog9KZFZYaoqzVD6ttGycUsPNGtRQHFXu3CZnI593x8w0PwuUcGTiS85EpQ6ueTMRXcCAuT51dmgCeG2HnHLJGf9yzesJLOwqehxS79zhLrfGKkKfUQDdt9ApHsBDovjpvjIXlgHY0j44e9a7sIQKtJa/J3Uwbp+F0osLAClOfeJGRsL41zHrsqzYqm9fPUZ5qPoXiMjisNksQSoZxjaT5Ko9ujtpKfnpe1IBpvWd0V7GOZWW3eR/8iRKnJKD9MAoMLqZIGgrQyL90ttVAbyJX/J+Bt/QV8wy33TU2pPtnfjAGn1KS5ZcO9xSiS606ZC2bNRVDtxEtpCHllJrxefzFfSWapjWgYPa3fMzVOyR283S4Vm6MIMARi8KP9K464ciMkohmNi8AsfwLbxWIWByFbpudHYZ47M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVg5UVpmMTZNaWlzQjEyMmNTOXB2MXNwSkJ3aGw4ei8wb1NJMFhjR1ZubHZM?=
 =?utf-8?B?eFhEcWdkazh2eGRoODVaWUhyUjNNTlJ1QzhmSEc2b1p6a0lib2pwZ0o5T2Jq?=
 =?utf-8?B?Q29OemoyK2t4dmlRNmpVMVNtQmpSQm1CTVZINEt6aWt0RWJYOW5zM3BBZnNv?=
 =?utf-8?B?UUR4RUlGV2dTUS9pYm4zbHBVOHU2NHpOK3NoQW9TRHVRQ3JTUitqZXkvMW5v?=
 =?utf-8?B?MTRTQ2kzZEM2LzJsS1pRdGVJVERRQVhZTWg0RjVmb3JNUi94QWN5VzBGQkN3?=
 =?utf-8?B?cjk2YjFUVndPR0JrVVhOSCtpWXplbDl5RlVyU2h4aDdKS1pzWnUzMDRhU2lo?=
 =?utf-8?B?dGJsNmxFM1c5bWpsZXh0dEt1YmYxLy9xWDNCQ1dUWGtoQy81QytsOGRLZXlZ?=
 =?utf-8?B?RzloZU9IaFNFV0VOUmVsOVUwbUZyYnRhcEVHd2E2alRDRHp2ZVdPaS9Sbm8y?=
 =?utf-8?B?UGNQUktxMkFERlArUUNIU0ZXWm5CNFVkckoyRkM0TkgrTnFVUGFCMkI5YVJZ?=
 =?utf-8?B?L1lDWXpBSCtVUTRnWkVWUjIxOTMzTmxuWDBiS1A2aEdQak1CSXdZNGxBeTIz?=
 =?utf-8?B?Zkg3ZU1JeUFlNnVnblhib0ZpUkZRNlNsaFVsR0hRb1k1cEYxeUtsYWZGeXR2?=
 =?utf-8?B?VGpQZkd5MlNKZ0V1TDNjYW9GUjNtMnYrS1lyOWpPcmlWNlZJNTNOOG9YVkJz?=
 =?utf-8?B?NjFDWC9NdzJzMndmL1dYMmVFakJKcGVSN3ovVFIyRFpITlRqRG9IeklVdm96?=
 =?utf-8?B?M0dpQUFjYU1Zd2h3U29Pa25INThKR09kTCtYV2hhZkg1clg0T01ZY00vODJx?=
 =?utf-8?B?Q0VpakRSTXVUZ3BnZm9BeUkrWHVFM2lpQ2J2cTlMZy9nV05XZHFBMjkvVHll?=
 =?utf-8?B?VG5vR21YZlFlVkxGV0VGUjhjVmVZUmsyUVhhTnp4WkJ1S2ozNFhpSkduMXJo?=
 =?utf-8?B?Qkd3NlNyTmlJNFV1MHFSRnhOL291c1piSXFUZUhkTllMU2ptYkZlTkJFSm90?=
 =?utf-8?B?K09FRGFBcDQ3aVc5cnVwVlRGZU0vdDBTeEpwY21ueHFQcXhDVEpIWm1EamVU?=
 =?utf-8?B?b3ZTL2llbHR6WnNLL3l4eHltdHUwcENZRE5BZWdoM1BMUk5RSXA4TklRd3ds?=
 =?utf-8?B?dnlhc1hLM1pJdTZnT2FiNlk5eU4vUTl1eDFEVlZGbUN1RmdpQ3NuWlRvd3Ux?=
 =?utf-8?B?dUN3ckw4VWFRV3ZoeDRWYzlabDdLQTUwdFNwVytHanR6UVNjbmhBSm9lRENt?=
 =?utf-8?B?bzFDWE5IbUxmR3hXamhrSDZxcGpCamJ4dzA2Zk9YUWF6cW9INjRLTWNWNkh0?=
 =?utf-8?B?MGNPVEtwV01MZUpHVUp2RVZPSFAvNGxRamRxbU04Ulo2UEN5bTZRR05Eeno3?=
 =?utf-8?B?Tm40aldJblZaT2lsZ1dkakVNQlZGZHlOYXlVcTVHa0ZOSjIrcTlDbEZjQ2hO?=
 =?utf-8?B?V3BMOHFJc1ZPN3ppRWI4RGZhaFEyby9BZHRKdnoyc1hITTVJSnZHbVdVbWt6?=
 =?utf-8?B?cjRWaWhvZkZwTU41UVpaNVZMSktVZWN4Rk9jbys4MGUvbFZibkVaNWRzTVNP?=
 =?utf-8?B?Qm5OMjRtTm5tL2puZlRZcVJyb0RqTG81R2tEeWdqbU1Hb09iK2RySXZ5WVpq?=
 =?utf-8?B?WWJlZHZMVVZHRVJIK3FXOHBYU29SWUhYQ3FGaVN5SHlVbE14R3JpdWdCQlZU?=
 =?utf-8?B?Ym5wVEpWeDgrVThZc2lTWmg3RUNhcTVyRnNOQmw0ZlZSa2hTQk5IUXdWRFl2?=
 =?utf-8?B?T1NvWDczOHljVG5Na01BQ1pvRHJsenB6SDJuem45ZWptcWd0VDNFM1NiQTN4?=
 =?utf-8?B?ZTk2ZXhNaWJjVVhuV25NTVlBRHRpMEREcGtSV3hpeXFlYUo0RFpNNm10cHRH?=
 =?utf-8?B?UUJVZURIc3VmYW5Lb2xOZjRrRjlKNHNzQStRWHNBbWJTS1hxUDRjVVNZYkJm?=
 =?utf-8?B?YjM1d1B5a2tEOFphdmFJUVdDd3dMNzhyZDlPejhIZndNcGdtREFTa1NNOHdj?=
 =?utf-8?B?by9sOVdGeWxLNTkzalBSaTdKanorZ1EvMU5XRjJpVGFsWlZ4Z1NCRjBkWk9t?=
 =?utf-8?B?aHNQUWpCUHRoY29EdkFCQTBETEJFaHY3OXZ5NlV1dGN1eUVMMzA1SVJ4ZXNN?=
 =?utf-8?B?aEFmRklOK29KUm5tTmo1ZFA1OVdhMEZ5RG9CSDZmMFF0MEJ2RXFtejFFeThJ?=
 =?utf-8?B?aGpsMFk4eFlvYlZjc2EyVGJad2xOY2Z5S01VSkJTamVqbnc1VHQ0TjVsblNO?=
 =?utf-8?B?dWxwNkJ5RkU4NUg1TEI5eWtLR1BiUkFweVBORW9GcjRZREJ3ZFFZRllaSDVl?=
 =?utf-8?B?L3kxVTNYZDBRVjFMNkNvc0JVdzZDcS94Q1lKWGVHSnY2UkVIUmxsb2pPYzNH?=
 =?utf-8?Q?GiAsqThaoCaaOtgV3/UBMmQlwW0mr1lYg6/tb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCF5D5B1712EE745B48FC41E963E89B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Yaxr0WUkBlOlVnEvMeJihTsmALiryz15Ra+Y41K9pFy44e7fpuTfFPId4tPOjQLKOnbRK9CpP18YqxetqC5HXcbjlUGsAG3tNggCzSY5/17DBugIZcBlCuBgDzuqEZrSomUyS43o6+zE64VJwy6jFsuUyWnzOicH//qmXdAcSeQfjpEKcCl4I29TcXpvlPLxglHkThVAHwcyfxM2rvxxB9APJGe/mkvXF4GurL7eBH91e+hOZZZogWgzByfWBhGF5kHvf1/6WhQ9NWtlGU1CSvBzZxrv/Ao/BnuxVXTwY6rueCu/zUhu7QtZ2kGyybY5yM+tXu4iIG1FB3u4NWwHuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5267bb6b-65a0-4eba-3399-08df02acae55
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 13:27:59.1782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uji1L8ZR9GGOvbLIhFuH5b2mzFWZrLQBCqyF5eHzSaJbRrxr3NdmpoAoRLuBWKaA53Lui9BgE9wRNJDXUH2heL1fxZx6z5RtaOCywktV9CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: NsjeiSwqeTsLFUwlsMnTgQB3HdyohcIH
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8d9863 cx=c_pps
 a=qWtZlk1y+0YHnbN0PxcX1g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NzkYBEk6AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=msTLWkv6KXXh-QqIv7wA:9 a=QEXdDO2ut3YA:10
 a=zqED95DPWUTvcrp2mxve:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ulu3fWWBIjZdkze-Or5g619DEogha9Ln
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNCBTYWx0ZWRfXxR1mAoXeQOAE
 B5mkd0CmqqpMfwiOlQB/ZKefJDEHtyuMXflZ0W/pjgC0wezZFHBU5DSK+b/GDiN72zUnaCIMlC/
 Eio/rJncIM9PQTVH8Bpww1NG211fBc/AlEIJEBp5NSm/DT4B77dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNCBTYWx0ZWRfX7U4nn0leBxBw
 0MFMy688/0xFuFLfgcYRXVMhbgspiFwKKB3xrHaZrgLHlXcV/kEpeVv0fAMZZomHxvDS68gSaKq
 yxL8aWm0iMrLoTbX7PUa1RWdA28v0J/h603aOXeMF2PbOFZERX7v8R0ZSdcb8+1PCaxhX/2X+8Q
 t2mwGi71F1bR3cdOEiu46reAQkUNG2/biraIDFmsoSBHRkaT4g96ULmq4lxVk8W5NubPnzIjm7X
 MGrvOAoiFZuZVEE50Z+n0qqjUjTHhHFmqiKd5kB4Nx691SCSJ/3q+0SIBKeOUqNXOGyLuiii+A2
 4GQNGoGZVDp/dDH98OmDKZ+o5thjd2wk9jWdqG3AUewA8lCQcR/H9EmMHxpd4GRDFUiIec0LSh/
 wYp/mMDSQp4MiaVnlAm/3Uw55V9lxnMb+VHVVJg3zA9CzTjrSWLi+UckpP30McuQZuBhOY7ZLjE
 vGL4c6rwZ0ixsyHSjXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244241

T24gOC8yNS8yMDI2IDE6MjkgQU0sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBDQVVUSU9OOiBU
aGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6
ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBNb24s
IDIwMjYtMDgtMjQgYXQgMTg6MzMgLTA3MDAsIFN1bWFudGggR2F2aW5pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4gICAqIEFkZCAwMDA1LURpc2FibGUtUlBNLWZpbHRlci1h
dXRvLWJpZGRpbmcucGF0Y2g6DQo+PiAgICAgLSBSUE0gaXMgbm93IGhhbmRsZWQgYnkgdGhlIGZv
cm1hdCByZWFkZXIuIERpc2FibGUgdGhlIGZpbHRlcidzIGF1dG9tYXRpYw0KPj4gICAgICAgYmlk
ZGluZyAocmV0dXJuIDApIHNvIGl0IG5ldmVyIGludGVyY2VwdHMgUlBNIGZpbGVzIGR1cmluZyBu
b3JtYWwNCj4+ICAgICAgIGFyY2hpdmUgb3BlbmluZy4gVGhlIGZpbHRlciByZW1haW5zIGZ1bmN0
aW9uYWwgd2hlbiBleHBsaWNpdGx5IHJlcXVlc3RlZA0KPj4gICAgICAgdmlhIGFyY2hpdmVfcmVh
ZF9hcHBlbmRfZmlsdGVyKEFSQ0hJVkVfRklMVEVSX1JQTSkuDQo+Pg0KPj4gICAgICAgVGhpcyBl
bnN1cmVzIGRlYnVnaW5mb2QgYW5kIG90aGVyIHRvb2xzIHRoYXQgdXNlDQo+PiAgICAgICBhcmNo
aXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfYWxsKCkgd2lsbCB1c2UgdGhlIG5ldyBSUE0gZm9ybWF0
IHJlYWRlcg0KPj4gICAgICAgZm9yIFJQTSA2IHBhY2thZ2VzLCB3aGlsZSBtYWludGFpbmluZyBB
UEkgY29tcGF0aWJpbGl0eS4NCj4+DQo+PiAgICogVXBkYXRlIDAwMDQtQ29udmVydC1SUE0tcmVh
ZGVyLWludG8tYS1wcm9wZXItZm9ybWF0LnBhdGNoOg0KPj4gICAgIC0gSW5jbHVkZSB0aGUgdGVz
dF9yZWFkX2Zvcm1hdF9odWdlX3JwbS5jIGNoYW5nZXMgZnJvbSB1cHN0cmVhbSBQUiAjMjg0Ni4N
Cj4+ICAgICAgIFdpdGggdGhlIGZpbHRlciBubyBsb25nZXIgYXV0by1iaWRkaW5nLCB0aGUgZm9y
bWF0IHJlYWRlciBoYW5kbGVzIHRoZQ0KPj4gICAgICAgdHJ1bmNhdGVkIHRlc3QgUlBNOiBvcGVu
cyBzdWNjZXNzZnVsbHkgKEFSQ0hJVkVfT0spLCByZXR1cm5zIEFSQ0hJVkVfRU9GDQo+PiAgICAg
ICBvbiBuZXh0X2hlYWRlciwgYW5kIGlkZW50aWZpZXMgdGhlIGZvcm1hdCBhcyBBUkNISVZFX0ZP
Uk1BVF9SUE0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3VtYW50aCBHYXZpbmkgPHN1bWFudGgu
Z2F2aW5pQHdpbmRyaXZlci5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL21ldGEvbmF0aXZlc2RrLXNk
ay1wcm92aWRlcy1kdW1teS5iYiAgICAgIHzCoCAxIC0NCj4+ICAgLi4uL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzMuMC42LmJiIHzCoCAyICstDQo+PiAgIC4uLnZlcnQtUlBNLXJl
YWRlci1pbnRvLWEtcHJvcGVyLWZvcm1hdC5wYXRjaCB8IDQyICsrKysrKysrKystDQo+PiAgIC4u
LjAwMDUtRGlzYWJsZS1SUE0tZmlsdGVyLWF1dG8tYmlkZGluZy5wYXRjaCB8IDczICsrKysrKysr
KysrKysrKysrKysNCj4+ICAgLi4uL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguOS5iYiAgICAg
ICAgICAgIHzCoCAxICsNCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvMDAwNS1EaXNhYmxlLVJQTS1maWx0ZXItYXV0by1i
aWRkaW5nLnBhdGNoDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL21ldGEv
bmF0aXZlc2RrLXNkay1wcm92aWRlcy1kdW1teS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL21ldGEv
bmF0aXZlc2RrLXNkay1wcm92aWRlcy1kdW1teS5iYg0KPj4gaW5kZXggNjA3NTc3MGJmMC4uMzdk
YWQ1NDQwOSAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL21ldGEvbmF0aXZlc2Rr
LXNkay1wcm92aWRlcy1kdW1teS5iYg0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9u
YXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15LmJiDQo+PiBAQCAtMTEsNyArMTEsNiBAQCBEVU1N
WVBST1ZJREVTID0gIlwNCj4+ICAgICAgIC9iaW4vc2ggXA0KPj4gICAgICAgL2Jpbi9iYXNoIFwN
Cj4+ICAgICAgIC91c3IvYmluL2VudiBcDQo+PiAtICAgIC91c3IvYmluL3BrZy1jb25maWcgXA0K
Pj4gICAgICAgbGliR0wuc28oKSg2NGJpdCkgXA0KPj4gICAgICAgbGliR0wuc28gXA0KPj4gICAi
DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8z
LjAuNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjYuYmIN
Cj4+IGluZGV4IDQ3MTQzM2U3YjUuLjAyNDljODc4NzggMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC42LmJiDQo+PiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC42LmJiDQo+PiBAQCAtNyw3ICs3LDcg
QEAgSE9NRVBBR0UgPSAiaHR0cDovL3BrZ2NvbmYub3JnIg0KPj4gICBCVUdUUkFDS0VSID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9wa2djb25mL3BrZ2NvbmYvaXNzdWVzIg0KPj4gICBTRUNUSU9OID0g
ImRldmVsIg0KPj4gICBQUk9WSURFUyArPSAicGtnY29uZmlnIg0KPj4gLVJQUk9WSURFUzoke1BO
fSArPSAicGtnY29uZmlnIg0KPj4gK1JQUk9WSURFUzoke1BOfSArPSAicGtnY29uZmlnIC91c3Iv
YmluL3BrZy1jb25maWciDQo+Pg0KPj4gICAjIFRoZSBwa2djb25mIGxpY2Vuc2Ugc2VlbXMgdG8g
YmUgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgdG8gQlNELTItQ2xhdXNlIG9yDQo+PiAgICMgSVND
LCBidXQgaGFzIGRpZmZlcmVudCB3b3JkaW5nLCBzbyBuZWVkcyBpdHMgb3duIG5hbWUuDQo+IA0K
PiBUaGFua3MsIHRoZSBzZXJpZXMgaXMgZ2V0dGluZyBjbG9zZS4gVGhlIHR3byBjaGFuZ2VzIGFi
b3ZlIGFyZSBub3QgcGFydA0KPiBvZiBsaWJhcmNoaXZlIHRob3VnaD8gU2hvdWxkIHRoZXkgYmUg
cGFydCBvZiBhIGRpZmZlcmVudCBwYXRjaD8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cg0KSGkgUmljaGFyZCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJIG1pc3NlZCBhZGRyZXNz
aW5nIHRoaXMgaW4gdGhpcyBzZXJpZXMuIEkgd2lsbCANCnRha2UgY2FyZSBvZiBpdCBpbiB0aGUg
bmV4dCByZXZpc2lvbi4NCg0KLS0gDQojIFN1bWFudGggR2F2aW5pDQojIFdpbmQgUml2ZXIgTGlu
dXgNCg==

