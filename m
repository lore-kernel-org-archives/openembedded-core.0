Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A898ACDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 20:26:04 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web10.23204.1697142359008806766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 13:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=P2P7bjzZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.220.42, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQ3gihS4LvkvY0P5pSO06HRlcwe74EsUUreIUqLGR6cPyQCBfOU/YoP4xb0L0hD/1LmHH8dx70gwOgiLYfVM131jD7gHyD5O9dEc/NK6H/wqhuZjqMPDIxW2bRln+GnK3/kqq6u0rQmF/JJviSM3iygvSXXSQgfZ0f9LiTtBDHGHjz0NMBGfjyW40IWjK8C2t6EN7XcnOJ4mqmK0LBqyqZa6NT1fIy77p8Ya4APKXgHMv/kqTzhP4CYpTZIuigh/lMpDsqdWEd/Hl397/b0uOKQPmgNuucWid8A4eEimfIPKibXVzk7MLVJ380lT8rY5mQDfWs2QGyTs/PbI6vhaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7VQAMteQzqZfCadRqtWOFWY3PDFmF3FdEiIgMmRXPU=;
 b=NdjNl2uq+5kkaw4Z+ApnycsTpyG/5H/YrlDwQPJzkFktf5HwwFWMktiN2muPbd9TQ5SAKVl6QkEvZatvigDOJMX73ZnIs4V6+kU+mWeYnqNH6GmpDrjRshF/drinorV11/V4ImgB1vYElEEoYBuzihi0uIL/BGtnKeibmO7HqR+1+gYzwy+832rwb2lSOr/iQ7qOraMCnWu3r7Oj1hNVPEq4YlHtn0VCc72nVLAYpqE8OG0NskNlhoIl6u6zgAgLy9aScd0SlLr89Iytvh+auAs9JreoddEfcnYGQFxUtEwyULl0jHHh92c/sZ3CKXU+UvEiyfFdbRxBrdbNKYpNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7VQAMteQzqZfCadRqtWOFWY3PDFmF3FdEiIgMmRXPU=;
 b=P2P7bjzZodTkzAATgavk/vSy4yrP17Art4xv14DzMkRmB9/WsqqpimsNsEblaeCexcyVhUlsXhnv5MWvZ6lRJk3sMX4S03NPKyMaC2oFOdlYBOW5N4JBKwTnao5bxpvPIg4X7yJofpc+7is62yo0u/Sgg17iUPVnvsveEVkhADtCKaRUiSH3s1of+MPR6Vok9ulhZS1rP9Nqg79gNntaphVHWNMGrnkTxGRheJrY0bdelJMobBXdA9IGt/vsGdQMv2nC/cdosbToam5qpt+/QdHmcMKbDF71q2y+9qoLdGWFNNQZQOTf5Fx8iJkyxiym2ys4MuQE3d1bdh0ZelFJCw==
