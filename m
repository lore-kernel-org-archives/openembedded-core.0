Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9828C04FDF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=VUh+SVW8;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZxLbY95ImbWT34l8J5v8NlxOJIVY7DmvnX7snUxPEUkssGJtjnw7n1xf8FKS1cZmU4KdCWxarwhs3960AQYExe9klGbd3EPp/yeLiY9sEFuTfNOrLgxzo9sG4APrg1XI0do0NrWoWfJ7CapqXHJiRQUODP3Zk42PMHOQFHcl3gsWA1dab41w5KHwZNLVo3bdsJA19/I13OR4KLpZksdoqkPR6NmBtA9UxA1OGjg/gif7Ntod9Sy1m0zQczeAIOISYhsuuXoNNY6hZQSH+E88wtO/oA8fAA+GMdPvlJKqw2GZY8Cz4GUM5ad1HxjCBaOT4HWw240C/AFgrzF1BnMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSkC6qHErWAFN/8n+Ki+GHftdpPACZQTf2InthnBfZw=;
 b=Tb8xTaNrFUoLlib8UxFvQfBmA61hhMAreRH6UwM0Y0FH/1NeO/fJqutMsBi5D+vbfH5TSlgZla1R7lGU/r6j2EJHRGzVQy8lx5HICNV72nXfFXbiQqtFSWbADbc/Guqg0VKqB6FElv1o67bqOgV+pL5kBl3D4U1RVab4se7dFflCfmE5Nws3rqB+5sZFOrHMD+nPSvgWgJCPKVv1H5Y+BMoGkj88Dsv76xJPG7k44Yh+fs7yEPDyovnnUcPwD8maHl4EyQXZ+BZG/DvHvkfyYjT7v/6PPTAkZgZ4AF3inde7CJKQLWzWCBJlOSFhsBI1B7mBfYcHnSjZgHqJXvGegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSkC6qHErWAFN/8n+Ki+GHftdpPACZQTf2InthnBfZw=;
 b=VUh+SVW87TmxiYBtsinhr3MLuzqd3amHTH8iRi/HP0RkGIZbZQ6lnMAQEcQqCEVKr3DcdTZb1ow8li/5B2YA8NMTBgxoT2NVk6zjjavINBGvz2Ws+UzCwj033uJWpfGG50GLOV9iO6S3RLVx3WGA5QXXX1auu9yBN2w/f6Dwx9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 08:45:08 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:45:08 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all additional attributes
