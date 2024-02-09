Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA71AC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:06:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.95])
 by mx.groups.io with SMTP id smtpd.web10.12353.1707487591931505795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=umBA9IHF;
 spf=pass (domain: navimatix.de, ip: 40.107.104.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxp9UhLl3Fm4aL9sc42zUxVD/A8KlR1sHik2ZYsgS3DLa8fz9q2MH78JcCYE+YipHbHEvMoF3A5PeXOBI0w81fthf8qFhp+n10ConaQuox/pp5boDqrU41Zih5nVjxmiXuAFd5pCbSpuWAgG3oPAn5Hw8dPjXKf3nklBjilDqGUlX+lqQBigOSt+1czTsynDIowm8+RD2FI2n1mNH6on+o3kJd56E85SJZXOg6UgwsgnrOVZvCjXMifCf2+rCshDNQdL96OpwVdOWkxfBeK9DiLLC9dS7N4RYvjsAr4Fd0H3UCm3wELh5JG3DhHVXDiBXsbfQZAN0g3NakHpRiYSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mlj2fZFjdwr35djmrDvsos3t/BFR5PVhRJD6PqDL5o=;
 b=dzYgJVWEasm1KzxLEQ8LYZGlo79GwZ2EsLHGF1m4CM0hAoddS84eAlXppPUJ2RICzk0j/vmVPjtaJkOxj5gWRL2d8KxlSHekW/hsPgdCEHTFJbp66VJxeuSgXhLJjH9BThmzEDTdlNp/xaKq0WJ+QKPqsSj5Jt5OYkPGp3yH6yh09/ecowl2W1js8r322iBGVGyPD/WmQiD5sDuQswSUGkCgLxlAABDETx/2WtSHE4MKlYwwcnVPBSgk0IkMBtRZE/SKqE//QPk0kYTHLfwK1X20A9Ycew+Bs6oelJr2hr0FsIHrEAPkgJiNcxiKaE7k9ChHgX/Wvb5hP93mVLahdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mlj2fZFjdwr35djmrDvsos3t/BFR5PVhRJD6PqDL5o=;
 b=umBA9IHF+DL4MffKsLHzCN1Jh3gUMUF217THa4sAcBi9lk/m1aSIFuIBt96nRgYZmD9tOo2TqtHgWfecKb8WLuoVirmkOYIRzlYOQfUuwiru5bV/ZyVWBLtA/pUdCDR3sswsnQElhpKtVbQvu+NmErlxRMTPxHutcEwsIy6tV+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32) by DBBPR01MB10481.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:52d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 14:06:27 +0000
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00]) by AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00%4]) with mapi id 15.20.7249.039; Fri, 9 Feb 2024
 14:06:27 +0000
