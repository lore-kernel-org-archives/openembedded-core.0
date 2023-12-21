Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC23C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 16:05:30 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.59])
 by mx.groups.io with SMTP id smtpd.web11.54167.1703174726240556822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 08:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=B/qvhUse;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB+CRMrrS+og2SBhSuU2zSD2EPu+jbcVQH5dzGzAMHfF16JDCG7RWn+nedAa406tz0PXL5dlO9yKQHoR9jgKeovuHcn+Xhu36sXy8qQVlxFw+6JgxhpNN6YGb0YeuhZJ4uBprzVZ/Vo0e4Bfp/fcL0szBNvFavwSFnkaBE1ufua0NSef6o6+C7kE1wavwAxuhgfXplIr/KYkE+yxmR0GH/y3bFCEIDArenll+dfO5A3m8BgNG/c6ocsJPjARTkOoZYMeZUpNJkJBII5ksxP748MynCVO3qDZFvOvG5/5NGpK7M/YpIP24KKLaVOggPF8ZJOBalAjPfiHmRKoMbC+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/ozFnHjni9qPQaHbJc54gBT64qJ/nWsL/k4zWnk2nQ=;
 b=Rx5ypgPlYEERWg1qZIw3dtYsT6NQjHnbpSAFdFNzlyL3W7L2pf1YfzHwSHr9qe2CgqJDlna65uTECHf7c9Rj/v0SCUHN27P1tGXm6ZOKbAxOKM4tWYe7cL4yI5XNZr+LDgqK7iod0eP+RtgEWlUsyKYqvs9Wg8hFPXZ4HFchCmY3nmSEs8H+F7N8sIZ5dnrhAco8wUYIPYdnWH2lj4IbGBX6lFrLZ7CBBUBIZToIE3pUh50ySpW5H9swRYU21UmSb4Nu6VtRKGqsPqkFjHAYooWgbeMRoUc4Nymcxpu95NZdRua6bwC94CQwwOkqaF0tOKFNGjeNVdPdT+LxjS6o7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/ozFnHjni9qPQaHbJc54gBT64qJ/nWsL/k4zWnk2nQ=;
 b=B/qvhUse5WRldQDvwL9YzuqS2X4iotN6XFLvLf65kKnhcRyU8uZsiWdhxvdEb+Peku6CcJCt3Wl2ecEP1YwQKm1Z4da8h2rplTPgwXH5dKtwXod7bhT83Ts/04b9DTGadpUpmtAbEpa7isVZ7sAoYMiUL6+tIDIcMbIe+iQshbzkiOqpBfjCX/nNZpouaQveV31zuVWvSOI+DD3LpZRduY5ffgo5hJRithqzHpSD6NVNVfNouv4+Ke48rUZUA3IRi6ixgBkVoBpg3c1FcQ+6lrtV1V/SZ6tSPvug6gc9sCiwUBWkfiai86RuhGulMxx7FP/CAF9/DMygXhlhfetJKQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.21; Thu, 21 Dec 2023 16:05:20 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::1960:79e2:3161:e4fd]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::1960:79e2:3161:e4fd%4]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 16:05:20 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] weston/wayland: OpenGL vs GLES2
Thread-Topic: [OE-core] weston/wayland: OpenGL vs GLES2
Thread-Index: AdozZP5WMHobe4W9QDSDtyodXZD1XAAET1EAACxFi6A=
Date: Thu, 21 Dec 2023 16:05:20 +0000
Message-ID: 
 <DM8PR12MB54309DC335A6C453A18A21BD8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB5430E9851E7C72F05623C0148B96A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CAMKF1srPC5Gch2s46kx8py6U=DJaYRro5eC4xPJWTT_2TE2pbw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srPC5Gch2s46kx8py6U=DJaYRro5eC4xPJWTT_2TE2pbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=209ab5ec-8d1a-4f77-8abf-d078c385f039;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-12-21T16:04:04Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SA0PR12MB4383:EE_
