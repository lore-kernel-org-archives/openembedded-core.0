Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DCDC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 15:45:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web08.13198.1656517506408666810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=cRULbr86;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zh1ogYq7jG6Zn5EFTcNGxIIKlcRkaDeT90rxOCHav+HHlJbIhvZQLsIOP0PIJlZVFJdHDIv+Xso6l2JgayvkFBgGk0U+nBebEtWuerHhT9SZdzsPz8zfXYnD3duS2p8P3OU0Gr+2wjrSSzt62Igtjz6zhJDWWC4JW/63ciOEdtBxgx+Th1hB2fik7tTlHjE0a9uPWmBt7rIjMIS9yXoJDXB32KJ+hX6roTKXRXgL+YhUiohbE1IFBkMjH7Ta0/VOtNd+aHCZA9E1Pi+19+ikrV0v+04+PsiNyWDRvzo98isx6u8DMcQ17OL32p8JHSZXydo2MzMgkgvyFicvz9prsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSIzJrIyXtpUpKBLTCt7RJ2vMZUatgPkDlmFYVqvKag=;
 b=gwJ6r9ZQOZf68jTalOcWYSwhr7qnqDmFlmPWVlFoyHBXthyy/jl4j0uPIsK2F9QFj4sFKz9Km4e9IPHCsYsTdZ9jtlKqB1f8KbEmTTRp3Mkl7iom7qh4GJ1QFJc6N4gVKihsw5r6BcnHxGmG/A6AHT50ZySxEcW7W+oZPysGf8fowkhpA9UIBuflesHP8y7R4TIhovHYCGXv3x+3/m92dqDDG+ewlSvKhbF/+nISkUu7R97iZ04+sGDa+p/cUT6e/VnslgpoJBw/IlMfqnYd0ENGVwfXaAB/xn2UdSMaUbr5BCLQItwLRhLjH19rkOBv8yhJM5DjARwxykFJpTrroA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSIzJrIyXtpUpKBLTCt7RJ2vMZUatgPkDlmFYVqvKag=;
 b=cRULbr86nbbPDn6lyFbqMz/wkB7EBN8lys9MfJtlHeTADWaVgwlJE8GRc+eNZ1k+5tsMWZ44SO3dV1B+iAntjr4CDDhmN7qay4mLoOYGtEDRNjBVXvgW6vmesTd38kpyTIWmSJLrfHfRyysgUexCL4VuAymtqYx0yX2ClOy3HiY=
Received: from AM6P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::16)
 by DU2PR08MB7286.eurprd08.prod.outlook.com (2603:10a6:10:2d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 15:45:03 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::a7) by AM6P192CA0003.outlook.office365.com
 (2603:10a6:209:83::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 15:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 15:45:02 +0000
Received: ("Tessian outbound 9336577968ca:v121");
 Wed, 29 Jun 2022 15:45:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bffecc21e10f9c5
X-CR-MTA-TID: 64aa7808
Received: from c305dde3ed94.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7FB3E2E2-EAFA-4991-8C89-52AC8C320773.1;
	Wed, 29 Jun 2022 15:44:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 c305dde3ed94.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Jun 2022 15:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrbx5tmsIave8h9NUzAuVvY72WeNbCL5ZMv5VIuUfhFNXFSGrp3YVs2SNirpPByiGIaI+oNU1eS5eLIy1t1KtQTPXpE4esAAUU9YkLH/olN2bD3/PpmpUsZPqq+7VaykwyeNIsjtScumwyHxAQgAzXY1+8RVn5dgtkXCx+3XRvcWHPpJO5+fnz9N2B2AqIm9NpCeTPVsQ/xxsg8eWPG2pB4UIVxpGTh7qRVolUcIW4BtqOGWL9RMDoZ/x7I83PXtz9UoGDGawhTwk2ktWL7PV1iJB+/XU71TZIKHfVFozWWTVKW7YHeW97oWrJHrIoBD/q8R0FtihyXsin98vkkuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSIzJrIyXtpUpKBLTCt7RJ2vMZUatgPkDlmFYVqvKag=;
 b=NJHzfEetbIXC8wWxP+oibyAd9tlcj7NLB9rDXuVn0xEJidmWtSM1TQlAoCexdn3cGcOo6gzsDad2UjGQ+mCvVFqrUCkLoDTA0wVSOA+lFVRRo9d/FybvK9khtfMnOPB/T8SinD3fygsiJm63kEE5VNTkpT0FQUxCLd2vDa941K7d87+I6icaQZuslG9YipwB42by5d3aNnfoDfU56KUEHEBxxnO3CdnzATh/Uz6i8+pxpaZPTYs0n4bLJNf3cdc4vb4oZvAfezaPkJ7FrBBM86ln+lXUcJ27ckfPdeDSqsQV1RErULmxanwJQhlLEBFA60rqmEQc2OYJ6SdH8eMGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSIzJrIyXtpUpKBLTCt7RJ2vMZUatgPkDlmFYVqvKag=;
 b=cRULbr86nbbPDn6lyFbqMz/wkB7EBN8lys9MfJtlHeTADWaVgwlJE8GRc+eNZ1k+5tsMWZ44SO3dV1B+iAntjr4CDDhmN7qay4mLoOYGtEDRNjBVXvgW6vmesTd38kpyTIWmSJLrfHfRyysgUexCL4VuAymtqYx0yX2ClOy3HiY=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AM0PR08MB4385.eurprd08.prod.outlook.com (2603:10a6:208:148::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 15:44:54 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::a5a1:150b:2203:ff34]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::a5a1:150b:2203:ff34%9]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 15:44:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: Sean Nyekjaer <sean@geanix.com>, OE-core
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: hook cleanup to the
 BuildCompleted event, not CookerExit
