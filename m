Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AEFC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 18:16:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.web11.34388.1742149007565469358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 11:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DqYCu2df;
 spf=pass (domain: siemens.com, ip: 40.107.162.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/CKWEA/4Oyr9a5CDJUcewMfxLcKQY811WyPlgINw88fF8LZta1W8fPlmDnCDCuwq0ue5r2bFHhX7+C/Ubd2hjztACQwbUDrFaqsLtZm0GhtLQQ6VQcCg3ClZJ44HjHLkOAXxoPNOGCC2dIcGTzNUMexV2t/03AOH1mZQHwCTV1XbgZQB3RUFjtXR4IITxnCRm6ftXiiDcWQ6KEu2/RyN9XoJYOOFMebjnRLLlofuCb671434qwjJDDm/1IZv/vgSjOLmVcYNswzTZHevlbysPysxZAl9PYE8ZJPPVuSERI0D2CvIrMNP7M75pNl3hc7fJrnqUsz3RS+EG8DLsHfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cnYjksw+5gY9fNX4YdVIbwRVqlb7rBsZAPwNL6jaJw=;
 b=BQ0wiaie144caMkxFGlV3rw41stgIPq+MQIEpfLtVRS7+GWZ2HhOx5WaKLQn9ik/1thseCl2l83WGtPoNGr72MTaVngb450IS27LSi3ZUohj6o1Qzh6BL1A/20yqLKdKUXvme6cpck73mennBtnRSTEkLvCzX5KFmiGZyMndBbgR0/XbkiCjIH0NZukokXuVq+/6MLJx16BabUFvyd3dRFnqoc6mKGqf1V5ZTaF+Qcg9mTflr1UHbO6q1JoIMGETR/ob0F8z48NIrWyPWDXAITBczPrjC7vEN7q4cHZ2XEvlFpCq2P1HGkZX6AjWWUnJIiRcrzRTieu4TGG1/4Cdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cnYjksw+5gY9fNX4YdVIbwRVqlb7rBsZAPwNL6jaJw=;
 b=DqYCu2dfvjzaHEwksonDu3Mbitm+vbOSDt/8Qpf27KNeNXqyeuGUnYax+oFsYrMIH1GhZL9a/LlylQJ+rMeEEfCKCtutYG2zLXBz16wq0C2x3rIFytmsasj0c/x1grbMNPXayvbDloaKvegs8A6a8/Ge/Oau52qgEbhTRcXPeIj/xVX9XsnC/4XSELLV3OA5Oc9KJhOQ50M4VHwaJZnfoHdS//09psRjj6+c1GWv7qiRGw2Qksxo0l20J80qpjCj53a2R8E5Ki/LMp8ed8sAIhi2qgPB85/NmdRwe+04yD+Oqo/65UsskYCfQUKs0YG6VXvFfc+CIkZlEvbErFckVg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7590.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:402::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Sun, 16 Mar
 2025 18:16:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8534.031; Sun, 16 Mar 2025
 18:16:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Topic: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Index: AQHbkbsRN8sfhIqob0KOL2yaycfjLrNsUxmAgAABHZCACcX0oA==
Date: Sun, 16 Mar 2025 18:16:44 +0000
Message-ID: 
 <AS1PR10MB5697C8041F4E3E9FEB36D4FFFDDC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250310124949.2414614-1-peter.marko@siemens.com>
 <387AAA58-90B2-4F98-9CA7-7287198371CD@arm.com>
 <AS1PR10MB56973C195061C8E5FBE5D8E6FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56973C195061C8E5FBE5D8E6FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c3ecc6f1-974e-40c6-b17c-f721acf2df35;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-10T12:56:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7590:EE_
x-ms-office365-filtering-correlation-id: 1094d639-de6c-4e96-f5c4-08dd64b6b544
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NmdoWVRTWDBuZ0luM3lrdDZQa1dHeEYzci9zekVadGJtdUNISmlpTFJtQTdM?=
 =?utf-8?B?UFBpbjdiaXR3TUJxRlJFVmU0ZExVOStiZGZ4cW45eDY1cUw4aHJsRVpCSmth?=
 =?utf-8?B?TnJpbC9veEQyL0Q3Zlp1bDdFU2R2UVZZNldSYXFPR2tZWTZPcks5a3lQRnBS?=
 =?utf-8?B?U1FZVUZuNmZ0NGdyNzdqSEpNN2hFTXNsOXdBc2RubVk4Zm1tc3RUc25xQkVJ?=
 =?utf-8?B?aUdaYkxHVGQ0RHdaVmZONWV1c0RyM0FvVXpKUklOUGU1ajEwZCswWVQ5aGJS?=
 =?utf-8?B?R3NDZ1Jvb2RRbmRWZEZSYzBodGpWT25zSnNYZnZ4bGVGdjJDMXZ1bHVTY290?=
 =?utf-8?B?ME5ydmFBRDJQdXYzZXhyODVHbDdoMU43bUdRNE9DTlY5NWRnanhPU0kzOVJC?=
 =?utf-8?B?Vnp1M0RHcjZRNlVVZnlWUXRsT2VqVlRDb1F3alJDNFZRaWFSaHBISlFIZVdj?=
 =?utf-8?B?NU5kWmtWTVdGVFMwOEdnWGxjaUFQZWF5SkxjTkZERXhjZ0tWeS8rcDEyMjdk?=
 =?utf-8?B?dU85Zm5yQzduWm10dXJzdHpuTDV5OHpDMERpRThWSjR1WGluaTZkR3VOaUli?=
 =?utf-8?B?SytWN2lXU0E2b2hiUllmRWwvV2Mxa1BpaHhzWlJXMDhvd2VXU3RGbnhRNDQr?=
 =?utf-8?B?S3Z2Vmt1OW1XTGxVYlprQjR0bDBMbDRYakdkU0Q0MDErMVNycFp6aEt4Q25r?=
 =?utf-8?B?L3B4eUgrUlpGOFBHU0dRdHBKM2xrcXE5Qjl3TFlFbWdaamRldFk5enlEejZj?=
 =?utf-8?B?eFh1cDd5VlNkZVUwZUdZb2VlWUlKWWJJTU8yZ3ducDg5UUI2MWpnbzRXeGM1?=
 =?utf-8?B?M3N2TUtnTDg0MnpVL0QzY2oxd0kxYUIyWFRnZ2pPM0xnMzEzVkRIdzFZc2Ix?=
 =?utf-8?B?ejJqMGZrUzNrdWRtZ3BHeUYySThmZnl4ZE1lOGI2SURLM1h0TGl6ekptQmRm?=
 =?utf-8?B?dWVnaVNCenlJeWwwWHdsTmNzc2FZM2FSZ2g5UlB6ZVkvNENJRG9pU2FocjZ3?=
 =?utf-8?B?WUg1dStTOVB6dDVSQ0NIaXlnL1p3bWZXZHBlditBQUxpZnlYNjM1TlppNURx?=
 =?utf-8?B?MGxobWExRnczQndCT0hZaUFGVWNiSjRISUpHbGdiV01HVEJXSE41QmpuZFlV?=
 =?utf-8?B?bXJ5cEUwODZKR0c0Sm1CU0xXbWh6MFZVaHhpQm9VeHNQK2xZNzc0Vnc5cHdK?=
 =?utf-8?B?WE1CamRhcVAveGpKbnVIOE1HRHN0TFhWcjByZ0ZobVlDekhLWkNYSTFpcVdo?=
 =?utf-8?B?Rjc4TEVzRU90M1dnWXFDL1Q1OWZEbFlza1RWNUk4d2hScEE4bXFDa1pFTGl0?=
 =?utf-8?B?cnFieDNiTW12RFV3akhMNURVRlJKVUJSRXArcWYzajJoeEh1WEVjWDdRd00z?=
 =?utf-8?B?L251bU1SS25jV2N2ZmxLMER5RnM2Y2ZBaWJqSkRUZVhZUWw0azdFUUNoRE1o?=
 =?utf-8?B?bXhsQmVDRjlrYVY1SWZzb0liUUNuVzM2U2R0TXhKMjZFQWtCalNoSG5ubXFE?=
 =?utf-8?B?Y2RwdkdGczJZMGxzSFE5Y01pdC9RTGNqNDltYVJkbFovWnZYazdnOFlqakdL?=
 =?utf-8?B?SkRMekttV1dyRUFhUmlEaS9kSkE4YjRQaGxKT28weDFJd1p3UDlvR1VZeUVT?=
 =?utf-8?B?K2ErNDM1VDdXNm94YllYRlhvR3BSVGd5K2pESUt1R3F5Y200ZFlyZ1BvL0Q3?=
 =?utf-8?B?TDA4Q2ZiWUQxZ0V0QmhIUmloVWRNL0oxMVhiSkUrY0IwYysxS0ZXTnJua1FX?=
 =?utf-8?B?L21SU0FMU0tyVkw4Z2NNMnpYcUl5Wm1yYVFpQXE1NVhuRTYrNFJPUWVXVDRK?=
 =?utf-8?B?MGgzZTlvY3kyMEd3WWNMQTJSUXUvb1NIWTBsb2hndGl0SXdzTDNDY3dFWkNx?=
 =?utf-8?B?dzhqVk5wVjZmRlRSNUhyb2pjcjFrMm4wSHEyN3B0elRwNkM2TGdKMWFtQ0Rv?=
 =?utf-8?Q?NrzQ1MJGgdZYt1hLhxzFyXaTe8QaCZqT?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Wk9DbVNDd1RRMlBCbDUyMXpDdFB3ci9rNGRhV3hkZnJLSUFyM29weUtncmRw?=
 =?utf-8?B?QnoxeUM3dWZDSDdzanA5WVlKdnJ4WEhrV0FLWi9FVFpwd2lHRFpTUHdYcE0x?=
 =?utf-8?B?VXMyS2RqODBsVVpBM1lYZWNQTmN2RFN5c2I4RE01RC9hSG01Ti9XYnJHa21r?=
 =?utf-8?B?Vkw1dFpUdDQ1WDdCRzdkb2NNTFNNMGRIS0R5czFMZHF4bmJEOUI3ck5iQmIx?=
 =?utf-8?B?Y2dZQ2luWXMzN0dEVFN4MGc1MldVZmQ0SUdIc2V3UW96UG43Vzl1M252aFhx?=
 =?utf-8?B?UzRxTnQ5ZmZQeUF3eVdyeEVudGV2M2VrMWFRMnNPV0V5b3c2SXZRL3hRQk82?=
 =?utf-8?B?ZXFmY1Q1Q1hyV1hjOFNJdGtHczVUQVFla1dFSVVmS3RDVlNpazk2YytXOEpQ?=
 =?utf-8?B?V3dVQzB4YThmL1dqTHRWbGkvRkxlV1JkVjBBN21JSXhmZmNtVzZPcytCSGk3?=
 =?utf-8?B?NWJqTnJJeXFxcTh5QXJYM2FXZ0ZkV0VCdzdZMWlPVnNVYjFDMGcxTzlUbUhX?=
 =?utf-8?B?RkJoV2xmc3g1bmtmSVlvN0lSdFhzNVRJelc1c3A5ZUlIdjBMRXVmd1JDTG9L?=
 =?utf-8?B?c1phTWJiRVlrZ2VDa2FmeU55UTI1NFlYbUY1TkdiVHZ2MlF2K3psNnNhbWNF?=
 =?utf-8?B?SzBRNEw2QWp4b0k2M2ovaFh6OUFMaHVOU2xWOS9sTG5OTXVNeGRtR3Ntc1d4?=
 =?utf-8?B?VGpCNEs0Tk5PdUxyNUxaQTdrSXJPRjdzVGh5dUlHNHdxVS9rQndjS2x0K0x4?=
 =?utf-8?B?ekRzSXAycGdQUkg4ekQwalUyZkU5L0JXci9MWDcvY1ExbStaQ0ZiSGYvR0x2?=
 =?utf-8?B?dlBIUy93UkF5dDFrNGdOdHJ5N2x6cTlrZ3Zham9tTGNKRExKNzZ3T2dheU1V?=
 =?utf-8?B?dHZLTjBxMVkwZ09ndjBQZlhHV0JSR0RtblAxMWJjRDBCVFVmdHlKSXFXUnJO?=
 =?utf-8?B?RlkzMFBKVVpGaXNRS2xNekZKc1d3b2x2TU15dlRWVitNZ0xJR0JKTkVPUTRr?=
 =?utf-8?B?WUU1VG81cTZranExTXFkRXBWQWNxb0NrckFtNFhUMDVIVTBTWStBMVpLWkY4?=
 =?utf-8?B?VTIyQTdZL0VCd2lIck9vMDNscFR6dzl3WWlWamJyMEcrZngxZ204cUN0MjJN?=
 =?utf-8?B?K3lDeUpJczhvL3ZwL01wcm03RitucFRSNVBkU0lBQm9qSVlQMkFPc2NaMldU?=
 =?utf-8?B?VXZhekMrNXlRcE5uZllWdHluSi9WRG5FQnJWV09SMDZkUEJkY2gwMEErcGw5?=
 =?utf-8?B?dXJzME1ka0FTVWZ2b3ArV2J0L3ZMdTRlTnR6ZDBHdU1lRVJWRzYrRHhSV2hi?=
 =?utf-8?B?b2NLZU42ZjAzMFdteUM5c2tOb1lMdHBnZEUrYXkvSzBEUEExNTFidHlLYVpV?=
 =?utf-8?B?eWhWcXVGOVdFRTl1QTJRaVBoUEtyeGdxSUJtMDRkdU9DYlNHdU5vVE0rT3Nj?=
 =?utf-8?B?RG1GbnArTXpFWGQwQTVZb1V6QkJtaGJ0UnoxanlhNHJIZEl4R2NTZUtlQ2Q3?=
 =?utf-8?B?UXRFdzd5bkkySWtDMzVqclU5dCtaZFNYbFpKNWpGMDZOeUxVOVBmaDViRFhh?=
 =?utf-8?B?TlBucGNGMXVTbFpldzh0M1k3TEVGTlRCdVB3MnpiTllQZC9JSm9WSXZBeXE4?=
 =?utf-8?B?ZGxaL251UnBBRXRsSDdzN0JaS2s5WjFSaVlFWWhqYkVKbFB3czlVdmVHcGcz?=
 =?utf-8?B?UU1PZ09VUVd2Q0ppOTNna3YwNnIwa2QwcnVsYmduK2lrelliVHBYN0xBT0wz?=
 =?utf-8?B?ZTd4MXA1KzVtY0tpeWpOdzlyRGJabjZHMFFKZW5HNTd6UGxpSjdyaDRWRFhn?=
 =?utf-8?B?dytyT09iWnlOQWZhQ1gzcW9DU01rY3JpbEFyL3pDK2ZXamIrdGhTSTNBMUVm?=
 =?utf-8?B?cHo2NENjbWZRNHk1NnE2SGpKbjhQclFZWjlWVnpGRU8ybzNHR1ZUMkNZWnhE?=
 =?utf-8?B?S3dJV2J1U1dySElCbTBuZXRiNG9VK1VRL0J4YzZyR2lUSzJMM1lWd0RUNXJ0?=
 =?utf-8?B?VGRzUCsrTFEvMmVnNkRIODZYSUU1VE1TMGZpMDR3akJLMmdISjlFUFBFcUcw?=
 =?utf-8?B?bnlGOTFwcGNNT2djYkRoRWRlc2U1K2Zxak11MUo2SUdwcVRtcjZTOGhCQjJo?=
 =?utf-8?Q?jw1atQvjkMEo7ssrJD08CkNOv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1094d639-de6c-4e96-f5c4-08dd64b6b544
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2025 18:16:44.4152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xryLXA6ZppObR+/i8PDFYDPpumbpJ1S1s4MJAfCNZWxA7RO1STYAO1PwUsixfmAKEqj0CmwmZfYW08S1QC5k5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 18:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213055

T25lIHdlZWsgbGF0ZXIgdGhlc2UgQ1ZFcyB3ZXJlIGV4dGVuZGVkIHRvIHhzZXJ2ZXIteG9yZy4N
CkkgaGF2ZSBhbHNvIHNlbnQgdGhlc2UgdWdseSBwYXRjaGVzIGZvciB0aGF0Lg0KDQpUaGUgQ1ZF
cyBhbHNvIG5vdyBoYXZlIGEgYmFubmVyIHNheWluZzoNClRoaXMgQ1ZFIHJlY29yZCBoYXMgYmVl
biB1cGRhdGVkIGFmdGVyIE5WRCBlbnJpY2htZW50IGVmZm9ydHMgd2VyZSBjb21wbGV0ZWQuIEVu
cmljaG1lbnQgZGF0YSBzdXBwbGllZCBieSB0aGUgTlZEIG1heSByZXF1aXJlIGFtZW5kbWVudCBk
dWUgdG8gdGhlc2UgY2hhbmdlcy4NCkkgZ3Vlc3MgYXQgbGVhc3Qgd2UnbGwgZmluYWxseSBoYXZl
IG1vcmUgQ1ZFcyBpbiBvdXIgbGlzdHMuDQpPbiB0aGUgb3RoZXIgaGFuZCwgbWF5YmUgbW9yZSB3
b3JrIHRvIG1hcmsgdGhlbT8NCg0KQ05BIGhlcmUgaXMgUmVkIGhhdCwgSW5jLg0KSSBndWVzcyB5
b3UnZCBoYXZlIHRvIGVtYWlsIHRoZW0gdG8gaGF2ZSB0aGUgZml4IHJlbGVhc2UgY29ycmVjdGVk
Lg0KTm90IHN1cmUgaG93IHRoYXQgd29ya3MuDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IFNl
bnQ6IE1vbmRheSwgTWFyY2ggMTAsIDIwMjUgMTM6NTcNCj4gVG86IFJvc3MgQnVydG9uIDxSb3Nz
LkJ1cnRvbkBhcm0uY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSRTogW09FLWNvcmVdW1BBVENIXSB4d2F5bGFuZDogbWFyayBD
VkVzIGZpeGVkIGluIDI0LjEuNiBhcyBmaXhlZA0KPiANCj4gU3VyZSwgSSBoYXZlIGFsc28gc2Vu
dCB1cGdyYWRlIGZvciBzdHloZWFkIHdpdGggdGhlc2UgaWdub3Jlcy4NCj4gSSB0aGluayB0aGVy
ZSBpdCBjYW4gYmUgbWVyZ2VkIGFzIGl0IHdvbid0IHNpdCB0aGVyZSBmb3JldmVyIGFzIG9uIG1h
c3Rlci4NCj4gDQo+IFBldGVyDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+DQo+ID4gU2VudDogTW9u
ZGF5LCBNYXJjaCAxMCwgMjAyNSAxMzo1Mg0KPiA+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUg
U0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiA+IENjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQ
QVRDSF0geHdheWxhbmQ6IG1hcmsgQ1ZFcyBmaXhlZCBpbiAyNC4xLjYgYXMgZml4ZWQNCj4gPg0K
PiA+IE9uIDEwIE1hciAyMDI1LCBhdCAxMjo0OSwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1h
cmtvQHNpZW1lbnMuY29tPg0KPiA+ID4NCj4gPiA+IFRoZXNlIGFyZSB0cmFja2VkIGFzIHZlcnNp
b25sZXNzIHJlZGhhdCBDVkVzIGluIE5WRCBEQi4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmIgfCA0ICsr
KysNCj4gPiA+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEu
Ni5iYg0KPiBiL21ldGEvcmVjaXBlcy0NCj4gPiBncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8y
NC4xLjYuYmINCj4gPiA+IGluZGV4IDM1MGI4ZTkzY2MuLjA3NzRjMWJiZjUgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS42LmJi
DQo+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQu
MS42LmJiDQo+ID4gPiBAQCAtNDgsMyArNDgsNyBAQCBkb19pbnN0YWxsOmFwcGVuZCgpIHsNCj4g
PiA+IEZJTEVTOiR7UE59ICs9ICIke2xpYmRpcn0veG9yZy9wcm90b2NvbC50eHQiDQo+ID4gPg0K
PiA+ID4gUkRFUEVORFM6JHtQTn0gKz0gInhrYmNvbXAiDQo+ID4gPiArDQo+ID4gPiArQ1ZFX1NU
QVRVU19HUk9VUFMgPSAiQ1ZFX1NUQVRVU19SRURIQVQiDQo+ID4gPiArQ1ZFX1NUQVRVU19SRURI
QVQgPSAiQ1ZFLTIwMjUtMjY1OTQgQ1ZFLTIwMjUtMjY1OTUgQ1ZFLTIwMjUtDQo+IDI2NTk2DQo+
ID4gQ1ZFLTIwMjUtMjY1OTcgQ1ZFLTIwMjUtMjY1OTggQ1ZFLTIwMjUtMjY1OTkgQ1ZFLTIwMjUt
MjY2MDAgQ1ZFLQ0KPiAyMDI1LQ0KPiA+IDI2NjAxIg0KPiA+ID4gK0NWRV9TVEFUVVNfUkVESEFU
W3N0YXR1c10gPSAiZml4ZWQtdmVyc2lvbjogdGhlc2UgYXJlIHRyYWNrZWQgYXMNCj4gPiB2ZXJz
aW9ubGVzcyByZWRoYXQgQ1ZFcyBpbiBOVkQgREIsIGZpeGVkIGluIDI0LjEuNuKAnQ0KPiA+DQo+
ID4gSeKAmXZlICBqdXN0IG1haWxlZCBOVkQgdG8gZ2V0IHRoaXMgZml4ZWQsIGhvcGVmdWxseSB0
aGV54oCZbGwgdGFrZSB0aGUgY2hhbmdlDQo+IHByb21wdGx5Lg0KPiA+IHNvIG1heWJlIGhvbGQg
dGhpcyBvZmYgZm9yIGEgd2VlayBvbiB0aGUgb3B0aW1pc3RpYyBob3BlIHRoYXQgdGhleSBkbz8N
Cj4gPg0KPiA+IFJvc3MNCg==

