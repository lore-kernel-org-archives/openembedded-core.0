Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228C9C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 00:40:11 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web10.29.1686012003301804824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 17:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=FsXcHt18;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1686012003; x=1717548003;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sT4NZls7APMR45f805/aSaFmVuPDaGxqYhPy4KckXAA=;
  b=FsXcHt18ObatwuMXBMvASXHokkdPlu0H1j62FANrUF/50bjcWEHw9wNu
   SdVmgLOFgd/P8nKkA4Rz5ZDL2wNj0R1EQfEtAJtyPxfAhjrA52ukkr1Ej
   UA/hoij930H4A+5Kt5B2RpDZb3XAnT3R7/BY7F9WJ+q8N3fIGFJaQQ53M
   ItjOwWXObDZL0FxU5/+ihU5WBoQGjezWGKBZP55s7c5YFlot6/M/Z2/KW
   TpmK0OhFqCK9LlesjjB7NJuchqko3Vmwle2t9SWuEaJxqEW8B8r9zCll4
   zkQgem3hOrHDmttjyoeLUgH455QZTl6K+bFxT8iH/E0+OSENVOlFbPuCK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="86398869"
X-IronPort-AV: E=Sophos;i="6.00,218,1681138800"; 
   d="scan'208";a="86398869"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 09:40:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX/czz23QKhEq5+huEhbZ4NB1pBgqX9p7mOGts/EMfNwIrqnDzjWzqFBsS5qcEWUkH3wc5nbnTwZAs10TEML+UIZOIdb8t0xB3ktUavhiXmu0A8QjDohAX7K47mGIZVkqKAQDT3vubzcleLDHfL87tSPphjINxncm1k/1uh7luNouf+GL17f4fZS3O0CcTR4DWdkNW8jQq2S9FOlj1SXUuuVjAp1OFoqOdoG/ahPCE1Ve23GJ/I/b/1kUMGSQVufmVcR+5YAMSKG44OAg36m80uSFCX8q5hBv0T3Xgj5TdhIkbB4IPWs81AuNhQTTOwWtJXpy3ItjfiN4fcmS77A3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT4NZls7APMR45f805/aSaFmVuPDaGxqYhPy4KckXAA=;
 b=gvxzHAjVbCBgCECscbw5sSkHoDr8+lHs5byk2g0d+i4Q0Ch1tY9Iz5gjgRwi477nbQEyVIwjrknfIvzXPzRIxkU9owu5Q96l2vHiTeanv8EBpnljkpffze4qMAKOT6dmgvMaXaV3F8sOmS+VW5nfRJQ5z6QmzQp2cS0RbQ0+LAKMLjUroyeM/DtcjJHWBGsx+tTbgCvz/3gqChYMycaCCAQsrd06T9ZoEu/QxuDs+8jN2ZyBjpQ0INhkhjnMZI8v8vvJT4OuPDlJ1Gi+itREyE28LvD2bPRVWW88VpM7ucZBCkzbNAuKWntPMVpeirJlNzUdiX5IHEjDVoumWeJbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYCPR01MB11462.jpnprd01.prod.outlook.com (2603:1096:400:38a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 00:39:58 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::f53:b8cf:2bf5:39ad]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::f53:b8cf:2bf5:39ad%7]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 00:39:58 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Is aarch64_be under maintenance?
Thread-Topic: [OE-core] Is aarch64_be under maintenance?
Thread-Index: AdmUVJ7Lf/hFeIQFSMaBIHGjw7h/EgDXZOiAABc3FOA=
Date: Tue, 6 Jun 2023 00:39:58 +0000
Message-ID: 
 <OS0PR01MB61785003207D3B35914FD1A2A052A@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
 <5A43659C-3176-43F3-914F-6119098DA120@arm.com>
In-Reply-To: <5A43659C-3176-43F3-914F-6119098DA120@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YjlhZDhiNzctODhlMy00MmUzLTk4ZjItZmJjM2RjMDAz?=
 =?utf-8?B?NDM4O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNi0wNlQwMDozNzoyMlo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYCPR01MB11462:EE_
