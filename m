Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23429C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 17:01:49 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.51])
 by mx.groups.io with SMTP id smtpd.web11.144365.1700845301744446884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 09:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JqO5pefM;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JqO5pefM;
 spf=pass (domain: arm.com, ip: 40.107.13.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Esn6bqn0X2YVdenqRxbj0bmw1NwzfFG4iIgLRH/hq/QH8obrHgb24qQSyu5gUsWpTwy0CM82B6M23mTlhM5DEqa/1L/W1Jk+v5OUhDWhPO1JCAFMi6WRI6ipLv+44Ivst0EWxkPWC86DVC/8qdcyxF1Vhewy9LFWTy3+SIYPaePcVocJoEokDX7yuSnOc0QwbSKZLQW8o7Cz1PiaNw5NG449A7c3zWcS/e6VQQEg9Pk55ibt/NbtDjcODoczCf+LS4njMtopVLohtd+Av2Neyp/qEWfQi/I1NA+P+golCxJGQrZlJnlQu9PwJzSQM6K6rWdwkB3WGpPO0v3dLv52xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn2eDvleLtwrqysZ0C2a41IcyOPZ9vc8DGdEa9E+6QQ=;
 b=KsdDPF4YBoIq+qJcVIbzjOtMnh4/ZEuBNEVNy+StK/VYnaaVaxMrlJZvtozlTmM7cho5004sDy82SCwKfBeL3R3RF9a99cewAOn4/ywPcQUimGsc6xSj9UHMOh3rjBB81wEiSwzhlbMuWrP4M+fe0W8k1s/lWnlN/DFBIrt+4+GPY8WCTu9EcQoz4kby03k9YBsXlzrqPy+mtPh1DQkS6NAYvHUM6FamKJvmQ7gtqr/g078kWU8j9z1oIQ7PL/zugw8lEDLL56DtG+mDb+xfDO0MFLDiUtFRbVfC3i3iMS7Hl13uvUEw7Y7f3bSIzQY7FwLai3hza66mM0SJHmDg1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn2eDvleLtwrqysZ0C2a41IcyOPZ9vc8DGdEa9E+6QQ=;
 b=JqO5pefM/AMh1lPWtWvpu23OH/QnpGIXZ9Zo90F/zcS9tpzvU9/k5Si3G6ygIurEHBpwfp/CMYm1qrF24gAiaPoJGFp9NzE38/VGzNMKKQclT6tfxayKSaZNmxrruFIHZ95NMuiszc/hvbqrxa+E4Zg22SFgac1pdn6mAppQZA0=
Received: from AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::22)
 by PAVPR08MB9308.eurprd08.prod.outlook.com (2603:10a6:102:303::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 17:01:36 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::f5) by AM0PR10CA0012.outlook.office365.com
 (2603:10a6:208:17c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 17:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Fri, 24 Nov 2023 17:01:35 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Fri, 24 Nov 2023 17:01:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ddcef70a3e40738e
X-CR-MTA-TID: 64aa7808
Received: from 73bb380cbd22.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ECD14FEA-B177-47AC-8756-156424665564.1;
	Fri, 24 Nov 2023 17:01:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 73bb380cbd22.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Nov 2023 17:01:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8ThfUwTGM9MPUDpbiRHo+lH+dftAby+cBMUEorzrDYHWM1fIeuqdPW64/etJrk7Unj6RWf8cabDjwGBGM4WPjoJYh9+kT4pi35qdSlQb9DvIWWrMmtSy2DE92IfsZaj6DoPvF3ApUtieMxINk8/BrgWNMnSy/QCcRly1FOi2KqMB0BSqCWkcbbsDYxPBsQO0fxA189Saw9znKs7Kab84uxkEeQwd2gR+gCchWpeXrTdc3SQH04dPmFt9Kfn4BV8qGUkldAoeVl6hMGVCerUuX9sOBuQ4l9E/HJnMPj5vUwQK5zLC9ld3xsTiKB/QnUAW+OLj9K1tmKjynNWHsts6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn2eDvleLtwrqysZ0C2a41IcyOPZ9vc8DGdEa9E+6QQ=;
 b=AR22CiDFvZuBA6ikPL5HuCqMFrgLiCJd43M+w+Y48C6r5dSiukXeVuF1zE+SZKSgex5Dwb9ilcVpbN74XpVBHbYp2bP583wYCBbXrkoAuhwG75SwXT5AdLx1A93jNQSxupAghoExHTFArkz1U6hWoQNxKd3jzB/nl/j42cPoypKOQPBumvlpd1ZVRm2uJbK93PhqM+OvvtggBLLyoK45J41HEktRDhaJ1ThsnBhrv6+Vn1GutYg8M2UGthXbZJ4d2Z98hL+dW8fXnYh24J0HZT4O1S5WGRGXjCvWteZELBAVnm4VQtGy8vqpgdHG4YFmaHLi9XoIEaI4+Ny94aBY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn2eDvleLtwrqysZ0C2a41IcyOPZ9vc8DGdEa9E+6QQ=;
 b=JqO5pefM/AMh1lPWtWvpu23OH/QnpGIXZ9Zo90F/zcS9tpzvU9/k5Si3G6ygIurEHBpwfp/CMYm1qrF24gAiaPoJGFp9NzE38/VGzNMKKQclT6tfxayKSaZNmxrruFIHZ95NMuiszc/hvbqrxa+E4Zg22SFgac1pdn6mAppQZA0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8504.eurprd08.prod.outlook.com (2603:10a6:20b:55f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Fri, 24 Nov
 2023 17:01:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 17:01:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Markus Volk
	<f_l_k@t-online.de>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
Thread-Topic: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
Thread-Index: AQHaHQ2RTudaz6UdlEWVs9rhH0b2UrCJqmYAgAAA2wCAAAk0AIAAARiA
Date: Fri, 24 Nov 2023 17:01:24 +0000
Message-ID: <2A0F1B32-90E9-4813-AB9C-833D1264B78C@arm.com>
References: <20231122063119.3620722-1-raj.khem@gmail.com>
 <462EA886-8F44-464F-88ED-609B42680F39@arm.com>
 <307F70DF-9B9F-4A38-9788-F47DB99193D1@arm.com>
 <CAMKF1srK4r=YYB35noP5f30JJMO-cMYUyMMixWFrAP3tdox1+g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srK4r=YYB35noP5f30JJMO-cMYUyMMixWFrAP3tdox1+g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8504:EE_|AMS0EPF0000019A:EE_|PAVPR08MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: 937b1afe-1545-44b3-3798-08dbed0f047d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TienmNL67LBzpby+yzgmmDP1r+4UjTSWh75OsZ2lyv6cxehNEUr8CY3+8l5Rn79daHJu+GOhiUmmXq3xybOoDLpkoayiIMWJtOzCCem4zyk2nsCiFImeTWS3iF8omwQLLb4yvy8HgkG6XFVW52H5CVBwPDzPNr9l7ih+xjLtevKjHTz8akXU8tvHlSbHuUUga55KV2jeZtAV/gtxvx6L2D7v3Y0HHQo9DYNvTYIgE7MrYytCMDYPiimwSaPZEsh+Qvm/S7r+VQ8GFBBdaAq6j2wDIcaVzT5/M+loTRVJTM8KTpM9YrmfbAAfnJDX+Z3Ot0PSzVl/2WeqNjoneNt5kmxv/U8wAQ/eg9ngnfsxM2fuHka7q8eTKMRbBdrUeA5N1AHZvVBSb9hjmdZKUHfXT/5dV/0KbiC2Wkr/vCA+OkkqZ9+xJh+whfTKZpdc9O/n0ke/JU7m6kuWfvb7UhUSV1dCI5uB/RVvzAuiPlZHEVEWEPA3vwDOJZhx0t44bh9keWyACxpfRuCAnqRuDl0VZGLyz2aQMUCIvnILTxBMWqOObTP6l22r1Le751SZ4xOsx4KOCjYrmCRZDvdksgyra3csUzD6iu7o6a9+ksDFefpSRwkz7hsHsXDtIk3CX5JUlot3/xALqZ6qZ2D1el9pxw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(66946007)(66446008)(66476007)(76116006)(66556008)(91956017)(54906003)(64756008)(38100700002)(36756003)(122000001)(558084003)(86362001)(71200400001)(6486002)(2616005)(33656002)(6506007)(6512007)(2906002)(26005)(6916009)(316002)(478600001)(4326008)(8936002)(8676002)(5660300002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86E7C4D34DB0074ABFC49AD55B1BADD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8504
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4567f5ed-03c4-4766-f94b-08dbed0efd90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1tkg/qrUJwkz5i4SwQeGEIz/gxjP381bL5BHvn57bAKHYcqxi01FzaRRaogxcRd4l1LhippgdavW3Bpz6gbhyEWFdbbNDj475ja7sazovgWrPag6GT7wBmcEl1s1Vf/gXNzxsLlDa/LlYQcGhP1GjZgBRXw6Bsc3/ppH+IQ4iJI67MrxcKqB0VtVfeN2CyIAE91H5Pi7POVFxtBrI7dRZKFWXWA2Gcr0vf1SpjmBZWD0Q+uVOYm8Opd2fvAuK0CWSlCrpnwy/Evc+xabFhGN6/Xt5r3xJCH/NSDfpjymLaqpyNe7V6TKuIqUKwPJVCdeAXPRtkgrYmQ58XNo0MRpJk2IEt6Pl6i25EAo3nSLD+ezxXV/7uw1L4vwD52hWBbOFCecqL6544G5HjVNYKTnD6vIvIqDDPgPHfcS7rF6Hd1vhvOjPvKdQWFY9Ugz0ef9bo+zceAIvvyVFF+wZdRqEoTKxzEAm8Ep7yOHG5ZJRXMWkS3Ygw3h9aRdKBU0QqWuz7xa5dQrYlRBqBQAxjRfqwjpLGaAXaUuTdqWG/0qusHTYwcszPRGzH25Nl4ofs75K4o+tCzHJ6BCF2iKQFsTLp+rxEOwwR+f6eqvmrOT1h0O6di7bq6ztvNnLb7foLDf97hG1ABY4/eEG2mC2j88UwDe6gvrmAazb7O96/VkM1+C/zfbPFnGRzE8e/UCp3pmOKw35tS6E/SWdCTBfHwPXbEP07JeAuv3/a3r7GVPP6Ow3JaBt+DF51VcCQVZs3Sx
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(70586007)(70206006)(33656002)(81166007)(36756003)(356005)(558084003)(82740400003)(86362001)(6512007)(47076005)(26005)(336012)(2616005)(478600001)(2906002)(316002)(54906003)(6486002)(5660300002)(6862004)(8676002)(4326008)(8936002)(36860700001)(6506007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 17:01:35.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 937b1afe-1545-44b3-3798-08dbed0f047d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 17:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191211

PiA+IFNwbGl0IHRoZSBwYWNrYWdlcyBzbyB0aGF0IHRoZSBHVEszIGJpbmFyaWVzIGFyZSBpbiBz
ZXBhcmF0ZSBwYWNrYWdlcyB0byB0aGUgR1RLNCBiaW5hcmllcy4NCj4gDQo+IEhtbSBpbnRlcmVz
dGluZyBJIHdvbmRlciBpZiBpdCBXaWxsIGF2b2lkIGFkZGluZyB0aGUgZGVwZW5kZW5jaWVzIGZv
ciBkYmcgYW5kIGRldiBwYWNrYWdlcyANCg0KSXQgd29u4oCZdCwgeW914oCZbGwgbmVlZCB0byBt
YW51YWxseSBoYW5kbGUgdGhvc2UgZGVwZW5kZW5jaWVzLg0KDQpSb3Nz

