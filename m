Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598C5C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 21:08:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1311.1666818511072380599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 14:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qdHmac6c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72987a5ca7=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29QKpWeq031250
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 21:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=DKO8M46oA45+3NIJN6+jW15olekpVPZ7tbIukmTvRNU=;
 b=qdHmac6cSj+HbHAF8UyBTyZY/o5EFuruf4b8GLPwxagbYQvAn7twl70d+egG3VaaBJU/
 8FnEDpu6uTwdhVsFZh7afn31N2BxoWgLmH468Px7ewOia3kOdkwIRndfnTCFNgsN1veQ
 yLRWcu3zYrkEPZ0PTIIpKv4SxhfuuiFHUy4LqZTFTYoI4VKEznEB53Q5jEjQ4mYSJETy
 ry5Iy2cfyYi1PTBnd3xknn/IDuzyfZs910kAG2sLv8L2xT+8XK2GrxH9RHVaWgZyaILK
 ahjX9JDUvVVIucsufAEJHXr7nsGwBEUF5OZ2fHZ7NS5YMk2ijgMzHCJibgZweHUTXEyO 2w== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfb94r28q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 21:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUBRBs7B4aQ/mvNCdSbWZV83Rt2Wdme7NhnGsXiybyrAPnnfYyjaxKb46nDJOnUzbAY5z07j4I8RBSrFEpnOSy9q2hsNcEA+PDARf5yFY01jWfpp6zJUoPIn3AJgsYXUpISXYS5PmAUaF4DwvC2VVBhbDovqiuk2UatwlND65neuaK60E9IEpVDaMJGUL6Wy6C0zKd0teKmhEUagME536Rw/lp8SVite5nOt+R+IjMiItBopGj1yEChbxaJIWiX2pDzbkx+86zPRQEZbw4gIlt7pENAc0iLV6Evr66cF4oxGA9ibOTGZRYSlPbRGHMNFynqIl8KBqEauLO8Lmlgbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKO8M46oA45+3NIJN6+jW15olekpVPZ7tbIukmTvRNU=;
 b=CUBmXdjngP6+VyHZOXajYMHd2tXr69Be+WK1OLnRpVXO0cQlROy00k2wur+yBxj474lvWtcSANvzygB8t0ULnZdOQDcIaFdo58v7/9mxCgWV18vZj2pY/NUOzftf7XjV0CsFsmc9WmGYZRwNgw96T11MoY94bbjar5IlAwtcSlsiEy+wW0GBZUtrM41WIZj2vy5x7EMnoN1hmKfWl9AmqgU4Nrf48VWnTnhccdPSEzGE3x7qGE7LHMsTmBciBz84AhpvSplbuqbr8iU4338oWLeWfVW0z7BozryLz5SOA155nHMDOik+MHMa0UIOaiGie7xUYCy5VFVCG/rUx/0U7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 21:08:26 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14%9]) with mapi id 15.20.5723.035; Wed, 26 Oct 2022
 21:08:26 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com
