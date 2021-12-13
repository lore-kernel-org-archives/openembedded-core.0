Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22668C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:35:26 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.49])
 by mx.groups.io with SMTP id smtpd.web09.9199.1639388124562070960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 01:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ckgGerm/;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.49,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsbkC2pMEyjKZ2tVA3vni3XTL4zIePEB+iGbbj7NX0FvD9yiIcyZU3dqpPpDfuf7VcCAhpAr7g6izxKKnJQQZzhsBXJuMDdMGykAd9Fw1t1Nin/w0W6XhiHi1E3lkKIaMLO0wFxLAlxV0fTL+ayoN90QKb1z7PcEveb5w7OBDOSCu4YfYyLTbEi4Uy2eBENYD3aQwfePo64Z1mafbD0RlRpH6xAjmWYlVzVjvRoUFy58wyIKPy2HbK1r47AQY09LKlfm3ZQBs9G3vEslD6zwy6XN0e9UQXmy7t4Uf9vGi8A3x2yzCX3v2R20Ch4zSXq4Jz0go/UPAa0/Td7KBUOZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/0HZIrFEeOrviZEjPy2cpACjCUCF99fYuHzCndYFwM=;
 b=UlTN2Tap6l3kaczACP8X+Lec8gf0uw07ZEa2NQCwUQ7l0eUSGzrTVi2ZHoYWGCZT+U9TmcC6OJ52DUEcZhxm0sz3JO6CoH/ztXw+RwxBUuTrkwyuX5Ah7TStYHXkU5nozmmZQNhHRF+UtD+SUzNCixe0Ha+yiG1tlu9YFXj41coGlGU96n/2m6Ngdm5ITRnsuJVZ7cDqkzDYXHMSpBq2nNYImFgpD0/7qpAxJ4gaIFkvYbA7i2tQsd2a3d+IeEPSGE0VUa7huAmphbRGTiEdFRKDyrKygBwuB95NhqjUPYsODJWWqVJw5d0nKvVDM9bgLBzoNjwmSZQF/7/4Y9qxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/0HZIrFEeOrviZEjPy2cpACjCUCF99fYuHzCndYFwM=;
 b=ckgGerm/tEtqnSJ3BBt+9r1ZSh0nGo/9ByP0l3ehBpEm9wBhqsmQoJmMgqybUbenxPA4CninGMPWmMeq2Brt5hHAsdRXI7irg3vCQOgzdXl2z9/2cfiqP9XYg7gUshKkxqFQibgKGVt8I7ku4a+LF8QkufvzZT+nqFqutOvovFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2313.eurprd04.prod.outlook.com (2603:10a6:3:22::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 09:35:20 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66%5]) with mapi id 15.20.4755.021; Mon, 13 Dec 2021
 09:35:20 +0000
Date: Mon, 13 Dec 2021 10:35:18 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] epiphany: Add packageconfig for libsoup2
Message-ID: <20211213093518.jpnnysvl2lr4wdpt@fedora>
References: <20211209204432.3924129-1-JPEWhacker@gmail.com>
 <20211210153834.348522-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210153834.348522-1-JPEWhacker@gmail.com>
