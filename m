Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88E7F47CDF
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:27:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55416.1772746074579842798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 13:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H87Jekp3;
 spf=pass (domain: siemens.com, ip: 40.107.162.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DK0ea2idrDjrjYJOiRSIKbJwFSyD30vdesvKn8ppUG/xXry7KcrtgnGmyHeVR9li2zetOT9TZXVB0F7rntG2fZ6uSQySHC/VSRqevcpuUeBdoDIfiqmowgNiDhRPSMRAfJffbGgdmAx0wvxsc0Oh+fqeqz6nP4AcN1thjVrI3g+yybID6MNHqGdQWAki6UmRpLQWaL8a9kzKX4VJAStFZQzD7t+5aBvuMgWXjt4JSUksa0/dJVWC2Bf/JJ+ZkH9X8cMdE5AMh2BiC3dAraHRKsbkKWKYrcAsHuwgTRxrj9Rs9NSjLeRMQGDBkjEL9nGIdbRpzz8YK8g/OQwoWKqKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgLL4f06ObDmX025lLO3avt/mcrnRFsykBkiWeJCA10=;
 b=JnwzOeXoqX8X95S62HIu0eWkFFogtALlUMuFdFiHzP4PA8koIRENVaitrlGUTIhW/5Zsj7T23JFwUz4CYq2EvEvUZvUPCf5Ck+QvTqMovoxxlOR1UvUvb5+R7Szftjhsh5xQVEP7lCvSme/f147JcctsfOnINlm+4lUXgF2h+P0CjFhvVH6U/+bJ+s9PlelbuUv9yfn+HnWpPxlwLVY3eJh7rxo9HJSlQvSoc/Gnhyt0pgMCfd9yQxj9m+ey2DKOwaGiSNhKdRD/jV9ejQfDbK24fGLZc/8uevkiyL5jalJAD6FKpaoe3cfTMFNPma3aOF7AiF0smP5kcuI2TtXEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgLL4f06ObDmX025lLO3avt/mcrnRFsykBkiWeJCA10=;
 b=H87Jekp3IhxRH1L9WFjOY1YE5QCc8UH2+8I7WMjyNDv+yM+vQ5pa1GpkiT+HYHOPrZ8VeDQv/zpMBfJX13Ow1mrGpz1porvaXmzhG0tiHmKaQQMuTrBfA09uSM8VvwNSCoMLMp9oOsL+GU8XUQHkGX19RdQ0TAuFKiq/PPIhVDn6AeVD15lPjCnvQyKfc+0W11keThp01pG9rosWhkI0QPT5xR3A2fhVXfxv6xWnWY70eJbCE5JTJElwumRaVMUQ5ysKfKxSlVi5Ot1oVQ5zVEZ3wuGT1M9Ddcwjhf7Qwhc6sANOjXXKWiW9a+dEYp5Pe21RSgOD6R8smUuYFKYJkw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7168.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 21:27:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 21:27:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][whinlatter][PATCH v2] python3-urllib3: patch
 CVE-2025-66471
Thread-Topic: [OE-core][whinlatter][PATCH v2] python3-urllib3: patch
 CVE-2025-66471
Thread-Index: AQHcrKrfZaQRJBKddEmwv8tXWrA+H7WgY94AgAAQAQA=
Date: Thu, 5 Mar 2026 21:27:49 +0000
Message-ID: 
 <AS1PR10MB56979A656B8AC9B23CF6DF7EFD7DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260305141100.1659017-1-peter.marko@siemens.com>
 <DGV4RP9VNOBQ.933AAT3UAZCP@smile.fr>