Message-ID: <9c388c88-7329-4948-a464-024013802683@navimatix.de>
Date: Fri, 9 Feb 2024 15:06:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Add user space utility:dropwatch
Content-Language: en-US, de-DE
To: chen_heyun@163.com, openembedded-core@lists.openembedded.org
References: <20240209112421.45771-1-chen_heyun@163.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20240209112421.45771-1-chen_heyun@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::14) To AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR01MB4627:EE_|DBBPR01MB10481:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc548d2-f1fe-4438-becb-08dc29784ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GSIxpcu7Hw+iR+xZA8qzPUNToE9LNNl6XMgA4+0F/CXvifmcpadxFnbp21jZFZ+pTqKtXMb4C6/NGJ09IPcLaDUcCemILd3HzQBsMZd1Uo8UzG9bzK6tCVmk8H+wcC0lXoOkXvulTRFF5R+gXcHyexUwtcJKu60E5F0wwrlxeRvc9BLeqb5RV878YdtG9xUCbrHHhAm6VWglLjelofMyznzuUe7baxyRUuhApA7QMxR2/A9DVBNErDIBadsd3kA6cHTIfD/hy4+FSwwEtrXYClVt1pF2RtngW5q9qzLu8+u8i3skLYyD9Nbu8VKX3l7h4fY+Z513C/juuTJ64Jy1ItsE/mQZBjgsPE+F/MnJG+CTFYCvIoYdNog/7+GOxwcHmUMnrS0bqH8kNfby9LcZRG3Ef+Q4HIpOCtz6EUHpSAWtdWgXfCJ1MTTz9nUDFvTnujlXDfkw1pELzG83hDQ9DdtWIDb6Sr4AW1GIt+wkC7DRjyU7bMZx3pqqTewrSPornEFQ8BgpImRWY9fj1U+Te2VNqLC76Ria0lXQKCYc7O0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB4627.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39840400004)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(66946007)(66556008)(8936002)(8676002)(66476007)(2906002)(83380400001)(26005)(66574015)(36756003)(38100700002)(86362001)(31696002)(316002)(2616005)(41300700001)(478600001)(966005)(6486002)(6506007)(6512007)(53546011)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7y5yT9oalmyIel46UFT+pkcUNIVUcgqEr5qlSr29Jo57qsQ61mAHbhnH86ec?=
 =?us-ascii?Q?Ik5IZ2DePfu8N0oLOhqfOW3FHp0wlKxaNbmpSqz+SXxDVjjRyy067hRKVHSE?=
 =?us-ascii?Q?KAyYVb7VJHd8MR7Fmb038mgheo1LnncGy2yXAnanR2JNqvR4OU+7fqtYKbcF?=
 =?us-ascii?Q?PNlLKOYcRMxDRSIAM1qeMEhb7TBoENVIom1IAmHcSawOMHw5zbiCrxNJkpDh?=
 =?us-ascii?Q?GANPAhxuadv5edThDCEmanefsOrXcbQ/wJRTRkyeXTkaqCnjhjU7PFHEuJvS?=
 =?us-ascii?Q?FXgLPfHciOgfytEyJU9/+j3jGrJwKm6zvkNVgDWRHMAHGtazd6jdtGL9DHkY?=
 =?us-ascii?Q?gYXHN5gBlItXciLb9cz85VFmImpuaVH3LCl+RU5lm03nT33X9fyAAsw9Rmx/?=
 =?us-ascii?Q?g/Kou8+2vqG5WhCbTzPee9EL0uOcPyQPNiduUe21fU2po8N090EX+jrNE51j?=
 =?us-ascii?Q?YNEvNodtgXktJYxplEJi0wyd+/brRiJLl79EhbOlMyACTGlR7wbfYSOZiZsl?=
 =?us-ascii?Q?mHvxsNH2mgUHWhvr35yPtL4zLTgz6lkhvnc4ioyHrnF915iiCHyZ3xNPTvKh?=
 =?us-ascii?Q?ELpytazvxg560rwB7uB2RtU18yWhWSXewaYoiZqcklGGfybnLZ5UDxfwUNSb?=
 =?us-ascii?Q?Tc3vH0SvxQ1z6VNS0BhCEamwuHG07UOPJ4QCX1SNTjjTs0ifMZcukPL6JAAV?=
 =?us-ascii?Q?5cIrJ1jDJF2IKauiLlp254/llKS9aefA563z1hup46/3G/nKYHXS7TsyLNnR?=
 =?us-ascii?Q?GVJbcYZgF9bNYOsBbErN8zHly3NhwcyVlPf93nwZaj6/rRItvn2wY5RSxGbJ?=
 =?us-ascii?Q?5R6WAtNKo23MhfQtbew2X7uB+jJra0Bpb3fML1PZlfi3rppAx6alN6BaAHJD?=
 =?us-ascii?Q?WpWpN8zNEm4UKVLuzoE1CJqT+raDEAE3zYR173tV4genxVKDg9owxQZyFE3v?=
 =?us-ascii?Q?N0AqZIXjvAkqu3EVXa/uBejI1bro+xVJQrpXQWeZsSln3IkBJzl8pnbgV6ml?=
 =?us-ascii?Q?B9epNZlvPxhg5MYyiYQibsmQO1cb7vzPl6dyTfSF0VScsoz2fRtyvxcbMK0z?=
 =?us-ascii?Q?DFJjBhOZ/vuj3HYnoum9LoxNbJL0oTGiMJFz+F0a+SQHKfYtK+OxmYFSq8P3?=
 =?us-ascii?Q?4eFYuhXkPilujtqUcHSOGkaZ+HQHmzIv/VF4dL5Cf8cWMpE5GnxoUs4OEWjg?=
 =?us-ascii?Q?XsrbfLl1Hu0LmLXgce9tqXGmw6H0n3XFK+vohHTEUyIDX+ErDafYywJBtDtn?=
 =?us-ascii?Q?3kLUoGb50FSXd4/vZ2mmjxGFCBfLZYRAfYS/66YhfZGhAm1xTVbtqxxip9Qy?=
 =?us-ascii?Q?HV06b3SwNnZwg44U81+4BA05Y9MpOQeyTqwABL9lwU8YCEQQ+O/8kCXaPq5i?=
 =?us-ascii?Q?29UoTPWR+4/pAn7qmgfJ/tb5kr7lwt+zHGAxgEHy98YkTierzvGA04gwwW3p?=
 =?us-ascii?Q?+RAkBf3aj9PZlDMjQh8YZJkVywpWh7KFVocyr9GRqOatMUv4jtVwbE3sCjSy?=
 =?us-ascii?Q?+/8tMY45YMpENd/rEKLNbIYl512d4vfO7FH76zXeOiPq22en294Or54Vhz6Z?=
 =?us-ascii?Q?XQ5ICH35DU8fWXKlSRxJJ9u5TdWgTVac0LwDcvkq2SH4/e4vLEdlLC1QDsUY?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc548d2-f1fe-4438-becb-08dc29784ee7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB4627.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 14:06:27.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOhdXADIW171naOI3m8Yx3dvxS/DXJXl9LGDianKXpDXJMxzUtezmZ+XkR5H64CIGScFB3BwGn0KWuFWXLc0Fz88GesD4LRPpLPiGl1UvkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB10481
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195214

