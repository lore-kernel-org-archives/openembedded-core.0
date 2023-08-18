Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56424EE4988
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:20 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.135])
 by mx.groups.io with SMTP id smtpd.web10.864.1692380896295340605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=R5BfzNM0;
 spf=pass (domain: ni.com, ip: 40.107.93.135, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9qM6lwVNnqty0EuyksnJ591DvFWgYPSM6h065cgkRsBgX1xUJ2pxDzZI1d+CYppGneSoTbLm0acJBpVgKsAL6T9CznuoG+R5qs+vpki3C3f0WBuN7Kd9AdKVhGLLo1bsESvsDyPZ1QWgm4XKNP8qZwv3Kojy3N2WTz1MiWFZeXlYIgB2vjRyPty/FUv0V9pagXv2VPX/p7QFWzMSxEoHApJzK0FcsYbWiPFKRjOpkNaz5iVbHkH86qmf2CzG+lbvGZa/i1Np4FlpfNNTIHqwp9QIakLAFH6DKEsi+Sk1IwBTlt9U8MB/eWja847+DeGO/QHDBlt1zUB7TKwyIN0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJu6vLnqp/c9cD/I91bvOTLDqKc/AHTu+f7nL16Hgxk=;
 b=Ah6ZzOIWDXA7//akhybGYn5N7mvV2g58BmxjcXDAteb0hp5x8r0dv5D6qzk0/tuqwtk0ORQWDNafUuU77b6OzJSGfsuo8qxbTx+XNZqhxRGeODfo6gGBC12+axM7wIkawEwIOYMI14ZGNpd+pvIzlQ/YPYiPXU5jdcvt2uJ9mJX+Twbl4BXp5X7TghvPs/1tGXoY09qMdHIh5AkuHD5P4LxfiwDjwpnY7TcVgP+Md1NJy9DiEzQndrnTeGBdQ9w1+nQxe6UpGmSgy/uyTVqHuUz7q2rOpYMs6JEumW54syMhleWauOAEjzLZagK9o+AwvhisLCIJZ42UesaZrpv9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJu6vLnqp/c9cD/I91bvOTLDqKc/AHTu+f7nL16Hgxk=;
 b=R5BfzNM0nloSdG7pDdIu4c7zTeE8y5EFKuw8B4GIik2r0be/eS0UV+6kCm5za3FSP4DL5I0pfLrpilbl/a18zJtbBfsBxgrFdp1HeVXEh6GqfcXsNbBefWWVMpK0SE/fg2kcPGnUd+GFavwaqqaCctXt9971tz2awfarLsUcewI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:06 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:06 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 1/8] bitbake.conf: Add new DEPLOY_DIR_FEED variables.