Subject: [kirkstone][PATCH] tiff: fix CVE-2022-2953
Date: Wed, 26 Oct 2022 17:08:13 -0400
Message-Id: <20221026210813.33052-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::19) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|CO1PR11MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: ac761a2b-a886-45d6-bd1e-08dab7963938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lQ6sPpeB2YhfwgGl3ZSqkE0ylEj1fFTbFd3ceMBVxDUCK330CalERG6A0e7YLFjHC9HKhZjwU3yn0mEMShyd8W4vG1FfwXo0pIgwMiBi2Ikj0sFi+CE/takF1C6zR4qxWDvIK5/LlWk3J37v57mEzkpZOOgGo5LbiZavji/LZaYEZpxvQoF2yFmKWYaj7Rx09gizUeEojQeSb4Bym88/GxmkCfZK4PKXb1kF2g4aU6PmbHmXiGVK6MNy4LBNtucQdiWJwLU+e2CWUdHNwvWfHyIUViNdyzdLI2TLwnhgQFrA2OAZAD2C0WJh3FRl3c1f8MfEMwS261S8eCPASWR72eVXCsMz/EMyxvqt4BfMbciji+k2xobnw4Qw0FDw3YH7xKLruVMPx4UFmmAgQFcqAk5B5LL5J6GxOJ+8M4mbNu+S9JxOVqiQ3oW0AjIbvLgriSeNC/lEShSN+HVCCxKk2qyYehG66EfJMyRi/nzm3RVLx8MiQNWnJ7Gkxt67FSBn0pJQvcYgL246fHbm+JwiC9wIZUXZ3VHdwjIzYGXCpkGz/S5edbiq5q3WlDLKaeFEzfThSKKFdwx6xcoK9vSIc2A7KG99e9phVhW/g/Agn+C8e7t40TJ+VuFQ+ZPBLrSWNR7CifHSUlsvKiJB2NJblOkUyOBeL9p2CNJBacR7zNyfcEYnxWmqbQ459RgzgeknmjOFAequ59fbcUkZXIIMD7nzvvNTFAVnPaiaBk7T0jtC1n+FPj9YVjcgXUF+NsToRXcz+j35/XtILs0dUWrvb0rzYZMoqvrMiP2u1QMR2p2qXhitWNECLY/ilDcJ3w8Ei5++PZ5sNDKVzAmi0S0I8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39850400004)(376002)(396003)(451199015)(26005)(5660300002)(41300700001)(8936002)(6916009)(107886003)(6506007)(52116002)(66946007)(66476007)(4326008)(19627235002)(8676002)(6512007)(36756003)(66556008)(316002)(38350700002)(2616005)(38100700002)(44832011)(186003)(2906002)(6666004)(1076003)(30864003)(83380400001)(86362001)(6486002)(478600001)(84970400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MZGIWITAVr/7LVlzsXWv45yCEygUCRlecyHhtpvwtObmatOU4f9XLGNdlhpS?=
 =?us-ascii?Q?ct39BPp7yRRMn4PqEF/pRIiANs42rLoh694uM21AyekLbEB8sHZpa+Xt7rDR?=
 =?us-ascii?Q?Po1Vjmq9SoxetnmCpDnfIN8fBy4tooyMUv5QM97Ulrg7X1mTNoMIE6Ct3IKM?=
 =?us-ascii?Q?zjVk2geR+XhPdj7eP3adYvU4y/oJquitFFAdPIsE9mapCJENB78/hG7qSyc2?=
 =?us-ascii?Q?IrOD2V7p5XwBkdwPJEeyTwUqKSixbn20ciYs6kxqHwbqQd5ryI/plBYLqLln?=
 =?us-ascii?Q?vG8mSgrumQE330DxSeAtS4PB7gSRxCLfXsMINYMKcE7j9yPbLHrNqAceV8zx?=
 =?us-ascii?Q?W7vLiStu7YWoU6eUTg3u8sJikkHadiTV/u/pyusvXp9QB4MJVnw5ejPuFZ9f?=
 =?us-ascii?Q?Jef9ONk/y6JHwh2ssDqN1LcOb6oIPZoz8LSzaZKR93CJWgp7y6RnV0s27r4R?=
 =?us-ascii?Q?nAc7JWKExEv1FZm/8D1vr3J3FswaCx+ZJ7WIjAUmB2NYkAYdFYlHieCWDtoM?=
 =?us-ascii?Q?HJZPOj0ylRE1MuO0m79Mk8ww6TLxnxkcgxfIgsW6ln3DJ/j9Z+dLBQraMerj?=
 =?us-ascii?Q?yOgLuQqEPXYFnJ6q4/xdyPXhLkS8FDdBZuKdjQPlQTPVXawDAv1CHXQK258N?=
 =?us-ascii?Q?u95npMCEEnd01gyIyCo4KwSfWsCU8HV4ueJAYoXYexK8uE4Ab8XMLBn64WBU?=
 =?us-ascii?Q?FHGtuaZ27JGpJUFQEZmAKTvSSfS2c6NAgBH1LLIfAucyZEzjMOBUi+aiTu1M?=
 =?us-ascii?Q?H54uRPwE3UHoBffT7KMYu3cNoYjFgcgnPO/1hr+xvlC51qMYK/1nCsxDNGCZ?=
 =?us-ascii?Q?ARK20mUo0v/sa63tsNq1BJ0GPyYGB3QzNzoJyUKhf+Kc2clymv3Se4atUpN/?=
 =?us-ascii?Q?FuKyzHg05sXdUUiCVs8PQ7hB1DOs0FtNXt+R1Jk/IEEG+SKbzR+1YWbuRnNt?=
 =?us-ascii?Q?kHXYsysdwYOCqVw4fpKMMVAnQdyxCt9frpxOp42WFMTl9vy/iAW7LMeYvhue?=
 =?us-ascii?Q?NeI01ZMnxxyCm0D+8G5IFLy4ZGEKd+OARgNv/Z9WplilT9HcXyEEELshcz+a?=
 =?us-ascii?Q?blhnGWpMpKSimkdOwLW44lYll9+zIPr188lpyNzJxsbmcgQXLwJqtc6Ce8hu?=
 =?us-ascii?Q?7LwKeIUzuEo0V0jAwBV16ZKaHa2t6GfuKDbgUFqmMae3JDdTv+03wUMuUSBW?=
 =?us-ascii?Q?XxxR95aj2keI9RtxW2KUafKJzlpnjS/wEpfVg0VyUlr2cZNdcnPeYTI4wVC2?=
 =?us-ascii?Q?iUlvVo+QIitN4ZR+MGvdt/tLnpnHbj4nvnsHaE6XqTzZsIBriT/oTatWWuAB?=
 =?us-ascii?Q?HhWeDflpnIYIltP8v03hwx/yi9g3fuqu7txVJtOipKP5JaYbB7Uyl7J0hCwo?=
 =?us-ascii?Q?rPIn8fIYaf7808BaJS+vQjIXJmT56jsLhIpFmROgnm52nTkdrFcntNXnmwp/?=
 =?us-ascii?Q?+PK08cykVBPffbIYceeH5Vq4CROXAfPmkLjxakmjmoIziqkXT3hzquNTdcdY?=
 =?us-ascii?Q?Hoog9SvTpWg+vDhb0S9iuHYjqrmMpn9UIYm+NkhnmIqDfHqL3pvjSAaZoXOx?=
 =?us-ascii?Q?gIRO5q+4/Fuy47Xjrclf2c9EGbqdZjxSszd/pfn5f2uLBx+5w0HJF2zpZgRd?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac761a2b-a886-45d6-bd1e-08dab7963938
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 21:08:26.1062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik7Ho68DrcVAo76ROcja2lyvDy5nNf0D43pwMILw0EciUl6Ba0xe0OZNl1GRO9m3lDnaVpr+IKhg8uciHMvMXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
X-Proofpoint-ORIG-GUID: rEi6CsrCePpU8cXE4ey_Vy8ur2OpGWoP
X-Proofpoint-GUID: rEi6CsrCePpU8cXE4ey_Vy8ur2OpGWoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_08,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210260116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 21:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172174

While this does not happen with the tiff 4.3.0 release, it does happen with
the series of patches we have, so backport the two simple changes that
restrict the tiffcrop options to avoid the vulnerability.

CVE-2022-2953.patch was taken from upstream, and a small typo was fixed
for the CVE number. The other patch is included in tiff 4.4.0 but not
4.3.0, so add it as well.

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 ...ue-330-and-some-more-from-320-to-349.patch | 609 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-2953.patch          |  87 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 3 files changed, 698 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
new file mode 100644
index 0000000000..07acf5eb90
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
@@ -0,0 +1,609 @@
+From e319508023580e2f70e6e626f745b5b2a1707313 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 10 May 2022 20:03:17 +0000
+Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 to 349
+Upstream-Status: Backport
+Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
+---
+ tools/tiffcrop.c | 282 +++++++++++++++++++++++++++++++++++------------
+ 1 file changed, 210 insertions(+), 72 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 77cf6ed1..791ec5e7 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -63,20 +63,24 @@
+  *                units when sectioning image into columns x rows
+  *                using the -S cols:rows option.
+  * -X #           Horizontal dimension of region to extract expressed in current
+- *                units
++ *                units, relative to the specified origin reference 'edge' left (default for X) or right.
+  * -Y #           Vertical dimension of region to extract expressed in current
+- *                units
++ *                units, relative to the specified origin reference 'edge' top (default for Y) or bottom.
+  * -O orient      Orientation for output image, portrait, landscape, auto
+  * -P page        Page size for output image segments, eg letter, legal, tabloid,
+  *                etc.
+  * -S cols:rows   Divide the image into equal sized segments using cols across
+  *                and rows down
+- * -E t|l|r|b     Edge to use as origin
++ * -E t|l|r|b     Edge to use as origin (i.e. 'side' of the image not 'corner')
++ *                  top    = width from left, zones from top to bottom (default)
++ *                  bottom = width from left, zones from bottom to top
++ *                  left   = zones from left to right, length from top
++ *                  right  = zones from right to left, length from top
+  * -m #,#,#,#     Margins from edges for selection: top, left, bottom, right
+  *                (commas separated)
+  * -Z #:#,#:#     Zones of the image designated as zone X of Y, 
+  *                eg 1:3 would be first of three equal portions measured
+- *                from reference edge
++ *                from reference edge (i.e. 'side' not corner)
+  * -N odd|even|#,#-#,#|last 
+  *                Select sequences and/or ranges of images within file
+  *                to process. The words odd or even may be used to specify
+@@ -103,10 +107,13 @@
+  *                selects which functions dump data, with higher numbers selecting
+  *                lower level, scanline level routines. Debug reports a limited set
+  *                of messages to monitor progress without enabling dump logs.
++ * 
++ * Note:    The (-X|-Y), -Z and -z options are mutually exclusive.
++ *          In no case should the options be applied to a given selection successively.
+  */
+ 
+-static   char tiffcrop_version_id[] = "2.4.1";
+-static   char tiffcrop_rev_date[] = "03-03-2010";
++static   char tiffcrop_version_id[] = "2.5";
++static   char tiffcrop_rev_date[] = "02-09-2022";
+ 
+ #include "tif_config.h"
+ #include "libport.h"
+@@ -774,6 +781,9 @@ static const char usage_info[] =
+ "             The four debug/dump options are independent, though it makes little sense to\n"
+ "             specify a dump file without specifying a detail level.\n"
+ "\n"
++"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
++"             In no case should the options be applied to a given selection successively.\n"
++"\n"
+ ;
+ 
+ /* This function could be modified to pass starting sample offset 
+@@ -2121,6 +2131,15 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z are mutually exclusive) --*/
++    char XY, Z, R;
++    XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH));
++    Z = (crop_data->crop_mode & CROP_ZONES);
++    R = (crop_data->crop_mode & CROP_REGIONS);
++    if ((XY && Z) || (XY && R) || (Z && R)) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z and -z are mutually exclusive.->Exit");
++        exit(EXIT_FAILURE);
++    }
+   }  /* end process_command_opts */
+ 
+ /* Start a new output file if one has not been previously opened or
+@@ -2746,7 +2765,7 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+                            tsample_t count, uint32_t start, uint32_t end)
+   {
+   int i, bytes_per_sample, sindex;
+-  uint32_t col, dst_rowsize, bit_offset;
++  uint32_t col, dst_rowsize, bit_offset, numcols;
+   uint32_t src_byte /*, src_bit */;
+   uint8_t *src = in;
+   uint8_t *dst = out;
+@@ -2757,6 +2776,10 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesBytes", 
+@@ -2769,6 +2792,9 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   dst_rowsize = (bps * (end - start) * count) / 8;
+ 
+@@ -2812,7 +2838,7 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                            tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint8_t  maskbits = 0, matchbits = 0;
+   uint8_t  buff1 = 0, buff2 = 0;
+   uint8_t *src = in;
+@@ -2824,6 +2850,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples8bits", 
+@@ -2836,7 +2866,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
+-  
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
++
+   ready_bits = 0;
+   maskbits =  (uint8_t)-1 >> (8 - bps);
+   buff1 = buff2 = 0;
+@@ -2889,7 +2922,7 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                             tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint16_t maskbits = 0, matchbits = 0;
+   uint16_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff = 0;
+@@ -2902,6 +2935,10 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples16bits", 
+@@ -2914,6 +2951,9 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = 0;
+   maskbits = (uint16_t)-1 >> (16 - bps);
+@@ -2978,7 +3018,7 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                             tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t maskbits = 0, matchbits = 0;
+   uint32_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff1 = 0, bytebuff2 = 0;
+@@ -2991,6 +3031,10 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples24bits", 
+@@ -3003,6 +3047,9 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = 0;
+   maskbits =  (uint32_t)-1 >> (32 - bps);
+@@ -3087,7 +3134,7 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                             tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t longbuff1 = 0, longbuff2 = 0;
+   uint64_t maskbits = 0, matchbits = 0;
+   uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
+@@ -3102,6 +3149,10 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     }
+ 
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples32bits", 
+@@ -3114,6 +3165,9 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   /* shift_width = ((bps + 7) / 8) + 1; */ 
+   ready_bits = 0;
+@@ -3193,7 +3247,7 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                   int shift)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint8_t  maskbits = 0, matchbits = 0;
+   uint8_t  buff1 = 0, buff2 = 0;
+   uint8_t *src = in;
+@@ -3205,6 +3259,10 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted8bits", 
+@@ -3217,6 +3275,9 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = shift;
+   maskbits =  (uint8_t)-1 >> (8 - bps);
+@@ -3273,7 +3334,7 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                    int shift)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint16_t maskbits = 0, matchbits = 0;
+   uint16_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff = 0;
+@@ -3286,6 +3347,10 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted16bits", 
+@@ -3298,6 +3363,9 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = shift;
+   maskbits = (uint16_t)-1 >> (16 - bps);
+@@ -3363,7 +3431,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                    int shift)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t maskbits = 0, matchbits = 0;
+   uint32_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff1 = 0, bytebuff2 = 0;
+@@ -3376,6 +3444,16 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  /*--- Remark, which is true for all those functions extractCongigSamplesXXX() --
++  *  The mitigation of the start/end test does not allways make sense, because the function is often called with e.g.:
++  *  start = 31; end = 32; cols = 32  to extract the last column in a 32x32 sample image. 
++  *  If then, a worng parameter (e.g. cols = 10) is provided, the mitigated settings would be start=0; end=1. 
++  *  Therefore, an error message and no copy action might be the better reaction to wrong parameter configurations.
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted24bits", 
+@@ -3388,6 +3466,9 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = shift;
+   maskbits =  (uint32_t)-1 >> (32 - bps);
+@@ -3449,7 +3530,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     buff2 = (buff2 << 8);
+     bytebuff2 = bytebuff1;
+     ready_bits -= 8;
+-    }
++  }
+    
+   return (0);
+   } /* end extractContigSamplesShifted24bits */
+@@ -3461,7 +3542,7 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                    int shift)
+   {
+   int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t longbuff1 = 0, longbuff2 = 0;
+   uint64_t maskbits = 0, matchbits = 0;
+   uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
+@@ -3476,6 +3557,10 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     }
+ 
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted32bits", 
+@@ -3488,6 +3573,9 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   /* shift_width = ((bps + 7) / 8) + 1; */ 
+   ready_bits = shift;
+@@ -5429,7 +5517,7 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+   {
+   struct offset offsets;
+   int    i;
+-  int32_t  test;
++  uint32_t uaux;
+   uint32_t seg, total, need_buff = 0;
+   uint32_t buffsize;
+   uint32_t zwidth, zlength;
+@@ -5510,8 +5598,13 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+     seg = crop->zonelist[j].position;
+     total = crop->zonelist[j].total;
+ 
+-    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip that input */
++    /* check for not allowed zone cases like 0:0; 4:3; or negative ones etc. and skip that input */
++    if (crop->zonelist[j].position < 0 || crop->zonelist[j].total < 0) {
++        TIFFError("getCropOffsets", "Negative crop zone values %d:%d are not allowed, thus skipped.", crop->zonelist[j].position, crop->zonelist[j].total);
++        continue;
++    }
+     if (seg == 0 || total == 0 || seg > total) {
++        TIFFError("getCropOffsets", "Crop zone %d:%d is out of specification, thus skipped.", seg, total);
+         continue;
+     }
+ 
+@@ -5524,17 +5617,23 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+ 
+            crop->regionlist[i].x1 = offsets.startx + 
+                                   (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) / total);
+-           test = (int32_t)offsets.startx +
+-                  (int32_t)(offsets.crop_width * 1.0 * seg / total);
+-           if (test < 1 )
+-             crop->regionlist[i].x2 = 0;
+-           else
+-	     {
+-	     if (test > (int32_t)(image->width - 1))
++           /* FAULT: IMHO in the old code here, the calculation of x2 was based on wrong assumtions. The whole image was assumed and 'endy' and 'starty' are not respected anymore!*/
++           /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++           if (crop->regionlist[i].x1 > offsets.endx) {
++                crop->regionlist[i].x1 = offsets.endx;
++           } else if (crop->regionlist[i].x1 >= image->width) {
++               crop->regionlist[i].x1 = image->width - 1;
++           }
++
++           crop->regionlist[i].x2 = offsets.startx + (uint32_t)(offsets.crop_width * 1.0 * seg / total);
++           if (crop->regionlist[i].x2 > 0) crop->regionlist[i].x2 = crop->regionlist[i].x2 - 1;
++           if (crop->regionlist[i].x2 < crop->regionlist[i].x1) {
++               crop->regionlist[i].x2 = crop->regionlist[i].x1;
++           } else if (crop->regionlist[i].x2 > offsets.endx) {
++               crop->regionlist[i].x2 = offsets.endx;
++           } else if (crop->regionlist[i].x2 >= image->width) {
+                crop->regionlist[i].x2 = image->width - 1;
+-             else
+-	       crop->regionlist[i].x2 = test - 1;
+-             }
++           }
+            zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1  + 1;
+ 
+ 	   /* This is passed to extractCropZone or extractCompositeZones */
+@@ -5549,22 +5648,27 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+ 	   crop->regionlist[i].x1 = offsets.startx;
+            crop->regionlist[i].x2 = offsets.endx;
+ 
+-           test = offsets.endy - (uint32_t)(offsets.crop_length * 1.0 * seg / total);
+-           if (test < 1 )
+-	     crop->regionlist[i].y1 = 0;
+-           else
+-	     crop->regionlist[i].y1 = test + 1;
++           /* FAULT: IMHO in the old code here, the calculation of y1/y2 was based on wrong assumtions. The whole image was assumed and 'endy' and 'starty' are not respected anymore!*/
++           /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++           uaux = (uint32_t)(offsets.crop_length * 1.0 * seg / total);
++           if (uaux <= offsets.endy + 1) {
++               crop->regionlist[i].y1 = offsets.endy - uaux + 1;
++           } else {
++               crop->regionlist[i].y1 = 0;
++           }
++           if (crop->regionlist[i].y1 < offsets.starty) {
++               crop->regionlist[i].y1 = offsets.starty;
++           }
+ 
+-           test = offsets.endy - (offsets.crop_length * 1.0 * (seg - 1) / total);
+-           if (test < 1 )
+-             crop->regionlist[i].y2 = 0;
+-           else
+-	     {
+-             if (test > (int32_t)(image->length - 1))
+-               crop->regionlist[i].y2 = image->length - 1;
+-             else 
+-               crop->regionlist[i].y2 = test;
+-	     }
++           uaux = (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / total);
++           if (uaux <= offsets.endy) {
++               crop->regionlist[i].y2 = offsets.endy - uaux;
++           } else {
++               crop->regionlist[i].y2 = 0;
++           }
++           if (crop->regionlist[i].y2 < offsets.starty) {
++               crop->regionlist[i].y2 = offsets.starty;
++           }
+            zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+ 
+ 	   /* This is passed to extractCropZone or extractCompositeZones */
+@@ -5575,32 +5679,42 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+            crop->combined_width = (uint32_t)zwidth;
+            break;
+       case EDGE_RIGHT: /* zones from right to left, length from top */
+-           zlength = offsets.crop_length;
+-	   crop->regionlist[i].y1 = offsets.starty;
+-           crop->regionlist[i].y2 = offsets.endy;
+-
+-           crop->regionlist[i].x1 = offsets.startx +
+-                                  (uint32_t)(offsets.crop_width * (total - seg) * 1.0 / total);
+-           test = offsets.startx + 
+-	          (offsets.crop_width * (total - seg + 1) * 1.0 / total);
+-           if (test < 1 )
+-             crop->regionlist[i].x2 = 0;
+-           else
+-	     {
+-	     if (test > (int32_t)(image->width - 1))
+-               crop->regionlist[i].x2 = image->width - 1;
+-             else
+-               crop->regionlist[i].x2 = test - 1;
+-             }
+-           zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1  + 1;
++		  zlength = offsets.crop_length;
++		  crop->regionlist[i].y1 = offsets.starty;
++		  crop->regionlist[i].y2 = offsets.endy;
++
++		  crop->regionlist[i].x1 = offsets.startx +
++			  (uint32_t)(offsets.crop_width * (total - seg) * 1.0 / total);
++          /* FAULT: IMHO from here on, the calculation of y2 are based on wrong assumtions. The whole image is assumed and 'endy' and 'starty' are not respected anymore!*/
++          /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++          uaux = (uint32_t)(offsets.crop_width * 1.0 * seg / total);
++          if (uaux <= offsets.endx + 1) {
++              crop->regionlist[i].x1 = offsets.endx - uaux + 1;
++          } else {
++              crop->regionlist[i].x1 = 0;
++          }
++          if (crop->regionlist[i].x1 < offsets.startx) {
++              crop->regionlist[i].x1 = offsets.startx;
++          }
+ 
+-	   /* This is passed to extractCropZone or extractCompositeZones */
+-           crop->combined_length = (uint32_t)zlength;
+-           if (crop->exp_mode == COMPOSITE_IMAGES)
+-             crop->combined_width += (uint32_t)zwidth;
+-           else
+-             crop->combined_width = (uint32_t)zwidth;
+-           break;
++          uaux = (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) / total);
++          if (uaux <= offsets.endx) {
++              crop->regionlist[i].x2 = offsets.endx - uaux;
++          } else {
++              crop->regionlist[i].x2 = 0;
++          }
++          if (crop->regionlist[i].x2 < offsets.startx) {
++              crop->regionlist[i].x2 = offsets.startx;
++          }
++          zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++
++		  /* This is passed to extractCropZone or extractCompositeZones */
++		  crop->combined_length = (uint32_t)zlength;
++		  if (crop->exp_mode == COMPOSITE_IMAGES)
++			  crop->combined_width += (uint32_t)zwidth;
++		  else
++			  crop->combined_width = (uint32_t)zwidth;
++		  break;
+       case EDGE_TOP: /* width from left, zones from top to bottom */
+       default:
+            zwidth = offsets.crop_width;
+@@ -5608,6 +5722,14 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+            crop->regionlist[i].x2 = offsets.endx;
+ 
+            crop->regionlist[i].y1 = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / total);
++           if (crop->regionlist[i].y1 > offsets.endy) {
++               crop->regionlist[i].y1 = offsets.endy;
++           } else if (crop->regionlist[i].y1 >= image->length) {
++               crop->regionlist[i].y1 = image->length - 1;
++           }
++
++           /* FAULT: IMHO from here on, the calculation of y2 are based on wrong assumtions. The whole image is assumed and 'endy' and 'starty' are not respected anymore!*/
++           /* OLD Code: 
+            test = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * seg / total);
+            if (test < 1 )
+              crop->regionlist[i].y2 = 0;
+@@ -5618,6 +5740,18 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+              else
+ 	       crop->regionlist[i].y2 = test - 1;
+ 	     }
++           */
++		   /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++		   crop->regionlist[i].y2 = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * seg / total);
++           if (crop->regionlist[i].y2 > 0)crop->regionlist[i].y2 = crop->regionlist[i].y2 - 1;
++		   if (crop->regionlist[i].y2 < crop->regionlist[i].y1) {
++			   crop->regionlist[i].y2 = crop->regionlist[i].y1;
++		   } else if (crop->regionlist[i].y2 > offsets.endy) {
++			   crop->regionlist[i].y2 = offsets.endy;
++		   } else if (crop->regionlist[i].y2 >= image->length) {
++			   crop->regionlist[i].y2 = image->length - 1;
++		   }
++
+            zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+ 
+ 	   /* This is passed to extractCropZone or extractCompositeZones */
+@@ -7551,7 +7685,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+     total_width = total_length = 0;
+     for (i = 0; i < crop->selections; i++)
+       {
+-      cropsize = crop->bufftotal;
++
++        cropsize = crop->bufftotal;
+       crop_buff = seg_buffs[i].buffer; 
+       if (!crop_buff)
+         crop_buff = (unsigned char *)limitMalloc(cropsize);
+@@ -7640,6 +7775,9 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+       if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+         {
++          /* rotateImage() changes image->width, ->length, ->xres and ->yres, what it schouldn't do here, when more than one section is processed. 
++           * ToDo: Therefore rotateImage() and its usage has to be reworked (e.g. like mirrorImage()) !!
++           */
+ 	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+ 			&crop->regionlist[i].length, &crop_buff))
+           {
+@@ -7655,8 +7793,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         seg_buffs[i].size = (((crop->regionlist[i].width * image->bps + 7 ) / 8)
+                                * image->spp) * crop->regionlist[i].length; 
+         }
+-      }
+-    }
++      }  /* for crop->selections loop */
++    }  /* Separated Images (else case) */
+   return (0);
+   } /* end processCropSelections */
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
new file mode 100644
index 0000000000..3a3a915688
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
@@ -0,0 +1,87 @@
+CVE: CVE-2022-2953
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
+
+From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Mon, 15 Aug 2022 22:11:03 +0200
+Subject: [PATCH] =?UTF-8?q?According=20to=20Richard=20Nolde=20https://gitl?=
+ =?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=5F877637400=20the=20ti?=
+ =?UTF-8?q?ffcrop=20option=20=E2=80=9E-S=E2=80=9C=20is=20also=20mutually?=
+ =?UTF-8?q?=20exclusive=20to=20the=20other=20crop=20options=20(-X|-Y),=20-?=
+ =?UTF-8?q?Z=20and=20-z.?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is now checked and ends tiffcrop if those arguments are not mutually exclusive.
+
+This MR will fix the following tiffcrop issues: #349, #414, #422, #423, #424
+---
+ tools/tiffcrop.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 90286a5e..c3b758ec 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] = "02-09-2022";
+ #define ROTATECW_270 32
+ #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
+ 
+-#define CROP_NONE     0
+-#define CROP_MARGINS  1
+-#define CROP_WIDTH    2
+-#define CROP_LENGTH   4
+-#define CROP_ZONES    8
+-#define CROP_REGIONS 16
++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page->rows/->cols != 0 */
++#define CROP_MARGINS  1     /* "-m" */
++#define CROP_WIDTH    2     /* "-X" */
++#define CROP_LENGTH   4     /* "-Y" */
++#define CROP_ZONES    8     /* "-Z" */
++#define CROP_REGIONS 16     /* "-z" */
+ #define CROP_ROTATE  32
+ #define CROP_MIRROR  64
+ #define CROP_INVERT 128
+@@ -316,7 +316,7 @@ struct crop_mask {
+ #define PAGE_MODE_RESOLUTION   1
+ #define PAGE_MODE_PAPERSIZE    2
+ #define PAGE_MODE_MARGINS      4
+-#define PAGE_MODE_ROWSCOLS     8
++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
+ 
+ #define INVERT_DATA_ONLY      10
+ #define INVERT_DATA_AND_TAG   11
+@@ -781,7 +781,7 @@ static const char usage_info[] =
+ "             The four debug/dump options are independent, though it makes little sense to\n"
+ "             specify a dump file without specifying a detail level.\n"
+ "\n"
+-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclusive.\n"
+ "             In no case should the options be applied to a given selection successively.\n"
+ "\n"
+ ;
+@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
+-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z are mutually exclusive) --*/
+-    char XY, Z, R;
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and -S are mutually exclusive) --*/
++    char XY, Z, R, S;
+     XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH));
+     Z = (crop_data->crop_mode & CROP_ZONES);
+     R = (crop_data->crop_mode & CROP_REGIONS);
+-    if ((XY && Z) || (XY && R) || (Z && R)) {
+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z and -z are mutually exclusive.->Exit");
++    S = (page->mode & PAGE_MODE_ROWSCOLS);
++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || (R && S)) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->Exit");
+         exit(EXIT_FAILURE);
+     }
+   }  /* end process_command_opts */
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index f84057c46b..29a2c38d8e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-2869.patch \
            file://CVE-2022-2867.patch \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
+           file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
+           file://CVE-2022-2953.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.33.0


