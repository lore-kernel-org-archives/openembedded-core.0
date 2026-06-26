Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C276C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 13:53:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35862.1782482017623256881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 06:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ONRhlqa/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ONRhlqa/;
 spf=pass (domain: arm.com, ip: 40.107.162.7, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jThV3FxR/vQGyO8QwB0Uy/o+uaZEnSEwt0fBxWYsShbPLZjrj/Qc+XySaSZc/tGzN2MC985ooztlPJznxulYAJie62Jhr6q0V9QaV0K4z7EUyaaC0QUFcsSYJ5e4nTjhXBwQ3IvOvRLXBSiNBmoSOeTI4NShOTojar5JgqN9GHX/ReKnooH27bEis0Lv1BJ3IfybSSdrXFMkvBJr8o2gAsxl8iQNFfu4Zi+5LgaNEoNJr6rvu2xGbnu0hhv7DlKgmT4NDhvNzq6ctwVObrjmJUk/QEV1bq2vCOwo/X64uaIHmqE7fXSk8/TuLGbwVVe5kZXR/cPs9a5kxeq/eqgeTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGNlQR2OfMO6qaKTF3O6f02W7MSS9GpEb5zjsRrHD0U=;
 b=nqdN/CBOp6g4TW1D5+y6gY77qKNq968W2tz2o+v9n2PPoGE21KC/ORn5I3DGqxOAlmmpjfb8Dl9PSTja3LN5Z+WsHKQES6o2rJBaRrachhBajPdrcPXtTOj8ZwSweqOJnHTy8Vx+RTmNGhkFXNbop9histXD4eV6rSi6g/LKY+u4MWzb9bj/Ivvt2r3baPcSRm6fC45K4ukJdaWmzm93SdObTXR/FhIiOKkRLARzKIPM0g7GHCP1YKwfyJvrHdzBAmfNRMyt5Q8BhavDd/rv2g+dSKyFgmbynSCMstMQXIR3HjU8PxP4ZEnxT/zojZpnAtbmOQ6RfHWce+2Pwoa+vw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGNlQR2OfMO6qaKTF3O6f02W7MSS9GpEb5zjsRrHD0U=;
 b=ONRhlqa/pMGNjPrealIN4xnWtDh/WtfW9RE4L2OERLsbIVZMrHMMuFKd9pcpJn5c3tN8ttDVoVxSesHfjzEbifxYu54Aprl8Nzk8WAIGiXdx3Uu7oftI8J/q/PapQ+rc9lvp5aX8ii4MUXCAHmxe8C16Fh1nBky5UXvRUgNVIGg=
Received: from DUZPR01CA0273.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::14) by AS8PR08MB6727.eurprd08.prod.outlook.com
 (2603:10a6:20b:393::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 13:53:31 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::a) by DUZPR01CA0273.outlook.office365.com
 (2603:10a6:10:4b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 13:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 13:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiaDzpKGmXV5Rl8IM5Rc+Ut+rlvLyyLWznr7HWw5SIz2AsmAJbfgwnt63TP7CRkhj3gwc+mjx2sWPliB3Z6A34s/PS0ws8ixVuhA24LnHvEsF0JyMCIgYp5hYM0CZNAilkXHxEHoZRkYcRqbM72Qi/wZHdgbJWK1Awhe7B8DMsZ1fw2/6by1WSTbGDIdtQx3cGjcBuo6ucNGLXuhE6Iq4HHV8GDNarZECKUi4oPo4GvH536NfXev2mBh68A5zhcReLWPERqq6qdkMO2d3R6pK45PKGiSKZxqzCFvX4fkcESOqFPT1jUNhzSVz0/s9lZrHYBJlOLt9/AmMLBv1Mg4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGNlQR2OfMO6qaKTF3O6f02W7MSS9GpEb5zjsRrHD0U=;
 b=SbZNRc+MQbeS0WLX+VgRt0dRg+3aHcOoA8UDYKKQeGGl+ZmKmPDVdsjTbMSHhRyXK7KtPhlc9yr2KZmovNiYYynsQKXfJlWanqe2ykE5TE0A7Lk49MgzTB4oK+tvn4dpTgl0+rcacLKLGrqFWL8OYBYz6XVsgQz4cr28U9ojgz0+HSCfQBjEI532tv27TIeWp7r9bcwrpQIu8CoC7rUpz1VjLOACwUQ113piuJCeJg1GnKg5eW93aUe5qFSW6bnValEWwm6nWBf3pGhGEvnTdpwngoCDql4nfPUnusHOyR2yEsKxKUkJuNzka6cqbQUpCR0V36cxqT5LJwW+sltg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGNlQR2OfMO6qaKTF3O6f02W7MSS9GpEb5zjsRrHD0U=;
 b=ONRhlqa/pMGNjPrealIN4xnWtDh/WtfW9RE4L2OERLsbIVZMrHMMuFKd9pcpJn5c3tN8ttDVoVxSesHfjzEbifxYu54Aprl8Nzk8WAIGiXdx3Uu7oftI8J/q/PapQ+rc9lvp5aX8ii4MUXCAHmxe8C16Fh1nBky5UXvRUgNVIGg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS2PR08MB10053.eurprd08.prod.outlook.com (2603:10a6:20b:640::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 13:52:25 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 13:52:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "anders.heimer@est.tech" <anders.heimer@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 2/2] oeqa/selftest: add copydebugsources
 tests
Thread-Topic: [OE-core] [PATCH v4 2/2] oeqa/selftest: add copydebugsources
 tests
Thread-Index: AQHdAstKioJUGXTDDk2+xpjHeOnKAbZQ4GUA
Date: Fri, 26 Jun 2026 13:52:25 +0000
Message-ID: <9F1500A9-372C-4A9F-BB06-C6C4D5B8770B@arm.com>
References: <cover.1782189065.git.anders.heimer@est.tech>
 <a65e58b8e68dff4552c042ee39dbed7055dea4b7.1782189065.git.anders.heimer@est.tech>
In-Reply-To: 
 <a65e58b8e68dff4552c042ee39dbed7055dea4b7.1782189065.git.anders.heimer@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS2PR08MB10053:EE_|DB5PEPF00014B8D:EE_|AS8PR08MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 42caff86-5e2e-4b53-f27f-08ded38a4ef1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 /KwEbQ5SmIE8HnH0xVBR2okIKu7p/o63RAWH9fnSx6DeKP/EzBP1QISB3D8hKnwvSoud/3CNNSUAakf9MfbTDL8DpwEqOLXvAVBYZfMsZWfqK+Bf6EsqvprAnhVXniCgSxSyeeYoz+1DycVzEJi9LemkyBF18fM1bEvV1WCMN/E2+2hYxzSII2YZgmQJQNCfbsKE3snNrfXIWQ5a744bXXIhWkRSZWshYKXqAjVIMVAS+lDF4IxPszLRUvXd5+9cIID+w3qj8LRB82miv75Tf2hqjhW/1xXiBZUFE2KA7BI45Hlb7cTVhtu6KAeeY/b0l5FjxyFeRhJoyAfK+MR6Dz1ciLrCTnV/QIW8xvEqb0TmDEC5YACwEmeK7kTY+/hU2+FUsv6V4QVR4DCznzEV5pKQV1ToFxcJZSlqYdgLY6DsDiV7+4nPhbD0RP4g5/OK5xEAgfFTfMuwd7peZ6kDeZ39Usq5a32xpTmjdOgglKwTo5HTBufDzM4i6M/5dgAjEnMX1hXiT8Gy1DDxQKi8ntSdqmZmUMfSTJsWwuGwV8/u/2vgCYANTAIfTiaBDcwyjjV3mwvOcVuOuWrfoGyZ88baSd/Jl9DbN0qWk6p07LEilmgS7N9URaGwlyl2tOot99AXJAWDGyhJvF+JzyiMJ7b4bGyopIzk9Ij/Usr6kkE6RSQ107/RjBNgMTrtP5BOpXCP0JCjO3yFSeRpeIEYeg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7CA61BACA2E2141A3ADAA00058894D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 qRc0X/oXKlXAyxuqRr6dka1N/jlESMg0rYzfIgTyu6u+NsRj4qw48+CwiPXPuFGnNdN5bAxcV/sv5MaPqy9hvNdoYp2Ux4oGVIoEvdRR7L9YSe37SPw3Vx/kUWnG3sLsag9xmclKrwm+EyVVOmMXNdohN+aC1Hs+hUhTb6ZqJAW22RFIqN0D1/Cvm7Gwa8Y8ZywhsPDJEC5RGV2HPGPCQAGRAkyP+ZB0vJ2SqX4kocnPxWQ44NPk/REhzwPwcFq4HCEkecVL/WMoasypvdbybTwZSpAWKrvBBlUgscTbzZVCcjQhBD9E/9ZenQRaMerD1gWK24aDKe6v8BTHRSJ0fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10053
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c8a45df3-cf29-4498-54ff-08ded38a2771
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|23010399003|36860700016|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+BwbCXyxjxqdIl2JrHEFadsG+fTRsq98T5ugq5GyPK4BTlpQQTql15Pgkijx3Sxxmywd0JTWDUo8cVGpwsM1WjU6uyeDIBdLjTUO1DqCyPp0gb8EP4Y3V4ayH5NkbcL69nSdh5JTDLfHPK7VjYEAtio3sbZJel9apStIkiC7S0TK3veYffO4h/kfgF+DG97DVaEqq068Uc0QIB38e9MEV4Gh0Zd1Tr3S+vDc9vdmSdg4TIhytj8C6UXEzaIUrcQA8jQH60nJYHUhYjplKKNzI5t/viM7OJxbEeKDrFzYUQ16kxA2R6vb6xD5Dz5AXCQG3R/Vl94iT+mUkIjF6Ffe2QHELIgSzthekkR13hBPyurdkFx28SJwsrrtaxYvSx/+heI8mSMGhflSGJEVyVy8Df8B2NKeZdBFu2cYjVyRSLHCzpyZmi5j1zXiT6Pmkn7VL7pKhpty9g/VjgsvQ0wA5VVAGQ18jqMlhgIWeU0ALdtJMPk0gV3bShgkOIhPe4elLBBz1TZ/aFQWhvJ06v1KP4tMcGpwcJLQgkP2B6dLZ9HH8dAB04M7bCRo5zglEeHBndd3BJ85LcneytYUyExkKgBX+qolJPUZYq9V2EnVD/gJ08qlT+UI6uvNNDUlRw6b7yGIVg8BMQo/GNGKJ63UNrFU8RASz1gkcDPw+opgqkSMjCa7VuOgHuHM9SNt6v/2
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IGYQRcogTVmHDuyUF+ZUvY80BDlqrfS65a1huk9CPHfHav7gRwC2mfRmoG3/HPwKowFJebxkXkW/4vOwR3yyWzcmDPXMEsZ9Ndf2G6v3FDKQhNRvRP+SfDNxuV3WgHrFw7PFCYj9OW++eUQ5PnaCPiBC4b1BA/qx4hVv6BeNjKfyTavyMrZvibJ5OFTJfglwx7S1cROOj0pKTcBZdRYQ4MkjatLX5i6gDRS0huaQugJYdmpBPONuJTbq3CzHbR0K7Yv+yTsOASyLSKRgl6IdJFD8sl8ODMNhOGyjYJGS6jWRgbUIMIjbsyVmBvUlZMkrlNi+rjjCV1KnG5RVrKodfltXkcNNYgn48ra8FVsaCaG/rHY/Ougig72z1VcLhjd7MkBq8t27pvJoQxM4g3mtQzxobrC00JMPPJKneM9S7ZxIpEViRegu0vwxJ8LfoAF6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 13:53:31.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42caff86-5e2e-4b53-f27f-08ded38a4ef1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239633

T24gMjMgSnVuIDIwMjYsIGF0IDA1OjQ1LCBBbmRlcnMgSGVpbWVyIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxhbmRlcnMuaGVpbWVyPWVzdC50ZWNoQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArICAgICAgICAgICAgY29waWVkX3NvdXJjZSA9IG9zLnBhdGguam9pbihwa2dk
LCBkZWJ1Z3NyY2Rpci5sc3RyaXAoIi8iKSwgInJlYWwuYyIpDQo+ICsgICAgICAgICAgICBtb3Zl
ZF9zb3VyY2UgPSBvcy5wYXRoLmpvaW4ocGtnZCwgZGVidWdzcmNkaXIubHN0cmlwKCIvIiksIHJl
bG9jYXRlZF9uYW1lKQ0KDQpXaGF0IEFJIGRvZXNu4oCZdCBrbm93IGlzIHRoYXQgd2UgaGF2ZSBh
biBhbHRlcm5hdGl2ZSBpbXBsZW1lbnRhdGlvbiBvZiBwYXRoLmpvaW4gaW4gdGhlIG9lIG1vZHVs
ZSB0aGF0IGRvZXNu4oCZdCBoYXZlIHRoZSBiZWhhdmlvdXIgb2Ygb3MucGF0aC5qb2luIHdoZW4g
aXQgZmluZHMgYSBjb21wb25lbnQgd2l0aCBhYnNvbHV0ZSBwYXRocyBpbiwgc28geW91IGNhbiBy
ZXBsYWNlIHRob3NlIHdpdGggZWc6DQoNCmNvcGllZF9zb3VyY2UgPSBvZS5wYXRoLmpvaW4ocGtn
ZCwgZGVidWdzcmNkaXIsICJyZWFsLmPigJ0pDQoNClJvc3M=

