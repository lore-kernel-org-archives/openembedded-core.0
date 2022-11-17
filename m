Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A03C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 09:53:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11835.1668678777116917329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 01:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83202e5e84=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH9K3tM020172
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 09:52:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1g7rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 09:52:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0/vGkjK9klHqGPjXIBigvb0Qr7v8vyFza3B9xo/azF6kYwMuYDIIULFtd0kMYVW7UmIDwRyN3Kllk68hmWMA1cVryRPGuUY6SMsIIoGorOWrCuIu3Fmf/VlyVz3K91E08RdVuBfrKuJzHWiayImxUDYRI0T84JmSIcKmbhFrmKtnK9hCw2VzIi2JJ2mbo92yCVhzQpj2LkZOKaGvyvh1iS0ArKxvjqB6JtM8tt9pfQRk8NvprlbNtaLul3D8XhDCUzLvtlHRnbz/VWq1mgA4NxDOHymVtRGg4g737DPoVcgm/jPZeJSU7Ywe9TlPqQbZ5MalkAeh7G/uNwDPH4Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqbJ4wrDxJfDAhxa3+984Gql4ZAAD/S5oYPOVM2KIEA=;
 b=YkCQ433tTi8+gfY9z/oLGZTgBp9OKNal/tjSSbTp+jARymh+Z8cq6pttgDnZTSMadoo6YhzLVQ7aUOhNxOfpNS2lIOPfrMWTK4OqNQGfneegdm47WPKI72n8DFE4bK6UEnQ2Ibdh2rCFWdrpxqAt+JdHbGGZ0jRFG+ctTF++by3oPdZ/pljE8vpEJJ0y4Saq+xBSycu9pJlymld6FabW0nXnVYYXLfoiHe3r9zXdqBA6lVTrAKr56QgQVh43Vcm82n8GBMYhPbioGJvhBrybieYAx6D/vhKUrXChiSOELTxLINtYfwmu5ub2x/LHEG9GhnK6cVQXiqeSdLeh88dJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 09:52:53 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 09:52:53 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] sudo: upgrade 1.9.10 -> sudo 1.9.12p1
