Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1FCAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 11:42:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.10])
 by mx.groups.io with SMTP id smtpd.web11.20536.1758109315281808146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 04:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Y2GIkCr8;
 spf=pass (domain: siemens.com, ip: 52.101.84.10, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlMn59Z1WETlhjYK1SW00jbPfxvRMZr9FwOS218myIN6ulgomFUCqPuSbIPLqv627P75LRAY5GG/Fjo0oyGr3SnUUIHDmFjavLk9/zJ6iwt7GO9ls8bM7pjBVA+o2kzrbOBzXwMfSI66LdN237fnfuNjDjqwoN3gR4+QKmODzO654ol8gXCOzkNmj2xlgb7uLbqrA8uMTwB0FpXgshU6a8nwRpRw9i4n+wfsR3dFihty8SUKtv39fyjD8glpKxA2wwMUeNk/4/REgvaKg8bhXKpSARjUCokLPnAlzUFam03bPzhwAOnKKUn5KziRAJLINm7+6luo3PB/gaIW66ATqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP1T4TLkFmsUQ8srBxxjJtWkMKclf21HV9W6emSvHYk=;
 b=lvA5ORSWQIFv1KjuSbHnEsTMMmstXnHQvG3pvYyzZtQ0KaN+PXHGs9aWdY/Xk9dNxVAqiwBDwvWYXGq9YGy9aJu4lHORz6hgyiMotxCvNQXleqQ0cXWMyU9HHWTy3VM+wY2/JX8bRXrlnQGywRCaZ2UP8HItwCciXoTwrKSSN9ZTxF/1gtrZYuwjC/iAlIeGfyCx9S40o4T0JX3u8lySoLps0D17OMtB856H20sF3pkkD2DNflQ4Ykw5PIl4+7N5/W61Zjyw/qWS/IX+onhGUS/tBTHLiSaxZutWxOqgwe9UtXgbEIq7ScNzFjEfZd3GZgjkYZ9m/QFMpxA0g46jNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP1T4TLkFmsUQ8srBxxjJtWkMKclf21HV9W6emSvHYk=;
 b=Y2GIkCr8dYQToGHUZ3Yihvc/YovgAoXD4BsVVA8CWHHdfiCBktdt29TddE167pCgrXoWCd+lIYStYNz9RCyspZaTSuOZSCVi8dgGNmGjx3tO0Za9KB8unQVYxgx4bXZcJmDF6xFTSpzVUzUGo8qio+Tpu0tr9qwN9JBGG0UtoTWJ5YdvF1GVBDbo2uhL6jFAOF3TAZf92e5H99LgPtbW/buzNo/kjP/taimUvHWHj8j5JnaXpN+ts9TonTCMhS+G2BVo16Ww+/r8GUi+zXiwDEC3JXnAAlI0lhIa5uVrN3RqF3WKWaXmM2JoalQj7WECs9z3EnLgvdcRXmsu5MTOog==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB9181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 11:41:54 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 11:41:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcHSH7LwGpFd3oNU2f86SvOYVM2LSKvd4AgAAcmICADHkpIA==
Date: Wed, 17 Sep 2025 11:41:54 +0000
Message-ID: 
 <AS1PR10MB569783C528AA980503CCF608FD17A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250903222658.3929743-1-peter.marko@siemens.com>
 <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
 <9D9FCA93-9D8F-4F86-A080-C1CCD08B70B5@arm.com>
In-Reply-To: <9D9FCA93-9D8F-4F86-A080-C1CCD08B70B5@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=66d8ca8b-5b46-4db6-80d6-6d0656b3671e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-17T11:33:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB9181:EE_
x-ms-office365-filtering-correlation-id: ef456e68-a14d-4678-785b-08ddf5df3390
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dmNKZDhPcHlHdlBxMEtZOUMrNi9ZT1RKdHgwdFFvME1LbDk5b1RZRHEydWNQ?=
 =?utf-8?B?YUdoYnl3TlRBUjVJcXN4NGxyclJqeUllcnVBOWJQVW12QTlhQUVnYnFzR3Fk?=
 =?utf-8?B?WkQrK25FRGx6RWcxc0pBdUpJcGVjbjUxUEQrQTBxVG80STBreklsNVg4UVVE?=
 =?utf-8?B?NGVkUks5L1EycS9sMXI0WWNSaGZGVEs0eFhkT2h2WjlLSFpEYVhLcXc2WHVp?=
 =?utf-8?B?M0Z3ZlR2Wm1vbmNNbkpmK1JscU1pZGtYZ1lPaGtrZ2Z5RWNvSmRoRDJWZHlo?=
 =?utf-8?B?SkpmbVNHcE9CM2NlZXVmK01BK0FENUFLKzZsOEhva3c5ZkVmN09CZ1RTZ3dj?=
 =?utf-8?B?RVBnRnZSRFF5Zms3T2NtazVZREg1MlZyTGJxTFh1WStmNUZLbU1YWVVPTER5?=
 =?utf-8?B?M0pQUzlMc1BNNEN2Nll0NGdoU0xVMGp4V21VWDZEaVBhUzRpejNKb0hDT3NZ?=
 =?utf-8?B?NTRjWXY0UVJBendNbjRUelBiV2gwNlZ5MmdNb3MwN3dFeVBRSGhEekpaZDFZ?=
 =?utf-8?B?ajgwS1ZRQWU5eEdJZXhndE1MNUIwNGZQTzFkTjJHK2F4S0xXU2RNNmQyQlpG?=
 =?utf-8?B?UUlzN3FvU2d2NzVzbmhZV3RNbmp2L29WaTY0RElXZWxsNkRaNlJhbW1aM24z?=
 =?utf-8?B?L3JxMkVKMEowM3hxOVUrWXltbUozNjZYVHBvYXplL2hUQ01qMUlpbGxNamVr?=
 =?utf-8?B?VTNaQllHTHE5Q3NoWkd1citKQzNUK0s4TFFNMG5LN0hPY084SkFZME01SThX?=
 =?utf-8?B?TXdYQU40aS84TjBta0ZveW9oU0x4QVFUaldDQ2pGdGJDWkF5ZnBROWhwMmU4?=
 =?utf-8?B?ZitFUVNLbzR5REdRWkRMZWhkaWtRT3NFQnIrVU10ZHF1N015Mm1GSWVobk1F?=
 =?utf-8?B?WW9nelVoeFYxNDZuVFQ3VVc4YjJrOXgzVGcySHVNcWFNMkZMRWMwOEhRZ2Js?=
 =?utf-8?B?UFNCLzdtMEo2T0JqK2FMUUllRlhSck9sUzhNTGtlM01pUzFyZDY3QlVwWXlm?=
 =?utf-8?B?cHBWcmNIdGtYVzBwcmVNRm1NeGxVS1k2aWViSDY4KzlrbjU5blNZQXNaQlZz?=
 =?utf-8?B?Wk5uQ2dGR2dvd3kxbnY5Y1JwU2hrY1NNaWtxMEVKc0hFYjV0MDZXVzBjcjY0?=
 =?utf-8?B?bytKSFIyeGRjQzBjR0xqNGNRYUdCMEJ1bzhUZ1FrNDRJS2s5VUdMOUREZ05n?=
 =?utf-8?B?eEN3VlZVVVRzeGM2NU1TYU1UdlhIenlITzRHTE5WSG1lQnExL2kyRGNmYnE1?=
 =?utf-8?B?MkdSZms5TzY4YU9tN1NPQWhNaDJ5MmhHbTFnNVlLUjA0T3dObnlCTnViTXRy?=
 =?utf-8?B?UTlLZnZnckV3WVNnRHlhMmh2SnFqd1YvWlBQN3dWL0UrdldsZmVvd0dVZlNa?=
 =?utf-8?B?V29wdTJaOHpGa013Z0pBRkE0YlBkVVJhc1pubVd6WDZzVTFhaUZBYjBWOU1x?=
 =?utf-8?B?ZU9XM0tZek5kbG41U3JyVHdCNUdXdldSdTBGWkI3Q215djhDMWc5Rk9SQUt5?=
 =?utf-8?B?d21TQ0ZrYlN0bjF3c3NWeHlUYWpSbUhaYktZSG5LdlE2cnlMUEpoNnNGRUVv?=
 =?utf-8?B?ZUZRTnpaRUNXcTQzcVd3NlBUWGwwV2l4SmRUa1dVU1JpQVVhY0dWU1Nvc3h4?=
 =?utf-8?B?NFhTcGFLWGJaV3lsMXVrWmJiaUV0RjR6RWdpTi9mRGNUdnFhUks4aU80YlV6?=
 =?utf-8?B?N3R3aldwalcxZEZocnZFOGRPS2w1TGJGbnBKanh0ZXBmVlRER1o1TWZobFlz?=
 =?utf-8?B?ZWl0VFovUmc3TFZVK0FISGRNU1I4cm5raEZRT0QrSTBaL3VHYWc1YlhjU3BW?=
 =?utf-8?B?OVI0ZzlCSkNPTzg3dCtudVRMZ1Z2TXVwWmozalNXV3NPK0dDSitpYzZkV2pO?=
 =?utf-8?B?eGw0RHdaamk1N29va3phNEVER1hFWjhydEt6QlprOFdYRHVUS01sUUcvZi9u?=
 =?utf-8?B?UDkrdmM2aDdVT01Mc1lJcTd6MElKcmJLdTcxUTZEcVU5cU1CMjBRcDU0Y01k?=
 =?utf-8?B?UEZ0TDg3cGZ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YkcyYkZLdkNmL2ZmUnVVQWl6TTRQOWVDYSt3Qy9BS2lHT2RyL0dOUVlZVVlP?=
 =?utf-8?B?SmF4QXN4Wjg1cDkwbGR4WVM0VjhxUjFUOU1OTzd4WlJGVnlobDRTN1BsRXJD?=
 =?utf-8?B?b3JLWThQT21MTDFHcnFScFlxb3Bqb3pOcUNSNjI2VkRIMm5zVERRREJCUUdL?=
 =?utf-8?B?UnlVNGdob0lsNGZVYlNGd2lab05SYkUzSllVK0x2NXRUaklPK0l4TWgybkc1?=
 =?utf-8?B?QnNGa21zQ25YL3hIVUpmdWtSOU1iRjhuc0N4QW5nZGhybkpUMEMzcnpCdjhW?=
 =?utf-8?B?YnlxOXpBU0UwY2ZCUU1qOU1RaHVHWlNQY2c0aVpISWdwK2dUbGYvUEFrZ1Zi?=
 =?utf-8?B?MWh6RGtLRWJ0SU1COXNaVisyd09qdHh6SGEvYlNEWDZVd3UyV3dCZFQ0Nlg3?=
 =?utf-8?B?VUdCK1RqMERiU21XMk0vVG1zTWNiWm40NWlGZjRzZTNPSjBVMTNYVjFGaTFh?=
 =?utf-8?B?VmlSLzlyRWtRNWJqd1RjOG8zaGhFcmJwYzdXUFBuNDlSeHN2cWZvckFZMXY0?=
 =?utf-8?B?ZU1BckR2ekZRYTZaUlV6SUtQcFA2OXB6NUUwUTBlNHZtWDRNdU1BN3k2ZzVL?=
 =?utf-8?B?VzRFREpyWjBzamZuaUdHVEo1dmRISlY0Ky8rRDA0MEdhSVh0STNFQUczcGxp?=
 =?utf-8?B?NzNVMGkzNmVvRVNtZndWVG5VOGw5dm5EMXhsQ2tLd2tQWXBwY2NIK3hIQ1du?=
 =?utf-8?B?WTZWN0QyaEh5bkx3SlBwM3JUTEsvWlFNZEcyaldIWTkyQVUyYlpra3NmcnBJ?=
 =?utf-8?B?a29qcHJCZDJqRWE3cmN0WFpzZzZONVMyS1hLQXVwV1Ria0pQSlAvN0xNN3Ba?=
 =?utf-8?B?VEQ0RzlVekpKem15aE82eGVrdzBzUWo5NUNQQTFHL1RUakN5ejNkNFJseHFi?=
 =?utf-8?B?V3J2UEVlWVV6RHltSlZZNGp4TVlFbUhHNXNhSjczbk96d05SdGVFaDJFZHRZ?=
 =?utf-8?B?RXpFUlJCcWJDbFkwZ3p3cXdnWDF1eEJ5bE5xUUt6RC80bk9GQ1NTaGJGcGVm?=
 =?utf-8?B?ZUVwVm1ZWUpkVGtwbjRFcU1mNFJBbnpyVEV6NFZSSG5sZ3JJLzM2WkY3clpm?=
 =?utf-8?B?djVIb1JISlI0bXR2dGVINEZTTUFOT0x3WGFPV0JUU3hXdGZTck0rdUNxdzVr?=
 =?utf-8?B?QWtob204TWZIZmphSHFFczBPTU0wa2NZT3JQV3NJeE82Z1FYK3VMTXZCZzQ1?=
 =?utf-8?B?VDlIL05wWEdTancycitCN1JXZkxxSHJQbUtUa0pnZTdENHA2c21mU3RnMTVI?=
 =?utf-8?B?ZTUwR01ZcW8vcW5OVWNQTmJXL1ZaL0drRDl5bmk5akN0Vzg1ak5CaGdHNVJ1?=
 =?utf-8?B?QTJ3dXdGVkxCSW9UYmRqMkl5dEN4SDJBNGdZWFJaQitnWnJPeXlFUUVlcDZm?=
 =?utf-8?B?M1N6QWNSeThCRDVxSENuMkovdWQwazFNSitZWjVRbVF6TGlwcGNYb2RQb1h2?=
 =?utf-8?B?SE1zcVFNQ0Ftd1FnMS9KVWxIVXpJVFA0MjVmK3hEdWxzazl5YWxlQ3hVR21L?=
 =?utf-8?B?d2R4OFRYTWtXVGFqSjV2bkt5UVUxUWNhb2plMjhoNGpXZ2YxL0dIb04zczhv?=
 =?utf-8?B?bUowcGw3dkRuSmN2UExBandhTUZTeDlTZWdVYUMvc2k2TmFrQkZKRklIUG4z?=
 =?utf-8?B?bjF6TmhqVCttQk1PaDhWNlpzaDFkYSt5c0JUUFRhYmpVMkdFaXBZQk9nUy91?=
 =?utf-8?B?bjdCSThuOXRpM09qSzlQclEzUEptSmdJQnNsaXd1SUlHUDRMVkNXTVlYOGxk?=
 =?utf-8?B?Tkp0cDBBY0tZY25OWXkzTTJzU08yVXlDMzh3SStsZWtZNmVKTzlqR2xvMFRo?=
 =?utf-8?B?MXk5blVUaVN5cjljQjd6K0hzY2J5LzY3OXZzNldCajg0UThZbWNXZThGajVq?=
 =?utf-8?B?ZC9CekFERlN2dEQyNlRzTTBrWEZhTHRqS3QrUkYyWXI3b3pkZnVmUUNRRXhG?=
 =?utf-8?B?elBmUENWVnJBVDJ1Qkl2aFdFWlVrZGNiN2p3ekNWQjBZNUYxY0NUM1MzYlJQ?=
 =?utf-8?B?S3BZTTFSMkd1eVppWHBXd1EzV1pQQkhyRnJJUVFFM3M3RzNraDBCZ1NFVzEz?=
 =?utf-8?B?dGMrTnM0dzlxdU9lS0x3dDV2d2R0WGJLVm5tZUJCREc3dkhlSnY2WFZhaXFi?=
 =?utf-8?Q?RcbvXlLL85e1ZDwQngo8zyIs7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef456e68-a14d-4678-785b-08ddf5df3390
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 11:41:54.7935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IYIOyCsAOm+2UQo+PR7R5jWwfw3sTyII9idnKjbqkLoFgVLe6nF+qKkNnXwy5zffaD20P6N/gjjLexKeaKIG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223596

WW91J3JlIGNvcnJlY3QuDQpUaGlzIGlzIGEgcmVzdC1vdmVyIGZyb20gZmlyc3QgcmVzcGluICh1
cGdyYWRlIHRvIDMuNDkuMSkuDQpXaGVuIHRoZSBNUiB3YXMgaWRsZSBmb3Igc29tZSB0aW1lLCAz
LjUwLnggZG9lcyBub3Qgc2VlbSB0byBoYXZlIHRoZSBzdHJpcCBhbnltb3JlLg0KU28gSSdsbCBy
ZW1vdmUgaXQgZnJvbSB0aGUgbmV4dCByZXNwaW4uDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciA5LCAyMDI1IDE1OjA1DQo+IFRvOiBNYXJrbywg
UGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiBDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdW1BBVENIXSBzcWxpdGUzOiB1cGdyYWRlIDMuNDguMCAtPiAzLjUwLjQNCj4gDQo+
IE9uIDkgU2VwIDIwMjUsIGF0IDEyOjIyLCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+ID4+ICogYWRkIGhhY2sgdG8gcmV3cml0ZSBuYXRpdmUgYmluYXJpZXMgYXMg
bmF0aXZlIGluc3RhbGxhdGlvbiB3aWxsIHN0cmlwDQo+ID4+IHRoZW0gdW5jb25kaXRpb25hbGx5
DQo+ID4NCj4gPiBUaGF04oCZcyBkZWZpbml0ZWx5IGEgYnVnIGluIGVpdGhlciB1cHN0cmVhbSBh
dXRvc2V0dXAgb3Igc3FsaXRlLiAgSGF2ZSB5b3UgbG9va2VkDQo+IGF0IGF1dG9zZXR1cCB0byBr
bm93IGlmIGl0cyBhIGJ1ZyB0aGVyZSwgb3IgaW4gdGhlIHVzZSBvZiBpdCBieSBzcWxpdGU/DQo+
IA0KPiBBY3R1YWxseeKApiBhcmUgeW91IHN1cmUgYWJvdXQgdGhpcz8NCj4gDQo+IEkganVzdCBk
ZWxldGVkIHlvdXIgaGFjaywgdGhlIGRvX2luc3RhbGwgbG9nIGZvciBzcWxpdGUzLW5hdGl2ZSBz
aG93cyBpdCB1c2luZyDigJhpbnN0YWxs4oCZDQo+IHdpdGhvdXQgLXMsIGFuZCB0aGUgYmluYXJp
ZXMgYXJlIG5vdCBzdHJpcHBlZCBpbiB0aGUgaW1hZ2UvIGRpcmVjdG9yeToNCj4gDQo+ICQgZmls
ZSBsaWJzcWxpdGUzLnNvLjMuNTAuNA0KPiBsaWJzcWxpdGUzLnNvLjMuNTAuNDogRUxGIDY0LWJp
dCBMU0Igc2hhcmVkIG9iamVjdCwgQVJNIGFhcmNoNjQsIHZlcnNpb24gMQ0KPiAoU1lTViksIGR5
bmFtaWNhbGx5IGxpbmtlZCwNCj4gQnVpbGRJRFtzaGExXT02ZThkMmVmNzkzYTVhY2Y5MjcxMTZm
OGZmYTRiMjliY2JlMzkzNGEyLCBub3Qgc3RyaXBwZWQNCj4gDQo+IChteSBidWlsZGVyIGlzIGFy
bTY0LCB0aGlzIGlzbuKAmXQgYSBjcm9zcy1jb21waWxlKQ0KPiANCj4gUm9zcw0K

