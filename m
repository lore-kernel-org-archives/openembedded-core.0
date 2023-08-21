Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07DEEE49A0
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 21:06:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web10.2427.1692652010750196585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 14:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=w287AYXf;
 spf=pass (domain: welotec.com, ip: 40.107.21.77, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh51xucvvpTfSQN4L0cCPRvlAyy0lG4w5c9Z+azBDCmoGXwniUge8II9EJhaJvpGdYFDwm3N8ryUxGrGJ6mr2wW6ZEDXAljsdXB8tIPn7wgmjurLBaGJEBgbWrdEzrU3+diT9bGaWUTfBTDAK2/hTL0tbTbT4GsLjcUmn7vvdi8omLdfgXfAve141nTvFV4H+ANC/aEhkfqoI/G2ngMSeEJ5aJ/Cni03bC+EfOlDctKEzThXhKMoaQTel+kT0aSW671FxRd7EjVem/4fJbNNmt7mw16fjLlsxvY+RFqft8z9Eit9rWiWW4Sk5dSgQeAqdFdPAPq+z96qewB4hmCBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQ70OdY052g6bp+tr7GeHD9uZJ7xt/9rPfzzvnx6a8Q=;
 b=GcWl/ofF9pZhs3iWVkZ8iKOPuOnpaOivU4J/x36WqEGBICUifZC3DYbOnEy/j8O2LsQiXxV+XZvqh5lEJ27ju0LyfwvZ5/cm8WSL1aufLHQerCK5t6uYs4WLVVhZEbH8Uz9XeYKKa+dNR2x3YfVDA5hdMz0ExR3A/aj1MmNKtEbxPXSwDErTwgjTChoVNyUqyX46RfV3NKbKhViJQafGMtvokLejR2kyTK3RC2TzXveAnjt1HoB88grwHn4EFRbFq//Q2dGSdvWL90HBtpzd8F7GGmYIVg/Wa/7IWPAsJI61+4Gk0hnBxptU3qC7jKfupd9YDo9LJz/AsKx4Fy2s9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQ70OdY052g6bp+tr7GeHD9uZJ7xt/9rPfzzvnx6a8Q=;
 b=w287AYXfEbobPbXB/Yen9MYtw+URIrbywCIn5Ho2cCJt4h8pNiH0nH5qZ3LIFs7SOP4uUpT+JHIKTuqrQSZ3Y68Imxvl/EOlfvfFIbatowF2fe4gffFIGPQowgxQK6i96h1239UpkKQ1Vw7rkNxend+jAaR7tC2iCSTuNAtBONBsKhwYmEfdOO+2jk8fabJVXOPR7j/PV8h6KxrpijYsWWKlOI8nZHZWcVENuJ816+8p7cXavKRl8BOL7/txVWnv00/DNyzskTIA5V7DYRoXEitTGJEok6YLUKyZtMti8lSBn1J5wQMYtTlm57KYmcm0ohl0faJlr/n/dOAknnUfxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB8838.eurprd04.prod.outlook.com (2603:10a6:10:2e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Mon, 21 Aug
 2023 21:06:45 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::f8b6:e68b:c240:b500]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::f8b6:e68b:c240:b500%3]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 21:06:45 +0000
Message-ID: <51919f8f-c8a1-1f53-9d46-fa794333cbae@welotec.com>
Date: Mon, 21 Aug 2023 23:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][PATCH v3] sstatesig: Add ACL and XATTR data to outhash
Content-Language: en-US
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
References: <20230817191202.1565879-1-JPEWhacker@gmail.com>
 <20230818162909.1733262-1-JPEWhacker@gmail.com>