Date: Thu, 17 Nov 2022 17:52:36 +0800
Message-Id: <20221117095236.2423969-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0013.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::9) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f6cd34-ac4f-46be-9662-08dac8817edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aLlJGSvez2x7w96VwwFEJO7jP9vtE3D+b4uclTtmuZALbagfefxRDq/P3hm3d/PrlMtzE+WQDiwoUUmNTCHg+LUlbKtyNwvUVdEfYiPMG2J7DPolImxFkrVcZ3IVbzTpdn+kSxon3xGhgs1LutMZLpfdhI/JObOtW9TVSO6MiqsGpcZ4agLGyc+e8u88sU2C7oLxsFdsgUKmN9EJ8jaxNcf7pR4840EsLIstpyXUc086J54g1bMYW4PHqVGexTkeq1Wd63hywA3llzlyPGE0rfX/s4bhRrKOibMauDXZ+6yy3Tp46RcG03pUawS9E6rDdG9hA27Ogx+I8QETAYlNlRJPwXfAUHMdCNTWENt2EzhmgvFx3G5SCSQNYWthw26ga6zi87wDV7YinVc8b91PE5Ko7JBmUv45Y8feSSt7RSSpwFRaJp6OxVpA+XLG41FI1ILJX60eKt6ESYefYDGCwBhYyjbVyBCWSzpOU41h3bQRYkPteQ8s0rL2OQNMFFG+nDDSfikvaBiDDV2xtuVa6Z31JREE/ojqNSi7KkogYm3VXtnwHR2XLVwE0RJEF7mwW2Zjz3qm6CnbrK4MWfz3gTEXuucwc6UKxrglH6PU5mqGDZXw7xaKq/nkNFjJ7/Vcp4z3zx6Ql/J3bYkNfuZ8TkEFa8FLicUFkgQDnP3fgBDxmQF7QwggXdM3/pkFVOD+DrvuboHHWL5E16lZrpiUOzpxVsqSjN9XBtrKf3wjuBk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(451199015)(6666004)(6506007)(6512007)(26005)(316002)(6916009)(6486002)(478600001)(38350700002)(38100700002)(2616005)(1076003)(186003)(52116002)(83380400001)(83170400001)(8936002)(44832011)(2906002)(8676002)(41300700001)(66476007)(66556008)(66946007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aYOf1pdNVJVi4juQ3MM53D7PfWpcuYRZMVjzxKF0qT6h+tQe3gexUUFr8xle?=
 =?us-ascii?Q?hl9TF17pJwAXNuqFYYudW0wa0DFHC771hNt1GSmJQ4FVLfOYW4UN/S28jh4k?=
 =?us-ascii?Q?GA/1IQYlrh5bkPelXWOfS5muwMKeMRWE+iE9nNvGoJAImsKXBdektQysQ+oK?=
 =?us-ascii?Q?RYKVZ8Xllddlk+zVot7oMZqp1NWUXbhgL70G658n5x9QmzBVcizHcqGmOdZH?=
 =?us-ascii?Q?gXJY52Yclr8MWbHIqFGoAX9oWb10ONBB5kZSgZTEpiaYQ5pB5Ezp3iVOIRTJ?=
 =?us-ascii?Q?YpdDK/igr90Q47hk580upEnZCtw9xt+yJ+uNuvBmKHUmVs1X0P1r6K0JTkdW?=
 =?us-ascii?Q?3IE9takCrlZQipbsyM3z8AM4AG7xM7zg6g2nLaiq0XPWPFsbGyVYQazsSQn5?=
 =?us-ascii?Q?N7GxS/nZUqsasg2Zs18Ks4/h/vnLEUXF3glllM/Brd58FGcnalQlGu3uIaBg?=
 =?us-ascii?Q?uTrYGCf/acg1JmLUH8Msz5m2EdXbxOVdXqTCkpBVL3yHpC1DRRw8GO2UEq2+?=
 =?us-ascii?Q?jqGSuhNE0EXIYzRJzkFt/yxR2tKDeWu0z58ElDEayzWnJXXWhMxUhkfeCAm0?=
 =?us-ascii?Q?IM/mdtMWzABLlN+vmW2+ocn3O/DWREEAvCVwv5GUm7mHwczWegvOlVy578to?=
 =?us-ascii?Q?v8JbnVuSvZmjA4tSuk0veTBPDdup2pIsve9ZqJi/Vkw90TwOh2VmzygThWoX?=
 =?us-ascii?Q?nKqvGR81QzARyNY17AQ66cm0t9mTmYpZMAsi+bBeSTukK4ZVnvuRs1ooa8ym?=
 =?us-ascii?Q?EXQx8r8o2DZmkGsS3mmXGvAcsKNxiOUjA1yDf9V2BKaRu9t/RqcOaa/T2Pvw?=
 =?us-ascii?Q?LZDz4dJoBxpORs/mAX5RsDeAY1Kc3p0wsxefOvDBLcEFkvrLr21d2MoIbq81?=
 =?us-ascii?Q?v0kCvAVPXWNBL8wMLHwXN5jHpKXedM0mtkoZw5zhr/7Pa2pTHTbIFt2TvBXS?=
 =?us-ascii?Q?GvZhFT6owg/8qJZESIiv0cOuP5ckeEXNg663xfe8zkJJAxbVG2eh9pyI7585?=
 =?us-ascii?Q?tSj96Zdxf+m3MUBchdHVgDp8ZyK9+VOM6BQMU+T5tUSV+8cu8euVlNXEVcyJ?=
 =?us-ascii?Q?kYhUWwisMF72dt5JOP3ocjaIhDdH9uvaxYHYa45tnveAV6BU1oltaHyRzsqA?=
 =?us-ascii?Q?gVUGHj/lrO+BCjWYqtRJyv50Zkl5oF8cpdbre9Zoh0ZMg+AjP8HFLWcpKZMz?=
 =?us-ascii?Q?vhkrZq3zskC0xn7bQ0MNsvG58Bb2q1tSspSQa8TYhNnzcctvrf3PsJ/2tNMh?=
 =?us-ascii?Q?NCD5x7VV9YM7GEnZnpyO2yfWYsbi0ZZYHvs07AXw9ajK5hY7gjZIFtBxZ0gN?=
 =?us-ascii?Q?piJtGSuo7osMcZE0yTxt0HzDCgiTkItFWvcNEBBJk4gPBAXeZ4sn8XxFEP/5?=
 =?us-ascii?Q?fyaB9XG4Raonh+bfpP10/9cgH7uPVPcRDM6Z94V/Q0Vas73u+aVIzgXQ9Zlr?=
 =?us-ascii?Q?+bzN3wbYBt24fHNKJQJLfdVc4F4GFVtJCY4Ry4yVmzsMy5ReJS9VODjmWTvb?=
 =?us-ascii?Q?oOvZe727WRfrAdCj9H8s1Cgs2tfwk2Zj1i1aofwE2jxECrMwzT7BYDtJoWS9?=
 =?us-ascii?Q?7qQTtnrbJPAA5ZwxFd+kUcklo5d2n0LfkH6pLFRuVjHm5eiFtK7rOm6rliNx?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f6cd34-ac4f-46be-9662-08dac8817edc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:52:53.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Yey/Rmsuaday1mDT6arJ3BpOUay/RsnbrYiVQkKKGvtGy/gKn3k/R7BXn6m0ZjadowQS5hJ/jMOxZyA95SZbywO8pnx6cEd321WLqm83v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-GUID: dNQW9tOP8w9mIk-gsfFZK5UGQaS4Toru
X-Proofpoint-ORIG-GUID: dNQW9tOP8w9mIk-gsfFZK5UGQaS4Toru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=665 phishscore=4
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 09:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173409

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

---
 meta/recipes-extended/sudo/sudo.inc                             | 2 +-
 meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 8947c46129..fd5bbf103d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=16cf60b466f3a0606427a7b624a3a670 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.10.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p1.bb
index aa0d814ed7..1495b67b8b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
+SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


