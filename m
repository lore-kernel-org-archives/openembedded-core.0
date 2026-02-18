Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05444E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 08:16:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7738.1771402601245771466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 00:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Lu9SoeN/;
 spf=pass (domain: siemens.com, ip: 40.107.159.42, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOggTeipJuzzc+ZOfFzw2Emn5FtlruJy2HpqtUT9C67oR6VnHhaa+WtUFfBZmXbOW7KUwDB7XCo6XYXUwLpaPqVHFZfcuqfiu9lfgl/u82nCxhrEXkNmqRFMAL88ddvrTk7X5veykcCkHRdLjnXkADKWyozpnpAdkPk+ibtDXdFRuHdl/a/EIIRlfOwYU0ClAru9ECG8jKTwnFa4waWk88Gzj7cXBJkNrYEfo7Xump6uGJDtqzRRBLf44duvr0cqdWpolsyAZZgZ1UnmeBo17MEwWwbeA4rk0+B6V4XxDNQNIlYXsdCZOG9NW4N0Ef/2npPF1/++do/mtz4sbHhPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsKSa8bX/mX6EFf0f40/g7DbeCAn922wicvra/rcJzw=;
 b=A/tpltvvyEMOCacGR9jI0/RhjBzv/9fS/06rBVnicFquWqK5FhpuxLSbIuU2/olceNltM8h4z5Q9bdTWmSaztcJVEfJY89r8Ziy7W3eOmK/4rhSy7kXcG2O4FvDHkU2n+BcOAcHBGjk9TtIJxNQAJXQ0ZxzUVMQhX6JdIsCn4ZbPEVSqTFYksfpMCZ1gfkLXNFoi5QDEl3K1WKkKGYGbjodxss2kr046sbVLVP8ks+r3VJyHwRNG/eRWtyvH3YGan8TvpgqKk5LzVbCd+sA0zKywJ2GzcTNoAyRaYp7AUjdMh2a0liHGWw+DAxB4Xswy+k3M/XV6h0FOqWY6Jw49VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsKSa8bX/mX6EFf0f40/g7DbeCAn922wicvra/rcJzw=;
 b=Lu9SoeN/OeWziN8QlgkxEfCtNlqPCXiuE7CXU/o4rEehn12yfcjAEHF1dql/jipYgQ1FGrXN0eWpegl3tPo37hjDWn5PV6YMmmFs0owF8LNxdVMgO/eeNzKYEx0yJLzgfC1Xf4y2ux/40ctjg2X5Ue1AYIGMf9QV0XbZb0Wi5y0Au1W4PUsoupO9I73Wun1rtN0fZ7DXLfsjqA62SFoFU6vwV+YNy7Vxb6B09sCqFq651uU6ZAmMiiR7iUKQsDaNfb94c3s76J0lDCG/aST2k6p7udtxce9RlGFaz3MXgeTymFTMeZXif0LSVPQfXipsG939Il/eIAk40mzgkxjTrQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5241.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:349::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 08:16:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 08:16:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"careers.myinfo@gmail.com" <careers.myinfo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
Thread-Topic: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
Thread-Index: AQHcmykzxvxClP7JhUe7V9HR+0pRcLV9MXIAgArHi4CAACpggIAAA11A
Date: Wed, 18 Feb 2026 08:16:35 +0000
Message-ID: 
 <AS1PR10MB5697ED75CACEF217DC9722B7FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260211072322.79206-1-moins@kpit.com>
 <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
 <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
 <DGHXI0SQALG9.F3GW93KUXVTW@smile.fr>
In-Reply-To: <DGHXI0SQALG9.F3GW93KUXVTW@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d4dc372b-1698-4971-ac9d-837a040f70f9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-18T08:13:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5241:EE_
x-ms-office365-filtering-correlation-id: 8a9e19b3-ed76-4962-7919-08de6ec60837
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UmNqRGNsditzUzVpNWJOSXlHUVhSMXRyUzV2RUJmTDhCWGZmQW84NHQ1dkJl?=
 =?utf-8?B?aG9MaUdWYjNjcFpNOWljTWxGTVBBSkJ0b0hkZGtURE9OSGo4dm1qT2FwSlJS?=
 =?utf-8?B?czlSZHBkOUFrWjVGRG1Vdk1VU1dzSEl4eERmRGNWNFB4ZjAwckxRQlgvMmNG?=
 =?utf-8?B?SW9INFRMaE54LzhBanVoTlBnWEhjaEEvUjRET3hJWXlVa1ZWMTYrS3NTdGFx?=
 =?utf-8?B?WkVqNEk3cC9sbVBPN1ovOEFmNkhBWVRnWDVnSHE1YUpWUkRyUVZydElaVVE0?=
 =?utf-8?B?WHdVSWRhRU9HK1EwMmhHVHVpZHpBbmlrL2NkVEU1SzZid3dLT3pMejFYaDV4?=
 =?utf-8?B?dWRZbC9kTFdTTmxMd3h0ME1YL1Q0aFJBN0srOWFUQkc3QVlWaklEb1krNG9S?=
 =?utf-8?B?OEpia3d2SE1KMzQxSWJYdzk3RzJ6NC9JUnF0Z1VhSFpmZzFtNTd3eHFHUmpS?=
 =?utf-8?B?aHVaeGRDT2lCZGtFVXBPY3g1YTc5akFoRVArdDY0UDEwSnBpOUltNCtRdStk?=
 =?utf-8?B?bm9udTI5UktNZXpGTEJ3SkpyRWpwL290VVpjNEVheVQyTWV3SmRic1FuenBl?=
 =?utf-8?B?Z0RXWDQrOGRCcVFaK3hJWEQ5djgrczJWTTVsd2c5OGpLNnFIalJWNFR5K2dk?=
 =?utf-8?B?dkt2YTJ5cU90MkVENCtXdlgrS01HMlVLU1pCM0ZUbGNzRysvbkE4SmxoSVhV?=
 =?utf-8?B?dXJqVzBCVDdWT0FaNE1IN0crY1FwUzhydFJ0NnFnTHNOYjBpelZxREErZTZV?=
 =?utf-8?B?c2RHdHdoUm5nZkkvdUFHZjgzcjJjZUdGa2ttRm9DWFZXMkRUbUVxNERrdk0x?=
 =?utf-8?B?ZEpMeGd6YnJwUno0RUZ3VUgrZFRRSFVDQ2JCZUxnYVEvT0dtcXBab1dYc2RP?=
 =?utf-8?B?bVNIcHRhVnZUSXdnbnZlMkhIVEd2OWxoMTVFYkFDdTdYN3IvYkZ1LzJsVkVx?=
 =?utf-8?B?Y0tYTUdqdzJlVmdSN3dCclVlZHpUeGF1T3kySWVKMmNxRHY1cmlmclZZZFF5?=
 =?utf-8?B?WVpNTllOL0VDZzdKZWJrdkpYOHdXYWo5WTZzWU1PTEN0dVBtd2pmWkwyUjdZ?=
 =?utf-8?B?NU9GQ0g2dHVnM21UVXdCR2R3QWRaV0VOQU9va1JINzFaOWY5Y3VEMXF3WkFS?=
 =?utf-8?B?Z1pxN1cxUjNPUzU5NjR5VllzZ08rV2lDenVaWTgrcVpETFNFWlc4a3E3Rkpz?=
 =?utf-8?B?c3RxVUFEUFpKUGZ6UmlkSThISExmRUNKRzIzV1R5YVhaV25BdDhDSERhS0Jx?=
 =?utf-8?B?REpIOHBTNGlZT2drUjhpbHlzN3VhRHFpTjZOdHFldFFDTGhyemtLbGRLcFJS?=
 =?utf-8?B?VVpzT1BvOXhxNmN4ZFVxbFRKVjJ0OVlVWnZDbkxndDhOd2dCZ0JQN3YwWndJ?=
 =?utf-8?B?aHlPV2xmRFg4WTVoSFJQZkduYVJ1Q29HT2V1dTJYTXg3c2lRaEJqZWFGUlR0?=
 =?utf-8?B?YllQQzYrSEU0c0lzVURlZGdackVHZGJ0WlNHWmdUS2pCYVlibVR3RUtUK1du?=
 =?utf-8?B?ZEVBdjdPTzF5RzE3NkdNdC9udHdvK0k0Q1RRK2kveDhkKzFSOXRXU29DZmdS?=
 =?utf-8?B?aG9qbElNMXIzb05KUTgvempjeENMOVBLVHBPbzRQVGZTMEhCdVVHK2pJK05X?=
 =?utf-8?B?SW5vM0dybVBXYjlkR2dCTjhJMDRFeG8vU0JZaHA0ZlVjQ2llS2N3U25YVThh?=
 =?utf-8?B?bXYvaXNkKzNWaHdkNEVNbXV1U21mTkIySXpqdEZteDFWMzQ4b1pSdkJmSHBZ?=
 =?utf-8?B?MEtEQ1J1OWp5QUQyUXNpMkFLQXRkd2ZNRG5DemdtY0U1NW42QlJiKzEzM1k4?=
 =?utf-8?B?SjZJZHhpb2c2dmUrc0dyMXg4UlpUT1NjekthK2ZZdXpYQys1aS9zL05ESXBx?=
 =?utf-8?B?LzJYdjI3UnE0eUhvSFI1ZHpoSkJxMHBqMnBFbVhQK2Rwd2tyTS85NjR5cGly?=
 =?utf-8?B?VU04V1hyREQ1WnluSUVvWlZZamNvZ0tPbTJZMXppUjF3TXBoR21HMktRamJj?=
 =?utf-8?B?OHZLb2VnSWFTNENxajgzNElkMm4xQUlpNGM1TVhjcS9rOWJSLzlCeUFvcGxn?=
 =?utf-8?B?TTRMT2swTXlYeXZTU0drWndmNXpOUm11NTB4M0wrNm0zNGRpM3loUlNCTTNH?=
 =?utf-8?Q?dAdFDtLLffsr3sXUQ6xDNNPnF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mmk0K25mMXlJQUk3ajZNUkc4aWc0SXYrUWt6a3dPQTlCekFEUHVnbkpuSENT?=
 =?utf-8?B?djBrR0Era2FhclVYWmFWTjRhVm95ZTM4UUc3KzVMdzduRjhhYnp5ajZqUiti?=
 =?utf-8?B?ZGJTR05BRnp5Rnlwa2VFbU01SWhWSS9xSTFtSVV0OGtlZ0JMdC9scHdIdjg5?=
 =?utf-8?B?V043dTBHanFENVdjTTl2QWNCb0dFM3g0d2cwRlhSQTZhcUJGL2hzVk5mSzIz?=
 =?utf-8?B?V3hrZFJwenNnWldTaUpPaUhaTmNKMVZKczRWMkZnMmVnWDdKWEZUYjZWYVNE?=
 =?utf-8?B?K2NJVjdPZWNtM3FVTG9wT0lTNUNUR0JaKzBmU0twMWhRbEZ0TEVFTG5qL2pt?=
 =?utf-8?B?b0tXOEwvUnhpWW5zZzRDRXV5RjRRc2w0b3N3bWdGd25WdU1mMUhzYStaTC9X?=
 =?utf-8?B?bEFDNjE2RkdOVEsxc2JrVlo3MDVHSzlDNmFKTlB4WkgvMTcwb1ROVWlGbThZ?=
 =?utf-8?B?ZWQ1cGNLSmhMcFZzYUt4bFpFQlZ2NlRZcXZ2aGlvMzFoMzlvSnFLeHY2ZHp4?=
 =?utf-8?B?WmNoVDlHVHFCOThnTkFSaEV6dG84TUlWN2ZEM0xOZUR6Mng3MXhHMktNSEVI?=
 =?utf-8?B?YUdqQ3ZOU1FQVmM3VnY2ZmpWYmgzUzROQnlNdWJHWVZrMVM3SGJKT3ZVVU1B?=
 =?utf-8?B?SmlUNWNmMkdFWkw3REFWSTFvTTRkbkRTVGQ5Q1dRMVp0WmlGaDNhUkYxU1BW?=
 =?utf-8?B?THZsQzc0eTRTWWUzbExWSzJNTjdnK3drRktxaXdmQWFFSnJ5R0tPR05jYndQ?=
 =?utf-8?B?ZUtXalpsWEc1U3grQkdzWnpyTTl6ZDZkemU5R2JaQjNVMHlzcjByOGNRV2hp?=
 =?utf-8?B?RHZ0ZURqUmNESlpWYkxENmxTeUZ1K09JdjBQUXRqZXN0VG45ZEdiTnpsOTY4?=
 =?utf-8?B?c1NkdVdnckY4NVVISW94WUlIMzlhcktNY29ZUnBiVGpHVTdlY1U0a1c3VlY4?=
 =?utf-8?B?NllaQXRxSkxpV3dPenFocHl4YTNOSlhNeDZPRkVJSkVVbVlaeksrWFhqOUlz?=
 =?utf-8?B?SDhERXVSQ2VGeWVreWtXNTNPenhEZEdlajdXQkVxdnEyNGQ1TWF6dU9aSTJo?=
 =?utf-8?B?RlpMMFlxRlJVQ3ZVYW1aMjBXNE5iUmtCSlUxellFaG52OWlhaEJBd2FlS2p2?=
 =?utf-8?B?UE9LblNwWnZwVGl1OTFsb0xiV3Z3QlpHbUIzaVE1bjB1NDBsc2dhaFQ4QXVz?=
 =?utf-8?B?aFhoeTNWWG5OeGxRSXJLQ01ibWtJVzlHK2orQ2RKdE1PM1lscUl2UjVBNnVQ?=
 =?utf-8?B?YVVvazNCVzFtVjR0S2VyamMxUytZd3VLNk9kREZOcHhVN0RWMHVUdGZHME5S?=
 =?utf-8?B?QTFqbnZOb2s4RHUrSDByQW1mWXVIQnZLcXRTcms4Y2E2MkFIR1FIMHBLYTB5?=
 =?utf-8?B?UFZycTh3VStUTjFBanAvUUdPK3kwYTMraW9zSURQYzAvRnl2NEVBT2ZVTzEz?=
 =?utf-8?B?VU1wMnJFSStqL3pTZ0tqZGZ0Zk52aXgxM3VISlh2TzA4NGRuK2ZoWmZMZFNR?=
 =?utf-8?B?ME5jQlVHQ2tiQkxlRXdLUHV5dE9WNXNQSFZmQ2U4ZWFQZ1NqRVJCZXhMbDRF?=
 =?utf-8?B?WVA0dXB0cFBxSEtWZDBTSEpHRy9iK2xqdXVPQWR0MWtZUk1JY3lUYytjSWwr?=
 =?utf-8?B?NS9hN2RXbTZpbVdRZGVmSkticWFyRVkyTTk1NWxRWjFVMFlsZjdXYTc3TGZ1?=
 =?utf-8?B?bXBNZ05ZRXBrOHVSWFh1N3BUMXN5ZzFwUllqQ3hXb0tjTHA1d09QN0pDcm4r?=
 =?utf-8?B?NDVVTk5tbFVWWEZST055R3lLaStlMjhrMUs3YVhMM01pUkxyamZsQzU1M1pr?=
 =?utf-8?B?UE42Mkl2Ym0zZ2Y3MXE5bUxqRnZZUmZDeWlqVnNyN24yM0FHZ3hVRjBvVnNN?=
 =?utf-8?B?NFBxZkM3TFhqOHk5N1pNNmI4TVQ3ZjF2NSsvNWt4ZGs4VWdxSVFZZkJ6bGIy?=
 =?utf-8?B?UHpFU1YxWUt2eFd3RnZEeVZ0ZjVqaUVEWmovRWNucEpLaFJ1VDlKQzBiT0Q4?=
 =?utf-8?B?d0JSSy9YbVhZN1FQVUZEditLOTNpZlRPbTZydFhDWGY5K3ZqK0NsQVNVY0Yz?=
 =?utf-8?B?SncrekxSdkNJZFRYeFM1dEk1cGcvSC9JWHhYWUZOdDFBSTk3dXNsNWxHUHNH?=
 =?utf-8?B?OFZkVzJvd2tQNGdBOHhvTWs5OUhyRzVRRjdKUER6cGxld0VJNmJRWmUrQjU3?=
 =?utf-8?B?cmtmQ0pQUWs0dUtHVW5zaVlwNThDMmxWWFBZYThBTXU5NG5wekcyU0YxMVVG?=
 =?utf-8?B?bTNyTG1scUM2VEE3ZGFrQWlDc2xMbEpTYnN1K3F1ajdHc3NkcG1qaUwzWWtB?=
 =?utf-8?B?STdrQUl6aWJCempNT0VKRzY0aE9Lb2d0UExzM2YrdXl6L3JwYTRhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9e19b3-ed76-4962-7919-08de6ec60837
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 08:16:35.3437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I37OkvNaxc73tQVG4k2Ms2obbCw8wvetLbsCxwbCDfk7UKZgHOwY17g28lrCoYGWXZvdmvTww2CFcXeB3CzZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 08:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231286

Q291bGQgd2UgYWRkICJhZGRpbmcvaW1wcm92aW5nIHRlc3RzIiB0byB0aGUgYWxsb3dlZCBMVFMg
YmFja3BvcnQgaXRlbXM/DQpJIHRoaW5rIHdlJ3JlIHNob290aW5nIG91cnNlbHZlcyBpbiB0aGUg
Zm9vdCBoZXJlLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRl
ZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgWW9hbm4gQ29u
Z2FsIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVi
cnVhcnkgMTgsIDIwMjYgOTowMg0KPiBUbzogY2FyZWVycy5teWluZm9AZ21haWwuY29tOyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV1bc2NhcnRoZ2FwXVtQQVRDSCAxLzJdIGxpYnBjcmUyOiBFbmFibGUgUHRlc3QgU3VwcG9y
dA0KPiANCj4gT24gV2VkIEZlYiAxOCwgMjAyNiBhdCA2OjMwIEFNIENFVCwgU2hhaWsgTW9pbiB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBIaSB0ZWFtLA0KPiA+DQo+
ID4gSSB1cGRhdGVkIG1hc3RlciBicmFuY2ggcGF0Y2guIFBsZWFzZSBjaGVjay4NCj4gDQo+IEhl
bGxvLA0KPiANCj4gU29ycnksIGJ1dCB0aGlzIHBhdGNoIGlzIG5vdCBhY2NlcHRhYmxlIG9uIHN0
YWJsZSBicmFuY2hlcyB1bmRlciB0aGUNCj4gcG9saWN5WzBdIHJlZ2FybGVzcyB0byBpdHMgbWFz
dGVyIG1lcmdpbmcgc3RhdHVzLg0KPiANCj4gWzBdOg0KPiBodHRwczovL3dpa2kueW9jdG9wcm9q
ZWN0Lm9yZy93aWtpL1N0YWJsZV9SZWxlYXNlX2FuZF9MVFMjU3RhYmxlL0xUU19QYXRjaF9BY2MN
Cj4gZXB0YW5jZV9Qb2xpY2llcw0KPiANCj4gUmVnYXJkcywNCj4gPg0KPiA+IFRoYW5rcyENCj4g
Pg0KPiA+IE9uIFdlZCwgMTEgRmViIDIwMjYsIDI6MjMgcG0gWW9hbm4gQ29uZ2FsLCA8eW9hbm4u
Y29uZ2FsQHNtaWxlLmZyPiB3cm90ZToNCj4gPg0KPiA+PiBPbiBXZWQgRmViIDExLCAyMDI2IGF0
IDg6MjMgQU0gQ0VULCBTaGFpayBNb2luIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+
IHdyb3RlOg0KPiA+PiA+IEluc3RhbGwgbGlicGNyZTIgdGVzdCBzdWl0ZSBhbmQgcnVuIGl0IGFz
IHB0ZXN0Lg0KPiA+PiA+DQo+ID4+ID4gQWRkIHRlc3RzIGZvciBQT1NJWCB3cmFwcGVyIChwY3Jl
MnBvc2l4X3Rlc3QpLCBjb3JlIFBDUkUyIGVuZ2luZQ0KPiA+PiAoUnVuVGVzdCksIGFuZCBncmVw
IHV0aWxpdHkgKFJ1bkdyZXBUZXN0KS4NCj4gPj4gPg0KPiA+PiA+IHBjcmUycG9zaXhfdGVzdDog
VmVyaWZpZXMgdGhlIFBPU0lYIHdyYXBwZXIgQVBJDQo+ID4+ID4gUnVuVGVzdDogRXhlY3V0ZXMg
dGhlIGNvcmUgUENSRTIgdGVzdCBzdWl0ZSB0aHJvdWdoIHBjcmUydGVzdA0KPiA+PiA+IFJ1bkdy
ZXBUZXN0OiBDaGVja3MgcGNyZTJncmVwIHRvIGVuc3VyZSBpdHMgZ3JlcHBpbmcgc3R5bGUgbWF0
Y2hpbmcNCj4gPj4gd29ya3MgYXMgZXhwZWN0ZWQgd2l0aCB2YXJpb3VzIHBhdHRlcm5zIGFuZCBp
bnB1dCBmaWxlcy4NCj4gPj4gPg0KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFNoYWlrIE1vaW4gPG1v
aW5zQGtwaXQuY29tPg0KPiA+PiA+IC0tLQ0KPiA+PiA+ICAuLi4vbGlicGNyZS9saWJwY3JlMi9y
dW4tcHRlc3QgICAgICAgICAgICAgICAgfCAzOSArKysrKysrLS0tLS0tLS0tLS0tDQo+ID4+ID4g
IC4uLi9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8xMC40My5iYiB8IDIyICsrKysr
LS0tLS0tDQo+ID4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMzkgZGVs
ZXRpb25zKC0pDQo+ID4+DQo+ID4+IFRoYW5rcyBmb3IgdGhlIHBhdGNoZXMgYnV0LCBhcyBJIGFs
cmVhZHkgd3JvdGUsIGFkZGluZyBwdGVzdCBpcyBub3QNCj4gPj4gdXN1YWxseSBhY2NlcHRhYmxl
IHVuZGVyIHRoZSBzdGFibGUgcG9saWN5WzBdLiBUaGF0IGFsc28gYXBwbGllcyB0byB5b3VyDQo+
ID4+IGtpcmtzdG9uZSBwYXRjaC4NCj4gPj4NCj4gPj4gWzBdOg0KPiA+Pg0KPiBodHRwczovL3dp
a2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1N0YWJsZV9SZWxlYXNlX2FuZF9MVFMjU3RhYmxlL0xU
U19QYXRjaF9BY2MNCj4gZXB0YW5jZV9Qb2xpY2llcw0KPiA+Pg0KPiA+PiBSZWdhcmRzLA0KPiA+
PiAtLQ0KPiA+PiBZb2FubiBDb25nYWwNCj4gPj4gU21pbGUgRUNTDQo+ID4+DQo+ID4+DQo+IA0K
PiANCj4gLS0NCj4gWW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUw0KDQo=