Received: from MW4PR04CA0196.namprd04.prod.outlook.com (2603:10b6:303:86::21)
 by SA1PR12MB7125.namprd12.prod.outlook.com (2603:10b6:806:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Thu, 12 Oct
 2023 20:25:55 +0000
Received: from MW2NAM12FT050.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::94) by MW4PR04CA0196.outlook.office365.com
 (2603:10b6:303:86::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Thu, 12 Oct 2023 20:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT050.mail.protection.outlook.com (10.13.180.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.15 via Frontend Transport; Thu, 12 Oct 2023 20:25:54 +0000
Received: from chris-virtual-machine.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 14:26:51 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jon.richardson@generac.com>, <bruce.ashfield@gmail.com>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix 'devtool modify' for kernels
Date: Thu, 12 Oct 2023 16:25:33 -0400
Message-ID: <20231012202535.2902235-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT050:EE_|SA1PR12MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4661a4-9156-427f-8408-08dbcb616f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TvLgIq1f4LNiaUCF3VMN7TWQc9iS4kGcrCs9QnPYWsmGAI2i08qjZ1BIuMuoAAhsZirGaemVCfq25OyhAKaPCfJOIYo32iTsgwVinT75j4was4zrwWdUsVwnZXgDjMZETgnWKChnp85AkznCM1PBNOtV5YpigQz7omaJBQfNBZZRGh9XXeTmKd3DjkVPv7wKBc+/vPjk5JfHE2HrfRia6F0RG0+9AQY0YyHd4KdlTLShtRki4cHH9NaaO5NZ1oK1AK3x4rJNRu+uGJ3VymIwdN+PaAb6gUJo30pDaO+jT/4Om2pDr/XI8YJV/h56qSBFLfQV2iBSLUej14+NaEceFOVTzBjPObUl0gKkJC/CQJaOnFvd/FccBQnEo5VizItnDOSS/6/LaEa3fhIvVQkMUl6KArCq9pRy/wH38Y1JrGDZSRcxhnRL+C3GZr9AgN6mOebic80soUuMupIemVgfkv7UcZZRp2wEo+0Aw7Kj9wzEEAwfXvFcgHB/BcmjS/JuUcfbJFeFvP8Yixfz4RcOnSPD2Di/DBQ3X00ZA2Wo6u50OR3KRZrU5xY8qhVMKQV0adDKoK/OemcUt/0bVo9gKPGS9oqN4Tbk1TDW1zbhazE4NA/HvWL5CqXISr/zArNCfvw7IQR+MAC1OKHoSjEgg3srV8+hqj0JrKUuxEmEKe2KX7Y+S2shA44FXlXnUUG58RuQzIJrHouuklhTkG5pc/H2UYY1/l77PbdQNeZzZNVs4CGePBimBfnCLiejOJVS
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(46966006)(36840700001)(40470700004)(4326008)(6666004)(107886003)(1076003)(8676002)(40460700003)(26005)(36860700001)(82740400003)(36756003)(356005)(86362001)(7636003)(426003)(54906003)(83380400001)(2876002)(478600001)(8936002)(2616005)(2906002)(40480700001)(70206006)(316002)(41300700001)(47076005)(6916009)(956004)(5660300002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 20:25:54.0269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4661a4-9156-427f-8408-08dbcb616f39
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT050.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 20:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189023

From: Chris Laplante <chris.laplante@agilent.com>

Fixes a couple of different issues that all conspired to break 'devtool
modify' for many use cases with kernel-yocto recipes.

To explain, we need to consider the basic flow of how 'devtool modify'
works for a recipe using kernel-yocto.bbclass:

     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
     =E2=94=82do_kernel_checkout=E2=94=82
     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     =E2=94=82 Sets up ${S}
     =E2=94=82 devtool_post_unpack: sets up 'devtool' branch
     =E2=96=BC
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
     =E2=94=82do_validate_branches=E2=94=82
     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     =E2=94=82 Checks out the machine branch (derived from ${KBRANCH}) and =
performs validation
     =E2=96=BC
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
     =E2=94=82do_kernel_metadata=E2=94=82
     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     =E2=94=82 Generates the config and patch series.
     =E2=94=82
     =E2=96=BC
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90
     =E2=94=82do_patch=E2=94=82
     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98
       Applies patches from patch series.

The first issue becomes clear when visualizing the flow above. The
'devtool' branch is checked out during 'do_kernel_checkout', but then
'do_validate_branches' stomps on it by checking out its machine branch.
So fix (1) is to add a postfunc to 'do_validate_branches' to checkout
the 'devtool' branch again.

Next, we need to look at the flow and consider how things work when
SRC_URI override branches are involved.

Consider:

    SRC_URI:append:fake-machine =3D " file://0001-my-patch.patch"
    SRC_URI:append:fake-machine-2 =3D " file://0001-my-patch.patch"

Assuming neither overrides are active, we'd expect a 'devtool' branch
that just points to the initial rev, then
'devtool-override-fake-machine' and 'devtool-override-fake-machine-2'
branches that each point to the same commit for 0001-my-patch.

Setting aside the matter of how the override branch set is determined,
the flow looks like this:

     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
     =E2=94=82do_kernel_checkout=E2=94=82
     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     =E2=94=82 Sets up ${S}
     =E2=94=82 devtool_post_unpack: sets up 'devtool' branch
     =E2=96=BC
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
     =E2=94=82do_validate_branches=E2=94=82
     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     =E2=94=82 Checks out the machine branch (derived from ${KBRANCH} and p=
erforms validation
     =E2=96=BC
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
     =E2=94=82do_kernel_metadata=E2=94=82
     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     =E2=94=82 Generates the config and patch series.
     =E2=94=82
     =E2=96=BC
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90
     =E2=94=82do_patch=E2=94=82
     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98
       Applies patches from patch series.
       devtool_post_patch:
                      =E2=94=8C=E2=94=80=E2=96=BA for each extra override..=
. =E2=94=80=E2=94=80=E2=94=90
                      =E2=94=82                                =E2=96=BC
                      =E2=94=82                   create devtool-override- =
branch
                      =E2=94=82                                =E2=94=82
                      =E2=94=82                                =E2=96=BC
                      =E2=94=82                   set OVERRIDES/FILESOVERRI=
DES
                      =E2=94=82                                =E2=94=82
                      =E2=94=82                            =E2=94=8C=E2=94=
=80=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
                      =E2=94=82                            =E2=94=82do_patc=
h=E2=94=82
                      =E2=94=82                            =E2=94=94=E2=94=
=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
                      =E2=94=82                                =E2=94=82
                      =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98

In the loop, we set OVERRIDES & FILESOVERRIDES such that
SRC_URI contains the correct patches for each override. But
when we call 'do_patch', it is still using the patch series file that
was generated during the call to 'do_kernel_metadata'. So the correct
patches are not applied.

The solution to this issue is to insert a call to 'do_kernel_metadata'
in between setting OVERRIDES & FILESOVERRIDES and the call to
'do_patch'. We do need to slightly tweak 'do_kernel_metadata' to be able
to clear out the previous 'fence post' files, otherwise in the example
above, the 0001-my-patch.patch would only be applied to the first
override branch that is processed.

[YOCTO #14723]

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes-recipe/kernel-yocto.bbclass |  4 ++++
 meta/classes/devtool-source.bbclass      | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass
index 4ac977b122..a5fb6e42f3 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -332,6 +332,10 @@ do_patch() {
 		if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
 		    kgit_extra_args=3D"--commit-sha author"
 		fi
+		if [ "${_DEVTOOL_RUNNING_DO_KERNEL_METADATA}" =3D "1" ]; then
+		    # see devtool-source.bbclass for explanation
+		    kgit-s2q --clean
+		fi
 		kgit-s2q --gen -v $kgit_extra_args --patches .kernel-meta/
 		if [ $? -ne 0 ]; then
 			bberror "Could not apply patches for ${KMACHINE}."
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-sou=
rce.bbclass
index a02b1e9b0e..b037c5612b 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -57,6 +57,7 @@ python() {
     if is_kernel_yocto:
         unpacktask =3D 'do_kernel_checkout'
         d.appendVarFlag('do_configure', 'postfuncs', ' devtool_post_config=
ure')
+        d.appendVarFlag('do_validate_branches', 'postfuncs', ' devtool_pos=
t_validate_branches')
     else:
         unpacktask =3D 'do_unpack'
     d.appendVarFlag(unpacktask, 'postfuncs', ' devtool_post_unpack')
@@ -187,6 +188,16 @@ python devtool_post_patch() {
         except bb.process.ExecutionError:
             pass
=20
+    is_kernel_yocto =3D bb.data.inherits_class('kernel-yocto', d)
+    def kernel_pre_patch(localdata):
+        if is_kernel_yocto:
+            # Need to run do_kernel_metadata first, since it is what gener=
ates the patch series that is applied
+            # by the do_patch task. Also, we set a variable to tell do_ker=
nel_metadata that it needs to cleanup
+            # the kgit-s2q.last fence post files first. Otherwise if you h=
ave two override branches that apply the
+            # same patch, it will only get applied for the first branch.
+            localdata.setVar('_DEVTOOL_RUNNING_DO_KERNEL_METADATA', '1')
+            bb.build.exec_func('do_kernel_metadata', localdata)
+
     extra_overrides =3D d.getVar('DEVTOOL_EXTRA_OVERRIDES')
     if extra_overrides:
         extra_overrides =3D set(extra_overrides.split(':'))
@@ -206,6 +217,7 @@ python devtool_post_patch() {
             localdata =3D bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', ':'.join(no_overrides))
             localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides))
+            kernel_pre_patch(localdata)
             bb.build.exec_func('do_patch', localdata)
             rm_patches()
             # Now we need to reconcile the dev branch with the no-override=
s one
@@ -225,6 +237,7 @@ python devtool_post_patch() {
                 # Run do_patch function with the override applied
                 localdata.setVar('OVERRIDES', ':'.join(no_overrides + [ove=
rride]))
                 localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides +=
 [override]))
+                kernel_pre_patch(localdata)
                 bb.build.exec_func('do_patch', localdata)
                 rm_patches()
                 # Now we need to reconcile the new branch with the no-over=
rides one
@@ -239,3 +252,12 @@ python devtool_post_configure() {
     tempdir =3D d.getVar('DEVTOOL_TEMPDIR')
     shutil.copy2(os.path.join(d.getVar('B'), '.config'), tempdir)
 }
+
+python devtool_post_validate_branches() {
+    # do_validate_branches took us off of the 'devtool' branch, so re-chec=
kout the branch
+    devbranch =3D d.getVar('DEVTOOL_DEVBRANCH')
+    tempdir =3D d.getVar('DEVTOOL_TEMPDIR')
+    with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
+        srcsubdir =3D f.read()
+    bb.process.run(f'git checkout {devbranch}', cwd=3Dsrcsubdir)
+}
--=20
2.34.1


