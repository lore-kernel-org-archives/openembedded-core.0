Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4331C83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:58:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.10266.1693389485345984740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=43ejGq7T;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=43ejGq7T;
 spf=pass (domain: arm.com, ip: 40.107.8.47, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg61YTgs33F9uYe4ShtYaIzCXaOVYx6XoICCwKaa904=;
 b=43ejGq7TZ3A6mfE4aqZHIxekKvN/ncGnZzHR9+kpN+neSbk4OIMu/5ma6PLYTOsjOiLnMT0byu8xhuwR5rhzV+ksVwtFW+s9vsiX/s5OobPpFul2EkE+OnSnlz6itHpuHndPb+U+5W2YMHSzaRydaiYqOuhvcK3ySSqFMj2uGHk=
Received: from AS9P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::22)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 09:58:01 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::9d) by AS9P251CA0017.outlook.office365.com
 (2603:10a6:20b:50f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Wed, 30 Aug 2023 09:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Wed, 30 Aug 2023 09:58:01 +0000
Received: ("Tessian outbound 1eb4e931b055:v175"); Wed, 30 Aug 2023 09:58:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d4c34c76a741a15
X-CR-MTA-TID: 64aa7808
Received: from 413da8454645.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 735EB99A-14CB-4231-AF46-0109887C262D.1;
	Wed, 30 Aug 2023 09:57:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 413da8454645.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Aug 2023 09:57:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ir4u4YWNii4ZSjIGS8vkHC9rYgfNL9pjsd2TicuDQE1/TQENU3C5ThuhXS2+2GxxLEzLeVlToIE/UcM9ah8sg/4JGs/9Zk9aSOP89uM7eTAZQc6Rpb2IkwQEf9H0//rGUnlCxu8pQR/QZd4sedhNGGE0wHzu8U7xoeTT+tv/uM97fbPn0IU+wP3wVHuiWoIjo+F8Uul3SuG9w7VrOTPyBoXvQNLCt1U0xyqxlk0c74GeJJaXNmGFWZVVBNpQmWz//0+VXRGHOMFKWEiZRdS4wDtjH4/ug/mDl1qqKxKhTcwS6z1uWTz0DGdb706dpkMBX2HPMQ/QGgseCQhMajhpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg61YTgs33F9uYe4ShtYaIzCXaOVYx6XoICCwKaa904=;
 b=c7YNVl4OmXgMyygV2utAT/BrzmRSqLOys//07PuqV4mLMhPJRgSihgpLjl22xFRGG1c5xJsYP539JmM7zkUT5QURL4vyQ7AL5cIBACzTEY8A5J54HxAdo2vreygvLf4YHG3JUvf9A13IlTqS90IQ4bYuirjXqqeShbuI1iRzvIAd//hMxsSHZdBNY2hwHLg9zw5xPEXOixqIA3XqqjSOfZlwAav+lhFP5Zku5NZApslxFZydL46n7r+WKmvmDEnaT/hBbLHCb17+POUKc3NBQUhmGxcSqRLuq0p/mA2RiSB6nVEvP0/VcPGYt5Sv0/zejfnHS/fgW88ZwHw1d3Be9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg61YTgs33F9uYe4ShtYaIzCXaOVYx6XoICCwKaa904=;
 b=43ejGq7TZ3A6mfE4aqZHIxekKvN/ncGnZzHR9+kpN+neSbk4OIMu/5ma6PLYTOsjOiLnMT0byu8xhuwR5rhzV+ksVwtFW+s9vsiX/s5OobPpFul2EkE+OnSnlz6itHpuHndPb+U+5W2YMHSzaRydaiYqOuhvcK3ySSqFMj2uGHk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10136.eurprd08.prod.outlook.com (2603:10a6:102:34f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 09:57:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 09:57:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Emil Kronborg Andersen <emkan@prevas.dk>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: 
 AQHZ1pC+o0PoQVk8qkmhOrshDsnwIq/7IRsAgAQxagCAAbtNAIABXeqAgAAvdwCAAAWfgIAAAuCA
Date: Wed, 30 Aug 2023 09:57:51 +0000
Message-ID: <962C73B9-1335-4C06-9260-7F3959E880F6@arm.com>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
 <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
 <DD619F8E-B1D5-462B-A4E7-008A6F8E181E@arm.com>
 <PA4PR10MB45762B6CDBDBB062BE4C5326FFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
 <46B1A25C-EF15-4C95-A9C4-425B706F6DE5@arm.com>
 <PA4PR10MB45766E4F12461E4BE5816BBAFFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PA4PR10MB45766E4F12461E4BE5816BBAFFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10136:EE_|AM7EUR03FT023:EE_|PR3PR08MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: aab885d6-23d9-4614-060f-08dba93f9895
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hJmqVFeQJEK7TFa6PEMA0n8oXcQYFOMbMr56m/SBkN0rExOPn8mdWdfjTOPG1Lq7zgWqT5yVwHYHeaaT7UBwMO6MTE+eDCIBfHVhlB+aa++G7Y/JZSUzxjWAcxdIIH/EDJEbprM3zJzoc09p52u/Fm7SQLJjdpIV/p3nbImywqhNWyvTQJaDDVNpV6kIUcODEcnvzIXT977pTBzSzr+hfHKZnWDgD+LPZl6VP3z/oOGqgHP90lf93BcmfuL/H+L3SxHpfa0ojza4aI9Jlo6BuCw+qaVOFPW4sz800vD5r3WIfArg85TGktqz/aiFKsMTI5md05Kyxlxp4oSXwsLG+y8mMfaRvhhKu3RY98cTuBzu2HHioA147taxbl7zBJNMS2tDp1vqm4T24cIX+1Gir8p28TbUdUFDJh/O8E1vjrz/6yzz7kgolG+Ku1z92gqKafNfTBHm+uKgmq2Aml0Z7zTWxBOjNrmTai/gfO0uu1d5/2rqXKOLbKQEz/jcoPtVMHesJWaXuCZLdNR9T2enHidAPMUiLhvgBMJihHN6vGaUDfcJ3ESeq2yz25WDYgBvWgD3CjQNYo4/Olom6dzMc226F6LGExvV7oUrzElM19BMNtc6LPWCKHX69rq24/YJTHJadhebzLetilcHbB3svw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(1800799009)(186009)(451199024)(2906002)(4744005)(5660300002)(33656002)(36756003)(86362001)(122000001)(38070700005)(38100700002)(8676002)(4326008)(41300700001)(8936002)(66556008)(316002)(26005)(2616005)(6512007)(6916009)(53546011)(6486002)(6506007)(66446008)(71200400001)(478600001)(66476007)(64756008)(91956017)(66946007)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEA302ADB719C4479D982DBE36F7D103@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10136
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94d9dbef-31e6-46ef-d387-08dba93f9315
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MSNAzK3jK7y4M3HKBRGY+pd9OsP5Gly2Z1NgSodLFi9R+ZbZezCPinRTqoSvhzMPW96npNM+Cvl29iUZHShV+t+EU3ZLlXhCa85+Nc659QhqWu1pUlrrZ2qJ+hQlgdVcuFguMpZZjxQ3kQtBeh2Fi4A/Mng2kIlxb9IdZPMFfY+9qvWvSrXZUmB+nzUlKKz/PE0Qax1j25F83GXRjWSOLfU4vdl+go5HSfXI/MgWWOmOr7Oz0s/CL5gb76YhuiwZtmiZb1L3QiPtxTh/BxO+sRHDXhgatVAH3OiT7Y0GCDNI8CnmVkkazyI945fGca1LipcSFsW9IPN1S09HZhUWzj+ST18Joe/AsnTMptNx2curYAFY/PIS7XULoAHySbzEB4Mf2VDj0VStt4sLJUhOdQaGJUgRMLMtmdofFJjfrrREXg6Z0t4skVnX4Dlex5FmPvYopoHAeaQOlAubn4KDzTtTIbhWrGkryHfbMSWl4OJzoP5ApCwtHVbLtsqwmJWRFps1bTgt4VS3luf3bTO+349oMjGYQcjtx3lNzmEFexcOrT1XCRhqhX72T0N6W+hQbmuVKL5FIV45JChwXpJrTBeUPt689Ji2UM3GH4Lm8AImcsdKmPnemp/8vjYR3DmWJgbbrP/Q42gZCibz8/ovowJNtjTwdS/43BAUS37IeO0MQRNrxqXSgZRx8yFsjxjQtuzpmhRoPczhZDhQI5MhXCofxU63UuBgyZDCwvbfrWNEqUzxJTeHIpMM4hmuHnj9
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(26005)(336012)(47076005)(36860700001)(6512007)(53546011)(6486002)(6506007)(5660300002)(356005)(82740400003)(4326008)(6862004)(81166007)(8676002)(8936002)(478600001)(86362001)(2616005)(70586007)(70206006)(2906002)(316002)(33656002)(36756003)(40460700003)(41300700001)(4744005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 09:58:01.0525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab885d6-23d9-4614-060f-08dba93f9895
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 09:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186878

DQo+IE9uIDMwIEF1ZyAyMDIzLCBhdCAxMDo0NywgRW1pbCBLcm9uYm9yZyBBbmRlcnNlbiA8ZW1r
YW5AcHJldmFzLmRrPiB3cm90ZToNCj4gDQo+IEFscmlnaHQuIEkgdGhvdWdodCBsaWJ4MTHigIsg
d2FzIGEgZGVwZW5kZW5jeSBvZiB0aGUgcGFja2FnZXMgdGhhdCBpbmNsdWRlIHhvcmctbGliLWNv
bW1vbi5pbmPigIssIHdoaWNoIGlzIHdoeSBJIGFza2VkLg0KDQpJdCBfbW9zdGx5XyBpcywgYnV0
IGlzc3VlcyBpbiBsaWJ4MTEgd2lsbCBiZSByZXBvcnRlZCBieSB0aGUgbGlieDExIHJlY2lwZSwg
bm90IGluIHBhY2thZ2VzIHRoYXQgZGVwZW5kIG9uIGxpYngxMS4NCg0KPiBTbyBJIGd1ZXNzIHRo
aXMgcGF0Y2ggY2FuIGp1c3QgYmUgZHJvcHBlZCB0aGVuPyBEbyB5b3UgbmVlZCBtZSB0byBkbyBh
bnl0aGluZyBmdXJ0aGVyPw0KDQpOb3BlLCBub3RoaW5nIGVsc2UgdG8gZG8uDQoNClJvc3M=

