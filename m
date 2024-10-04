Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81D2CF34DD
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 01:02:30 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.77])
 by mx.groups.io with SMTP id smtpd.web10.12290.1728003745103939150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 18:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=rGX9iURE;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.102.77, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2L8VVKYY3S6cy65wbSHtbENyPDpu4oZyYxfgnPlJoDDCjZW28Kc0Wgn+pDNXkzbJbVJuV67fcb6Hqw1J1dm7GKe+N/UU4eRs5xJJT3ByUiqWlsp26Ihh+HQ+M0WJ3Sbh6sVVifPeWzasOB9T4lYn4AEMjn25U03+05psNomfWRuK2Z9aMCq/diy5DCf6um3gVKZU4lTKJxoUU3bWlsW10pbl9cMh7hkxOE3TfovsWz0vBGQuoGyCs3yIvQN/p18D1E/nuMzBFDo/JSA8q7cnZKlZ9kpjUIT2O5oMiKlYo3yaHm+uf54odV2yXmoGkb8SReU4TZmFyWI9OZfwnxQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEwreqkLhnkRwpZY1MQc+OlvPPYPib9KFSr753vNAtI=;
 b=iuDVt6w/3l3Y+pmHhgcu6G2LdzeIdSVl9+aGyzLF99dqotRrsp6DO0xSSOo9gWhY12I8XtEMKG+7tdkhDcqNccGsh9C8R64dm7mEhYEGAT0ikEz1zKhliwBOjcp14cI1Y6HqV4BndnM8eDL2SeXdyZTcxGMmN0ATx2XytncVx+aeNp/IVwycJ8UKltwklpSn1qlHaXxu7kyHuq+qkDNgm7F71GBodQgERnjQnx4WJ5NH1ZUAkVN3BHkhgRHfgulIvaN2Dyh6wlYt24DOmfZYcvSSjDtM8zB/6XFJRFJ7q2By7YfQQ+fZ3nIExqdFFJb8aGjgQmghG274vLDAtGt1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEwreqkLhnkRwpZY1MQc+OlvPPYPib9KFSr753vNAtI=;
 b=rGX9iUREHrkqDo3bFwMSTH+AUL6KJRdSlyNjJnQ2djL6DSfGdl88hda8s5Qi0BqHh/BfsXYgbsSncFCXZRlstWy/vznVZzAICZ6gsKEGdXlvBruoUqN+00Xavr32ml3E6lJaxoeX5vwsWjTOuzY5hsJ+z+m+ahaGbonIr23OR33+do8zARBnvc+5g/O7SEeM9IUXzmPrSKvufDi4dsCth70w+8e645tU5RFS/piOcL3dm+BVgqYMEL1Aw2k9apZujC6hVTYonY/alnEke6w8C7j1vrjI/FpU+/Rr01Nrug9Svrv3jsAYUibsaVcfPzUoPxIu1XCr1iqzXuyYfebPwQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 01:02:22 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 01:02:22 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>, Richard
 Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/selftest: automatically unset
 SANITY_TESTED_DISTROS
Thread-Topic: [OE-core] [PATCH] oeqa/selftest: automatically unset
 SANITY_TESTED_DISTROS
Thread-Index: AQHbFdx+nfZjanKgn0iySxP+ZcTmv7J1j6kAgAAH+oCAACzT4A==
Date: Fri, 4 Oct 2024 01:02:22 +0000
Message-ID: 
 <DM8PR12MB54305768D9592A825DE07E6F8B722@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241003213726.2518832-1-chris.laplante@agilent.com>
 <9182e8a9fe4467a84a2c611d84c8999dbde27826.camel@linuxfoundation.org>
 <DB5PR02MB102134F975E0170DE53FC6F0AEF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102134F975E0170DE53FC6F0AEF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=92b8794a-3045-470e-83da-c6db9129163e;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-10-04T00:55:23Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CH3PR12MB9023:EE_
