Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BC8C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 02:59:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15388.1683860384244369279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 19:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MfaIUllG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4496f8c645=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34C2tg6R008979
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:59:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=QrsRjM1BkMVpfFKsmKkPKxZG0WU42Vpk6xm6X8G0EPc=;
 b=MfaIUllGgCnJok3HHqsSjEIE28aeyHCJ/PFZqos6LHeeu0YJkUSi9WgsEleITNqgvSzA
 VKlhRYwnUmjGstZjuQwVyR2O/IPR92BTTt3H3lxS8iaM6M3TWtpa/o05qLqnpVigKs+K
 3Egmi6WSHGoPwd2hEdSmrE+pv5CpN37hI0ev81odMNkwwRFQnkbW8ak9fSUHbv75+XGY
 UT2lvNlcczR1+NI2G6eGiyXsOTdVCVPdcB4hi/T3GzRAaB6HDwfWYvmIk3u4vpR85wWv
 atq8WxuF70MpXYNbzsgab2z4A/0B2mVewHItzbgb2fpIFmq7lcU9XkMYIXx6A+Y/xQE9 FA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf81jub6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOVzeMC51jXQj/dHKzMVTZI3CBACNxI5qgp+CTmyWX9s6hEDmz4EhNueR03hMD+A9mYPd5x1tzVIcubulmmmhPQ1P4702cuEml4iplxw0fuZ8Eg9gYI+9ZhbfgeovUyWWBakY/XmyPSL+v+NGwibrgJHZnP5R2mtCpH/n5jQaxNeuCiZLMV4J1WIUkzHQ8Scsg8qGUqfPKl2QhxL1+6gk4cAN1V3QwWR43hhV/HGx4y+oFgtE8BkraqHQ+N9AEehPeOCzoXhGQtfMWl22pbDxH+doGm5M7oexY36e8GEb6loRa75hq5qMw+/8aBZsdVPCRihmWW5xJtxZsg5KqxFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrsRjM1BkMVpfFKsmKkPKxZG0WU42Vpk6xm6X8G0EPc=;
 b=YSlIi+kHLCFggGrYFQkqp/gYc9MQthTeWth5ZrfGblpYpZMl6Xo0sECtEkrNTw+PxvpWRwOZiaWNZdYBysa4CmY+v6jehlXKjOMCyBTgVUjTBxyOD/pfX7h5BahP4YdgPisvAu74Jg3iLk4kqJCin3e5ToN6H1DRYc/N9YvGyZ1t7RJqi+j1zm7E/QlFLK6EYYiGYeig/aFnL/Kf5t0SgHTQkmgqnxKdXZUIw23deV0JNu+Rq7C/SR2FNhib8CRMBBr9yBqv8Wkz3vR7QVdxDvFx1bEi6AYilM4kTB5DO3AbcZg6p7Yl5ocqLDBYTV+cY0XIkQeGKnVO0F28AHNr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Fri, 12 May
 2023 02:59:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 02:59:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oe-buildenv-internal: remove path from previous project
