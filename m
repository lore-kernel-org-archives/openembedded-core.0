Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42911C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:44:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.98])
 by mx.groups.io with SMTP id smtpd.web11.9053.1672829043904124919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 02:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=TOijgx1n;
 spf=pass (domain: arri.de, ip: 40.107.6.98, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kru5a51odOdTE8+mzud7Ntkwcd6Ucye2+FCUEmEb88quUZpEb7QkpqJeqUKdVkVbSguZFgQEsSdAT7NW/ttWbLPH6ux1mnWJJ/TGpfC+LWKZ95Lc2WodTt/iZyjiU6lJ/wt0DNegYgyOOZ6zWeJnRrdzVIdGtiNySPGjiAX6Wb7wdHZBgj9wZZ/LVVsxFDhENCCfs+mKHMqKiSq+UM5U9Oy03jHSYhijKTBcWumuEquf6OlMf+n3dQMl36NCnDtnlPs867/SBV3URmgNlb0ddCz7d9Exd09mSyji5wu6Cf+eyJeGYv+WtbWdUy+4+6VrsQ6yCR8USQCdfGB/Nd/+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7C6wv2zDAq+DcP2VPG9H72PuxrAiYakLWUraDKRYsk=;
 b=c/ybXmnjT3dp9mbgu/MS6P7RtmFAJTy1KInA+1BRus28pYcv/b/xTAtvloOri+02TJVKSjKOrDx4Yh40k38uSeyyxC3mFg5cOpa7S0rMX43iooyFRUCJIVHoYaCYG/Qj9w7QsNXRSTgm+Y/1TLyG893K3G4lqn72n+s6WAARnSfHaVQaibrDka/UnySBe6Uq5AL82OFDLBLsRBFciw7TULtSy9f/Ggh7y4+ZtXSEsdlwAILZJbMmQHSLagsOEGhm0IraJtevCnq+jDnh+U2PTOWFAu4LZRAXf3el7kWd7YXIOs1GlLRaVXmnPqXl7oHmN3KI1lZJwQaAYJKNbYclZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7C6wv2zDAq+DcP2VPG9H72PuxrAiYakLWUraDKRYsk=;
 b=TOijgx1nekJLofk5JYH72YkhAjB7tlrUJlHQq1vSjWu3q7iV7vSX7uxj5DTBMm4v4oitNNTKo7mLAPIjVSEJ8fcJIZ7DPmPQtOh/ZXX84I+21b6uKhKwoc8UI01o7ciRIVKxglXUIPpVCFGLxL3bpxqc6ZIQTm4Vc9FkP6GAY8s=
Received: from DB6PR0201CA0038.eurprd02.prod.outlook.com (2603:10a6:4:3f::48)
 by AM8PR07MB8107.eurprd07.prod.outlook.com (2603:10a6:20b:36e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 10:44:00 +0000
Received: from DB5EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::27) by DB6PR0201CA0038.outlook.office365.com
 (2603:10a6:4:3f::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 10:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5EUR02FT053.mail.protection.outlook.com (10.13.58.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Wed, 4 Jan 2023 10:44:00 +0000
Received: from n95hx1g2.localnet (192.168.54.43) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 11:43:59 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>, Wang Mingyu
	<wangmy@fujitsu.com>, <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH] boost: upgrade 1.80.0 -> 1.81.0
Date: Wed, 4 Jan 2023 11:43:58 +0100
Message-ID: <4820194.31r3eYUQgx@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.54.43]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR02FT053:EE_|AM8PR07MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: af906905-f731-4b3d-2e80-08daee4096d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gdeZTOGKOeuoSmJS33b3Nkfd/mpvtyOY00Lmc6nN4hJcHKBf1Yl6Pi6GyAlSgu3o0atXyaJtIVA/WK9Mf5hM86277z9W+NhiXIhx2ZUlhuSqzWaZ1lmKG3aB8pvMWcvdrOLwaAKBR5WwzVpc4xhSJ2Q85n+zfitZGwv5MKWMN+gtrLZCpzxBvtJy+pDmvH6AFCT1MjuoxFczi8tb25SkOdKdZH8f5zEXw1JV9QR69jhCPOoSP4tKAMLbyZbOrGulxxZu3ZURAVfjqPkaBhyIBW4xnr1L6Yau+fSnMeOGDvua+Ao/ZKhCv+vv5u3DUc+ndByWc4uG4//T71fGfA7denKyGmPBGjIqfje6NdgmvF/eCHZie36igTNrkACNp1qkRhmdUgShsp0sMlzb2Awr5Z5j1uV4GWpOyTwHlnaLLraZSeLsOaCDB4YbcANe9fJe94sq4vhBGsDBTexrx08cJcbs7HOvMwfssYPsMetvLqVcxPbyQ+RcK2hTQHa03+oJs+TVL8EPccd/CN/nqkadcvkKV60yWFFX/xHzejwW2zdATzyuKbAQNAhI2Pr8l7vLHoUQ9M8TslvakEA5ExqfqrNLpPV++c1q83kN/oUHhdGzmOXWDhgmQBvwEJe3UrdUBdDiAzJpQEt4dLHZIpmic4CxGM1YrA41wvU99+NA5yqF4Rmu4DjjKm2ozZR7jvPvfBAI3/GlsHy/YIQt1DA2QyI1207rmkyK6k9jPlpat2mY0pmwt/fN8f23EzeeUQ127Vvf0FELxRxjN0UGBVcJr1B77JWerqKaxCpX0Tm1FKJMZuz0nJEhzGHqe3GvNK5K
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(396003)(346002)(136003)(451199015)(46966006)(36840700001)(5660300002)(2906002)(8936002)(8676002)(41300700001)(316002)(70206006)(110136005)(70586007)(36916002)(478600001)(966005)(9686003)(82310400005)(16526019)(186003)(26005)(40480700001)(336012)(426003)(83380400001)(47076005)(33716001)(81166007)(356005)(82740400003)(9576002)(86362001)(36860700001)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 10:44:00.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af906905-f731-4b3d-2e80-08daee4096d9
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 10:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175383

On Wednesday, 21 December 2022, 03:59:07 CET, wangmy@fujitsu.com wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> removed since it's included in 1.81.0
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{boost-1.80.0.inc => boost-1.81.0.inc}    |  2 +-
>  ...y-binary_function-base-classes-are-d.patch | 34 -------------------
>  .../{boost_1.80.0.bb => boost_1.81.0.bb}      |  1 -
>  3 files changed, 1 insertion(+), 36 deletions(-)
>  rename meta/recipes-support/boost/{boost-1.80.0.inc => boost-1.81.0.inc} (90%)
>  delete mode 100644 meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
>  rename meta/recipes-support/boost/{boost_1.80.0.bb => boost_1.81.0.bb} (75%)
> 
> diff --git a/meta/recipes-support/boost/boost-1.80.0.inc b/meta/recipes-support/boost/boost-1.81.0.inc
> similarity index 90%
> rename from meta/recipes-support/boost/boost-1.80.0.inc
> rename to meta/recipes-support/boost/boost-1.81.0.inc
> index 3ee82eb9b2..291796c736 100644
> --- a/meta/recipes-support/boost/boost-1.80.0.inc
> +++ b/meta/recipes-support/boost/boost-1.81.0.inc
> @@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P = "boost_${BOOST_VER}"
>  
>  SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
> -SRC_URI[sha256sum] = "1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0"
> +SRC_URI[sha256sum] = "71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa"
>  
>  UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
>  UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
> diff --git a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> deleted file mode 100644
> index 49603348ee..0000000000
> --- a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f9b55f5a1fab85bf73c95e6372779d6f50f75e84 Mon Sep 17 00:00:00 2001
> -From: jzmaddock <john@johnmaddock.co.uk>
> -Date: Mon, 11 Jul 2022 18:26:07 +0100
> -Subject: [PATCH] The std lib unary/binary_function base classes are
> - deprecated/removed from libcpp15. Fixes
> - https://github.com/boostorg/container_hash/issues/24.
> -
> -Upstream-Status: Backport [https://github.com/boostorg/config/pull/440/commits/f0af4a9184457939b89110795ae2d293582c5f66]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - boost/config/stdlib/libcpp.hpp | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/boost/config/stdlib/libcpp.hpp b/boost/config/stdlib/libcpp.hpp
> -index bc8536ead..0e9f2445e 100644
> ---- a/boost/config/stdlib/libcpp.hpp
> -+++ b/boost/config/stdlib/libcpp.hpp
> -@@ -168,4 +168,13 @@
> - #  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
> - #endif
> - 
> -+#if _LIBCPP_VERSION >= 15000
> -+//
> -+// Unary function is now deprecated in C++11 and later:
> -+//
> -+#if __cplusplus >= 201103L
> -+#define BOOST_NO_CXX98_FUNCTION_BASE
> -+#endif
> -+#endif
> -+
> - //  --- end ---
> --- 
> -2.37.2
> -
> diff --git a/meta/recipes-support/boost/boost_1.80.0.bb b/meta/recipes-support/boost/boost_1.81.0.bb
> similarity index 75%
> rename from meta/recipes-support/boost/boost_1.80.0.bb
> rename to meta/recipes-support/boost/boost_1.81.0.bb
> index c34ab7d703..4b580d078b 100644
> --- a/meta/recipes-support/boost/boost_1.80.0.bb
> +++ b/meta/recipes-support/boost/boost_1.81.0.bb
> @@ -4,5 +4,4 @@ require boost.inc
>  SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
>             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> -           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
>             "
> 

There is a new library (boost-url) in boost-1.81.0. So "url" should be added to BOOST_LIBS.
Unfortunately this causes a conflict (sorry, I don't remember which type) with the standalone
boost-url recipe in meta-openembedded (that recipe should be obsolete now).

What is the correct procedure in this case? I guess that it's not possible to atomically remove
the boost-url recipe from meta-openembedded and add "url" to BOOST_LIBS.

regards
Christian