x-ms-office365-filtering-correlation-id: 48586d5a-f503-4ae4-802e-08db66268e15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5N83jFx3tfSFVftKqj00CNpCEfmtCKWtyhqPH1DFy0j8L6rewvUtwA97gi9fUPx5eyRXeXUi5xHp9iBgwUAiB5TvnrGJKqyyNlVQnn9Ugg292FQNGV/x7mVOvbsSIb33WJTVVpmjR3Vmrp+ot4GliNH/aqkpsemgqygvu0f/PTVjwzkyriIMfRYJxl/EEZyffwEgn9diMspxwVc8Ah6e0OFQVi9+J6HFKI2UWUqU4ooNY4wIp5TY+HOoEkmGB2MiytVEPlFwKNJrqjJvjuVZPkBMVAdbqP9YxfzTMI4jqLcZuNM5PwoI3sasm9sYheXDIJHC+LcMSPT0DnCiJdmDmDIY7FUDrEjMg+qM13ymLmwGRcH/4ZruWssrDjcCGv24U5Z+uZ4OxRgl9VNBw4reMGjBErgyt45L48i9dX0/6WCLqOXWJqxKvJv1XvV3TYWr9i5PVRdcMGIUZmHcUhBaveKvPP1kuSiJVRR03+4giryFenRqtF4yHb13GYz1HfX82FxPqiWt8j3G5RH1DIelFUBBucEwqOuRuCnbAsOWVdfN0jbQv+vxaAeqGWfOJQOcAMex6+mAP2YxY/GS2lyecYuoDvSt1I66Wg/1N0pVNMYy/o5mZAibeJ4cVa45tplfc1qRofh6FlPIojOyFvv/vw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(1590799018)(83380400001)(478600001)(33656002)(55016003)(8936002)(8676002)(38070700005)(41300700001)(316002)(64756008)(66946007)(66476007)(52536014)(66446008)(76116006)(66556008)(6916009)(5660300002)(38100700002)(122000001)(4326008)(86362001)(82960400001)(4744005)(2906002)(71200400001)(85182001)(7696005)(26005)(186003)(9686003)(6506007)(1580799015)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y3hDYnhqNk9vK3dVSUM0c3p4cHVab1lyVVIzcmxwSGJ2MjBzSnBoUWFPS2pF?=
 =?utf-8?B?dkNnOGNqeVJhdjRTbVVuZ2JZL2NNaEZGZEROUEN6eUJZaTlmWm5lRUdsWDI3?=
 =?utf-8?B?WUJBVXdNbmxLL2Y4bmlTclVaSEwzSE1vTXR6YW43WVZwNkJhSmttenMxNUdi?=
 =?utf-8?B?WERjQW9yL2dwQ0FkZ3pxSmRvaWU3SERvU0JWYTNGUUFsU0RkVHdRM3YzZG9m?=
 =?utf-8?B?RmMwTjJhL0xYY3ZWakR6WmJ6S3NWTkMvN2ZqNkxlNEx5a2NCeTdmbkIyMjBZ?=
 =?utf-8?B?SWgrRmdRWmc3K3YzV2FEVDZTZmdyZ1p6c2g5MEVrMWZTeWtXTEQ4c1lSY0dq?=
 =?utf-8?B?NkFxOUxIOU45VGFkRVhnTUh4QjBOY20zQnRqM2hMbzNGU3BuU0VxZGpqVW42?=
 =?utf-8?B?OHdUTWZHc056dlQxVU1EQXRQQXN0a2Y2MWdjRWtnbllCclgwbWpXWklTUmtz?=
 =?utf-8?B?ZURjT1NoWHNhUXhPajhyWjlqL3VVNnd5RzRQMVg4L2xwOGRZME91RGhoMGg2?=
 =?utf-8?B?THZpeDlvdWNNdmdXNEFUUUYxb0pTQkM3ODZwVitPZGJKM1dNcXJ5OVpHZ0tu?=
 =?utf-8?B?eGxONFJNbVlQc0JzR2hXNTIxK1dWbklSL3NQNGphOWY3TlBrY0V2OEpjSE12?=
 =?utf-8?B?aFZGamQ5ak9maDJWam9NcUhxN1ZnZHpkaHdTdyt6ZDJnOGJmeVBpRnF3RzJq?=
 =?utf-8?B?cW82U3JRa3IvOEVkYlZjVTlMOTQ5UVp6RmwvTHdHeGZ0ejFLRVJWVWVvWVIv?=
 =?utf-8?B?SEdOWFA4dGxjK3RZanRPUCtMUmxqL3VIZlAwdStHQjhBMkwwd3NGb1Q1KytN?=
 =?utf-8?B?MHZ6RFBnaVdmRUxJTU8vTTlUSy9DZlhmQU5XcTltVnI5WkJ6Q0FVVmdRUUFv?=
 =?utf-8?B?cmlwTkV4V2xUd29PN2wzWWxwcUJick13aWVQdERGUjlvSDB1MnpsYXYrUkpL?=
 =?utf-8?B?TE8vWHQzYWVGSGo4NmNaenFkcFlLNlExempkZ1NYeVpEODBZM0ZRQUovdW8r?=
 =?utf-8?B?ZitacjRqVjdDS0s2UWZ1UGNBTFRyR1dVOUhSMDFuVURtS09Wa3hsMU1DZ04x?=
 =?utf-8?B?TUtsWnpGRDdjaDVCc1Z3TEF6Q2swWFByL1VacXhsMExvWkVBRjVRRUIzRkts?=
 =?utf-8?B?bldzZ1IwNGZVY3VNL3U2V2FzRlFKSVZ6N3lmWVpGZjA3VEFURXEvU0ZvNm9a?=
 =?utf-8?B?R0lFOEhMNDRPZ1FYK3ZZNDl6SjFHRGNGbTU1MzlYNERtMmwxSTZOcm5BSEg5?=
 =?utf-8?B?Q1FMVndYNGtVeUx3RmhJK1dPWk12bDgrMndMMXF2aGY3ekRlVEZMdzVuektZ?=
 =?utf-8?B?ZkNLMVlaWDE5TnJkbjZOZnptSDB4Z29vc2lvS043MTFyM2drL0VFRmZKNDl2?=
 =?utf-8?B?dVJWeFY5eUZZNU1ZVWk2ZG0zcnBObDlDSkJQSGN4SkRNTmJEekc3Znh6REYv?=
 =?utf-8?B?SUJsMW1qM1pnWDBrbGxSOG1tVkZ1RTBzU0pndmYxTlVMd1ZTNzIybXpPNlZM?=
 =?utf-8?B?SExGN0Vjd2VaaEl0T0x6QlM4aFpYTnVhdkljNytYSTFVcHQwK3crWS96YkpF?=
 =?utf-8?B?VnNHWGlJTnMzYURVMmJsdTFBL0JhamdtYzFUakdmRVZveWdTbTViT3B2aStI?=
 =?utf-8?B?QnRPYVlRRlphejN4YjBFeUlvcnFCcmJESm5mdms0T1VWOXlVM29LOVhPSlBi?=
 =?utf-8?B?RysxUFh2MG9rVWhuSlNRZ1hBWU0yUHE5dmtqOXN2R3Z4SUg3Yk14OTdmbmxn?=
 =?utf-8?B?VHF4c0ZkYjhyQ3VPQjZTN3U0c2Zhd3dnY0ZjS3dpSERCTUlWaUllNFRRWTRY?=
 =?utf-8?B?WEo1QSsyV2FadXRpM0hrVnBudW9raXhKMFcxWk9iaXBzQTlIZ3BueElwMis2?=
 =?utf-8?B?Vk5kUXdqcG5EZmp6TGpLNVR1M0hOVmR5Ymh2QkcwRkxVMEIyaGFPdG41cVV3?=
 =?utf-8?B?RGlyZFZ5VmJTbitsS2FmWW1rM3NoQjdsVmJLdlVYWDRoSHVWRzNRVXBOYnpq?=
 =?utf-8?B?RjVMdkN5N3FURHhjR21zYnEvQ3J5Qi9vQnpONDYxZlg2ZCtlM2lRY2t4T3R2?=
 =?utf-8?B?dUl1STFnVmRnU1F4VkRZbDVtRnIrK2JnL3BOanRsNGlTU05KcnU2WVNIOWh2?=
 =?utf-8?Q?wyshT2CRsaseBdkNu1RY8jK2l?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	E4N8pwbHTmVUHeL6IXJmXxs12yMhIlYQHsnd1F9dToS/2HM2E6CIKPMARlqb4R8NXtRMg2jeZUOb8cjfXCs0QYulHs3gQCmjphqCsZoL1orG64dt6fc4Tay3qWoZ90rhA60Y2kdlEde1sPX54p0maBv0UN5fHDGwlboSFOR8rbWoM6ZY0Ne3BQhRZZX5TkVDyvRdf6Whu3ADTUfQxQm+pnMvUF9RYJyQ4IRQ1F9uXIE+l519wpVqVap6QhmVrx4/9h79qiRzCP5boL3mlmGhHgR5PnzGU2vw7/3dqUULXNfCRRLCKeAseJjTKn2rLfqssTB/htWR0TyFMEYZUeEiVV+bf6Bf9MlRn2rjRsvD5c8s0klzQzNFtoXMF2ZY3PPn0u3YfYPvUgy+yI5waQzD0j2gg2PRuyuYsu/3fCMe7RgfTUhwBAPWpIY+d70nAVyk1UoDc+Dm5Wjzgxt8ARmYYZuN2SX0CRgGhmsPVwu/pePp+lEPbKi4/2/cHlRMb4Hlbk6vIbJl241Ovd9A1UDXGFSYjwJT/L5J68qIVU45/OaWCWa65fPumd2Du6k0XxNCtAg7i1HP1ChjhXyl7xOYu8hmZUXwhRUGCzUPSG2BGqCOySbYUno8q3rAOj5D01h3r5sY0r+sVX3O0Dm/32FC/5lN2AYH10+js83EC+6IBhCeNuKEnIJ+b3Ykz2SScmJH2eZQMmKeDFdKDFvD3F0XqPFJtFfmezOehAUmml3Y9mB4oa9JB5NEG7aCxC8Y8JQPMCFnkiMvbgD37jK5bpGb3UMwuTVe2vVZUeWqtJYh6ISIbnLbmh8xiOqA24JIYz7b
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48586d5a-f503-4ae4-802e-08db66268e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 00:39:58.1173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eQRRILpfWiMPp1Iwbl0v2aRKCAiJUDGp0v0BzOE7u1glkZKFMlz0RFNVwdWp0evw6hyrm7yBoCNLOb/0vr0PmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 00:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182403