Hi,

can you change the summary of the commit to something like `dropwatch: New =
userspace to diagnose network package drops`? It's common to name the modul=
e/component first and then what happened.

On 09.02.24 12:24, chenheyun via lists.openembedded.org wrote:
> Signed-off-by: chenheyun <chen_heyun@163.com>

Is your name "Chen Heyun"?

> ---
>  .../dropwatch/dropwatch_git.bb                | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100755 meta/recipes-extended/dropwatch/dropwatch_git.bb
>=20
> diff --git a/meta/recipes-extended/dropwatch/dropwatch_git.bb b/meta/reci=
pes-extended/dropwatch/dropwatch_git.bb

Maybe the meta-openembedded/meta-networking would better fit and recipes-su=
pport directory.

> new file mode 100755
> index 0000000000..62a1eab777
> --- /dev/null
> +++ b/meta/recipes-extended/dropwatch/dropwatch_git.bb
> @@ -0,0 +1,22 @@
> +# Copyright (C) 2024 chenheyun <chen_heyun@163.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY  =3D "User space utility to diagnose to NetWorking packets are g=
etting dropped"
> +DESCRIPTION =3D "Dropwatch is an utility to interface to the kernel to m=
onitor for dropped \
> +               network packets"
> +                  =20
> +HOMEPAGE =3D "https://github.com/nhorman/dropwatch/"
> +LICENSE =3D "GPLv2+"

Use the SPDX identifier `GPL-2.0-or-later`

> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
> +DEPENDS =3D "libnl readline libpcap binutils"
> +
> +PV =3D "1.0.0"

The common way is to put the version in the filename in place of `git`, i.e=
. `dropwatch_1.0.0.bb` and don't use the PV.

A useful tool to check the recipes is https://github.com/priv-kweihmann/oel=
int-adv/. You can use=20

docker run -ti --rm -v "$(pwd):/code" -w /code -v oelint-adv-venv:/.venv \
  python:3.12-bookworm /bin/bash -c '
  python3 -m venv --upgrade-deps /.venv
  . /.venv/bin/activate
  python3 -m pip install oelint-adv
  oelint-adv layer/recipes/dropwatch/dropwatch_1.0.0.bb'

Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena =20
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