x-ms-office365-filtering-correlation-id: 1907979d-d9a2-4959-ca1b-08dce41033e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RitORHFvTWlhZ0lmMVJZcmk5YU1WU0o1Y3RleElMSlovQmQ1UFVUQ0FraXVL?=
 =?utf-8?B?Qi9MWHl4WUhWWDZmQkZLdkJ3UVVRYjd2bkhJL2JEYitwUTNIcDlQaE1Kc1lv?=
 =?utf-8?B?OEtaYjVYbEt6QWdteGFXZVdYS0RLR3A0cm1sT3BibXh2NGZQTkk2aWlUZExt?=
 =?utf-8?B?MTk0QW1vME5odFFuaWszV3h2bFF6ejFITjlOMmdWYkNGL0xuR2w3V2o5OUM4?=
 =?utf-8?B?dEtmeHZreDNGU3VGYzdVallhV0h0RHd5YXp2eURFZVJ0VmxXRFRxTnptNGlG?=
 =?utf-8?B?UVdDcWtnNEJMVkx6M0xyMkgzZXVwWldGTi93SlNscnRjVy9hNnB5QStsb01k?=
 =?utf-8?B?cmNNTnloU1ZhYzZiOURjUzVKa2VOUHQ5RnlKY1Zody9aaFo5US9hSHdvVFVH?=
 =?utf-8?B?QXpUQ2FQeXFkY3BvZVFmelRlZ05FOFhrTE1HcDY4QytYRDMrQTU5QS9wMGQ0?=
 =?utf-8?B?TFVKRWhuS0pnNUs3RnhRTkhYZzBMQTBtbDR3Vm9oVFFCdy8zSlQrb3oyMEF0?=
 =?utf-8?B?VXlUOUt5V09DeHJHbndEUXpBU215K0pIT3VIY2tPQytyUlN2WDE0c3Vab24w?=
 =?utf-8?B?TldmRjFaYzNLM0pvOTBOcGg5L2YzSXViSWpQNW5ZbTFFcTJzM3FPb2dIbk1F?=
 =?utf-8?B?Y2YzWmx1WW41eU9GUkZlRlNrK21IRk1LN1BtcENacjlXTHJCS0k4dWI0d2Rs?=
 =?utf-8?B?WEpNWGNka3l4TXVCMFdUelhsYXNmYmdmRWdXTncxZFB1aWh2UzcyVCs3MUIr?=
 =?utf-8?B?NFl2Wko2bW5tTXRNVHRjRkRVRHIzMjN3OEh1UDgxUURScWNSRG5VZjBFemVq?=
 =?utf-8?B?cDRSUjdraXh6NmcvU0cxajFDdGsweGMva3dObWlxYVBoU1ppY2tIVkJFNVN3?=
 =?utf-8?B?ejF6WXpFczZPdmVGYzYxaWZXUURBSFhPVEZ5QkhPN2s2aUtHaGJWcmlzeFB2?=
 =?utf-8?B?SklKWnRSU1pqSUJFN0ZxVlNlMjZDWFpmM0dhcUltcG13cVpxSEhvekN3N2FK?=
 =?utf-8?B?Zys4YkduTGovZmxQazZSVEpGT1dLWUE0UlgveWU0cERCV2xNaHdkRUFyR3BH?=
 =?utf-8?B?YVc5dFJuZXVNc0lpV2Zncm1KME9JRkY4RGFxTzN2akxLYmtMdDJiYUI1S0JE?=
 =?utf-8?B?cE00dEo1TkVxeWQ2cFRHMUpsUnF2WmJEdUhTMlRGMFhOV2Rndm0vby9MZys2?=
 =?utf-8?B?TkFrRWljYUtjRllxbUZiVWpWaWk4KysvU1dzd1FyUzFma2RwT3FtcU9oUXhK?=
 =?utf-8?B?L0p4SXA3eHpObE5kWlpCV1NaZWU3aWQrTUJXOTZWeXk3RGN1MHJMVDNHbldh?=
 =?utf-8?B?MDJRVGxnNldqQVRkcG1Za3lBRXhVOHc1Z01OZGlhQ0lzRXc3QTZIQzc5L3Vx?=
 =?utf-8?B?TEtreUYrcHFjQnVoeHg3US91dFZGTm1DZGNCejR3NnZETGtmNW9kcUNpNTZw?=
 =?utf-8?B?Y3ZHVWczZitKZ0hHOFVRelBQMG9TN1dKYVlLVEpWRURwa3IrTlQ1c0wwQ0RF?=
 =?utf-8?B?RTljTTV4andTWFdNV1JtYVZ2VkkrdmVRZzF4SVBZYURidFBwMWF1ejVZNExv?=
 =?utf-8?B?cWNCVWMweW9TWURQMm9xQzU0aWZtYVpsV20zUDNuU0ZIdG1ZNUhEeVlnOUlk?=
 =?utf-8?B?V21hUU54b2h5bFo0bEs2a0FYc1pTVU9tejZrRDFwSmtaT0taY1NGYVZCSENX?=
 =?utf-8?B?Q3lYdThscXBnTzh6bHhCdWNMRk9KejNDd09XSUYzY3IzZFBMK1ZsK1RHbmJx?=
 =?utf-8?B?SEtveWhDbzRDS2FzZkgvK3kyRVFPa2VqUDJSZk9ueG43K0Z0QW1zUGpVUnUx?=
 =?utf-8?B?dGppdmFXeHI0L04vT0ROdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0xrWjdyc3NJSHl0Q29UL0x1dW84V2Z4WENEaUUrdjIwQkN1QkFMMXZUaEpI?=
 =?utf-8?B?d3JNWTdmelhSSUpqMjM3dE5MSnhMbkdkNnRISmhYVXJHOTVwbVJhZFNKeTFo?=
 =?utf-8?B?ajAwRXNQSmhiSjEzTlhnZHpjb2JpY0xKTVplemRnSVRYbmQxS1R3ZUk1OVR6?=
 =?utf-8?B?QmZseHc4OUVSekNiOFBVNFRCN3lORVVvdWF6QzZlKzVQd1ZwbHExc1VRL25s?=
 =?utf-8?B?VUxGTW5ZOHc1WHg1Zmt2Rko0dE1VNWVkMzJ0ellIQm9BbWpGanZ2WVNFcWRr?=
 =?utf-8?B?K0lFUDZVUGdZeFl0MWc2MkcweUFhUThMWlVPRWQ2QStUWVZLcmJzSnR3UGN0?=
 =?utf-8?B?UERxRGNrMEZ6U3Ardlp5NTRUY0xGUHlRV2VxYmtzc0RoYkt6QlJGMnFvWjFE?=
 =?utf-8?B?a042UGVCVUFOcDQyckp1Y2VaOGRHc0xuOXd6WTNPcElvVURuTUdhZGxTTi94?=
 =?utf-8?B?aVRwSStwSlJZRGlIVk5LSHRlRUhxUWR4MlZlSFREeGdOVzBpV29tdDlJQm5K?=
 =?utf-8?B?Yi81TFdKUExpTnpQWW5jUVlrRE9wU0pja2lqRGluUnpBTjF6UWowSnk2RENI?=
 =?utf-8?B?ZHF1UWpnV2o1R05uSkREZlR0T25pSHgvWEdhVmJMQytzNDJyNFdPNmU1dzVh?=
 =?utf-8?B?YzFiZkcranRaS1lCNXI0MkIvWURJMWc2WXR1MjVTUFpoTnA3eFhZNmdteG1Q?=
 =?utf-8?B?TzB3bTNybTBZUVVwWEoxMG41bWJ5b0pGdk5hUHdWZElpaFRBSW1tRVNrVjl5?=
 =?utf-8?B?TTBlaEZVK2ZYdHEzK096ZFBZUHovaFJuVSsxamI2WWhieXdXb01maDV2THVZ?=
 =?utf-8?B?UzNhSkJHdHRwUEdYZnRyV0dxNkN0cFBHaTlQbEhxc3ZaU0VaTDhlV0NGZVMr?=
 =?utf-8?B?cURxZzg1dXMyZ0NJTzFjL21RMzJpaUtDSHJOOEtWUE1Lejk4cVZDZXMrNGVw?=
 =?utf-8?B?d0hqVXhhY05mcG83bDI4ZWtPaitqRzg0OUFjaTE5SXhaK2RJVXJHS1JXWWRE?=
 =?utf-8?B?UmpxK1Q1WGJoWXZPdll4YVpYNVdGZ09YVnJLUHVOUmVyWjdRZkJxTUVDb05p?=
 =?utf-8?B?OXh1NXcyVGlVSjdycHIvSG8rSEdGa0FMVGJuS3M4STZKTGZWTjVMcFdoMDIx?=
 =?utf-8?B?akhuR0tLRmFiS1ZLYnA4SXJLYThoaTVOcGFYbDlOb1lwMTVTNkZSZElWNjl1?=
 =?utf-8?B?TklMZ0kzelB4SDYxVEl1Mm9wbHpNaUxjaTJuc1hrMmZEelZMTTJtMmNWSTZX?=
 =?utf-8?B?SFFkWU93YTlnOFc2WlRhRmdPaE1yZElDcGJ2OWVBQ3oyS1dmdDltc1FnNmNn?=
 =?utf-8?B?eUJ3dHlSc1ZRT2FwRys5UUVtSmEvdjh3cEJNeEwzZUF0aGhnd0M2b0FKaEVi?=
 =?utf-8?B?OUhhZDFBelJJOWw3Y2xraC9NRDdqaEIwSncvdUY4Q0liZUxXWm5WSHdsVkJS?=
 =?utf-8?B?WGZiQ1BMYnpERjUrTVRQSkx5Mm5adldqZ096bDB6YUVoTk96RXNQdFF6Nm1m?=
 =?utf-8?B?TDJaWjZhSEJ1TnhUQ3RTb2dTN0hCeXBqbTZlcllSM1BoSGkrcnZ5WnhKTU00?=
 =?utf-8?B?c1pSaWVPNjdhMC84aXlMZS82cVExU3UrWTlQL2dBK2hHYW9panlsSHBKTDU3?=
 =?utf-8?B?Q0hOeDNxSXZSRXJRUkxVQ3JYYmEybzdWRmozZWduckdRa1I5d01nODhQZ29F?=
 =?utf-8?B?ZnFXSkhnL1NESkNYYTdkTTVHVm5sVlJCR1Z0bk5IWVl0Nm9qSE1tYU01MXo4?=
 =?utf-8?B?b1o3cm8yR25rdGg4ZzNjRklVd3RnMmxaUVZ3Y2c5TmFGVmhjNFNabDVMR2N5?=
 =?utf-8?B?dTh1RS81NE1KejMxS3V4ZFhoMTZGQkJ2QXFyTmNNSTVjbytkaTJJWllqMGxl?=
 =?utf-8?B?VWRad1V5cmNjd1RIQWlNM3NuMkFualV5dmw0VDRybndxc3B0cTVEQkdObmFN?=
 =?utf-8?B?aStJTzVRWHc5SEFrUXM5VVh0Qm53aDNWNlZGR0x3QXVYZnR1eDNtNUY5eGI1?=
 =?utf-8?B?YmFBTzRoZStmeUdPd3VXZTBkWk05dE9RdjNuU2ZvRStyNU92elU2VE5KQUpM?=
 =?utf-8?B?V2hocG1DeENRYVhhZ1FheUREMGpBRGdLd3Y4aFJqQ3JKUVFRbXpsRWpDK2ZK?=
 =?utf-8?Q?k5NaLcq5kRLwXzqxGQEM2+gBn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1907979d-d9a2-4959-ca1b-08dce41033e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 01:02:22.0872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eZcEb5GxAc6KkuY5CpPk+0uOh4cGZc5Cy9wNDyuDRxr+3voRXo2OKt7FCybVORvwcQ1/f8GjppH1snGovUpowtoslGM7Jw1JLFyphsjaOBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 01:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205221