Date: Fri,  4 Aug 2023 10:43:09 +0200
Message-ID: <20230804084315.55768-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa0a2ec-c101-40e9-3e09-08db94c71b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HPao+eng7B6owiS0QfPuna8nt2Gn2pvUyuIn7uDizlzm/oJLKef7oF+do9ZB3OV8M/AtfuJZ9btFfeRm/bIxTWZICnQBLEyKjNJLOboDk0v0Vj59oCMtZNlwU0YDWToo8covLL2RjP5CXpKbFHhp+h4GCKEL5hvzES+LAeP5XS4ZkYneg/u3CbySwg0Soxnn0h0cOJoMJMIE/PenzBbQc/bd83k8oWRc01NO/YE07HyKOArMQmnsISqYgW4uf/hHDgWcvdwzGrcrRiy1bwD17WSh9bMSlkMypUa1bQCAZv7T+sKZcfA2OgIj8UWxxbF0W+04MzHIPSKNEoTMjV/BcpsqxLAJqv9t18TvQaPYSddB/oJJxHvHAvlzpraq/WLY0I5cpBz87N3F43HG4SO1ny/TGp9QxOJj6z8I5FJmWiiU9w3tQ/xPSWGQO1pABEMUMW5Kh+/QcAsiIUJwtO01vd0WZo6ynwk4plYaNKYjvdi8oeFKuPR12mN6Pu/w26/+O2dPX7Pq6h/vcc5f2dvQfYzLaMrb2j5v9WUqaEJUF1utuDpwSeSOVxoaBfTXmgr31m/EKdmMoN7bKLxSxzy5u6UJlOxho9N6dmxIbyW0/qFPGSUe3ro8+pU3Gh9pF7cG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(6486002)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HkQ1F9MXy3unFje8aY8+8R9iNixdr9mMwpFGhx/JldWi8IVBqgF6aEtslSYm?=
 =?us-ascii?Q?+RIuWOr5m1BIH2OFjyCErIeIEG1Bi6yVJAG9zeLnHwabJdcywpSwZja26FT8?=
 =?us-ascii?Q?8Upk4WuyKYWbMBuPXmcN5b6SOnwcBu7WNMDBJKALDQacvBoICsNIwA7RIkAl?=
 =?us-ascii?Q?8let0X0GbUmazfQ8LPimh67+/SXzJVfPg8llYuIfVotmj3F5Xc3le+qqOqpW?=
 =?us-ascii?Q?3a+SXgaXiq23PDkip3euQhpn0sPVfNbrHOhWlqBU/pnWw9bvQWhtw0ZHPn9D?=
 =?us-ascii?Q?cVWK422APByZllZeTq+n/ind2ofHUgLg84UQSgNNyPw0BfxCfPzbG02sR/Gi?=
 =?us-ascii?Q?YWpkLRnTXrCU/CMAO9I58CkSUHjbYLeLL5EyoUUe3HX62xi0PFRKT2crGf2m?=
 =?us-ascii?Q?czvD/o1AzbkI9b/Gnl26XxMbas/j7y+fjbg4qTJrVPQKJURCVENgh19IQuk8?=
 =?us-ascii?Q?7xK5dptPdP5Qs1kf7zgjg9WsaNVquRDQ2g0bSNAGb+1xhOIut4ih+2fqBJoY?=
 =?us-ascii?Q?1ha9AzGSsoiBqcIt6PBGtag9BY7lZyolyoK9pfIAoTt4QhV3k0OvQdpR/n0o?=
 =?us-ascii?Q?ZuQ0wWZLlJpATS/qmuZI4tSDVs+go0np5C1+yGttOQxEEBM5OomA5mfdL8MB?=
 =?us-ascii?Q?6iZSo4kg0WluWsedKDeiuYFdGld4YxwCuEgHCA3pK5HHljj5DyTJQqcyye26?=
 =?us-ascii?Q?JiRTTSHsKgndwl6Jtb7QsR5sFtOCSHdz2FQ8LvoZ2A0EOFEwSxrGIETTl/YP?=
 =?us-ascii?Q?8ZESxPcSAg6WPI91gTTXT9ssBNJsqvhXO0Ta+amq0pNE9+PE2gP4N2ko6Pa5?=
 =?us-ascii?Q?cAXtbDnVw+Kpw/4F9unxJZm3xUXd2sQm01sN9GxSfJT79HeO0rG7/dYxnTtL?=
 =?us-ascii?Q?pHlmdkrRHs+sSWqsr2NEVtOyOKFCboaZFKno0CgRw1b53Z4S3JPh5+OgF9HX?=
 =?us-ascii?Q?GHiY3zYIFDeaFOChXrtop7opmsoRgJfCtn/LVRHw4v9MYV5Ge/yiDyilE8Ht?=
 =?us-ascii?Q?nr0kS5R9PkDI0uqazCc0GDZJx9iBsm3S2S2gsftwoszViqk9J66dE+iL8DZR?=
 =?us-ascii?Q?1GQtQgGiA/TNMZDJTmKuO0WUjGvbWqSTZg4BlmZRGBiVQukLSNt+wgliPq9v?=
 =?us-ascii?Q?XDjSGflciumXpLN/u0kCei7TTRDcxTS13xyHAr9/5PIAoJEf6dCdyxqLGjXs?=
 =?us-ascii?Q?DN/5dNvoejJFbQV8pW9wPIoA+92j/nc1qhWsgA1RrxeJUcPPmdVM0A3fHz9s?=
 =?us-ascii?Q?t3h0LYD0N7xH/8En81NYX6ihZQKTEZ/FyVMUfCTfKV/WkROhRZj7VTToB65X?=
 =?us-ascii?Q?l2lngVm42VOTkrthdcXweKIz4w/B2kixBOcWT+5z7FTr9ziKHnzzUUk+FGRK?=
 =?us-ascii?Q?//kU/WqKhJQirR02t1sNpObYB3iFVGgTYxgGH/hGHR+M1PHU8B6/Roefu1bS?=
 =?us-ascii?Q?KqgSnyP4LTkPlKfR1/GXRm3zPtiC9lP57u7l8WFLjBAtN+WtJhTGzTAbgG3B?=
 =?us-ascii?Q?DGgK/lG1J7EbY71zqfWCrfBn4Oh6AplAST4CNoMombosS1OKG4v1bnWqb1a3?=
 =?us-ascii?Q?ykfZIVtrbJfFzC30ZPC0J2yJx/sxFpmYhNn70l1v?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa0a2ec-c101-40e9-3e09-08db94c71b01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:07.7220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCd1HoVtqzWjd2a+7Rh2pbIZi5ziWzj21tLNJ/bk7bo63sqGbnKSeoFCqkbp2pZI5BRQjNafwjpGNojYgLwr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185512

Extend `tar` command inside copytree() and copyhardlinktree() functions,
with additional parameters, in order to support ACLs and xattr. The posix
format doesn't need to be set in here, as GNU tar switches to it whenewer
is uses --acls and/or --xattrs parameters.

Additionaly change preservation of additional attributes for `cp` command
to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
were previously.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/path.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..56e8e214ac 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -92,7 +92,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
=20
     bb.utils.mkdirhier(dst)
-    cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p . | tar=
 --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
+    cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p =
. | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
 def copyhardlinktree(src, dst):
@@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
     if (canhard):
         # Need to copy directories only with tar first since cp will error=
 if two=20
         # writers try and create a directory at the same time
-        cmd =3D "cd %s; find . -type d -print | tar --xattrs --xattrs-incl=
ude=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --=
xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
+        cmd =3D "cd %s; find . -type d -print | tar --acls --xattrs --xatt=
rs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --ac=
ls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STD=
OUT)
         source =3D ''
         if os.path.isdir(src):
@@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
         else:
             source =3D src
             s_dir =3D os.getcwd()
-        cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source, os.path.real=
path(dst))
+        cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, os.path.realpa=
th(dst))
         subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=3Ds=
ubprocess.STDOUT)
     else:
         copytree(src, dst)
--=20
2.34.1


