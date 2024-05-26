Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570BAC25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 04:44:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.743.1716698648542918206
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 21:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=587657352c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44Q4S36U002118
	for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 21:44:08 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfgg8g3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 21:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO1ZCHtp+C5eTDoWTZD7kddf+Lxvni5YjXEpZ+BM2jUPkfz7KJbb+LyQ8/vjYuVL8KYHiPJcqOpF5Zm7/y8vmoRwd7JAG+TiUpSr9lgsfIEYZhLtFhE9h9PPW8Wvrbaz9F2U8df4+6IpeUGYPP9Uaf/Q/nFWyDIF3tqHjEWsZ+b1ftWNPKk2+16G1d7VTLYzCatBoFixfMmGkW95ybZXOupqdwaIbphlFbCl/RjIeye/os1n5mr0y0d1nlveizp5mZ81LkUaJUK1PnReqgBhRyagWaaJmmV4e/K7YLhvaQ/6dFSgPQN4qjpVKn3hKCWP5g0D9iDLZR5ibioJo1RLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg9zwrJA0/clTf/C/0cjKF+2/7zGbkS2lOqN0HYjMXc=;
 b=Fq1ZtpFwWy4MNj+n6J5Sdw+VImaaIYVr2rlqNMFA5l8y8T5zMPFmaDTcGR2rT12Pi/YXpHo6zJTpfK6bILNXxAYJBT/CeLFxf3W4p5XtjKwcMmhA8QltZo/RQ1sul2JGO1OUX59fF37VQzoo7VCEkTXqCeMbyhIGNQU6IeEcI8rpny6s8j8r7V6MtvqAlFT8EMYu7uiDkeG6ANhd2Fmii04S2QmO4uafG/mDNp0IDSk1nIeMKEbpRJx2fWx7e6N/Wh6XzLCH7B6ULt/Z+MbKgYcTqUGYxoIpMJptAnvUxCglSsY2Xd/HsszEYVDKoOz4EC4Nn/YzfTy904dRM6LBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sun, 26 May
 2024 04:44:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 04:44:03 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] kmod: upgrade from 31 to 32
