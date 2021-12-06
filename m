Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2664C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 08:04:41 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web12.48792.1638777876910521006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 00:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=18I7FYS0;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.70,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp1EJHYehFDXKciq9E0HqKNjG1EfPlTEqXPkE83Hxe4cMQoQfaJRLkFoFPdJmWxNqDEx4hR3afF++OFsSD+ybH2YvCipXiy8DXrK08N5ltR1vvLcTcxHXwBIEYVHq1uYGfs/7BjhhtTM5xD/lYBF57tArXhP841C2BqtE1XE1HoglWxM6OfYYMu92ZVh57TAg23xIL9TPXFpg8AT97w70K6RWYuJYm24J0ED1ahG8B9etc6/3OTIAvLV+t0eUmbhq3ghoOMc5JscsIFaf7d1WdlbFqm0PNIUYeGuDbe/ncbcg7ZIy+BaLo58Jv+N2bbWqtZSFGSaX5k5TRsJqOAAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKgKqeGwkshQE+YyrJxoh/XbcMn/ptHh2T0Mm1XPM6s=;
 b=nFcqmYkl130xYQIHvzgn6st5RStDtp7V0ZdvMbqFv7fPYA24mt7bo9+mstW+TRHP2X3yHffwCtXX2Xkg7IYKLW9pTXANgH8bzCg6FG+w190bt7W5igqTsfpORHE/QbmbaRubLTHFKTlUixIPr8VWSUIVRkPpOQ262Y/yU4fkIw/zgJTHSKGA9cJtLUEzsJEjty6uDKOy1YqYHN/dLrxIbfQkwCBxO/f7qZLJ2xyq2pBNHiNwhGyTnxfQDdUWXeb+r57PNoSUVj0ty3LURlh1Jvm0s2N8ZbN2NiI5gvsITqCiBqgFNMH1l17hkBo3Udqjsf+KTEOmDj2uIqNemd1WKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKgKqeGwkshQE+YyrJxoh/XbcMn/ptHh2T0Mm1XPM6s=;
 b=18I7FYS0OJoni1334o/7nY8RbXONKLQEPWRsrw4bOJBHKR4+9c6tZHiIRQGOoOQsBaEmsOfH3NvcD3iUCVqDVF3ka9M3OOt0s3Zorz5CiBW3TsGAlgx9/Njtr4OjoDB2WgWHkswY+L297sbuvESC2ZpNrSDf2WaEycYg2EtLnM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4729.eurprd08.prod.outlook.com (2603:10a6:101:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 08:04:31 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Mon, 6 Dec 2021
 08:04:31 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/4] recipetool: Set master branch only as fallback
Date: Mon,  6 Dec 2021 09:04:02 +0100
Message-ID: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR07CA0040.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.244) by
 AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 08:04:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 926f3fa7-9284-4a02-5a55-08d9b88f084c
