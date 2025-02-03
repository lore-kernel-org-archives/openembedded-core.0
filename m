Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD70C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 22:19:43 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.43])
 by mx.groups.io with SMTP id smtpd.web10.101797.1738621177520468270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 14:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=T6Js97VJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.43, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDBy3gXaqlfxnSJe+Rbey/Tf8k2HZ0d6NgqNFS1df2S0OPVl2kVgc+UBj8YaSKJNrcN/ALnoRB4E1VNW7qkE9CH1dqQg6PN+LHCdGJb5Qw0mYgCSFSbui4xvXtPSaUzlWr4FXshh8fxLI751jOkkndw7cw3Fi6+NrsjdxlHwKbCqyc9nyWGxISCIPSIwJyMI/8b2EVaR9htI/Zg+QEhuJb7Y53+FTZqNiqpqHhIjtpgEABB6etBGo1Epro5PFOdNCUG1rT7ppl5T0yenudUXJaHPCpso2QpBKm3WFIDC3iMrSS1A2cH27jEqb8DkDWj8v28BOK5NevCvOWMReLTm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQtK8z+t/lsUXI9lzLBkw98feWVH0bnWNem4V+rwpOY=;
 b=B0UROn04To4rOMAEwUcMFMWvXgItwslrf3HKd0gFzhgza7KukhKV5PGkiMevmqfnvc3y038tFHicpBvtK1xaLTGk7S6ShMEqs/fTaXfyz85uz1LwkHatc1a07WbWdCRT3mefWgBfhMAji+MhCfYAOfawISem0f90dD6zxkr7axQsuxMH5S9Xh3p3DBKtfmNlDN643Auja98FgiuhHCUGg3/h7ih/SWKrKsDNNPPeoC5P4SSpFtBWEicjA+7kIC7tzT1sP4tKy8LVwbKMOaWHIVCbwNmr2tfgksQBWxBRCKRU4EGXtnaxMveO90UIV3ZyKbEjSrgMWCDteh8fDTTl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQtK8z+t/lsUXI9lzLBkw98feWVH0bnWNem4V+rwpOY=;
 b=T6Js97VJFJohgpa2VgvEKGDa/wQzPl/V2rQr1PHoODba2ciOAd4eOQk0BjuuVEGL6eyXoF45paBuDziH4brBKmC1iiryPFht9cIYknCOhF2V+QL1xLi3dGEDq+K1SQZbiXfMdWFpn6wkf+jNhmxOlOO2HmI5gqI+GnNkg5TzkltxHvpENx3tCuU8AXwrYTtEemzt3Fmq6JTj9M7HFJldy4nrLTMvi+hpgJb2LvwLhjqnhlNqNakT5+ZwvVAYen7PqMG/OpvUVmbKcA18BjrbqxYRKFlzaPV3w0bs8+0qXLPvFlLcMW3JWlyO+5mGhUzO7uw7DU0NsLdAyemmvVULkQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 22:19:34 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 22:19:34 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Strange behavior in sstate-diff-machines.sh
Thread-Topic: [OE-core] Strange behavior in sstate-diff-machines.sh
Thread-Index: Adt2e2zuDqfbEJfWRDSo3WEf7sDerwADQNqAAAAM8aA=
Date: Mon, 3 Feb 2025 22:19:33 +0000
Message-ID: 
 <DM8PR12MB54300A067D077BCEED12ADF58BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
 <9c3a268725aa40db3cab0578208017733bd24f57.camel@linuxfoundation.org>
In-Reply-To: 
 <9c3a268725aa40db3cab0578208017733bd24f57.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=244aa807-8214-4702-9766-8928fe676577;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-02-03T22:11:57Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SA1PR12MB6727:EE_
