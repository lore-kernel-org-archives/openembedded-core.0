Return-Path: <ovidiu.panait@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5019C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 13:40:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23791.1673444435785723318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 05:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=037565bbce=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30BDaU6q003095
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 13:40:35 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k60gekv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 13:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YutUUYC30JWXqCrRc9mvMbThZcdGKY84gbtMqLAu+AxPztf4oHU+DVQEFE6g6BECBjgW3Y79iM1bNen8C2W027Qp0mozIAV3rRFYUExrXmXRaZhtMERcYIUK0NVoSHY0VNes9X+GqzNSVcNERQHCkBshVQ8BchNsercsMAtVdOAp4yuC8Yma0sJynUqCmmgddxwnDdQs4HKFBvWKo0EqrHlaUcug7BbniUFslQF/ARQiV3GyFd1JP6WZHb+OaPCrU2MKS9ideL7n2ULYNsN0f9bX4+ggkbqVVeM07ZxHEEGvGS5L1ma9rb0zpulRjnuafNIVoJtiqazLwN3ZP7lQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcbCcJ7Cix+FZyFS2ugbksZsxThDVRvI6JeUBI19cfI=;
 b=M0+muxlo6bomfTnTSwzFEMckFTBi7Kl4zD3D48SkasGsY7GwyWhPacfDlBuF4lrMIQ212PimeOW/3R8lgGKs8OdbXRY40sIKTjjxslcqlmpia4G+6kfMbH7mySalzSWzEFsIGwsLWHqKjfDqfkPUbFDWp/0DpALVgM0WU4ABzl06FN5lTgyAc2M91G0D0fnBXPLkre8fvpwaqFYUoaq2lyl76FpxL0LEy7ExQEUhr5X+5rGtrLajwuokIHD4AX16E0oJFBCx8nTo2UlW9dHGDxW3Bn1G9sniuqMYKBbvalJPJz2mA7EQpYyucsPTZt/jvbjbaJnnKX9g9uETNHeMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:40:31 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1c99:5365:d3e:39ac]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1c99:5365:d3e:39ac%2]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 13:40:31 +0000
