Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B460C04A6A
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:20:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.52151.1690215618541641239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=U3mAUu32;
 spf=pass (domain: welotec.com, ip: 40.107.6.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0df84CXd79bYg8O6qLjM3qnuAtaWG3uDc9IhcLOGvgVSblODBkK3TxrDYVHlM5gbW5G04Oz+aYaqmf+vewArs0ACMwCIMj1edo2Ks7JrSKC8T1HjlVEaQ++GfUyNSDWIhHCuqdTy1sbobBkGBc7BsMAIiV2B4zAA+FiT+jxchW322mOyX9SJglU0Ekz8nj8LFxCP98dSVdwvHHTyELlp6GQhAT/6xL2cQOmstv1yzsUR+CG5OdBEMhfBeamo6nPWH0GHInfHVMkVfzsc2poiG7LXB5U7RozerISNx8QzUWSmhi59fTmQiidR/+kc1O8yHlUqsCYGgNZfbt6Yf0rwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=XWY0ke+NcQ+WXrIIy6mk0y4+U9xLEx0QGndVsxeOuS7o8NL1jlhVn1MeKs+vcNOkxqUMI+2ykosmnEBszB4USsb72qjCWpwOjle+dvOAa0Yf85wrvIvFQy+BiI25PSk/n0iPbJg5hMUof06igePnMlWJ4HJek8LEQ18qdFGogO+3TWcUmK7L0sBOCTVjgS/R3fjkohZ/LUq/o5mSMwY0237snSyEBwUE14RZYVU/36sNlCfgGG3LtuTiSiHuMqa3M8/foZoA4tY3hjioegsqR0QQDR9JzP5n3o8H+1+/xh9bHGD7Dv2NS4+ogPkNM1YuUKJ2l5BC2TTqs/exMIQYAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=U3mAUu32YkkkGL/TsFL5MtNR1eCsF0NVx/1x7yYYfdLDxkRzD9TXUWh9p9o61NR/E+n8fBuA2c1ZZWRdK7RGSzNkq25xg0VDUGtKLef7Q6DTx530x9g5fiIYNfMIeDXemoDiV0Sip8NNaifQVQtaNa2sMWrNN160L8c3DX3R3/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8084.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 16:20:16 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:20:16 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v9][master-next 2/5] package.bbclass: add support for ACLs and xattr
