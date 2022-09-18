Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCA4C54EE9
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 08:51:40 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.24])
 by mx.groups.io with SMTP id smtpd.web09.6922.1663491093870887506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 01:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=B72Fm7VG;
 spf=pass (domain: outlook.com, ip: 40.92.65.24,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mblbtckUZWm/k+sXwpy5qto+Ors1cLh6+MHrnoialiktieE3LNMczCK38AP4PmsVbkIPh8AR4bD/oE1vLQ+wqOBU/W+E4WKW+Ji/oADcYI0JgSKF+MajnqzdsbeVc9+o9c+vA085nswNBtdK0fZ8xey8bvXmPGwGsFT/zjjHi5+dRKLGmg94yL5xVuWhkH0U+A9h0gDOAMr+oApRx2fcFsDJZDG0wf8B3/oWb6AMOsN1vFu50eCFCSj7BhahinIVgLZVxda4KEI0fIWqZ4rPYUANEEdLDpua163eNntrtnaonw+SKzNIAom+nUhgxT2dVJXwZxA9f/IjRlTDBSn3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4uS/Hx8jQDTuvdJ96V5WwNNGtTcQkwHjVkRE3W6HbY=;
 b=egXScsQXibal2TMmDCI8+ioBpsClgB52aNOMwiRrduNyZx87eF8BvJPyehwpa35bqd2CHcNNZ9e84m/xk3zdvQU5h3G0XP7lx50LcAIaw/r1Skz5ZEwEo+91IPLA7twot5oXYkcf3CqB0UtzH32lGw+f47nDXKSlAC+nWOIkfbooO6yadbNuw15P8WD4800T2PVsM6J+VQx1D+NXJtsK2KEbW8x3J36dw11FLF7ScPCHdVg7IdB7DsUAYl45+b4KKX8IPECpwzyddFsu0bxAVN73rEiabs6Et85LwMPgzO5PbUW00AdwMLELkXGtFlFoSONR44dMVSkTDUoGKNODnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4uS/Hx8jQDTuvdJ96V5WwNNGtTcQkwHjVkRE3W6HbY=;
 b=B72Fm7VGhI05x7YlTXUunfIR2+ywfOFM91ZI8Mx18Nk9/o6BOaW4+ywKpxnjgC3NzNWoCcLfxEdrc/YkZX8WObnvIdChwJExLTdpUtRIYwDLi3tvAg1MRoEaIy246SlI7P1DPlLkVLuttQO8GEhgCJ+odT4pdulvKz4EHf5POUeJ60xOuCsaKFiLXFuEz5YRt4MN3/9VxVHX67czzgZXgl3q+fmEIdguN22nvVfeAIglp7LvGQJuQzoaZzHxKqZcRXR6EpDgMR4+VbSifdDEpdTqTGqWN4XGSSOJGEHmQJ/PzJhxf39D2jM71gEW9n7vRf57H41nO01Sp8aqr+0mxA==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by GV1PR09MB6002.eurprd09.prod.outlook.com (2603:10a6:150:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Sun, 18 Sep
 2022 08:51:29 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::4117:11af:4a1d:3f6c]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::4117:11af:4a1d:3f6c%4]) with mapi id 15.20.5632.017; Sun, 18 Sep 2022
 08:51:29 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] python3-idna: migrate to flit-core
Date: Sun, 18 Sep 2022 08:51:11 +0000
Message-ID: 
 <PR2PR09MB31004DF2AD49A39E93B9D433A84A9@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [k4zALyC8BL2vF5mMXb5ej8Sli5DqvkoQhfSrh/s7kjtK9i6QzVEmdozbyfvb3Kv0]
X-ClientProxiedBy: BEXP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::16)
 To PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <20220918085111.345946-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR2PR09MB3100:EE_|GV1PR09MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: af1de3c2-06d9-477a-5c06-08da9952fa63
