Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCBECA0ECF
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:03:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.43])
 by mx.groups.io with SMTP id smtpd.web11.22341.1694516602070028193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3L+MkT7v;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3L+MkT7v;
 spf=pass (domain: arm.com, ip: 40.107.8.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWrv9qfipuZYHu1eiPKLqZ3fPuX62Ut3qdQMG6RKyZM=;
 b=3L+MkT7vcGKWdJManbv8N7JoLVKkwXL1tNprOFB8Ap2gGGpehouONmY6gcE77IpAxQtYPue1alUlguJWgSdepXmJYeUzbg0lERS4J1Ns+SY6JBd9yfWyyl3mVtMiVEAI9CauKmJpIDOZpDILENcfo2fEuMlPKwVH3GqnyC4ikrI=
Received: from AM5PR1001CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::36)
 by GV1PR08MB8308.eurprd08.prod.outlook.com (2603:10a6:150:a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 11:03:15 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::83) by AM5PR1001CA0023.outlook.office365.com
 (2603:10a6:206:2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37 via Frontend
 Transport; Tue, 12 Sep 2023 11:03:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.11 via Frontend Transport; Tue, 12 Sep 2023 11:03:15 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Tue, 12 Sep 2023 11:03:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e75c47715161695c
X-CR-MTA-TID: 64aa7808
Received: from 1cc04903af29.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5EF912BD-32AA-46E1-839D-69C59E6BE03C.1;
	Tue, 12 Sep 2023 11:03:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1cc04903af29.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Sep 2023 11:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLiugm0cCTtBlkzFvyead3HxcwZofLy69IrVdRahErDtm/o5zkLsTglwpi2bM++DpJt9UDDL5u9UL9JglZAVIUoY7cfST8u3cXbAaEn0jzjowKNIdDbvm3EbZT5ZB9TdsJNJnn9g9jglyMDFwx68LjuVDACfi4vP3EdNyFcFZCKs6Vf/rji/ZbczZ9OYdw2VO0fcomDG3pk9t2gMzgEJsHeLk4T0j3fPBlKw2rKZW6KLE8x6xkDnt4Ymqr/LJNxip4y9ywZLzitibnEWGNwWa7CW2sA83eS0CHs7w1eWz4wmMYEs30gJEScIbu3oeV1h8Y2LUvHzDXd+YskuL3h4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWrv9qfipuZYHu1eiPKLqZ3fPuX62Ut3qdQMG6RKyZM=;
 b=fpsZFgRXwnELaRy6mIvH7LIysAHl6/gsKH7LIScEEKxtiHSNk833iijK9pDsqm0NxyUN+33Ei3nP4NH21KqIuzXIh6lUrY8XCWL+diHIiH2vZX3BBskHjPeGrIDjQpMB6ueHniVR7ba60cXvqtDAlJmnDGTQQnYYfe30PBPVRGLar/Le8ckz/AM54/u52MjH84cYqySlKAW1rlmo2zW1v8n0qiRiMJw+XADRGWz1105UHvoQ8NjvvQJhuY6WeOgoe8c+B9gjdFLcyWAmAcMO7JijOt1sQCV19RqnbbOVdJ3dOgztRjf76DzqhVU2fdyoOoLek5o9H55ip0c2NJQVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWrv9qfipuZYHu1eiPKLqZ3fPuX62Ut3qdQMG6RKyZM=;
 b=3L+MkT7vcGKWdJManbv8N7JoLVKkwXL1tNprOFB8Ap2gGGpehouONmY6gcE77IpAxQtYPue1alUlguJWgSdepXmJYeUzbg0lERS4J1Ns+SY6JBd9yfWyyl3mVtMiVEAI9CauKmJpIDOZpDILENcfo2fEuMlPKwVH3GqnyC4ikrI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6595.eurprd08.prod.outlook.com (2603:10a6:20b:365::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 11:03:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 11:03:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: JD Schroeder <sweng5080@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] distcc: Fix groupname gid change warning
Thread-Topic: [OE-core] [PATCH 1/2] distcc: Fix groupname gid change warning
Thread-Index: AQHZ3BbF/9OCWVka90WRtnsIrPCGCbAFvuQAgBFaSIA=
Date: Tue, 12 Sep 2023 11:03:05 +0000
Message-ID: <D7F71619-5603-498D-AF15-8AB767ED150F@arm.com>
References: <20230831142305.10981-1-sweng5080@gmail.com>
 <20230901100320a0451563@mail.local>
In-Reply-To: <20230901100320a0451563@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6595:EE_|AM7EUR03FT059:EE_|GV1PR08MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb1c5f9-a6a0-4135-aeb7-08dbb37fdcf5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 b3f6ZQGETeNe+aRi0bLvOTLYJvhnFCcfLs8iu75rmLnOFM+9YtBITTFj7gwSsgdE285AGgBtQpPC6GLcY6xvs8uUlGFrEU/daWz217J/H0kL3Slpq5BfJA/WM22pqt87fcNbjeGzC+QPhl+KH8f4BL495DI9cRXXP+jv+7ddqvOM7Da8jfCA+eTt6tqcw7KC/JkZqB2FbdkGQVcVyaCkS1RzzQxb5RNGAj5OJpAy9JrMRuA7EHuumnByuAh/gv9Bp9ZEFOTIiH6csCloO3+Oy3EGJcd96gSsON8SZbvH7GwzXGFL37JN9qaJ5OjdjdBxvUcFOwatAC8yc+VDQkzg8rpjKL3FyqkO9GVBp23awi008Ytriw0JXIR5zK2xeQtJNe/JocB4ZjZDKFyC0UCg6KATxA6Cayg+DNmHFBBUL9fx0RXusMB1ZCRc1osJugdPFDJpCHzmhHSKyfns4v1SgofWfe/6eH0tEpQYRpQSPU1LRjNpW7YbXScbh/9zHUxs2u/3/uE4Ne4nChc48MijrDRu3g4H7cSNUy3XA3lHKrAqm2r/CKI9N218lv/BVTvMEMz0PeCu9fUGXPlBh3Kxd4xmcLaU+CDorNeL0+nCN2J79TqVzTH48shYK1N8EI6s
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(186009)(451199024)(1800799009)(76116006)(6512007)(966005)(71200400001)(6486002)(53546011)(2906002)(2616005)(6506007)(26005)(91956017)(66556008)(64756008)(316002)(54906003)(66446008)(5660300002)(6916009)(66476007)(8676002)(8936002)(4326008)(4744005)(41300700001)(86362001)(36756003)(38100700002)(122000001)(38070700005)(33656002)(478600001)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64F80D8AA1D4E1468E60CF57B2772DF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6595
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed141e78-6f57-499d-5c7b-08dbb37fd71e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UQhC9y1guJ/24hg+R0+Wm+F2lyrxdZJNlTwjlhdbTAD3Q7mhTwPBGdGDs5kaD5YzF2lR0l2fUqWwl5OUZv6X3WJ85r/r77kyvfYHhkO/O4SV881UKRAAqxxt+4FTmegMzRfBh2DbCGZfS8WTSLw4zbpM6+eS9m+8tXpkMd1svtN4p+Sbn9l6pap1Cu7qcBN1HwtCOnXgCN5g+K5Nh8pnLJWi1EJZPdzLxGLGt9rfYUVz1nXQ9so4OcJx33oUiqZ2c6O9bne9FFjg6ZG/Ov92YRwCm6z4ErgqsTbk+muO5tuiCuZbU9bCVKBOmBwTCsaUWNom4TVTpwufycUYk9HS2j6m3ujoQ5XyFZ+fXxM7iFFzGRN0idxqo11b+taguVMuXs+84Ep3gu5cIMj0uMMNjB2xOu6kiC1PDR5EfM3FG0J8arb4b9JUrxW0sLJnQjZj3QAfIceBORcJiiZhjfb2nPj7Txy3lW001F83K3MwoukTiWyvumJdmNl7JfuAgGUDcXhyqT8WyRDdvOHjs3KiEP/adn7Z73vgvFpnAdkWWVlz0p+JzWAiyHiiIJ4FaJBn+EiCgoS1uAc2weDKcgspqnjEw/wIG07IGtxwCzCQf9mktwlbYvmmAB2EJbboeY5YMfsl5cCKIIsQ/7bSdcRZKTm3oNbbD1wW/3FVD5c6M8zWSs9XRXpms3Q/7ubfvEfIkd18Cs86CzcfJ7cuAJWhtDeHhvk5CFk0JTOTNIjcvrM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(70206006)(5660300002)(356005)(81166007)(6512007)(6506007)(6486002)(2906002)(36756003)(86362001)(82740400003)(107886003)(40480700001)(47076005)(33656002)(336012)(36860700001)(2616005)(26005)(4744005)(6862004)(478600001)(966005)(40460700003)(70586007)(8936002)(8676002)(4326008)(41300700001)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 11:03:15.1739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb1c5f9-a6a0-4135-aeb7-08dbb37fdcf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187501

T24gMSBTZXAgMjAyMywgYXQgMTE6MDMsIEFsZXhhbmRyZSBCZWxsb25pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4YW5kcmUuYmVsbG9uaT1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEhlbGxvLA0KPiANCj4gVGhpcyBmYWlscyBvbiB0aGUg
YXV0b2J1aWxkZXJzOg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
L3R5cGhvb24vIy9idWlsZGVycy8xMTcvYnVpbGRzLzM0NDkvc3RlcHMvMTIvbG9ncy9zdGRpbw0K
PiANCj4gRVJST1I6IE5vdGhpbmcgUlBST1ZJREVTICdkaXN0Y2MnIChidXQgL2hvbWUvcG9reWJ1
aWxkL3lvY3RvLXdvcmtlci9yZXByb2R1Y2libGUvYnVpbGQvbWV0YS9yZWNpcGVzLWNvcmUvcGFj
a2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtc2VsZi1ob3N0ZWQuYmIsIC9ob21lL3Bva3lidWlsZC95
b2N0by13b3JrZXIvcmVwcm9kdWNpYmxlL2J1aWxkL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXZl
bC1jb25maWcvZGlzdGNjLWNvbmZpZy5iYiBSREVQRU5EUyBvbiBvciBvdGhlcndpc2UgcmVxdWly
ZXMgaXQpDQo+IGRpc3RjYyB3YXMgc2tpcHBlZDogUmVjaXBlIGRpc3RjYywgcGFja2FnZSBkaXN0
Y2Mtc2VydmVyOiBzeXN0ZW0gZ3JvdXBuYW1lICJub2dyb3VwIiBkb2VzIG5vdCBoYXZlIGEgc3Rh
dGljIElEIGRlZmluZWQuIEFkZCBub2dyb3VwIHRvIG9uZSBvZiB0aGVzZSBmaWxlczogL2hvbWUv
cG9reWJ1aWxkL3lvY3RvLXdvcmtlci9yZXByb2R1Y2libGUvYnVpbGQvYnVpbGQtc3QvbWV0YS1z
ZWxmdGVzdC9maWxlcy9zdGF0aWMtZ3JvdXANCg0KVGhlIHNhbWUgcHJvYmxlbSB3b3VsZCBoaXQg
dGhlIHBwcC1kaWFsaW4gYnV0IHRoYXQgcmVjaXBlIGRvZXNu4oCZdCBnZXQgYnVpbHQgaW4gdGhl
IEFCIGluIGFuIGVudmlyb25tZW50IHRoYXQgaGFzIHN0YXRpYyBJUHMuDQoNClJvc3M=

