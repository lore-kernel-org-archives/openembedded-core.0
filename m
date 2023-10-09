Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240A8CD6138
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 21:09:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.47])
 by mx.groups.io with SMTP id smtpd.web11.75246.1696885740384622640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 14:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gnv8ozZM;
 spf=pass (domain: siemens.com, ip: 40.107.6.47, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZD4GQsDoHLesNjKYPkOTh00RZb4K7oZHQqo3iPuJLAb5VP+EDr7/MGq/25VJRN/hBVAErCtFduWLSRyKJhWdfF5eT2Msn1V24gjuK8t678gVXp6L1SW0q6CtyCDHA0elFFS0DPGqG+BbIHQLZ0lVTl+q6OdQvEiqKH4ZfEUad9RAJFKWPLFR9m4w9+axOy3DbSahJVUdOIceQVJYa50k65aL+YIjvrRoIns/jUga/0LS9DDddOzTy7q3P9BUJ0Sfiy8g4kMwkRec8yxBjePtnLQeuJeYshkvEh2v13hjx9TwoKD6SMkRxqUzU6ihfTaFTO33u1xqITeQTWg6gJzgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhLtLA7imkROWAxLe17xusTF3kiauSbmzQkpfYuMIAg=;
 b=Mxji+gDQv7LkPeDzurg/Y+e3gy6GOi6DWdPBn2TmCkA61cIxVhhh8mWvXIvcW9WYTuDPrmSG/X99hwsg1lmoxTLoQEBgLHjz8/mTJ5DthRnKUIx+JbWvAACI+qQRLvWVHxt3C1zPLK/nFPKchrK1qTaITUXyO0wVLvvUbrCW/zueF7NZ6+ulRe0v04SZXkdsu7QJnvffAOZVnkxkKHg9Xi8LYEEmO6A0J7/bz74NoH5ZaRNjzTcLslBOA+uoz2KE+wykkWDGE/hcmhVYqve7SV92q/9De83zjfDypZLHw39KktvxdWVQYNWt9j3tf/tZDL9c/ObI/wfn8IHdmMD2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhLtLA7imkROWAxLe17xusTF3kiauSbmzQkpfYuMIAg=;
 b=gnv8ozZMrO3bVudUVYqmrjcnHGJuiKmmhVg7CUxuQ6mRJN6eZ3UMx5QQ6M9+AnPCOY6UGbkMVOEdBHMU71zm9aQkum4zqcAV3Y1qanDPwkNQMhf0RMXN17uOgqY66pAurN77AAjTvLO5k+q1uTJRq/BN4iZauPervsXOJpuI1DNzaoHIQpil5z9cRxy3WgVu0HdGag1/ICsutLaIWVFGCdELkhS7eih9nidBKW4L3g8gTXpip59ZN6sakT8RycpMd9NS6dwVEswTwtHrR3k3RcUDiXwOUbSt/25zzdJ4vjA2mx71263z6TPD5DwCTJqK3vl5yy9eZHHJBhvoTzVe2A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7452.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 21:08:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 21:08:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable
 2.35 branch
Thread-Topic: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable
 2.35 branch
Thread-Index: AQHZ+JEWVOxjxXcgIUqs7UjvpSoxH7BB1xWAgAAfi9A=
Date: Mon, 9 Oct 2023 21:08:57 +0000
Message-ID: 
 <AS1PR10MB569729A5E196CF9B0F44965DFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231006200814.178676-1-peter.marko@siemens.com>
 <CAB2nKc8_7uCz20PSnRXY+ycoP+jekwWev9PUAFwt_DcFcxtnkQ@mail.gmail.com>
In-Reply-To: 
 <CAB2nKc8_7uCz20PSnRXY+ycoP+jekwWev9PUAFwt_DcFcxtnkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=eaa4d783-fcc5-4dc9-b251-e7dda566fb43;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-09T21:02:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7452:EE_
x-ms-office365-filtering-correlation-id: 7526fe68-7b3c-4e7b-bde0-08dbc90bf3c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KUaILTmRelOACqtlEV4Q55zXFBPx6DmOAYXVEFJqIcvvaVRu1wxJgZtNjqW35uchAR88qsjXgl3AlN0Q+iRle/QSCX1bggvjzfcW7tIkZwj3L/BHBH3ojM4kHyJflx/JOwt3BcGug6BbWLhEeUFr+m4F2xQME03oXf4NWWbAsnXBTI+yJwblivabK3GRDnW0ljMgTSLPDMfRW4j9nKyX+ddNIuwY0Pe421g5Uo7dUqx/Mmh5iNY5+axO+x1OOnEBc3gewdMlGc6v5iiHxX0pSBmrkor8KM7Spe+CnK3+DhtFPdMtKKIpjMPFhmlbK9Fh6JexmvT0uIsV64pdqmPaE2D9NC47nlN+Y8vVuopjEqttFGznd0b+/4Ik0UXETuskSFRKYDE6QtspOFdVYKBIVq9an8MSS2p7dNeF9cUOAIPjf0IG0nijzArW5/LzVYdbmA1sgk04jZP9pbO5r64TpYKbIii6XL7igXEBcxfXSLfELko852T46+Yw1+vJBFuGcLBXje3wmtx8vrK0qfZ6zRcbeA0gzzDlGDaDsjkqWKIEFppEaYGQOoQkkWKmg2TYIFGz+K89oZGzWMJvc+FizCUl9IRgbAoCUEhogg3S3xo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66446008)(316002)(966005)(6916009)(64756008)(66476007)(66574015)(66946007)(76116006)(15650500001)(26005)(55236004)(53546011)(71200400001)(41300700001)(2906002)(8936002)(4326008)(9686003)(7696005)(6506007)(5660300002)(52536014)(83380400001)(8676002)(478600001)(38070700005)(38100700002)(122000001)(82960400001)(86362001)(33656002)(66899024)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFp5U3N0cTVzU3BPYjB5VGZ2b1FVZ3RSNkk5c24vN3V0V090a2JXK1hBaDJm?=
 =?utf-8?B?ZEZINWt4TnJadG15Y20yUHhDOFQxRVcwL2ZKQTZyOXBPbGdFQ1BZbHY4K3hr?=
 =?utf-8?B?VSsrdXRsWkh4blVIMS92akt6em5YdUJmeHZPY1Qxeml6Nk1FbTNETjR5U1U0?=
 =?utf-8?B?WE1VaTlFWVdkQTgrU1RscHBmTmZwMjVJNEZkNXl5dERabXYzbUV2YnRvRkli?=
 =?utf-8?B?RWRmL2xGNWJ1S0lRcVE0WElWSFJieGR3ZU9kTWcxeTRzYXFRZjBSa2lKa25l?=
 =?utf-8?B?T1V6VmVVelFOa0NJYXprdVZhUThwUFc4Nll1MGx3OTNZK3BHd1JHSWJadWQx?=
 =?utf-8?B?UklyTFJ3amJYSTdpRHBWcXBjd05zR1ptZEpGQWs4a0hOSmxlaWljaEc3QWNp?=
 =?utf-8?B?dzlYdjN2czE4QmpHYnA4WDYrcDgvK29rUlNweWNJVjNkMmozYWd3UXdjUlZq?=
 =?utf-8?B?YUMxZGNzVG1ja3RmMUlGL2dmaURrZ1VCZm11enB3N0ZMRWd2eGJURS96eVZj?=
 =?utf-8?B?TG5VdnZiditEQzJwa2dXaTlNSldMeW9UV2Fuako0UDMvYStCVk1nKytGdm1u?=
 =?utf-8?B?QWVncVVzamg4NzFwckxlYVNmU2lINHh1UUkvNXhqTXA0SmdyaldHa1k1SVlV?=
 =?utf-8?B?WjB5aC9uSU9CQ3ZzbmV3eTVuMDhCWVFjcFEzOW5qUm0yWmlrQ21tYVp0bVp5?=
 =?utf-8?B?elJaNWJLNVovSjl3d09ScE16RURGUEhKQWRmQ3ZML09DY1hvRUp2elhjRElv?=
 =?utf-8?B?cjArOGxnUER0dWlvL1VzdjV4c25ONjlxSFN1aG9iMG9YbktQNnN1Mm0xa2Mx?=
 =?utf-8?B?Y3RtRitMVEprWm1KdE1DN0NrVmp3eEkwM0phSzBCZjVhL1h4Nm5lZ0hCOVVC?=
 =?utf-8?B?ZE11YktJcXowM3pyWERhdll2dU94SUJrQ0oySHMzSG5xRTg3eGNqMEJrUjdV?=
 =?utf-8?B?R1RibXF3ZDNMV3I5MUVmMGFoWEppeDVLME41cXMrZGJucXJuN1VMMWxHY1Z2?=
 =?utf-8?B?cjVHc3BMdEZiTGNNSWxRMDdEeDJmL1VJZ2hmNTErdno4S0hxYUpOSVozNXk3?=
 =?utf-8?B?cDdkeG8vODIvZHpkYm5WeVYxK2pCNE5tNE9lNDhGMm1aT1ZiK29QRzhPYWRW?=
 =?utf-8?B?dVJOWkpRcmFWWnY2R0NxOGh0bGFzS1pvVk9DMDR2eTlOUFpWb3cyREdMUk1w?=
 =?utf-8?B?emFYdWhLdW5QWDIzeFhGdjNXVEZRbWNmK29pbWIvZTUxNWgyL3JiSkM5WXhs?=
 =?utf-8?B?bHI3NjdYbzgrN0RtZFBlZEN6a1dHcExnSnBzaGxGbXdCNEIyckh5UCs5RDBJ?=
 =?utf-8?B?aGtiSEMvNEFEcHpnQjBVSHBxRmNRNEdjbzNxN2dwQUROU1FCbUwyUm9NUS9k?=
 =?utf-8?B?SDNBa0R4TThnL3dDWHZ1bS9aYmNyWEJCanVCV1VRZi9jdjFTWEloZHMzTVJr?=
 =?utf-8?B?andMZy9WcUE0dDlkb0taRDV5U3NUWlRMWTJocjF0NEZ2bzgyVTc2TEU1N3hy?=
 =?utf-8?B?bzRsWC9xN1NUVE5Ca2dsT0M1Q3NLVzdlcURGU05BWlhDZVlPdzZhMFJ0SitW?=
 =?utf-8?B?TWhwTnVmN2syNnNKZkljd1ZPZ2s0WDF0ZDVpQUdvRjlrR25Fc3Y4TDF4NmF1?=
 =?utf-8?B?N3NkL0Q3MlczTjUzUkFVcnptL0dBVSs3dDNZSG1tSXYwOCtobWN3MFJhSHp2?=
 =?utf-8?B?bWppbFRaQzNHNUhVUUZNUGRZNjF2TDk5dzlWalpXb0d1TEt1Y2gwUnI2SHJx?=
 =?utf-8?B?UkxCenEyUGZFb1orZlJSYlI3UktwVlp0WTVRTVRuOGwvcWxqeU5kSjZod1ZH?=
 =?utf-8?B?UTk0c3dLRFlwOUlSK0FzMndicDJ0K0VSRTFjcWVWdmkrTkVMVXVMbmRwRFZr?=
 =?utf-8?B?dzRvTkhDRDZhSHh3TXhxM0NZaFpqQ29Pb1hkQWNleTQ4YWtENC9tT2xib0JC?=
 =?utf-8?B?Zm9yUEM4L2YyVDBFUjFaSmNKdjJZOU9GR0VlZzhtK3NNSmVHSStISElRUGls?=
 =?utf-8?B?MXl2VXVjNmtyOXl4V2RGVVVYMG1GcmZjZ1F3bnRXWGJ4YTJUTUpWZ295N0R0?=
 =?utf-8?B?RFAxcEgrS0xlLzJrOFlkVnIvREhQUHRDRE9jSENDeWQzM2dzM25ONFQ3UjRO?=
 =?utf-8?Q?dDt1sWfSwOafcXjn2sfwkOXuA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7526fe68-7b3c-4e7b-bde0-08dbc90bf3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 21:08:57.4452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6toenEsbyI+XKcKWnJ6taAGTM9erRVYlLpmiOq2QUmHfGmGcoqnp/zEWkbFit/buArAjb0w3ETh0bGWdqpaUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 21:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188867

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFZpbmNlbnQgUHJpbmNlIDx2aW5jZW50
LnByaW5jZS5mckBnbWFpbC5jb20+IA0KU2VudDogTW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgMjE6
MDkNClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpT
dWJqZWN0OiBSZTogW09FLWNvcmVdW2tpcmtzdG9uZV1bUEFUQ0hdIGdsaWJjOiBVcGRhdGUgdG8g
bGF0ZXN0IG9uIHN0YWJsZSAyLjM1IGJyYW5jaA0KDQo+IEhlbGxvLA0KPg0KPiBJIGhhdmUgYSBz
bWFsbCBxdWVzdGlvbiBjb25jZXJuaW5nIGdsaWJjIHNvdXJjZSBoYW5kbGluZy4NCj4NCj4gSSBo
YXZlIGEgbWFjaGluZSBjb25uZWN0ZWQgdG8gdGhlIEludGVybmV0IHRoYXQgcnVucw0KPiBiaXRi
YWtlIC1rIC1mIC0tcnVuYWxsPWZldGNoIHVuaXZlcnNlDQo+IGFuZCBhbm90aGVyIG9mZmxpbmUg
bWFjaGluZSB0aGF0IHVzZXMgdGhlIHByZXZpb3VzIGZldGNoIGFzIGEgc291cmNlIG1pcnJvci4N
Cj4gV2hlbiBJIGJpdGJha2UgbXkgaW1hZ2UsIGl0IGZhaWxzIHRvIHVzZSB0aGlzIHdpdGgNCj4N
Cj4gRVJST1I6IGNyb3NzLWxvY2FsZWRlZi1uYXRpdmUtMi4zNS1yMCBkb19mZXRjaDogQml0YmFr
ZSBGZXRjaGVyIEVycm9yOg0KPiBOZXR3b3JrQWNjZXNzKCdnaXQ6Ly9zb3VyY2V3YXJlLm9yZy9n
aXQvZ2xpYmMuZ2l0O2JyYW5jaD1yZWxlYXNlLzIuMzUvbWFzdGVyO25hbWU9Z2xpYmMnLA0KPiAn
TEFORz1DIGdpdCAtYyBjb3JlLmZzeW5jb2JqZWN0ZmlsZXM9MCAtYyBnYy5hdXRvRGV0YWNoPWZh
bHNlIC1jDQo+IGNvcmUucGFnZXI9Y2F0IGZldGNoIC1mIC0tcHJvZ3Jlc3MgZ2l0Oi8vc291cmNl
d2FyZS5vcmcvZ2l0L2dsaWJjLmdpdA0KPiByZWZzL2hlYWRzLyo6cmVmcy9oZWFkcy8qIHJlZnMv
dGFncy8qOnJlZnMvdGFncy8qJykNCj4gSXQgc2VlbXMgZ2l0IGFyY2hpdmVzIHNlZW0gY29ycnVw
dGVkPw0KPg0KPiBEbyB5b3Uga25vdyB3aGF0IGNvdWxkIGJlIGNhdXNpbmcgdGhpcz8NCj4gQmVz
dCByZWdhcmRzLA0KPiBWaW5jZW50DQoNCkZldGNoIHdvcmtzIGZvciBtZSBhbmQgc2luY2UgaXQg
d2FzIG1lcmdlZCBhbHNvIG9uIGF1dG9idWlsZGVyLg0KV2hhdCBJIGNhbiBpbWFnaW5lIGlzIHRo
YXQgeW91ciBmZXRjaCBvbiBuZXR3b3JrZWQgbWFjaGluZSBmYWlsZWQgKGUuZy4gZHVlIHRvIHRl
bXBvcmFyeSBuZXR3b3JrIHByb2JsZW0pLg0KRGlkIHlvdSBjaGVjayBsb2cgb24gdGhlIG5ldHdv
cmtlZCBtYWNoaW5lPw0KDQpQZXRlcg0KDQo+DQo+IExlIHZlbi4gNiBvY3QuIDIwMjMgw6AgMjI6
MTAsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJr
bz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBhIMOpY3JpdCA6DQo+ID4NCj4g
PiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBB
ZHJlc3NlcyBDVkUtMjAyMy00OTExLg0KPiA+DQo+ID4gU2luZ2xlIGNvbW1pdCBidW1wOg0KPiA+
ICogYzg0MDE4YTA1YWUgdHVuYWJsZXM6IFRlcm1pbmF0ZSBpZiBlbmQgb2YgaW5wdXQgaXMgcmVh
Y2hlZCAoQ1ZFLTIwMjMtNDkxMSkNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYmMvZ2xpYmMtdmVyc2lvbi5pbmMgfCAyICstDQo+ID4gIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWJjL2dsaWJjXzIuMzUuYmIgICAgIHwgMiArLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy12ZXJzaW9uLmluYyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWJjL2dsaWJjLXZlcnNpb24uaW5jDQo+ID4gaW5kZXggYzIzYTQzNTc2Yy4uZTBkNDdmMjgz
YiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy12ZXJzaW9u
LmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLXZlcnNpb24uaW5j
DQo+ID4gQEAgLTEsNiArMSw2IEBADQo+ID4gIFNSQ0JSQU5DSCA/PSAicmVsZWFzZS8yLjM1L21h
c3RlciINCj4gPiAgUFYgPSAiMi4zNSINCj4gPiAtU1JDUkVWX2dsaWJjID89ICI3M2Q0Y2U3Mjhh
NTlkZWIyZmQxODk2OWU1NTk3NjliM2Y1OTBmYWM5Ig0KPiA+ICtTUkNSRVZfZ2xpYmMgPz0gImM4
NDAxOGEwNWFlYzgwZjVlZTZmNjgyZGIwZGExMTMwYjAxOTZhZWYiDQo+ID4gIFNSQ1JFVl9sb2Nh
bGVkZWYgPz0gIjc5NGRhNjk3ODhjYmY5YmY1N2I1OWE4NTJmOWYxMTMwNzY2M2ZhODciDQo+ID4N
Cj4gPiAgR0xJQkNfR0lUX1VSSSA/PSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L2dsaWJjLmdp
dCINCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zNS5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzUuYmINCj4gPiBpbmRleCBiNGJh
ZDViN2FjLi4yNzE1MjBmNzZiIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWJjL2dsaWJjXzIuMzUuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGli
Y18yLjM1LmJiDQo+ID4gQEAgLTE3LDcgKzE3LDcgQEAgQ1ZFX0NIRUNLX0lHTk9SRSArPSAiQ1ZF
LTIwMTktMTAxMDAyMiBDVkUtMjAxOS0xMDEwMDIzIENWRS0yMDE5LTEwMTAwMjQiDQo+ID4gIENW
RV9DSEVDS19JR05PUkUgKz0gIkNWRS0yMDE5LTEwMTAwMjUiDQo+ID4NCj4gPiAgIyBUbyBhdm9p
ZCB0aGVzZSBpbiBjdmUtY2hlY2sgcmVwb3J0cyBzaW5jZSB0aGUgcmVjaXBlIHZlcnNpb24gZGlk
IG5vdCBjaGFuZ2UNCj4gPiAtQ1ZFX0NIRUNLX0lHTk9SRSArPSAiQ1ZFLTIwMjMtNDgxMyBDVkUt
MjAyMy00ODA2IENWRS0yMDIzLTUxNTYiDQo+ID4gK0NWRV9DSEVDS19JR05PUkUgKz0gIkNWRS0y
MDIzLTQ4MTMgQ1ZFLTIwMjMtNDgwNiBDVkUtMjAyMy00OTExIENWRS0yMDIzLTUxNTYiDQo+ID4N
Cj4gPiAgREVQRU5EUyArPSAiZ3BlcmYtbmF0aXZlIGJpc29uLW5hdGl2ZSINCj4gPg0KPiA+IC0t
DQo+ID4gMi4zMC4yDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4g
Vmlldy9SZXBseSBPbmxpbmUgKCMxODg3ODQpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4ODc4NA0KPiA+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMTgwNTY3Ni8zNjE2Nzc5DQo+
ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3ZpbmNlbnQucHJpbmNlLmZyQGdtYWlsLmNvbV0NCj4g
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