X-ClientProxiedBy: AM6P193CA0104.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::45) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P193CA0104.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=) via Frontend Transport; Mon, 13 Dec 2021 09:35:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb0ffd15-ba95-4350-f201-08d9be1be154
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2313:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB23138FCE8944207439572A14C2749@HE1PR0401MB2313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OmGmOil/muHf8MV3FW+AdI0WLZkD65EU3QKX1CA0aRby/7Nrm/ALyDWC0zBPgc9AEDknqTWKPmxhkTQyZlbjan4F7mVhZglEHPA6oPKjFi+PHEgbmvUwzD7/Gg7RzMF5D6pfGwNl3Qcyla97WozHEq2wQD7eo1wjt+jPqkgTCKDPGSvCbfL8cy3ZCIi7k4BU9uEzicVgjqzbMFFWpSj8mq4Zm0Te6fCUrZLvwIDTYW1Wk0puGpbot9CmlO4vdgf09+k2lYo9nq9yVtD7yMR9d8S30bYIRTO1xDQxK9+YvOnWztPKE6mEtAkwo7oZ2kqgXhzYRY2FDBuwtzweBTSl0va0yomM6dmLJInNtTMrIBFtfYUc3cmYmh03KgJvtlWycPhe2knWsB2jK5OkGXTcVAO0biQMk9HxN/Je/iLTNaUcCFghf92lrwly5b5/sYjl8fD3rZnYyH5IVo3h/jhPwTCiOnPDIHzP32EQ6vT4+rVm1VVcuz/i01ACpyP9hH13KuLEBhuZzeJrB7Tb8NxxEdttOXSRk2Ax2BM9HrwumZBptMa5USpaNdtzJKt5a2fTPMxeNHoSF01RcYfF2ptt4AaFakyHzfV3YKiEUvo/FqAg80AUjHUOc0RznDJBCTaYQAmlZnb+xEqEny6q1TjN4c2CFq+8o20RYv7xd5Iup1uvJO6y4D4ShEj2uPVhBhGg+2VCYJ9tXP0o4iodAYtXfmi8aB7QouOtcCVj6+7nIaS6aChc61ps9jMdbEQ59F6VSmjmRj1vnxusEAXWPXIbKyPmPCSsBKvBP2aeiA4xxGc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(5660300002)(52116002)(9576002)(4326008)(66946007)(33716001)(1076003)(26005)(956004)(316002)(6496006)(966005)(38100700002)(6916009)(38350700002)(44832011)(83380400001)(186003)(86362001)(2906002)(508600001)(55016003)(8936002)(8676002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y8weRym0dYHRj2bqrnIuNqkgllOCebkmhqJbWCKfFKgitll+shlYDO/svusm?=
 =?us-ascii?Q?jEv3mF5mue+DXwjUepmzAYk9h94GHJRIhCpoI4zUO90MFGR1sQsfjuS+AddV?=
 =?us-ascii?Q?dOt8h5HEslP728CfHA+xH8wJC728yPQ2zHxFG0HZAaOKLASaUxarlIfc3DkP?=
 =?us-ascii?Q?5ORxyC+CzS2wzpMKNV0baVrSpFURy8YlkNkIp9xqOf50lGSU4C4hzlERN5H+?=
 =?us-ascii?Q?mvxAfuZV39j1+tdqJwJ15/wtTQ6uUqkUCUUNnzPMatQP5Cgrw6b6UbwCFf68?=
 =?us-ascii?Q?Oe6TmMILDPTFxEg9JN5bU7itMHcUmujOTKAkVlDak5HNbIChWwrpejZ6Qov1?=
 =?us-ascii?Q?R2EmbM6bL58ED+OxXq62bz3w1zJCrWDXQjX8EyLRO5yVE1QibIFK2X676BPK?=
 =?us-ascii?Q?0/eQSNvuu6rQbri5c3wgBCBIa9xLLllQ8AYnIBU6qYOsFLkQX9LfThO6V+H8?=
 =?us-ascii?Q?dH39NW7t3cpqluttclIdElRDwUwpzNdvNGeZZ/QzUsDPluyOew4FBJQ22MgX?=
 =?us-ascii?Q?6DpMKpnkMAI9HuI9WNDzASvzlQ4Mfzx2135WhwA5VGiJ1PAQARoQN7LZkmFx?=
 =?us-ascii?Q?h7MyUFSqnXfeJ8rjKvWuvaH111KuKqtYNmqr0mPOJ7IEjY+csSGP3YrbMrxi?=
 =?us-ascii?Q?RQaLLGZgjcS4P+QM5SGZTe8sOKUDIcv4k3u2brXUlUH7wHjN6nfafw2T4WrG?=
 =?us-ascii?Q?2saY64wJaQj6Q9ozhXB9KBCAUiby2P07mfBuGLxlcNqcTGVhjYqZVYtEaTHf?=
 =?us-ascii?Q?jbF7vdcFsaXIQTWp2sx8RCIAIB5WuPHuMWMxJaudkdOJquI/4vh4aJbgFwHa?=
 =?us-ascii?Q?LfwSsvezGOcg71cMf7dOhSydw16aGmFtkndkTB1ZvB/DRnjLCqSZUlcL4lRC?=
 =?us-ascii?Q?LQ2zFA8zUF1+8GKiVNFkUnCiYbBOA5sYGGh0har4zdlmsgT0YkT/eEaTr/2r?=
 =?us-ascii?Q?wNk1HWc7puW8KotRtWFo7tL6QL6KG4Y3jsozo728fxNBl0yYiWNtTE+GES9n?=
 =?us-ascii?Q?GE3IoYsI0ZI7lIY/ch3Z7QBAmliXLFVQvxUv2pYYZq6YBPflVkI37zlUuMPJ?=
 =?us-ascii?Q?auarTmQiCOiJLVxfTrl+7oyMC0VAoHrYX17AhFbeFJzXSlvEznzRbjNEx+gF?=
 =?us-ascii?Q?41BI8g9AwbvVrJGIh8HlgVPjWLhaJBshkrmpXPW9n+VEIRe2O1aS3jveSVua?=
 =?us-ascii?Q?/8szgkoOzl308yo7zogGNVU2yi95twBuPzteXVn0bKF0dXGCrVijg/1T37f1?=
 =?us-ascii?Q?ZxZpSnPE9Ua2M1gvUTaiKZGnRZibuWpdhLjTVJvHGe/Ni0j6RMczJKQMD2Cy?=
 =?us-ascii?Q?tx+z007KRmzNLUAapaB/KczCKVM/sSX9SGx391ZCfBa3tybZY91UL9Y0bWrV?=
 =?us-ascii?Q?iitgebejQwWkfku3+/TOvGwvrQsXt6nZnX+jdJ2DnAxHD/VCNU8NxT2qGHtV?=
 =?us-ascii?Q?drPGS0IPYTYcLh8HinR62FR3XQ6YPrMxzp83LWr2+O46KwUFm+Ek9SxD9KIk?=
 =?us-ascii?Q?K7m3uTgzfGmwwNYc56aQhQlytZU+gAEc3EDcjcp7z+TxYyuUcQTvMhmwxjqm?=
 =?us-ascii?Q?So3OjeYTq9wAu3Gd7caJEMWJcBwYchVwuMCO9p3EXHtMNUeOGaAtcfcC+wDx?=
 =?us-ascii?Q?77cdNwIrAiTDuCQFHvHjKYadQWmd6h4o8Z9To5A2ZumhzJtuObdMuPx0udvL?=
 =?us-ascii?Q?ZLmSMnRlHvP2NUf+ODWs+BcDko3PwIjTwV1rEOi7DkUc1ruBnYHgoET3Lhwz?=
 =?us-ascii?Q?7WOHGq8S7Q=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb0ffd15-ba95-4350-f201-08d9be1be154
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:35:20.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gJiWxH60awCF+aRVUQKcAOWJd/mmrdS6EGp0G01ut3dRrO/lz5Tpyv4L8lqZB+31qmRsOXf22xYOjrAaDCq4gCcjHN9b/pc8pcJ3GXlDYVQD4QxuMMRpqW16JFDfBJBd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 09:35:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159617

On Fri, Dec 10, 2021 at 09:38:34AM -0600, Joshua Watt wrote:
> Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
> Including libsoup2 and libsoup3 in the same process can cause strange
> runtime failures, and the latest release of each major version will
> cause the process to exit if both are detected on startup.
> 
> The default is changed from libsoup3 back to libsoup2 to follow
> webkitgtk.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Looks good to me, thanks :)

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

