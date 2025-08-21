Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D25CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 13:13:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.44])
 by mx.groups.io with SMTP id smtpd.web10.9057.1755781986134665078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 06:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CDaBIMqa;
 spf=pass (domain: siemens.com, ip: 40.107.162.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC1hFknI1CMMgt1Rn1yoi1I6qSnT1uNBoiS/3sbqhe1Khfq6mrjqxDv2vgGpmg8CyIPnFKzY/Sct8BooBq5B1kSUMe3qkgiajm4bQsuph3I9QoKMsWIS8VFS4N+A27eXgQ/imsgAYtMztxlN7BllRTHSo+YLOAJqLD9TqCjorjTm8/7Tgi5gzfE9GkVudTSatPFmqUzOCR/wofIcN/0vNZ1MNQP+4gvRzFvYv1XsBAryrDd0l1ljEy028qIusfDyuiYdEW7ubhHaPs+J1nXJ/psE0gIQfhW4dPyrebrULhWuECSwvkkoCJgpyZfv3Bb4Ig6m323ffC3ExmhSq2+R5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF2QILCFwLFc+NVnOw0vF4ZYM5AT5C1MQ6Uj4GXU75w=;
 b=XMbtXQS8HtaFtPEHy6ioZn7Ku0rEVhenIHICq6Qe/3NM0/VWRsvVdPeK79yPlY3uNpDFXxdOGhbbo2/yDiFc4KGU/CYfFur5y9xJGkySGaqIsSlZUIfaBW/cAxWbo4RYEN110eY6ECmB6wdofIlM8DaKGwxetB5zLXFdtTC73T9ZvedS5VIY6M8Qj5YiQx5xRIUSo7qfkOXg1mtr5kUWASR3zuakBml96bMXW7za/uLlh1oNCdAjreFrG01HWokqaClGLAPU7+zz8e2mwryZsQXoLTLJqR/riDjOtdukvRGAfz6PLUQSjTLLp4YNkMo8XlL7Np9RJu3wBURsb83ALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF2QILCFwLFc+NVnOw0vF4ZYM5AT5C1MQ6Uj4GXU75w=;
 b=CDaBIMqasbj78soyb7EZMpwOt2WHz/VbvLVUhHr9yOtAuIqvFQ+U+UME4PcSZhfVRh07EX+eJz8ySdXgl9CnotL5+F0p/IZZxs2668YnXW7+n3UbJialX7DrqOJfCrMs6z3SfaKWk/y42N4YbE/9++ztpvIZ0DBb/ombuktocrK0Ps3CCBm97wIHjE+dlZ4fMYEdYNNHj1abwf1obKLZREn+v/0dwkBKx7X2Veaxv1wQsgIh6LQAEYh5m4SuI34xDvQ5wfdIlxQ8JdGsdZtIyJlj0Rhk3JFWHs2UcaZpXCZeiaGLHAWA28wlBReDVA9h4uTfVMACmE/YGb23XvHObw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:571::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 13:13:01 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 13:13:01 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] rust: handle softfp fpu
Thread-Topic: [OE-core][PATCH] rust: handle softfp fpu
Thread-Index: AQHcEpb5BosKl4HiW0SB9LYISWZgd7RtD2kAgAADLFA=
Date: Thu, 21 Aug 2025 13:13:01 +0000
Message-ID: 
 <AS1PR10MB5697DEA9C1C030850E474A09FD32A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250821122655.14029-1-peter.marko@siemens.com>
 <CA+chaQf7m=2=M=5XPbxonwM3+BQmg3qGd4v56tCMVL1R9uEagQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQf7m=2=M=5XPbxonwM3+BQmg3qGd4v56tCMVL1R9uEagQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=620305cb-9e87-4357-8250-72cc1e36d5f3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-21T13:02:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6056:EE_