x-ms-office365-filtering-correlation-id: 64852ed6-5739-4239-48e4-08dd44a0d672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N1prYUFyMlJHWDVLdUtRSFN6R20yV2kzVkYwdXJEbWlFNVhOYWU0NUVPQm1O?=
 =?utf-8?B?Z1QrS0M3UkJMWmFzVXIrN1YwQnJTRitQMklZeXdkWEFVaFRpZGMveWNRTXFD?=
 =?utf-8?B?SHFoZkpnN3JxdGllTlllRGxHNzR0N1k2dVRNeDJvczFNR2RmZFVYdWJUcFFT?=
 =?utf-8?B?YU9qd3Jyc3Mzck55a25mdk9UNjZ4L2N3K3NjUkdCYzVpUnlDUWoyOHd5Z3A3?=
 =?utf-8?B?Mkx4eVRNRXcxQjdqOVMxKy9lT1NURWVXaVpVUlBzTlFtNUE0WjRNMHh2cUM0?=
 =?utf-8?B?RFh3a2J6SUpjRVhGTXR0VzNEWS9rQnRiMUdXN2pEdVBRMEQrQTVvTEY2cDRn?=
 =?utf-8?B?algva1NOc0syTkFWeTc2UjA2ay94T3QvblZBWHZYYm44TGdmSHRCRTA1WS9n?=
 =?utf-8?B?akdUL3g4aWcxcjhpYVljSnE1dGZLZ2V5R09QNFRMczZJUTRNaktKUkxKUWJF?=
 =?utf-8?B?WWlYTVM2YnQzMmNGYnZwaWlCdVVHTXhmV2FHTEt2Z1Z6Q0dKOGkxdW9pV2Fm?=
 =?utf-8?B?bjFnaUVLNDhVYSt6dkkyVGRXRTFkbW13UlFjbFRjMGl0Q1RBY21tbEtnMzJF?=
 =?utf-8?B?dWQrS3U1Z2UwQ3MvU2Q1aEQ2TmhtRFhzQjRVYUYwT1dQVHo5RTlWSG1PMWpo?=
 =?utf-8?B?Q2pvVk9DODMwek1sNEsrOGorOGNaNmZBWU8wVU93dnVsblkwTDk5aFNoVUtE?=
 =?utf-8?B?ZXcrL1VZdVRzeEdsaVNJOElwVG1ZcjZKUVBJb2VRc0l6K3dxUlRIV25nRkZ3?=
 =?utf-8?B?RnBoNHU1Q04zakE3eFBzbnFyMkJrTGQ5c0htT2dKYkJ2aW5PKzVBd1pFN2Rm?=
 =?utf-8?B?V1ZKU3FFdFN1TE9zTnJKTGg0VFVrNXJ6L1l0NHdSRG1SdWlUUzF4bWR4eU1X?=
 =?utf-8?B?WkE5QjFsbHZPc2NXSURMM3pFY1crTlk3bUtFdmx3TnhHREdnOXpNZXR0YldI?=
 =?utf-8?B?UVNkQjdIbTZ4TU9sUXRITVBJVEdUMFZEMVdaZ29EODNQM1NRRG8rZlpoci9X?=
 =?utf-8?B?d05aMjRmemtLVVQzeGZJRzJUdG9wcEdzNWo1NmhJZVRrUHdIQUZ2OVdEcXdk?=
 =?utf-8?B?c3d5MTZvK3RNM2FBcVo5VG1hejlsRWFlc0JqR0hDUnR0WW5USlhINXJTZCtI?=
 =?utf-8?B?QS95UlVidXQxNXVGMlAvdDI1bitCRC9ob1ZKTkZ2R0s1bU9aZG1KazA2MVBi?=
 =?utf-8?B?UklRU1U0eU1QNThkNlUzMlBMbno2N2VkQVRkS1VjbW5RZzNBT0NGRHFPell4?=
 =?utf-8?B?emVBOUdCVVhQODBMcFJOSFhGdXo3Zno0RVFmRk5zaEo0YlFTZERqK0UxcGc2?=
 =?utf-8?B?L3o0WVVXc1BrTEZ6bk5sUVk5OFpvSjFrUzlPenpjaU1zVUJGZmhHenhmeHRi?=
 =?utf-8?B?c0ZocnlJN1VBejNNdXVvV1h6eGwrbkFzdmZ0ZUYvZXFvN3ZXMy9oaFoySnB5?=
 =?utf-8?B?cVEwakhvZVpEWm41N0wyY2hqOHpGL2d1emtPRXhSY1hHQ1BtRWZicEVNQmtz?=
 =?utf-8?B?OHhCZk9UVTRCYStwRnc5TXpTeDZqeVdtakl0SWxHdVBKSFJxVTN0UnptWGZ3?=
 =?utf-8?B?UXNBSVpSdm0rcElZUllZZjNiNWY4UGVzWXNIOE4zVDduTXlvd2tVajJnakhQ?=
 =?utf-8?B?SEVwd1NzcjhabFYram1uRUVmT0hYKzFNVDBUNWFLUk9HNVFYZ3N1VFUzMmNS?=
 =?utf-8?B?SmF6RTRMaFBGUUtRZkVvd0M4WWY0b3Q1eW9yR2VmODA4b09iWGl4aG5MRWFz?=
 =?utf-8?B?MUZkRUd4MVB2ZFUzTFA4OWFhcTViSzFRcTQyS0ZVQVhLcHhET09xSzBoa0g0?=
 =?utf-8?B?TGlsT3l0SzRJTFk0WUtXMFFSTzhnUkJ6MEtIczh1Mk5OaExjRWw4dC9rRmZu?=
 =?utf-8?B?ZjJUc2YrQXNkTlFrdTYvVjJBanRXNTJFNHBFUUNpMmh2UmZGeXMxd0JFd1d5?=
 =?utf-8?Q?m6KsCJfXcbEBoby13ntSJL3yMgqvrvt2?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tk1zcERLcC90bEVNbkFvY3FIUlBxa2ZuMWJpRUtvdmVYUjA0WXhucTlnSTBp?=
 =?utf-8?B?SjFucXVYejhVU1ZaaFFpTy9rM3ExQ2dJSTh3NWZRYlcwdk1QVEFzL0ZDSDBp?=
 =?utf-8?B?QktISnVKUEtpZUhYQkRianI3Z2R4K0Y0cVJaVHgyMUU1L1JlUWhiaTV5NTRE?=
 =?utf-8?B?Uk9HNnNhbS9mell5NjFuZlIvWFBoYlRxTUt0aXhaRHkweTZ4ZStXNi9XVmoz?=
 =?utf-8?B?SjZyKzNRemZJWSthNHNpOGRPdTVHT1puS1o1QVBJR1FEUVA3a0h1Y1pEbmF2?=
 =?utf-8?B?d3g1ZXJRdm11ZElRMVF1WXl6KzdTYjF5RU5xYWRDa2Jpbmk1VFZUaktTQWI3?=
 =?utf-8?B?Q0JTYkROVW5NbkliMjlmWERtRENwemVGbmVkTDVXQ2JRcnlZRnZHY2EwZmk1?=
 =?utf-8?B?dndhWU51Sk5RUy8yWVhvUk41VnpsczU4cHl2OWRBVlBrU1lVeVVyNFI4K2ps?=
 =?utf-8?B?ZmVnUWJEWGhFM3ZNL0Jidnc3a1F1WXczQm9FNWR3eWlGVU96akIzQVQ5bVVK?=
 =?utf-8?B?ZnQ2SVg0Mk82UGtIVjdDMFdPN2w0QUFPVE5iMENUYkJuV2U3VElYYVNxTFJ6?=
 =?utf-8?B?K2NBd1dkbWVmTUg2ZlFHWE9vN3I4eDI4WHUzTjYxb1d1MVRLWEl6UHFnR0dt?=
 =?utf-8?B?aWhkQ2tYdGY0ZEQrMVRGcWI0ZjZUWEdiRnAyQVYrbFVuVWV3SDdIRWZ3ZmVw?=
 =?utf-8?B?NVZlb01RUmN3RHNsNjdiN3h6NXl2dHJuRStYSVhaWFlLL0RkeWNVWmpzbWZN?=
 =?utf-8?B?Sm5TdmRUc1BDN05EMHI4TkYrSUM4d2FhaWtyWW1EekhBUHV1bjU1eDh2cnJU?=
 =?utf-8?B?SmJlUzZCRTB2emFMRHFZbXpwY1grTXBzNHE5WFZvemorOXMyUzZPdkJuTUxS?=
 =?utf-8?B?bzEwdmYxakNYSVkyT1dHU3R0QXl6T0M5RGpoNHJTNmo4dkJNMWxmVjl4eFN5?=
 =?utf-8?B?aitoU0Znd3pWL05zY0srSFdUaEVRVmhlRlBOU3czSGtsajZXNXdhS2ljeFZz?=
 =?utf-8?B?S211ck10Mm5IYmVIUytpSUk4Z1pmRG5LWlZOcFJnSkh4RG1JTXZ3UFR4Mk1B?=
 =?utf-8?B?WXY2REV1R3pHZ2RHV042NENWQzhGQjl1YXgxNnBINkcyYmhybXBDbkFGNG82?=
 =?utf-8?B?WWI5SWgybTdSZEloSGMzTEFwVWNEdmJyd3VHMk8zdEJCYlAzSXBvZ3JxNmhR?=
 =?utf-8?B?dG1OWW9LVGFGWjdPY2syR2wvQ1NReVhRbElqLzQvY3luMFRiemdPZVFoQk54?=
 =?utf-8?B?ZTRIMFR3US92UWZIS2ZrbzdPdndZZGZNWmUremhheEFMalJ3M1dEMjBocEtG?=
 =?utf-8?B?OUFzMFlpSjJvUlVJUFExR3lDUnF1TUxVYjVaTzdLZFRlMlcxWFpXZWxraEFH?=
 =?utf-8?B?NEM0SW9DS3hKQ3FwY21tM21vWldRRllDV3pOZXBYd3FkaUFUMENkdms5NCtJ?=
 =?utf-8?B?T0MrUjdaZ3cyekFtbkt6clo3VDJmeTlNYmVaeS9VMlgvQ00vdzJUS2lEVGZn?=
 =?utf-8?B?RmRBaVdheUxWa1cxMjlkZStya1RUUmk2elJOZkc3dTQraDNDSEROMDdFeVZk?=
 =?utf-8?B?d2lPSzZHcmgyaHdndTlIdnBVTXpoRXpTTndreklpNERkdEpzaCszTXljbUM3?=
 =?utf-8?B?Zk1KMVV3cXV3UHpjbTNoWW5YN2R4NCtlL1hpbU4wVWNTdUVmdWIxMUZyaVhk?=
 =?utf-8?B?Y2pUSDBkcEd0ZFZRYm9JTFdMcEtpT2J6R21BRHJkbXVHNnUrQmlWVVk3cnJk?=
 =?utf-8?B?bms2NkFXWXFPRzJ1TWtXSEdaTVZER3pSMG5RUEZxbHl4b2NEdlMxdnFEWW12?=
 =?utf-8?B?SnRKUVZ5Tk1kc1NabmtNay9BQmU0MHBoU1FZR1dCTU1wYVRHUzhXYUc2UjZv?=
 =?utf-8?B?YjFZTEFWZXpkMGMvNTRDekhQMWlVN0hZNlUxU2lCejR3aHpZL2QwMjB4L2c5?=
 =?utf-8?B?Z2JVU0UwcUVXR0x4SG43ZlR1NTZrQ3hhd1Z0aWxxU3Vrdm5iUFhOZy9objcr?=
 =?utf-8?B?Z1Y5MURmbkU4VDNiZ1pZMlNFaytIRzVzS0RxdHNtckNpRXhuMG1xT3NhRmV3?=
 =?utf-8?B?RUpxa0c3UlM3TTNSTFlJbEVNc056NHI2NUxLMXE3N3RYdmo5aUxhcHE4R0Nj?=
 =?utf-8?Q?374slX2Gxa/0/LoBPXxcWfC1g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64852ed6-5739-4239-48e4-08dd44a0d672
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 22:19:33.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEsY1JVK3kX2w3qzUGsoQUZEMRb3Iewr1lqRBD9hbikdfyEqnuanPeJJBTC6euS9cE+Na3cwKqKWB4qHzt1L4KSGqQxtx16tg0AT3Kn6/6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 22:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210738