X-MS-Exchange-SLBlob-MailProps: 
	9IecXKUgicACUm5JrSsc8cy7TBAur3ADu+IygEj+eovUoZ8CQPEsYoOLBo1A8J0m8JX93oTL/7ThYEjYUycoDtf/heC7RdJje+y4LnVp5wQ5CfTfVg2G3zognEflit1NM99OWAAcmm8VBiK+0wAK7bn3VPUiMhp2ckBKLJN9r0XFAt+K7aOHejSYE+/7LYlxbD5JSdBzPmFfkUujHmOuU9Zv3F03druTmhYZ5aCHTPDLOKGd5ORumOAW5QzHdQzR46HIz6zU/JPcHo26nJ+rxRXlLXuYM/uqXkNhoxZ1v9vd00EWT6NhwBCjKEEpGqCy1NzfPG6WRLHEASDNugX9mtGDVtZC9gzmBNx5ZA0vZp3BzDzhju9ei2fFbrdOI9c+evFKeyvicQahhGpq8cTdCART+GefFj3x8mLNL4v1Nm+nltQwZcmBBGoeZZRHoAfZMDgxPxvEIA4/g5hnlvdrtU3o1prZY805sfriLJjPkUm2lZwas5px9AyZQBZOY89IpQ46rlrfTvTwYcLdM6LwCy88TJaU42lQCmlVa+brVsAQGGUhyefrUhRjW2q1hAwFeFg0E7BaLs1EzWUBGQYGkl9tvgaMGgomxk7DxA1pl6fx/zbkCrUuP9fRtDUJwi51u2oU0qDzv8iJ6iQOX4vy+/n/HCpb0lUwcLsbRTG7kVxli5xBXpxsBHPlvCt6ohJxsMb+ruaouwYO5TEzmV6Day0RhFiRooYF+32uTbxjhyOV/Gl31wXa2Q==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zmLkqp9gZdTpxNL9dsYTamAlNK8ipVBnHlLZaO2hHKklOLQlyE813W8eUhUOJKo6SVaMMLSJji/VbWcFEzXG+ELjhhmZ58oH8Okk3LxMXejVh99eraL3TsQQr2G3K+zrtTQksQglE/mLauRhfppkSNPV/F6iCjJE+2Xj+vdahHzU8Ss1xxZcbAohuMysdzKe3ekoQH0UCCet1nvb7jSVIt8sADFx9YZuJmtoFfwTRNJFMB8tO6bzAd4iMFFs4pQR4OQR5UnWtsV7kUeZA61fZ2Kx5OE9alz5FEd79Q16EsQJsJJj0hPTnGyW/YA+AfX/R58Quzf7rADAFSpYg6mCQNEK30LvVzhllBjfMcEOOR5mUg6YW2d+PT8tlnueEBHiPvX/GQQ2ei9/7MtmYM6L97VhDX/dRJOKQouWjDD7tSIaZr2fyTmOA6caL+YUQnQjJKYGJU1zIsAvZs2hbVuYyaDh7BAS3Yy16xKJVS/zZpBBXKoSzs/+E8LRMMKLuA39kL8ccsd39gyeEGnfMsH88N6j+AJ5vTi+R2VYseEGPYaeeOsBL/04T6vSA5HZaI6nAIt0Mq/3nZA9HB9U7gJTsEXr9jvfAHF7rkaQFVTyIDjGNVWUM5WmF7d++yWyJ4suFEln2yq5Ihb4yy4s7yP8Wg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JDiNbXGiyR+nwQYvt/J01amjsgfMXJ4ArTUB4/ZIIy8Dfj8xUGLAd8iur0XO?=
 =?us-ascii?Q?RPrBVubagSWrAUH8/5G45HytH+4nG+HPmAYu35EJ2oZ9nNhoiKIGi3W1j+IG?=
 =?us-ascii?Q?o/AYJZBeAF7te6YrFNhF3O9hqnKXkoA3yzzYziyHwP6otOIe5YzNLNYOr20t?=
 =?us-ascii?Q?9ZaQ98tt1pOh20CvqBv09UfYbbsUE3IQXo3+yYZGwIgcKut/DVU8fPNF5oyf?=
 =?us-ascii?Q?+eiwlGdOmUuoWRBMQQiNxWP0f8YUWv/bDads/amu4viDy70hC8vPjkEjPW0i?=
 =?us-ascii?Q?rhIKlL/3OdsWnybub+z5qlhtWe3lEjiM+/5oMQNR7qk7vq5KP0mIkg9w8NtM?=
 =?us-ascii?Q?aNZcMaLezEkLm7A18O2gp5Hw3pB9Cu169rFSWZRilYRs66EUKa22H6uryIO/?=
 =?us-ascii?Q?bgx4ZqzxjTLaW+jRtqz5q88j60vDgSyr/TJJN2Ku2skS0VrJOL1pTq2xxh8S?=
 =?us-ascii?Q?J3KHCInaA+JL4XnQj3wVyHz7CH2wE+qA81g5umqkYWO3cYs/AKN4Wo6X94Yt?=
 =?us-ascii?Q?KdIcJPn1Bxc0tPII+icV/4H+W5D/N5M9q7MuDuAYwuNSD6m19OTxUSlkiThB?=
 =?us-ascii?Q?D4hliTi+NGrJsWLNuzlq11Rxk6dbQ87+c7jUQ5VLOL2GuSp7ZxqiwiV5fSR5?=
 =?us-ascii?Q?nLdGHGQ1nZ+8GFuiNNANbJl2q0vOtZU1JJRk+alcMMN6D9+fH42aYbzSC/HE?=
 =?us-ascii?Q?mCv/U7l2w0cHAfJfYhuwpJv3KIAkeIhiWJ4J398MBVEedolSXWuM9jRYsvIB?=
 =?us-ascii?Q?vwXxpd+Ngn/WBUaTylAhKCD4NIUvOu0Ksv+/zNON0WLU3e1zHCHG711a6ndv?=
 =?us-ascii?Q?8PUzFb/iFG92kbfj0Z5NQwjbFC6iLSLzyZUdb2K3P7bl+cCQB9YHrO9MjA2j?=
 =?us-ascii?Q?o9PPMbEo3OteDvKbtWo98ldPm5PLqLvEqzOWtN3lDp9WOXG7pkSPsn7NkL91?=
 =?us-ascii?Q?W65mIM/y2YJ9IhZFnuato4z3RhzN/uxC6eD+mx8FCF7APAnVUuy/aH4raSad?=
 =?us-ascii?Q?izwet1BGXopFvTIX2vih7QRLezCOX2UGmTDo9WN/85KYVqx4HpK0ySkNF5Wf?=
 =?us-ascii?Q?g721I1gqqaeyXjVsMZz/kTufXoouF1YCiujve7dKxUKfwNrFzyDDehslFs+8?=
 =?us-ascii?Q?MnGN3IU3w9qjfuvt+aI6mJL0hKesfcx7Po00yo6FH9ACCgYQ27nKTuYhPGHc?=
 =?us-ascii?Q?QCWQfhRjREQO9wBg50HavtqkuaweEg7f/fi7ca8TTHTFdNXO+o9n0hrfREmx?=
 =?us-ascii?Q?qGyoDEQo4pBQT4piTxo1cl78L8Xq5KGtp7qe5FCwywSSXeCuQG9FHDUiep9V?=
 =?us-ascii?Q?T3R30/GbIyuZzn541WzJMDbk+sxfQ/Yf1JkIDuXF/0E2iA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af1de3c2-06d9-477a-5c06-08da9952fa63
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2022 08:51:29.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR09MB6002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 08:51:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170843

setup.py in latest release is broken after move to flit-core
was released by the project.
This broke the version detection in consuming libs like requests.
Remove the not needed egg.info removal as well

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3-idna_3.4.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-idna_3.4.bb b/meta/recipe=
s-devtools/python/python3-idna_3.4.bb
index 10c99ee0ea..41a666f3f4 100644
--- a/meta/recipes-devtools/python/python3-idna_3.4.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.4.bb
@@ -5,12 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D239668a7c606=
6d9e0c5382e9c8c6c0e1"
=20
 SRC_URI[sha256sum] =3D "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530=
b5526063d02cb4"
=20
-inherit pypi setuptools3
-
-# Remove bundled egg-info
-do_compile:prepend() {
-    rm -rf ${S}/idna.egg-info
-}
+inherit pypi python_flit_core
=20
 RDEPENDS:${PN}:class-target =3D "\
     ${PYTHON_PN}-codecs \
--=20
2.34.1