> ---
>  meta/recipes-gnome/epiphany/epiphany_41.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> index 09210b68aa..8f3bd87340 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> @@ -30,10 +30,13 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
>             "
>  SRC_URI[archive.sha256sum] = "b39d1825492595b0b74c5d6a6686a857f9419dfa4c02f8013c297bc870e26dd0"
>  
> -EXTRA_OEMESON += "-Dsoup2=disabled"
> +PACKAGECONFIG_SOUP ?= "soup2"
> +PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
>  
>  # Developer mode enables debugging
>  PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> +PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
> +PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
>  
>  FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159547): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_159547&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=2hMmPB8qgNu5GuMqIURwRmq1Rs7if87P_AhoEw4L8UQrQyEUArsW3nEjybBImI2w&s=ygC_4G0ot9waRXH8wbCG08hwNlPEdHhPoFUNyEi_2sM&e= 
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_87638363_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=2hMmPB8qgNu5GuMqIURwRmq1Rs7if87P_AhoEw4L8UQrQyEUArsW3nEjybBImI2w&s=grTmpjGInBBSVnkP99IqQv1nyVnO3Jf_4fTmSnjNfnU&e= 
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=2hMmPB8qgNu5GuMqIURwRmq1Rs7if87P_AhoEw4L8UQrQyEUArsW3nEjybBImI2w&s=SzzhWmULE-4adbXYZsnVn-rXVhLcqNYMQm9jgWmfT5A&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


