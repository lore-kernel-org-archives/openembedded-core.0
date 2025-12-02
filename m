Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B537D1171F
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 17:37:51 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1740.1764697062558042983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 09:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kPIPPIC1;
 spf=pass (domain: siemens.com, ip: 40.107.162.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5l10X3EFssEMr6BbpkmbMgcDws48/x+CQFhyv+RBJS1APL0qVogLqbgxsVGa0jdZ8I5CxMhm3muELikz7oF2nGTuIbqzkFJVHZ/sBrrmBOXMJ17ISJUFWNvgmvCnlL9oJolPbP1TBKLpIljuKQym7adaZheFa5QzPyppLXhfp+47P0bkxPMTYDL9AY+NFJIbGzXYKimSXy81p/N0lqED4oZ8tP8gSjznPLTDlfu9vcwoV24EX/ywLTDKUIVRCa8IWh7xMKpx1kVlajnMoUbghGo0MWYf+fG+JElW03OtWDDZUAhLN6WIrixhqZCHXDAJWlSdCxst0qKEUSfmfiYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooZye0IQ93+0OvNVmtISPvp0ZgX6teO7G6pqXAVcoho=;
 b=fd1L1jzs2eV58uSg8KEtx4V+rvzQRy6jjcAQIWNEtW7l8Xx++PCi62tZ0uMC2WfvuA715FxuFsm0DX/13NPk1sgJR8TR1TY0JrWzfta7o7K8q432vYO/XeHdET4h8icOdXITMD4MgDZ3kKNapy8OL2nnEb2WmHKKS8FZsyxSGPhAwgTWpaUvzR4GNjjU+BMv2vEKD2JMLXwHXeGMsgaO1Y4NwFH9QmXqC5yPX0btlir0mB+CitKwkb2UjqR3V10eUmvMnJlAdqVQ3WopTn2XBINI0MGjAgec9+XyejeRVbLgHCXgreaave+6gafmR61fOJMQrX5hVHL2kTOf1jbwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooZye0IQ93+0OvNVmtISPvp0ZgX6teO7G6pqXAVcoho=;
 b=kPIPPIC1SNmWuQYTtIEGCAQtXSkBX5hAAXqKSvkWUS+L5tueLmCI8TeZ5VL4sry91AvicqpwEpeTmH8YfnC/x8YVEQQr9zooDL87PXv5uyt5QHMshVeBupK6bz5yQLlcU1XtZhiSKkImxQ+m/D6INlKr0ythmpzVnVHfbirxNcnzMmbe62FU2NaIlBLPCTUKM+3meAlzRORbD0Tx7MbglsbBvWqOWkjMbc5wsZQ+Drf4krFhRKT8lQ0zc09bT9aG+Haf6J/glZH0FrIs96t6cJKzakEQr1pYTVbzafL3yFs9Jrbd85eJAl7bOXQ3USfveBPtH1DT2psvuIkCu9oMTw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3544.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:132::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 17:37:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Tue, 2 Dec 2025
 17:37:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <ross.burton@arm.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core][scarthgap][PATCH 3/9] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Topic: [OE-core][scarthgap][PATCH 3/9] lib/oe/go: document map_arch,
 and raise an error on unknown architecture
Thread-Index: AQHcVJkGpp96LC9jJU6uRFXOrxxNl7UNzcqAgADtcFA=
Date: Tue, 2 Dec 2025 17:37:38 +0000
Message-ID: 
 <AS1PR10MB5697421BD99DF87004617C99FDD8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251113122806.16769-1-peter.marko@siemens.com>
 <20251113122806.16769-4-peter.marko@siemens.com>
 <84565778-e205-454a-9fbf-6d526d6a8e20@redrectangle.org>
