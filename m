Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BC4C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 20:32:02 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.80])
 by mx.groups.io with SMTP id smtpd.web10.3976.1713558714353480196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 13:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Z/4B9jfR;
 spf=pass (domain: prevas.dk, ip: 40.107.13.80, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlneFK7TWzTzWzSMCP/X1Z0pFj9RASAJjD2AaRSdlGW6iZLL2yrIqMTO14txQYC50a5tinrtODnfIBHCX0tTWuh0m8ZJ8AdmB0IXTbddOuFvvhT5SrjgQtbkd7+1sQbpLaujiOr065cfnRQ3kRwqJFZDkhWnbs+C3J7gKqYzOkmPkCpW/g4/aEFoypvPLGYz34RlKDZ1sQmJHbPw/U3+p9hDtOiBVXXJeAkA+JkxobUSxzBnP4E88SLgNfMlPnpX58BvsNhypo/xrHeLp5tQpsLK5M5DkEiJ9uHiJH0yGYx7Ai0lr5poxFRgywQCmC0cjlLKV82onRvdFEVZHKBuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTTJM4skudw6DwfwkpGUDRTtceaidyvzahfnE9WL8XI=;
 b=VZ+JA6H588jT82QFoSzwA2c4bsmpgTigzvBeOtL5/dS2wciB2buX5grBrWl4f+3kTKFJo24gA9UK4qtiua6tyxe9uaRoISz/SfYX2+jV/0bmoqftsUjIhE7fo7ZCyMe5NwJeRDLBWptzL48lL5w4DWHOIb2ckiOfkqBhdlUmAsvQpwuxDny52tgf4jo+gSdh6AlGp3QwPioQZbqIOqh+Ea1W8lLq48xhsOl4Is/HUwSIvq5bohIdkY2TCSPKUT+DzI3skhFMXPJjpyS/l01UdPYpkEf2AqR4yaroFEW9EUJMYIQNOk11BLm01PfFNENToYhXhJBBmJrQYfE92q/TzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTTJM4skudw6DwfwkpGUDRTtceaidyvzahfnE9WL8XI=;
 b=Z/4B9jfR1Acha+oDq4ckKFZ/XjCGF77xTIulvegUUbYwbcCGHJWfT/akgtypPeEl83OaDmjxJNG1XDbYJwAL1nG0jc9C5FbYrt2Ubbgq1xKSBkD+3Es/+KX99+tpzPXo4qfTusHCfZLZJeTN3QvwAhCOZWVgzoe1R5i6g1Q9m58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS2PR10MB7274.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 20:31:50 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809%6]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 20:31:49 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Otavio Salvador <otavio@ossystems.com.br>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] bmaptool: add PROVIDES bmap-tools for compatibility