From: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: fix perl-native dependency
Date: Wed, 11 Jan 2023 15:40:14 +0200
Message-Id: <20230111134014.3220014-1-ovidiu.panait@eng.windriver.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: a63ce801-21d7-4da6-849e-08daf3d96840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	homiSgAHEo9wewYG2bWT8tdYWEhCCZjjVecobk8ZOhUMLwTt5pyz6z2+5XdvW9o5UBC3kAfxIO8Xn1/0wuu2aTCD74DdugqyvjTgLV44+fgL9vnQoSFHNPL80FNt206UZr+Vbo+WAWt9JbNH0No+CJ0H4V0hH79a2r8cJBTnPtcf6hft/rS0/HP0jU0khDmTNp71KBr7Ph+OO4++FR3VyBtJ5jjUkosCtDiJAKZxrrrnaGxb2PmwullO2XykGORWb+6m7FIXLTOtF6HvHRVECg1+5t0RxHyWJz50Bj1iaVV4ai/BOg5lF5+6a8JzgiUneo6HYgiQhqTsvLpMUhmGMJbv9rYvxHub/TepT8DVGdL3D0bT9bPnfBEuyhC1MhdveZOQ+5X6ze4NV6K63s9v2UvnQsUxFuGNbgHwPc2XUDQCZv156oFjsDa79t/V6niGB2aZsBlMj9VzZZ6iKeQLIuis1AVE8H913QqtKVQV/bzPcXM0FB/pf4ISsFvOdKezrSAmA0J1f886cOKKB0m/FEtFgJS+UDc7qHII9nTxxZdAd8jAY4uQO+aO9oaeElg4+J54HteTNfWhaxSGl6L87FzYEq9Ht+5S9LKy5lVejkvMiO4p8sWY9SRM4NJNSF86sUp9SJ/12/4QAuyqcUqP9hKD3oSlHQTcujki8Dm84hgKLgfE+2CHPSsVuV6bsXz3YimZR2YWsbxCoyoFz1UApW4HEfTrc3uUj+70gXNwtHs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(451199015)(44832011)(2906002)(83380400001)(1076003)(2616005)(66556008)(52116002)(66476007)(6916009)(66946007)(5660300002)(8936002)(6666004)(186003)(26005)(6506007)(6512007)(6486002)(478600001)(38350700002)(38100700002)(41300700001)(8676002)(83170400001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zRf8g/cbehX8HkcgM53LuBnqtFiyx3+X2Hbbm5zMprV2PpHaZ5ABRwiKd6g5?=
 =?us-ascii?Q?DlWx1v0zovL3xMiDfpoFww/lGBWSX21AhZDnN/4Whvpp5IL4QkGncjM7rkRl?=
 =?us-ascii?Q?/BJAQY16QR+xY0uC/nquelTosDjQ1neFiHs6JKyqZExwr6pAt1a7NbQAiNKE?=
 =?us-ascii?Q?cdj25dcxbidHMjONSef/uLT22UwKNEA1EJKOT7RZnTJPI6TKUPfYdNtyOZvh?=
 =?us-ascii?Q?WO7729DrWGLhDGOF24ObeA1UllMNQQQj13X4mUeZQn41n5A5Ud2x6VrnjuJ7?=
 =?us-ascii?Q?L83UrJltTQuU5dSDOQRCnbl7rYtO3gPq9SbUB58WlfqPqGfX/7iyC/yewgXd?=
 =?us-ascii?Q?f+efnOkAEbiePZfc4SpcB5Y5cdLA3f0TpDqUECr7kbOLkWQ7oiM23sKZBL3j?=
 =?us-ascii?Q?TFCfBiIEu9s4W7AJGgW4pdPML1uXHts/UhwvE/025JS3OTPUblFPhWfpyn+b?=
 =?us-ascii?Q?bpamd82hQrdfK0o5yV7pT/a6jqF8o7E5NF5lCDWUO3QRq+STvcT0j4u2en+v?=
 =?us-ascii?Q?ce7y0UIlSc8VVyF8WYrlNspdJsmXfru8ldbJB23CfCEmK/fS71sj+KrrNxCQ?=
 =?us-ascii?Q?gv740nsIV5EmAX4V4CU3TSzRYOzvdTMtDZjj0IqWeZL1yE4djnDJArnAgMyo?=
 =?us-ascii?Q?seIqUJjKnc658DeCfm3sGK/GZnJU3zNOfvPsS0NRdBZlGUn1si8WWOFwzskb?=
 =?us-ascii?Q?icQbpvZPEd1QhVLlKAkOLKgiQC7DltBo0qnTxAgQRo+lZo/S6FaoCdjaDgcJ?=
 =?us-ascii?Q?0dsv/D5jVike+ujoppn3/9PYvit4n283svk222gP7o4zaBRoM2af7FH1naSU?=
 =?us-ascii?Q?h/1S1/BGlFmiTaPFcQrjDbEVI/65FfGN2VUbcIAtHRb+KSkQ+Spokr1SEiEP?=
 =?us-ascii?Q?Nh9wrgSbjyIHqZ017btoseCr/yQ+5yrQx5z2d4agCmW0ZUGEUB5dTmTSRnhw?=
 =?us-ascii?Q?Abtz0uokvI9lRfcFylxZWUM9N0eaTnwskxjSe/BPSysp30uL19DxgJd5T08s?=
 =?us-ascii?Q?eU5nk16DMs9TgjCRq4YqiTzldcRE3orAxYNWFeqgKeghY9PWa8D90ruTcqcI?=
 =?us-ascii?Q?BG9+BnUSMfoDf4w3KkUrPOVRIcUTFvI3YGH5OWETJ+svONFJnJj9MaXm/ISz?=
 =?us-ascii?Q?F6pLzxNTuMU7mw9o3am2+UivBgMX0h3oYklcme5BL/wA4O7yjdFLoqxRdBec?=
 =?us-ascii?Q?jW8178SQGo0Bixg4kb8KkF9QZi+YxL/Vc+mq1Fal0dcgO3xuW717PiKLnfKr?=
 =?us-ascii?Q?c8OIy0Biyd60tdJeeql6sjvHWseL1ifzMoK7hVyqd/3m8eUac0EimrGNs41p?=
 =?us-ascii?Q?jPhsrghq13lM51v6cmc5KDsqLIRN6q9mnGDFivK9lPuoFxrK/2Hv07IQGHn8?=
 =?us-ascii?Q?PM2Zf8ENvmv39JouoNccefijDqP9P29WMS0ypoZ7e46XrdTL2eNpGOH6ccop?=
 =?us-ascii?Q?1FDPUNI/bvnVGw06ektxRkYoCkq4Epa6ysTUZTqZvXZQWwlWOjW+ns2KZ7/5?=
 =?us-ascii?Q?6HwlD//CBUdo3dHebT5DfcBxjABlCz1gM70Xy1HOIb8cLrH7JzpOp4JppABb?=
 =?us-ascii?Q?WMI9MyZ+arj7fHSn1F3YyOYRzqG/933lFHrwktC8WPzscW61KEnjcetXoMnb?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63ce801-21d7-4da6-849e-08daf3d96840
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:40:31.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlbfKSUTntZTJa3v198moGz61AosHvYziJdmYuCa13r0jVTpR2F0FqSKAN+4n97DLTST/5fAqsd+9N5M9CdeDtvhTGeRYAsYnTQ74hXmVvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
X-Proofpoint-ORIG-GUID: cDMC5oWsV4r1E_hmWSx6F8ZJ6Iv8CNtb
X-Proofpoint-GUID: cDMC5oWsV4r1E_hmWSx6F8ZJ6Iv8CNtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_07,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 13:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175739

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, perl-native is missing from DEPENDS for webkitgtk even though
perlnative bbclass is inherited. This happens because the DEPENDS variable is
reassigned right after perlnative class is inherited:

inherit perlnative (DEPENDS += "perl-native")
...
DEPENDS = " \
            ..."

Move the inherit after DEPENDS reassignment in order to make sure
perl-native is explicitly added as a dependency.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.38.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
index e890079dc5..bf2db3c33a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
@@ -17,8 +17,6 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] = "41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a"
 
-inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
-
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
 
@@ -40,6 +38,8 @@ DEPENDS = " \
           gstreamer1.0-plugins-base \
           "
 
+inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
+
 PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-- 
2.38.1


