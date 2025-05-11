Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FD3C3ABC3
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 14:57:46 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.47])
 by mx.groups.io with SMTP id smtpd.web10.30406.1746975459413991133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 07:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=E4At1o/z;
 spf=pass (domain: siemens.com, ip: 40.107.162.47, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJt2inVJOMw+bhyY8MrY3NTIxFRYD9aasNLY7/AzPWnTcVdyD66JjQ0O2pV7qXcV1FIzlqVLy6P9DOfr+TsNDYueI/K6KliI+VN+CDOCbaIhYrYNvO7CjqMeGeSf2gMEcHRug1+dIO2aJO0mt1oOVnhyVZ+bcGZYOPcHWSyxCtIKC7E22rUjRSTIS5YWCGTdNdN6UQ+q70UhT3uQAwn+izXHxyTVEiYTN7pswaypqafQqWexWmbxDpTt0rmGRvSjf9QYfsccfaKMiJeaEDZW3HU8e3HJhMHk4cx6O2F6FOLmtn4wyVolbG2Yw9xa/0zOxeInq/IsaCmbZUgYAym5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5VO5mCWCk2VL8P0mtSoY53Mo2QBhDyxDQ0/12NB/Ew=;
 b=L2zGMJHaEaUZpF5Vks8W9hF01PxgsDvx0RZyWdC50/WIEFx6G/c65MRkD29pHjeHwIPmmk8mILdQnwCm5wGv/95YYONB6iXF7tJ0JtfZTgDhwChSJ+R93j9S57kBP6vEto3CD9HW9C7Csbx/fOl8EVc+QBO7plEgfWrhqvO/2U+o23PROQPWkbm33CiYIKO0DIMUErKk3az2NGCHvvknBGFEH+P/7pDnbMZ42enK6sqwMHfFG/Y6LOLjGoXdYZt86TQXP3x9ivmwWkpCduGuhLFiT3xZ4oUJiKMCIzHOwOCC+hbwFmycLm61akLq0qpfl0fyeCHPR8Jwsu2GF3RanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5VO5mCWCk2VL8P0mtSoY53Mo2QBhDyxDQ0/12NB/Ew=;
 b=E4At1o/zIfOa7yXiaISpq5S8QgH9KRRMnYf09AFI/sUrD7oWzhZZQ4uIO29fmBatdrU8M/pF3kl88I67iZOpR83SvBN2XK85+/9paZcKYEufmljZ4/9PiRH8Md5qAglL+jy3Zwsye5NnWysjW4ZMRNHgHvbTOfN2hrTXCnYhG/16tEZ6RYBztP/6EywGd6v1phRzEeESra7ibBDmTGNgE2S1CxzzhgZ4kz9ujBo9c2YsVNIY5IlPn+zXSk74HYOVGQ9dU3DBy+q8hAblTURrOkaLNTha/W0wEu59IPyDdhmJkJkfoReeyN9O3APQMqjOvdOhRbdSlizqXahvlP9Caw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:465::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 14:57:34 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.021; Sun, 11 May 2025
 14:57:34 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.49.1
Thread-Topic: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.49.1
Thread-Index: AQHbvyiWIPiz2mXjmU2qPA+y71GHRrPKAiuAgAOJRoA=
Date: Sun, 11 May 2025 14:57:33 +0000
Message-ID: 
 <AS1PR10MB56973B52541A30959CB2E6B7FD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250507081717.287535-1-peter.marko@siemens.com>
 <D9RI6IRC16OO.31JTIVJFTPSGC@bootlin.com>
In-Reply-To: <D9RI6IRC16OO.31JTIVJFTPSGC@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8f4be261-ef61-4183-9dec-86ac79667816;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-11T14:56:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6876:EE_
x-ms-office365-filtering-correlation-id: 0f5f75c1-5a67-41ab-6f31-08dd909c296f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K2tNT2lnRUZSTndwWENhcnh0N3VYNEdRTlhPbzQ4aGVLa2JETGtWSVJEMWpD?=
 =?utf-8?B?cnA0T1VXT3htYi9tTmtwdFA3d1dWbVpaa1ovT0wydnlGM2E2UUp4eWczU3Ry?=
 =?utf-8?B?d0I4aG5tMVdBV2tYRUhtU09NTFJMOGt2R1lkdmZUK09VZ3V3NkZYMEsreW5H?=
 =?utf-8?B?NnNDVjIySm5abEZHYWFTeFZLVEdVZ2hvUVllemJJcHpOM2RjMzRSZ1d3amxL?=
 =?utf-8?B?OFNFb211UUc0c0I2MGxQWGhLbEJHaVpmbzlBZjFZYk1kdnNkSnluUi81V3RH?=
 =?utf-8?B?UEYvUDlUaEhFb2QydDdqOVhNUTI3ek4wbjdWelY2cE05d2RPRkhRZW1qN3Jq?=
 =?utf-8?B?OE9TTlZjWDNsK2s2Y251ZUlSSUJXSGxJbkF6ajFVOERJM2JQdEl0SDBlRmRC?=
 =?utf-8?B?cWg5SWVIdW92U3Y2NzVKZVYvbTFPTWpEamg5dk95ZXgrS21vYmxHVWR4ck5u?=
 =?utf-8?B?SVJWNFpjRndUV25Wa0xuYnNEU2FUU2dlb0NQRWpHUVF2TnhuaHh5ZFNRQUg0?=
 =?utf-8?B?eCtYKzA3akxJb0NjdG1EYzhaWXU1aTNCYWx0MnVYNE5RVW40UFRtbDUzRlBa?=
 =?utf-8?B?ajh1Z0swazdMR0RORDBKK0g5cjEyMVlhc0tOczVjcDhPNS91TkhXQkpjSk5V?=
 =?utf-8?B?QXNZSkNQSHlIdWhGc0lxWXRBVUdSaGE2Y3RWZU84SjUzYkpMYXJ2S2ZOOGhG?=
 =?utf-8?B?K2NaV2FuZFl0V1p4Skg1ajV3dGpvOTVHM1hKUG9uRWVJbks1ZG5ZQ3R5UFYx?=
 =?utf-8?B?enE0WFRyUGJFNEhHcnhuV2VORXpRYnkzMi9KWkZkVi9uUnluQWl3a1YwT2ZJ?=
 =?utf-8?B?SiszVUZtbVM3WjR2R3dGV1F4M1FoT0hhUFVEcWthOWp6byt4TTA3YkUzZkFt?=
 =?utf-8?B?cUl3T0RRSG5yMnZrVzFxbi9qWlpJVjZyUmE3Rng5V3djZWFDL3ZVNjJWVHlU?=
 =?utf-8?B?NzI4MVVPK1dHVVlzZms1aVBuRnpvTkd3d2p3RHZaSkxFSlJFR05HckppQ2xa?=
 =?utf-8?B?My9Bd1lvcjBRSTJLSitXbEovaGdVc2hKSGMvR2xoM20zclYzT3d5WmtiSkR0?=
 =?utf-8?B?VitaL2NRSWRtRHNFaFFvbjJWOGh5eDlLZWFpYytsc3dLM1BuVTljazBLcUYz?=
 =?utf-8?B?WWRvNWtLZFVzMTB1czFRdDBjMzdCdTQ5UDF5Y2hYVjVsSVVPRHUrYWFYVXph?=
 =?utf-8?B?OTZBTlFsTGFnOEhyaE9DVVBtc0VkZmY3NVA5NFVUR3B6M3doSyszeEM5ekFP?=
 =?utf-8?B?eC9FdTBlb0poTXNtSE5rODhpTzFVMjVXcGVFNnFWbG1rR05JajJGOFFHZmNU?=
 =?utf-8?B?alVzb2JlMFlLTzRhbmVDSis1MVp1aXlucnA1cmJDSGhGYWFUdFF5bXU3WGs0?=
 =?utf-8?B?SWdqWDNkejJybjFqUXJwaGlxcm94RksrWlJQMk02dFdNNTFJNzdVcUdIcE5T?=
 =?utf-8?B?Q0dPYUtNc3F6Ull6d0luU1NreFFiVUNQQjRWcCsrSDJDd0gyQlNDcEhheDdH?=
 =?utf-8?B?OHFxR3RZT2JTeWJDcjBBWldzOHFBcXZ6WE4xZUt1aCtWcUFRY21rVTVRVzBj?=
 =?utf-8?B?dk5yS0pDSUdoRzErZ00yQnBoOGo1SWJyVDI0V05oai81L0NUWE5VdWJOUXlO?=
 =?utf-8?B?WDgzNU5EdXNKNTBWcGQyOTE2UVVUWUFuOVNqZ2c2QTU1SW1XbElWWGRFT2U0?=
 =?utf-8?B?em5NaGV6cFpZZmxRUDFZdmFaa2VLS1hKcGlORU1MdEgvTjRaWUJrUHZRdUdR?=
 =?utf-8?B?QkxkMXZTQWluT2Vnc0NDTWZwRG1PNVY5SDFkejFxc2Vtam55UjYrYTBwWjJr?=
 =?utf-8?B?c3I3UW45d1JrZmdlbkwzdXVPR251WFZMNEp1cEphcmN6aVBuZ0FRTHRDRlpO?=
 =?utf-8?B?VGM0d0dHdWMwV1JoMThJUzIyTzBkSlhQT0Q5S2lRMVAxbTVDSVE1VmEwL3J3?=
 =?utf-8?Q?T82UXrC1qdU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWdwK1NSa2RDTkZid21lQzlCOUxJZzkwWDZ2WWZvekhLRGdMcWpYSmtTTTF1?=
 =?utf-8?B?M0tvMWhhV0t3ZWVIWWRTcGtVYm1laUJMdFJDeGFYSjcxZzhsb2FnejBDNXN5?=
 =?utf-8?B?dStwZU1wSno0bTFqMmgzK29YRUoyL0YvcDZzRWFJOGIwaVlHOXNRdEs2aDZx?=
 =?utf-8?B?YVFuWDI0aythUFlvT00veERKTU52cUsvS3NxQ1JWMVdMUTdjQ1NhSmNlRWlN?=
 =?utf-8?B?dTZPckF4V2JOVjJpeS9oNnZnUDhtQjR5TGtYSkNsU0NDOVZ4dmFac1JyQ3hT?=
 =?utf-8?B?NzJzMDN1cXFpakZVandJR05NQ3FZOGJGbVRkczgrVXphc1NLL2lNaHNjZzhp?=
 =?utf-8?B?NFlPOVhrUmpqRUkxZlFjVEdveDBCSVpML1ZxMDZ0THJ4Y1Q0eUZiWkw1S0NY?=
 =?utf-8?B?dThFSGt5RWJ1Y0k1cmNpR1Y5bXZQVUthdGJsUGsrditwLzZMblI5Q3pVV2hH?=
 =?utf-8?B?OG5pRGVKT2Z1cmptbUhjZ0IyTjA1VS9PUG1UenFpN1ArUkVsY1pWc08yeU1D?=
 =?utf-8?B?QWU3djJsT0dveVRIUGRyMTRoQ1U0UzFKUW85eC94a3hlZC81SGhUaTVVT1Vo?=
 =?utf-8?B?MWZHSytHU25PQzJuS0xlSVhBMEhkbEdCUmtmTzN5N0lkMGNtUmJobmlOWE51?=
 =?utf-8?B?djB5YUZoZVJSeWdCQ1NHSnNERVJqanc1WnlTMUtUN0ZmUm45MFpjK3BVb1dB?=
 =?utf-8?B?WkthYzJsWTlpWEM2Q2Y5VFc0MFJ4d0REcEN0aWpTZ2x2U1FCRWpucXhoOFI1?=
 =?utf-8?B?NEorRVBrdlo5SUMxN0h5STZoMk9nNi9lN3YvcEwzbE44aUtKd3BheSttR3RB?=
 =?utf-8?B?bGFvaEU2azZkLzh1YkNYNHlVem4xNHdJOGRnbnRXZmtnNWdKOWg4Wm9TdVUr?=
 =?utf-8?B?SXZrRGQvYlcxTEkvbTZ5K3pjcGFEMlpwZW1jaUtyOVNhb2NLVW1qRFRheVFz?=
 =?utf-8?B?cytsMnZGSy80aUJ6c2dRQU4yTiswRm9La1MxWnJ0bHNFRnVlK1pZMmpielZH?=
 =?utf-8?B?a1lkTzBFK0ZVaDBXUHE4N2xicjVrYjl0VVdpSGp3RHJMSmFvNkRBRkNIaXpn?=
 =?utf-8?B?VnB2UTBJOFUvZzIrU2U1QVoyU0V5RlFQYXFwL0xOS0ZXSXFaNk1VQ3g1ZGd3?=
 =?utf-8?B?Q3dJNzZFZGRNL2R0ejFRV25aTVAxb3pwZEtUNWFSbXRaWDZEQWdEOEVZVU1Q?=
 =?utf-8?B?aTNHSG1WWFp1Ny9qV2Erd05oT1NIcGFLQlB4ZFo0ZmwrSUgwK29NOWtMUGtJ?=
 =?utf-8?B?R2RBU2M2N0QzRzdQNVB6Z1ZpOVFKRFRhREQrVDZIZlIxdklQT0pVeGtiWWpI?=
 =?utf-8?B?U1hZOWlHQjB4YUYvcWxoQ3lRS2EzVExjT0UzR2tpSWU3VUtQcjlRb0Q5Titm?=
 =?utf-8?B?Q1R2R0FRRGZYd24xOHVSM1JoRFFUZWxSa1NYdkFjUXZIZWpkSzhHYy9Hanpj?=
 =?utf-8?B?NjlLNkdVUklLMG13VjdMdXR3VVJ4RkliL2tFa1hhWFBnSS9FdnE5RnNqYzVU?=
 =?utf-8?B?a2ZCOUtGTUFSWUsrUDBpWXVUV2NrNC9Wekc3Nm9palFueno4UDVsbDlBamtD?=
 =?utf-8?B?RDJKUmp3QklSRU1aMUwvRGFlM2NQM3Q4Z1lMeE9kc0x2RTZUYzVPdU4zUmhL?=
 =?utf-8?B?SW51cVZHakc2UHhBenVpL2ZpK0w2TzVxTHAwNG4yejYyTy9nTG1kd1d1aElk?=
 =?utf-8?B?U3hCSjI2RnJ2OHJrTHpxckcyMDhTTWU4TGUyOG04cXVjN0FHNEMySUM2STZO?=
 =?utf-8?B?dlVRZk9CNXR0cDljY1g4OUs5ZEJtT0J0V28zUHZ1bkVUR2hicHNscTlBZnRx?=
 =?utf-8?B?TFgzdEJsMTdnUUFXVjBRdnJtd1dtV2NTVE1NNUZDNmRRS21KcmtTTFFzSC9Z?=
 =?utf-8?B?L1dIYlpXaTcrR3FxN3BsZHFlSksrbXByT0o1WWtsNi9ZR1pDUk5mRUdzM3Zl?=
 =?utf-8?B?QklKMUhmZGdpQTZrK0xpeDRJVGw5MzdPMGxWNGYvUGRmRXRLSDZuYVQ2VGlW?=
 =?utf-8?B?V20yZWNnNjY0Yk1yVGNmM1FrTE1KYjBnMUxVbTRuSDIvYU9DVDlSaytzYVo2?=
 =?utf-8?B?M3RNRGlMSjF2V3EyUDJOVEc0clBnR3YwZVZLdFMyR0FiUGFiNU4zQ29ZM3NB?=
 =?utf-8?Q?Izce9WMcbk5DvBRvw2r4EvWUT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5f75c1-5a67-41ab-6f31-08dd909c296f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2025 14:57:34.0503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TlrnUDNF9czoDfdBqBHj9nFNWDTFGemYGzsyXpBXr1TO1qSr/QANwHU4uPAV0vYJlecImvb/HCp3qwvDBmfX2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 14:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216285

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTWF5IDksIDIwMjUgMTA6NTYNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMx
KSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjJdIHNxbGl0
ZTM6IHVwZ3JhZGUgMy40OC4wIC0+IDMuNDkuMQ0KPiANCj4gT24gV2VkIE1heSA3LCAyMDI1IGF0
IDEwOjE3IEFNIENFU1QsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IHdyb3RlOg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4N
Cj4gPg0KPiA+IEhhbmRsZSBDVkUtMjAyNS0zMjc3LCBDVkUtMjAyNS0yOTA4NyBhbmQgQ1ZFLTIw
MjUtMjkwODguDQo+ID4NCj4gPiBUaGlzIHVwZGF0ZSBpbmNsdWRlcyBtYWpvciBjaGFuZ2UgaW4g
aG93IGl0IGlzIGJ1aWx0Lg0KPiA+IEluc3RlYWQgb2YgYXV0b3Rvb2xzLCBhdXRvc2V0dXAgaXMg
dXNlZC4NCj4gPg0KPiA+IEF1dG9zZXR1cCAoaHR0cHM6Ly9tc3RldmViLmdpdGh1Yi5pby9hdXRv
c2V0dXAvKSBjbGFpbXMgdG8gYmUNCj4gPiAqIFJlcGxhY2VtZW50IGZvciBhdXRvY29uZiBpbiBt
YW55IHNpdHVhdGlvbnMNCj4gPiBIb3dldmVyIGl0IGFsc28gY2xhaW1zIE5PVCB0bw0KPiA+ICog
SW50ZW5kZWQgdG8gcmVwbGFjZSBhbGwgcG9zc2libGUgdXNlcyBvZiBhdXRvY29uZg0KPiA+IFRo
aXMgbWVhbnMgdGhhdCBzb21lIGF1dG9jb25mIGZlYXR1cmVzIGFyZSBub3QgYXZhaWxhYmxlLg0K
PiA+DQo+ID4gUmVjaXBlIGNoYW5nZXM6DQo+ID4gKiBzdG9wIGluaGVyaXRpbmcgYXV0b3Rvb2xz
IGFuZCBkZWZpbmUgQiwgZG9fY29uZmlndXJlIGFuZCBkb19pbnN0YWxsDQo+ID4gKiBkZXBlbmQg
b24gemxpYiB1bmNvbmRpdGlvbmFsbHksIGF1dG9jb25mIGNhbm5vdCBiZSBwcmVjb25maWd1cmVk
IGluDQo+ID4gICBzaW1pbGFyIHdheSBhcyBhdXRvdG9vbHMNCj4gPiAqIHVwZGF0ZSBwYWNrYWdl
Y29uZmlnIG9wdGlvbnMgdG8gbWF0Y2ggbmV3IHN5bnRheA0KPiA+ICogbGliZWRpdCBpcyBkZXRl
Y3RlZCB3aXRoIG5jdXJzZXMgbGlua2luZyBvcHRpb25zIChhcyBzZWVuIGluDQo+ID4gICBkb19j
b25maWd1cmUgbG9nKQ0KPiA+ICogYmFja3BvcnQgcnBhdGhzIGZpeA0KPiA+ICogZGVmaW5lIHNv
bmFtZSB0byBhdm9pZCBmaWxlLXJkZXBzIFFBIGVycm9yIGR1ZSB0byB3cm9uZyBsaWJyYXJ5IG5h
bWUNCj4gPiAqIGNsZWFuIEIgZm9yIGRvX2NvbmZpZ3VyZSBhcyB0aGUgbmV3IE1ha2VmaWxlcyBk
byBub3Qgc2VlbSB0byBwcm9wZXJseQ0KPiA+ICAgcmV0cmlnZ2VyIGJ1aWxkIGlmIGNvbmZpZ3Vy
YXRpb24gY2hhbmdlcw0KPiA+ICogdXNlIHVuc3RyaXBwZWQgYmluYXJpZXMgZm9yIG5hdGl2ZSAo
bm9uLWNyb3NzLWNvbXBpbGUpIGNhc2UNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1h
cmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gDQo+IEhpIFBldGVyLA0K
PiANCj4gVGhhbmtzIGZvciB0aGUgdjIuDQo+IA0KPiBJIGJlbGlldmUgd2Ugc3RpbGwgaGF2ZSBz
b21lIGlzc3VlcyB3aXRoIHRoaXMgdmVyc2lvbi4gTm90IGZ1bGx5DQo+IGNvbmZpZGVudCwgYXMg
aXQgc2VlbXMgYSBiaXQgaW50ZXJtaXR0ZW50IGFuZCBJIGNhbm5vdCBzZWUgYSBkaXJlY3QgbGlu
aw0KPiBiZXR3ZWVuIHlvdXIgY2hhbmdlIGFuZCB0aGUgZXJyb3IuIEkgd2lsbCB0cnkgdG8gZHJv
cCBpdCBmcm9tIG15IGJyYW5jaA0KPiBhbmQgc2VlIGlmIGl0IGRvZXMgZml4IHRoZSBidWlsZC4N
Cj4gDQo+IDIwMjUtMDUtMDkgMDY6Mjc6MTcsNjQ0IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0NCj4g
YnVpbGRvcHRpb25zLkFyY2hpdmVyVGVzdC50ZXN0X2FyY2hfd29ya19kaXJfYW5kX2V4cG9ydF9z
b3VyY2UNCj4gKHN1YnVuaXQuUmVtb3RlZFRlc3RDYXNlKQ0KPiAyMDI1LTA1LTA5IDA2OjI3OjE3
LDY0NCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtICAuLi4gRkFJTA0KPiAuLi4NCj4gQXNzZXJ0aW9u
RXJyb3I6IDEgIT0gMCA6DQo+IENvdWxkbid0IGJ1aWxkIHhjdXJzb3J0cmFuc3BhcmVudHRoZW1l
Lg0KPiAuLi4NCj4gQnJva2VuUGlwZUVycm9yOiBbRXJybm8gMzJdIEJyb2tlbiBwaXBlDQo+IA0K
PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVy
cy8zNS9idWlsZHMvMTUxOA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dmFsa3lyaWUvIy9idWlsZGVycy80OC9idWlsZHMvMTQ2OA0KPiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy84L2J1aWxkcy8xNTg1DQo+IA0K
PiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoaXMgcGxlYXNlPw0KDQpPSywgc28gYmFjayB0byB2
MCB3aGljaCBpcyB1Z2x5IGJ1dCBzaG91bGQgd29yay4NClYzIHBhdGNoIGlzIG91dC4NCg0KUGV0
ZXINCg0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0K
DQo=