From: =?UTF-8?Q?Piotr_=c5=81obacz?= <p.lobacz@welotec.com>
In-Reply-To: <20230818162909.1733262-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::16) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: f11a7b41-cea9-4372-3d12-08dba28a86b6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	50AUSvujEXklcfRkBn+m8uSdhd5ywWxjwZDqbhsBf5PYp8vUjWirktFwUqNO151KnvRBXA309rle71LkT4/lehPrh0Sd6ATQDS3vays+GrXSwqUFSklLNav31N8asTJWvcjWTPA7SNZIVnVooYUvImcnr0bTPcX4bG/mitP1nKJ482ByL+gqSolPHb+elIn/lnHD5jFpY/chI0P2L5GTrQBCV6Xnob4OXGMaMar69vfRoHego7yh2YXDsqWvEREOGXOpRTfonqV0SONBxwkt1v0zG7XxWXotk40akJuebDU8/C6dDo97N1VeYtIyXHR6pZhU8hlMiTJWLR6PBndX8w62/zax8UNQJPYPS1W0zuqxp1PpZzfhcaSJ1HWC80FLRcpfVZSj5Mrc5LyTrLQEJQD0hvl83JFtxz/lu/s+LaiNt0H1RmezfD9p8z2mUNz9K6WY4CY0VA9/d7s4Au+LiOGbK8n5RU7Rgwfs152yU/1MwRidP4qVefqSB1HV+ykwnGyAI1+jWFDxk52W5Kk/A6rBQV/jedbriUYmm7z8/NphmCiQsHWnrb+n4CXcbgCxYd+3/hFOTPAiGwlUQjvkuWfV2rYl6UpknKMzW4gWz7prrfSnelJZOU2kp2ZrGVRDvmiQ/rnSLDvYmIJ6FDaejA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(376002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(478600001)(66899024)(66574015)(83380400001)(2906002)(6486002)(8676002)(6666004)(66476007)(6506007)(66946007)(26005)(66556008)(5660300002)(41300700001)(2616005)(6512007)(316002)(8936002)(966005)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?US0lkpptUQRSn4JGGN29brpFHPKGvUiScf5tBaSCBdtAClEKvgEApOmSAZhb?=
 =?us-ascii?Q?UgYAagGCjLNkTDxh8KvUMKPGN5kQpeyKp6+Azn+PGW1w8uMT6fptTECfbNPx?=
 =?us-ascii?Q?lmHInQPR+K+c2eN9koti5OWPAtyUI4r/dVf1Y1UAPSWjXUu180H/d61PbdEv?=
 =?us-ascii?Q?I1y8v6U45n7rsF9gUjhEmeweL60R0z8HIZOrZIzYlA9vVZTG7j/5RshK0NK6?=
 =?us-ascii?Q?vCoC0C8S4jPMqKm8Lo/190l//tHa9Xz7Hfpz72YektP52WhfPzYTadvYKy03?=
 =?us-ascii?Q?JfQwRW49bDNfb0kzAQA92FjVhf5oI243lS2CJqbkhWcoMK60zKgfhXLJ9jY6?=
 =?us-ascii?Q?14UoH5cO5V6h+wQfYRCNMsxNL1WzJMSXn0fHerSwwGReYwttqe1ZwXApeJTy?=
 =?us-ascii?Q?y67CzNbp3GzhQmjn8oxGtLThUT6VGzdupayr1IUqguawqin4XTV1IlefmQ38?=
 =?us-ascii?Q?WX6oPPMPA8WqPha19X1hTMy7Gs9bQSYmpQU/PXQH3CcBwKUi1FaHz82ecGAf?=
 =?us-ascii?Q?iYGFP/080Wqk6l7694cOEDCsGjIKYcP1eBbx+x3ZYClcfiZdGMQBeOO25vv2?=
 =?us-ascii?Q?SZBZoAeTZJ+yCugQ7gmkc1kE2nEeGFXHYipBvaEjrOuxAXm4xru2u+aaZ9g1?=
 =?us-ascii?Q?9Ad/r9H0RUEuPU3j7tKa/lEuvEUMNvHW4IwMYB02+Uj1SVeSisBTSrFpNbKu?=
 =?us-ascii?Q?VAndg6YtO7GfnZaincdEX5AoNlYR049yU1pKTiz7tB7SUkR5X9AOL3SwOI3G?=
 =?us-ascii?Q?nb0x/2QoDGLl+arCXdopqux5MX3Oq7ZOnjfvLQ80baYtTvSq7nJ8Gp589++F?=
 =?us-ascii?Q?nasr7W0VHI0X3R23/FQ35kk2mzXXj3K4dggUA7IOtsHEp0noo2ROlqphZrWs?=
 =?us-ascii?Q?8vBY5mUPBo0eArEdohQBVoGSBZbImKkkNF4ctGS8jwwVWh3tKPWCn3ObARFf?=
 =?us-ascii?Q?Ia2QPVz30GOaYWS37fpf8UPb/t1QnIBDzTd4w2IdBsmhjcdFkJez5SK9RaaS?=
 =?us-ascii?Q?qeFNspzj2a/HjiDUGDJWbOm5OXaNcjE+FneP0yoR64suy26C868p6zJ2d2bp?=
 =?us-ascii?Q?gvjtKFO/HAMUyUGsfET9LYp/+EnLfkGChQlQ/kRH2CwYwOzaQuTIyG4Uxmd6?=
 =?us-ascii?Q?aI8KhR2Cl3mESj9SYuGvJX3zzx5dlTldB96OYlbnIVX9djXS4Wwt7MRZJQ8O?=
 =?us-ascii?Q?bWpAQCjsKBeuJnUbJt52LhjeXZ4zf7mx4J7UNKtPFAudG4b5gd2L/MNV/j6+?=
 =?us-ascii?Q?zq1zvKgpRVuYIQzLgB6x5nmaz5/XXckAP4gNlgjocT8pKWgOL9MPFH+b0RgG?=
 =?us-ascii?Q?/eLGVwcc1q3S7TN7CjpoQbYdRtPQXpYTugg2WGbwgRk6sOiMKswziHJRzCk7?=
 =?us-ascii?Q?DU/TAOn5DzASPlCqN4kUcsJ5HmHHsMaGzC2Lac0svJf+qIig9uSmWLpwgYVa?=
 =?us-ascii?Q?b/D5k+tpX4//Yc8kA35w7wjGVwenGD3d/SmcxBQvG7uqOiXtUl5pmwFyxy1n?=
 =?us-ascii?Q?P3Atv5wC9+dlFPMNcfGxskYYMlD07pgjum7/K9dTr0Twd4gySFWMVW677Yoj?=
 =?us-ascii?Q?gC4DBXgyP2kmlb+4Lqe4JBklNf5HV5QMBhm5CxjO?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11a7b41-cea9-4372-3d12-08dba28a86b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 21:06:45.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNzto0eEegZ6lrK27wvCNulCOhHYUAUQuHCOVx/L9g8RRjK+/H51htaH7fT+Jr+ijg9K/d/CiE59aIECA3ZiJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 21:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186484


W dniu 18.08.2023 o=C2=A018:29, Joshua Watt via lists.openembedded.org pisz=
e:
> Records the ACL and (some) extended attributes in the outhash
>
Reviewed-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
Tested-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> NOTE: This requires ACL and XATTR support from bitbake
>
> V2: Filter ACLs to not duplicate the stat mode (since that also does
> extra filtering)
>
> V3: Fix missing .items() when iterating XATTRS
>
>   meta/lib/oe/sstatesig.py | 42 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 633a0fd4502..fb39efa933e 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -478,6 +478,8 @@ def OEOuthashBasic(path, sigfile, task, d):
>       import grp
>       import re
>       import fnmatch
> +    import bb.xattr
> +    import bb.acl
>  =20
>       def update_hash(s):
>           s =3D s.encode('utf-8')
> @@ -640,6 +642,46 @@ def OEOuthashBasic(path, sigfile, task, d):
>  =20
>                   update_hash("\n")
>  =20
> +                def filter_acl(entry):
> +                    # Skip owner user, owner group, and other tags. Thes=
e are
> +                    # covered by the stat permissions above
> +                    if entry.tag in (bb.acl.ACL_USER_OBJ, bb.acl.ACL_GRO=
UP_OBJ, bb.acl.ACL_OTHER):
> +                        return False
> +                    return True
> +
> +                def add_acl(path, typ, name):
> +                    acl =3D bb.acl.ACL.from_path(path, typ)
> +                    entries =3D [e for e in acl.entries() if filter_acl(=
e)]
> +                    if entries:
> +                        update_hash(name)
> +                        update_hash(":\n")
> +                        entries.sort(key=3Dlambda x: (x.tag, x.qualifier=
, x.mode))
> +                        for e in entries:
> +                            update_hash(str(e))
> +                            update_hash("\n")
> +
> +                def filter_xattr(name):
> +                    # ACLs are handled above
> +                    if name =3D=3D "system.posix_acl_access":
> +                        return False
> +                    if name =3D=3D "system.posix_acl_default":
> +                        return False
> +                    return True
> +
> +                # libacl always follows symlinks, so skip them
> +                if not stat.S_ISLNK(s.st_mode):
> +                    add_acl(path, bb.acl.ACL_TYPE_ACCESS, "ACL")
> +                    if stat.S_ISDIR(s.st_mode):
> +                        add_acl(path, bb.acl.ACL_TYPE_DEFAULT, "Default =
ACL")
> +
> +                attrs =3D bb.xattr.get_all_xattr(path, follow=3DFalse)
> +                # Ignore ACLs; those are covered above
> +                attrs =3D {k: v for k, v in attrs.items() if filter_xatt=
r(k)}
> +                if attrs:
> +                    update_hash("XATTR:\n")
> +                    for k, v in attrs.items():
> +                        update_hash("%s: %s\n" % (k, v))
> +
>               # Process this directory and all its child files
>               if include_root or root !=3D ".":
>                   process(root)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186379): https://lists.openembedded.org/g/openembedde=
d-core/message/186379
> Mute This Topic: https://lists.openembedded.org/mt/100823926/7527613
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [p.=
lobacz@welotec.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

