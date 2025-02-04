Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F18AC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:13:38 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.80])
 by mx.groups.io with SMTP id smtpd.web10.117299.1738678410415277286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 06:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=NiGdixES;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.80, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POQjFv5mm9pkTDZAEg4oajN1s53Kb0Xh7O6GTVrQfuBTbfqWcOyGem2YcrnkTuk5Peh6lQx2db4Y0WmljmgR0Vb2RDd0kMUxyO5CywDJ4G7N4jzqpSN7pnXjRB24drVMA8lxmKFubPCoJPvv8P3NSQBj5v8hBafdYfvK3ruZAJwhaMGmRcwVPqOStW1lfhBYgHJVr7zJN8H741P4oeWyKrfNw6tYYOi4F96deJxuZ8bytQHV42/C1gd+tWdonC3SxaiF+qIOJ3F+NOh5f+GWvn/qbi4s72PCMoTy/ytEgqT/onjb2IXZAd5q9qsIkPL0tw2nv4dzHp2dhYDeFS+KZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecPSi/f/kME+saMe8fVxm2wZ+/BrIBLdd6QrtC9oyc=;
 b=ZCO2xRLyT5M7/5ubJ8A7jY+oMwn8/ypP/NlBBwT203WXpwtOw/5yi721avVeXsTmyoT4RYG2jCI3k/sjdM3Yfs6ghdbhxDCN2mCsw7IHBI12jAWdQpSlYfWvRtL1Kiy2XN5j0ilvsmhXlpXTg34IpWNZBbts3U4fg8BMEKaUpv3HA60wX0OOMBN3zGkN71As9iITKszv95MpfjkBj5Gf+LvlMvdKTHKwpzDDT7Ly27hBnAR94nXDP5jhVLL9Nn6537UPH2vmFKTn0Crbqlj3ghLONmVAUqOGQnNcOgY8d8ucKejypFtFa1ziLEwWM55DzkHqgLfN+N5Jpauq7yb1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CecPSi/f/kME+saMe8fVxm2wZ+/BrIBLdd6QrtC9oyc=;
 b=NiGdixES0VU/YWr55vXPBWHJ7vkQZhFYFbu8YQF1k3IMNzh4/0kjZg9lnFykT4NGuayUO45ea2zqt3VHnpwgzG3B/mHeu9fEvj4Kkk+ST5gbcrQp2o0nQpm1xI+4pA15luolHgqZQCv4+HdovJ1Hd0Stag1LnOjUkNjKsHKKb/CKi+Rs+lRi1NMbOxxmsewl9B9ywiKurqDg9uK4okq2HNUCFueSSh8upRs9eW+L4xZGpXgZltITqG8Fkd2/9arwpsh5uD86uNf+tOhQjh6T6SkrEFJ21Ir/+Fm/VtQBlDzcuP+rVpV9cwXS6OR6obkSdHd6B8cX+sz29lHO5soYPw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SA1PR12MB6680.namprd12.prod.outlook.com (2603:10b6:806:253::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 14:13:27 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 14:13:27 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Strange behavior in sstate-diff-machines.sh
Thread-Topic: [OE-core] Strange behavior in sstate-diff-machines.sh
Thread-Index: Adt2e2zuDqfbEJfWRDSo3WEf7sDerwADQNqAAAAM8aAAG7TUgAAF21NQ
Date: Tue, 4 Feb 2025 14:13:26 +0000
Message-ID: 
 <DM8PR12MB543089D64F3D034F7DB65DE58BF42@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
 <9c3a268725aa40db3cab0578208017733bd24f57.camel@linuxfoundation.org>
 <DM8PR12MB54300A067D077BCEED12ADF58BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj8PqRNNMCRh5KaKH9x9xY+c+4H11u6MufYa+KLY7SpnDw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8PqRNNMCRh5KaKH9x9xY+c+4H11u6MufYa+KLY7SpnDw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=3ccd6552-22c5-423d-b28b-cbf7400f642b;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-02-04T14:12:58Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SA1PR12MB6680:EE_
x-ms-office365-filtering-correlation-id: d037abb4-f0a8-4b53-89dc-08dd452617fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Tmp5eHhLS1V5VnRESzg5R0Y3L1V4MVZkNjNKK3JSZThsY1ZUMnB3dXpLUlh4?=
 =?utf-8?B?SnZXODEwUFB1RC9UT1pYRXpENTRNN0ZudTV6R2hlMWptU0F1akxSWHpuM2oy?=
 =?utf-8?B?OTJOb0pxdXpLOE84MURYQVdaQ05EMzl6SW9odURscjdZeHZXMHBnSWFxT2Zr?=
 =?utf-8?B?bDhzQ3pWLzRCY0Q4Z1ZIL1o4amdBcy9nZmNrcmdRZFVudG90S240ZUVGQmNC?=
 =?utf-8?B?VXdobXpNSHlxWFYyaFpiTzJUUXJXKy9KZk5oUHBaNGRTMldrVHIzZEJUZFU0?=
 =?utf-8?B?Yk1pby9SN3BBUGQyVENZbkNTMm40NHdBMFFwNFlaaHNXQlphOWpZVnNDVzRF?=
 =?utf-8?B?U0x0Z3VjbXVMd3RHbGFDRGVOanUxbldpYVYrMzNsNHlGZTZkdXl0THlXREoy?=
 =?utf-8?B?NTRyVm0xNnhvdStXSHo0U0xqWm9jN3FXZXI3QnVpRmFtdlQwNjFtd2tRREhH?=
 =?utf-8?B?ajdOMnNQVFhkQTcvakhvU2ZCWEVJWEdVQUdRazVoVnVrNU9hY3NJb3ZQMm9R?=
 =?utf-8?B?ek1TWlFOMWlMdXUzZ3hDN3F6eS95UEx5NnBIUWoyTmZ5MVpDZHRMTS9tZUVK?=
 =?utf-8?B?dHQvQU0zL21CZVc4TWovcU5wTXREOENhUXRIendwZWdtY25kNlB5ZFJwSEV0?=
 =?utf-8?B?VUZXRlZhY00rN0NDRVNKV2hJZ2ZpTEZaNk4rbkxIUTJVd3ZJUXlxa1hRY1Nt?=
 =?utf-8?B?cTFUd0hkSm9YZ2lSR3ozV2pGZ3ZNcHZRNGUxNFluZ010RGV4WDNWdnFEbFhH?=
 =?utf-8?B?WHBaVjJrMUQvaHBkc2hYYk1UUHplR25EcU1xOExkV2NITTU0KzdDZWMvSHRE?=
 =?utf-8?B?cy9tZFJ3d1Z2YThEZzB6dnk0RDBzYWtNU2tMQk9xQzJONlVlMUZiUU1YU3Q2?=
 =?utf-8?B?RmxzOXM0K2VDV3pJcUgyaUYzUTNQWUtkRmRKbFBNemZJaDFKdC9WWGQrUXll?=
 =?utf-8?B?VFltWUQxQVNkYkJBRlRudlltQWhUUjBheGV4Q05XTnBqYTd1RDNZVkJ0cUV6?=
 =?utf-8?B?TDhHV2Q0dUdCaXd5L055UlA2RTRBODBLaGNQOE5vbURvL09zMWFac005OWJX?=
 =?utf-8?B?a0JIT3hNSnh5ZG5vZEp1MkxLZEEwcWRWRVMybVYxYmFDNmZEbDJZTGJiQzdL?=
 =?utf-8?B?Y1dQYWdPcHhZOS9mZnN1b1FuREFtWm9pRjNFUFFuQ3lDbi96NTZTWktWV2pL?=
 =?utf-8?B?Q0lvcWg5ZFMvM29YUjlPSzFCUWpUYmlKTTRncG0zRElsOWlDdUxOM2hZcjBK?=
 =?utf-8?B?Z0lEZitNMCtFQjV0UFlhVElDTUluRFhNZDVybmlJNXRoM3QwMDlwRlhEMlA3?=
 =?utf-8?B?aGlRbjZDSitWeTRhSHVrVFZ2cEE5cm5vK1ZBSXVETG9WYjhiYkRIWnJXQzND?=
 =?utf-8?B?NndiN0xkZkttYzBJcE9BZnFmaWhqeXFmWFlJa1VPdFg1SU5US1JpbzgzWVll?=
 =?utf-8?B?KzlFaFVLM1RtSXV6NElXOU8yMng0aVM2U2I5bFhNaXJtZ200VWVNWXFidUpr?=
 =?utf-8?B?SnFEekhXMFh5aHNtUkZGSnpiNjIyK1FzZG5RVlBtcTcrTUZ4MTZqb2haSG5M?=
 =?utf-8?B?MHIvZ01yUUI0aGNxMUlYclVseXAyT3RRd0I3Vk9mYVdzS1B2OVoxaEFSaDZs?=
 =?utf-8?B?NURSdDh0eUVaZVUwQ2czWWlDR1A4OFF2Z1AwK0ZyaFQwM1ZNcldYMnRCck5E?=
 =?utf-8?B?QTBKK20rV2taZGVhZmJPc0wrT0ZlaGNuVXZiNFZ4bFhrSXFyek96cU1sY0FJ?=
 =?utf-8?B?NW1JQXphTHFULzR3ZElWR0tHUmRyQThsc3pWS2I4VS9ZblJSei9ORE9aRmkv?=
 =?utf-8?B?ajVLOXpJdGVBMTJjWHJUdlNOSzJ1clhhK2c5MkVxbVU5enRVMkJoYXlCSmNR?=
 =?utf-8?B?TDlXTmNlSVA4U3RFeGJnbDdVS24wN1YvUWFPMWtTRmpUYmdoWDJ0SWhOeS8y?=
 =?utf-8?Q?+V4Q8v5Y9qKviS1K4EV5M5s0RXcE3sjv?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3ZEcmJCSXFtSHJLay83ZW96V3YzUytCRHZPaVpCZ2dsbUxlUHdoTGxwaGk3?=
 =?utf-8?B?a2hSSHNtQm1rOGVvVXJJTk1nL3RqcUJGejUvcTlGT1IzZE42bjhPNkpjMjNr?=
 =?utf-8?B?OFNDbExsVXZYL2VzejFWYnNTNnJNbFF6SWRoZkNCVkpJdVM4ZzE3bFJxWHpr?=
 =?utf-8?B?eWNtQlg4eElaYVpSdlpnRDlPY1RySEM3WWd5aFo3UDl1cEI5MkRjNWNZRUg1?=
 =?utf-8?B?STZ6dWhHRWVCd1E1Ri8ySlpDWGFqYlhxbVBvM2FMcXVjTFRhV21UblFaNjRo?=
 =?utf-8?B?R3NiTjFyQjU2azk3cURTRXdXL0NlL1E5b1hjaTFncmNWU0IySSs2dmRqU1B4?=
 =?utf-8?B?WEZZak1UTDA5OG1hRXlCVmtOVUZhQjFpZEYzaWV0VjF5NnV3M0RuQWNNS3FR?=
 =?utf-8?B?L2xJWlJnL0pIYzNlQSsvQ2tvMXNFUTQyd2hPNWVwSEZMZ2NnSTdCeDJNYWF1?=
 =?utf-8?B?TEdJVnA4blJ1NGQwVEF2RlhVYjNmY0wrcVlIalJUSC9nbVBUUHZ6S0Mvd0Qv?=
 =?utf-8?B?eTQxMy8vSGxoa0JFNS9iTTRlYXZlNEJyQXdxNk1pbXFQSHJmdFZGemZYcGlT?=
 =?utf-8?B?WVltMlRHWmJCZjNaU1JUYzNNR2dlSHFoSDNzRHl6QzAzWkExa1JlYTF2Rnph?=
 =?utf-8?B?bGZjSEs0eFpCYXVwQVFmUjRTd25SQ01hWWVSYnVOV2lPa1VxMy8wWFp0Vlh4?=
 =?utf-8?B?aVVVOUR2T3NYZ0ZLS1kyd1VrMzRGa3ZDa1lZQzNjTjBTSmE5UDFEc3MwV1J6?=
 =?utf-8?B?RHp3WllNL3ZjelpOMFdvai9ZeTdiM1dadDg3eXFEMGR1M3FJdlVkY1hXVmVt?=
 =?utf-8?B?ZzRCUld0aDUyY243U2tJT29LNWlHRWpzUlFtYnQ2djN2b2VoSnk4UlJOczFS?=
 =?utf-8?B?Z1VOdHRCS3VNanBvaGF1NFRkUk1KeHNMTUQyZmxkRWRmRDEwaTc5MGhEak9h?=
 =?utf-8?B?WHhuZFRwVGhiNVN5cFd1MmpOL3M2Mk1Va3FDMWZ5VE8rZktFbWY0czZrK0Zu?=
 =?utf-8?B?Q2VrSnlFRkVwWVVXQ1ViQ1FtSUxWakNiank5ZERYUXZOQ2M5TUxXcVh0Q1Rk?=
 =?utf-8?B?NTdwaCtRbTY2emxRWkV3MFFqY200Q1Qza1lHdmxkUTRWM2QxL1Yzd2R6ampN?=
 =?utf-8?B?OExXdXoveHNYVDJMazZXckpsT1FHelBTM3QyVDZaOXMvNCtNdllPQ3EyUXp4?=
 =?utf-8?B?V0ZFWXptMmxCRFEvMnNuckplNmNxZjE3Wkx1bzVPN2J1UTBQc2dIbjZPbWha?=
 =?utf-8?B?amYzY3VZRTM3UkRWc3c3bWpaUUZEMFZGaVJxTU55Q2JxNXF5djY2c0xRVXJi?=
 =?utf-8?B?VmJ3WVNBRFVXQVpZWCtYa3c0cmFhZC9od3h1YmRvM3h5bGVTMWo0aHZQRTRx?=
 =?utf-8?B?bkdQaVd3S2VOcWtPaVdyWTM0ME8xN09rY3lPVGlhb2NxRERBMi9MZ3lTODlS?=
 =?utf-8?B?VDJmTU5HZmkxb01GQkJpMS9hemxtTm9RU2E3ZW5Nc243QndmbHF6S0tZbU5J?=
 =?utf-8?B?aHloUytWQllVbzQyMVlxZm5TTHhkdFRZT2hDSUM5ZlpvYlY1TlJaeHZqOFl5?=
 =?utf-8?B?ZEV3czBWcjlUWU01QXYyR1ZNNndkVllWNkdwOFhXZkhmQzdlZlE0Mk1sOU85?=
 =?utf-8?B?bVdmWllycGZxekdBSzA5eFZlN0hvQStKMlBORWFEVkdPM1FSOUxKd3E1aWRz?=
 =?utf-8?B?aDc0dkhYUUkrRUVBZE9ZTzBiU2UybmpyT0RwRms5Wng1Mjd5azBtQjR4RFF3?=
 =?utf-8?B?TU9UenF6bkpBMm43Y05CMWpKbURQSmgrcFFxVTdRellUSzhHNG1nQnZOckhR?=
 =?utf-8?B?UEFmQ0NUK3RZOGJET3F4cTFJV2gzUHNGZ2lkZWpEMmpUYzNpSjY0SmswODJq?=
 =?utf-8?B?RThuTGsrSEMyZGdWOGRhSWMxU2pxckozK2E1NHl4MXhnWHFDeTBzVjFOcmNP?=
 =?utf-8?B?cmFmdWRNbzJqaDIyeFpUQTZjWElVNmUwUFh3Kzh5WnhteFFFZzNZSEI0a0J5?=
 =?utf-8?B?dXZGczBZRlJsWUEyYWI0SnhSTjNmVXh5aXZTcE81M2Z1VUxzSXowVmlhWmw3?=
 =?utf-8?B?YUxaNzliTE9GL1lWYTJ1VFc2a1YxVnBWWXlCMk5TbXV3aVZtY1Nnek85cmlV?=
 =?utf-8?Q?JuaYpibupQIktZZ16FI7RnENk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d037abb4-f0a8-4b53-89dc-08dd452617fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 14:13:26.9852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOspXR2rAzVK6JejcbwYyVRmozeyDBGeAUwGbyM3xHf+7R4iFHB3+KMBL+A1UCpZcbd+C1mJjcRE6iCpdUuiY5Z/F0hVBYCOz6L15fMp92o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210803

SGkgQWxleCwNCg0KPiBPbiBNb24sIDMgRmViIDIwMjUgYXQgMjM6MTksIENocmlzIExhcGxhbnRl
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxjaHJpcy5sYXBsYW50ZT1hZ2lsZW50LmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiBXb3VsZCB0aGlzIGJlIHRoZSBr
aW5kIG9mIHRoaW5nIHRoYXQgaXMgYmVzdCBwb3J0ZWQgdG8NCj4gPiBiaXRiYWtlLWRpZmZzaWdz
LCBtYXliZSBhcyBzb21lIGtpbmQgb2YgcmVjdXJzaXZlIG1vZGU/IChKdXN0IGFza2luZw0KPiA+
IG91dCBvZiBjdXJpb3NpdHkgLSBJIGRvbid0IHlldCBoYXZlIGEgc3Ryb25nIGVub3VnaCBncmFz
cCBvZiBhbGwgdGhlDQo+ID4gY2FjaGluZy9zaWduYXR1cmUgc3R1ZmYpDQo+IA0KPiBXZSBkbyBo
YXZlIHJlY3Vyc2l2ZSBzc3RhdGUgbG9va3VwIHRvIGhlbHAgZmluZGluZyBvdXQgd2hlcmUgdGhp
bmdzIGRpdmVyZ2VkLA0KPiBidXQgaXQncyBpbiAnYml0YmFrZSAtUyBwcmludGRpZmYnIGNvbW1h
bmQsIG5vdCBpbiBiaXRiYWtlLWRpZmZzaWdzICh1bmZvcnR1bmF0ZWx5DQo+IGl0J3Mgbm90IGFz
IGVhc3kgdG8gZGlzb3ZlcikuIElmIHlvdSBjYW4gZXhwZXJpbWVudCB3aXRoIHRoYXQgKGZyb20g
c2NhcnRoZ2FwDQo+IG9ud2FyZHMpLCBhbmQgY29tZSB1cCB3aXRoIGVuaGFuY2VtZW50cywgd291
bGQgYmUgZ3JlYXQhDQoNClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyIC0gSSdsbCBnaXZlIGl0IGEg
dHJ5IDopDQoNClRoYW5rcywNCkNocmlzDQo=

