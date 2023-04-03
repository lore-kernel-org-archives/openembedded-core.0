Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F50C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 12:24:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web10.68541.1680524678977534638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 05:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=A7P6yxxa;
 spf=pass (domain: welotec.com, ip: 40.107.20.87, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8e3ZwnAVR4raCpAzYQw1pL2x85hSmq791zHWL220Z1wWKwPT91b6qHVgQSpfyJxu3ZQHu8Tv1YcUY8owBxGMLhzacq+Hcuq5iIgOCFWQzuGGiQPcXY2lpw3zsOZXrVQQ2CxmfX1YZiUE5E/FGauOd+/7olL74rhDgxfG0NoK9Cmm0bpuXrTa8oxtZwy3P2P3tNdM8/LExcR+vdadxXAhMlwmfk+J4J9ehNpBeBPQxovJVs9PLRGARiZ3s3uQZRpX/tfBXOr0qWo1VCHrfs50ocQs/hyzFtXtx4QXu9XhS/HrS08SKTLL8b7wV6QoIe+EfrJi2wa2E8pd/SvmT3CNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vGjY+6CkZ/bQ9hZ+fN9QZnxV8zV+POAd9pwGHv+JDI=;
 b=ih8nA6+QISOr4gsSf+5UXLaLdWBz4cr+1mUI2TlrOu+Dnug6nVd+6E7XW3HcfQJM5IbKmfIAgI/rwReO343YH4ks4LH0ZqE8CnkavGwLAeG2EISqYco2NIRLS6ZQ01AfN1To7OF3xfVjFTlveisYApjqq13pm5tqeI/zDDQ91SjiHArhfPjfpniT9jldc8LMhp/lbHwZHVn4ffG77ld99zms5uvo7sncXJ3g/doFBFaCxhxkyNo8jobNxdQRP/o4nw6PHa2JiAJY7qGuHncm3f+p+GZl74QCx/XhsCOqNSevVJIqFmGQ81ZG9GuLVEg5iKVaUCoJEjxZgBwnol+4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vGjY+6CkZ/bQ9hZ+fN9QZnxV8zV+POAd9pwGHv+JDI=;
 b=A7P6yxxa7GTJ8BCT2D6uU3j5My7kfuNDPkgm/Ukko7kSBww+KXvp7PyCV5mNRu8CcOUEzWe5ZPG/dtoP9qMJlWOrkU2JPmHpj9m2bmTr3+xZkQSZjmar3NM1A+kjmtKNvQwB/4VQS8BQazFjtESvkBQojtHtdHsKMGeihy8ft00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:24:34 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:24:34 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-core][kirkstone][PATCH v2 1/4] package.bbclase: Add ACLs and xattrs to perform_packagecopy