SGkgUmljaGFyZCwgUGV0ZXIsDQoNCj4gPiBZb3UgbWlnaHQgd2FudCB0byBsZWF2ZSB0aGUgdGVz
dCBzaW5jZSB0aGVyZSBhcmUgd2F5cyB5b3UgY291bGQgc2V0DQo+ID4gdGhpcyB3aGljaCB3aWxs
IG1ha2UgaXQgaGFyZCB0byBkaXNhYmxlIDooDQo+ID4NCj4gPiBBIHNpbXBsZSBleGFtcGxlIHdv
dWxkIGJlOg0KPiA+DQo+ID4gU0FOSVRZX1RFU1RFU19ESVNUUk9TOnBva3kgPSAieCB5IHoiDQo+
ID4NCj4gPiB3aGljaCBpcyB3aHkgdGhpcyB3YXNuJ3QgYXV0b21hdGVkLg0KPiA+DQo+ID4gQ2hl
ZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KPiANCj4gV291bGRuJ3QNCj4gDQo+IFNBTklUWV9URVNU
RURfRElTVFJPUzpmb3JjZXZhcmlhYmxlID0gIiINCj4gDQo+IGdldCB5b3UgY2xvc2UgdG8gYWx3
YXlzIHdvcmsgZm9yIGFsbCBwcmFjdGljYWwgcHVycG9zZXM/DQo+IFRob3VnaCBJIGd1ZXNzIGlm
IHlvdSByZWFsbHkgd2FudCB5b3UgY2FuIGNpcmN1bXZlbnQgdGhhdCBhcyB3ZWxsLg0KPiANCj4g
Ly9QZXRlcg0KDQpJIGRpZCBpbml0aWFsbHkgbGVhdmUgdGhlIHRlc3QgaW4gcGxhY2UsIGJ1dCB0
aGUgcHJvYmxlbSBpcyB0aGF0IChhcyBwYXJ0IG9mIF9wcmVfcnVuKSBpdCBydW5zIGJlZm9yZSB0
aGUgc2V0dXBfYnVpbGRkaXIgY29kZS4gSSBsaWtlIHRoZSBpZGVhIG9mIHVzaW5nIDpmb3JjZXZh
cmlhYmxlIHRob3VnaC4gV291bGQgeW91IGFjY2VwdCBhIHYyIHBhdGNoIHRoYXQgdXNlZCBpdD8N
Cg0KVGhhbmtzLA0KQ2hyaXMgDQo=

