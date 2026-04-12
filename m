Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4B1E93804
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 21:01:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.257546.1776027699823084706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 14:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WVnAciYG;
 spf=pass (domain: siemens.com, ip: 40.107.130.69, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC+PEud1Mn5SUiBjtk4qGvKBqHS6aWwezKLKHg1jqpy5Y7imfJEHhx3sMoaI+J+rb+htBfo9F8+xsLHnXCveuFurApUNvjbeHyfZPYtMm6sHA0bZYcxkHXtAoUYEv3iCgzQOoTrIvtNCeIb2qZAXsodnj7yaBWzYEv9IONb7xFe3xDh5+4ifsLvtnqqksFisNk5TozQVMJoQRt5thlwYMp4OqO3McHvTMVGBVvRUWQSPXRPhhx2m4jcX087HC59iqm/5MFh2p+09KyFXfhEj5400Ul3KBOl8xxLKUQ8q+lJMOM83HjmJy/cjHwoOSfOqr6MhV7eEjtVPirnwD9pqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ho403ZvxzlfxdnLWlvp1A+nXRh/AyncWAE0zemBLT8=;
 b=j/N+T6bEOeEf+hlOjDiDZy7kRqFTLndX/VeclPO3h6wJogSuvTjb4sNBkT1JnU/EpF84v/1oBkt1pCaKFH6XnJfsw+K5wXpx7dQxdGN5Qo7hs1HKKxX+uJDlEW4GIpM6rQRpDeouNMpmPRys31AADsbH9RQkiixAwkBmFZsj9utdUqDmJLFCTbR3FEnNTukwA+26nOELgjMQBazxQE/FIYNFCsmOKZfoENRTk+DcgfUy+uOc/o2JHQ6d4nwX7ZSzu/TWEpmHpSrg17S2MHBvo70uIhxf5iZnkOSRZcv0z6l0Errzx+OCfD2Z5gesVb3JX+4dLhrJIEtrII7Uu9RBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ho403ZvxzlfxdnLWlvp1A+nXRh/AyncWAE0zemBLT8=;
 b=WVnAciYG9UYAqrKfjRUGUqxJg3cA2Seu3T+6tCrtJo1dAbhp2YZ74039BuGa7Y4Zq2EB0wcfTFKTy0yjH48AKoNt7XUcpkHugZzUMx/Paj1zPC/LXT2HyDoIczJWiO3VPHQzcqOodhrfSeCVL/hQmvSg9Vh0wrgxvQBzqYGjzJn0kg3wYuDXs5mFYVqkozf+8d20+I1GACZxmGc/EGUpy3YGO2CCPCftSljonF7Ka1JdF9CD2Jor9pjG9YS9kFu1Jxm4XnuDFq42f2I62uLDXWrgUyA+x5lzcQOfiS7EgLUxVZo6x1okgVFxbT5bMgw+NqUgnMbkmtX3YkPJdQ81yQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sun, 12 Apr
 2026 21:01:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 21:01:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>, Ross Burton
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Thread-Topic: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Thread-Index: AQHcyq2co6Yk9IO1d0Coj5Am6U3L27XbxjhQgAAYqICAAAhHgA==
Date: Sun, 12 Apr 2026 21:01:35 +0000
Message-ID: 
 <AS1PR10MB56973C7FC237B95B05B7B1DBFD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260412185201.2556780-1-peter.marko@siemens.com>
 <20260412185201.2556780-2-peter.marko@siemens.com>
 <AS1PR10MB5697C1A55909F05EE73FB5A2FD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <13986342.uLZWGnKmhe@brobin-bootlin>
In-Reply-To: <13986342.uLZWGnKmhe@brobin-bootlin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=dd24626c-4be4-4606-884a-f705367e8eac;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-12T20:52:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6083:EE_
x-ms-office365-filtering-correlation-id: e907110d-cd14-467c-cd24-08de98d6aeb9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|55112099003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 GK4nYGszF9xhM7I6XoJE1ceDiEmHcO8Dd7uKGyTdSXCf+TPTO/RcDJDl1XnXKoBqIjtM/IuwEKOqQYYsW0Eq1BCrX66D+xSXLVWPEoy4TzJjV9iHAy2A8LR3xDr6pS/zzWyFkH9orPiEt5KyFM+xROvBPyO/cUCESzZoDfAGL4n4ME+XPGrj7lKEZnI4ve4pmhRo0rgHuAEJY2IV4F14l0ELZ/Po6OIuQIDfbB3jIyh5KoEuYLvlprbg7TQtMbD5HA7OTnd62cb76soPUBOu0lIOa90Qpg836pHCi5KLIg0ko9ISv646/5cNLFsG8vEZ9FlXnBSw83+ru9p92mSOuf4O8xTGSqjp2pWYfeljwC4h56o8q6JtLwEHFRHPgHrFfD3TWGn53fB9QKCWGNeIFH8SCc3Mm/fw+2a8DwhT6BcZGNxpsOjqHkCx+dB4lJQaOA5TqCtOxJQnJxtOQUw/Ck5GHGAdE7JODmKfeJvdQ+q/4NLeIu0Izyd/tqxpWJs+R+0BWQAFEey97myaiLzKovbd7INJt/Plnn04cUFFEpPpynSlDx/X8yJQ4RWK8tCKaTGKMzMAEdS5cpDGpFLl6Ac4BWYr2mgqrRzQZQiDxB0wTD0dszZiPZJp2kfE7tjFFQnouUEmR5YaqFhB0wIR1m1QJ204f/3PHzcC8o18YVVRUBaAw5H7XUZywrBnxbwK2qXGQf4niDUceQW8Sx3eV+oNu5Jr4460LYjJcpNO9oE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(55112099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WjhVQ3lkcUJMTFdiZGg2dXB0Tm9sa3VWQUNQUXgxVVNrQjFhKzBCM0hNaWt1?=
 =?utf-8?B?UVdzbnVYNDY3cWRrWGlUUFpucEZveldOT2l2U3pFQ1V1VXJpS2FsS242ZWZV?=
 =?utf-8?B?RjczQXJjSVdhWHhFNFZsb3M1VVZIQzIzd0VNeTZuMkxoS2VOdVhmeHM5bldx?=
 =?utf-8?B?UlkxUFd2d0hMNzNaUE4yeEcyNkhXZ3ZvWkVzZU1UMk1lWHhLcjExbThEeUpH?=
 =?utf-8?B?b05qd3MycUhjdWo2NTVMQ2FqcFE4YzdydnI0OEIwejVGaTdLWWtrNkI2bDVY?=
 =?utf-8?B?dUVyc0k5K0dXME5ZMk15eXA3SWlpcVFpOWtIS1pBVk5CNjZyd25oRmttRTZB?=
 =?utf-8?B?TTZ2SVJDdnlIaEg1VzRycysrcWVSQm1QelJGZHNxUCtvcTFDUnkwQVliTW5n?=
 =?utf-8?B?MFFCeDI2ajZtSEpZMHV6RGZMZlBKL1Z6bW0vLzB5aHFpRmowMWsyNkZWNHFV?=
 =?utf-8?B?ZjhOS2xyblpWMWNkYzlnVTB6djFweUZFeEJiN1k1WEpKZ25XSXh4Q0p1K2JI?=
 =?utf-8?B?OXVCc2JQMVJobjZEM2FkUHUzYTNRM0ZwTW42UmFvbVk1c3BoYlhQZDJOTXJ2?=
 =?utf-8?B?RkRlVDU0eGU1U3lHcXdLdlZqUEVPWWtaRTVMeUxRK29oVS9JeUNuN1J5Qk1H?=
 =?utf-8?B?R2VOTjBSYnQrV1lqV3FMQU1pbDBrdHlsaEJzVGpKUW8zdnlFeWVrak1YaFhJ?=
 =?utf-8?B?QlQ0dGNBaVBMbUcvVFV0ZnZXdEIvVG9kblZpZHI5YzhiSHNGMGlKWEQvOG9U?=
 =?utf-8?B?L1NvYVdOREdMbmVyNVhWSkcvQkVFS1lsdFFPMkNNTldCTGg1cGhQOU1BR1Ru?=
 =?utf-8?B?M0doNzZJb016WVRpY1Eyb1ZSclFsbGRjbW5rYkwwSEVNd2tlWndmVUxLcERN?=
 =?utf-8?B?WEJwYVpieTdnR1htSnVTSWVDMERkQVJYMS9YZmI5VmpQV1pjZDhicEVIU1RV?=
 =?utf-8?B?M2lQMVl0S2d0UGdVMGJUL3RXYytpTlk0ZzBUMFJrNlRrLzBHY0N0VGtjdDU3?=
 =?utf-8?B?S1EycWgwVEFqQTdlSVR2SmNZVzM3V3NYb05Td201ZWlaVzltQzRkR1BaaENx?=
 =?utf-8?B?a0p4V0ZaOC8xTW1sUDJSbFZORVBmSEhjWkFhOHQ1UVNnQ1FBYWp0OFQzeDhG?=
 =?utf-8?B?RmcrYmZDeFNleUVOdVlNYW5KWjRMZVd2bzBhT3BVN1E2eHFNRXJWY1QyRzNH?=
 =?utf-8?B?YTBHRjYyRGZmeWdxVkVObC8zZklrSW1DK0NLYmtSQlhaSVVkb3NGM1hxcm9t?=
 =?utf-8?B?a1JkdGh4RXVvWXplMlFWdzQyc1krVUhNU0E4TDYzdFZSN09kTUVPNHFZU3N5?=
 =?utf-8?B?RzAyc3psWnl2VGhaZ0Vvaml6eFFRczhPM2RXaVdrUC95VlV4VWpveDA5SkZM?=
 =?utf-8?B?anpjZkZlT09RQWMrblpHNjRkNTd5RTVsU1F3Y3ZpckZPdmpmeU1EdHE0ZDU2?=
 =?utf-8?B?R2lxZDFFL0VnOGJlcVAyTVdzYU9HZElIQ09STG42VE1PZ3dNZ2hYdzl5K0ox?=
 =?utf-8?B?L0ViTWtJcUYvQ3AyOFdRUlFzSDRNbXBGdUc1LzdZV3lsUnBoakZPdGYydUFa?=
 =?utf-8?B?dDBDbHVtTlZxeFdEa2o2WnJaSnQ0cml0V0Yvem1VUGYyMzRuZmIxRG5qYU9i?=
 =?utf-8?B?L0xDd0dZa1BVaHcza1EzNTU5eUM5VTlZZmUxT0VBd0t0OWFmdkU3U1lOd2ZJ?=
 =?utf-8?B?WFVIQXB5SkxzU1RXZFZhTmVKTlIzaytUSHZHMEJDdHVzNE94UUZBTXQ4MG8z?=
 =?utf-8?B?a0tNZVdyVGFNbStYaGMrMlMwdFVxVllGZ3JGUXBXRE5MOGxLNSt5b1IzeTAv?=
 =?utf-8?B?bHJaVXExcWtLQjhkbzVqYUd3TCsvT2JrbXMzNy9TU283M1ovZThTdXI3RjRL?=
 =?utf-8?B?dDlLRDlEdTAzbXVSZWkyQ2ZVNGFJR08waXdRSGJIc1FwVEE5ZFNpUXp0OUZV?=
 =?utf-8?B?Znk2OC8zRmRBZEJ4eTdTMEp5akQ5cFpZdzJCWHUxYTRpQ3hHV1FWbE5XaUFl?=
 =?utf-8?B?UHRUTFpHeUJJaTJXRjE2NFpxV1JQQS9Lcys3dnlCNUR3a1VxWHpwcklEZVUr?=
 =?utf-8?B?Z1RUQytUQzlBbXliMGpaQVZOSkJHUDhsb1hSejNMdTY1WklLLzcvS1lmMmRm?=
 =?utf-8?B?a0NlWVlRMU5XMGw0MkFPSVk5UmtRcWU2N0NnUGpWVTlMQkF5cHBwNzVtck9a?=
 =?utf-8?B?aTljaCtMbmIrUVRXYi84TmdMZzdzZGpBdmhoOGpmVzJ1bmZCZ2RxV1luRjF4?=
 =?utf-8?B?TTcvaDRZb3dicFpZSkwvWXFLQ1BMQzRlMytod3ZqbFJUTUN3ZE0rczJ1bVc3?=
 =?utf-8?B?YW9Nb2NkY3FIbXUyTFJuMkRQM0hFMmNUN2xsbkh6KzdlQndEbG12QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e907110d-cd14-467c-cd24-08de98d6aeb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 21:01:35.4898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBFaGUWbTbMJrYTlZZpo0hfJ12l6LQxGRuhFWNMLG8GL4m68LTlkWiuhJrDqHcVLTPUT68MLJ8IZ374iXO7MHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235076

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
PGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBTdW5kYXksIEFwcmlsIDEyLCAy
MDI2IDEwOjIzIFBNDQo+IFRvOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT47IE1h
cmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKQ0KPiA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMi8yXSB4d2F5bGFuZDogc2V0IHN0YXR1cyBmb3IgQ1ZFLTIwMjQtMjE4
ODYNCj4gDQo+IEhlbGxvIFBldGVyLA0KPiANCj4gT24gU3VuZGF5LCBBcHJpbCAxMiwgMjAyNiBh
dCA5OjA04oCvUE0sIE1hcmtvLCBQZXRlciB3cm90ZToNCj4gPiA+IEZyb206IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiA+DQo+ID4gPiBSZWZlcmVuY2UgWzFdOg0K
PiA+ID4gSW50cm9kdWNlZCBpbjogeG9yZy1zZXJ2ZXItMS4xMy4wICgyMDEyKQ0KPiA+ID4gRml4
ZWQgaW46IHhvcmctc2VydmVyLTIxLjEuMTEgYW5kIHh3YXlsYW5kLTIzLjIuNA0KPiA+ID4NCj4g
PiA+IE5vdGUgdGhhdCB0aGUgc3RhdHVzIHNob3VsZCBiZSAiZml4ZWQtdmVyc2lvbiIsIGhvd2V2
ZXIgdGhhdCBkb2VzIG5vdA0KPiA+ID4gc2VlbSB0byB3b3JrIGNvcnJlY3RseSB3aXRoIHRoZSBu
ZXcgc2JvbS1jdmUtY2hlY2suDQo+ID4NCj4gPiBUaGlzIGxvb2tzIGxpa2UgYSBidWcgaW4gc2Jv
bS1jdmUtY2hlY2sgKG9yIHZleD8pIGNvZGUuDQo+ID4gQW55IGlkZWEgd2h5IGNlcnRhaW4gbWFu
dWFsIENWRV9TVEFUVVNlcyB3b3VsZCBiZSBvdmVycmlkZGVuIGJ5IGN2ZWxpc3RWNQ0KPiBzdGF0
dXM/DQo+IA0KPiBUaGlzIHNob3VsZCBub3QgYmUgcG9zc2libGUuIFdpdGggZGVmYXVsdCBjb25m
aWd1cmF0aW9uIGEgbWFudWFsDQo+IGFubm90YXRpb24gY2Fubm90IGJlIG92ZXJ3cml0dGVuLiBz
Ym9tLWN2ZS1jaGVjayBkaXJlY3RseSB1c2UgdGhlDQo+IGFubm90YXRpb24gd2l0aG91dCBhbnkg
ZXh0cmEgcHJvY2Vzc2luZy4NCg0KSSB3b25kZXIgd2hhdCBJJ20gZG9pbmcgd3Jvbmcgd2hlbiB1
c2luZyB0aGlzIG5ldyBjb2RlIGZvciB0aGUgZmlyc3QgdGltZS4uLg0KV2hlbiBJIGdvdCB0byB0
aGUgIm5ldyIgQ1ZFIGZvciBvdm1mLCBjdmUtbWV0cmljcyBzaG93cyBvbmx5IENWRS0yMDI0LTEy
OTguDQpJbiBteSBsb2NhbCBidWlsZCwgSSBnZXQgYWxsIHRoZSBDVkVzICh3aGljaCBhcmUgc2Ug
dG8gZml4ZWQtdmVyc2lvbiBpbiB0aGUgcmVjaXBlKS4NCg0KUkVDSVBFPW92bWY7IGJpdGJha2Ug
JFJFQ0lQRSAtYyBzYm9tX2N2ZV9jaGVja19yZWNpcGU7IGpxIC1yICcucGFja2FnZVtdIHwgc2Vs
ZWN0KC5uYW1lID09ICInJFJFQ0lQRSciKSB8IC5pc3N1ZVtdPyB8IHNlbGVjdCguc3RhdHVzID09
ICJVbnBhdGNoZWQiKSB8IC5pZCcgdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni02NC8kUkVDSVBF
LXJlY2lwZS1zYm9tLnNib20tY3ZlLWNoZWNrLnlvY3RvLmpzb24NCkNWRS0yMDE0LTQ4NTkNCkNW
RS0yMDE0LTQ4NjANCkNWRS0yMDE0LTgyNzENCkNWRS0yMDE5LTE0NTUzDQpDVkUtMjAxOS0xNDU1
OQ0KQ1ZFLTIwMTktMTQ1NjINCkNWRS0yMDE5LTE0NTYzDQpDVkUtMjAxOS0xNDU3NQ0KQ1ZFLTIw
MTktMTQ1ODYNCkNWRS0yMDE5LTE0NTg3DQpDVkUtMjAyNC0xMjk4DQoNCk15IGxvY2FsLmNvbmYg
aXM6DQpESVNUUk8gPSAicG9reSINCklOSEVSSVQgKz0gInNib20tY3ZlLWNoZWNrLXJlY2lwZSIN
ClNSQ1JFVjpwbi1zYm9tLWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmUgPSAiODJlMThl
YjMwNTEwMzk2NDJlZDhlYzBiOGViMTVlYTI3ZGJiZjUyYyINCmluY2x1ZGUgY29uZi9kaXN0cm8v
aW5jbHVkZS9jdmUtZXh0cmEtZXhjbHVzaW9ucy5pbmMNCg0KUGV0ZXINCg0KPiANCj4gPiA+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS45
LmJiDQo+IGIvbWV0YS9yZWNpcGVzLQ0KPiA+ID4gZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRf
MjQuMS45LmJiDQo+ID4gPiBpbmRleCBkZjFiYjdlMzFiLi42YzEwZWRkYjhlIDEwMDY0NA0KPiA+
ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuOS5i
Yg0KPiA+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0
LjEuOS5iYg0KPiA+ID4gQEAgLTE0LDYgKzE0LDggQEAgU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4g
PiA+ICJmMjk3YWYyN2E4NDUwOGRiOWI4MGQxY2JiY2M2OWMzODAxZGEzOGViNjRjNzJmM2I1YjUw
ZjU4MjQ1DQo+ID4gPg0KPiA+ID4gIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLQ0K
PiAoP1A8cHZlcj5cZCsoXC4oPyE5MFxkKVxkKykrKVwudGFyIg0KPiA+ID4NCj4gPiA+ICtDVkVf
U1RBVFVTW0NWRS0yMDI0LTIxODg2XSA9ICJ2ZXJzaW9uLW5vdC1pbi1yYW5nZTogZml4ZWQgc2lu
Y2UNCj4geHdheWxhbmQtDQo+ID4gPiAyMy4yLjQiDQo+ID4gPiArDQo+ID4gPiAgaW5oZXJpdCBt
ZXNvbiBmZWF0dXJlc19jaGVjayBwa2djb25maWcNCj4gPiA+ICBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAieDExIG9wZW5nbCINCj4gDQo+IFdoYXQgeW91IHNlZSBpcyBwZXJmZWN0bHkgbm9y
bWFsLg0KPiBUaGUgcmVjaXBlIGlzIG5hbWVkICJ4d2F5bGFuZCIsIHdpdGhvdXQgYSBDVkVfUFJP
RFVDVCBzcGVjaWZpZWQsIHNvIHRoZQ0KPiBkZWZhdWx0IENQRSBpcyAiY3BlOjIuMzoqOio6eHdh
eWxhbmQ6MjQuMS45Oio6KjoqOio6KjoqOioiDQo+IA0KPiBUaGUgQ1ZFIGlzIGFzc29jaWF0ZWQg
d2l0aCB4b3JnLXNlcnZlciBhbmQgd2l0aCB4d2F5bGFuZC4NCj4gQW5kIGlmIHlvdSBub3RpY2Us
IGluIHRoZSByZXBvcnQgdGhlIENWRSBpcyBsaW5rZWQgdG8geG9yZy1zZXJ2ZXINCj4gYW5kIHRv
IHh3YXlsYW5kOiBUaGUgQ1ZFIGlzIHJlZmVyZW5jZWQgdHdpY2UgaW4gdGhlIHJlcG9ydC4NCj4g
V2hlbiBhc3NvY2lhdGVkIHdpdGggeG9yZy1zZXJ2ZXIgdGhlIGFubm90YXRpb24gZG9lcyBub3Qg
d29yaywNCj4gYnV0IHdoZW4gYXNzb2NpYXRlZCB3aXRoIHh3YXlsYW5kIGl0IHdvcmtzLg0KPiAN
Cj4gSSBndWVzcyB5b3UgYWxzbyBuZWVkIHRvIGFkZCB0aGUgQ1ZFX1NUQVRVUyBpbiB4c2VydmVy
LXhvcmcgcmVjaXBlLg0KPiANCj4gLS0NCj4gQmVuamFtaW4gUm9iaW4sIEJvb3RsaW4NCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29t
DQo+IA0KPiANCg0K

