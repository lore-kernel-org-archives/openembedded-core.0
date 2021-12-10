Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D40C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:34:34 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.87])
 by mx.groups.io with SMTP id smtpd.web11.8889.1639150472603326818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=hDnQznVc;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.87,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPd6sraYEj1n+5reoGMREXdbabSs/AJxosquqJkgT5tdwjAAopDvQxXaHdo6OAlhjMASSeASOcNxhB7S4XitR5tej2hbt0lQsQekdT6XHBxdzf/CNTwQepuRGOWcKhRoxlQNStqarmT1hzp6xPeEbcU4zF7A1dJoKBSaF/kpRCG5FL9LA7QjMh6e6vlMCm2Vu3C7aUqTk0P+JsIFj+EioLy4RLUJwwY7CgvwfCbE3ewehxkr7g/gljiyRxaG/UhrQ1SnzdDKlCUTjoTU2CQeuK5KhcliBWZc41swAZI/tirINYo9m7uDbpRcFF46BB8tiBfKWsS2QTrbAuBb60vxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJRSTyenp9Dvx8PZgmbjK/C+nm5bZMELVqhFwXAwmJk=;
 b=TpQkoWjGbHmbmvaIc8ieo7j/SafSNpDNJJ3FQQNqRNCQ/P+ApM+SNCFxOTgpD9RxfnGZiK8AYq8R3lNwYsFjET9KiUu4GCBuZ++YUMWVq75aYQ/e1aMY0Xj9tcyg2yRWT4yfLC1Tqizbu/Zb0lL58JYavtS8vfr119Q25unKQC0oH/YIMp8ozhAdNTo8KS5gFf3oDLymuimWIxjqw2OZjHmx4VuQOcZvlOrBgN7zCD8UFeXHIRcvNM6fWOLEduxOEYA3Hr2ge2veqlbSHgXPHe161foImA4uZgWqpZDgpZs5E39FIy3cJCLTXo9Yhh7R5HXWx3Saar3Ki00rI+vcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJRSTyenp9Dvx8PZgmbjK/C+nm5bZMELVqhFwXAwmJk=;
 b=hDnQznVcgqc6GMkkZ9PDS2tHH4OY/XehJ50oZ6yNhzkhx1qgQX50wSaA0LBEwCqL51zOsR1ayoNdZr8AdNEp+hU4HDWN+fK6TtlpkrBgiO0m3gkuBfrfogpNjEvnyr3+42lYdiQ+Fjd9SPdlbTIaAY1SWJ6cLU2tpfORjSzSPYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3681.eurprd04.prod.outlook.com
 (2603:10a6:208:7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 15:34:29 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 15:34:29 +0000
Date: Fri, 10 Dec 2021 16:34:27 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [PATCH 1/3] kmscube: fix build on OpenGL ES 3 dependencies not
 providing GLES3/gl3ext.h
Message-ID: <20211210153427.m73ze3amz4odyd7q@fedora>
References: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: AM6P194CA0104.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::45) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P194CA0104.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=) via Frontend Transport; Fri, 10 Dec 2021 15:34:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a97f07-0b47-4a69-cf0b-08d9bbf28e40
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3681:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3681B635C5D3D2F6E5CA5AE2C2719@AM0PR0402MB3681.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7HT81kM5ht5dl73e7yUXI/KVEeTCi4wEWhkjV40R8fg3KdJvQ3Xqc09FX4vxJjG/rukPS/+Dv3HbWo30bLnl538+m4Xn5MmccRu6OUoD2G5OtdChIHpupxi6vmf+u/WgjRGJgvJC3Pk2mIRrMBN6Xv+LRVMMANyGm6Kqap9vc26bL/c9EWESuRgwJjBIyaZk3rThYEeo8xo3QNBQa9pfFM2ITOgUJVosp3JhS0IHKDwvbb2E8BcG7VR/IOnJ8Ky0tiqJhtl19JjNLhNHpvv0SiF1ucHjjb6owqcjwX9r4krFBeZ9ClaT+bFyEWncaTTafXwrhI7ZqrY43CWnFUtq8i0wOq2LzeQ+PrWIIJF2Lp6LQ5QjhoCI6pfcvFClH7ujdihI7IFlA7MT5wrwIaxoYAfm3KQZP5XESFF+c84SpXvTFM4OwmDq/vG3znkxGB70GjxIbiq3almGZNXPAFy1WPlgFhfvuV0HSjwfsaiMNcQAZrhwvnqX4oG2rtt0f5P19SnzZNd+NTfQ8FvnmeqooX45YkKBgzdenox0dwK/pc4LR0bltj1ycIP7GXP1t3FD0VBY/ECpdVQE6AZ7p81A5GDnzK3RjeZfqtqY09wUjYaigI6jr5XBTGRdnf03CLe08lu4kOS1DWytWA7Q36TyNcDUUFgJxtNJ8GuWJsqPKFW0MXQp7c+76jM+NaeiyOQSVIGlJjWRKPVMNn9i4rp3BN++JjqlsGOT4HqNjAecVPqeeEeezSzTTlUS48wP9xVNaZC8A1E/Dg508wFHHRyS8I2PSo4q7w5bqPnw+/EZtLg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(6916009)(66556008)(66476007)(66946007)(1076003)(8936002)(186003)(55016003)(8676002)(2906002)(52116002)(316002)(9576002)(16799955002)(956004)(86362001)(26005)(4326008)(38100700002)(5660300002)(966005)(44832011)(6496006)(508600001)(9686003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zRyFen6+LD1HR+3AXTSAUW5MMmvW9vma8LQ7pjFN3N74n9YbRCI4yjDNlU5B?=
 =?us-ascii?Q?Avu8yNJfzjGaRE7djp8te7gGCozXEA94Qw6tWEPbtp0/gasOSEFM6lqQVXT7?=
 =?us-ascii?Q?G+dAAnaRg6ZESVuaO5PW4HhTmVyPiw3KJRcCGvD/v8dzA0TTV+FBAHXFBdPN?=
 =?us-ascii?Q?pLpkP666yAddJjRKgP2UJH9AWyMBX1lZWh7Zy3Ta0khNOuKB03V/UNK7QGrv?=
 =?us-ascii?Q?p8eXPvR5l3FXtpTcQcy0Wl67nITTXE7JB8CX01LCElhoYPcheeoJCT8GQnV9?=
 =?us-ascii?Q?k5YuFnSBO9fPw1l+IVED6W8rBkcrZa0JjqGO1mZOxQk+JLUxXd6wTEp8x1RO?=
 =?us-ascii?Q?TUU8nBumYUr4lNit0jcrWWxqrcQF7VjSIo7frEa2I5iA+2hwOd6yffApFhkU?=
 =?us-ascii?Q?wsEumWNsZUcWO4EAtciUoFlJlrLYzT1u/dUv2b0bs4GJUAX74vhhfJEOjo2m?=
 =?us-ascii?Q?gh3muUg0DMtBhS3u8tGkHnWU2yYYMUBUq2hv1qzGymnE4vGkwzDUn49n9H/k?=
 =?us-ascii?Q?lIJAWRTeB1iWzfKTIMUv1RzM13JVulbUoUr1/NPHQOPJtp1/r3C08XynmYDZ?=
 =?us-ascii?Q?6+ZW2dCpfpNpxVhw+lzNDIFv3lrhlpBEHY7ifA3Y6EmId4IAJjWa4kTEcG8s?=
 =?us-ascii?Q?Gmfo0cRApcPvfT+FOwZkndlfh+OjBYjKuapgho+yPGhU7bqyiEVtWUVzYZkI?=
 =?us-ascii?Q?ohDgl8MdSM9QXV7+bRzr4sB9yDF33UufGJoxcCxmysDIKLNpYUUbN7DW1Z0B?=
 =?us-ascii?Q?dpDVMyqTeMDEE70ZPI4u0JvWR4fl1eYo6VLqLyIFAFyZaurg261tCULc2d5+?=
 =?us-ascii?Q?Fb4gwQdvwQnyMCC8Zviy0HX4RPEtmy79Paes9b/GOKLdUzCaIHyOt22BYxQL?=
 =?us-ascii?Q?E62BZU9Zm5VccC7al3eAOy0QeYD28FArZOhd20C4QSif6LTk4b58Pd58SAC0?=
 =?us-ascii?Q?5p7IkXVnqRx6TL/rkCmkG/N1gHN+tIFpCaOywjZ6Dj9cBjDFklRHYoHzyT20?=
 =?us-ascii?Q?T8VdT3wUKkc2IsTgdrhReIXtxMsOZowq5txz7/3B2O8dijNfI8nLeCoka1nf?=
 =?us-ascii?Q?jRFEepOVRaeY4XOW5wjKjholFVuF5h8lx/Sr6C0gzoTxhFAwpm6n7vz2lY8K?=
 =?us-ascii?Q?D7zmpERI55kpeB1XFSikPnA/lB9f1Ud6RqWLh1ExkCNnCgg8PmDCqn9rquXG?=
 =?us-ascii?Q?W8ePaTtUxKk8p5tATugBL6CLy7YrHfhT8mQcD31TGpgzw/k1Ap532+4cMakW?=
 =?us-ascii?Q?F5S3bqD1znPyl+/i5w7454GhaYZ+xtP/puj1c4udBRIRJ+3z3LmGb6uA1oHe?=
 =?us-ascii?Q?T6b2IST/BJGdDDViRp8gFtZYdxKuieTYJw3K7Vr2epxcylWwPn8SBsLQSN4G?=
 =?us-ascii?Q?pWfH38P4nhEY/swYfmK7WVJzGO4wk9yNX4/OAWi05Wlo2TtmM5vl19AzA4kA?=
 =?us-ascii?Q?eYD4zdhAcyTey/3uT/VIo7XCFhhwWF8SCpdkBwS3QwPyoeKTBfUq5vtTlz9r?=
 =?us-ascii?Q?ed1iua6LzeeIJPMLelueuCUfQlmEHZXvETArkbV/WbKzRMmWtbMfs695aAXc?=
 =?us-ascii?Q?o6SJWj8BUrpdxeL630GFndO8oYgBClpql59z+xLYxjVnNxGuw+KRqjKWFTJ8?=
 =?us-ascii?Q?zVPmEEWzvmFGhIRuJ6GfXwPn3Brfp68acRRC4mXUc1RxpDBaVfaugGfK05Rm?=
 =?us-ascii?Q?wpppQflhyn5Y7X5uIbWtl+fv0pNxuNedOji43FiCEKinttfQDKLx4MEaM67N?=
 =?us-ascii?Q?7flYcCWGVg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68a97f07-0b47-4a69-cf0b-08d9bbf28e40
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:34:29.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 44YjalKmsneJPozrEHDE3rVTelPQ3OTCoR9nB1JDFSGnhNvrqnHA+VHEWLuX5X+bjOij2JGWBkLqWWXnydQ38fHf3TxBl9qO5AmaODj88TQtIljOwowo/tv4in8aushw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159545

On Fri, Dec 10, 2021 at 04:09:28PM +0100, Quentin Schulz wrote:
> According to Khronos documentation[1], gl2ext.h can be used for OpenGL
> ES 3. Some vendor implementation of OpenGL ES 3, such as
> Rockchip's libmali[2], do not have a gl3ext.h but only a gl2ext.h while
> being OpenGL ES 3 compliant.
> 
> This fixes the header files to be included from gl3ext.h to gl2ext.h to
> be compatible with (hopefully) all OpenGL ES 3 implementations.
> 
> [1] https://www.khronos.org/registry/OpenGL/index_es.php#headers
> [2] https://github.com/rockchip-linux/libmali
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  ...ator-Use-correct-GL-extension-header.patch | 33 +++++++++++++++++++
>  meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-graphics/kmscube/0001-texturator-Use-correct-GL-extension-header.patch
> 
> diff --git a/meta/recipes-graphics/kmscube/0001-texturator-Use-correct-GL-extension-header.patch b/meta/recipes-graphics/kmscube/0001-texturator-Use-correct-GL-extension-header.patch
> new file mode 100644
> index 0000000000..5965782de7
> --- /dev/null
> +++ b/meta/recipes-graphics/kmscube/0001-texturator-Use-correct-GL-extension-header.patch

Wrong path here, forgot to run a build before sending the patch, will
send a v2 sometime soon but reviews welcome anyway :)

Cheers,
Quentin