In-Reply-To: <84565778-e205-454a-9fbf-6d526d6a8e20@redrectangle.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=db670ac5-6b70-4771-b0bf-2994f967b599;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-02T17:36:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3544:EE_
x-ms-office365-filtering-correlation-id: 4a18c5ad-c23d-49bf-1bfb-08de31c97cfa
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N0xSNTFaeE9VQ005cE5ORjJNN3Z0d2RyMCs1NTF1aklnTzJWLzdkV0RCUFRX?=
 =?utf-8?B?dVdYMEo1djhYVWJITHdoVmVFZnMyVXZjaHh4dmlqNGRoZm5aNkFrbTBnTlpn?=
 =?utf-8?B?WTRib2ZvVU5EamVkOXNJdU4rVFduZmNqa1RCVXJYclFhM3l2OWxYWWF0U1RF?=
 =?utf-8?B?bkZodm9heHNVeWE3cVF2TVFPa1RINkNRWVVEbmY3T3RiY0M4QTNaMnBjUFp2?=
 =?utf-8?B?c0o3ZG9WdzFQOC9rNzU4Y2txaFVkbXRVUXNwREtlQjlITU5KUkt5UFpHd2FV?=
 =?utf-8?B?Slp6YkNNM0xCUFYrK0swUGtsWkY3MHh4MUhGZjhLdnRmd2x4SEFnRXFYSCt4?=
 =?utf-8?B?djhYVk9RalUwanhEK1lXb2tTQUpzRGttZGNlUlJ5Uy9KdnNiWHQ2dVRxZ0Fl?=
 =?utf-8?B?UEhNY1o2THQvelU0SUxZV1JjamVkc1ErR2I2eFVCZDZCbjZhRC9Ea1d6bHZz?=
 =?utf-8?B?ZkYyZG03WkNlckU0cnlVWE8zbERiUU9DYWgxbjJ3Wm80OWU2b0tjdnN0WHBv?=
 =?utf-8?B?UW5zTS91aTFyZ0cyOVFFV05BUkg4U1dlLzhsSWwzdXkwV2ZmRVRxMzQ3UXdw?=
 =?utf-8?B?M2VFYiszdXdVaURoOVo1Y0VVZTg0NXZwdUFkOHE2Z0FYcm42SlZUMEhNWWpU?=
 =?utf-8?B?UXh0MjJ3Unp0b2hsK20xYi8waUExR1pEN3kvbWU1Y3BDcFpxMFlyV0VjUHJ6?=
 =?utf-8?B?ekttS1VXV3BpTjQ1M3pDMjJmSWxSSThDbUpwRERFL05hSWxyek1FZ1pFdTgv?=
 =?utf-8?B?SHVXQ1kvZ0F4UEFid1RJQmxId3ZhMHRTVE9NUUZ3bllJRk54aGRXb1lSWGdt?=
 =?utf-8?B?dkpKS2FXbUlqeGp2ZWg4dFNJOGNOOVRFcmUvVkVLYWlLSTlGZU9GU0JKNDJS?=
 =?utf-8?B?UGQvTEMvSzJLSXVrY1FWQmRLOWdVWE5wTmlpNzB2MmdzMHhMOEFETVBZWm5Q?=
 =?utf-8?B?cG56NEpvcGRRcHd2aDJJSlZDeHJ6S0VLcWNEN3BIYjJZWmI0c2g1UmZ1bUlG?=
 =?utf-8?B?RnFTbXF2Nnl4djJiU1N5QW0wU3BKeVA0ejNJQW9Ndi9JbUJJRUtYQkMyRHBR?=
 =?utf-8?B?KzluY2JVTUZJUWJHTGJodTVjMGw3NkxZenB1MmRqSEZTbW0zS3BJQzNPZHBI?=
 =?utf-8?B?c29BSHFFTzV3cFVadk1mb0UwRkNwY2daWUtRQ0QzS2dUOExWMVRxZW9kMk9I?=
 =?utf-8?B?MlBxM2dOaHBaOTBZYlJlbnhETmxzd0RWMThha0ovV2p6c05vc0hDSkRDTHJr?=
 =?utf-8?B?QnErem9HelM4Q2ZlbzF5bkZTL3RLY2tYTVY2dEZkenA0NlNNVDZnNDEyYTdz?=
 =?utf-8?B?K2ZPL2l2bXNVREl3cGY0dDlWTGUzZ3oxWUEwTVhjV3V5dmErRk5DZVdMeWoy?=
 =?utf-8?B?WTBld2JmQkd5UklaOHNiM01qMndkZndzQVRKa3lFaWJpcnV1M1cyOU1jK1BP?=
 =?utf-8?B?MVB2WE44L3NERDhCTUJhSldPSnJoWHgzcEcvUjM2V2loZ1VYeXVKWk5aODA4?=
 =?utf-8?B?WkdjelVJQ0NGVGViN1dSODBGbHJQd1V4ZUg5cVlUeU15ZGxNYURLeFBGbjJT?=
 =?utf-8?B?YkYxbVJKV3BPOG5LdFNjUUxBY1BNMG9oc0VIQldKcVRKb2V0Ujk1L2VqQUta?=
 =?utf-8?B?K3R1dXArMTFGYnRvbG1IcE1INGcyREd2NGNQMWc1aXFiL1c5b1ZFRGVBZlJ2?=
 =?utf-8?B?S29RNzlPM0Z6S3ZQTXkvcmFzQlR0MHZMS2ZQWXhiZ0Q5ZVFhb3RSZnU4M1NC?=
 =?utf-8?B?VDlvcUZ6K3RHV01MZmxOVmNuTWRsSjE2NUIvdWM3WTBpWTh4a1ZaRUJ3VVYr?=
 =?utf-8?B?NlA3S25iN1dIc2FqZmswQlhLWTdJa3RQV3R2Y1dKaWFWVWVEeTkvaDJnYk4z?=
 =?utf-8?B?NjlBemlkY2x1eTdjOXZOeDE1ZU1JVCtTVTBicW10NzdPTUxKaVA1bEw4SSs4?=
 =?utf-8?B?bWw4bXhUaFJlOHNrbngraGMrY3JqTWErakJ4aVRiYVB5ZVRWNjI3Qnc2WHlO?=
 =?utf-8?B?ZHZpb1FvU2NBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aDYwd3ZuRXRlMEs4MmFEMURHWFRhZVloMVZrMHJzVzVPRTJ2bjZMWEpFVVE2?=
 =?utf-8?B?NUxTdHUvdlZtOENqZ2FkY3l4eXRvSUVTN1RxN3k2NXlrZ1VzbS93aDMxa1hK?=
 =?utf-8?B?SmRrVmFITVluTEVqalNKYlFJRFlnUTh1U1dFYTJBZERQemd5YXorZVg2c085?=
 =?utf-8?B?cS8zYU5SWFpUSVFPQ0swNGd3Z3VJQ2tscXZMZTduYm1Ub0N3NEMyTXRsZEt5?=
 =?utf-8?B?Z0l1SW1zRGN3ZjluWE93a3BXcktITEg1dGhNZnhLaFd0L1pJSlIxQ3ZnOXll?=
 =?utf-8?B?ZDJnVWUyQXRtVlA0RVF6QWJQRUxDalZ4VjBxeFk0ZW5jckNsbTlodWFOc3RO?=
 =?utf-8?B?c3JuZXI0RkpqUnB1eEJESXo1TXRzbmdrTVpWTlUrbys0MUkwS1pzejJ2aExH?=
 =?utf-8?B?RzN4dHI2cmF4eVJ3ZXhkcnRsbmd0YUJPc3RkalNWRjBtVlBweTg5cDUvQUdD?=
 =?utf-8?B?SktpVnAyc1ZueWM0QjB4TFQ4ZVNtMStENkFJVE1tWmRKTWNjUDVyaUxyU2lO?=
 =?utf-8?B?ZjRYazViOHVEbTFjMCtGM1pvQVFaR0pkM2NPVXUydEF6bGRzMi84a0tJQ2hB?=
 =?utf-8?B?MW02Z25OQUw5ZWxNRFRWL0tnR0NxZ2ZkS1pxMlZRVXZpdDVTNUlwV0IrQlNt?=
 =?utf-8?B?OFMzV0l1SXByaTZEM2hMeGYxSWk4SzRpTGNWV2Z0WEozdzNBYXdaQVJvaFBs?=
 =?utf-8?B?YWtVS2ppaGJDcXVtY1dOMCtJSlVXbmIvSmZFRFkyWlNMbnF3a0pHTWtuUnd0?=
 =?utf-8?B?eXRVSmplT0JGSzhjMXhEMUFxS0dESUdwZTE0UW9wT1RIcCtTaDRFWExhWTBU?=
 =?utf-8?B?RTgzNGNPaHhiSjJZQ0xwcVdXSGwzYUNBVDVTeGQzOG5jd01IRkQxUTFqWTE5?=
 =?utf-8?B?cGFqa0ZVQ2JHT05OOFhjYUQyTGI4YVlzdTMvNmdvQzYwaTVyVjlKMGlOKzJI?=
 =?utf-8?B?WStTb3creExCZGZSSTNjZ0wxdmN0c1QxeGM1K1FoWlJ2NjlEakxKb0ozQ2xl?=
 =?utf-8?B?bmIrdGQ3M2o1ZzZqYThuWG94VUVaMU1TOVVYN0UyMHpXT2RWYm1xMnBjKy90?=
 =?utf-8?B?Zkx0VlgyTjMyUlhnVXUycURRZFUwb3lqOXdrcEdmdVl0S1B4cUhQTTh1U2Vm?=
 =?utf-8?B?c244NzFyUk0zcVdWUEhobTZ6NlFZVS8xQ3VtUkN5ZEt1VlRjc2JSNWd1RWp5?=
 =?utf-8?B?WU5Ea3JNNHVYM0JySnh1Mko0UXJxNm8zY0c1M0gxZForRUpVMFJWWW5HY2Zy?=
 =?utf-8?B?U2pxd0RtZTdhWk1CMVY0MWZVeTByT1BOMXN4ZmI0WHZja0lHdHRLUjQ0OHln?=
 =?utf-8?B?eWthM3MzYVJBVjlZOUZ5R1NuQ0p1STdGSTdXbVFtSEZIRzVhaVE5M1pIdUNj?=
 =?utf-8?B?UWpLK0x3cVdTM3NIREtrNThJSGdnMWtHeW1FN0UrdmxmZTh5VlNmZURlaEt2?=
 =?utf-8?B?T2lMWkJ2aFZLWjlJY1ROVWU0eTVzVndQUmxobWVoQmpFNEovMS9xTVVHVDN6?=
 =?utf-8?B?aTVMY3E0eEVXUSsxK253clBiUkpZeW9BSnRUTm5nWEJzcjI4K1BTVS9ZNkdk?=
 =?utf-8?B?OWlHU3FtbEUwOWpsMzdVcm02YWVSY0RvSmh1MTZFQzV5QlFUZFU1Tk5xTUtE?=
 =?utf-8?B?OC9XbU9RNnNnY1l5R3JuMUwrbnhVYk5ibTlVM09KblAxOEQyN1g5Y1pSMGxI?=
 =?utf-8?B?Mk4yQS84SnlvZmtjdHdpM3l4T2Q5TmZ0UXJ5aTIyNVVlTGRKdnhRQ1JxQVUy?=
 =?utf-8?B?U3ZkMUZYT3RtOGgrSEd6eEdGMWVCNnRSeXZ5aDBobUo5NjczZ3FXaEJ5OVlU?=
 =?utf-8?B?UGc3dnovTnBpUnllbTQvNW1KeTAvQjhqeFZ0OVpCaURzbmJ6cjRaaGc1Wmor?=
 =?utf-8?B?Y2tydnRlSjFYeGZoUDdGdE5DV2VnaU9tTXlhMVlhdk1meFo3dkVMb3NuS2pG?=
 =?utf-8?B?MEkyaTcvT2FxQWNKVXlueG0yM3pvdWJteUR0RUIwNXVxMWdsakZsSzlrVURy?=
 =?utf-8?B?YjJTOC9TeEZDM0lqOGdmcDNyNkRKNHIzdGZKendQekZaWTF2a2dFU1c4TWhV?=
 =?utf-8?B?VC9tSnRXbm1HZUVBTnFiYnJnRDYzQnYwaHArRnFpVjBUbWk0ZnlQTnhFTno5?=
 =?utf-8?Q?C2FBSCriqcTiqOKhNv3KPUpzC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a18c5ad-c23d-49bf-1bfb-08de31c97cfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 17:37:38.7637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnbBm1p+2G0Fpu18oxZZfbVZaRla6F4A8gD7xCHQ3fvMquuo06J3ShRd46AB739HH74lwAgl4oUZRqCxJvk35w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3544
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 17:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227180