Date: Mon,  3 Apr 2023 14:24:06 +0200
Message-ID: <20230403122409.3067997-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e829af3-a873-40bd-b8c2-08db343e624d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nZlj0rkb5Cm509YGjVnsFIT/Blld3Q/nLizAJ9qgrsTEUXpYLIG8ZZHXsR/8j+ylUEXEw1FijyIm718RUO6u+2G9rFPZepny2NtCQkq2wKALtZxZpdLc64pfiNuhvV6bKdV8Rfsjun+PhtH5LB/z2t1grESeKxhSwCDeVcauav8Fgyn2XOVcjzM6ZQ/yHBU0EhmS7nbH7j311BTwjzepRy4za4u0RvYbHn9+vujXSeN52zq9ycYd+r4OSwOLBnoYToRa1w+IO/LrkltQ3eISxWHY5JKX/kMg4wSn4wfxUx3BIXUhzCcoBjc21FiGSmVCQv5p9bfZKq5Sf8K7RAvTCAjdf2f03ACE4T3EDy7+Rf7G26Oai+ernjH6AnUdJQUH/U81JShIhi+Ak6JAWhsYmAfS4lsOs539F14dyXmtIhYCpiQscZVO99ACGiZG6VFgmhXQfU6GnyvXyQnOfbdIAbazbdJ8FgcaIkSz/ExuALylaQWxUm843CTGgJes7+PfLuVXwQhe7Uy6kN8VcXVittkVmd8bLHBbwCYFxUW0rJBGGguWsQhDgEqOJCBpR9jfI0+VUgfXgCZuqxkdnKUmDm+4cnl3Dh5KReRAjODxJ68vS1PoDYVs8xc+hsjBSFOb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(4326008)(6916009)(8676002)(66946007)(66556008)(86362001)(66574015)(66476007)(2906002)(41300700001)(316002)(478600001)(38100700002)(36756003)(52116002)(38350700002)(6486002)(8936002)(2616005)(5660300002)(6512007)(186003)(6666004)(107886003)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6vUNR4ua6E5VGIY3sh2O0giSw3PIyvb9m2EEWId72BCZqm92zuFPg+GK5rmi?=
 =?us-ascii?Q?EVB023OI7Pmx/Zpo5yiTsGZq9bEjbFuzpiPMWsD03ilUsV+B+7ir2UzaPGlp?=
 =?us-ascii?Q?FJiXkt5Nx0WTdpdLG6JPzOUL43jZuWYJwYCehH8AD9HCWDH/tCaTjTP46jOL?=
 =?us-ascii?Q?mkRnJSyESH5spCgo3mracA5QTDcHRR19S1IQKs6H76eJCkBnh0lDxjxdJA4T?=
 =?us-ascii?Q?RRMwt5SOjREHGtjntATqHbmaObxkz20SeIZwBVydVbnIxfOrLzzLIfaC7Wja?=
 =?us-ascii?Q?LCFtSyL/Zt6BOZdO/dCbjW+fUHW9fyN0AY1oSlBH2cNYj+o2WseQwau5P5Sl?=
 =?us-ascii?Q?Zw46mxKUgELcGcaInnergRlSdzEYs+OD8eoU5pcZm359JsFNO+83qf4nYBRw?=
 =?us-ascii?Q?Tfs0zvGL1vZMSWgHxw6ejOdQ5poLKvlntDmmfWQLlmApUto9TwxJdE6fkvB6?=
 =?us-ascii?Q?PR8AxvCHf3YArNWkaWFIAGX+Ez+TA/jeQv8xm73bKiqVYqsgrI9+/gM3JBCz?=
 =?us-ascii?Q?YzwCW2vL1dYOcVEnwOGpIdvdgVnL4ChudPKABJOXKfJ5CYOwlRg70k4DYfkw?=
 =?us-ascii?Q?B+jSjqX0kw1Q7Oq/5dM9V3WWm9TZpDKBv04/2RLbvJQL4SIaVn7gyHeVoyS5?=
 =?us-ascii?Q?w/ydFav6g++tcjhJFuLjUMhLyCKm8PRZFZTgO4b1aVX2RzDUT69CcePELUDU?=
 =?us-ascii?Q?Q32TMmN0l0Ws+PCiEVVQnzAZfsMMx7/8TA0T7qwWgxH+mohFRwlg3oUTlrfr?=
 =?us-ascii?Q?JdTNmJRriiiUC0eaAJeR5o+c7HfRn3NRB/IeYUKx3FxgMUEGxuYuRmsSSk6Y?=
 =?us-ascii?Q?C1pq2aowPRGYlWG97/EG4xP2Z9TGGWj3NH/nD7NdI1jQQCPWC2idkAn+OsMV?=
 =?us-ascii?Q?wo5/kICKkCj8ZbDvBL/ja3DPRppAsAHkuEVGeGdBcqB7WnzxOMvw455isQy5?=
 =?us-ascii?Q?mFieIfubfUdhdcFl2+wHkGL2lwPTkQFT3sYPelTseUpfeq33n7c/Xctba8CV?=
 =?us-ascii?Q?PQdsaRC+b005E0jj08CPtbW1eGyCaLOl+UtDJ4CxKXJWECM5d/8E2rbVmcIG?=
 =?us-ascii?Q?6AV3w8s+4QqgKm4GmhtbXKPn7+ZPJyA8wft+3xw8dKXEPNcgTrSYYiG8PsUN?=
 =?us-ascii?Q?dn8hFms/Sl8/lRzcDyKSqBVP3GKiXrIkeyqqRhTkSP18ifkHeSUU/IwmucNU?=
 =?us-ascii?Q?yknUBr2TyE4UV+qzubqV9SEK1iN8LogtbCNKw47Ypn+YL9XcGpi9zRs0o6pE?=
 =?us-ascii?Q?CF+ZuALCS54XtKZ5H3ot0BKPN3oFr1tkugkA3/NW+aPXAMmxemVtlfqVsh6A?=
 =?us-ascii?Q?19PQg8lzlatZl/Mily7uoD6aMlUbjm5TUxqPW43XT5Agyim5/iS44X5ahBO3?=
 =?us-ascii?Q?LE2D9M8wsOFZMTncBYdLpGVjFc1E4h4dEnD3oohDLHKZXAZuiO5D+Jdvmj90?=
 =?us-ascii?Q?HTe4bg9ogHu75cw7Z4nRfPJLQqdHtMyElePMkvxDD1lGxwZFcNad8ARp9Y4K?=
 =?us-ascii?Q?qTNC+8dddl4dziyAe8JY4dePV/NovVXgxQuGo0G6odf45yOCnYVZo1E5yCVa?=
 =?us-ascii?Q?uyS91KIL6a0dINdA5Ylr/mkfb9WmWqbnp+13wQ61?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e829af3-a873-40bd-b8c2-08db343e624d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:24:34.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjnB1NCi5ZQhjyJZ1LhCxX5qTCkB9W58nxBs3DmbOKwXVyF+ec1dI88wqkBd9DsbQfsEXmhY0E6yjrqfUXv8Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 12:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179626

This is necessary in order to preserve all the extended attributes
set in do_install also in PKGD directory, otherwise they are
dropped and not stored in created package(s).

For the momemnt it is only supported by OPKG package manager
as it has support for libarchive and tar implementations, which
supports ACLs and xattrs.

Fixes: [YOCTO #9858]

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2950218145..b0334d9190 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -863,8 +863,8 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot-only -cf - -C %s -p=
 -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


