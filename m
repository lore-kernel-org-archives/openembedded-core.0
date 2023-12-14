Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F734C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:28:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web10.18986.1702549721510119759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aLKDpHvp;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aLKDpHvp;
 spf=pass (domain: arm.com, ip: 40.107.20.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kpQprUmbjzDUY4C7gp/yFeMd10jE8tuXt1ZAUm+zsiE6pTNg5y9ngBsQMx/Vr+TvL8ATCICZBVKzcBeWn/tccAP7kJcJEJoYxIRkh0+8uAnC/aYZiodGDVj2/dA1Dfz+3RgwGhPt2VQEUQzAkKVYsipu8jrLf66gV+3SgnYqo2lXjtG7OXDUoilkLWQqLidPtpRLuNJvoiViJqjrbv92sdUsxhgwj22o9AnHsI0jxLiz+PP3pbn+2It3E295Qs+26HrKJsC+148/Rb4Rfd8V1hsWaF9dGW3hWDOcLsU6mFgQvECmVhtq49eWXqRDtEFnuEwJaiy+DPlleemaOT2AqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RvPNwaMXggYsJSB/4MwbzSyK8u+ym7DvZqHNiLuY7k=;
 b=g0L16E+dJnW+WQojzQagFYp6i6sODD7cRbl64ZU1gjWo+OrwqAgPl+8JhXHi/PyxCW1tSxRu3QxQfW5B6NbUEGlbyzMzjrQVH76FSmPJCYjB32hojxgbI2v3caYvonOzOu5jAwc3XY6FxND5ago5clI8+R2Cribd9Q3TR4JhQLBS7wmAyem1IlwG4xJRh3CzFGGxaNEvD1mHTDvrsEnFQ+JVcoue2RSt06LdPW4FZ66+OkG08N0hsoTZmCTo+GTaVpBFQ1GgZK8qDKbL2XF+ptqaJ1uuAR9l2DKYmpDU/FXj8nW40sgkylcwX9yDwitWNSwVA8zUlZGRGWISCT24Rw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RvPNwaMXggYsJSB/4MwbzSyK8u+ym7DvZqHNiLuY7k=;
 b=aLKDpHvpGeIC4tWZph6WMgdWieuckqfbICrw1YdmT/Sac0x1n1KtUGmJmjBURieRJ3zgv4kQSNYu0PGWr+nftpiDmMeW0KmQI+hO4pg8ah7z/li5cc7tDGjio7Fm+Z4QWXY3CunXZh1g+19j6DKh9flw0xVj9p0rVolAmXMeWKg=
Received: from AM5PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:206:1::44)
 by PAXPR08MB6656.eurprd08.prod.outlook.com (2603:10a6:102:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:28:37 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:206:1:cafe::f4) by AM5PR04CA0031.outlook.office365.com
 (2603:10a6:206:1::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28 via Frontend
 Transport; Thu, 14 Dec 2023 10:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Thu, 14 Dec 2023 10:28:36 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Thu, 14 Dec 2023 10:28:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5496b00f4a6baf0c
X-CR-MTA-TID: 64aa7808
Received: from 56cfe338034f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4F448F1C-01DB-4267-AE4C-569ACF92EA44.1;
	Thu, 14 Dec 2023 10:28:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56cfe338034f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Dec 2023 10:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds0lg4jYNIY5QS7iZCcPe1Kiw62Ult+wKHxTF1ZjBkroOYB+TB9wsAv02X+zCo8EsvAWl2kRsW/cNCB/9ywI69MzQ+M4r9JBZgGeV9rD9FKf0BksBYBqWRNxlSPO1aaZExUJ5sd7oVbLLzg9N+9qwfN0JPyiETEYvkO5FEveW5ccUCDSy03ke5G7cqpEqurzN+1US4UQ2cbtGrkk+2H6P0ss/WFtsaYnZnT7zRCTgyOT9Qq+PM5TtF4v9FnkhEqayftWMQf2wXlOMAKRMqM8tFdy1hGRPy3mPlnu+jSE/NHTNm/g6dXPxNwAgrk8rR5hXKtQ95yHTcDqsTq4AhXOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RvPNwaMXggYsJSB/4MwbzSyK8u+ym7DvZqHNiLuY7k=;
 b=MLz+nByrqR2YOhm2UjK1eWZqFtPDogL2tP6xPCAON0WM/uIO6MZer3edkhOHbc3vtBXFA/CE11TK8uN3w6sZ2WEYRXytix3SKxag6ApFbKdk4ol9t6Yj5HDdRdJHCYyewD8dI6MW7quPd+gjBaEfdigERWCBopubgayy02O80stciQpwJs1BEC+4RgC/DGz75eXML+08XNLj84uzDDHXH/AGvBrZ1Z7rt0FIVTVWwV1k+h93QC85Xs7wu6LcImQwvSk/J37IG6jL5y8e9NZb5lLAxM0tTZJeTL8ksYYDlntftL7WdThVrmQZH5+gMx3KVQGNTuN+S4IubnFxNCyQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RvPNwaMXggYsJSB/4MwbzSyK8u+ym7DvZqHNiLuY7k=;
 b=aLKDpHvpGeIC4tWZph6WMgdWieuckqfbICrw1YdmT/Sac0x1n1KtUGmJmjBURieRJ3zgv4kQSNYu0PGWr+nftpiDmMeW0KmQI+hO4pg8ah7z/li5cc7tDGjio7Fm+Z4QWXY3CunXZh1g+19j6DKh9flw0xVj9p0rVolAmXMeWKg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6484.eurprd08.prod.outlook.com (2603:10a6:20b:357::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:28:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:28:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
Thread-Topic: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
Thread-Index: AQHaLaijrqudKnIoEEKm7yVDXdYXkbCnP+oAgAFVPAA=
Date: Thu, 14 Dec 2023 10:28:25 +0000
Message-ID: <E29D8825-5868-4FB2-A0ED-B01299BBBF4E@arm.com>
References: <20231213094113.3981-1-alex.kiernan@gmail.com>
 <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
In-Reply-To: 
 <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6484:EE_|AMS0EPF000001A2:EE_|PAXPR08MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a7cb48-722a-47ac-3331-08dbfc8f6e78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Vs6tgdXx7I/UeKVypR6cUCwSEGU3zFxxbP4QKREqwzAxnnWGxHfGwItmJXLX8MfkIQxq/qbO2UQgcVZagm92hXI6WZ6OgwD/ueFikzuFEnOo+/IKczX/HLQw6gNte7m19ycwm+AsVIKjgL93GwHFKRDJ14TQhk+Avosoz4K05otHqE6jaEbKy9c1O8hq7amqWQbzapnpj6P+50izNWyoN1H8Kws6VwEuy0Xz1vYvUyjjezCE//xaWEYGwwlyERd8zZDGWm6a6p+1i+J3+WpyjfWXiyOW5Bul/wQ8hBJmtDdfVtjpMfK9lV7yaAeV1CiLdwA56kjlPq4bkWEoZw760E8gQh8MgcOEapNLwtirYOXrx+ckBNY6T2YXjvIZ/5D+tG3yQ4fRjasj05xBTikAGviEUAeWDMeIqtmPtTHE1biNZhY0jrjGNzIklB5tHbBrerx3vrChvYBsJJPXE6+FOeDSiIlre9jS+IRf/xJo2h6XnRz9uhheRXpdmp0d40e0KDGgmMiQEsMJHN6oyTTzUVxPE4TCcdmm2OrOpWLk63BXY3CFRGeiwy0hQLgCSZNZ2ZGX39i2VhW0nL96vqWgXYLX6ATWQTNELVE4fdCEQ4hBumeyCfUjj10VlxARmHuDskq3ckWw7hdj9WjuP4fpuQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(122000001)(6512007)(2616005)(26005)(38100700002)(8936002)(8676002)(4326008)(316002)(4744005)(2906002)(5660300002)(6486002)(966005)(478600001)(91956017)(53546011)(6506007)(41300700001)(6916009)(54906003)(64756008)(66446008)(66476007)(66946007)(66556008)(76116006)(38070700009)(71200400001)(36756003)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E4124DB5B2020B45A4B2FEC45580A936@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6484
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ad8dd82-d800-4c2c-ba9f-08dbfc8f67a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dLtIzCARo8PP9fiRZldBBLDRkryCrxH/tjWg1eluZBQeyma28HQ4pvn2DrtI2BrTqut05DfZV+xHG/wQrm8FTFZPUUi+kr/wz1uyXpWmOlb0GEqQ89D+ZqSR9dn6RsKVDFt5HJJxthzjycaxq1oSRTGQNp/NXzJpuDlKGxfHgoXHv/IJjtq6zE9cS/nP3JRf4mN458zaXZ1DwHdo5tNqqClhlqfaFo8okncegHh6ImGQdeQu77qkMGhIg4WB/7Y8FBjtTZbhYkNszuoFntpp04QpunacYcrPqniDrANUJoeVWf8z6k+aRk5+k2TdrNOpvjCDYwRRmO9ZVxlOMFdPm1PQZ1mGtfvNG3WlaTKsWe9bN8H6tsp9UGgzdNnGrlmRhj7c2sNLrlt6jfmE3XjvFIJliOiPHk9MHPo9bk8W2YjihE+dbq1+lWU/Mn8PRIhcOwbAUsJRYlo28klzlLsVlrjhSC/q7mV97PUibIeE5Qjto63T7dwN+vSmUKjf85ZxFJ+E6PxJuNuqkTEauS39cxpttJuGiFjqiailCiO3miiVFVKJupCyLUN3G4RwSwXZRICsDRGd6lTWu3EHUPCG3hb71ytFegGul2Zf5Uk+H+0C9HRl5vQ1c3U8JyIZAOBCP1dv4SNG8ra1zL+S5CcIJy4b7WpJfnbiOHe+Z+x3BLatqgK1zrPPR5WXjyH5rmrEp9A3o9JsJVytr0trowNnJ5io5P3ELkI6sBPUbs23DIU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(2616005)(4744005)(6512007)(6506007)(336012)(83380400001)(26005)(86362001)(41300700001)(6862004)(36756003)(2906002)(33656002)(8676002)(8936002)(4326008)(5660300002)(54906003)(70206006)(316002)(70586007)(478600001)(966005)(6486002)(36860700001)(82740400003)(356005)(47076005)(81166007)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:28:36.6326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a7cb48-722a-47ac-3331-08dbfc8f6e78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192347

On 13 Dec 2023, at 14:06, Richard Purdie via lists.openembedded.org <richar=
d.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> I've run this with this patch included:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4082

Same failure:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231213-s13b67=
oz/packages/diff-html/

Ross=