Date: Fri, 12 May 2023 10:59:16 +0800
Message-Id: <20230512025916.1438845-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:404:15::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: ba049792-4903-4b7f-ce90-08db5294ed57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bqp9FdXa9R6g7EoVhP84eCAjEJFxApCEcPJIn/NEAkfu+ZO9ha8XBuerwWdxja+FWQdjyXA/zRUmb62ugCy2jDl6pNZ1ebngczbCTyoGll1yxTqhNsUez4nOmtGPqMjvc49uw6m7CDxQengrHyoiEqBfLCyJPuN2Es5UV4VBMj4f4yRCjmDUBZqm8VdynUwFXLAxDUms3Y0DUZkUd04d4ch6lkU/BK/ieMeQVS4q9veALi7lf1wM2UUBhXy0XehQxtTcaC/t5s/dj1YoSuiWI/5NzS9/koz7sh1ev5rRIgyiJgqE3Sf53Zsqawzn/IA6uPIm01Pmj2yC1tudn7W196t2E0myqZnj+sx9RRc1tXBpx/bBQUpf8WEyNl/tEvHwo+aMelCMSzH6HSEbPnBxShJaYlTgnbWovpSN1cBkSM4q2uWeBHfuiX5pudJQ5GX60xRObGdv2H48EEFeQu1osMBgFQYKkj6tN+JV0qhso6GYDIvf70hus3n49x9jb57eO9b1lgKbBavXfmBcTD8czdziKeCTmB9p5lrHgmkkB6hdYyrLLyNDznjaa0figd0PruMNxRyEnQa/8RuxyF6kJxIiVk2cqImbwaL8HGc2MIbNa0l543Zp/LPhu8Qraqrn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(451199021)(86362001)(66946007)(52116002)(6666004)(478600001)(6486002)(6506007)(26005)(9686003)(2616005)(6512007)(186003)(1076003)(66556008)(38100700002)(38350700002)(36756003)(83380400001)(66476007)(2906002)(6916009)(5660300002)(41300700001)(8936002)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AzLaRb1XlHLElRyjP1hgwzdujR+P0OMcM6x+iCCzwzF4+T663g2g9tUHXHDh?=
 =?us-ascii?Q?jlNPbYI5TxBMbiLUIiSc9lYrbTK7RexO5x/PJgVJDhGsTbdHCL1xArpFIcuV?=
 =?us-ascii?Q?7MhUfVDXcHpW8PWy3A52vw/k640Q8KdNrv65tCuSHV/feq3etwkjSZ2VFp8c?=
 =?us-ascii?Q?LbELdy4vR/Sa5pQVdMArFrBLDA+TQayLqIzR+Tvyk7TR8ceESSikenPOvD1h?=
 =?us-ascii?Q?C0mY+loxXLtMb8WK4jS0BwKrnSduQCfG2VPzHVBOOiVSRaPDmPVWWGz5HSRo?=
 =?us-ascii?Q?4enzoHknbZ9gKZqoTn4CtywSBjOQd66cGxcdUbqkHlsz3l2mJiL5DopECszt?=
 =?us-ascii?Q?Dc07q7uxpJoBdGj4fL525HpfOJWJTEoC4buLUKWDZmJyffPatwHbgdp2nEAi?=
 =?us-ascii?Q?EBj/6Ux8eQ0HEX1inPlyLvHZJ+6Y1ZiPolYcxJWzTfnP6ucY8fOsyOMiEnzh?=
 =?us-ascii?Q?A1yOlbgaPLof1XBGmoio60ZFv3qyR7irCe1Dkg3naykvNNBXxGcI7maf1Bct?=
 =?us-ascii?Q?z4U6Vks5+/nNkUpenztIfZMlGVniSNu0b7rV3oDWiPr/9gk2J7SAQlayqjTy?=
 =?us-ascii?Q?mmTiOBDzWiJW3zbl7MkTNNqFU5/M0Md4Yh12/58uOGfBhTyi0GKCcKF4l8QB?=
 =?us-ascii?Q?hhDNvDorEm+yHufc277NW1r+FfdrkLZaFi33ubQUi4FVFN3lGK/JRkpuPJGj?=
 =?us-ascii?Q?ypsP0QyDniiTyM3ADKK58xyy9bRIRbojTULJy9uj1CxuZsf6av5BnypGRXpF?=
 =?us-ascii?Q?ZhdHVCTPLz5NIhBEUec5Xg+/Ds6vtGBfwJ4vD74fuEooxc0gEU8Om774vnbY?=
 =?us-ascii?Q?cYU+TjektwXr17VSR8FLo8BCAx7oYFfGoLKL49LLchFHyxkgvUdB0MSo5NSy?=
 =?us-ascii?Q?lXZ1C83HJwTIiDba6E1QKGwpOPNclzqAVM7n5tir2TsKy81fVX5RaZREHyDI?=
 =?us-ascii?Q?cHDmYYYDZZN9hB4rrK7PkyFQZPYfiDKR4r2bLA4BuhHB6JR4ox6E2Wu83CWu?=
 =?us-ascii?Q?E9Kg2YIXzB2FpjMEDanYK/nm8QMwSxVDC69abo5jlFdUk/q2YgrQhfhJr2GD?=
 =?us-ascii?Q?hPSe3YBULaupM9Hedku56AY62j+9jpmfDDHzvjgEBuj7lRxIHUaV+qLMcaTn?=
 =?us-ascii?Q?P9ITSDQG6q4ZPzcl66Dm3vHf/VMMsbUt+I6lDsjbZNUmv4hp5grsIAbNL3I+?=
 =?us-ascii?Q?+gX4Otp1R0R6kTDg/sTVvfEBjpy434lbLVTxqrwwH71s/e9Kj4wcbeSGNGD5?=
 =?us-ascii?Q?aAse25YC1GrOfOfcMkgA7YRo7MnDjHxcjTG9+bUPNZFDyYcjyZu5gav3d1UN?=
 =?us-ascii?Q?yk8EqxnBGBU18BuBopJQULIPHPLCfzhnaZ+sAe3j2Ynh1jZmMNrkGXqOfaex?=
 =?us-ascii?Q?kW9caTcf5dy922AUktlwSos+6hqIPly1B26ePAnsIYbgTQz7KXcX4Y84bzof?=
 =?us-ascii?Q?9rD8v6P6/84GBl+EMIVqsLIKcn87giglGvRdmWufFEThi0CMsXc6PWKIXgh2?=
 =?us-ascii?Q?XxLvm8XqjTkVcXLVd4u4zhhVfaat/S90SU+OXlPjYl5cwjLkooyqJXEoaIfh?=
 =?us-ascii?Q?BXw1ZlHCUEU8+22DMVlC8jjS4LPSnmXVoWY5qOhV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba049792-4903-4b7f-ce90-08db5294ed57
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 02:59:39.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZwXfVGYGmLiOXDpipwAJCTacotAgUKJpsJMLsmOnhQVIGlfWSRoms7W6QtQkWLV/JWN3wzovnY18VKWt3ASaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
X-Proofpoint-ORIG-GUID: nKL-Y45D7hKhqjnklEnk8KxOgfgApN17
X-Proofpoint-GUID: nKL-Y45D7hKhqjnklEnk8KxOgfgApN17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 mlxlogscore=960 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305120025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 02:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181172