In-Reply-To: <DGV4RP9VNOBQ.933AAT3UAZCP@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ba62481f-afde-4c34-931b-7043b9323c31;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-05T21:25:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7168:EE_
x-ms-office365-filtering-correlation-id: 04f25a40-67b3-4d00-171e-08de7afe0d89
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 b7FtaW4k3J87XGfhioGq8cBc4v2VHhXJ7IhId76CTAD+6Cgo9DMokxMLt8OVjXqwowA/0uh2VbCOLOPwEIRxt7nuErvRDq0hcFMITVhUJpce+7ho3LG012TthyGUhhuagffdR1Dgx+agHqoA8EoSt8ttUUYmAeQnjjZeieaBYsbBj+b0Z2Iz3R5rAGa8yqV+YKQJypvzM9WSIgx/sjx1gKscS5Dk8DuDwPhbC9ohhSnG0k/88GMT/zK+bCOJ6sUmODtN5N5GC24wQ8edCbLu4jUjNNpw6LS5gnHDJX6XDwwrK21UuVoAUeqwiRF3YRj6+mQEiGx+1RJn5mpYdkid1nq5wkF6PqiGLFfKunIxGLKAvCJW+hW21wZpZw9vsHwAUe+amiunpy48HJJeVK7uTtAFhl4sTNDazxWKaYbuzgf9AQ5znG1Sc0sTsIxnayc//N2ZIN1L63sCepP4cfNYFJB+WEya4HHzTBheoVT0bv/DcECLVjhC/AY6acnZTuR1xfjsbxTC1jYWRvkNiwB23GeWlEzp/mrWm2lzH5VUjWDrzxDS6u3K6a+kvxxN/nzG9LY/UqhE/wO/5SGv697WbxFwtNmft/v91f3sQUvHLwJBGchrd602q2VtFweJOngdkoRW5Mgkc4yIwNhIg9Y6toJEhaT1LLSMLZC3cbZDZr6dOoDAaSLgpnMykppHd+MqjEv+ZQUJX6FxrR9pjVZMpOIHn3gZM5ZnHZmUxKz2g+Nc3YZwPpi5ENxnWdW+ORVe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzZWbS9CbkJxNmkvVHlEcG1LT1NRckFnWEtkMGl3bWJhajJ1RFpaQXRpQ1Q2?=
 =?utf-8?B?U1FkWVpuOURqQmY0QVlTVDJXNnpNcGJQWFc0azR4Sk1VMXBLYnlieUNHeFVV?=
 =?utf-8?B?Y0c4OXBZSnBtcUI4czJWM0g5eW1NckZRdlgyOEJaRDRNWEk3NmF4TWNBN01j?=
 =?utf-8?B?OXNmWG1XSTkzdGRETDAxRUR3YStJdHBua0VEaDJ2dU12US8yd214NTl5QzB3?=
 =?utf-8?B?TFczOVJva1BwMUZlOHpNWUFWaDVVeE9PcFd3UnRURjU5WFNnd3dZMUZSYkhn?=
 =?utf-8?B?U2tpSWlYbWQxMG1Xd0FMTWsycGlqbVlPWWwzOUZ5eU1id0xydkxwSDZvNWtI?=
 =?utf-8?B?SlR0aUcvdWY0WlZzL2pRL0ZMb21aUzd3TVdJWFZ4ZGp1UHpRRUUxUFBMSlFH?=
 =?utf-8?B?Smh1a2lMS0VNOVYrdFRVaGc2RHp0U3czVnpkWUp3NndEbjlCZ1pLMXBUZ0Nr?=
 =?utf-8?B?L3o0UnRzaVRiUFdyQ2VvS3BNaXgyZXI0ZWRXb014RXdvcjFtTUtPeitSbG1Q?=
 =?utf-8?B?M2Z6TmhwbGxiVlI4SDh2cUNvNE5RcXNrTms2ZlNLTmNFczY2YVJ0cHkwSW42?=
 =?utf-8?B?aHdxaU9NMVZUWVRJQnA0K200NmFVL1I3Y3lkKzhTd3lOR1BKdnkvSlFXSWNR?=
 =?utf-8?B?R2d5Mkh4U0RLN1R4cCtYcDFnYXdkcjU0UW92K1A5V1UrdVQvWjVCYWNjajh6?=
 =?utf-8?B?MDRQVllVMkVqSVZhVWVsWlJ3bHZLZkFWd2VjL3dBMzVLNVFheDN2WlJSWXYr?=
 =?utf-8?B?STR1dHlDUkpHOWEvV2JBcmxaYStLYnJiOWxDMEE0RVhBQklla244OUpJd2hY?=
 =?utf-8?B?ZXZPUjFaRmRSTUE0UGliREg5WktSQmF6QnRXNEg3TTcxRnZUOWNMREtPNit3?=
 =?utf-8?B?cW1UeU9JK2prUVdWYS9ONUhRQWFqMVdXb0E0NlMyUHVOM3ZuWDdvSFh4OFJX?=
 =?utf-8?B?KzBsL3o4WFlNd0lxcElaMFZ4OThZYkNTR1VqZHFSb2JCcVVHdUw2blBtZU9J?=
 =?utf-8?B?QTVzclQ0cWU2NkVPM2ZpR3hUNS9xeDF2ekxLYzNvazcvQTRNU2hWVjJ3ZGJh?=
 =?utf-8?B?VHNoQXpXQnNPbllncUQ2Ym1FNTlzRDYxcDdHODhDeUxuYkV4TUhxOWpYNjJU?=
 =?utf-8?B?WFNqdWZlNXJROU5JMlBwYWVJd21qTmFiVnoxN01mdjVTdjVGU1NHS1U2RFY1?=
 =?utf-8?B?RmY5UXpNSU9CSGV1SmRrVExXYjlWVElVUXZiMXFtU0R5MEFkdXJ6TG1qNnRH?=
 =?utf-8?B?cWxYOFd3SmVHUjgwUFpxa3BnMkZLVDJFUXM1Z01kRlBsaDU0NDMrSlN1ZWpk?=
 =?utf-8?B?RVNEYi95SjYvUGVFQ2cvVVNydzRTUWp5cy9GeHB6b2xaSjc4QlBlTUZ5SElP?=
 =?utf-8?B?dmlwVmdlZ0hRZmdzZm1BWTRCbE9TNURsaGhZbmFzeGJBSzVvTjI5NlN3TWxq?=
 =?utf-8?B?VWNmMzRCVEZWdnJEcHVlcVdWei9WT3lnL2VVV3RDREdBSGRiYU4rZUo2OEF2?=
 =?utf-8?B?Y2pHOFJqNXVCT2NUd1hVV2RpMGRCd0xYaEJJMkxMYWZjWkdTSmcyRytxMzZM?=
 =?utf-8?B?QkJKazRWWFU5VHFlcTgvZWRpRWl1YXZrMmVMcFR3K1dTOVBmQmRSaDlyUVdF?=
 =?utf-8?B?M2ZJSDY5MlFHYS9qZGdNcTI5cFd4R2Q3MG80UEZiRWFNdjFiR3FmZko1Skxl?=
 =?utf-8?B?S0tLVW9Dd2FxRTZuN0I5WmtSQmMvRDhTWEhYWjdwVXZ6SFVhc01TRWtCWVNx?=
 =?utf-8?B?RTBmSDdKVjN4YTloeXBNZnRlT3g1bldsWDltS3UrMVNERTh3dkdmQTNDTWNT?=
 =?utf-8?B?cW44RVMrK3JTU1U3bU1sWFhHVjlGWnNkNEsvNXV0NktPUzh4c1RNY3l6MW4z?=
 =?utf-8?B?MWpINVRWYlJpaWRZamo1SWtiWHdFdEFUQVVCZ1l4R2l3Sm5KK3Bya1BDUEZZ?=
 =?utf-8?B?UlI4d3F6b01VdWRYMHV4QXdyc0RhdjVvbURXSWZaQXJNZ2dva05pc1k5a05z?=
 =?utf-8?B?ZmwrWFFoL3VXMTFwc0Myb0hWbzVqbWtzVGZjdThYdzIySVhxN2cwc25QOHk5?=
 =?utf-8?B?ZzFCdnpSMDYzdXhxNXNlaVVqMHFGVGZzcGR2akdlSkd2T0dCOHc1eVV2WlU0?=
 =?utf-8?B?RXNNVG1OaW1tQmo5cm5ZZ0NNY00vL2kvOTRBcnRBb3ZSVWdRc2dWVWNqaG1i?=
 =?utf-8?B?aEhUSll5cHltVFR1Q0pONUJWUHRUamx0cHVFazU5M0h0empVOXJZM3l4K3Q2?=
 =?utf-8?B?N0o1aGZVUWR5UjVvUDNyWlA3YVZOSnhCVm81UjkyTUpVMWlXcjZ3ajV6dEZ5?=
 =?utf-8?B?Q3JXS2tRWkp0V3ZiQ0RmSHljd3VFdVdyNFlXUytOWmNhQUtPam1VQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f25a40-67b3-4d00-171e-08de7afe0d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 21:27:50.0393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YEjQuhk4xPFmytR3v16+u/67QOHS1Ug1NkrO1m88Grg2teXTIyTJIknmQLuyBvCQpvJtDdnLctSVK9qmcPApiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 21:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232521

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCA1LCAyMDI2IDIx
OjI4DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNp
ZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3doaW5sYXR0ZXJdW1BBVENIIHYyXSBweXRob24zLXVy
bGxpYjM6IHBhdGNoIENWRS0yMDI1LQ0KPiA2NjQ3MQ0KPiANCj4gT24gVGh1IE1hciA1LCAyMDI2
IGF0IDM6MTEgUE0gQ0VULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4NCj4gPiBQaWNrIHBhdGNoIHBlciBbMV0uDQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9udmQu
bmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNjY0NzENCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiB2
MjogcmViYXNlZCBvbiB0b3Agb2YgYWRkaXRpb25hbCBDVkUgcGF0Y2hlcw0KPiANCj4gSXQgbG9v
a3MgbGlrZSB0aGlzIHYyIGRvZXMgbm90IGFwcGx5Og0KPiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy81OS9idWlsZHMvMzMwNC9zdGVwcy8x
Mi9sb2cNCj4gcy9zdGRpbw0KPiBFUlJPUjogcHl0aG9uMy11cmxsaWIzLW5hdGl2ZS0yLjUuMC1y
MCBkb19wYXRjaDogQXBwbHlpbmcgcGF0Y2ggJ0NWRS0yMDI1LQ0KPiA2NjQ3MS5wYXRjaCcgb24g
dGFyZ2V0IGRpcmVjdG9yeSAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtDQo+
IHdvcmxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9weXRob24zLXVybGxpYjMt
DQo+IG5hdGl2ZS8yLjUuMC9zb3VyY2VzL3VybGxpYjMtMi41LjAnDQo+IENtZEVycm9yKCdxdWls
dCAtLXF1aWx0cmMgL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtDQo+IHdvcmxk
L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9weXRob24zLXVybGxpYjMtbmF0aXZl
LzIuNS4wL3JlY2lwZS0NCj4gc3lzcm9vdC1uYXRpdmUvZXRjL3F1aWx0cmMgcHVzaCcsIDAsICdz
dGRvdXQ6IEFwcGx5aW5nIHBhdGNoIENWRS0yMDI1LTY2NDcxLnBhdGNoDQo+IHBhdGNoaW5nIGZp
bGUgQ0hBTkdFUy5yc3QNCj4gcGF0Y2g6ICoqKiogbWFsZm9ybWVkIHBhdGNoIGF0IGxpbmUgMTA0
Og0KPiBQYXRjaCBDVkUtMjAyNS02NjQ3MS5wYXRjaCBkb2VzIG5vdCBhcHBseSAoZW5mb3JjZSB3
aXRoIC1mKQ0KPiBzdGRlcnI6ICcpDQo+IE5PVEU6IHJlY2lwZSBsaWIzMi1hdmFoaS0wLjgtcjA6
IHRhc2sgZG9fcGFja2FnZWRhdGFfc2V0c2NlbmU6IFN0YXJ0ZWQNCj4gRVJST1I6IHB5dGhvbjMt
dXJsbGliMy0yLjUuMC1yMCBkb19wYXRjaDogQXBwbHlpbmcgcGF0Y2ggJ0NWRS0yMDI1LQ0KPiA2
NjQ3MS5wYXRjaCcgb24gdGFyZ2V0IGRpcmVjdG9yeSAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29y
a2VyL3FlbXV4ODYtDQo+IHdvcmxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Ni02NC12My1wb2t5
LWxpbnV4L3B5dGhvbjMtDQo+IHVybGxpYjMvMi41LjAvc291cmNlcy91cmxsaWIzLTIuNS4wJw0K
PiBDbWRFcnJvcigncXVpbHQgLS1xdWlsdHJjIC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9x
ZW11eDg2LQ0KPiB3b3JsZC9idWlsZC9idWlsZC90bXAvd29yay94ODYtNjQtdjMtcG9reS1saW51
eC9weXRob24zLXVybGxpYjMvMi41LjAvcmVjaXBlLQ0KPiBzeXNyb290LW5hdGl2ZS9ldGMvcXVp
bHRyYyBwdXNoJywgMCwgJ3N0ZG91dDogQXBwbHlpbmcgcGF0Y2ggQ1ZFLTIwMjUtNjY0NzEucGF0
Y2gNCj4gcGF0Y2hpbmcgZmlsZSBDSEFOR0VTLnJzdA0KPiBwYXRjaDogKioqKiBtYWxmb3JtZWQg
cGF0Y2ggYXQgbGluZSAxMDQ6DQo+IFBhdGNoIENWRS0yMDI1LTY2NDcxLnBhdGNoIGRvZXMgbm90
IGFwcGx5IChlbmZvcmNlIHdpdGggLWYpDQo+IHN0ZGVycjogJykNCj4gDQo+IEkgY291bGQgcmVw
cm9kdWNlIHRoYXQgbG9jYWxseSBhcyB3ZWxsLg0KPiANCj4gPg0KPiA+ICAuLi4vcHl0aG9uMy11
cmxsaWIzL0NWRS0yMDI1LTY2NDcxLnBhdGNoICAgICAgfCA5MjcgKysrKysrKysrKysrKysrKysr
DQo+ID4gIC4uLi9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNS4wLmJiICAgICAgICAgICB8ICAg
MSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOTI4IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIz
L0NWRS0yMDI1LQ0KPiA2NjQ3MS5wYXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzL0NWRS0yMDI1LTY2NDcxLnBhdGNo
DQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjMvQ1ZFLTIw
MjUtNjY0NzEucGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAuLmRlMmYyYzA5ZTgNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjMvQ1ZFLTIwMjUtNjY0NzEucGF0Y2gN
Cj4gPiBbLi4uXQ0KPiA+ICsNCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXVybGxpYjNfMi41LjAuYmINCj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjUuMC5iYg0KPiA+IGluZGV4IDc4OTJmYzA4NzQu
LmUyNzdhMTkyZTUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXVybGxpYjNfMi41LjAuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjUuMC5iYg0KPiA+IEBAIC0xMCw2ICsxMCw3IEBA
IGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nDQo+ID4gIFNSQ19VUkkgKz0gIlwNCj4gPiAg
ICAgIGZpbGU6Ly9DVkUtMjAyNS02NjQxOC5wYXRjaCBcDQo+IA0KPiA+ICAgICAgZmlsZTovL0NW
RS0yMDI2LTIxNDQxLnBhdGNoIFwNCj4gPiArICAgIGZpbGU6Ly9DVkUtMjAyNS02NjQ3MS5wYXRj
aCBcDQo+IA0KPiBUaGVyZSBpcyBhIGNvbmZsaWN0IGJldHdlZW4gQ1ZFLTIwMjYtMjE0NDEucGF0
Y2ggYW5kDQo+IENWRS0yMDI1LTY2NDcxLnBhdGNoIG9uIHRoZSBDSEFOR0VTIGZpbGUgYnV0IEkg
ZG8gbm90IHVuZGVyc3RhbmQgd2h5DQo+IHRoaXMgcmV0dXJucyBhIHN5bnRheCBlcnJvci9tYWxm
b3JtZWQgcGF0Y2ggaW5zdGVhZCBvZiBhIGNvbmZsaWN0Lg0KPiANCj4gQ2FuIHlvdSBjaGVjayBw
bGVhc2U/DQoNCkxvb2tzIGxpa2UgZm9yZ290dGVuICJnaXQgY29tbWl0IC0tYW1lbmQiIGFmdGVy
ICJnaXQgYWRkIi4NClYzIGlzIG91dC4NCg0KU29ycnkgZm9yIHRoaXMgbWVzcy4NCg0KUGV0ZXIN
Cg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gPiAgIg0KPiA+DQo+ID4gIERFUEVORFMgKz0gInB5dGhv
bjMtaGF0Y2gtdmNzLW5hdGl2ZSINCj4gDQo+IA0KPiAtLQ0KPiBZb2FubiBDb25nYWwNCj4gU21p
bGUgRUNTDQoNCg==

