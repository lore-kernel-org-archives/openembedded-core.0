Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25A0C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 11:43:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.85])
 by mx.groups.io with SMTP id smtpd.web11.4880.1678275827481639244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 03:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jZq3/dO2;
 spf=pass (domain: arm.com, ip: 40.107.7.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzYeaTmtGfoNVcMhozl0XMrP1MiTOcq9vKnPBFzdRYw=;
 b=jZq3/dO2e6zRJoBlNmTPcz/POvAdC72ncXWi1WHDyzuafjFg5NYAqtPS8M6G2Z4pmqLNBZlfqJ0937KnPjc/Pmmgqy5CxFTDD37dE166/0TFPhHJsEadxtaA2gGFRa9zwq+h5NlpmT8IEM19uy6zl+pIEVZpwdehvCtgZc9j+Uk=
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by DB3PR08MB8986.eurprd08.prod.outlook.com (2603:10a6:10:42b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 11:43:38 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::78) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17 via Frontend
 Transport; Wed, 8 Mar 2023 11:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29 via Frontend Transport; Wed, 8 Mar 2023 11:43:38 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Wed, 08 Mar 2023 11:43:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39a0ba1bde574ae6
X-CR-MTA-TID: 64aa7808
Received: from 8d975914ad19.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7E3275F7-26BE-4140-9570-1CDCD8D78796.1;
	Wed, 08 Mar 2023 11:43:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d975914ad19.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Mar 2023 11:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXVtzct9XvQQuXN3OrhbcbRrWMwrcOt+ya5xib6MYiH9wH5OhczRIs+6O3Ua4kmueniY6Qde0SYaHjhbccgwZYn2CTRUIL5EWiM7GDIVZmllIvnKNwqx34SGc0j0eP46giYJC9MULkhhc//BnXQosIvGEF3kZHoeNLD6qw+FqHkhpiFCKRRqVOQ6RKT/5tRF9u7cMTw7muHrQ7+8gRy5PlA7H7duUPEHNF5YQmyJdtuqdEYHsKbzCo8+Tx0xJ196ciNuZ6ovEYzS7wVoH0/pMg32hsPZBK7IJRh4qiQzIjebhFFhq9yQdHC/lbYfCP8YLI14vAcT0O4oUTsjah/Oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzYeaTmtGfoNVcMhozl0XMrP1MiTOcq9vKnPBFzdRYw=;
 b=KnT9tviu7ylHYLTpspTcwG9W0mgUswaCMunP/9QCqULFe2sgKism5KCe09OgHbG1Mrvu2pmP+zlsPVafE2MAMYQYXqRU9XJrXpaWB2Wun6fAMTTUDhZE1tBv4hD84k4hagWlzCt3gdZHGDbgc+VOFwQ98z3K0U/YEjUutc0hWhOIaZ5GVo42oxsSDYLGGT6XjONKpvZHVdjPdLjY3ACbLAQgwCfuw+goWkQudquj2BKu0pDxbMdkiwEoaYLoKzjA2jEL2juaVm0Qg4fqepyMs6aoS3nbDZ6o5wNq68EKpFfDk8JNVEtWyaeg44ZRhHy14rfzinDEVwjK4eeF4a6uKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzYeaTmtGfoNVcMhozl0XMrP1MiTOcq9vKnPBFzdRYw=;
 b=jZq3/dO2e6zRJoBlNmTPcz/POvAdC72ncXWi1WHDyzuafjFg5NYAqtPS8M6G2Z4pmqLNBZlfqJ0937KnPjc/Pmmgqy5CxFTDD37dE166/0TFPhHJsEadxtaA2gGFRa9zwq+h5NlpmT8IEM19uy6zl+pIEVZpwdehvCtgZc9j+Uk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9688.eurprd08.prod.outlook.com (2603:10a6:102:2ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 11:43:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6156.022; Wed, 8 Mar 2023
 11:43:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] python3-ninja to speed up cmake builds of python
 modules
Thread-Topic: [OE-core] python3-ninja to speed up cmake builds of python
 modules
Thread-Index: AQHZUQdhNMHEKiS1FkGlONC4qhEyKa7wxEsA
Date: Wed, 8 Mar 2023 11:43:28 +0000
Message-ID: <1E9DF585-4E79-46C4-A07D-A56B46F9CB10@arm.com>
References: <ed526f1f-9ef4-5c46-1ee5-7eef641c9684@gmail.com>
In-Reply-To: <ed526f1f-9ef4-5c46-1ee5-7eef641c9684@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9688:EE_|DBAEUR03FT020:EE_|DB3PR08MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a1418d-3e7a-44d0-3337-08db1fca5be2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pYDGEgnF8/y/1CXZvpsOp6RD8IFpqvJifH7c+Cg2sieOGXzs+BUG9culSNrdNJDIiXipxnid2U27phuc8T5I8MqoHNczdOVCBjfF/mT6PA7x9TcEsJPQPyCK1nBAuhZJivfyI6vD0c85xxwodQ+BMcHBDG95QN1336NrCdeVYsyGIIz2+uGOJVxfY3EoCkhnIHle2mvWTaYJ+Y+qzC++P6wX9x8mktkcwfi7OEP5cJXxMsciHqjAkMAu8J0Qe6zsyolL7Bw6wwP8Hwn+u75Omiz7hyfEsItK11jqoWyWX9Q43BFzHvjg3lNG6GxmLXQ844vOXTpEB3XJt7vSYsrsYZ+aj1NI3+JT415QrFq2mtwq7umgqdb0duq7Ip+YE4Rua1kBV+QInKHRD3ZiSVcY2YSLGuWSR/cvMdGxXzYBiUEF7kENW2Y8F1faJG7GDOwifNJbE4eQW+YCq3bZJ5bE2pqshVNccgNZsNfZ0hLlDuYjaAWI66/5DO7U8xI5MrBLtJ2A49xm3MmWoiyKJZboRrZEEn87Vu4VS11O016GRXZL36L0FWMC/DQv4RLDWvSl73bTGqTMj6ANUFswMSbjfK5eJWqzkVDYHKuR5+ot0Unm0THHJwE533E8xC5dEWvo9kotBUemmr+gMrmZean1ecUQMsKbEj/MNRGpQwsBVIUP41wjgEID9/Fu7yoUV1xO0R1U0qxDWcfk2z3QjooZ2Td17r5dL0l/TBiodOU09gI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199018)(2616005)(71200400001)(36756003)(41300700001)(83380400001)(316002)(86362001)(33656002)(4326008)(76116006)(478600001)(8676002)(66446008)(6916009)(66476007)(66556008)(8936002)(91956017)(66946007)(64756008)(6486002)(53546011)(38100700002)(5660300002)(2906002)(122000001)(186003)(6512007)(38070700005)(6506007)(26005)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3C03F5746AFFB24E8C8F928D2E192243@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9688
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bae4cd37-66db-40ee-59ca-08db1fca55f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	80ANCdj8M9Jhur3LTIG2XBLSyaZuggMAwaqNy4RXGLw+xNPlcFXu1KBALsY/2D6zJmzR9fTI+Ep53a9mZ8Tv/+cp1xuvtFOGmTmf9XRRIAVYMWEF3w1G0nKM+JBPHOi4d9ij4HP/0Hj5+IT2ysh4ycvoSj+d0tqgQ5mJzeFuPDi6LD5vQ/qf6XQjSxz39vm2e4Y3deX2oQIcOjbYVrJkN+CzpnNj9gmTmGnjYqWX54sTkgi/2rFSVpLoMDzkQpf8PzIsX5hyIN5MHyhLp++nZ2ZdZIlnKK4p+bSVL52rXxzyhh2Za3q/HEl3N/T9j61okak9viRhGzX76l96xouLQpyF75GXyqqMm3UvtDloQ51kQ0QZlGi19la9O0qhcomVTJU9+PZe6kXTfPwLWpVvXE8MoaBbp4O8vjz5gFUWF76lScLBwJXmulrDfciQGc4AglrM8Rras3QRLCc5ryehdGREPZA0uNxGGURAgmBwHfGzgFyA2ONKQuouP5DNGBvUkjx/4PwIPHFgWZQjtsvh26ZnJS/8t7cMIhNxCuJfwJIxpsAeG9QbkM8zG5krqMydiEYP3Si/5u3bNUsV5BNn4xziBtpjXyWC4P/bu5ePOgrLeDkKsNVZKQhrNQ9ozb3DuxXD5Sex/c5fTPjpioI8ILf6KME7q6mpXBd083YZ777JpL/mE8fAtJPCOnpsNdk9K3phOAnyNoEZAa/WGsq0Dw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(41300700001)(6862004)(4744005)(2906002)(8936002)(4326008)(70206006)(83380400001)(8676002)(70586007)(316002)(53546011)(478600001)(40460700003)(6486002)(6512007)(33656002)(6506007)(47076005)(2616005)(336012)(82310400005)(86362001)(186003)(81166007)(40480700001)(82740400003)(36756003)(26005)(36860700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 11:43:38.8462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a1418d-3e7a-44d0-3337-08db1fca5be2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178167

On 7 Mar 2023, at 15:13, Zoltan Boszormenyi via lists.openembedded.org <zbo=
szor=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Hi,
>=20
> Recently, I had to create recipes for a few python modules,
> among which a few used cmake to build their C or C++ pieces.
> I saw from their build log that they complained about
> the missing (optional) "ninja" python module, and falling back
> to the traditional compile-one-file-at-a-time method.
>=20
> Do we want to speed up building python modules that
> exploit this or using ninja is too rare to bother?

Ninja is used by cmake.bbclass and meson.bbclass, so absolutely use ninja i=
f the build supports it.

Ross=