From: Chen Qi <Qi.Chen@windriver.com>

For now, only that paths added from current project are removed
to avoid PATH growing unnecessarily. This is to handle the case
of sourcing the init script into different build directories.

However, if we source the init script from different projects into
different build directories, the paths added by previous projects
are not cleaned up.

To avoid this, we record the paths added into OE_ADDED_PATH, and
remove it in the next sourcing.

Note that the paths, "$OEROOT/scripts:$BITBAKEDIR/bin:", are added
as a whole. A previous commit, "oe-buildenv-internal: Add paths to $PATH individually",
made the change to treat these two paths separately, the reason was
not "assuming the path to the scripts directory always is in $PATH
directly before the bitbake directory". But this is exactly the effect
of the codes. I see no reason why we should complicate things.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-buildenv-internal | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 485d4c52e1..fdc29bd353 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -92,15 +92,13 @@ fi
 PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
 export PYTHONPATH
 
+# Remove old added path
+[ -n "$OE_ADDED_PATH" ] && PATH=$(echo $PATH | sed -e "s#$OE_ADDED_PATH##")
+OE_ADDED_PATH="$OEROOT/scripts:$BITBAKEDIR/bin:"
 # Make sure our paths are at the beginning of $PATH
-for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
-    # Remove any existences of $newpath from $PATH
-    PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
-
-    # Add $newpath to $PATH
-    PATH="$newpath:$PATH"
-done
-unset BITBAKEDIR newpath
+PATH="$OE_ADDED_PATH$PATH"
+export OE_ADDED_PATH
+unset BITBAKEDIR
 
 # Used by the runqemu script
 export BUILDDIR
-- 
2.34.1