Date: Fri, 19 Apr 2024 22:31:40 +0200
Message-ID: <20240419203140.461439-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0065.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::19) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS2PR10MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa95cf1-d823-4f59-e7f1-08dc60afbd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P8ycA04lvlltAhgONKgbw/wWWF3muKEtPaYDtIRSopuAdjxbTldc/38zm2cF?=
 =?us-ascii?Q?59CTnIZ1MfHHdhhiOjck0/JrfVLXRaPrAJso5hWZW+/Y3HZyoz6YnA4qetCa?=
 =?us-ascii?Q?5k49/ZAv3otak7hCzvZuKAizkeSud/HoM0nWw3LiYmXogclYJ1mUyKj7jR3z?=
 =?us-ascii?Q?MSmq48zaidWTlvKUncJoVEC0ou0e4Ty1R4pK6lEMxQFRWNufa323fElI4Le/?=
 =?us-ascii?Q?ZrE7hDrDaLviSg+GjjJFiNTW0nExEV9J9hre/t7w8qKqo4SzSwg2d1bLRYh4?=
 =?us-ascii?Q?W81CdW2uQOsAQqYCIDaQ+tRwCUhN/lq7ishJ1Tuw32jrDCat21MRnN1pMFxg?=
 =?us-ascii?Q?lBAt/6fNhtu2aVk+IGSt2zhENscFZNcJu1Ym0GsUkBWdjtq0azrmI7qZzLQX?=
 =?us-ascii?Q?LjRgpP67yKWuh9y3HctUfUO/GMsbEepFOpvi/2BtpsI3QClNkZmHyYJpOF/V?=
 =?us-ascii?Q?MYsV4avLwtT+9Bc0F7YReSEImMV7Yuf9v71h3R/dmkugMWvOta4FhLLGM/6I?=
 =?us-ascii?Q?AMbgnFgqHQFUn8bTvG66q5KNH1PGCFwLPGWquvmIYAHpQGZqqZJu9CWe+MiE?=
 =?us-ascii?Q?c0VtUkaBS0gHFi4u4uxXuxlHY41icBWROFXEeKaJaKeQQYbxvXKgsaIwFHLl?=
 =?us-ascii?Q?W5Ey4qzTDKDaX1JSjtJm0jr95nqo/oz6zEj+PJgxka63vgbVg8e+t646tH+s?=
 =?us-ascii?Q?f9nBdvyzRaMR4jqENiVkkiaqUQ4agqBWVbDX6NrHJdr4MbWy8F6hmgTWzP18?=
 =?us-ascii?Q?Mr87FZXYiWHsqMbXa2G56AW6by/jxwve8kcMfvDNhe1pk510hq99z7sr5f0y?=
 =?us-ascii?Q?0p+WhzjXaN902lWCfxTcpizj00uZV5l6qhGiwmV0nwPjZyXir51PYET8cb6J?=
 =?us-ascii?Q?i3QrNgo//INgJveo6H1GeMmwuYngi0ND37X8aotHBp74MN/ux+zb0WeUbaMZ?=
 =?us-ascii?Q?TZgrjZ8YdP0BkTTrDAMrK1OEqMg0GgVVD0fABytjbNI04zO2tmpixTRlbI7K?=
 =?us-ascii?Q?bIXU3UkpqZ8cwT07nGBzM6tGHBAewcetZrx7LI1ZkCjeDgyzIN1yPonrXwXR?=
 =?us-ascii?Q?Eg0K8i7XNkh59jzpmpuoauGIGasUuO6BBgXYhklpgCMITyRktd7SvGc0dkIq?=
 =?us-ascii?Q?jZ2lZCfoCSyAXsJoVqmHgryfTlxrQc00R/cUqcjbP7m3E4aIUt8Hp1KdZJe4?=
 =?us-ascii?Q?lK5+EW9w8kB2QECzrsmnXISotQ+G5szST7J6LGQGjVFjjjJblVvYPKXfp3cw?=
 =?us-ascii?Q?lj7EPFRYQQy6+7/Yb74PM2JVpAi9OuOeORMb5evoS21brLFlRc8AUeEIlXz/?=
 =?us-ascii?Q?RP/BBY4/C0YXVYdwxTmEvi38M14jHHc4CcfEa8CV0y2bJw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cukWqg1Suo7v7W2hsjVPBSharibrw+wO0IONuCODF43M26C3u9akbPILmGh4?=
 =?us-ascii?Q?gdb5JKWfDdr08jCPc4l1Mkp1wF/WA4Cln60dm7KD7+r1sPxEZf5oreiKAdEA?=
 =?us-ascii?Q?y5BsNGnYILuu6+BShm9NBwKY3d1K8DY5EY7clVpANWzXPijGpL5a+DQcLchT?=
 =?us-ascii?Q?unoiRnO1OmNHDBn0cAKR8APcYmjvks9ATrp/k76O0tEgtKqbZ3+ch2CCkTD7?=
 =?us-ascii?Q?RXrhgoSrd+TKhbmnhJ0XGx7E4hI1rtwFMMyv0dwnAhZ4ozBNrT8+TGGl+yO+?=
 =?us-ascii?Q?QvOlf2luU6WfR8XnL2LpgzrF8BTPrzhP+pcmaQJUidw+U1T56HNwhMiBtyNe?=
 =?us-ascii?Q?na2C0NZ5QKM5iKqsNUWtun5UB+rfRwXZf6NdYXHaHN08HRtZ2JE733iFOOFk?=
 =?us-ascii?Q?D1nyErR1+R0zkveKxcXGjMYjWLOs5VLj2UD6rRyZu1PRAGMJT2TVkUB9HkbF?=
 =?us-ascii?Q?wDR6OhpR5JlRwRqhf3JnssSm/WtjjRZJRvhyAKzUhO0vh4+9gx14GBg/wm+r?=
 =?us-ascii?Q?tf6znaq3+6kkLE/6wOqCiV3Km2HYnRcEF60GYuBI/bDHGeIbdiCVHerHYvCn?=
 =?us-ascii?Q?G56ZCY37GOmq8XMZxkVi7pKXUaZYAUc1X7iUYWt3imRdrjT/ccT9ZCc71Lof?=
 =?us-ascii?Q?2qs4AI30qagc2W93TS/xlh0h62UosuyvIXrYzdTCeIkKNvbONcNtQLNPKRVZ?=
 =?us-ascii?Q?uhjxC5yvDZhh6I+X4AMXSxs0q/WIdFv/zlzF4kLD1FcLH7Po5LyemZM+0eVg?=
 =?us-ascii?Q?fMHRTSfeUracs/afVZcg7lrzEM9FDriuRqIyj1UTS5SUGGtjEQEd2V5s82IM?=
 =?us-ascii?Q?7GN0ySRWtaCuF62L/+xwN+KQkuUquBucaNlRfQAYfgJNWC+W6l+UDfE8E3Uq?=
 =?us-ascii?Q?N1PxSZo6zihSWMj85zTT7jXsnQvmAwPimIrw0PB1pYifBLbzP34gfzvkDlSi?=
 =?us-ascii?Q?EU25fy+S/1u2nPOEtYBSWf6g7OWYzEte4uSo4WYsDkufcbd2a9GSEttckZkB?=
 =?us-ascii?Q?afCav3hEhxdO76VNL1csvgvEdQIVHi+tRCRKpzmNxTFkpygMorNVOr+4SY40?=
 =?us-ascii?Q?OmtGAq4YTlvWpheuSqVHajQn1Zs83FObvkJOKRSrS3ZvM4APRwLSn+XvNZph?=
 =?us-ascii?Q?O55FpBBEdBx2eMubUDEiy+AR4MvTFZy3AU0y/Up5XZCvSHBcJhMjrpwzFh4H?=
 =?us-ascii?Q?/KOD+3YrL755DrLO6SJl5mA5Q3rCpTARK9u5FSJgILOZt3cX/rfUYBFwDa44?=
 =?us-ascii?Q?RYtDsR1M7Y+XBWgeQMiSGYnM/NrJyM1YtwkZoJsP7TMZgb4H88j4EnBN+Lr1?=
 =?us-ascii?Q?IMnflmsRGEdIRXvH7rKGrZlIvR/40ZPDpih7w4pJicpS137g0g99alavG6en?=
 =?us-ascii?Q?Iq9Z2IFiIzM/nNCmxnRsIYf6Z91nxj9mnOAzK4rsnC/RGrb+QcizGyK2SQvl?=
 =?us-ascii?Q?2b/QDEVtbpH6sGwxoWmipr//52sy/bW8B2eAsmt8dn/6EjIZMkBkcLmJu1xe?=
 =?us-ascii?Q?oQxXnvYBUb1AeN2vZuEzTkfgRWlq/Qw6yg6y4q0PZPEr1nGCgAQGOIKChmY9?=
 =?us-ascii?Q?CAAzkHY24tq34MMQmW75w3L/AYjXu+eoh8WuSwDvYMZIOA/oT4NN9me74iL5?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa95cf1-d823-4f59-e7f1-08dc60afbd72
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 20:31:49.5369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jUfzAycU8mGJrUjKx1ft9Jr/JUPSMiW7TAtP1EipE53hqI/LxGU3AFiJ4wFFoqpBZtU3JnvJrHBXKP6wxmxb9oGg40ZxEeyrkZ+vKoZ3W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 20:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198562

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

This is very often a build dependency, such as in my case using a
class from meta-ptx, which fails with

ERROR: Nothing PROVIDES 'bmap-tools-native'. Close matches:
  bmaptool-native
  bpftool-native
  mtools-native

due to the renaming.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-s=
upport/bmaptool/bmaptool_git.bb
index fd53c21c06..b4b3fa1fbd 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -23,6 +23,7 @@ RDEPENDS:${PN} =3D "python3-core python3-compression pyth=
on3-misc python3-mmap pyt
 inherit setuptools3
=20
 # For compatibility with layers before scarthgap
+PROVIDES =3D "bmap-tools"
 RREPLACES:${PN} =3D "bmap-tools"
 RCONFLICTS:${PN} =3D "bmap-tools"
=20
--=20
2.40.1.1.g1c60b9335d


