Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B155C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 08:45:32 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.84])
 by mx.groups.io with SMTP id smtpd.web12.5255.1666773922889370380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 01:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tIfv9sUP;
 spf=pass (domain: arm.com, ip: 40.107.104.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PsW1BqXE6m9ZBBTwUg23L/64eg4L7AYJ4XccML71IcOZvoL0us6UTaN4+TLs1RjE56U1Ey9L+MlIgm7sl3x6/DYvkH0ZwIEwP7lJOgYj69mXrQp8uUJoi+nLtT2qG2Fk9azq+HyCHuvFeqqB4uEL3MLfxWViEee6yn4zG3Oi7GKvpBgbbfspIp56xvm33okUGO4UM1LHfVBmF2JvtnGmPB6rIXPQ+ZPy4z0BZiq9kUsanGO7f+JLxbJSy9FctH/5afmUR9/uJFPpW1zPSelz/IGZqOJw1bJKuVidv9vxkB+ZgJdktnl3WrESKMATND2wt4OgHLuNsoIWNCm5KInrmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWvasp9KT2ZEirn2BvEPuVsmgPMDIE/Hno2ki0beam0=;
 b=Nhw5Dy19MI4BAjbk42eyd7649y2Pg+KlLxcxnbcX6qRDzx2hY4MK/9AScu9JlbWTvIqjKaoKK5S78CprFZsc7+pLbM96rerUhTz0H8vEet6P/+7jc6ShylXefu4RO2nVwZt+HF1JVd7DLkZz8cQhXfDk5PcpwjIZ9Ng92JLR5dEvVYCzy44CARjK4jCWvkpfJM5/Qq420DjvWq6dM8t4qRkx6nA3CcuK1GqWv/YePSpVEtmreqdpYVm7L7Eyv4UwTjpyfdtKDrPFEvJenPYv7K5JSEAy67DjRUDWTIqmU4PsJdMv/my+uzkHHeSq69Fwfidx6bNNNpqKUojzysVypg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWvasp9KT2ZEirn2BvEPuVsmgPMDIE/Hno2ki0beam0=;
 b=tIfv9sUPHnFhcKbQ29D1rQB8JhxqRxdZtvAL1XER40oO7xPnGG0a8+7zC6TGVhAlNK+w+uUde2H+ynueC+4Edvo+65S4eLFl4GCcEcbuFwlM6oi4M4MICOwz9mZ4P02HF44kKjWgFQBWOdpxNzF7VicakpNEs3eAkkS52xKKzds=
Received: from AS9PR06CA0207.eurprd06.prod.outlook.com (2603:10a6:20b:45d::34)
 by AS8PR08MB8492.eurprd08.prod.outlook.com (2603:10a6:20b:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 08:45:19 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::ca) by AS9PR06CA0207.outlook.office365.com
 (2603:10a6:20b:45d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Wed, 26 Oct 2022 08:45:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 26 Oct 2022 08:45:18 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130"); Wed, 26 Oct 2022 08:45:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f7688154d0ed563
X-CR-MTA-TID: 64aa7808
Received: from c0882dd83e35.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8121E316-F9D8-4B26-9E2D-73B644560522.1;
	Wed, 26 Oct 2022 08:45:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0882dd83e35.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 26 Oct 2022 08:45:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7LSrFQcdAiMJ8DjLKlbCvcinVhdWSBdi0GCsgVWSdgL3RhgiJ0rnuqIn/X+QDgiLsW9TegIaA4qAx+q3mDMaIvnLkn4kY1f+e2XEfyzAuYOL0gHmwd38jJK7zJH3vRbu1lEqNlK8FU5fdQfePyiCbQp8M7cdeAeUmRjyLMZ6siZYVRcHLZB4Dl5D3Gtnm9aBWjkO6ZonaaFwGlkY/EWL1GTdoUrsUbudk59Vj3LNs5FGH37XaYRWIEbGHVkz2pX0p9v6izIG3bH1/phbf2rIPA4TTI/Awq0lYYZCrp2/Kl/HL/cxaphEgQlYGTVlEWmn+demiYiiBD/CEsYdILeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWvasp9KT2ZEirn2BvEPuVsmgPMDIE/Hno2ki0beam0=;
 b=Mv5r3YvvDb5dv+4V2jG4n4ObMALiBcapoeEGnOTMjyEJsCS9GXxqIc+3knU/vY8l6X6re8K93K48f49y8ZO8lvGOCheNfAnq43A2k66wuDXe5fwV+5SvRE4ZmW+mAg46nLU7S7lb7OE1jk5CXYPKxeCkw5fV3zxZ/NVsqNeqX6H0uWA8bW+EjaES+0YO5XCrW8ir3NsaUx0Si6XcZ7YlYL8niIUrmSXjdBJA/oac6vkUoIbgV7LTQPW92VPuuW29E8D705I4YiPoy4Xr2DsIxPjATSbw4y2+gpkc7FO54c4bXps69uxiwzE5cWxNDZX+g+RYBs/qYrn6+HmL1be1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWvasp9KT2ZEirn2BvEPuVsmgPMDIE/Hno2ki0beam0=;
 b=tIfv9sUPHnFhcKbQ29D1rQB8JhxqRxdZtvAL1XER40oO7xPnGG0a8+7zC6TGVhAlNK+w+uUde2H+ynueC+4Edvo+65S4eLFl4GCcEcbuFwlM6oi4M4MICOwz9mZ4P02HF44kKjWgFQBWOdpxNzF7VicakpNEs3eAkkS52xKKzds=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5967.eurprd08.prod.outlook.com (2603:10a6:102:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Wed, 26 Oct
 2022 08:45:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 08:45:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] mesa: update 22.2.0 -> 22.2.2
Thread-Topic: [oe-core][PATCHv2] mesa: update 22.2.0 -> 22.2.2
Thread-Index: AQHY57o0v/Vr6u9Udk21ZQGGqbXpnK4fPjcAgAEg1oA=
Date: Wed, 26 Oct 2022 08:45:10 +0000
Message-ID: <83998312-9025-44DE-A6FE-F05282A5F532@arm.com>
References: <20221024150608.455173-1-f_l_k@t-online.de>
 <Y1gBSjnaB+frzv3i@mail.local>
In-Reply-To: <Y1gBSjnaB+frzv3i@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5967:EE_|AM7EUR03FT039:EE_|AS8PR08MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: bd10a7e4-fd6e-4ce1-4755-08dab72e693e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dstlgeorl0CGw7e2khVll3IAIU9/5vJl7M8DpJtFcJFoZTxd9Y7R1aYy4AITsw3Qbwkaus6wMyScIu3X8T/GGkAbUhcUfJukpJmPnG8xfQ8O73QSIEBGuZbByRToa3aKeCR81rVz3kEpwhiJqBkV8LLuFQePq5GE4F+zPDIl9r/Xkb6jtrGR3tv1c1sx6ox9p6nAEVgbCRETCvKy9uaM0BzQJzVxNRke7gdPSWfO04vbQJMw3i7DNlxF0Yl25wmnH0R5q2hSXkSLwUJQ/f6cMqrniUoFJBwRW6HAoFXTnpKrN7ofqP7Z5bEArjMWiM4TZGkzYLlbg00djvg2QEgqw9Jkz6YJPpo+g/PuO0XfMCS3wVif0bfql9xSnCXfid63QtT1lQPgMwXxUNA170szkVejhWjMatpm6CHH/mqJed/sirEtsTTF9zm/NzRAqWeLgYvTk/AXho0B8ZpDd6Wh+I0A+7tSdaPZxtyypOfG3dbVRU65MjoZMYMdvVDt10bazhH9xty9KDONr3RqBUJ1BOWc9PCqz0XjS/DwCamz472oTpd7TZc65V6kqTTAYeb51D9KKJxpurxMk+9+w2Vxe6jTV2vTrhKLEu/UNd59GNZjMJKk6VxE4jDY83Iv6wGOgQIdmljvPG/VqNJw2NmL+wcpNXRyZj0pzkFKEnxPwraiEhdr3LTPE9piH7/OMtsC5kPR589gSsAK95FJA1sfJqRheNz9pHjrKqu6nr/CgDeCyRXsNF8h3z8XKn2uNsj4YkYWkZzr5yOY/JEph/ZFBj2nANiz+7gShoD5HFbH17uwvvSH1blYweeNxx/iemC3
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(36756003)(66899015)(66476007)(38070700005)(66946007)(5660300002)(66556008)(76116006)(8936002)(122000001)(38100700002)(83380400001)(33656002)(6916009)(54906003)(2616005)(26005)(966005)(186003)(6512007)(71200400001)(8676002)(86362001)(316002)(66446008)(478600001)(6486002)(53546011)(41300700001)(91956017)(64756008)(4326008)(2906002)(6506007)(15650500001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <53E539096DB4DF438279CBED7CA09A50@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5967
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8acb63f3-0c00-4569-b484-08dab72e6413
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lx0liHpnj8VmnOpKEvf/DWGTO5Y4UkbW2Thl5bCKW1IDCPkJOgAdrKf97ufBpZEJbg/j2MAWFbCjQPGFqB/c8cBvWTd/PIbax4UdYnXypX2yB/A5Z45A2kWu0Tz0yYiaQUQ1eUHwiygx8OwdBDOw/ftP6bPy1/J3PnAdexi84+pfv8iGSAhMHnwg56nv4Kk1i7ASg/BCS5h+/b8rvnSxwqO0+wAqIwIcsW/gS4bh65QDQTaGR9JQo+u79y62oEhkg4z5FLSiGWkELPxh5RFZ0fvFQCuW2zDjCdLiLQxuBtqqMshx7bwzYGxxZCrrdATo6BcVPqnJEmyNzZhdmj1oLjOMqZkYZZYgJl6PcwqrjxrcYQmcmOrXo/my6w0mLoqM9yF75V1nDFFU7d+wEPH7Ky0WYUhMHVg75+JHIjIg0ZPC02u/snemgBJO45QtQhIpNs1jTepe2ZZY1iUe6EOYe/EzanwEmukRFQCHo/qSLVd5CGd7HJq7HGCKhJlxrMOFhTfbSEDs73t8UBMfQ7tOLHgG0Ugi62APA0mhLuPkWnxidmcbUSemQojHH7+8miAvRzNGH5GLGvsui68psp0NhGC5gJntWS86Pz6jk252AGW3jfE+Gd/Y4EbGLTgp1NNS+555xB5v6bbYMkGHUmDT1xi5EKkwIAEnN/QLpUeimYroS8EzGLArP7DQH5PMUk46TzFc/vQTh4RaqGUgyjYfNsvklYtuNRS3sUxdzcMHke0Y7DAb0c3K3ZbA8z5JpCf/3tR8vFZbAzbn+3tTTTnU+0abaFroCAIL2SRaKlIntAQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(186003)(66899015)(81166007)(82310400005)(36860700001)(356005)(6512007)(26005)(336012)(6506007)(82740400003)(40460700003)(41300700001)(316002)(86362001)(40480700001)(5660300002)(6862004)(2906002)(8936002)(33656002)(54906003)(478600001)(4326008)(6486002)(70586007)(70206006)(966005)(83380400001)(15650500001)(36756003)(47076005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 08:45:18.7789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd10a7e4-fd6e-4ce1-4755-08dab72e693e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 08:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172147

This fallout might be related to the libglx patch for mesa?

Ross

> On 25 Oct 2022, at 16:31, Alexandre Belloni via lists.openembedded.org <a=
lexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> Hello,
>=20
> This is failing on the AB:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/s=
teps/13/logs/stdio
>=20
> On 24/10/2022 17:06:08+0200, Markus Volk wrote:
>> - add a PACKAGECONFIG for perfetto support
>>=20
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>> .../mesa/{mesa-gl_22.2.0.bb =3D> mesa-gl_22.2.2.bb}             | 0
>> meta/recipes-graphics/mesa/mesa.inc                           | 4 +++-
>> meta/recipes-graphics/mesa/{mesa_22.2.0.bb =3D> mesa_22.2.2.bb} | 0
>> 3 files changed, 3 insertions(+), 1 deletion(-)
>> rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb =3D> mesa-gl_22.2.2=
.bb} (100%)
>> rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb =3D> mesa_22.2.2.bb} (=
100%)
>>=20
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb b/meta/recipes=
-graphics/mesa/mesa-gl_22.2.2.bb
>> similarity index 100%
>> rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
>> rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics=
/mesa/mesa.inc
>> index 8a74e0a80a..bad8461fef 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -22,7 +22,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
>>            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
>>            "
>>=20
>> -SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332=
880f2d0066bdafa8c"
>> +SRC_URI[sha256sum] =3D "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97=
cdb06a2f4e78948f9"
>>=20
>> UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>=20
>> @@ -179,6 +179,8 @@ PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue=
,-Dvulkan-beta=3Dfalse"
>>=20
>> PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
>>=20
>> +PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libpe=
rfetto"
>> +
>> PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
>>=20
>> PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabl=
ed,lmsensors"
>> diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-gr=
aphics/mesa/mesa_22.2.2.bb
>> similarity index 100%
>> rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
>> rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
>> --=20
>> 2.34.1
>>=20
>=20
>>=20
>>=20
>>=20
>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172134): https://lists.openembedded.org/g/openembedde=
d-core/message/172134
> Mute This Topic: https://lists.openembedded.org/mt/94536553/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