Date: Fri, 18 Aug 2023 12:44:50 -0500
Message-ID: <20230818174754.988128-2-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41)
 To BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afdb860-862b-43f2-7692-08dba0134772
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DSjRrIwEHVyVIl3l2uF7++jaNXXbZ3drI3RSQ80FaR+bNfFWu4aHVqEdnN7rPQ30DovixCmwCkcRB6bRsxb1QNZkg+06Cw045fHuCiahsKoCibGFh0yDILFtBk16J6gLTwMQaQ7Ix7QLMjrWv33Z99NPt4ayxL7a57hXydfv/kVJ2FtIh3d9dieeWfDufGConHXE4qkOnG2b7QK3m7k4DgIWd3GWbRrbGfx1w/Uu4NVxLZ8McT5lO09NSAzknM91qv7RYuy/o5qAZz6bNh/fUcLIz3KvSmN/hxk2AHhKTgLjbCRznkqrUBiJdZTatSF1/Z7D5M8gdOc8mTKRnL18nvW3CY67rn1l6bMRqNWJGdTeRny1l1y0ZtC/wztkZrZtGl7QsfimSkU2WySD5tPRvYPhgacD5VdeeNeKRrPP21Akyoogs5Kt+A15vGGcP8ItQXWeghxoOkcIQd1EiXJ96pVm5lIJFGPhaOYj9BUmT4HN4w+JXHXIzWtyJN2btxJzpj99m1ZUwKqmbUnZ8TKto2p7FvaZSPdCFhtFiUdc5JjamofGCTR+rn0Th8CRm9nU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C+zYHsjhOlE2ZNagpntXaf7MvAHbydYskcUaE8iEDzLLjAFBQWVSU3iR+9NT?=
 =?us-ascii?Q?D7h7x6UQC3PiOGY9mJizHFKVSiHWDUO1zoqLTUqIZYxQWNc4VWjlIWcRAWUZ?=
 =?us-ascii?Q?etDBr2xSBFmcFrCUQFGYWwogWazTVJso5vzT8a4hbzAnCL+R0PxXWvw/5EwJ?=
 =?us-ascii?Q?o8WUQcuH9SDEINdmTsp7g+DpW1gXGl4kLynn6aodUSmWvsaHEsVA27uyzHKH?=
 =?us-ascii?Q?94FVPcm8qvYZJLBWEplz5rXMu0O08Tx75e+gzdBdbW6FePvSSG/1x+6EcB60?=
 =?us-ascii?Q?xg+N5lqCkmC/ZJLKsU3+lOVC9tNWn2/6rFawciBM0qTKgxGWq/irnHXarKnj?=
 =?us-ascii?Q?FH0zp9oQlO+ZFdSc5UZ7ZsjqEckF1N00lzjR0kBREJYl1ZwrTJ5euSNhih+L?=
 =?us-ascii?Q?eyGayUOFZxStJLSkPFcrtUe49YcyhxhQ0+PoJSk+J97JNzs1rS/kve87gSvV?=
 =?us-ascii?Q?4OhBxilWoKYSPgDIdFbKqCuVigss96K7RMKqBZ04IVCaYVq2yM4qonFIkAyB?=
 =?us-ascii?Q?soVd0ozgA7KCCU5MkZh6FjAyD/qxv64WlUarP+ROrFRrD5Wdb1/6BXFBIP14?=
 =?us-ascii?Q?WneUbGW8T/Swqq6UlD24SwFdIKnSxs1eg0JU+jSvLKnMQzCWu9yH9B8xc8QV?=
 =?us-ascii?Q?MTUz6yXtOoeRqii9FvTBs734MuZiKn0seuHyF+dX79pILjoCyl8rBOqzcDRQ?=
 =?us-ascii?Q?+0rz0zXTItFnvuhCBHuUHXDbwkJW0e52EMVTN89YLMVS6gnpd6FyF6llGI1U?=
 =?us-ascii?Q?UbfV965ztBACfZeZr3ikGVwmjuk2BlqY11TlGtqEan2PcLu5wK1NOuiwCnKm?=
 =?us-ascii?Q?t+H+SJ2cx9+SckWsEQIWLhlYMJl14804UmJb8Mp8GstWjj9KBnfgeqgnkrkx?=
 =?us-ascii?Q?BeOwVqGbQvWBr6BTPkRZVkyei1Iwlkv64JdvyY1oVF2A57HL68kvqnpZ3Jby?=
 =?us-ascii?Q?/HwMP/sbtZgIINVa/jcnUhrCNzXgSD7I9kPMdZ91+IGrXVYz6Onb+YS/uZF8?=
 =?us-ascii?Q?QApVls/qB5EQbmml2zoV6ZEifV/W5pxUc9ciHV6kkWkxVg2wSa0jsbcodI1l?=
 =?us-ascii?Q?kJywFMErE5RT7t1ocr/3TFOmMBShvgP7b7T/qyjZAzKwBDycwF83iH+5Dq0z?=
 =?us-ascii?Q?FNWN4MHe7wU9AnXUJmJeyVFNzbGkWGN0hMTW1ZiWnuSMVdCVwQOtrzG/08of?=
 =?us-ascii?Q?A5EQKt0ckDoJ+oXljkW0EYztqluQnp9FuzP3BwgXyVsFoLwET5Ko+tYWShdX?=
 =?us-ascii?Q?QMbiZUOQ65eh0yyUEnaxUy17bhUgybaTr2FSIFwdgoqry0NW6XzfjRdsItcf?=
 =?us-ascii?Q?5s4I7YvBTRiFEPm8jw5lHDMZLGgE/Hl1wl6wc57SzP4Jqzvdy43EAUWEJvis?=
 =?us-ascii?Q?R2IHJtsv0l63kqawkPCjxjHkPvHco7WISciU085Ub1e72+Bv9CQF5GnERfM4?=
 =?us-ascii?Q?bFJNAu+m76e6bbZxLdSl24y0uA3+BQK3zKIsJ7rkIkd9T+XrVc2tdNq5tdtY?=
 =?us-ascii?Q?HgLM61m3RDw+vtw6QDD4zB0rkJtQdO482MhIpJlF1a0VfvZ7CSTI5b6jOqI9?=
 =?us-ascii?Q?JNPXCimX5wdxY4qfj5gTs7FOTSj01Q6T7WPHIti3Jt2saAW3+j7xqdaco11O?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afdb860-862b-43f2-7692-08dba0134772
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:06.7843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1nEWkPHXQTjqjcu5y4jTKb/szU2vfbZsxKromvU93fjn8FxbPkLAtturck/ifDtpyXoqX3y3rJY97EwxrnU1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186384

This change adds a new variable that defines where
feeds should be created when building a packagefeed.
A feed location for each package type is also added
to allow multiple package type feeds to be created
in parallel.

The location for feeds is ${DEPLOY_DIR}/feeds/ and
each package type will further drill down to
${DEPLOY_DIR_FEED}/<pkg_type>/${PN} where PN is the
name of the feed.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 599bbc4ba85..b06fadc620b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,6 +450,10 @@ DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
+DEPLOY_DIR_FEED ?=3D "${DEPLOY_DIR}/feeds/"
+DEPLOY_DIR_FEED_IPK =3D "${DEPLOY_DIR_FEED}/ipk/${PN}"
+DEPLOY_DIR_FEED_RPM =3D "${DEPLOY_DIR_FEED}/rpm/${PN}"
+DEPLOY_DIR_FEED_DEB =3D "${DEPLOY_DIR_FEED}/deb/${PN}"
=20
 PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MACHINE}"
 PKGDATA_DIR_SDK =3D "${TMPDIR}/pkgdata/${SDK_SYS}"
--=20
2.41.0