Date: Sun, 26 May 2024 12:43:48 +0800
Message-Id: <20240526044348.2560823-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:404:a::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c70eb31-30de-4d90-23e0-08dc7d3e77c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OvfbINeuBNLbQquRz039LnKWB34PFxqcT/I5ZQwlbpFv3y5JDvAQsvJHnZT8?=
 =?us-ascii?Q?wZNOeL53hU/s6ZbCk8nWG5jWbt1dnUkPz/aH7h3PTerMZVJ5AqtXy9Y3O8Ce?=
 =?us-ascii?Q?/d283WZ1qB40EKofZy0lqfmdFgiqDF6o3LmZh6T5CAnYH22l9W85kEMsQn7h?=
 =?us-ascii?Q?ZLnRrTmx1Se4rI/SyK4ailMSEX3KEV/byX0IBHMSpEf320n/w9lN6PpdY1Qb?=
 =?us-ascii?Q?6ikXLnys+KfmzNSCxkyS9znUoCz7B/Fg37EC6kVbPCFTMeUUx5S18yr3Rq01?=
 =?us-ascii?Q?5Kp+54TAoBuoWHjKZvWGjXdBtOUJRvDqAyCSlCG9GF5PSvEYfF26Aoo3BmDg?=
 =?us-ascii?Q?WCNv18Em+9bU0bXSHvZywlvuXunLqecfsM4a/h2CrAzGuo0eFfVLtLSBjsUi?=
 =?us-ascii?Q?1/uPWedrQ4ed8hjfrSmWqcm8/WaAIeS4Kqb+lKrOf6NoLp3NDKxn43Hx46qw?=
 =?us-ascii?Q?NFWnNw/9BmlC4FA4QxkHjJfNWYIYSZeIAZo3u4ID8o/fCErAPYgad1gJziBQ?=
 =?us-ascii?Q?z0txANt0jAuPNfDb9BA8ttlIpJ+778zNNaqg4P7gRNRVM54pyBhhRy5GX5O/?=
 =?us-ascii?Q?lgiqj8P2L+N3VacRDTA+xV1rjCOQNjELjp61qMqCjRLH2N33k5DVWIm0xVNX?=
 =?us-ascii?Q?Wau8/3uw3NKElg8eqYyaAT1S3ZQW+gqLn6FZE6z3aNQyXeCKZFaCO9N/r8Mr?=
 =?us-ascii?Q?lLrjmmnF2uKzGcqF2QgD8GmObQ/UbrAr5cESwsg2mOPhYq87/WIvoACPQhte?=
 =?us-ascii?Q?VPxRUXkzkTGJPvW16nnsppRCXBoxTMqBzURHDR9CKX53ekyZzSpmGF9jjz5n?=
 =?us-ascii?Q?NG1LFbLB8M4+Qt1YcXDlOpTteIhYQ7Xn6H1z4kthvnooqP3ip1whGkCD9Tz1?=
 =?us-ascii?Q?5/sxM+XlxGPdjkathzG1QQtD8ibUyP21WKzfHql1T/1SirgLgrYFR37Ksbz4?=
 =?us-ascii?Q?9NnUqlSAilK4kqfqRefikd7HoQuydQL2B6cr4zUKmIVShJDT2SZf4O43UVwF?=
 =?us-ascii?Q?DRs+kZJrQFYmmneeN3fKgeOBIrIei0Af6tJ3JHJ2QJHkf3Yf4NBNZwyfULcO?=
 =?us-ascii?Q?7Da4AIreHeup55kWlOxazAPSpXykBSr7ci0rbuRYblOc6IgouSghzMd1cald?=
 =?us-ascii?Q?cU/q23u1IuQ0klSivPW4/N1TEZ7w3OTjayTNHDLX9t+7wX4mSTdixNhrRIqe?=
 =?us-ascii?Q?ERzYLjIXReYRUJGL4VooKH1Sg70sxexRM9p5InIC9X3O4UKwouvOUPstVors?=
 =?us-ascii?Q?Rm8z8/oopXkUBhuMmL0meXtxfHZ8kH6B32jRITD73g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oh57FnxdJyVya6U7AfY/hmpSMIPZyVAk93cxQ8eUeHjejVjIexqkD7Hkizca?=
 =?us-ascii?Q?xUEgpQXhDz1pTOrmeiddIovrqcPKH7lptwU/RnTWKlVGGO+NQ/lC5wRiCE78?=
 =?us-ascii?Q?3RrQxBrTtX4lr93Oin1HwOwaaqFJOvlSySMxRCbs7JyU4rRjeUC+RvyO+k2W?=
 =?us-ascii?Q?hfWxeMeCsG/Lj2JJPSsQt5DLVkQfe/PLdNI1aHhBKXGNw0tii8dtU7/qlhcK?=
 =?us-ascii?Q?nlXxL0uMrnSCRrDpsBoPxbnq3HvCyCGGQz2FZbAPYXHqvqpBfdOxkR5hwQrG?=
 =?us-ascii?Q?hiji61R3l5UNs6Xt9Q7pHYTW4fQOdqfMoUPqswlQ0AdZCA9sqBO3Sie5Dj9H?=
 =?us-ascii?Q?9PqJco3PmQXMsX+BIGrNpkpTYONSJKNF2XhUZLnptCQ+mQ+CeM43m6i6S1b4?=
 =?us-ascii?Q?fcPpW0Q/uwNBrIi9XGw+CMOlrn7gQsKJQ+29k1cO4V1U/ypX7BqM1kRcCnIS?=
 =?us-ascii?Q?lfVq5klBL7n27RC+YtCMO3fgG6eyvARffY0nKzFHyBWkGgqTbV6e4wjRaewv?=
 =?us-ascii?Q?L6dAZ6Jc3UwHeDFu6B74ELtnP8uA2YmMpZFKSj60zpaXxyFicIOX9mLyEzg+?=
 =?us-ascii?Q?1GBLwb6fIKWVXtNYM99Adc1DNUGCdZS/00opE7XDk8o2wCQ9o4VnQOcVlsMg?=
 =?us-ascii?Q?7NnvHuW+IXnmRTsBdH724tnJZB/tBpntv3DdHPZpqIehz/7JnU55WbW5Azv8?=
 =?us-ascii?Q?rlCICrzsdS0mZacEQHSBOi0y+rnj4CSYu/uRP10forFjhT81MizDwCkf2tZ3?=
 =?us-ascii?Q?x44AcoXEBOZGPq7OmtSgBgd5uWY3E6pdhytLrv9YyVqGWQOgxy61OIyqYBrv?=
 =?us-ascii?Q?CVEMEBzc5I2HCyIUnF+4hK0ZKyow93/d14ijZg/aQ9YixJfR1y12lVoLVPrb?=
 =?us-ascii?Q?aCy+RvK+lYHkTG9+i4K70ZBnUy6FE29PxqKzPyx3B0GdSg7wwnnt4tkqtqHr?=
 =?us-ascii?Q?3VwDuTtcnM1ZsDv/0XeyRkZVAhR+md0N7GjWbG8Am25FOOBdrPWgLLBBn3sS?=
 =?us-ascii?Q?VmKm760fslH16arvxkMEGPS09P0b6bPm52uuzyOguxsjTX347neOdajafjop?=
 =?us-ascii?Q?9GjHPcEEt7huHk1nH4ReB4zATT7bIy3y6aBMJhhPC8ArSqN9SEO5X52aPwD4?=
 =?us-ascii?Q?1HeGjWmqkFWp8ovYNZ+wNCT2qC1S3PSBNithT/diY1hfgw5BC2vL1n6TbdIy?=
 =?us-ascii?Q?PxEoXIqXL3JSrYfITQKjxZOtGQDdAuFU3/f/GqycKYCCjgsog6M99smPBrqc?=
 =?us-ascii?Q?M+agMcTxCdVeGZfXwVC9iCbq5YT/CT9FOyL+p+GG16pv6Z9pZRvm/kQVnEY2?=
 =?us-ascii?Q?juIeysS5Y8iQLgtNsvWEEJvP6lwFDTsEnc996znThGW7hPcoNSxu5B4/TMfG?=
 =?us-ascii?Q?iju1KpUqHYvkRSaCWMZW7bfBzVzyvNFKu1IgbvlpAEF1FYWt+/kaM7eV2uly?=
 =?us-ascii?Q?fqluDtYgNa9MJIamniCw7IxXqPPxO0P4ZL0IcMcJIVMtpf/PAauZkGSCbyW7?=
 =?us-ascii?Q?pISwTADxbIoXmSD3rH3IDVbRBiQM4662Feh5LovBlyto1HFcmdJomCOOdO7Y?=
 =?us-ascii?Q?ou/1Y///egEQAzYXujy7BJ0dhwlZ/UTaU4OwG66b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c70eb31-30de-4d90-23e0-08dc7d3e77c5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2024 04:44:03.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CruIzBNqn4tdB2SUlnCg4H4kPaFnM7FKQgr8yhd91Xf1RBEcwZjbhDCufdtqYZMBWLpQgemEknxCscOQFWy/Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
