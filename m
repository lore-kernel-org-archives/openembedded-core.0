Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC8AC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web08.11313.1645452938962867213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=cKJo06Fj;
 spf=pass (domain: arri.de, ip: 40.107.22.110, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrPafYpvH+B4ZAp5X2YBblstXsyZN1lJUemXcOeryBX/l4DLzMlzeC3cnosyGZ1tqrguqiUlsNjDj49ud9+iR7xU21ZRRXmSOc9qtMUIEXp24LmQeDkwGL8P0SbuF7ouF92JqXmab9ef3UKtyqwCegXP+tyEFfqV6+1Q6MuqoDDRCA+u1kkwd/7qU5md3mx9UMhqzLk/4OEP+g8G2Xh/QrHo3/MNf/X7cByKZF+Ki1Atv9/iKH5pIA1GdA4vLsVAnUEVFDPahom1qJcoDpiQ4fCLI9E60L6s3T/j69RpiXBAeflG7FiB3cOwONv/vk2INRfiJVcxM+2/Gz6SwiGfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgWUzFtu7uiYJOYcAXLVPVUagHUm8AfmBomt3sLmXPs=;
 b=IFgQqhDY4mRr+twASXcvv2NfyEnQPs3p8WwO3SY+C4lZ0X+N01HjupHDILz3PrbHB49hkUiKWvbHZFw+6/3xZ58wclaFJEfytucuoTkn6QdQU59RyppPEFVAIdC2Ax6f+WX3MWa05p7J4Glx1y/qeacoYRFBN0p5UDY9nmY5dWABjLGEzecc08J3M9It8XU7jfqsvZ6AMWAGEWCwV4+o6Vss2GpQSGbQlEnHakGcJKEmhsMa578ElfgbFrs/TPSOxiUwU6OhYNmNVmNX02SAFVlP5ecv7QqTBurDTHa7W3IeRGxbYj0kuzCMe42El51cCnH+UGBlIK8b09jhWKAeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=huawei.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgWUzFtu7uiYJOYcAXLVPVUagHUm8AfmBomt3sLmXPs=;
 b=cKJo06FjpJsAUcIv+J6R4X0YiUPimavdWME+/QYZRJyRImeB9fuvcLCao7Lbg4SoCqz1P1A9ZHssuRjc0V41cAuDPF+BlIkRFs/s7ohBKGUadQExcKogs1d3El/292ufmbCRnnJZsXKKDnvLFFfff6sU+7v1C3z9zcxghu/IcRU=
Received: from AM6PR0202CA0057.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::34) by AM0PR0702MB3748.eurprd07.prod.outlook.com
 (2603:10a6:208:1a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.20; Mon, 21 Feb
 2022 14:15:35 +0000
Received: from AM5EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::d1) by AM6PR0202CA0057.outlook.office365.com
 (2603:10a6:20b:3a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27 via Frontend
 Transport; Mon, 21 Feb 2022 14:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT005.mail.protection.outlook.com (10.152.8.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Mon, 21 Feb 2022 14:15:35 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 21 Feb
 2022 15:15:35 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 21 Feb 2022 15:15:35 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx (192.168.55.45) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 21 Feb
 2022 15:15:34 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>, Pavel Zhukov
	<pavel@zhukoff.net>
CC: <pavel@zhukoff.net>, Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: Re: [PATCH] patch.py: Prevent git repo reinitialization
Date: Mon, 21 Feb 2022 15:15:34 +0100
Message-ID: <7357253.EvYhyI6sBW@dhcp-192-168-0-28.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20220221135745.5145-1-pavel@zhukoff.net>
References: <20220221135745.5145-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [192.168.55.45]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c7adb8c-9350-4be0-7f2e-08d9f544a0f3
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3748:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0702MB3748D44EE4A8AC016C256E23BF3A9@AM0PR0702MB3748.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mK54rGFkkP9mR4Jg2/rtRSpZpXo1QagTZ+IhvIsqfajBwfjNxabejkJHCzdTIa/2GI9Cqog4+racl2/78A3ccEJICiUMIrs5KBak8NVFttjYBqd5wfPBpB/D62hiiFKU5XCm07wucBVu9f6z5aglWG4/07azFhwsW7Ynqu0E3BjMLZN1JdCTIYofdN19XVe1H2wYxYiBxsLWi4SURd7y0ylRyT0e+m21yYEdPrtEay7ZexwGEfti5dVt5RKQ5G676Q2nrub3X31WTeWQ/ivkPfJ8ZHvD9R/b8UpB5kZiGhWdS541CAhGvapfTPfWJKrwVxHZPHe9A9Q/YHlm51+YdzZ3gfoOLBL15BElGygjjpdkODRrlwQz8XkhBVentrldoCoUJ5JS9TMHgra3m6zOIcFyeB4Dxotnnrfl0r4mlKv2qNJ2zrMf83aHi1X+oUxHwUoiJretM60lwqen6RfIRsElC+BdoahmpBEPXi+0YpqlBFagQwqXwJfkR17wrZIN+3AZ7OYRSUv4bE5p4NLsJC7DJb9exLXkHWF97kQcpoIVP+/JixwkHb+ws2nCNjds+/CL8waHwX5YCRtldYap2udHNkZ0TyaG2d/eiy+ABaoNj1cTh92o7+wWIbXRUyK8CfnpCxHh9tUSmqAMIunUw+1BXy1M5NotOZRiLquwquYAKKFxTvBUuYIhjPzhBUeEtTXQpWyn394Z632T1ivt4rddzDMny8068Uu/jBggNMmUS55ECiKxlh8UQ8riGWr33uioIt5Zh4nPVKoDPDfd0Q==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(110136005)(26005)(66574015)(8936002)(40460700003)(16526019)(426003)(336012)(82310400004)(186003)(7696005)(9686003)(54906003)(36916002)(508600001)(316002)(70206006)(86362001)(356005)(4326008)(8676002)(81166007)(55016003)(2906002)(36860700001)(47076005)(70586007)(83380400001)(39026012)(36900700001)(102196002);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 14:15:35.6216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c7adb8c-9350-4be0-7f2e-08d9f544a0f3
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT005.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0702MB3748
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162049

On Monday, 21 February 2022, 14:57:46 CET, Pavel Zhukov wrote:
> There were few bugs in the _isInitialized() function which might trigger
> git repo to be reinitialized and patches failing to apply.
>=20
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../net-tools/Add_missing_headers.patch       |  15 +++
>  .../net-tools/net-tools/net-tools-config.h    |  75 +++++++++++
>  .../net-tools/net-tools/net-tools-config.make |  36 ++++++
>  .../recipes-test/net-tools/net-tools_2.10.bb  | 121 ++++++++++++++++++
I guess that these files have been added by accident.

>  meta/lib/oe/patch.py                          |   6 +-
>  meta/lib/oeqa/selftest/cases/bbtests.py       |  20 ++-
>  6 files changed, 268 insertions(+), 5 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/Add_mi=
ssing_headers.patch
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-to=
ols-config.h
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-to=
ols-config.make
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools_2.10.bb
>=20
> ...
>=20
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 950fe723dc..b6fe9b2bdd 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -304,14 +304,14 @@ class GitApplyTree(PatchTree):
> =20
>      def _isInitialized(self):
>          cmd =3D "git rev-parse --show-toplevel"
> -        (status, output) =3D subprocess.getstatusoutput(cmd.split())
> +        (status, output) =3D subprocess.getstatusoutput(cmd)
>          ## Make sure repo is in builddir to not break top-level git repos
> -        return status =3D=3D 0 and os.path.samedir(output, self.dir)
> +        return status =3D=3D 0 and os.path.samefile(o=D0=B8utput, self.d=
ir)
extra character ('=D0=B8')

regards
Christian

> =20
>      def _initRepo(self):
>          runcmd("git init".split(), self.dir)
>          runcmd("git add .".split(), self.dir)
> -        runcmd("git commit -a --allow-empty -m Patching_started".split()=
, self.dir)
> +        runcmd("git commit -a --allow-empty -m bitbake_patching_started"=
=2Esplit(), self.dir)
> =20
>      @staticmethod
>      def extractPatchHeader(patchfile):
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
> index ce72c4bcc6..ae3f230038 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -307,11 +307,27 @@ INHERIT:remove =3D \"report-error\"
>          src =3D get_bb_var("SRC_URI",test_recipe)
>          gitscm =3D re.search("git://", src)
>          self.assertFalse(gitscm, "test_git_patchtool pre-condition faile=
d: {} test recipe contains git repo!".format(test_recipe))
> -        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
> +        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_sta=
tus=3DFalse)
>          fatal =3D re.search("fatal: not a git repository (or any of the =
parent directories)", result.output)
>          self.assertFalse(fatal, "Failed to patch using PATCHTOOL=3D\"git=
\"")
>          self.delete_recipeinc(test_recipe)
> -        bitbake('-cclean man-db')
> +        bitbake('-cclean {}'.format(test_recipe))
> +
> +    def test_git_patchtool2(self):
> +        """ Test if PATCHTOOL=3Dgit works with git repo and doesn't rein=
itialize it
> +        """
> +        test_recipe =3D "net-tools"
> +        self.write_recipeinc(test_recipe, 'PATCHTOOL=3D\"git\"')
> +        src =3D get_bb_var("SRC_URI",test_recipe)
> +        gitscm =3D re.search("git://", src)
> +        self.assertTrue(gitscm, "test_git_patchtool pre-condition failed=
: {} test recipe doesn't contains git repo!".format(test_recipe))
> +        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_sta=
tus=3DFalse)
> +        srcdir =3D get_bb_var('S', test_recipe)
> +        result =3D runCmd("git log", cwd =3D srcdir)
> +        self.assertFalse("bitbake_patching_started" in result.output, ms=
g =3D "Repository has been reinitialized. {}".format(srcdir))
> +        self.delete_recipeinc(test_recipe)
> +        bitbake('-cclean {}'.format(test_recipe))
> +
> =20
>      def test_git_unpack_nonetwork(self):
>          """
>=20