x-ms-office365-filtering-correlation-id: 16b78591-8143-40f0-882a-08dc023ea18b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iZaJegGR15QOKSZGXHXyrVUTG0gOYQTaTVwLhuK2v5YMcMv/q7YOR4S8sXQgemgythaxYeex9s9kWlPqHZl55ojgHRbkzBua65ndap/5pCpA6jKeRO08CEwCyTmu3mZ3UvbjnlZvfunpFhp7rD66zbfnSpWpQ4xLbG9d9oZ/K4Kfy9ASt02oF3YmqsvJcK/3S3VKckrmqFfYvKIbDMI5PZIZ7ALEAGqUXdVf5LP9w+g+2sf8Z1Z/NOu6o930DuOsfXQVWuYi1uFvOmcGCAys1WqtbjzwsMYnsr7mydYGp+dFTDkg2S/gHPKLoy15/jwmGwOS6hwBcfSCgbusjsdwmGNwZneKnqIei9yYuboC7JGz8vS+IXpy5bLLUgXZCizhQnub9WXfmzXyF7400SF81J1uhgECdRHmG7Vhyn3ENGRkMwhjBStLEAa30BWTq+W+owgf5SMMVrU2zvbmdoqMiV7DfXLneWNTCu8CGb65u+RRBXvVnT6zQJKRyjagVVCZbLF7MJn6RYjaWwgYS1cnHAdAMkzXskAC1jaNxkz3iBZ2g2u6+Pv6lu12q5ZdZ5Fdp89Ilx07IS06U9VzpePSci4x1N3L9KpK4rK2DXcE6RD18O7o/AHXW+VI9yFlZVNz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(4744005)(2906002)(86362001)(122000001)(41300700001)(38100700002)(66946007)(66556008)(76116006)(33656002)(64756008)(66446008)(66476007)(54906003)(6916009)(26005)(71200400001)(316002)(9686003)(6506007)(7696005)(55016003)(478600001)(52536014)(8936002)(38070700009)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QUhOSHlNZXZkRjFLUmJ5RTdza0hlSDZwRWhmZmV3WnlJVUVYL2hxd3cxQkh1?=
 =?utf-8?B?UFNVQ2NoUmYxL3pDdklaS3pOVHNvVnBjNGdLTUFTYU9LbVd3ejZGWXlJTFgv?=
 =?utf-8?B?dFM1Ymc4REFHNGNESlJyemw3akJJTHF5Z1B0QVN3dFNPU3hpUVVNSGVRR0hp?=
 =?utf-8?B?YTBnTWF4RER1T3l6Z25SV1JkSUo2d0Z6Y1ppOEt1QVJxS1Z3YlVzeHYzY1FI?=
 =?utf-8?B?S2lWKzliemVRRldHRjVTVTBucElDYTlJOG5DN21MK3h6aU93OG5RY3QvbFYx?=
 =?utf-8?B?cDJpMGl3V2N2a2tSZkZSL1psMnZMTlB5SDMwdVBUMG92eHpNa2xpbGtNWHpB?=
 =?utf-8?B?YVBxd1lRWDN4R1h1djlubkF1a2UyZzg4aGRyclU1RUtnczNaK2ZISGV4OGtF?=
 =?utf-8?B?WFNJZ2ZRWndUY0pLeEc3NHFyZVdmb0d3bm5UMVJ5ei84R1pqQVVvNjU0MlNp?=
 =?utf-8?B?Ync5SlFnbUFZNXI5eEVoVUxjb2tNczYrMUtkNTVBaVhaanc0aDh2WDZFQklN?=
 =?utf-8?B?TzB2KzFLTS82SitjdjNPVEJscy9Yd1RJVGhyeEZGTmM3RU1WL1htL2lNWGEz?=
 =?utf-8?B?a3hDZ2JhTEc2T1lNTjByUFE3Qjd4SVRsMGpwYTVJamZwdXNTcGhrQm40b3lB?=
 =?utf-8?B?Ri8wQkpOdzkwUmJNRHdwNUFwWkN1Y1o3Zk9vVStDdTBKOWhxQmVJUFpXQUlE?=
 =?utf-8?B?RlBkWk84NW8wZHpBZDNiNXFPVHRvUDk1dGtMaUdqNUFhTmxaZDhVTEtOWU9F?=
 =?utf-8?B?b1R3R3A0RndKSUdUU1JDOTBPU1BHVWlSMHJyVm54QVlJdUxScG9zb1J4K2g5?=
 =?utf-8?B?WUtacERpUHpzN3FHcWR6OE1pZ1VsTHp5cjhNeUVIZ01hMFR3QjBqY3JLRHF5?=
 =?utf-8?B?aDAwMXcvMVU1WHUrcGdGQkxsR3YwaXRxS0J0L2FLdzRWMjRkd0htekkySUlQ?=
 =?utf-8?B?dTI2eG96ZnlSeDRzUVUzZ0FtOGwySVdFQlJETFhOd0xRMFkwODhhMnBwSmxN?=
 =?utf-8?B?bmdKYVZINUd5NVBtREI5VWVsZlVLQWxpSnBwZFhSZ2k2MkRTVDlRK25iZWo1?=
 =?utf-8?B?UFB6cjNjOEpYdjg1dUVtV3dFNlhWUnRUb3JmWk9qUGx2VVUzRWNqVXcrVGZq?=
 =?utf-8?B?Q1RmRXAwL0crZFJRWjRaUnpyMVdZOGd0Sk9JSisxaWFSZnFYVFhqL3Z4OGlU?=
 =?utf-8?B?OGh1dUNHaHNLK2tiN3hzTDNxRlVyVzJBVXhZZ1FJUVN2SFQydDA4cHBZNkdr?=
 =?utf-8?B?bmllbDZ5YzcyOThDMzRTenpLRzhpQmp2RkthQlVaTTlaUEsvOHZsQVQzVzFU?=
 =?utf-8?B?UnMvdGVHTGMyUnZESXNJZlNoQ1dHT1JqcEl6dzI3enUwQ014NkhFOVdrT0h0?=
 =?utf-8?B?bUEyOVdmYzhOejFNK2krYlFja1JBSm9NdVB3Nk96bFpSN3lNUXhUZXJiaTd2?=
 =?utf-8?B?eCtKL3pKWTQ4VE9zVTlVcFpid3RjRm5DNzZlSklVQWxVWkMrNHBPdzZCckx4?=
 =?utf-8?B?UnVFNEd6dzRoVzJxTnlERFN6MjBFdmM1SzkzUlRzemlZM1ZqaStsTnh2VVdW?=
 =?utf-8?B?RWdVeEVKYXQ5WG9ITG05TmRWZEpONHU4OGIxOTZiVmEzaGVqN0I3eGY1SGZQ?=
 =?utf-8?B?SnVEYmErUGdMc05ZeE9yOGVBVTQ1ZU03UE1icVp3a29hWXRqUnNRTkhXaUFY?=
 =?utf-8?B?OExJWVpUek04VFNqOUVSMDhkaE9SV3lLT1lOTUxiVU9PSmliR0NqeEFRaGJ4?=
 =?utf-8?B?VnVtRVEzM2hka1ZxUnJPK2NrNUJmMUp5UkdXRkR5ZjBBY0crTW9XTERnaVBm?=
 =?utf-8?B?Z0t6L3BTclRROVM3V2VYRnlDUFRjeFlrZUhhWWZzY1NZODlvRUhENTZpNVRx?=
 =?utf-8?B?ZUZPd3dSZU93Y1FYYUREa3JPaVkyY2EwenNDSThPWFhVdmwxaW9qcExJZnJZ?=
 =?utf-8?B?K2Y3WjJpSW4xU2pYQWxBTHhLSzJiRWEzRGg2SnpuT01pQzlEbFJKanFBckJM?=
 =?utf-8?B?V25xTk04T0k3Uy9ISjdGcFEyeE9pMTFTSVBzYWk5RnhQc1daYnhwWDN5aE5G?=
 =?utf-8?B?VTVHY2tLaW5GTUJuaDVhejNQSEhFemZPa3dFTmxJc00vVGJKTEEvM3FNZ1c2?=
 =?utf-8?Q?E6l9qD7LIUw+RyHka6sAe2RXM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b78591-8143-40f0-882a-08dc023ea18b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 16:05:20.1192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unRuuGt7A4ghFS+NFWkvvHOWyLTvadqcvq/xZW7TZ4LQfB8tQRuie6DUCMyoFAj64snvqGQ5k+W1TQoZROoM4nXy/c3gjKXpMuwHV8nnC7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 16:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192837