SGkgUmljaGFyZCwNCg0KPiBJJ3ZlIG5ldmVyIGxpa2VkIHRoYXQgc2NyaXB0IGFuZCBwZXJzb25h
bGx5LCBJJ3ZlIGFsd2F5cyB3YW50ZWQgdG8gbWFrZSBiaXRiYWtlJ3MNCj4gb3dtIHNpZ25hdHVy
ZSAiZGlmZiIgYXMgaGVscGZ1bCBhcyB3ZSBjYW4uIFRoZXJlIGFyZSB0b24gb2YgZGlmZmVyZW50
IHRoaW5ncw0KPiB0aGF0IGNvbnNwaXJlIGFnYWluc3QgdXMgaW4gZG9pbmcgdGhhdCBhbmQgd2hp
bHN0IHdlJ3ZlIGltcHJvdmVkLCBpdCBzdGlsbCBpc24ndA0KPiBpZGVhbC4NCj4gDQo+IEknZCBu
b3RlIHRoYXQgdGhlIHNjcmlwdCBwcmVkYXRlcyBoYXNoIGVxdWl2YWxlbmNlIGFuZCB0aGF0IGNh
biBiZSBhIGJpZyBmYWN0b3INCj4gaW4gdGhpbmdzIHRoaW5ncyBsaWtlIHRoaXMuIFdlJ3ZlIHN0
cnVnZ2xlZCB0byByZWNvbmNpbGUgc29tZSBvZiB0aGUgdG9vbHMgd2l0aA0KPiBjaGFuZ2VzIGxp
a2UgaGFzaCBlcXVpdmFsZW5jZSA6KA0KPiANCj4gU28geWVzLCBJIGNhbiBpbWFnaW5lIGRvX3Bh
Y2thZ2UgbWF0Y2hpbmcgYmV0d2VlbiB0aGUgdHdvIG1hY2hpbmVzLCB0aGVuDQo+IGhhc2hlcXVp
diB3b3VsZCByZXVzZSB0aGUgbGF0ZXIgdGFza3MgbGlrZSBkb19wYWNrYWdlX3dyaXRlX3JwbSBm
cm9tIHNzdGF0ZS4NCg0KVGhhbmtzIGZvciB0aGUgaW5mby4gDQoNCldvdWxkIHRoaXMgYmUgdGhl
IGtpbmQgb2YgdGhpbmcgdGhhdCBpcyBiZXN0IHBvcnRlZCB0byBiaXRiYWtlLWRpZmZzaWdzLCBt
YXliZSBhcyBzb21lIGtpbmQgb2YgcmVjdXJzaXZlIG1vZGU/IChKdXN0IGFza2luZyBvdXQgb2Yg
Y3VyaW9zaXR5IC0gSSBkb24ndCB5ZXQgaGF2ZSBhIHN0cm9uZyBlbm91Z2ggZ3Jhc3Agb2YgYWxs
IHRoZSBjYWNoaW5nL3NpZ25hdHVyZSBzdHVmZikNCg0KRm9yIHBvc3Rlcml0eSwgSSBoYWNrZWQg
dXAgdGhlIHNjcmlwdCB3aXRoIHRoaXMgcGF0Y2ggYW5kIGl0IGZpeGVkIG15IGlzc3VlICh3aGls
c3QgcHJvYmFibHkgaW50cm9kdWNpbmcgb3RoZXIsIHN1YnRsZXIgaXNzdWVzKS4NCg0KVGhhbmtz
LA0KQ2hyaXMNCg0KDQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zc3RhdGUtZGlmZi1tYWNoaW5lcy5z
aCBiL3NjcmlwdHMvc3N0YXRlLWRpZmYtbWFjaGluZXMuc2gNCmluZGV4IDVlZDQxM2IyZWUuLmI1
MzZjNDIzZDAgMTAwNzU1DQotLS0gYS9zY3JpcHRzL3NzdGF0ZS1kaWZmLW1hY2hpbmVzLnNoDQor
KysgYi9zY3JpcHRzL3NzdGF0ZS1kaWZmLW1hY2hpbmVzLnNoDQpAQCAtMTIxLDggKzEyMSwxMSBA
QCBmb3IgTSBpbiAke21hY2hpbmVzfTsgZG8NCiAgIGlmIGxzICR7dG1wZGlyfS9zdGFtcHMvKiA+
L2Rldi9udWxsIDI+L2Rldi9udWxsIDsgdGhlbg0KICAgICBjcCAtcmEgJHt0bXBkaXJ9L3N0YW1w
cy8qICR7T1VUUFVUfS8ke019DQogICAgIGZpbmQgJHtPVVRQVVR9LyR7TX0gLW5hbWUgXCpzaWdk
YXRhXCogfCBzZWQgInMjJHtPVVRQVVR9LyR7TX0vIyNnIiB8IHNvcnQgPiAke09VVFBVVH0vJHtN
fS9saXN0DQotICAgIE1fVU5ERVJTQ09SRT1gZWNobyAke019IHwgc2VkICdzLy0vXy9nJ2ANCi0g
ICAgc2VkICJzL14ke01fVU5ERVJTQ09SRX0tL01BQ0hJTkUvZyIgJHtPVVRQVVR9LyR7TX0vbGlz
dCB8IHNvcnQgPiAke09VVFBVVH0vJHtNfS9saXN0Lk0NCisgICAgZm9yIE0yIGluICR7bWFjaGlu
ZXN9OyBkbw0KKyAgICAgIE1fVU5ERVJTQ09SRT1gZWNobyAke00yfSB8IHNlZCAncy8tL18vZydg
DQorICAgICAgcHJpbnRmICJNX1VOREVSU0NPUkU6ICR7TV9VTkRFUlNDT1JFfVxuIg0KKyAgICAg
IHNlZCAicy9eJHtNX1VOREVSU0NPUkV9LS9NQUNISU5FL2ciICR7T1VUUFVUfS8ke019L2xpc3Qg
fCBzb3J0ID4gJHtPVVRQVVR9LyR7TX0vbGlzdC5NDQorICAgIGRvbmUNCiAgICAgZmluZCAke3Rt
cGRpcn0vc3RhbXBzLyAtbmFtZSBcKnNpZ2RhdGFcKiB8IHhhcmdzIHJtIC1mDQogICBlbHNlDQog
ICAgIHByaW50ZiAiRVJST1I6IG5vIHNpZ2RhdGEgZmlsZXMgd2VyZSBnZW5lcmF0ZWQgZm9yIE1B
Q0hJTkUgJE0gaW4gJHt0bXBkaXJ9L3N0YW1wc1xuIjsNCg==