Thread-Topic: [OE-core] [PATCH 2/2] cve-check: hook cleanup to the
 BuildCompleted event, not CookerExit
Thread-Index: AQHYi8u7qrNmjlKtwkaWJm9oBq7CIa1mhsAA
Date: Wed, 29 Jun 2022 15:44:53 +0000
Message-ID: <137E539F-E832-47C4-B81E-4D9CE3E2C3DE@arm.com>
References: <20220629151519.1179173-1-ross.burton@arm.com>
 <20220629151519.1179173-2-ross.burton@arm.com>
 <CAApg2=R5-tfzpbMzKevZaPkzVd=BOnJpu-QOmdSFAKXxxThdzw@mail.gmail.com>
In-Reply-To: 
 <CAApg2=R5-tfzpbMzKevZaPkzVd=BOnJpu-QOmdSFAKXxxThdzw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dec3d5d3-efa9-4bb7-bef1-08da59e654e7
x-ms-traffictypediagnostic: 
	AM0PR08MB4385:EE_|AM5EUR03FT063:EE_|DU2PR08MB7286:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BTRk7EyO6M3gmFo/beXansMnSJqbLjTXVNjWuj7Y9JqOrLs7c7GFQ7abrSBr9rWqIMCtpfB90BUR8aadWG+d15pYW+TWe65leE1MSk3Lqh72TsuAVzfCOwh6yJ7DcZnYFq006idB4LD3UR5OxlEQrOD7BWv4dmikW222ljn3mifS3L65lAUOG/XEE+q2hKebzS2/rYsixIZ3IrLPoV6dUe/DRaCUciT3vFvGJEhS1ZGPvs/SjGM/LggaZRZkMcu2QtBL6Smz5AoC9T/7it+UQtim2gpqA4JEhmYZmMDNrVNu1lPVnzdZH73lnvsoUc/UJD2/GkF2lVC70qRbZtEdX2SuA8/rG8NT72RTTm04v/pxoHsaL3gmJJpRmbYObtR98Mrv+SpS6vsdXK+tTChzkiX69H5/7OYDVGu6sv6S+CwW87mbWkewvxW0exwoWLYJ/d2JpoWKLnk+NY4KjWRvX8gGW9uQj7XYm8Of9PG+pvFr92PCgdFmE0RSHozQjwvjCI5ge/zammCzPecKSSbEXD6l0WHRDmyi0nun6OKGbah1m/zDJBhlPSu7SmOZlvdGdVoJ9zeKY49NPkMLbLQpHI8sR5ga8F3nnpUoMPIRLFhz9ECEjLj+Nh4l0kvzQPUxRinPnMS0RePkpfXu31MPxt6l7ZksPKsgYF9e2yfOtXukitMWYnZ7qZ6w04BJ5xvzjB20NW+q7r/VRi5S8BaiahoDkP0Vju6k1lQ7bEP+pJGHk9HiRYH23F1wGF8rofNIy1ey/W84m7XZuRiheV4yr3ZKp18wREqS/y7G26mZDAeQ3LZPKwZ0/rcLBk/Gr8cPPDum6ruFMGkkXBsOk7aM6g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(186003)(33656002)(6916009)(5660300002)(54906003)(8936002)(36756003)(26005)(41300700001)(6506007)(83380400001)(6512007)(53546011)(2906002)(2616005)(38100700002)(86362001)(478600001)(6486002)(71200400001)(4744005)(66946007)(66556008)(66446008)(8676002)(38070700005)(66476007)(64756008)(316002)(76116006)(91956017)(122000001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <329F63F340800C47B581AD83B7FC8C2E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4385
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	327be82d-ce75-44e0-509d-08da59e64f29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ht0XTb59FhJ5APY0mG4Y5tpSdx31mIJj9x0iiUUrfVsXV4Qmshr4xl/3woQ/K3sP+m+muiwMzD19f5XDG5kJ7rey6bwGtHvEJFLnpBh2TQySZCFM3nrxaTCmgvQ6BBICtpNBIHXYgXgvgta6L6BfGGfCq8aikPBIJ1N2oBCnwg5s0YyZrEtV2fNSNTGM9pTwRZMVs00h25DRnFa1ElZ5opgK6CR3YCkueyVxfbaagVaoVVzQyeziTXhlo6cLR4kSHp71nYOuo1G3itlmrx/qaMoCpHt+bicjNDK7c/3fy8EiAZkK+7oqYawdpQdwkyha5SMFklhiCPjTPPMVVkZyqP5CXSip2aDvzQlUCTIjoBt1LkcXiDehg/OjwcYcb1vXBAI4sfDWeYn5f5JCZFBuuk1Mxz//+nGMmDNEsaa9vBo8oCHmWdabI57KqUi5DGi89Bj3bRYtYiC26NZgG2xV6wiynll6HMktEb5jFA0WHRa1HQzOBYQzUbPM+FnR585QiN5fDgn1MIIMaeIDTd+ve7PV2v6uoCB9Ulc7B7srtm/TghbmyI69P40DSvawwkwatCXI3fe1iiIB3lcjDKI6TnRlviA869Z80d4eGDgTxVefV2pZZZFRnsaAh9h1zoRPc1Y+MR/49g5WZn1KDE6ymd4WzAe1QTiK9icP1rWoF2DpOpWIiYHihUunbOf/fWBOtdfckur99jo70PoUCSWwfkuhJ5uFcb9RWFK5iwY+PKpt6QEtxl+MaCCiipFd+z4hphHUYmRumd1GCJh4xuh2LHPrk5ccjcmcKukZP9AwlhHCX3Q+b0za5qLcx72THJrZ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(40470700004)(36840700001)(478600001)(70206006)(8676002)(4744005)(81166007)(82310400005)(4326008)(186003)(8936002)(41300700001)(40480700001)(2616005)(70586007)(6862004)(356005)(82740400003)(6506007)(6512007)(36860700001)(86362001)(316002)(33656002)(26005)(2906002)(5660300002)(47076005)(54906003)(40460700003)(36756003)(336012)(83380400001)(53546011)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 15:45:02.7571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dec3d5d3-efa9-4bb7-bef1-08da59e654e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 15:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167386

DQo+IE9uIDI5IEp1biAyMDIyLCBhdCAxNjoxOSwgTWFydGEgUnliY3p5bnNrYSA8cnliY3p5bnNr
YUBnbWFpbC5jb20+IHdyb3RlOg0KPiBTZWFuLCBjb3VsZCB5b3UgY2hlY2sgaWYgaXQgaXMgeW91
ciBjYXNlIHRvbz8gSSdsbCBiZSBhZGRpbmcgYSBtb3JlIHZlcmJvc2UgZXJyb3IgbWVzc2FnZQ0K
PiBzbyB0aGF0IHdlIGtub3cgd2hpY2ggcGFja2FnZSBpdCBjb21lcyBmcm9tLg0KDQpJIGFjdHVh
bGx5IHRoaW5rIHdlIHNob3VsZCBnZXQgcmlkIG9mIHRoZSBpbmRleCBmaWxlIGVudGlyZWx5LiBX
aHkgY2Fu4oCZdCB0aGUgYmlnIEpTT04gZmlsZSBzaW1wbHkgYmUgYWxsIG9mIHRoZSB3cml0dGVu
IEpTT04gZmlsZXMgbWVyZ2VkIHRvZ2V0aGVyIChieSBzaW1wbHkgbGlzdGluZyB0aGUgZGlyZWN0
b3J5IGNvbnRlbnRzKT8NCg0KUm9zcw==