SGkgS2hlbSwNCg0KPiBvcGVuZ2wgaW4gT0UgY29udGV4dCBpcyB1c3VhbGx5IG5vdCB0aGUgc2Ft
ZSBhcyBkZXNrdG9wIEdMLCBpdCBtZWFucyB0aGUgZGlzdHJvDQo+IG5lZWRzIE9wZW5HTCBzdXBw
b3J0ZWQgZnJvbSB0aGUgcGxhdGZvcm0uDQo+IEl0IGlzIHRoZW4gYWNjZW50dWF0ZWQgYnkgb3Ro
ZXIgdGhpbmdzIGxpa2UgZWdsIGdsZXN2MiwgZ2x4IGV0Yy4gSSB0aGluayB3ZSBjb3VsZA0KPiBt
YWtlIGl0IGEgYml0IGJldHRlciBidXQgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBzaXRzIGluIHRo
ZSBtaWRkbGUgb2YgZGlzdHJvIGFuZA0KPiBtYWNoaW5lIGZlYXR1cmVzLg0KDQpPSywgdGhhbmtz
IGZvciBjbGFyaWZ5aW5nLiBTbyBteSB0YWtlYXdheSBpcyB0aGF0IGlmIEkgc2VlIGEgcmVjaXBl
IHRoYXQgY29uZmxhdGVzIHRoZSAnb3BlbmdsJyBESVNUUk9fRkVBVFVSRSB3aXRoIGRlc2t0b3Ag
T3BlbkdMLCB0aGVuIGl0IGlzIGEgYnVnLCByaWdodD8NCg0KVGhhbmtzLA0KQ2hyaXMNCg==