X-Proofpoint-GUID: Ol9AuV8H2M2DmFPZ5BAt4j3mijayLgYC
X-Proofpoint-ORIG-GUID: Ol9AuV8H2M2DmFPZ5BAt4j3mijayLgYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_02,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=827 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405260037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 04:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199877

From: Chen Qi <Qi.Chen@windriver.com>

kmod now installs symlinks in 'make install'.
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?
id=e98cef6f3f8cd6f8bfb26d147b2c209297453cca

Changes are made in do_install to ensure that we can to continue to
use sbin. This is because our kernel has: CONFIG_MODPROBE_PATH='/sbin/modprobe'.
We'll need to sync our kmod path settings with our kernel config. Otherwise,
things would fail. For example, libnl's some ptest cases fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb} (95%)

diff --git a/meta/recipes-kernel/kmod/kmod_31.bb b/meta/recipes-kernel/kmod/kmod_32.bb
similarity index 95%
rename from meta/recipes-kernel/kmod/kmod_31.bb
rename to meta/recipes-kernel/kmod/kmod_32.bb
index 718a5565b4..1c4e5a94db 100644
--- a/meta/recipes-kernel/kmod/kmod_31.bb
+++ b/meta/recipes-kernel/kmod/kmod_32.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "aff617ea871d0568cc491bd116c0be1e857463bb"
+SRCREV = "41faa59711742c1476d59985011ee0f27ed91d30"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
@@ -52,8 +52,9 @@ do_install:append () {
         install -dm755 ${D}${base_bindir}
         install -dm755 ${D}${base_sbindir}
         # add symlinks to kmod
-        ln -rs ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
+        [ -e ${D}${base_bindir}/lsmod ] || ln -rs ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
         for tool in insmod rmmod depmod modinfo modprobe; do
+                rm -f ${D}${base_bindir}/${tool}
                 ln -rs ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
         done
         # configuration directories
-- 
2.34.1


