Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28F8CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 16:29:51 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.44])
 by mx.groups.io with SMTP id smtpd.web10.32741.1697732984910959938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 09:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=YZ+CqRxz;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.44, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwuBOPNTGe1HXmdBh2k+cIT8dUfetN5LcTevHK0azlwVmhfZkvvWlOsksaWA/WdKRwJwO1qltLFojKo+AW/FpnPZJbK3QsRv5GXldYdy+n/CGdA1qqK7cPbMvJ0inGi+jirzGzym6IKvPi3RVDC/iiLVmIbvfF328SIMaDbf6JJoZDMQu9dmRDa4HqiUs72vnqe6Fi7w0OWJvUu9f2BFHqz5MUD+ID1rOxr2g9gGUirmL0xctgEM19n/Gsvx+40emMiLM+YpE3tgjmbm3AzB2HRWYi+kfFU7E0D/WsMvRY1fYDrB/+D92Gk9kyHzcOCWGvPP5w1lmprsUcfTlbP6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZjUnAcJ3iTMb1rawF59pMefJgFYQMVm4D8zrJRkqjk=;
 b=H03kQ9P4WbKZn/VNs+ThVi0ESTth75sSE4Uw+oW9IA/KSoZb5wYKoV69b8d+96qd5vhVSDTjram6av7VmD5jsrAjD1/bCnyvZpRc0FWx5vCrAbtSezHPPhBUdyJM3cTiy2MYTLc7e8XrOiPPimDEveFarFziSghIm9LuNVX12s8mbLy3XfAA678wVno4ZM9FrSgkNpaTuUj5raclSGIIqV928CmtmtQJdqXj0edKgZkhSU836omRT1+xvZZkJl1wtfPJ5CQpAMN5r+gYzqgQQoXlPUV9cRAiJJqE2Owp9x9qiwBoHmvS+aLI4Ap0eIgUsRpFfXRebibJ4uLZfd84Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZjUnAcJ3iTMb1rawF59pMefJgFYQMVm4D8zrJRkqjk=;
 b=YZ+CqRxzhzXihBxM1VZRDP9II/lMibOwRjxZQS0XJWhFoTsqbm9PHV37YF/NLAWy2SDUNaq2e6zQubFdQ8a7YaM6jHZcIo++c8fMgp7qz3U/yNc7zBQk5cDd0gniIIOBuMrV4i8Kq7VDKWKmwRCp9dHxKpjamd0tA6PswAOqLZXp9KynSqlV/QK2J/OOrA5v471kQB8NduHRd+bPsvawqvnyQIYWjEi+BBPCLnINFi1HG8ZkQuS1IgGUJH4WdCJFy4KbO/MLeKxyHzdssoQM/tttw1i9YEcZ2LXMihjFAQL3TjpqlaX3lgejCZfY+p4aAvEkg4zfIvNkibgd1WhLew==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 16:29:41 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 16:29:41 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jon.richardson@generac.com"
	<jon.richardson@generac.com>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Topic: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Index: AQHZ/UpPSpqXsZ6kUUCDzfR30Ie+b7BP6tQAgAFs/OA=
Date: Thu, 19 Oct 2023 16:29:41 +0000
Message-ID: 
 <DM8PR12MB54309931DD63A1A348FC99B38BD4A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20231012202535.2902235-1-chris.laplante@agilent.com>
 <202310181841287c53633a@mail.local>