VGhpcyB3YXMgYWxyZWFkeSBkaXNjdXNzZWQsIHNlZSBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyNjg0Ng0KRmVlbCBmcmVlIHRvIHNl
bmQgYSByZXZlcnQuDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUm9iZXJ0IEpvc2x5biA8cm9iZXJ0Lmpvc2x5bkByZWRyZWN0YW5nbGUub3JnPg0KPiBT
ZW50OiBUdWVzZGF5LCBEZWNlbWJlciAyLCAyMDI1IDQ6MjcNCj4gVG86IE1hcmtvLCBQZXRlciAo
RlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AYXJtLmNvbT47IFJpY2hhcmQgUHVyZGllDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3NjYXJ0aGdhcF1bUEFUQ0gg
My85XSBsaWIvb2UvZ286IGRvY3VtZW50IG1hcF9hcmNoLA0KPiBhbmQgcmFpc2UgYW4gZXJyb3Ig
b24gdW5rbm93biBhcmNoaXRlY3R1cmUNCj4gDQo+IE9uIDExLzEzLzI1IDA0OjI4LCBQZXRlciBN
YXJrbyB3cm90ZToNCj4gPiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4N
Cj4gPg0KPiA+IEFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aGF0IHRoaXMgZnVuY3Rpb24gZG9l
cyBhbmQgd2hlcmUgdGhlIHZhbHVlcw0KPiA+IGNvbWUgZnJvbS4NCj4gPg0KPiA+IElmIHRoZSBh
cmNoaXRlY3R1cmUgaXNuJ3Qga25vdywgaW5zdGVhZCBvZiByZXR1cm5pbmcgYW4gZW1wdHkgc3Ry
aW5nDQo+ID4gd2hpY2ggY291bGQgZmFpbCBteXN0ZXJpb3VzbHksIHJhaXNlIGEgS2V5RXJyb3Ig
c28gaXQgZmFpbHMgcXVpY2tseS4NCj4gPg0KPiA+IChGcm9tIE9FLUNvcmUgcmV2OiAwMjU0MTRj
MTYzMTliMDY4ZGYxY2Q3NTdhZDlhM2M5ODdhNmI4NzFkKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+
IC0tLQ0KPiA+ICAgbWV0YS9saWIvb2UvZ28ucHkgfCA2ICsrKysrLQ0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL21ldGEvbGliL29lL2dvLnB5IGIvbWV0YS9saWIvb2UvZ28ucHkNCj4gPiBpbmRleCBkZmQ5
NTdkMTU3YS4uNDU1OWRjNjNiMjggMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9saWIvb2UvZ28ucHkN
Cj4gPiArKysgYi9tZXRhL2xpYi9vZS9nby5weQ0KPiA+IEBAIC03LDYgKzcsMTAgQEANCj4gPiAg
IGltcG9ydCByZQ0KPiA+DQo+ID4gICBkZWYgbWFwX2FyY2goYSk6DQo+ID4gKyAgICAiIiINCj4g
PiArICAgIE1hcCBvdXIgYXJjaGl0ZWN0dXJlIG5hbWVzIHRvIEdvJ3MgR09BUkNIIG5hbWVzLg0K
PiA+ICsgICAgU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vYmxvYi9tYXN0ZXIvc3Jj
L2ludGVybmFsL3N5c2xpc3Qvc3lzbGlzdC5nbw0KPiBmb3IgdGhlIGNvbXBsZXRlIGxpc3QuDQo+
ID4gKyAgICAiIiINCj4gPiAgICAgICBpZiByZS5tYXRjaCgnaS44NicsIGEpOg0KPiA+ICAgICAg
ICAgICByZXR1cm4gJzM4NicNCj4gPiAgICAgICBlbGlmIGEgPT0gJ3g4Nl82NCc6DQo+ID4gQEAg
LTMxLDQgKzM1LDQgQEAgZGVmIG1hcF9hcmNoKGEpOg0KPiA+ICAgICAgICAgICByZXR1cm4gJ3Jp
c2N2NjQnDQo+ID4gICAgICAgZWxpZiBhID09ICdsb29uZ2FyY2g2NCc6DQo+ID4gICAgICAgICAg
IHJldHVybiAnbG9vbmc2NCcNCj4gPiAtICAgIHJldHVybiAnJw0KPiA+ICsgICAgcmFpc2UgS2V5
RXJyb3IoZiJDYW5ub3QgbWFwIGFyY2hpdGVjdHVyZSB7YX0iKQ0KPiA+DQo+ID4NCj4gDQo+IFRo
aXMgd2FzIHJlY2VudGx5IG1lcmdlZCB0byBzY2FydGhnYXAgYW5kIHVuZm9ydHVuYXRlbHkgaXQg
YnJlYWtzDQo+IFNPVVJDRV9NSVJST1JfRkVUQ0ggb24gYXJjaGl0ZWN0dXJlcyBub3Qgc3VwcG9y
dGVkIGJ5IEdvLg0KPiANCj4gVGhpcyBpcyBlYXNpbHkgcmVwcm9kdWNlZDoNCj4gDQo+IGdpdCBj
bG9uZSBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kNCj4gY2QgcG9reQ0KPiAuIG9l
LWluaXQtYnVpbGQtZW52DQo+IFNldCBNQUNISU5FIHRvIHFlbXVwcGMgYW5kIHNldCBTT1VSQ0Vf
TUlSUk9SX0ZFVENIID0gIjEiIGluIGxvY2FsLmNvbmYNCj4gYml0YmFrZSAtLXJ1bm9ubHkgZmV0
Y2ggY29yZS1pbWFnZS1taW5pbWFsDQo+IA0KPiBXQVJOSU5HOg0KPiAvaG9tZS9yb2JlcnQveW9j
dG8vcG9reS1zY2FydGhnYXAvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLQ0KPiBjcm9zc18x
LjIyLjEyLmJiOg0KPiBFeGNlcHRpb24gZHVyaW5nIGJ1aWxkX2RlcGVuZGVuY2llcyBmb3IgR09B
UkNIDQo+IFdBUk5JTkc6DQo+IC9ob21lL3JvYmVydC95b2N0by9wb2t5LXNjYXJ0aGdhcC9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tDQo+IGNyb3NzXzEuMjIuMTIuYmI6DQo+IEVycm9yIGR1
cmluZyBmaW5hbGlzZSBvZg0KPiAvaG9tZS9yb2JlcnQveW9jdG8vcG9reS1zY2FydGhnYXAvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWNyb3NzXzEuMjIuMTIuYmINCj4gRVJST1I6IEV4cGFu
c2lvbkVycm9yIGR1cmluZyBwYXJzaW5nDQo+IC9ob21lL3JvYmVydC95b2N0by9wb2t5LXNjYXJ0
aGdhcC9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tY3Jvc3NfMS4yMi4xMi5iYg0KPiBiYi5k
YXRhX3NtYXJ0LkV4cGFuc2lvbkVycm9yOiBGYWlsdXJlIGV4cGFuZGluZyB2YXJpYWJsZSBUQVJH
RVRfR09BUkNILA0KPiBleHByZXNzaW9uIHdhcyAke0Bnb19tYXBfYXJjaChkLmdldFZhcignVEFS
R0VUX0FSQ0gnKSwgZCl9IHdoaWNoDQo+IHRyaWdnZXJlZCBleGNlcHRpb24gS2V5RXJyb3I6ICdD
YW5ub3QgbWFwIGFyY2hpdGVjdHVyZSBwb3dlcnBjJw0KPiBUaGUgdmFyaWFibGUgZGVwZW5kZW5j
eSBjaGFpbiBmb3IgdGhlIGZhaWx1cmUgaXM6IFRBUkdFVF9HT0FSQ0ggLT4gR09BUkNIDQo+IC4u
Lg0KPiANCj4gDQo+IElzIHRoZXJlIGFub3RoZXIgd2F5IG9mIHVzaW5nIFNPVVJDRV9NSVJST1Jf
RkVUQ0ggdG8gYXZvaWQgdGhpcz8gT3IgaXMNCj4gcmV2ZXJ0aW5nIHRoaXMgcmVhc29uYWJsZT8g
SSByZWFsaXplIHdlJ3JlIHByb2JhYmx5IG9uZSBvZiB0aGUgZmV3DQo+IHJlbWFpbmluZyBQb3dl
clBDIHVzZXJzLCBidXQgbW9yZSBnZW5lcmFsbHkgaXQgZmVlbHMgbGlrZSBwYXJzaW5nDQo+IHNo
b3VsZG4ndCBiZSBsaW1pdGVkIHRvIHdoYXRldmVyIGFyY2hpdGVjdHVyZXMgR28gaGFwcGVucyB0
byBzdXBwb3J0Lg0KPiANCj4gVGhhbmtzLA0KPiBSb2JlcnQNCg==

