Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4008CC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 08:28:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.110])
 by mx.groups.io with SMTP id smtpd.web11.66651.1673252875778744607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 00:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=bGyPgJRG;
 spf=pass (domain: arri.de, ip: 40.107.21.110, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hls513uHh+kWjtsVHXGGZMs8WhOu1WdQCPzqGdQBPqC+NfZ/++evZldQ7mbdPEDAO/ZRblHdZRRVBIvcir5Bg0Fg1oVfs1wkgMSRP+2j6LKJv6A/ChtYLoQKZhd+3r+HqDcxfayr3OnA0ZWYMogeELqW4AZ1JLCJTPTXjvk9nRptoUl+DhZEC82xXbehqddN9dMeszb296sRipmLa8r7mNd6nyp4Fuy4Kw6BC+DReyEfDUi756bdYtlL/GYzpussUZ/4FGAL5NfeqCGwjexdrpofieLG7fxo9kckj01G0iJpXp13mVvFnICrpGilnMYSfiipXB0uM4wlRRFVdyVCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OmmeJH3fv7C7SirJz/71S6dw4dfVaG1K01+88YjaYk=;
 b=Ok+dIo/wumbrMypu/SVH20ur19nxZ/8p20ZEAyRUINW2UuZVm208ItaxfGTh3+9JMkqpBFCbRnwg3t66IYxm+iNqpb387NO+uz4ZA5By/juDNqX2zhFp45uKQ4QI1FJnf/UaJGXm0zjbamZ38q+rGKnIrLghhuj1oe9GzAoYGnKZ3c8TVTH3WWv5aidFvEGGaLa9qjmHmOsBAKG7mhZeOPgshCw33vj9KG2qjxJM5GxXg/UtNdQ/JEkSgwoyu2cANaUaj/fRXjAJ4JoGIPw9mWGJqih4DPeUEpmdYKa5UoUpCXUZaghtUrmTDo7O+/Od95dluYe5ZxuM+ko9jtNDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=arm.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OmmeJH3fv7C7SirJz/71S6dw4dfVaG1K01+88YjaYk=;
 b=bGyPgJRGveF98yURu3K3TH9FfTRglQSIbHuiniDbOQFi7tQ8XwOAAya9725SX0fjM2N2EiYmfB+T9+ePPW7JWrcVt/mc2Yzi6IZqr7Cf5ReL2zKiEmq1kyxJMCXxRt0BDk0SEEc40/xadkvW509yyDzLOXz1/X2b1uWXEcfWKRM=
Received: from DBBPR09CA0026.eurprd09.prod.outlook.com (2603:10a6:10:d4::14)
 by DBAPR07MB6486.eurprd07.prod.outlook.com (2603:10a6:10:185::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:27:52 +0000
Received: from DB5EUR02FT024.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::be) by DBBPR09CA0026.outlook.office365.com
 (2603:10a6:10:d4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 08:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5EUR02FT024.mail.protection.outlook.com (10.13.58.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 08:27:51 +0000
Received: from n95hx1g2.localnet (192.168.54.110) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 9 Jan
 2023 09:27:51 +0100
From: Christian Eggers <ceggers@arri.de>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] boost-url: remove recipe
Date: Mon, 9 Jan 2023 09:27:50 +0100
Message-ID: <4777537.GXAFRqVoOG@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <5B438F3E-6A5A-4C26-8F88-814CF183D014@arm.com>
References: <20230105130858.29883-1-ceggers@arri.de> <5B438F3E-6A5A-4C26-8F88-814CF183D014@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.54.110]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR02FT024:EE_|DBAPR07MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: db3758ec-354e-4b05-530c-08daf21b660f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AR8xNpXFYMG6wKt4qjk9wcy8/SnvNlvQtnm9205VAwnkiHuy9SCNFbludkVQx42mM3zSxs/W7cHENH4P61YLqHSsDoOAlPz3f4d+BR2ThmJ+R1kUS+TW8gIhlIYv21sJddFDTx/U/iZWnDCKwIPLwh0olGl7PhGVn4POyFdqo/JZfZfAVeDeZeEYyFyWDTIqLRmDHm2uzu+wU5IEI2B5HZHkCPf3cz4XbAurNaommWtLSiV9LA3O8+vhgzwAU+GzkFju+pG/NTfG4QV5ryR26PK4Sm1l+/DjliDHHJ4QtPddAB9tizjUFcNSTCSrXFVuWHBS3hcay3Y5UU4RjWwPohg3uZk/2km5T3GIwgcTn+4BRv1tOtgBM1/l+ZkRAIECDrWcvpJ81TIh4TMSZO1odUA+kM1kQ8Z4ViC2i66yy/pIHXyR8pUCy+eJhprVPp1ySqF4wy8ZTfDYng2lUPFzRQ4LNEbWhxnkpEC+xjF89O5DWPzKJTb0UlWUzs3uL2G65UoV+jrBI5psqmJD6ejTCdTgB9jqKrqFFO6/l+sALu7xxuiHqW/U59lurjbiMS7+za5VbW6fmX6MmyQ4igFfHS2LG7I6gR3utBsiPMfNwpRvqt9IItkQSd/3DSXyp6NZBhDoTf3t1xoFJ8uFxOcjDkS42K4pLPGs4H92eRctuWC9o7/wl3EnipiaFvaCilIslWoKwLoGFDLT/pqJUteeVSShjvVYH0eL6gPCk70WXNixh9lIwblBsAynDOkDWFAJQIDGCucUIS5q1vwwC70MCOo99+/q+Ao0r/RSgDnrDuY=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39840400004)(451199015)(36840700001)(46966006)(41300700001)(82310400005)(9576002)(8936002)(5660300002)(2906002)(8676002)(6916009)(70586007)(70206006)(316002)(36916002)(47076005)(40480700001)(478600001)(53546011)(26005)(336012)(9686003)(4326008)(186003)(16526019)(426003)(86362001)(83380400001)(36860700001)(81166007)(33716001)(356005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 08:27:51.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db3758ec-354e-4b05-530c-08daf21b660f
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR02FT024.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6486
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 08:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175670

On Friday, 6 January 2023, 11:53:20 CET, Ross Burton wrote:
> This should be posted to openembedded-devel@, not -core@.

I already recognized this myself a few seconds after sending that
email.  Meanwhile this patch has been integrated into the master branch
of meta-openembedded, so it's time to add the other patch to oe-core.

regards
Christian


> 
> Ross
> 
> > On 5 Jan 2023, at 13:08, Christian Eggers via lists.openembedded.org <ceggers=arri.de@lists.openembedded.org> wrote:
> > 
> > The boost recipe in oe-core has recently been updated to boost-1.81.0.
> > Starting with this release, boost-url is included in the boost
> > distribution.
> > 
> > As a prerequisite for creating the -url sub package from the boost
> > recipe, the boost-url recipe should be removed in order to avoid
> > conflicts with installed files.
> > 
> > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > ---
> > .../boost-url/boost-url_git.bb                | 20 -------------------
> > 1 file changed, 20 deletions(-)
> > delete mode 100644 meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> > 
> > diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> > deleted file mode 100644
> > index 14da3ca3f1af..000000000000
> > --- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -DESCRIPTION = "Boost.URL is a library for manipulating Uniform Resource Identifiers (URI) and Locators (URL)"
> > -HOMEPAGE = "https://github.com/CPPAlliance/url"
> > -SECTION = "libs"
> > -LICENSE = "BSL-1.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> > -
> > -SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop;protocol=https"
> > -
> > -SRCREV = "d740a92d38e3a8f4d5b2153f53b82f1c98e312ab"
> > -
> > -S = "${WORKDIR}/git"
> > -
> > -DEPENDS = "boost"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > -
> > -do_install() {
> > -    mkdir -p ${D}/${includedir}
> > -    cp -r ${S}/include/** ${D}/${includedir}/
> > -}
> 
> 





