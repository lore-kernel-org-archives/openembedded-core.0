Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C8AC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:28:09 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.74])
 by mx.groups.io with SMTP id smtpd.web10.16350.1686324479679121725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 08:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mqMaorzb;
 spf=pass (domain: arm.com, ip: 40.107.15.74, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG5c4PxvjtgacsYpcJQcijKPrJU3HZ0ogXah7Vn92ek=;
 b=mqMaorzbe++mQJ8NFrzgwSV2fuspBQB/tU57qq31pQ1R3YuD4VXUMSD4y7HsmX/87rsd/PXyr9sjiT3ID62c1BMpDyZJcrTWsH7W8qD7/WyPkTpd/sOUw/d+k559x7qSGlGp2C67ICZ3jEXEjwLRUSWy2wh2KSrlqMdaV42Db80=
Received: from DB6PR07CA0188.eurprd07.prod.outlook.com (2603:10a6:6:42::18) by
 AS8PR08MB10171.eurprd08.prod.outlook.com (2603:10a6:20b:62a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 15:27:50 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::3e) by DB6PR07CA0188.outlook.office365.com
 (2603:10a6:6:42::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Fri, 9 Jun 2023 15:27:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29 via Frontend Transport; Fri, 9 Jun 2023 15:27:49 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Fri, 09 Jun 2023 15:27:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f930855991b09347
X-CR-MTA-TID: 64aa7808
Received: from 299f2513730c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8BEA02A1-EBC7-4BF6-B5ED-A08F335D8A1D.1;
	Fri, 09 Jun 2023 15:27:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 299f2513730c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Jun 2023 15:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXPzP9FvZfbak5l2tNj8AQEZj0GlFFTEQKcuNPy2xWcg9NWvkzBbneHngJMq7vM9LipfAYNx8UGMxwpas+gDwslLHHaHVrhHPSHCSBn3FhKLGA/W/V/WTJgQDCbhYcLPsLBEKy3VPerzH/3kF61RJJN2YGU7XZrajcoOPiqPstdUzJ1KPnXK3u5eAPEOAAxafeBBEO+UHLCeQTW3VXnAQeItUjWyhO0PoNMmqmwqKk6pvUuw7YlhmFQYZHN2z5qGcAuvzo+BhdFsql7lCBDAbhpZzbciaGkG5VgVx1gOnr9urSOUZWVB0jAX58mmWD0YMPTP1ynxmwLskaYUe7VzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG5c4PxvjtgacsYpcJQcijKPrJU3HZ0ogXah7Vn92ek=;
 b=JRDoQSBvTTW/9zQjyfAFcxV9AUfjwxKDwJaUTJFWjwTniVCaRIra0t2ykJkfxfF9Uiy31xz6JH1GCGTClbEofjMi941F36WzQ+S6WLvyWhCp4gcVat+Mj33uxGJElsiu9DGcwynASaDWlbBSkfvTSwjxeRKjJdphho2p8IBr152D/FO06SN+4C/sGVH8c263DbstAsBloJkl7ocwMbEeIF0FNBa6bNpENkQljENXZ8S5JOr0BiJwvnOwMdPAVcM0z87TYUQ9kdPzDCswKvCCYcdSPU8QWAjGnF8gQjuAm3aqDo63lcGn7Hj9rBPsxFM6KkZYu4/zQqyEBf3tYHe3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG5c4PxvjtgacsYpcJQcijKPrJU3HZ0ogXah7Vn92ek=;
 b=mqMaorzbe++mQJ8NFrzgwSV2fuspBQB/tU57qq31pQ1R3YuD4VXUMSD4y7HsmX/87rsd/PXyr9sjiT3ID62c1BMpDyZJcrTWsH7W8qD7/WyPkTpd/sOUw/d+k559x7qSGlGp2C67ICZ3jEXEjwLRUSWy2wh2KSrlqMdaV42Db80=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 15:27:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 15:27:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "nikhilar2410@gmail.com" <nikhilar2410@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "omkar.patil@kpit.com"
	<omkar.patil@kpit.com>, "ranjitsinh.rathod@kpit.com"
	<ranjitsinh.rathod@kpit.com>, Nikhil R <nikhil.r@kpit.com>
Subject: Re: [OE-core][master][mickledore][PATCH] libwebp: Fix CVE-2023-1999
Thread-Topic: [OE-core][master][mickledore][PATCH] libwebp: Fix CVE-2023-1999
Thread-Index: AQHZmQA5u9xEmUzkTUWkC/IBgq2/3q+Cm8kA
Date: Fri, 9 Jun 2023 15:27:36 +0000
Message-ID: <DF12CA2B-2E66-4695-969F-9BDD54740349@arm.com>
References: <20230607052316.97944-1-nikhil.r@kpit.com>
In-Reply-To: <20230607052316.97944-1-nikhil.r@kpit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7382:EE_|DBAEUR03FT062:EE_|AS8PR08MB10171:EE_
X-MS-Office365-Filtering-Correlation-Id: d432d84b-e8b3-4be5-c070-08db68fe15c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +Az4BbEOmOHdojXWQYeHp5XnW519NC9RW7Cb2MrH65B3ETQzmv/uCDEYv9/Bgngz38lAIVDh5BWqYYgpTNoBSoCQK7fZnw92Zz5HaH9IKd1EOmM1/dYN+AWKmhGGn6WbYXxiFLxX/ozgmobuDaFUE/5pywxzb+nrlSIbTKnnnreQPusmqC7QKU0BTbK+5AmYDsUP31fdR30PgZzheBGAb4CCqV8qcYQXwJBPPSmChswaUo33ix7FNKDw31VPuvyHMhV/2NgCLxDrCrYprKwA2o1V+ep/XleG7tF27+JP2lHQokWWOaKk5alTp5pgy637b+4oGI/r52SORJ2qJnIoghTT8U3YosPELSdPiFmkM0GRfDNmmoDtcsoC+9BNRJh3fRPmVTqkm2AyAAoq/6YWLVQgV+MA+c8DhsqZko9INcgrl0ZYYdmtvny0Zpr7pQNvk9x0qfH3t31DMXb3PC8mzDTNEdbzW86LpljZDeqkFSMjHBBYx4iDj/60rTmLwFsl+uyUGSrWxu0VkShQ2AviOQV0xYoECqFG0OIUd00nGKm/vbRiYwK5liwU6ZNUDwkmb1Kh1eEnr7QwFHiPKXrx2c81MimVuaIOlhMiPq3IQJfnhimcjRQ47+YBdqNiMvUSS2XOfn71MPKqLVXIHgsm3Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(8676002)(66556008)(6916009)(76116006)(4326008)(91956017)(66446008)(64756008)(8936002)(66476007)(66946007)(316002)(5660300002)(41300700001)(54906003)(478600001)(2906002)(38100700002)(122000001)(6512007)(86362001)(53546011)(6506007)(186003)(33656002)(36756003)(26005)(6486002)(71200400001)(2616005)(38070700005)(558084003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <869DCF137A128F498914A82914DE980A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	da1dbf73-6207-4e7f-075b-08db68fe0dc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bi6Lfr/lfs4KNeGD/uutouyMjLrdO0NRf5Vfk0XzQm5veLHqdm+fHSey8m+AneOMR1npNR0rPdLLOBWurgYSv2l6oxdP7Ck/K1hJmeYMf9RV7p3adHMl0S4q9zvvM+8ck+n3VlUX+Zb1wDQkYJ9QEYhA/pOJQToj7IbzCxgLEZWZdpb8Y7sU8ip9k9y0SLb2Tc1o4uVTeAbLruXxWc8xhbwbA1RgvamBGXV/tcFvLDk32xs40fC7mbK6K+5HdkGv6mLJBT/e4+0ZnT/TTJHrO0aLofqDaf3xf9GrA6nfX9IdMhKqQYLdCF0TWO+I5jl/3aIbcQlI7GXW5CZ+OttYehrZfGQwjHgC5E7CsR/acJUZJ0EJPn2+/AYK5wGSzUdKjwZCtpHtM3XDGiK5ig/v2mUvgpNQz3SIL/U6llBiO9GRckBiiLqeMVocg9gIkpzrOMTOvHC9H5hFekulMuQCDuvaKkTiFZblgo+hUSBXTKkjXryEb3aTY56dIhljozDauMMrGg/m9imBKXSoCUR2/saVrJk8nggWrAbhcn20g1h3+5SuroRGV2CIQsJcVU3Zd8ClhQ4NKIPbBTInb1CEdzUZAFZiFTFhThR0r/JmohB7U7ZPHBylUhYTDGQbYOv7hYfUz115DH/Oaa47bTCYTBNFWbF/TFRpZRMvKPZXcP378g7NhxpFVsor5Mg3M8SY2dt2gXPbkLJ3VZThQjW48wKXac/EA9PuxeANWAhfvMVfBXfiJaOLqddAdee8VxG/
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(6512007)(6506007)(53546011)(107886003)(26005)(2616005)(336012)(36860700001)(47076005)(186003)(82310400005)(356005)(70206006)(2906002)(82740400003)(81166007)(70586007)(6486002)(40460700003)(86362001)(8936002)(5660300002)(54906003)(8676002)(36756003)(478600001)(6862004)(316002)(41300700001)(33656002)(558084003)(40480700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 15:27:49.9582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d432d84b-e8b3-4be5-c070-08db68fe15c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182562

On 7 Jun 2023, at 06:23, nikhil via lists.openembedded.org <nikhilar2410=3D=
gmail.com@lists.openembedded.org> wrote:
>=20
> +++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb

Mickledore (and master) have libwebp 1.3.0, so was this intended for an old=
er release?

Ross=

