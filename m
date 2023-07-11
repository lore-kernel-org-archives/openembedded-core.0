Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C7DC001DF
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 12:48:09 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.82])
 by mx.groups.io with SMTP id smtpd.web11.6775.1689079679140673721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 05:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=SsqkYJq3;
 spf=pass (domain: arm.com, ip: 40.107.104.82, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLG+aoY+ji3VrtVMv+KFtmnPN75i09vuth+DgRsCBys=;
 b=SsqkYJq3r6TiNbgo4/GeUfA60+2EFCCyedLwxv6rY2oOfFZja9CZvDgvRINJgwaQ7fXC4lnOv0g9IbGV1Y8gXMVaTEysS2uPtybTLVORj/rbdOyETdPUlZMyBpWabr6Vs/BGUPkIyHxX6Wk4f5T12B+rs/APh3iq8Suc0Sq1ecc=
Received: from DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) by PA4PR08MB5951.eurprd08.prod.outlook.com
 (2603:10a6:102:ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 12:47:52 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::16) by DUZPR01CA0307.outlook.office365.com
 (2603:10a6:10:4ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Tue, 11 Jul 2023 12:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 12:47:52 +0000
Received: ("Tessian outbound ba2f3d95109c:v145"); Tue, 11 Jul 2023 12:47:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b0204752aad9e97
X-CR-MTA-TID: 64aa7808
Received: from e1297800e339.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 88FA024E-2F99-44A9-A8EC-81596C3076A1.1;
	Tue, 11 Jul 2023 12:47:45 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1297800e339.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jul 2023 12:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z46QnXae940p0WKAmuUYoTGbbsHKftwOCdJKg+q638rpqShsRP11bPo/s6UXOpcLC6TClDahlbJbhTGX2y3sg2euf6KjLR7jVK1TtR2oIeeLagGc5bGtZAE5YTUiCuQfgJFniqql6j2xx8CvfqoxrWTU8YxAI0ZzVHgrm1TPpDubj5R2fj6qJiTb7M79JsxAzwdGqs1hqoiGdrxU9TrgCe012GI4loKVdCPmPTmxoNvMcjh2v7YUBtI/Z+1CnA/t+bpaV/+fPmgxGXIOY9BgU2Y3tlANr6AXUL43QX+sSW8tfNJLYx2sOJ3/r4zxxwjjOozBMAbfnECFcq7Yr6jYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLG+aoY+ji3VrtVMv+KFtmnPN75i09vuth+DgRsCBys=;
 b=YxsFrUi7yA+GlCu+MQrHmcxNw/GzgCxz6kTIarz8s5GnYhw4bNaU7BlovwHM459QZGewjUzRvuell6W5GmLFV9CmytHZRMFCGQ6rHr1dCpL2XHoxqHTfSn/gDNvHuNb4yMSSAm4ujib8SJhXzjuOiLd8zN/oFmwPGo2GSIR+7ArIKGSJNxP6c++F09s1YghHAOalk0KyXZTuZQYaJwqcUXOoNKrabhSNe3KjpZmyZcqjdcAbI0ExNam837Hpn9cMxA6aqes+gIK9SVYcCQy9ODkp1ZGUWVOyRFxhBzKgYbszQVcGoKsJ1+qW6I4W5lvnHb/WMHDCcEOsZvep3xIFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLG+aoY+ji3VrtVMv+KFtmnPN75i09vuth+DgRsCBys=;
 b=SsqkYJq3r6TiNbgo4/GeUfA60+2EFCCyedLwxv6rY2oOfFZja9CZvDgvRINJgwaQ7fXC4lnOv0g9IbGV1Y8gXMVaTEysS2uPtybTLVORj/rbdOyETdPUlZMyBpWabr6Vs/BGUPkIyHxX6Wk4f5T12B+rs/APh3iq8Suc0Sq1ecc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9502.eurprd08.prod.outlook.com (2603:10a6:20b:61e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Tue, 11 Jul
 2023 12:47:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 12:47:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: "peter.marko@siemens.com" <peter.marko@siemens.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][mickledore][kirkstone][dunfell][PATCH 2/2]
 cve-update-nvd2-native: increase retry count
Thread-Topic: [OE-core][master][mickledore][kirkstone][dunfell][PATCH 2/2]
 cve-update-nvd2-native: increase retry count
Thread-Index: AQHZs8JA+ICFvAOS8US69VuUaYqXqq+0awqAgAAYngCAAACMgA==
Date: Tue, 11 Jul 2023 12:47:43 +0000
Message-ID: <811C5534-591D-4485-99DF-1A0CF3E4C84B@arm.com>
References: <20230711063629.7627-1-peter.marko@siemens.com>
 <20230711063629.7627-2-peter.marko@siemens.com>
 <A4D67F2A-877E-42E6-8843-4328749A6F9C@arm.com>
 <CAApg2=RG3T_DkJi93jL0R-L28b9r4Yv7EHD5T25jkWCtAUCP2w@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RG3T_DkJi93jL0R-L28b9r4Yv7EHD5T25jkWCtAUCP2w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9502:EE_|DBAEUR03FT030:EE_|PA4PR08MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3dd801-41c4-43c9-1403-08db820d0a95
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 D3EKAgW1POhK+hts3qDJS/5J6jAdOU2XjlOIN2s6D9khMXyiAgDww8NX0pF6B1AGqvRPoNjt5Jr8HQPmWuoSgGJIJqk6ODaOJKfnGEmFLeZZYQ4J/Z9HtebvxBtt2PkSff1p5CnvHIvnUQx6Yc8TeLkyfuTUb/rVO6tM/YzZEL+uFz7e4qNZKMfZ18yH8IiB1iOmmGBrnrNp3SnXlfd1hFPmJtYieRvp5RjA/RUhZ4k+TajQTTDO5leK1CdBLRXEqGu+m2c5rEQSEGLZiKiYwR/N1N8D4AkIZCe6JpU5tt+joJ4welYnW6Gkw1WiQu2knckvvkbO5HgxThmalkV8F4p9Oa0HVSH0Hw2y9GSMv3EduC1V6fTYad2ok0YyT3JDRk4hqe0QDxbEgyC1LH/RMx2oiTtTVPEGV3gPz7osqt35dEY92fcUODfyWWjzvqM5dJ49EwRgfaDHKcvTYkMcQAzL7Q+SuYqB4g20ei0MBI0BMsTgYVyMo4tk3sMGbUUf6a9GfGULJLP6Dmhzc21UWS9DM8YhJnQvK3ygoz5xFI3KrM6cSLU2ceq8wZQeF4Aqqt0d1zJWwcTWeT31Q3sDcpVF8Xe0S71000adEVDWal8cAK1rDrHnF+f/UzF/C+iSaGKSmKav3X7gQspi35p9ew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(76116006)(478600001)(71200400001)(91956017)(6486002)(54906003)(2616005)(83380400001)(33656002)(36756003)(38070700005)(86362001)(2906002)(4744005)(66946007)(26005)(6506007)(53546011)(186003)(6512007)(38100700002)(122000001)(8676002)(316002)(5660300002)(66446008)(66476007)(41300700001)(64756008)(8936002)(66556008)(6916009)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8A03C9932A8EDC46BCD15CC4913C9E5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50a6c76d-7f7c-4d2a-ce75-08db820d055e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v1K39nVu+H8jlZ2PR0APiUoEBsXsofkEyUgAE+4Qfi1ETwlq9JDxDDWAFAaGPVU+aoFpaCmUT24rYvxb8hHk0meNflRFum1hug6Mj9e5BwQIxV7meCOLTbqiPrmHqhSSec812abie+vEboQjUSbzCVsnVsavt9iGFP4FjTnZP74kgpU7tfjj45z9npDPHohOXKWP4L+p4Diqqm2Xqgy2K8sElWxbrfT6O+Cwy7U2ljs/BktcM2xO3tdzWuDu/+/YxQ4FXdpWyVhWhUX9SSm2WtmKHleEu3ZBXdrHgLUFoDje3QTLyVux4L/6z4c5Yp1LNk0inXsCOMvsRYhmV8vVwrrQ3LyYK3xjomdyQXCKJAlh7HoFXW/YuT6+/qt56EHeM9qEeqXiq+QohU9fJA/+ecxVkxaz/84I3fh7a6nN92gMZPpMu/uplL/AVymTfNyvZeieqV/dnwLhmRHtG75B35q8AHj6ovmMTVxvXF8YwWyIWwrLFtsxflptXONE4C2CPMGinEE+dv7VMA1JEp/nSRn/QHP2flYX98nrGy5dg/u4BdjW8f+Vus9eceLHhp7KFLbQh4Ogdpt9rcTp4k5AFyZ+MkF5oQ80rOMMJIGuqmwu0kXwMXI1hgLjVqw4phWCgnKqEaoy1Ld5dEkxfva6a4NXJlOa5inlWf5hbvM8fiyxtTPIbSMsyH/FYsalQ4ZC4KpxRMWE0CynExf8UXHQbGEZyEpIJw/0zYO8Xzder4fGF87VvERIgSlIr9oKiWPQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(6486002)(4326008)(70206006)(70586007)(478600001)(82740400003)(356005)(81166007)(26005)(6506007)(53546011)(40480700001)(54906003)(41300700001)(6512007)(316002)(6862004)(82310400005)(8676002)(8936002)(86362001)(40460700003)(5660300002)(186003)(33656002)(83380400001)(2616005)(2906002)(36756003)(4744005)(336012)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 12:47:52.6785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3dd801-41c4-43c9-1403-08db820d0a95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 12:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184135

On 11 Jul 2023, at 13:45, Marta Rybczynska <rybczynska@gmail.com> wrote:
>=20
> Peter, what is the probability it passes (for the complete download) with=
 those settings? Is it every time?

FWIW, with my testing this morning (I was just doing some other tweaks to t=
he same code) I managed to get a complete download every time over about 8 =
attempts.  Every log had a few 503 errors in, but they all worked with a re=
try.

Ross=

