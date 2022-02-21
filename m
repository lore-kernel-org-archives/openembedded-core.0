Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF7DC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:29:20 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.135])
 by mx.groups.io with SMTP id smtpd.web10.1736.1645464556652934984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Ny1MSCuH;
 spf=pass (domain: arri.de, ip: 40.107.0.135, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCztM+Fwo4MC0XfuYdpuDG60RoQUur0cyevNMLReM/tsFZkXF45+YE3/AgyGaAdur1GXzmfJX9scLJE/TkqW4R3vqzTs6AB8KvDIN4TGDWXhsDwmellgSy+2XChu8Aya3xXJ7h4lbosWV2g/UFkqQXsYPWPbvaxyQQvtgV0sERkX3SmxqCEkqh42DdoJ5Sv96kSDVsSTlTIOeIDl0A2354OysHdJJqCdrtlNNir5HRTtEwdPmLvW9JQWvUAHnpFZKOmHRuhpwS7FPIZSqIuNwXqmapUlWKW6+FCtkkneQ7fuEs1BwwgjxRlJi+CRSKek9sne6ufZnkG4TaQ5j/IZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy9rkzudnSpsTsM9qTL5Bka3c65SlunCyh/tGUFxBL4=;
 b=NOR6iMHMS/5WQmtebTmI/b1ZVBWORLlLDtahZjslG4GW6eRWvWtL7Ux7KwJjrtzYXJIbw94Hmv2axj4UjURKJx60ZVFapWT86ZLENYBvMdZxbI2Inlpft2yzrTBp4P6BVRPuOOOmf62T76aVi0GD9svg4NAYWPc4EQAvwNzDPAnspD5tDJ3wyfD8bLx/pJRnWoTopeR4lVoOLNiebw50J/rDY/c4RfzUooIjszUhci8PXnyRIvecCyn+ANOs8c8ABzVGibQbaUofCy8zjSRi7OrbPBi/OElWONvDIPhECMfr2lPYCuHJ2ON9OHvvcY2uYIQOUl3Oc2Du4wx68uf/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=huawei.com smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy9rkzudnSpsTsM9qTL5Bka3c65SlunCyh/tGUFxBL4=;
 b=Ny1MSCuH3sGu2aJqe2XIzOgm81/HSysJksn3QQSuE1VNnOz05fkhxML9Z7T8Mf6JdyBTyHXReefaBcKVmzPw+/OUYBq0CiQxHToyU0tzdAxgNys8GW8BaazR1KDbaDrOpEbMnvHCqk/MKZf0rboYhDbvcXgT9rYSSNj39oA2vUU=
Received: from SV0P279CA0020.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::7) by
 DU2PR07MB8332.eurprd07.prod.outlook.com (2603:10a6:10:2e7::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.13; Mon, 21 Feb 2022 17:29:13 +0000
Received: from HE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::77) by SV0P279CA0020.outlook.office365.com
 (2603:10a6:f10:12::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Mon, 21 Feb 2022 17:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT039.mail.protection.outlook.com (10.152.11.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Mon, 21 Feb 2022 17:29:11 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 21 Feb
 2022 18:29:10 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 21 Feb 2022 18:29:10 +0100
Received: from localhost.localdomain (192.168.54.110) by exmta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 21 Feb
 2022 18:29:10 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>, Pavel Zhukov
	<pavel@zhukoff.net>
CC: <pavel@zhukoff.net>, Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: Re: [PATCH v2] patch.py: Prevent git repo reinitialization
Date: Mon, 21 Feb 2022 18:29:09 +0100
Message-ID: <21381279.EfDdHjke4D@localhost.localdomain>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20220221142006.6501-1-pavel@zhukoff.net>
References: <20220221142006.6501-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.54.110]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80360c19-05e9-405d-b856-08d9f55fac6c
X-MS-TrafficTypeDiagnostic: DU2PR07MB8332:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR07MB8332611FC1E778144677C7E8BF3A9@DU2PR07MB8332.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mmkC+SsKbCgx85iQxBlhbdTG5T7DERuJQVVsGq1/uNPrSB0tcSBni59KOAg+9wpmk09Y94u6YfgWWuagibOjSpb2AgjTVVKSdLPMADCic0vhPFvP8LOjUvAU+hPSMdPtdd6tDilrWGQXig1nPz/mnfraUs3BTJpH0zN/LgvfwfYRV8apU/84q/lc45RpxWVz/mYarKQF0lCZlgyzFfRfBsSxjEzVQaWTxrumJ4egp2R+UQrdw/jJ51iVtqBbY/mjPFc0vHTxgDfT7/zOQ7dcS8O6s4b/wvNihULNQsjT096loU2D8YHAvvkYDx4nFs1VSskDpW/ad6iBeMs/fIDct+JdUGmNqE/bSyHrH9UhCZan6qyLuz1qwsREmcrGIZCz2b/sqXna9qIp67VzYO4gOsjHxRFL2fie8UrPUNI7Icj7DwjlR3Gs7WCPmLDR2inJ34JGADLaWgrMuH5xJ7LKoXEZxcP17pBTOwv4hFby7FgEbtjmQT2kD22ZmiEiL055EV/RTz8m2JA7RpYR14Kz2K0ihbpcmCL/Dz8ujpmZi3oCNmJZ0u6XgKoq94v6sBAiUtNwMR3msp2+XwC8ToHXGebw1DpiiwExPJmJhhivINdkyClwDC+ZON8upphTb034+sApZcgFzyO8zcBWSZvAC6F7Tue20brVwAQ73uuOymx1ajLMnvZuptXL/l+hYg7CsG+gNFSmQO9CmvlkcGx71HlySooX8pv8uFPwyFC4kTA/hlANP5nJO0uOAtgMrt6B0Y6VRuMsyrIhu9xsiW5Xgh/utMBLzUGH3uwU0W4tidE=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(8936002)(336012)(26005)(16526019)(426003)(9686003)(356005)(2906002)(47076005)(86362001)(186003)(5660300002)(55016003)(110136005)(8676002)(40460700003)(70206006)(316002)(82310400004)(36916002)(7696005)(70586007)(83380400001)(63350400001)(36860700001)(508600001)(54906003)(4326008)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 17:29:11.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80360c19-05e9-405d-b856-08d9f55fac6c
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 17:29:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162061

On Monday, 21 February 2022, 15:20:07 CET, Pavel Zhukov wrote:
> There were few bugs in the _isInitialized() function which might trigger
> git repo to be reinitialized and patches failing to apply.
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../net-tools/Add_missing_headers.patch       |  15 +++
>  .../net-tools/net-tools/net-tools-config.h    |  75 +++++++++++
>  .../net-tools/net-tools/net-tools-config.make |  36 ++++++
>  .../recipes-test/net-tools/net-tools_2.10.bb  | 121 ++++++++++++++++++
>  meta/lib/oe/patch.py                          |   6 +-
>  meta/lib/oeqa/selftest/cases/bbtests.py       |  20 ++-
>  6 files changed, 268 insertions(+), 5 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/Add_missing_headers.patch
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.make
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools_2.10.bb
> 
> [...]
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 950fe723dc..2163e336c2 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -304,14 +304,14 @@ class GitApplyTree(PatchTree):
>  
>      def _isInitialized(self):
>          cmd = "git rev-parse --show-toplevel"
> -        (status, output) = subprocess.getstatusoutput(cmd.split())
> +        (status, output) = subprocess.getstatusoutput(cmd)
>          ## Make sure repo is in builddir to not break top-level git repos
> -        return status == 0 and os.path.samedir(output, self.dir)
> +        return status == 0 and os.path.samefile(output, self.dir)

I have the following variable values here:
- status: 0
- output: /home/eggers/<...>/yocto
- self.dir: /home/eggers/<...>/build/devel-kirkstone/tmp/work/orbiter-poky-linux-musleabi/linux-stable-rt/5.10.100-rt62-orbiter+gitAUTOINC+ca44e6dff2-r0/git

So os.path.samefile() returns false and the existing Git repository
is still reinitialized.

regards
Christian




