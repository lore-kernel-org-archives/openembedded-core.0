Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F17C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:12:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web11.9800.1667923947181410502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QBPBYAJj;
 spf=pass (domain: arm.com, ip: 40.107.7.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PZVDYf3HiP3rMEY+fKOlDBv5OdI0KTA29zl7KH1yf3tUzbcmA3Veyh8dn+EtxTTN9hSF598JUXal8jmq3p6VuK3VGvyTgXXSmtRU+s65AAwGB8JMtADUQAkODRfD+HsjpeNtSMnXm5LHWvgNgq2I/mBxERy1mj/KMVa5NYUD2fumj5F11ND5xGtZOF6wQRiMyyhrKDDVS3vGi3Qt6bSbeP1b9uC7B7n+BYZpWGHP5lMwtjyPclzwmfichiyGEISx67S3zBvAh7ziYMJrlAQFqIiEoWZL/srDmWWJ08DNj4lpphY8wQ9cfzLHb4AJER1WuWP0sVNlHyfk8YRKFMylEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fR4Y+RitKwU76alIxoAEXvewVYzmRVlxife/GjmcVf0=;
 b=KkWiShzXgAaI0GGE1kB0HQ26dQbH0AA24Oo8dfVEmTATXd1tlayDTfW3CfQSRuqf07j2Vhldutp0sqZw54dMSJ2/a1XtlskZ3vA9sXpcDNpZGJk73/yxCVjET2k4bdaAZ2MFw3BCmFVpGvmaH5OJl+KLdDbZv76QAloHzEk+v23JHXaCLYxgRF3Gc24GcGyY+hXFy67h4qZA0lFVrrRqPxK9Pq33raLhJrmdZ/JR9CjM1N9/ZNARG9kINvt2PUBD9m7OMj9TrJeDGnGsxVPq24ZvDrVTzZk6zoTdeVlA2I7phcdRliru+TEk2ccEDjW1bc0V0/OsMB8aTHJ6sj5bzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR4Y+RitKwU76alIxoAEXvewVYzmRVlxife/GjmcVf0=;
 b=QBPBYAJjalBfIp1R1HN3Fz6SzeghAPfiH1PZzCLI7H+mxjtGjOKhBI3x1yfcd8rZDVhB5zQRR12l1gjAuAyOifgMTSyPiBi57Qsm/qFmw5yZ+IVs1gquzJAzDGyDojL9vmlHkV7eSzUjPTPzhSe2ZJ4qEjqoL4asplzsM+JJoe0=
Received: from DUZPR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::6) by DU0PR08MB9371.eurprd08.prod.outlook.com
 (2603:10a6:10:421::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 16:12:19 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::e0) by DUZPR01CA0057.outlook.office365.com
 (2603:10a6:10:469::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Tue, 8 Nov 2022 16:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 16:12:19 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Tue, 08 Nov 2022 16:12:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1b2e9395b6d5411
X-CR-MTA-TID: 64aa7808
Received: from 6d21176d8744.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54D68132-AFD9-4EE3-8487-59EF95F01D8D.1;
	Tue, 08 Nov 2022 16:12:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d21176d8744.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Nov 2022 16:12:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw7EwVPd6rdM8sMOlO4V7/Jnce1tRuEDESXL8fNUGSgHXXjoEaP7mlKGUN5WI/e6xo73A0vrHnK6npZuNRPzUOtsP9KnL5uZuha1UXoxO6/YYM7CJH1gQ0aRuF+OID3Vpd3YuhM9nVCvFxRLO5H4XYvLHlSuJLBEXnbN2QrWsd6gAl6P0liYJm0ErZtymgKLKSTiiFIplusZ2mBz7W950JruaRmQPprquJeMv8CZIGBip6kK9mpc4idVdBC9PzjNLU8/CX3wJ3eaMHwGp0Teht3wt833DyDkOTp4Sv/Z6do/YMDQycegA2u8JdwKIZfobL5Dp52utIJiVJTgXQfmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fR4Y+RitKwU76alIxoAEXvewVYzmRVlxife/GjmcVf0=;
 b=U/4HMNw6eUdOt1/+Bb1/5btkLSwYFRyssx5ZRtW0GD3T/ItxTGQT9uoOacO4Z/cPCtvGEh5eqgP/AaJi/VLzgETgzVv3f/tRjX2DcqIyb5vkyf/bau+jV1X2tXUAMqGyoLXlvQA37W5yOusm5v21kPKlCsqHgEl8je11pjopqHOzMfxRgQLNPPrrQHWJsEswBxyTws04bjciNnDzRTsIXHzZz3h9Il9g5GWZ2zdLwtYvYIf5OjsemcK+twTc6ZGe0qyL9Au0JzSl6P9oSjYskgtZQVlnwS14a5eZgFRs0eWisZ+v9LTrnWblKiu3CrEMXAcKtw8vqXKKtx8ujse8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR4Y+RitKwU76alIxoAEXvewVYzmRVlxife/GjmcVf0=;
 b=QBPBYAJjalBfIp1R1HN3Fz6SzeghAPfiH1PZzCLI7H+mxjtGjOKhBI3x1yfcd8rZDVhB5zQRR12l1gjAuAyOifgMTSyPiBi57Qsm/qFmw5yZ+IVs1gquzJAzDGyDojL9vmlHkV7eSzUjPTPzhSe2ZJ4qEjqoL4asplzsM+JJoe0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5653.eurprd08.prod.outlook.com (2603:10a6:10:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 16:12:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 16:12:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "david.bagonyi@gmail.com" <david.bagonyi@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] gpgme: Allow setuptools3-base to be excluded
 from the inherit list
Thread-Topic: [OE-core] [PATCH v2] gpgme: Allow setuptools3-base to be
 excluded from the inherit list
Thread-Index: AQHY83YC4naIIfUGCEeQSOEiSQpan641MrsA
Date: Tue, 8 Nov 2022 16:12:08 +0000
Message-ID: <346FCA66-AC2C-4B12-B451-1367ABD7A6A3@arm.com>
References: <20221108132713.20943-1-david.bagonyi@gmail.com>
In-Reply-To: <20221108132713.20943-1-david.bagonyi@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5653:EE_|DBAEUR03FT010:EE_|DU0PR08MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9a4b50-060b-46e3-13ce-08dac1a4030c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yR3Uu5ODF2i7HKP2gqfZUigNIFlFW+2iL+eqxQPHU0mAeeJ/QoqqgE0d1Dtp3pffCx6khdUGNEpcCLdJQ1ErFl+44aA+X/ir8Y+Ov29BRt8D6kyFvtKowxzXTfpIMIG5h6zBpyn6GKhYBxc4he7Z/bMG6Ml2JM/ZMzY1pWUHt4A2NCnVfETAzc3i8koUFaRHss3EMbkQwceuHjuicrCMBHHIplocYTFf8kWFfzUN/jZ9Wd9HZdaeeUqP95QJvgfL/ZC4HkZ/zlyosMSyUVMgBJZIaswQ0keKKXmSj2ugisAHplB5EmcBxS0AVmx/H3CaAC7n7YphK+zF3tOxhcg+I3nPnOc1p8Cx2APaFZL0Pw/bYDPnE8QpCekF0mrbvGQuwM6nzq7P6rIY8f/2OmMiVS6NIg2S6H24Dv1EIGME/AkSGUdG0kRKgfhKUaczPk06vwypv8yajDPfHbMxwXPNaDq91308tj2j88ZT0L3UZCrgzTXCoec9esAW9csyZU9JQl6/GzRYTojPcQogApSd4C1e6ZgSwgmuj0mRjPwq9+2hHHm4293mFHWL+OsYfIfI6AgFbhBmY5YIXnfZkruVNaW4w1Nhm2N1hmzwqSfcaiWy1/0Ne0SLP6DjUQiXJwvswaS+kvu54IhRF9cuoOfCgsvQg/Yh8RC8OlVRX0VMXdBHbo0JX6jPoAqOL0eQ9tiYuzuBwz2X2SPXh7yC6enBbgQGHiVVdSg1GMFsrYoLQsqthi7N+ufiat5WE+wnAKrSpQDTX9NrTGa6iWz1mG9McVjt2ArRSYJ7gdWByj9Lee0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(71200400001)(478600001)(6486002)(558084003)(316002)(8936002)(2906002)(186003)(2616005)(86362001)(53546011)(6916009)(36756003)(26005)(6512007)(33656002)(6506007)(38100700002)(41300700001)(8676002)(38070700005)(4326008)(76116006)(66556008)(66446008)(5660300002)(122000001)(91956017)(64756008)(66476007)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A915AAA16F3CB41A4844A0321971FE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5653
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	747ed191-a8fa-4197-ecf2-08dac1a3fca6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vWuJOGnkioE+UAONUMmvJwCLb9gdYm4COZcVU6j9lQ4ZMSOsad8cIMMAQcLnHb0fFBq581cp5faexbspmdR38uQng7gVT28dX2ArsGaagPd+2dON3ypzlHtcGHPwJk8I5ykR0w15FYySs59ude08o7UvQn6ZLvlFKkH38Te3a65eaCGjpoDlyDTfl0zugx8j9yFI4g4BIUgiXQb70p8c5eEplVsWPmooMcst0zFeoTIJst1TkoBNz7MtWx3Y+2RVTHRPTPXxncqZU9+5HzHg2MLbyG2ciA2fkAQFzgACnY+wLs5JXp17x+QDd1scjIbLb1oE6mq77UuIADG5veVHfJBFQOV3xpG6sulwuymZgsx6Lrd2CFKdIhyWJPsFm0cCk0OCPF+c1qX70aV1hDdcZUF5RkfAU7Jrdt5uSeEftlGar+QcdkXKMmDhuBcPhtayi8k2oE85+EqwiQ3cRsLor5Li9RmK4Koq0V8udJE4f3PfX8vQ9wczqaWn92WlJXEGuEQFj0o5Lpudb2HvJnFlzLPpqkoLRSeY6Ri2HpKKDYeHPA6wgh3iEg7W5DuAYajfsv/WyhQFLi+z5E9G6kPyGiTLHxJvqp0gkuS/RgbL/R8nv9slA5H7NzfPzvn0T6JJfUVwy+SNAokI3GEOCNq6LUttxiTDXzReBQ85weZypIdneau2JF1hiL6m11O66AqFaB/LcBvCb0paiaL4XChMiUguvzuYO00zcnk5WqkNjAyGZduRku0JIUYuuUE9/k+fmvbbQ7fkrnusYiXaHcM+fg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(316002)(6512007)(41300700001)(4326008)(8676002)(8936002)(5660300002)(6862004)(478600001)(53546011)(26005)(82740400003)(40460700003)(558084003)(47076005)(2906002)(186003)(36756003)(2616005)(336012)(6486002)(70586007)(36860700001)(33656002)(6506007)(70206006)(40480700001)(82310400005)(86362001)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:12:19.6110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9a4b50-060b-46e3-13ce-08dac1a4030c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172973

T24gOCBOb3YgMjAyMiwgYXQgMTM6MjcsIERhdmlkIEJhZ29ueWkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGRhdmlkLmJhZ29ueWk9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gK0RFUEVORFMgPSAibGliZ3BnLWVycm9yIGxpYmFzc3VhbiBzd2lnLW5h
dGl2ZeKAnQ0KDQpTaG91bGQgdGhpcyBiZSBiYXNlZCBvbiBMQU5HVUFHRVMgc28gdGhhdCBidWls
ZHMgd2l0aG91dCBQeXRob24gZG9u4oCZdCBuZWVkIHN3aWctbmF0aXZlPw0KDQpSb3Nz