Date: Mon, 24 Jul 2023 18:20:04 +0200
Message-ID: <20230724162007.3701193-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724162007.3701193-1-p.lobacz@welotec.com>
References: <20230724162007.3701193-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cda2a2-a6b6-42a1-0518-08db8c61dd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GPOhYOOQvl+uWuMz3jOuZWLRIU5vQmcbtb6V0GMoOtxDbqDcKn4u4LN/aYG7RVqyMsyBvxfkn67eHy2hMxUjLQibRqXWMQXJvU9GTjqLcrr2gs+pI0OFVXtfHM1hHTBbtQKCL2KuqIvgeWUMMrxfaWhCrWvYXL447tJuaUJ9wVlEd8zMy4dG7SrFRQVm+hc15kPe70T/kaCnySDSPqVlhYe1q7jeVB1Dv00Znq6PGPZ9W+SqGhFVDlH8r8KKjnNf9vmzDXAsi6hbezyobYZ5th3DiGFqgqzjoeR0Qd5JuA3M2SL0lIAcyxKg3BByZazrpPPo7Ee8RwFcRGtmyOMvkgPw08qf0FTIWWa7G8x5a8lasSKsSHXFPi2rPRWGOe56jd9IYZlfx9/ONOQ2XO7mS1cpV4Axs0nmMx8N0cHvCZy6dJW7PVlUEDh8dwVFYgP+vZLYCfxTzY1tfnGHnrddWfrsoOJE556U1ac5akjgpJQ/1SLe1WKWUCqEo7/9Dhe1suyzd8ckBjHWKXDCf+Fjkdw6IF1eDAP4hLV1Nr2KeN9jRLequhISnS8N88YCXduzM+b2yajQ5sZdOWBVogZeOlmFoejMa3HhfIc/6GH3z4UMejVFgFQd09+qkZDNB648
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39830400003)(136003)(346002)(451199021)(6666004)(6512007)(52116002)(6486002)(478600001)(186003)(2616005)(1076003)(26005)(6506007)(107886003)(2906002)(316002)(41300700001)(6916009)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4R+bfYeFSlXizbLLLORXGKl1iXVyuk0wMasiq+6C7lKoQohVLbAZWpo3DofF?=
 =?us-ascii?Q?uZqv68OGoAtauy6ALlYj9KGpWx4RzSiph8BgqJ5QjexPHxnV8pVhUK0B4fE1?=
 =?us-ascii?Q?BbTM4aY55Z+2BPH1OC589mkS+Qn81zY66hERmmdu4OtdQjmoBFUw/ekUgs4h?=
 =?us-ascii?Q?Qa01700lJOVZP3a414Ghin3i+rgyAiQfLWJUEksOZ/tc+WN3Oem8NZClv/AF?=
 =?us-ascii?Q?cRnTgusXQJWQ6E+Or9N/raZzSD3UsLIalsvMp2lJsuf8JLkrAN5lEfokb1Hh?=
 =?us-ascii?Q?qmhY7x5kpC2N97pwHaylpOZADEkGIP3xKf+ifn+k40H+iAeeixmaoBgjQxIJ?=
 =?us-ascii?Q?+1zdMEY+gtOrRY/c7OZjSpMwWU3fRTgAFdLsIPaMpXEiLrB1f+3aAZMtV9gs?=
 =?us-ascii?Q?vm0usdGJWuZkn61oTerLiybXRXXU8Px6uO+4TEKuUFI8jqodqMLGkSzs7X/7?=
 =?us-ascii?Q?T4VVgfxbQm/rQU6DfUaT88l55WbxKF9ovJfC6VkUvbKP3UtUW+gjzlC8SF7j?=
 =?us-ascii?Q?INfpsUR4c0iE5WXFdSEIqS1F60cszY35m3OR+R7TLLaXn7yXPb8SzfezKmZ4?=
 =?us-ascii?Q?+kW/PimfWdvXmI3a8Lu9jshF3M5lZYANz4CjLvFZIKl2/8pLPwgfGMrIyhcC?=
 =?us-ascii?Q?MzfvzRb3GWXH3jB3GvhL/+56har3l4l7YKWiX1wNCKhtBzP/ved7dIySCF6b?=
 =?us-ascii?Q?UFsTNGRldMFcrUpN1XFAnDjWyvwP4zOY+T1NCmyICm8q07EUirmpDR50sjeR?=
 =?us-ascii?Q?Av0+vdLsbypEOJIFTfCo0nLThMWya1wjtQCeSoAhtxwEEi5Sax9Jd1kBSO9c?=
 =?us-ascii?Q?yJVwSZAwDbcylc8ogDgg/okYPPp29T1B7X/iySd9LUP5J5N/eO6aZXarhzix?=
 =?us-ascii?Q?lINNJowvLAhmBKToZO+60IoiBZY1ZBoC2XqQPHpcJgf2UDOc/z5ExHjmK5fc?=
 =?us-ascii?Q?Vgtaz7R4OpAIxKSdl0yPXEHDsok6NlYzlEOwZuv9KXAmW/KH6UuGis1zpkGC?=
 =?us-ascii?Q?UBMajUq4ddxG9035hMyeoULik+jvplO/nkLy9Ot69hdJ4LUoTIKtE15YLWhO?=
 =?us-ascii?Q?rTbD00DJrXRRULHacvce9sOVG2XZvGsVDGC+Zxdireua6mEWI1di/ODTxk15?=
 =?us-ascii?Q?5DgtYN5WGD4SI640+joL/6Sqp6BV2tbTCkVP0ev2IbvyFTncFDtxfVEKeHg0?=
 =?us-ascii?Q?mOsoUEXzJTqQgGDaIuxccAI57PfrueTl6QmW6oPJEkvyQHRAamSdXYrUFfWW?=
 =?us-ascii?Q?S+GM2v8m5ZhAgkyUKJeeNPU3+Io6bTBKG964yPKQMSjBuMSbqIXyyMwO82BQ?=
 =?us-ascii?Q?tD1gjsG77ImjFBDCTxC3PlOyJfFp+qwDaHXbFJEQPt0pfFwsrkzkkHfDJ5hr?=
 =?us-ascii?Q?PRF4XTfsn83PaKhoGw6p5/MjgH9ruFJXbtodd0JlenuWwOOJZ6/dTMfQ5NZJ?=
 =?us-ascii?Q?x7PYe1LtV8275N/QKA/wAKwnV58mT6MSYac4ntaO3LxyhdYbKQ1VTZ8TmcZD?=
 =?us-ascii?Q?E9A85pVW9wRR0Vs3YwEfxfS3sueD5u372P+88QTpamC7vlIvSkQ4Sg1mhkzd?=
 =?us-ascii?Q?XO7cAYSWlS2DSXel8aZuWRPe50T+uK/I2JGO/MQ3?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cda2a2-a6b6-42a1-0518-08db8c61dd9d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:20:16.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ksi6aBcJzFnSIqd2ENk4Q0Phcu7Nz2b+lOfjSv2GiypqiQIFgukapDxnsGPTfeDfqyKGKc4j1toO/3laxBpYhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184798

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..6e5d0dd4dc 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