x-ms-office365-filtering-correlation-id: 3baa381b-8167-4c14-2021-08dde0b474f0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dzRzSWxjUzVTRkFsNVJuY0tDem1iYk9wRU45dVlFajhZMWwrZS9TMTJwZnh1?=
 =?utf-8?B?dWpjQmVlNU95RERraEg2azNaaWxUelEvT0JKeE1sT0M3eW4zaXFEaEVXd2N6?=
 =?utf-8?B?NXVWUGwvQlhYNUhJSHQ1M2tMandYVWN2cW5leWNHUkNIZ21FSm10UHdWSjNp?=
 =?utf-8?B?bHhEVGRON0lnejV4VE1tekVDTjBaREdWTStXdHlldEJJOHJDcS9sblFKL1hs?=
 =?utf-8?B?dXQzTmpkVFcwOEhVUjcyZ2YxSFB5ZXd1T2x5Y0Faek9EMUE0UXNHT3VESG9S?=
 =?utf-8?B?anQ1NmZSR3gwUDA1ZTdtbnYvZy8vTFlHRE5UWnJrWGtaYkFXek5MbVFtVlh1?=
 =?utf-8?B?d0xvVktjcmtRWWNoLzFQVUp0VFRLT2V3ZTFvRTE1ZFpDVVVZd0JTMERhYVF4?=
 =?utf-8?B?K1AxV0lQL3ZwQWFEbFBZVlVPaU5CQytYYzMwQkV2aXNaNXZvejhKajltVk94?=
 =?utf-8?B?WU82MExYZWI3K21xRWJzYW1xbTVyems3YmVXR05FaXdzdGl1T25CVDFUQlYy?=
 =?utf-8?B?d3FzeStoMVozQ2ppOGJBUEIxL2F4RHhUaXd6Wk5TRmNDYjlKUFoxN1FBZkM5?=
 =?utf-8?B?RmhoUTU4SDg5ODJpcGY4ckpadXdiaVFrVzBuTU1aNWw5c3FkWS9FUzJnNkw3?=
 =?utf-8?B?Q0gvcnBvYTdQejNWekk4bjZ5NUZORDRiUnRSOGNoQ3RmRGpTOGhEdmd0SWla?=
 =?utf-8?B?V2dzdTAxWDJ4MjB3enEzdXFvd25uWGMybmlKTGQzSzBrSDhsN1ZKWTRGRUo1?=
 =?utf-8?B?NG83bVF6b3hvZkF2N3FSQUR4aWp2WmllV3NuemxQdDFEMmhyV2hOWE1Lcmsw?=
 =?utf-8?B?ZFhKNUZ4NEczUThSd1hOZEhKdVREYmZMOUJCaUdFYlovaXRyaGkreHdBb3hB?=
 =?utf-8?B?cDBCVnErR2xPb1k2c2IvSGNaNVZjRGdnT2VRRk5jN0dXaThoN2p6V0VyRmo0?=
 =?utf-8?B?QmxjMFd0NmpYdXBVZzhaRkJObTFSWk9DYi9MN2tFTk1WMG5WbGZ4QW9za3Vj?=
 =?utf-8?B?TVV3cDdCa0pFZ1ZJZit6TWoyYms0WGRoK3U4aUR6cXNwYTlqVTZhb2pRcFdB?=
 =?utf-8?B?UTRNSXVUSk9BdUVaT1ZmRTlGK2U3amFsckVTNTZWaVBIZFl4TmpPelY2N1k2?=
 =?utf-8?B?VFJoSXU3YUgwYUpwNVhrV0dhRHBHZzdFandoWjRsdnJya3F6OERUMGQ5dzhw?=
 =?utf-8?B?NmlHSXB3cGZ6MzJXR3lyZi8xck80YWQ5ckttMVB2YjRQMEduM2h1dlBvczFH?=
 =?utf-8?B?RVR1N1BoSHlZK09CY010SGxpQ3RKK3Fsc0NTRzAvYmFHSWRhaVEvZlZnQkpW?=
 =?utf-8?B?TW1EbnQ3V3Y4dUR2TU5vVnJ0YUNtYWV6TzFaM0g3ZEZ4OFU1OHpJaWRLdDBx?=
 =?utf-8?B?MkFDOHIvUFc2SzNiMS9FOXhRUWdhdVhOQnJCcUJpci94Qko1YitJajlKYm9z?=
 =?utf-8?B?ckliNlkxbFdwVk5xU0tDZmRSRGh2citucFdYWVZMN1RRSjczaUVpTk1zcUVN?=
 =?utf-8?B?VXZIRzJ6Z1ZUMHN1a2JlNHloVGNvT3RaTVAzUTNZVUFIc2xRRmxITWM5RGp6?=
 =?utf-8?B?Y055MHRnMWt3clBYK0w2QTdjSXVrbGtSdUpDNS9zL3lEUC84Qm1tMU01VG1U?=
 =?utf-8?B?anlnT1pvaWRndFI0ZlpKUEJqZFdQYk1ZS2FqcStuSXRXMTJlZHRpNWduRkpx?=
 =?utf-8?B?a0c4L1RyRGcrOEZTZFpnWkhLZ2xBQWVteFdBNXhlRE1BTVdkR1Q2SkxNWXh0?=
 =?utf-8?B?bGM4dmkrdWVxWG1xWWtmMnJjYzhvaUVrbnBJVHA3c21LT0xXdjQ5QXRmNWo2?=
 =?utf-8?B?VXdBS0hhQjJqc3JBRi9ZdE5iZUhkYU9GUWs5bGU0NTNvMDk1SFlIQ2x1Wmpn?=
 =?utf-8?B?cU1vL0E1S2l1MWlmSUU5TlVpUUNTNVBMeDFBbk1UVnJGaGFTcThLRzVFR2tJ?=
 =?utf-8?Q?Lld6SDQwZNY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RE51K3dOZkk3bjVOWTkvV2NucENKNmNKU2hrSXpJUk1RYmc3MHlmMFZGcEZ2?=
 =?utf-8?B?dUNEbnIxcnE0QkhpSUpUb2lnVG9PSTN2SkppRGFOQUdpQnovZEo3anNHTi9z?=
 =?utf-8?B?VllVU1g2cVh0SFVvMVBQMFNhT0R0bWx0MG9qZlVlNUE0K0tZYVFIMWMvU244?=
 =?utf-8?B?WXYvRmdTSzVmVjVrVFppU0wrVUdYakErWUdrdVVLNk5ZQlMvWWdPKzBIK3VT?=
 =?utf-8?B?bElGYW5EVDFRNnlMdmtxcFBJR0RCTUVyMkNpeUxrLzlXaEs0M0IwYlRTcUZV?=
 =?utf-8?B?Nk5iSHpVT2hsU0VwTVVzWGhTVGxOUVRXOE94eTlBM1hUdEUwN0x5WlBJcVow?=
 =?utf-8?B?WEZrRiszSGZZTWJVYlhrVkRjRDdtekZhcVpQSDQwUVJNTUFPMTBBaHBDTGJr?=
 =?utf-8?B?b3NvU3lBSTNWcVhOblU1d3hWcUgvem4zYjIrclZFRmFKY2RwMVB5cFlCUGZI?=
 =?utf-8?B?UWJQMk1GWVEybUZmMlpmK2pFL0RzWXZkOExyaWp4elVEU01uRm5wR2ZVZ2ti?=
 =?utf-8?B?di9MM1FzRmsrTHR5ODRLMlZzcU1mZ0J6VnhQb1FWZjRlRUNMS2I0ZkFuOENr?=
 =?utf-8?B?L2dNV0RsbjlCamlrS3FSK0FzTVhNTmZZSmV4SzZGSU5ZNi9xditvNU9QSDRY?=
 =?utf-8?B?L1N2SEcwMnZRd2lOeUQ0ZmpDcnkwN1hydHJXb2lUNzc1c3dieElBU3BuelBB?=
 =?utf-8?B?VW1wdnBVczUvM3VBdzZWc0lLS2Fzc3JRRTl6bWdjUVpwZGxrVzJkUlFVSGow?=
 =?utf-8?B?NWJlNUlPWDZsYUJ6MkZqMmtXVEF1SHRDaHdDNThHaHJtVWxzZ0QxWml5YkVm?=
 =?utf-8?B?RlkvQkZROXFxa1pjcVFvTDc2MW1LK2lsRWdIVEdYdzdoUGwyQVhDWTR5bmdQ?=
 =?utf-8?B?TjhzdC9qRzJYclRTMjdmTzFtRnpDYndoa016VkxhZHlldWpIZWttNis5dE94?=
 =?utf-8?B?S1V3MEcyb00xOVVoT2EzK3RLYnVwZldLNVpLMWlZUGF1RUk1RTRJL3FSQkNO?=
 =?utf-8?B?QmQxT0E5aENKQmVTbkNCOTFNU1ZYcU9WWDVydnNiMUo1RkVEL3NxdmJhTFVq?=
 =?utf-8?B?ZDNDN1E1ZU53elVMOHkwYUZmY3VBQVNBRkx5R0dKUEtEYi8yVzNZWnRxYW9Q?=
 =?utf-8?B?TmFjM1BYaWluUlkxa0RLU1h5TkNPY2tCQ3h3YXlxVkFGV3FvdnYrakw3TDJy?=
 =?utf-8?B?SndQN3RMczBZQnhqNXZlSk1wSzJCYXNGUGxJTVJMcklXVVJnWjA5dHBTUnVh?=
 =?utf-8?B?TTJhclNEbG10ckhJdGUwUTE2Q3h5d3BsMVBVUFVoNjJ0a3UyZWNCN1Q3OXhi?=
 =?utf-8?B?TUVWWE9pWktVQjVWU1hVT1l2QTJtdjNnUm5MWk52UjNML1NUV0dJVUNnb0RD?=
 =?utf-8?B?cElvSElwVzJMdVJOT1B6VGtpdmE5QWpLZTJQalAySXVGSkpwMDZJT1RzbkIx?=
 =?utf-8?B?dzR5VTZ5MkZmMk5KZ3ZYbTlWT3RRdWZpSzdXdytGZVdDdGZsTjVYRnRqTkdM?=
 =?utf-8?B?UGJ0SWZ5M3pIb0drcWN0S01ycTk4MS9BcXJkSGFVeTBtT2lMTFB1S1dVZVRF?=
 =?utf-8?B?R0JCZEw3aTJwb3BQVHkzNUx0aDJQVmlYZncxRmZmSkl0SnhmZmlXQ1ArK1Fr?=
 =?utf-8?B?QlZ3TXJ1QjZ3WCtQeGpiN0RWNGE3Sjg1czdPOUk4K1dSVmhkTVYrcGtMbVVO?=
 =?utf-8?B?RWZJZmd2UGRKMjZCM0RKSmIxUVJlNTFIVnlwTXlpVko3NUVGOXVvcm9YR3RS?=
 =?utf-8?B?a0ZNUUkwSWFYaTU4cDU2WGUxZGgxbm43MmJRcDcrMVpuSkgvQnkyRmp1Q2dy?=
 =?utf-8?B?YXFnbEt3NTFFVVpGREJJU1FCeE1WMG5hN1puY1VRZlI0YVJZNFZhZEFVRlpa?=
 =?utf-8?B?UUNVd1dZNDFDUHllV1BVakFKL2t0dDI0MTQ2VTgvcXBhWnZQeW5pNEpzUHNF?=
 =?utf-8?B?dWRoTmV5VVA1MW9pNjc0OUo5S2FHZDkyZjdGa3lXQTdyS1lTVm96MVN1ZWE5?=
 =?utf-8?B?aXNMelVCaHJ0blgxOFlnMHNmMFhTNXZqVFc5WlNMeWFxVlFPQi9MZnV5STNs?=
 =?utf-8?B?M2dKZkhtMmNuT0xKNFZzQlh2WkIrQ0czWmVBNnpjWDViY2RsRFZnMVdtSDFx?=
 =?utf-8?Q?SSmvoIHbsp8CEGbMBsrpFM7m7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa381b-8167-4c14-2021-08dde0b474f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 13:13:01.6937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYS5g8vTqTQs3VUk21TEHoyjLEStAORIx2ow0fDyJJxICsBClB00bW17XmavyicEY//ovbXxZ5q5LlmIPTHsHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 13:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222238

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcnRpbiBKYW5zYSA8bWFy
dGluLmphbnNhQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMSwgMjAyNSAx
NDo1MQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0Bz
aWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gcnVzdDogaGFuZGxlIHNvZnRmcCBm
cHUNCj4gDQo+IE9uIFRodSwgQXVnIDIxLCAyMDI1IGF0IDI6MjfigK9QTSBQZXRlciBNYXJrbyB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8
cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBXaXRoIFRBUkdFVF9GUFUgc2V0IHRv
ICJzb2Z0ZnAiIHN0ZGxpYi1ycyBmYWlscyB3aXRoOg0KPiA+IGVycm9yOiBFcnJvciBsb2FkaW5n
IHRhcmdldCBzcGVjaWZpY2F0aW9uOiBBUk0gdGFyZ2V0cyBtdXN0IHNwZWNpZnkgdGhlaXIgZmxv
YXQNCj4gQUJJLiBSdW4gYHJ1c3RjIC0tcHJpbnQgdGFyZ2V0LWxpc3RgIGZvciBhIGxpc3Qgb2Yg
YnVpbHQtaW4gdGFyZ2V0cw0KPiA+DQo+ID4gVGhpcyBmcHUgdHlwZSBpcyBzZXQgZm9yIGV4YW1w
bGUgZm9yIGFybSBpbiBmaWxlDQo+ID4gbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vZmVh
dHVyZS1hcm0tdmZwLmluYw0KPiA+IHdoZW4gVFVORV9GRUFUVVJFUyBkbyBub3QgY29udGFpbiAi
Y2FsbGNvbnZlbnRpb24taGFyZCIsDQo+ID4gZS5nLiB3aGVuIHVzaW5nIHR1bmUNCj4gPiBERUZB
VUxUVFVORSA9ICJjb3J0ZXhhOCINCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2VzLXJl
Y2lwZS9ydXN0LXRhcmdldC1jb25maWcuYmJjbGFzcyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9jbGFzc2VzLXJlY2lwZS9ydXN0LXRhcmdldC1jb25maWcuYmJjbGFzcyBiL21ldGEvY2xh
c3Nlcy0NCj4gcmVjaXBlL3J1c3QtdGFyZ2V0LWNvbmZpZy5iYmNsYXNzDQo+ID4gaW5kZXggY2Fj
NmU5MGE5ZS4uZmM5MjZmZTc3OCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NsYXNzZXMtcmVjaXBl
L3J1c3QtdGFyZ2V0LWNvbmZpZy5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS9ydXN0LXRhcmdldC1jb25maWcuYmJjbGFzcw0KPiA+IEBAIC00MDksNyArNDA5LDcgQEAgZGVm
IHJ1c3RfZ2VuX3RhcmdldChkLCB0aGluZywgd2QsIGFyY2gpOg0KPiA+ICAgICAgaWYgZmVhdHVy
ZXMgIT0gIiI6DQo+ID4gICAgICAgICAgdHNwZWNbJ2ZlYXR1cmVzJ10gPSBmZWF0dXJlcw0KPiA+
ICAgICAgZnB1ID0gZC5nZXRWYXIoJ1RBUkdFVF9GUFUnKQ0KPiA+IC0gICAgaWYgZnB1ID09ICJz
b2Z0IjoNCj4gPiArICAgIGlmIGZwdSBpbiBbInNvZnQiLCAic29mdGZwIl06DQo+ID4gICAgICAg
ICAgdHNwZWNbJ2xsdm0tZmxvYXRhYmknXSA9ICJzb2Z0Ig0KPiA+ICAgICAgZWxpZiBmcHUgPT0g
ImhhcmQiOg0KPiA+ICAgICAgICAgIHRzcGVjWydsbHZtLWZsb2F0YWJpJ10gPSAiaGFyZCINCj4g
DQo+IERvZXMgaXQgcmVhbGx5IHdvcmsgbm93PyBMYXN0IHRpbWUgSSd2ZSB0cmllZCBhcyBtZW50
aW9uZWQgaW4NCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8yMTQ4NDMgaXQNCj4gd2FzIHNlZ2ZhdWx0aW5nIGEgYml0IGxhdGVyIGFz
IHNob3duIGluOg0KPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1j
b3JlLQ0KPiBjb250cmliL2NvbW1pdC8/aD1qYW5zYS9tYXN0ZXImaWQ9MzZhNDE1NGUwZGQyOGI2
YTdiZTUzZDYyMmNlYTAyNTRiZmVlYjQNCj4gYjUNCg0KWWVzLCB3ZSBoYXZlIHRlc3RlZCB0aGlz
IHdpdGggYSBxdWljayB0ZXN0IGluIG91ciBtYWNoaW5lJ3MgcWVtdSBhbmQgaXQgZGlkIHdvcmsg
d2l0aCBvdXIgcnVzdCBhcHBsaWNhdGlvbi4NCkJ1dCB3ZSdyZSBqdXN0IHN0YXJ0aW5nIHRvIG1p
Z3JhdGUgZmlyc3QgcnVzdCBhcHAgdG8gdGhpcyBtYWNoaW5lLCBzbyBtYXliZSB0aGVyZSBhcmUg
c29tZSBjb3JuZXIgY2FzZXMgYXJvdW5kIHdlIGRpZG4ndCBnZXQgdG8geWV0Lg0KDQpZb3VyIHJl
ZmVyZW5jZXMgbWVudGlvbiBhcm12NSBvciBtYXJ2NytuZW9uK211bHRpbGliLCBtYXliZSB0aGVy
ZSBhcmUgc29tZSBwcm9ibGVtcyB3aXRoIHRob3NlPw0KRXNwZWNpYWxseSB0aGUgbmVvbiBwYXJ0
IG1heSBiZSBwcm9ibGVtYXRpYywgd2UgaGFkIHRvIGRvIHNvbWUgdmZwIHR1bmVzIG1hZ2ljIGlu
IGxsdm0gdG8gc29sdmUgc2VnZmF1bHRzIHdpdGggaXdhc20gKG9uIGEgZGlmZmVyZW50IG1hY2hp
bmUpLg0KDQpQZXRlcg0KDQo+IA0KPiAicnVzdC10YXJnZXQtY29uZmlnOiBoYW5kbGUgc29mdGZw
IFRBUkdFVF9GUFUgYXMgc29mdCIgaW4gamFuc2EvbWFzdGVyDQo+IGJyYW5jaCBodHRwczovL2dp
dC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLQ0KPiBjb250cmliL2xvZy8/aD1q
YW5zYS9tYXN0ZXINCj4gDQo+IHJ1c3Qgd2FzIHVwZGF0ZWQgY291cGxlIHRpbWVzIHNpbmNlIHRo
YXQgMS44NC4xLCBzbyBtYXliZSBpdCB3YXMgZml4ZWQNCj4gc2luY2UgdGhlbi4NCj4gDQo+IFJl
Z2FyZHMsDQo+IA0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzIyMjIzMyk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC0NCj4gY29yZS9tZXNzYWdlLzIyMjIzMw0KPiA+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNDgxNjMxNy8zNjE3MTU2DQo+ID4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gW21hcnRpbi5qYW5zYUBnbWFpbC5jb21dDQo+ID4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

