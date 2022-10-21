Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857E6C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 14:59:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.42])
 by mx.groups.io with SMTP id smtpd.web12.10973.1666364366930567008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 07:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wxSb4RRw;
 spf=pass (domain: arm.com, ip: 40.107.21.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SdsjhPOvrqLnBEYgqh+fATr4JBTqYzb0gyBFexe9c3B/fUwiw40R0lk+35U7K/vm8nHgd7LoIdodAW7rrPmRfvrGKpL3LWbhJQlu46L3Cm4XSqtotxW71SZo/rZ5d53Gl498R8bX+a2dcFmogcPueXVyfLBTzYlExkDAtSH+QhloZdCCy0eapp/eyMccFyMNI+A0vyhCDLdMAgzv7sBKrpTUx5XYtRB2xLcFArmPHA5cmQN0OMJdC7SJWo/YOXheU+Raa8in2AcP+rq1QaSzXV26SY9P/GBCjvV1srEo0csao4ff+eop4FBvwZgea7e+dse2luhTzl09CB1nfe+gXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fcGxT/pJZYLGJHLfu1fQqktUnzt08mHidKDUZr1Spo=;
 b=XNau80AbJDs5ZlXHfpL7FFKIGlgLRK3WZCTLkSAzSiKouavsVEJF41mwnfqpghc+B7mwmeUg7M1pjjvKKrOu3CbIogCDTQAv2PKj1jj4pomBCXGTwJdwzjWYEPBMP19O4mF2LUThoc14TCkexRXruNBBecesu9AwbT2aoLP1Trqku2QN2CeyuP9l0KmRFicTBWyrdPt1GAoAQCe+9QsCVL56oQag9ayVNAr+BXlyKUcoMigAVFQa+sVx1DqkIevx8qs4XNoZfjTBVbj5cd+isKtATsQzfNxgNU7XNnrJbMAJ4zzb9C45zjWm5ZU0QSnQj7TFNtPA/PQGbZzFVhbG5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fcGxT/pJZYLGJHLfu1fQqktUnzt08mHidKDUZr1Spo=;
 b=wxSb4RRwq3VEwDYDzLnxGsboz+53MRNqXRoujuPNxLcP5tpkvX4JwyXfwh0ruzcv7XOuG7WbHuPlsvqEbICI05aVi5bVEMf3D+JnfDkpsVBWC5DCQdwwAak7FUqyWhb57O18hy8HAj/sjFrXc2cBQUr8RrQ1Os+t6h7ewBa6Izc=
Received: from AM6PR0202CA0062.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::39) by PAVPR08MB9532.eurprd08.prod.outlook.com
 (2603:10a6:102:312::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 14:59:23 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::8b) by AM6PR0202CA0062.outlook.office365.com
 (2603:10a6:20b:3a::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Fri, 21 Oct 2022 14:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Fri, 21 Oct 2022 14:59:22 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Fri, 21 Oct 2022 14:59:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f02062231d133ab7
X-CR-MTA-TID: 64aa7808
Received: from 4c46fcdeca18.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 259F70DC-0908-4357-9B05-4403741DC574.1;
	Fri, 21 Oct 2022 14:59:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c46fcdeca18.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Oct 2022 14:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu2ij7cpfkeefhV9GVQVA8laAx8QgCl27SefkESpSW9etIND5+TmuQFUvx2T1mhhnpqXn1BNCBA6dX3oWxx+Lwmfp1L5agGsG6YuUAhOE4Cleqo/2TzWz5Bp5tY8ulfB9n2hwyYURbFbo4qwL1iLNIf0glHAO7F4VhzwUB7CMPjffDn+Lxi8x9eqTUWQaZIegDahnxmPH0iWqksHFmoifs0dEnGrkUvKM53tnjwKFCUwvoY+L52PX25QJm2qNGK9hFWpSQqf0aGup5EMkQE2ux9Tha3AZYsFDMTAPawzlxn9w21RMTQ+TG7b7WYxuG4io4748+H/rr9nKBbRbwNydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fcGxT/pJZYLGJHLfu1fQqktUnzt08mHidKDUZr1Spo=;
 b=dEaeHvRQXBg5ZhpPoFmQVd6r/OPRShHjXEQeRX1YaXvgcIC3BMo3mQh0OwNhDfTt0IlBj9ronq3NitF+PXYcJUHzFV17F1VcnhfXN6Gf3tzmFjDSuQ+5MINl0ChjFkk5BovS+V3GUou5devjge9yQED0OIwoxtaHndgMxxBjZ2OW//YxCtOMHsOAVwZlz2B7vlhK5rC6vnLG3Wqm2gEGGiy0qF5AKbjPqAhcJ1F7eVQdpS6MNtVmthcEdEHjOZ73vjy6VSuWB8VxzrF4Za/GUhCvaKUn6M4yBKRhRaw14SS3eTRAwTlLpm8867rtSiUYvlcPyG8gorls+zuMrhPEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fcGxT/pJZYLGJHLfu1fQqktUnzt08mHidKDUZr1Spo=;
 b=wxSb4RRwq3VEwDYDzLnxGsboz+53MRNqXRoujuPNxLcP5tpkvX4JwyXfwh0ruzcv7XOuG7WbHuPlsvqEbICI05aVi5bVEMf3D+JnfDkpsVBWC5DCQdwwAak7FUqyWhb57O18hy8HAj/sjFrXc2cBQUr8RrQ1Os+t6h7ewBa6Izc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7985.eurprd08.prod.outlook.com (2603:10a6:150:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 14:59:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 14:59:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wltu@google.com" <wltu@google.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Tristan Lelong
	<tlelong@google.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
Thread-Topic: [OE-core] [PATCH] openssh: Install internal header/lib files
Thread-Index: AQHY5U/Y4Unn1C4yNkm2KyXp3oS2Xa4Y8LwA
Date: Fri, 21 Oct 2022 14:59:13 +0000
Message-ID: <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com>
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
In-Reply-To: 
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7985:EE_|AM7EUR03FT033:EE_|PAVPR08MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f8ff40-5b98-4ab1-26cc-08dab374d6f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HPIHkdDAYVWpcf8s3V1Vf2CFITvLpHQSX8tBSveP7drEx8ylvAaAxeJYgz2qmM7Sjrx+j07GkLPSCaKBg5O7CJEa274dBNkIXAjeCXf9OstRqY5EUqBjVIdqFsTQKbTaqEDEzTwtNRbBIXJ65A3eqg/GbVtmSvp0tBXzgysTzbR0otDW8iTExrEtE/ho1RLr5agWv07+LpxNnuZbrV2NGEIDbXau0AQ7b6bFTrkwbmOcdp5dgST0dsTtNh1gnb7O8SrF1itQ2vHtblhJrjTOgxe5gc5Yb3pSENgANG2tmNF1Z0Yi2oBCzkKhXM70chKDlHjbLDRo5dfzuHUaXqEpK8fKE+v2gRJLfIZIJDpB1ILVx7GL2wxbWDAqKQVfcqq90XXWA5KweR7VBB8bORy3xVXggILNfqetVwIKt8wN3OM2hbo9eya4FPTHkitA65f9XrtnqNBAroDs913cS2WAPqjGgvnN4vC7F0OEH0t6f83nlV2Q9qAzauXuVNJurHuYFYmPboyjBpFwSFQePd0rpUnMIsbWbI9+smAEzoHou4++ljL+3OH4TxluGVHs+KYx3UvILxEWwxleQ2h83N9ifBgyuxzL7jyc7CAujWqZnAWkw2s6e988j0Febk+wSaIT56M+5Jkgg9Wv5w211ITLRhPUEVWbbD4e4k0Ee8l8gtWUW1Mt5nDkzh9EQzz+bqLk6+xma4Y2OIbBgR3UcaWrTRXiq/IPSoBF0vulIgYdR7+8qJLB3znbyzV2bxvPjq4yWnqWtofhCokSELA/PXgk+n2Jr/QHcOOHd87oB0Ut6co=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(2906002)(8936002)(316002)(38070700005)(5660300002)(54906003)(26005)(6512007)(6506007)(86362001)(41300700001)(66446008)(33656002)(66946007)(36756003)(91956017)(8676002)(76116006)(4326008)(64756008)(66556008)(66476007)(6916009)(478600001)(71200400001)(122000001)(83380400001)(38100700002)(6486002)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C9188CF240E734DB41FD2632A2B6672@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7985
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	547b010e-4608-4c2c-cbf7-08dab374d148
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uVe0oDboEMJpIsDvFlRTmXFTIqZPFvlaJ3964TQKUS56RLtvY3GSWh6iVukRmMz3CgZTIAWaomQoUuem0MfjiDjhfMoUf3IWQ2cc5duVYrbufNYfEKgRefYYddu82cbvv5XBkzfjd4Hqyh8tfAPcH9wV98FFjv8rJZvsmFguO0o5QKOHMUJD4nZ7PLsgI1nRCG36eFIkaMI8Vc4I447klhDfwn31omvObMq+g6BvSjWt2vG2XxyzsT3uNO5v8kQ2p17RBm7c8weFHS9elJizsFH/3fELuGLBIF2oPGJDoEsGIkc02QYJaq3rINnh6CMWLtwWdQIlMKV2bAJKlDxOQ5XYUHi0dabgZ/NMm9GtYkY8IYU1MyxqurBrFQFG9Ut8xsR95VXfek+z+4fHoOCZxhe9nHbOSvqxxCx0qYpj+TRebpObRfNhDOkLN/jj7pVhK8fFVCVKb+SnS8UeZz/bo+4rzJj4DE4U29xNxeuWgbWGMTqZkFqHUyAMsL2zq7O3qxheqLHBHNIG77FDCcOkLfASitoo6ZKuOOYHGVJGbwSpAHmi4hoBYzz4+7KCfpnuAU52/KZhM4JWE45VO87vcCEFGE2dTkimoAnJZ3pLfSasKQlU866lJIHc8T+CXugZAavEoPPmGveU+2RIUV3eaqTtVTzVplJj+agEVjewPW1Rg0faIRaPQ0DvVNTa1jPdGlRt+mpdKM3M9l0WokLiRWBL2tDbqfpp1CrpgLipvmGUhAw8XxhP9CMJgA40liwpRJ66D2+2613f+wUVEAysKQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(356005)(478600001)(82310400005)(82740400003)(6486002)(54906003)(47076005)(6512007)(8936002)(6862004)(40480700001)(186003)(316002)(36860700001)(41300700001)(83380400001)(36756003)(107886003)(86362001)(8676002)(40460700003)(4326008)(2906002)(70586007)(2616005)(33656002)(6506007)(26005)(5660300002)(70206006)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 14:59:22.9559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f8ff40-5b98-4ab1-26cc-08dab374d6f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172023

SGksDQoNCm9lLWNvcmUgZG9lc27igJl0IGFjY2VwdCBtZXJnZSByZXF1ZXN0cyBvbiB0aGUgZ2l0
aHViIG1pcnJvcnMsIGFuZCB5b3UgcHVzaGVkIHRvIG1ldGEtb2UsIHdoaWNoIGlzIGEgZGlmZmVy
ZW50IHJlcG9zaXRvcnkuDQoNCj4+ICsgaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19G
RUFUVVJFUycsICdvcGVuc3NoaW50ZXJuYWxzJywgJ3RydWUnLCAnZmFsc2UnLCBkKX07IHRoZW4N
Cg0KVGhpcyBzaG91bGQgYmUgYSBQQUNLQUdFQ09ORklHLCBhcyBpdOKAmXMgbm90IGEgZGlzdHJv
LXdpZGUgc2V0dGluZy4NCg0KPj4gKyBpbnN0YWxsIC1kICR7RH0ke2luY2x1ZGVkaXJ9L3NzaA0K
Pj4gKyBpbnN0YWxsIC1kICR7RH0ke2luY2x1ZGVkaXJ9L3NzaC9vcGVuYnNkLWNvbXBhdA0KPj4g
KyBpbnN0YWxsIC1tMDY0NCAke1N9LyouaCAke0R9JHtpbmNsdWRlZGlyfS9zc2gNCj4+ICsgaW5z
dGFsbCAtbTA2NDQgJHtTfS9vcGVuYnNkLWNvbXBhdC8qLmggJHtEfSR7aW5jbHVkZWRpcn0vc3No
L29wZW5ic2QtY29tcGF0DQo+PiArDQo+PiArIGluc3RhbGwgLWQgJHtEfSR7bGliZGlyfQ0KPj4g
KyBpbnN0YWxsIC1tMDY0NCAke1N9L2xpYnNzaC5hICR7RH0ke2xpYmRpcn0NCj4+ICsgaW5zdGFs
bCAtbTA2NDQgJHtTfS9vcGVuYnNkLWNvbXBhdC9saWJvcGVuYnNkLWNvbXBhdC5hICR7RH0ke2xp
YmRpcn0NCj4+ICsgZmkNCg0KU28geW914oCZcmUgaW5zdGFsbGluZyBiaXRzIG9mIHRoZSBTU0gg
c291cmNlIGludG8gdGhlICp0YXJnZXQqIHBhY2thZ2VzIGJlY2F1c2Ugb25lIHBpZWNlIG9mIHNv
ZnR3YXJlIG5lZWRzIHRoZSBidWlsZCB0cmVlLiBUaGlzIGlzIGNsZWFybHkgYW4gdW5zdXBwb3J0
ZWQgdXNlIG9mIG9wZW5zc2gsIGFzIHRoZSBoaWJhIGJ1aWxkIGluc3RydWN0aW9ucyBsaXRlcmFs
bHkgc2F5IOKAnGJ1aWxkIG9wZW5zc2gsIHRoZW4gcG9pbnQgaGliYeKAmXMgY29uZmlndXJlIGF0
IHRoYXQgYnVpbGQgdHJlZeKAnS4gIElmIA0KDQpJIHN1Z2dlc3QgYSBiZXR0ZXIgYXBwcm9hY2gg
d291bGQgYmUgdG8gaGF2ZSBhIGJiYXBwZW5kIGluIHlvdXIgbGF5ZXIgd2hpY2ggYWRkcyB0aGUg
ZmlsZXMgeW91IG5lZWQgdG8gKmp1c3QgdGhlIHN5c3Jvb3QqLCBzbyB0aGUgdGFyZ2V0IHBhY2th
Z2VzIGFyZSB1bmFsdGVyZWQuDQoNClJvc3M=

