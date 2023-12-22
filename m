Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232E3C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 14:25:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.79])
 by mx.groups.io with SMTP id smtpd.web11.23899.1703255128092386908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 06:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WFSDGNpK;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WFSDGNpK;
 spf=pass (domain: arm.com, ip: 40.107.247.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IcqJw51sCuUXFJnQVoA3FTDd9jHC/agDQga3tiZ6MJhh3NvOqpKtfk7pV/J456vJxjGB0BA35ozq9RPw0R8msbPUPdBRQcEnpeK4pIerRrzMdBom2D63ovCNidwdl0v5LGBbdLAK+9iB4oOddg0alJDHQPe89zodBLLyXjhpYKmKV3FQsXXfeDVsbRm1jrfN/kinPnMydzEOj94j8bRZd/yP4wkoSfUwAZJnrgNNibO9zZovbj/uI4HAdBB5osJZLS4D1l5E+5rXlvOeWHWVW0LSGjKKuAdJ90xJYJp3n+U2Ri1AESZSGZ+RmsosIcOPgIJwo3l5TjwcRcht6wfQzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QenlZbwXRTGPTvTi/vRv8/ETwL1U9OnTIPwDryu05To=;
 b=fTItedkbjAsvhHWNEA1I3MyZujyFJx1FGAQUBp9QDQE7Bp/+cFsEDw298sPXqFbWNCtPnZyozIWpFMfuppG1s3GxROeaNlvTvp2OQPGarfYIN91r8bsWP+u8fGnmX+4BzxMV8a2RC12eAOnu5t2QflTP2/jq4oq3suaFG9ell8n4GWqpiSyvj3sI9qecT/vu2wj94FodtZj4wbO6Zy8XlphsWGwDDL1QTRtFolLtOQu21mx+vst/VjVflQtMowHWI34fwpfJiI1VGq7vVrafZIqZwaYoELlPXPhtzpInYj6e+iWhUQie1oIO3FR8oixFLku3m7YwXmsj+IT6K4lzgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QenlZbwXRTGPTvTi/vRv8/ETwL1U9OnTIPwDryu05To=;
 b=WFSDGNpK3ppU4Cdu+VhkDMu7LDtuhV4QaMHFK6Gua7XMTeCwCcxkgjjkdvebRr6qD6wOnB335DHjEpfbvtXtwR4hDH0t0SIIauXRtLGa7WAFURM4M/covxcgcfJOm9vviNKupH1SXBBAYA7yaPCNTXNt0dLbjfYj1GiHAxvUVdw=
Received: from AS9PR06CA0681.eurprd06.prod.outlook.com (2603:10a6:20b:49c::26)
 by DB8PR08MB5498.eurprd08.prod.outlook.com (2603:10a6:10:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 14:25:23 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:49c:cafe::d5) by AS9PR06CA0681.outlook.office365.com
 (2603:10a6:20b:49c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Fri, 22 Dec 2023 14:25:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Fri, 22 Dec 2023 14:25:22 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Fri, 22 Dec 2023 14:25:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1cc6899d064745f
X-CR-MTA-TID: 64aa7808
Received: from 8f1f3c5ad037.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A069A26F-59F4-4DF1-A798-DD31D2CAE90C.1;
	Fri, 22 Dec 2023 14:25:15 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f1f3c5ad037.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 22 Dec 2023 14:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSa+EYgC1KnSgagvKyKyQQr6v4kTRVmtzdXCs2pl+Me11T9RmKYunh2kFYode64uoxnR0Lz6Af8jeYVLwjM35mcI+9vtNTsU/scseQbBGvCgzvY6BOYPHzY0WEIYl9lcEJMvYfbupMGu38giK8craKQXnYHqca3ze2f9s+l6KiCk0F6t7JPSkxUyGGbwRAjuybt8IsfuuknIvo1LETjuVTKDKxJXDynPCg5YE5ifTCnxiHTvDRJ/p4XYtf6fB53QYCZVyHgI1MlF1zsaVhg27DH1ALiZveJp25uaX/+NiJ6hy5h/hw8EZkCE10TPrJ5uj927UFRvroim/q46ZSlbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QenlZbwXRTGPTvTi/vRv8/ETwL1U9OnTIPwDryu05To=;
 b=Xns8kYBwvZD5uP9nMwgbL/C9X9rvMUeHiq+MWJhZpVawrp9QBU+yRVCjIZhIBeYH+1wvr8P/5yULscRD8hpwZDvayy5tUYUcexmlRknrP7eIVzNWkTifNOQfDDN9UD1ZSolV+lCip9u1ll8PWDjkZtSSFJCDVg6V+nrTbhbP7011Tf+D2BeKkXvNMHoYc4UxTMQVHuZFGBSZQ7JcxBpugiXWGQURCExIJPsw1DOL79e+C7KIIKhnSJnkH0Bm6r3VBbYdset2gkDWxQeJEA63Z2BQ04kt1fmauGL7l8aC/oiiEa4WxXvXfq+7TggnBSMn+CLwFNpUNnUEcqbWaUZ2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QenlZbwXRTGPTvTi/vRv8/ETwL1U9OnTIPwDryu05To=;
 b=WFSDGNpK3ppU4Cdu+VhkDMu7LDtuhV4QaMHFK6Gua7XMTeCwCcxkgjjkdvebRr6qD6wOnB335DHjEpfbvtXtwR4hDH0t0SIIauXRtLGa7WAFURM4M/covxcgcfJOm9vviNKupH1SXBBAYA7yaPCNTXNt0dLbjfYj1GiHAxvUVdw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10447.eurprd08.prod.outlook.com (2603:10a6:800:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 14:25:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 14:25:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Changqing Li <changqing.li@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V4] rxvt-unicode: set correct outdir for tic
Thread-Topic: [OE-core] [PATCH V4] rxvt-unicode: set correct outdir for tic
Thread-Index: AQHaNLJcwWKccbAaJUmMAKh2aOe/2LC1W+UA
Date: Fri, 22 Dec 2023 14:25:11 +0000
Message-ID: <A718DD2B-DD41-42C0-81FF-E4002E8BF8B6@arm.com>
References: <20231222083848.241593-1-changqing.li@windriver.com>
In-Reply-To: <20231222083848.241593-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10447:EE_|AMS0EPF000001A1:EE_|DB8PR08MB5498:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b597d91-fb98-4b03-8775-08dc02f9d566
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fYj9/E83WVnZ7dBdAg/NwdZKT/HRXJR/Mff9bxkN9+dx2q1+qTMSCNZeiwJeA0iavGCdIdqAJCSFy2MZipIy7Ljg13sJJghDd/7g4iSvb/manXZHFC/8Y/+yfpKxj6Zq/VKHATtWFUXJi4TbHmxWHttWW9zV+AwK0iUp4vBrUAEeTMb9Ev4rBQ/aDi8Pje/LRzEzvpyo3XYkXSuC5Mn0kNe+2HHcmOtZ48NGZi7hNa29TsJtEm6zZf9GgWlwv60aCFRdg0uMyccyGbaaZNQomRw/VNTDHP+I1ni2X+1Iv97LKvemevximn87tyEno+e+rHOwKARAGJgsghDTZ0y042zTNKrmcgrMCEMPrtOpAopdw0tGFkuty8k2wCL6nqsmf8GF3O1zTL64LtvnoyY9Cer5CWjOrGrnwHefmItLODSIZa8+MRA/DLLzBjodfUkfJWlA9NghLDf2mhhSra0otApbgoibH3n5NEgZ3CsIcRSHkq2jQ+yW//0TyZI6PnYZxj6nxp7dMo4jFQCQ+oJzxxC6FZUbpZ60x2hGCilTGXSFF75r3gxIAL01l4U+MFy62cKUOZPxrpzXLQVuAAlLlSv7pykQTv83w3YotMFptNFrLDPZVlLL0Euk7Yy2K+EHO3uqqmPYPWuv7dHaSGXrPNB/efrvpCNc1hM0uH019r0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38070700009)(66899024)(26005)(71200400001)(2616005)(8676002)(6506007)(53546011)(478600001)(66476007)(4326008)(8936002)(64756008)(66556008)(66946007)(76116006)(6512007)(91956017)(66446008)(316002)(6916009)(2906002)(966005)(36756003)(38100700002)(122000001)(41300700001)(6486002)(5660300002)(83380400001)(86362001)(33656002)(45980500001)(473944003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <72120A9D02C9E54DA1F7CCE07EE880B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef4a2e56-e730-4995-46d2-08dc02f9ceda
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vcni6T/TP4EOWFqf8VJfgknPbHZGqKlLzRH3YdVpTHum1orG+ZKNRFQGrZqD5IdMYDjGLOMTqltSt8kEf7dqiFlrFbf7WMqNn5d0eD97HRi62xqgKHLyjvmARehnZV1V2PmjlZCPO1E16wlHXVFHw8858+oAuEAxHSXkC6XvExQSc9kc3TklukQQC0+pzXCi4ZG5qNCRJJWSQp7/OSWE0poxrD1T96hTfB2M1d+GA61LFA7X+6T48VH35nfEsHuPMNLQk2P6J9I6pPyJ6mvL3lstxVJuIRo/5TX/m+lniVL1VLgsLzoB4foz6fzAmtx9niuLurK+wDumgNXfEEzZs0Rmv1727uLeTZcVQ0w2+gaycA0vl8rfDdUahDzJKlnhvORnIs/vsDQwYAr8LSKdqwmrbCGYgToZzMN7i4iE59UTP3uazTBwYSIsKlXuaqDAr4/3vn7Faj5aDwb2itPWbijjcWBwBlNjcWmak5jjbkSSk49sNpUa/v4aC3nR/4v1IwDUA2cJUCvDcPAGAd9/8x5sBkmq+WWGJi547l4dct7N6RsV4gSgQPrGxFLEh77ExpG6jQu6g5z1XWF5k1UHpTmUgijvS+FsCn+tQndCq0ZsWvcbhpIbdmtpZrZnBZhUrNmJIPj8Vh9VT0Mcncy82NKou6EdJZLeWfHKxeGEXbVECCiPPDtgjx5GuZPlFr1GE3zMaAJXDvtfrIptx5/cK80o6cuc8RRbyXlzNRENJZbzFJYHkB+aALAuaTnympGb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(40480700001)(70586007)(70206006)(6486002)(966005)(4326008)(6862004)(8936002)(8676002)(316002)(40460700003)(66899024)(81166007)(336012)(47076005)(83380400001)(2616005)(26005)(82740400003)(5660300002)(41300700001)(36860700001)(33656002)(6506007)(86362001)(356005)(6512007)(36756003)(2906002)(478600001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 14:25:22.9365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b597d91-fb98-4b03-8775-08dc02f9d566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 14:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192873

These patches were rejected by upstream:

http://lists.schmorp.de/pipermail/rxvt-unicode/2023q4/002673.html

Will you be sending a revised iteration?

Ross

> On 22 Dec 2023, at 08:38, Changqing Li via lists.openembedded.org <changq=
ing.li=3Deng.windriver.com@lists.openembedded.org> wrote:
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> * tic is from ncurses-native, and set TERMINFO as
> ${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
> rxvt-unicode terminfo will be wrongly installed in there.  set the
> outdir explicitly to install them to correct dir.
>=20
> * Add ncurses-native as DEPENDS to fix reproducible build issue
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> .../rxvt-unicode/rxvt-unicode.inc             |  9 ++--
> ...ile.in-set-outdir-for-TIC-explicitly.patch | 44 +++++++++++++++++++
> 2 files changed, 49 insertions(+), 4 deletions(-)
> create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makef=
ile.in-set-outdir-for-TIC-explicitly.patch
>=20
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
> index e7d520ebef..b8ef0d75e5 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -6,13 +6,14 @@ terminal emulator rxvt, modified to store text in Unico=
de \
> output. It also supports mixing multiple fonts at the \
> same time, including Xft fonts."
> HOMEPAGE =3D "https://rxvt.org/"
> -DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
> +DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncu=
rses-native"
>=20
> SRC_URI =3D "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}=
.tar.bz2 \
>   file://xwc.patch \
>   file://rxvt.desktop \
> -   file://rxvt.png"
> -
> +   file://rxvt.png \
> +   file://0001-Makefile.in-set-outdir-for-TIC-explicitly.patch \
> +"
> inherit autotools pkgconfig update-alternatives
>=20
> PROVIDES =3D "virtual/x-terminal-emulator"
> @@ -55,4 +56,4 @@ do_install:append () {
> install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
> }
>=20
> -FILES:${PN} +=3D "${datadir}/applications/rxvt.desktop ${datadir}/pixmap=
s/rxvt.png"
> +FILES:${PN} +=3D "${datadir}/applications/rxvt.desktop ${datadir}/pixmap=
s/rxvt.png ${datadir}/terminfo"
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in=
-set-outdir-for-TIC-explicitly.patch b/meta/recipes-sato/rxvt-unicode/rxvt-=
unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch
> new file mode 100644
> index 0000000000..50d8d2d9e0
> --- /dev/null
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-ou=
tdir-for-TIC-explicitly.patch
> @@ -0,0 +1,44 @@
> +From c88c94e629b6aad1609d13f355c52e5a3acc8d2a Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 14 Dec 2023 17:33:15 +0800
> +Subject: [PATCH] Makefile.in: set outdir for TIC explicitly
> +
> +When doing cross-compile, native tic's TERMINFO usually
> +set as a native dir, which could not the target install dir,
> +which will cause rxvt-unicode terminfo will be wrongly installed.
> +set the outdir explicitly to install them to correct dir.
> +
> +Upstream-Status: Submitted [ https://github.com/exg/rxvt-unicode/pull/4 =
]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + doc/Makefile.in | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/doc/Makefile.in b/doc/Makefile.in
> +index e3d1fe8b..3477551a 100644
> +--- a/doc/Makefile.in
> ++++ b/doc/Makefile.in
> +@@ -69,7 +69,7 @@ all:
> + sed $(SEDREPLACE) <$< | podselect -section "RXVT-UNICODE\/URXVT FREQUEN=
TLY ASKED QUESTIONS" | pod2text >$@
> +=20
> + $(srcdir)/etc/rxvt-unicode.termcap: $(srcdir)/etc/rxvt-unicode.terminfo
> +- tic -C $< >$@
> ++ @TIC@ -C $< >$@
> +=20
> + tags allbin:
> +=20
> +@@ -100,8 +100,8 @@ install: all
> + $(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1e=
xt)
> + $(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ex=
t)
> + $(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
> +- @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
> ++ @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/t=
erminfo || \
> ++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(dat=
adir)/terminfo
> +=20
> + distdepend: alldoc
> +=20
> +--=20
> +2.25.1
> +
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192865): https://lists.openembedded.org/g/openembedde=
d-core/message/192865
> Mute This Topic: https://lists.openembedded.org/mt/103315499/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


