Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84194C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:25:50 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web10.12320.1707758740464904023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yhPED/Yd;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yhPED/Yd;
 spf=pass (domain: arm.com, ip: 40.107.6.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dJYhc0+O+rao66caOX26B3onyFPccgc8ChoQLynNR0SQe1ZwgBoldArYI/bFxvIljQswiQd6cpvuumMf2Xt+DvCkhMg5T01O1YYNe2sF4stja6etk84zAXz2wibO1fQ/A/Oh7jM0W4Ijkj9M5yuUFRURWioOZRJKeupXCV5XCsIHoLs/ZYHO0lbLyLr4sOrr34Tpq5WRJg/r/zRrPFtAajUNPDKUa5tAyZi6e6DpOjgdxDMy1TRjWH48/1oPqvtg/BxOx01lv7tdMf+T/H0ZD2mwnUJi0Hiy0a8lWFpE1SbsjmHJNht0yD98lLAopXGrZnQbYP4D2KlOuQmtEUMCVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZueuqXMlWl9aZSU+wIZ3qGK9UbGH1JYrNAwvva9QXuw=;
 b=myJFUt9Cz7tzFIKLrvtr2tr6Hadb0CM6JxKnh04jV4yZKtBGFJ+w29rCRdjCJZ77kx2ILrHvnLkMmeBihpbJtYmg5nn/ZfgVyLpgmLFl4gl8/XLltWcNwZKaGmovvyPjSI6whWH2X3Y3EdJS5DaPkNAhyhHj8G8QXgV3Gz0wbk1qxY1Voh52m1nTNdsV6ReibroEX5qIfxZ9tbbNWEw9sOj2J0YZ7Lp25MN5pGgHli0BySHCIDsEwTB5U6UiQJ8eUt9/8oajNwJeVm7dQ6B5PcfD82aSUVSVydVbTDN0TBIP1+Umv+TV5uTNGlzHv+ZGb9ZifJGISOSwZRBo3Pd3xA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZueuqXMlWl9aZSU+wIZ3qGK9UbGH1JYrNAwvva9QXuw=;
 b=yhPED/YdCJNRXOwlipn+Pjn4l6OWg9GykrlfhHlDTm3oyPcACn3G3jXl1ZYCuTp0h69lIlw5oMawYg/eMNkEFZcQJ/0eqc7NEXK40lKg4NvyMTR8MpihFM9OEksnwoEkMEV4yab2tv673yX3t4cBXEycFPRDbivwTaQO1hjBNLs=
Received: from DUZP191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::20)
 by PAWPR08MB9471.eurprd08.prod.outlook.com (2603:10a6:102:2e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 17:25:37 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::df) by DUZP191CA0041.outlook.office365.com
 (2603:10a6:10:4f8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 17:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 17:25:37 +0000
Received: ("Tessian outbound 31df1b57f90c:v228"); Mon, 12 Feb 2024 17:25:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c02f5b387d639bd8
X-CR-MTA-TID: 64aa7808
Received: from de35a6594f85.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E06B18A5-BBF9-44D8-935F-EC8850FE4574.1;
	Mon, 12 Feb 2024 17:25:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de35a6594f85.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Feb 2024 17:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA+2wJIL6r4mk3tpmTCfu8OVYy10FqIMgDe2HE/B9gQq7Br/3a3s4C57axnsSmcXUgNuxalBSTl4mMHP994tH+7iUtVIdl+iRgY8612XIa1+3AMZTV6G6vksI4j0bJTb2SqDDvxx1OzLCPE6CNffTCoI3A97DIbLjCb3u3eWEAaNMtRsX6TaykOYOzLu2R8ydn8CCuEZMmScJ5F8UbdTLgP+QiPQJMHE4Bv5GslK/EOuD2e4AZ8F9mbuaCctaoK5V6OTGjH1Sj7tStc6InAEwD91op1tiYnp3mz+8dLsCFpa3N1RNKGcvVaZK72NzT8Wa+fbMTX4ivP/sE4UJiCUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZueuqXMlWl9aZSU+wIZ3qGK9UbGH1JYrNAwvva9QXuw=;
 b=QP9Uyvk6yvdUY46++RWWIYT124jS7x/21cR07GTaA9re4rYoDg5GF+4KHpsXK+JAhbr1mXoq3Uy/5YPToOkyhYMcMKo02R+mvGyyQkgSkR8lv/lutbVcJs3lOon0YaifD21qoDR78x12AhaABjjizeRwm/kgt9WX0hNuGx3Klne27DXz/343wkxfqoV5BtcHYbKCwB6D0qQ1RbdwBBQcN3R8PAkaoTTfpgK0ghRNI3AD7TU78OCm6QoCJ/7MA698C2sxHVBXEK9g1k3fvcK437TCpKZ0En/YudqOLETzgkaxYQK0xV/8yv7Rra/wj3/Becan45gx61xjJBfJPQzMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZueuqXMlWl9aZSU+wIZ3qGK9UbGH1JYrNAwvva9QXuw=;
 b=yhPED/YdCJNRXOwlipn+Pjn4l6OWg9GykrlfhHlDTm3oyPcACn3G3jXl1ZYCuTp0h69lIlw5oMawYg/eMNkEFZcQJ/0eqc7NEXK40lKg4NvyMTR8MpihFM9OEksnwoEkMEV4yab2tv673yX3t4cBXEycFPRDbivwTaQO1hjBNLs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9831.eurprd08.prod.outlook.com (2603:10a6:102:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Mon, 12 Feb
 2024 17:25:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Mon, 12 Feb 2024
 17:25:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] own class import fails in nanbeild
Thread-Topic: [OE-core] own class import fails in nanbeild
Thread-Index: AQHaXdY0UQUR5UwFCkaI3o9PRGH5SbEG9TkA
Date: Mon, 12 Feb 2024 17:25:29 +0000
Message-ID: <0F8F18C7-1492-4C96-9ED9-AB21F9D99F72@arm.com>
References: <9aaeb9e948caa2285b16f15003bab3cc8f348ade.camel@infinera.com>
In-Reply-To: <9aaeb9e948caa2285b16f15003bab3cc8f348ade.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9831:EE_|DU2PEPF0001E9C2:EE_|PAWPR08MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a2514a-74c8-47dd-3b68-08dc2befa0b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gJ3ih/jFW0X8bPD7/MYqjOEj6zppFtHWXJKt/+27rmleGweP+KdciRdlsRP0iyPtf2qzbP2tGpCFjWEEqMkjCclNxor64ULGnFufZAsraoD7UJQkHFCpcN2/BjeendaKArYZqk9eUWwcapHgecRuAj0QercDJF0a6mnhYHQ9eKSQ1KdgQCZvuTUHx+WXflWh7IUn4xnW2J9FYHTDhqWoWQv5A7x7ErmGNSJKBJWHSywUZXHxlxFbCnXpXPNS1rKMZ1QkTtsEecmTrm8S03pXIhRyU4O9YEMNlxU5aZNfJ0E0xhl9oGsVM72Ic9C9qnSSAWpELCaYgOQm9d3gXiOk11024pjVLJsQAXvawsBGP9ycyoolMCNcyQMnai0BAU9DeXKGKD2Z5JR/c2OzJrWSUUqXJwoByAOPxLKbXmWJDwtWHl+qoqFxBraHJ/av6mxdzq5vWsdyZB0ASxsIZsUjRTAgxEsxs8DA7Ejtzb5dmg4/XPvocnGdfVJEcwqMIVauQgu75q9a8tUM2Mjo024Zsd0JLY5zARzLdv6DZ2EFKo9zZpD2PoWOv18hEYtG/pK+hCmxWfsdw1+c45StyA50VEon9SyGx8TW9Unw4e7JH1Y=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(2616005)(41300700001)(478600001)(53546011)(66446008)(66476007)(5660300002)(76116006)(6486002)(6506007)(966005)(71200400001)(8936002)(64756008)(6916009)(4326008)(8676002)(66946007)(66556008)(26005)(6512007)(33656002)(36756003)(38070700009)(122000001)(316002)(38100700002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1DBE0E845574B488AF04C83AAFF393A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9831
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f4b32807-cecb-4271-a0e0-08dc2bef9c04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PhqFCvkYaQ4pqYxbFOWz95k1KPWtTg5G92Ep2yRFaHaZQ4otToV+stNR6c5gJrET/41K7afcf69qaKXVhM3XimgJeHAQyrUW4kgJkoeIdV3GzsOSx/CyLpcvhZPuSwrtB272JvTAHm5YwYDNJAyiQgk7pmPAjcq6GXb9n+kbR54ORsoiVoZU+twbFWQyXzdTpiLtVno6dA/Jb28RJq/uLHnthfj+77979pzGpBfC9qt/Zh+wG/ARW/XRDvXWRiRvRe79LE90X/dAMrbGHjiMNQZjVhmavbuVlVpI3fnAQNhyZtaNzvB6dB0fe6YKMRYZ+iqA/B1rfnSUB/am5Teh0TI91JlgargvIGJoIEOShWEh8vvhPyBXoXFvku5iCYZ0qOSEGnaFamEjo5Xrl+bgJobD8bDcyPjizW64WfMDax2Jnv8U0H8fH8I0QPxm9LaD6sUAaNOUSldnRUOIIrmV+lIZTomWRQ0M7Qu4oqhROuDoN6p5qyuoI+kGJCtgwl2T17tvgl7Shn4rb9qR6ixDp8MQaZX5POLUnaUp52YngFo1idV97gPJpYz+lD8+d36xC/JnGzuFS5P5nWlzVrMUWg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(33656002)(36756003)(26005)(8936002)(41300700001)(2616005)(336012)(70206006)(478600001)(70586007)(8676002)(6506007)(5660300002)(6862004)(4326008)(966005)(316002)(6486002)(86362001)(6512007)(82740400003)(81166007)(356005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 17:25:37.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a2514a-74c8-47dd-3b68-08dc2befa0b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195349

On 12 Feb 2024, at 17:09, Joakim Tjernlund via lists.openembedded.org <Joak=
im.Tjernlund=3Dinfinera.com@lists.openembedded.org> wrote:
>=20
> This works in kirkstone but now it fails, I got:
>=20
> cat meta-xr/classes/xr_lic.bbclass
> python xr_lic_build_report() {
>    from xr_lic import main
>    main.build_report(d)
> }
>=20
> IMAGE_POSTPROCESS_COMMAND +=3D "xr_lic_build_report; "
>=20
> and:=20
> ls meta-xr/lib/xr_lic/
> ./   aggregator.py extra_license.manifest  html.py    main.py    util.py
> ../  exclude_yocto_packages.txt  .gitignore licenses/  static_info.py
>=20
> building the image I get this error:
> File: '/home/jocke/yocto-xr/meta-xr/classes/xr_lic.bbclass', lineno: 2, f=
unction: xr_lic_build_report
>     0001:python xr_lic_build_report() {
> *** 0002:    from xr_lic import main
>     0003:    main.build_report(d)
>     0004:}
>     0005:
>     0006:IMAGE_POSTPROCESS_COMMAND +=3D "xr_lic_build_report; "
> Exception: ModuleNotFoundError: No module named 'xr_lic'
>=20
> now bitbake cannot find the xr_lic python module.
> Any pointers what I missed ?

See this section of the mickledore migration guide:

https://docs.yoctoproject.org/migration-guides/migration-4.2.html#python-li=
brary-code-extensions

Ross=