In-Reply-To: <202310181841287c53633a@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=f0b68719-1ca9-4c30-8598-aa7f93b6d431;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-19T16:27:48Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|PH7PR12MB6660:EE_
x-ms-office365-filtering-correlation-id: 73db8567-f556-4f9b-863d-08dbd0c098a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SVI/Pvc2S4AKPR0Bc/nm3dhswFl7a+UhH+TLf/wJeAWjeqHGKIkVfRZP66T5hXPrCmzpYWbsIfOlkCp82HQT8V45K4rFGQpO1rChrn0KPjAWsg1hO+5fATa9/NM461QdIRRPrIjyailChwdPLbfO61gQALaBxDHuD3OYUXSeG7cpPnWQzkzon3Ph6tDFGXg8IlwI+GIPfJjQooKbcd8n8p2WpjVwdZLYHAsbbx1as/kV6MQC05Jxqsm+8RWEOGkZdlcKhxUGmhKRnlz3A/LXyPhPIjESO0xr9/3lZBXsfZyUiQqRl33VAPTcT1AO0GsyAhfl4vxjm16Mj27xcyRgOJiV31f002qZ0osdoh4t3YPNElnm49u7zeDj00/gImQbgbPVxD1kgAK4FD7jJ4fr/P6AsCzPUZZWqxzjz1yly0Mm5hzr5CrmTTgdrva0MljD7ilmvy7dFGdnmVVLhE/4jVws3mEFrk62GMjVdxRObNwvmH4J+gGdbbZ8x3aqHGbGWBdBxTw/Jep1Cjn9WgTUBi/i2y8i7i50BBEjN9mCD4C74s+ubPsiTiR9O4jfnRQBAa+YxbN5GYwvwyLAy63Iydkp13xCLTjwmQ+ca2vTalLhEncYv/zr+5ZFrwpZeyeP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(122000001)(55016003)(38100700002)(478600001)(7696005)(4001150100001)(966005)(6506007)(76116006)(9686003)(45080400002)(41300700001)(6916009)(66946007)(64756008)(66446008)(66476007)(66556008)(54906003)(316002)(38070700009)(8936002)(5660300002)(8676002)(4326008)(2906002)(52536014)(83380400001)(71200400001)(26005)(40140700001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?anNsU2NMU0FiWEwzSHhuVWFvRUowWVJnSUtpU2dpd0ZzOFhKUEY5ZWdvYi9a?=
 =?utf-8?B?THRPSUNkVG81VGdHT2MvZWNpNnlwd2pWZ0tQZGwxbFkwdkttdlRQNlI3WjNZ?=
 =?utf-8?B?SXdVNjFsaUxEUjBXR1YxblI1eEluZXV6NXZxeWdGamFvdGVtTzYxSHB2VkI0?=
 =?utf-8?B?YjUvRlluRTdHTFpjbXpMR0xLTEs2Yk1Db044UTlFbHZyUHpHa3QzMi9Sa0tp?=
 =?utf-8?B?NWkzczYxOEE5TWswU2QzZW5JZDZnUytmeFhyZm9HUi84S3hQYXZUdXk2U3Mw?=
 =?utf-8?B?WjRJQlUxdGZzZEROTGRhN0g3bzZQWkl2dzJzMktUTkFxb3h6azZWWFpvTVV0?=
 =?utf-8?B?WkJpdnFpSXZFNUVaUGNxbStSMFl1L3BycHNxUW5aR2F3MitVczVsdytNZ0xi?=
 =?utf-8?B?allHN2R0ZGdEUC92dnlLTldaNUJuSlRJRTdyaW9zNHhsdFBMV1A1UGE0cmdP?=
 =?utf-8?B?clZGaHhQZllZbnJmcFJpbXQzYlpsbHBWUXlTZW1yTW5BdWRGaUp5VmRhNGox?=
 =?utf-8?B?U3VkNHNUYXhUZG11QVE2dmdTSm50OGhFVlNmcCt3TDg1REJRQTliWlcwbU9x?=
 =?utf-8?B?bDFGSGd0dElHOTBIekFCL1NNcG5UdDRaVVpXV1d5T0ZpUXdsOXpvTGVMcUh4?=
 =?utf-8?B?VEJiUzVPdGt2TEV5NzEzcU5jK0tEUStTYzdXRDRDc09oZnBMZ3pxWkY1OXJK?=
 =?utf-8?B?UkhHMVNJUEVrVnd1VWczTmtTRHN1eVVMOFh2NEtCQm13cTRPV2tYN1p3UG5r?=
 =?utf-8?B?a056RGhxRmNHa2VNLzNWK21QZmpWZzV4REtnLzN5dElZd3Y2eUhSYnBueU9M?=
 =?utf-8?B?Kzh2cEV1MmxRNnNhUVNLRW9iSm1Da0dhRzZjY0ZNeGU0NXpicDZKOUdyTURn?=
 =?utf-8?B?dXdjQ2h6NzFaZEpFM3NiNXJZaExxZ1k5QWJ4eEVOUWFiOHBhVUEwb3BRMzdx?=
 =?utf-8?B?UHFzL0w2QmdJYmhoTGU3UFkweVZTcGZLNldwejkxYllCbWNoMTFZaVN5TS9U?=
 =?utf-8?B?QzNxQTdWME92dmJUU1FlR2tDSkNRTSt2Ri9uMlZTYzdBS2pRTGdNMytNa3RT?=
 =?utf-8?B?M1kvOVVvRXJjSDBzZjlFZzIvYmtmUFBZSHpadWgxekZxaGQrKzJvYVpwYWFW?=
 =?utf-8?B?c0F0RXM0NHJuT2YyNGtCRzRsZTdoY00yVzhqSjFEaWd0Ky9rT2NRbkF1c2Rj?=
 =?utf-8?B?ZGRkeWRNOStKaUI0RHdnL2d4Mnk4amRRWmpPdzdIbHN0dmVlU3VPVnRzMWRG?=
 =?utf-8?B?bzZtSWY1emxyWWE0Szh6NmRmRS9qS0ZTNVNGZ0NKZlowNjZsRGtnZHFENTRx?=
 =?utf-8?B?R21kYmloQmF5a3h4NDcyRjVIQm03LzVHaFdub2dvU0N5VXMzU0NqQ3RIZmFl?=
 =?utf-8?B?Ylp1N0FxSUF2S3VnSnBsT01SdjNIanV2ZVUrbW1WaWtzcjQveTJET1VIaUFT?=
 =?utf-8?B?UFNXd1lmSVJHVTkzYlRBZ1E0ay9sV0tpdTY5OUJXMHQvMi9iQTBBNzJ5cmJB?=
 =?utf-8?B?WFhNVCtaZUhST0Z2WGZtVzlKSE45TlpNMFZoTE5VSDRaTEwxem00UWNQdVY4?=
 =?utf-8?B?N2FOTFNBWEoxcHhsdEorcG8xVVJuTW5COWE4aU5UMy9qNXFmVVJYYmZXZ1Y3?=
 =?utf-8?B?NzFxZXdqc3FXb0xlWCtSMGZHZktjWEJXZEVtV0NYb1pHWTFpSFV4VUppc05M?=
 =?utf-8?B?emt2c2VXdGQ5UWNuR296WXc5TncrN0NQL2hoallpcjE0b2hOTTNJZGpoRGRK?=
 =?utf-8?B?Y0N5Y3Y4N3RoSGdlazZZYk05R3FQYUgxVS9ob0pla1VCbDRPY2lVNUtwN0Vt?=
 =?utf-8?B?SGRPY2IyTjJkVXArNlRPRHIzRUNYNlpLbDlTM3VBWTYya1dBbmxwUUF2cXNl?=
 =?utf-8?B?U0ZVeE9Na1FMRGR4VjZoM3o2a3FEaS9UNGdESUUxc1B1ZzgvdU0wNmsxR0dr?=
 =?utf-8?B?RkVvOE5xQ2xEQXdsTEJySDlKbUlSRG9DMEkycFN2MHFVSWw4bkZFM0pYdkdr?=
 =?utf-8?B?RzFBZmFHMWxQamFHTk1XVTJzT1ZVL29ieW5aY2JhUjZwVlI2NmcvMEk2M2cv?=
 =?utf-8?B?KzBucFc3RG52UVZyanlNdEhVcUVYL2FiN3duWkxySEw1UndZK3Y5TFU3S013?=
 =?utf-8?Q?qf7SKhPVrb2f1zmB53dDEhvic?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73db8567-f556-4f9b-863d-08dbd0c098a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 16:29:41.5947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suyFsqLxB7+ieUxcHw6wRuYh6bNMSTojf17AMHRiuUqkOpJJJA3JT9xCGfvS4KVCf/2kiCaqxVaE46jn3s7veTRjLqkKg4oHIjBL7x+OvFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 16:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189475

SGkgQWxleGFuZHJlLA0KDQo+IFRoZSBzZXJpZXMgY2F1c2VzOg0KPiANCj4gMjAyMy0xMC0xNyAy
MzowNzoxNSw1MDkgLSBvZS1zZWxmdGVzdCAtIElORk8gLQ0KPiBkZXZ0b29sLkRldnRvb2xVcGdy
YWRlVGVzdHMudGVzdF9kZXZ0b29sX21vZGlmeV9rZXJuZWxfb3ZlcnJpZGVzDQo+IChzdWJ1bml0
LlJlbW90ZWRUZXN0Q2FzZSkNCj4gMjAyMy0xMC0xNyAyMzowNzoxNSw2NzUgLSBvZS1zZWxmdGVz
dCAtIElORk8gLSAgLi4uIEZBSUwNCj4gU3RkZXJyOg0KPiAyMDIzLTEwLTE3IDIyOjI4OjM1LDc3
MyAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIEFkZGluZzogImluY2x1ZGUgc2VsZnRlc3QuaW5jIiBp
bg0KPiAvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL29lLXNlbGZ0ZXN0LWNlbnRvcy9idWls
ZC9idWlsZC1zdC0NCj4gMjY2NzU0Ni9jb25mL2xvY2FsLmNvbmYNCj4gMjAyMy0xMC0xNyAyMjoy
ODozNSw3NzMgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBBZGRpbmc6ICJpbmNsdWRlIGJibGF5ZXJz
LmluYyIgaW4NCj4gYmJsYXllcnMuY29uZg0KPiAyMDIzLTEwLTE3IDIzOjA3OjE1LDY4MCAtIG9l
LXNlbGZ0ZXN0IC0gSU5GTyAtIDc6IDEwLzMyIDExNi81NDQgKDEwMDguNTJzKSAoMA0KPiBmYWls
ZWQpIChkZXZ0b29sLkRldnRvb2xVcGdyYWRlVGVzdHMudGVzdF9kZXZ0b29sX21vZGlmeV9rZXJu
ZWxfb3ZlcnJpZGVzKQ0KPiAyMDIzLTEwLTE3IDIzOjA3OjE1LDY4MSAtIG9lLXNlbGZ0ZXN0IC0g
SU5GTyAtDQo+IHRlc3R0b29scy50ZXN0cmVzdWx0LnJlYWwuX1N0cmluZ0V4Y2VwdGlvbjogVHJh
Y2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KPiAgIEZpbGUgIi9ob21lL3Bva3lidWls
ZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtDQo+IGNlbnRvcy9idWlsZC9tZXRhL2xpYi9vZXFh
L3NlbGZ0ZXN0L2Nhc2VzL2RldnRvb2wucHkiLCBsaW5lIDIyMzYsIGluDQo+IHRlc3RfZGV2dG9v
bF9tb2RpZnlfa2VybmVsX292ZXJyaWRlcw0KPiAgICAgc2VsZi5hc3NlcnRTZXRFcXVhbChzZXQo
dGFncyksIHsiZGV2dG9vbC1iYXNlIiwgImRldnRvb2wtcGF0Y2hlZCJ9KQ0KPiAgIEZpbGUgIi91
c3IvbGliNjQvcHl0aG9uMy45L3VuaXR0ZXN0L2Nhc2UucHkiLCBsaW5lIDEwOTcsIGluIGFzc2Vy
dFNldEVxdWFsDQo+ICAgICBzZWxmLmZhaWwoc2VsZi5fZm9ybWF0TWVzc2FnZShtc2csIHN0YW5k
YXJkTXNnKSkNCj4gICBGaWxlICIvdXNyL2xpYjY0L3B5dGhvbjMuOS91bml0dGVzdC9jYXNlLnB5
IiwgbGluZSA2NzYsIGluIGZhaWwNCj4gICAgIHJhaXNlIHNlbGYuZmFpbHVyZUV4Y2VwdGlvbiht
c2cpDQo+IEFzc2VydGlvbkVycm9yOiBJdGVtcyBpbiB0aGUgc2Vjb25kIHNldCBidXQgbm90IHRo
ZSBmaXJzdDoNCj4gJ2RldnRvb2wtYmFzZScNCj4gDQo+IGh0dHBzOi8vbmFtMTIuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmF1dG9idQ0KPiBpbGRl
ci55b2N0b3Byb2plY3Qub3JnJTJGdHlwaG9vbiUyRiUyMyUyRmJ1aWxkZXJzJTJGNzklMkZidWls
ZHMlMkY1OTINCj4gNyUyRnN0ZXBzJTJGMTQlMkZsb2dzJTJGc3RkaW8mZGF0YT0wNSU3QzAxJTdD
Y2hyaXMubGFwbGFudGUlNDBhZ2lsZW4NCj4gdC5jb20lN0NlNjlhNjAyOWY4Yzg0MjhmMTQwMjA4
ZGJkMDA5ZDgxMSU3Q2E5YzBiYzA5OGI0NjQyMDY5MzUxMmINCj4gYTEyZmI0YTVjMCU3QzAlN0Mw
JTdDNjM4MzMyNTEyOTM3MTQxMzYxJTdDVW5rbm93biU3Q1RXRnBiR1pzYg0KPiAzZDhleUpXSWpv
aU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAl
DQo+IDNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1wdEhjUmYzUDglMkZnNkclMkJnQTJaWFI2U1NW
dUtKY1pHT1INCj4gVXdVemJZb0o3MEUlM0QmcmVzZXJ2ZWQ9MA0KDQoNCkknbSB1bmFibGUgdG8g
cmVwcm9kdWNlIHRoaXMgZmFpbHVyZSBsb2NhbGx5LiBJcyB0aGVyZSBhbnkgd2F5IHRvIGdyYWIg
dGhlIHRlbXAgZGlyZWN0b3JpZXMgb3Igb3RoZXJ3aXNlIGFjY2VzcyB0aGUgZmlsZXN5c3RlbSBv
biB0aGUgQXV0b2J1aWxkZXIgdG8gc2VlIHdoYXQncyBnb2luZyBvbj8gSSBzdXNwZWN0IHRoZSBh
bnN3ZXIgaXMgJ25vJywgYnV0IGp1c3QgdGhvdWdodCBJJ2QgYXNrLg0KDQpUaGFua3MsDQpDaHJp
cyANCg==