SGksIFJvc3MNCg0KPiBJZiB5b3UgX3JlYWxseV8gd2FudCBhIGJpZyBlbmRpYW4gYWFyY2g2NCBz
eXN0ZW0gdGhlbiBpbnN0ZWFkIG9mIGZpeGluZyBxZW11IHlvdQ0KPiBjYW4gcmVtb3ZlIHRoZSBx
ZW11LXVzZXJtb2RlIE1BQ0hJTkVfRkVBVFVSRSwgYXMgaXTigJlzIGNsZWFybHkgYnJva2VuLg0K
DQpUaGFuayB5b3UhICBJIHdpbGwgdHJ5IHRoaXMgbWV0aG9kLg0KDQpCZXN0IHJlZ2FyZHMuDQpM
ZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8
Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDUsIDIwMjMgOTozMyBQ
TQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBJcyBhYXJjaDY0X2JlIHVuZGVyIG1haW50ZW5hbmNlPw0KPiANCj4gT24gMSBKdW4gMjAy
MywgYXQgMDc6NTgsIGxlaW1hb2h1aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8bGVp
bWFvaHVpPWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IEl0
IHNlZW1zIHRoYXQgcWVtdS1hYXJjaDY0X2JlIGRvZXNuJ3Qgd29yayB3ZWxsLg0KPiANCj4gUmln
aHQsIHFlbXXigJlzIGFhcmNoNjQtYmUgaXNu4oCZdCByZWFsbHkgdGVzdGVkIGJlY2F1c2UgYmln
LWVuZGlhbiBhYXJjaDY0IGlzDQo+IGJhc2ljYWxseSBub24tZXhpc3RlbnQuDQo+IA0KPiBJZiB5
b3UgX3JlYWxseV8gd2FudCBhIGJpZyBlbmRpYW4gYWFyY2g2NCBzeXN0ZW0gdGhlbiBpbnN0ZWFk
IG9mIGZpeGluZyBxZW11IHlvdQ0KPiBjYW4gcmVtb3ZlIHRoZSBxZW11LXVzZXJtb2RlIE1BQ0hJ
TkVfRkVBVFVSRSwgYXMgaXTigJlzIGNsZWFybHkgYnJva2VuLg0KPiANCj4gUm9zcw0K