X-MS-TrafficTypeDiagnostic: PR2PR08MB4729:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB47299B9699129EE8CD432838D76D9@PR2PR08MB4729.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qq76i3kKtCrckyWKMGieH+6MZAoxxqql4+SRdV9wsihox/Ez3PdF6TKLH6JAZcmJcyXhZZmJ2SeqhRNWC2vmsu7cQyIjhj1Mz8Kdw8mKGdTh1YWyuMxJ/baxd+D1MvDm5diWR779ejbobsUNi3sfAeAuWoy005HiRpRB7iuFg0n/b3h6GKA4h+xs0Bm+U4nKsT0RyhINODtrcoG63PF8yxzSN/v+dx1VNZCJEvG6Cwjd1EdmrbezyOsTZ+F8cFzBayqsv0qT1OyjhJQqJf6+46fQRCAB0Aj4wH2SS3Ndc5fEzo5cTQ3mTHq5tUM/x9JVrIVE3zMZjnmLu9DNdrnSMz5tNbxjBjE1V4vJWb3rZ8rW3OMDoC5wO7uQzKbji5SeIxvH8oxhXZDV01xLiD+IS177krD5FOLZ8wiZGlhX63VDQkwzrWlv8sqLuigj9LmasNFXf7dYVDyZ7ostYUOgJ6g+sXsm7l7fRah2pQ2VIVLcraabtGSRM6zWM3Jqpsf7aniyLdUCFj4FeYwa0CmHQVT6879fa0LiCaqbgBvn1hYlbYbnjYxAsu81jeBNHGCi++EwwCjAXS1/IpVRIiFWlu00JZIEfYxf857jnR6ZhhJzibbfEhF9WeNJpMvuxTYcQeA83r6ZXXsNkzCcuUo00zYDuUcAMPpM1NfgABznfO/Scuk+dSU8gZykXYYueR5mmHeI4nnCS8hHIn+j5yUfnw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(83380400001)(508600001)(316002)(6916009)(956004)(4326008)(66556008)(2906002)(36756003)(186003)(38350700002)(7696005)(8936002)(86362001)(107886003)(26005)(8676002)(52116002)(2616005)(66946007)(66476007)(1076003)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ym5bFYRCJbHaA3SBYKBR79kTm/qJ90q2ysdwC5ijkCQtKqIO6B6T06M8zrZ?=
 =?us-ascii?Q?U3omeu08uKFYT9bZ166JEQQ9tzB3SBZ1FZxbkIFZ9aMzg3YANL5E8PdsIdKf?=
 =?us-ascii?Q?XLQ9HjMFW5sO3DjTRVjlqZvB8O+PJeQvhE1T0rw+rX2rwvhzuRvfi7LfLzCO?=
 =?us-ascii?Q?xq2Gm/ItLCjQom14tHkMrKkHUwpzUUxFhHRwn+dfsMIZj5h3L80SQuV0U7Yd?=
 =?us-ascii?Q?LqIqWDax4E7Gdqd0VHf7bfb8tnoZkuoGphYeeuDM7+FmgfFZuf/+/3xxH5U/?=
 =?us-ascii?Q?qpzTkASb9JOfFyBrDcK7/XOZGUc0Wu4LCkLR3ihv0zWebENKOt7SRIBezEnn?=
 =?us-ascii?Q?FN4/6bkeAYO5hUYavERuIu/eveoiyCB8AkUNmNfqv44herAs3x4KUClVrsld?=
 =?us-ascii?Q?+mf7HyGx2g/Nn+azOmdf25RT+Q2MBoqqwuJ19UVDDzIBXzvLFZKY62BKATDN?=
 =?us-ascii?Q?TxXgb013yD1P0jPZ37uB1C2y8Ad606XVkDCFXr0TE9AGw/C9sooGTdaD8rcT?=
 =?us-ascii?Q?Rzp44vY9ASpoIF2d4Rml3WaaFmxxcRD1Ln8F+nHlj/8nmogvgt0l+2kNzAMW?=
 =?us-ascii?Q?FlP7CgSFT79pBrsoXMPXfBoA5Yt7f5oUK8Plh1CTWC7gb9MhNriLCRaCpqUG?=
 =?us-ascii?Q?RjzMu55hCZp8U4pMdPz9egtjahiWZ36YRhxrMOerNozZkn4n6gmWW2wL54az?=
 =?us-ascii?Q?6TAVDneVqoQ+W175twZqfBEjqVCtXovLfHAor5XFLOZKRxNQFuhLddv0Wr/x?=
 =?us-ascii?Q?hNmfZ7QEMUIw9BAQNo+R7SYFEdNQLbokVTISb3Drpl1YQoD7CnNcvoN+PMdc?=
 =?us-ascii?Q?nJK5P+x4mYZW/dvtt2KJPwqtL0p2NPR3ibblT3SppfbOc8pPflyFBnoOpfvD?=
 =?us-ascii?Q?hV4bQUMGD6nhs7ZqOflULClBB1SiOp9xHCVDUFuh9zk9CJpgHzxIQhm+jClE?=
 =?us-ascii?Q?+xn7hufTfEAjs7n0FqDJJ4hFxSoW/V8DPhs+9tnIhaHYyneSVSaGpgWUuDLS?=
 =?us-ascii?Q?2I/RA5ew7LSE3cNphCPIxcgkbN4CZTVFOe6hbbEOd/o2RpgUeFYZmPFrUmb4?=
 =?us-ascii?Q?Ho/GxRHhIhuJhsW7RqyQSJjG04v0jE/NVnDPeqPZGfUXV+vJGp/qdTATml5e?=
 =?us-ascii?Q?vfeCiZFNBJKnUaYHHdAVmH2k3Tac21YhEMVwRHE0MGlrb56JkdI4tMMaEwfi?=
 =?us-ascii?Q?s4f3vnMp+D/zKGJDeIdj//rfYLCSXiarD70lQ8aK3MyfR+0lmPdw5gKrMQIy?=
 =?us-ascii?Q?rsJKF+Stvz2F0rvNiqBd32QZ3feuqXfsYyUY9vnUUxDKS3JjVsqtAPhCdLTo?=
 =?us-ascii?Q?O5ullVWf/1o2cNWcBAB8Ip7YtxjpIZy5BHAeol+iVXxwsqeiWj4QiIWZdBHL?=
 =?us-ascii?Q?KNEPzA0+lU5P7TPk2iYx6JsMlHyMwasp+wLFmlqG574O6NRRyedXo6Tb3xwC?=
 =?us-ascii?Q?L0drzxZCeHc0P96K+t8wQauk7waYff/yTK1Us9z0APtoeIMQIJmtoU+fueCM?=
 =?us-ascii?Q?DNqmHRImLwjlX4oC0UYNFZDZy3cc8J1s+EZhYkRTZFxL7iG+9wywMtvLeZIi?=
 =?us-ascii?Q?mt4Y3HcF7lNz0TE7mcQ3fmOuxyHTjQupYc3hGHtal8dIuHHUyL4ORU/cIPjH?=
 =?us-ascii?Q?YRsXGKi8Ff/Z+yE5228TUi4=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 926f3fa7-9284-4a02-5a55-08d9b88f084c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:04:31.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OStvk3cjLTuX4g6vZQcZf4CtnbETPlX99jMf3jYow6buFi41uwvpd9RAzpp3n10RemZZQLYii+2Uh10GlXtp+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 08:04:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159208

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
sets the branch=3D parameter too early to master and thereby breaks the
-B/--srcbranch option.

ERROR: branch=3D parameter and -B/--srcbranch option cannot both be specifi=
ed - use one or the other

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 4f6e01c639..406c97f1c5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -389,9 +389,6 @@ def reformat_git_uri(uri):
                 parms.update({('protocol', 'ssh')})
         elif (scheme =3D=3D "http" or scheme =3D=3D 'https' or scheme =3D=
=3D 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
-        # We assume 'master' branch if not set
-        if not 'branch' in parms:
-            parms.update({('branch', 'master')})
         # Always append 'git://'
         fUrl =3D bb.fetch2.encodeurl(('git', host, path, user, pswd, parms=
))
         return fUrl
@@ -481,6 +478,9 @@ def create_recipe(args):
             storeTagName =3D params['tag']
             params['nobranch'] =3D '1'
             del params['tag']
+        # Assume 'master' branch if not set
+        if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobr=
anch' not in params:
+            params['branch'] =3D 'master'
         fetchuri =3D bb.fetch2.encodeurl((scheme, network, path, user, pas=
swd, params))
=20
         tmpparent =3D tinfoil.config_data.getVar('BASE_WORKDIR')
@@ -530,10 +530,9 @@ def create_recipe(args):
             # Remove HEAD reference point and drop remote prefix
             get_branch =3D [x.split('/', 1)[1] for x in get_branch if not =
x.startswith('origin/HEAD')]
             if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=3Dmast=
er' as this is default.
                 # Even with the case where get_branch has multiple objects=
, if 'master' is one
                 # of them, we should default take from 'master'
-                srcbranch =3D ''
+                srcbranch =3D 'master'
             elif len(get_branch) =3D=3D 1:
                 # If 'master' isn't in get_branch and get_branch contains =
only ONE object, then store result into 'srcbranch'
                 srcbranch =3D get_branch[0]
@@ -546,8 +545,8 @@ def create_recipe(args):
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
         scheme, network, path, user, passwd, params =3D bb.fetch2.decodeur=
l(srcuri)
-        if srcbranch:
-            params['branch'] =3D srcbranch
+        if scheme in ['git', 'gitsm']:
+            params['branch'] =3D srcbranch or 'master'
=20
         if storeTagName and scheme in ['git', 'gitsm']:
             # Check srcrev using tag and check validity of the tag
@@ -606,7 +605,7 @@ def create_recipe(args):
                     splitline =3D line.split()
                     if len(splitline) > 1:
                         if splitline[0] =3D=3D 'origin' and scriptutils.is=
_src_url(splitline[1]):
-                            srcuri =3D reformat_git_uri(splitline[1])
+                            srcuri =3D reformat_git_uri(splitline[1]) + ';=
branch=3Dmaster'
                             srcsubdir =3D 'git'
                             break
=20
--=20
2.20.1


