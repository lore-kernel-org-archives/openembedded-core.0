Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1CFC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 06:57:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.23950.1640588232163798047
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 22:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZJxI6mXZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7995a298c9=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BR6vBkN030095
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 06:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=XE9g1iWEr2R+IzwVikao0QYY9dTaWCVlZ3tUuNRIJnY=;
 b=ZJxI6mXZqGmXdHF4JmjCRvyrrmA5q0AHb9KKVE7ifJmhObUi5RHjBomuS4YOExYrjJvL
 Tfr9NtbUfZX43tW5U0sXfiJwmvi6i+y0USYmIn8jmwAdBLiwB6ohn5mWIfOBake9RsLq
 lDQvWox8kkSqKDPeiCSvPQkf0dxw2g4mXZ+pe+iIS+52Sb3JHrDRUghnlqv80JOY7070
 b6sJuK52FoH/zyrOSvD3ze5zmB2NDax17ERfbbj3qrFfMQZeu4ztPE27PNNmh2QXPWNr
 nsIhkyYLq4rVQvUIPvIkHvvZJDle5LqzZ004DkhKmE4f0txkhQtnvC9C+FovJq3FL3KN eQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d5t9791s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:57:10 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BR6vApi030089
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 06:57:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d5t9791s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 06:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHD+ivFYWMF7K1sCHWtjuxst7WyCWNeTYo7ADOrgvzD17eL8oo+DTBBKQOXyU+qtbf7C56axgh1VxoW8XSfqvTl9TdJXN8XQSG95IOmfbCJ/OyjnBsh229tsQkEBYOOquJNSAVPgSj/NbxX1eY6E6QxfutPx0Pakf8jUbbkKwIyM63YVXha1fu0AiTh4IKq3vId5czUluCU80xuR65TvktxGC0uyHBs9fANI3iC+1TkYtNZIVsYnIr1y72+v6cB7m8Dl7Nn5k84xOtFsqb5YaZrpjF6WcCmm9irW9B7G6m5jcy6m3Dt/emqgfDQI8ezCg2Squx8fMSBcElgp1CbYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE9g1iWEr2R+IzwVikao0QYY9dTaWCVlZ3tUuNRIJnY=;
 b=N26oVzrH12wsHuGpDB4y8QCO4wTvpzS4IA1z57HZcVRF4BuXZQDyvEDs9lUO4gl1XaghJ4VRdAluHDOWXeMRXUcbttlUkfnqybSbewih2ZPApFlbBt0ODRRkNN7xoN4YuqiIbzJVM1h/tvlSPY2+Lkrc62JAKY8mFtM8s3XIf/Dev9jKhCQosg/2w39hUnuSJ+j4c3t7TXAIMMw0dvKX3Jz4AYAwcOgaMapnsQZGMakE1j0O+NuI+jxagmX1qK9t5dLvXiCsN0JhzDOAR/ZHr0j/xw344t6OkwLhO4Tgyu1QRcE7i5phPsew4KjtSco1XdAyBQWPGI5AMfJZ/11Dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 06:57:07 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd%8]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 06:57:07 +0000
From: Yongxin Liu <yongxin.liu@windriver.com>
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] grub2: fix CVE-2021-3981
Date: Mon, 27 Dec 2021 14:54:56 +0800
Message-Id: <20211227065456.614140-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0043.apcprd04.prod.outlook.com
 (2603:1096:202:14::11) To PH0PR11MB5175.namprd11.prod.outlook.com
 (2603:10b6:510:3d::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0064721d-4dea-4eae-12fd-08d9c90618ae
X-MS-TrafficTypeDiagnostic: PH0PR11MB4855:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB4855193C06A26B3FB98916F7E5429@PH0PR11MB4855.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7sK4mbgBZUFaFtG2GOpFTV36L9+RWc73MXBk1FFaBAEF4AcIR2WjAaCQYamzLqkk6UMeRDPH+3SbXBuAwTuWDXoa+m9vExq6BovHn3E56Sz+M57Y5jECJUB/prbIBLqwG90wOoqEIN55YKh8gI2MFE8X8aHYwlrFLxeHHeWpnyneXUwpBKMCDeoGvblVixg66baxgaD4NxgP067ukdMcPWH1CqaVimpdDjRzw+jVzDLy6IOjDsocc1n8dHCTbtV0IybdAqmynF0b4FNVpo4jQJz4fc8Q+iaH5vt/spkf7Fnd2rGpw99lZs9HeMNM5X+e8S5Wm3DvfDo6yeZGzH2k0Z2xFiFPaUUmh4y11iudm0fJVh2rNfqrcO5ZtORsM/KYBLDSCt6fUoMtpX5igzZ2K3sIz+D2RQVn4hWhbbQkKbtmgPwsVY1bOQqjZ8dSZIR0XYWzSbv7iWYyaVCdhEIVVejYJy8Q5I+Ji/u/5R5WFh3gTgdXZQ37H/imonpPTdgZXYATriatD9JcZJ0BSTFzqhwQD6EH1/hjAieteDMeEUF2J/EcWukY3ZKgk04ANQEXk+u4x1PEXYIE2yAqfbtVvIl+6LCVwHMITYcKKVbuiON5LgaeyQqizLhBtFuCGI+Eqyq7XVBAW5w6ZYdGYZ3f0lwBu5hjiLxmllwBo7s8kDihhg2hhER9iU3NSKdZPwVjNdZ0/mcR7m46xyCNrADOVPWdftm3LWJJkmmhXNl5Lzc5brrjt4IUBQy3j7S1iSNARSnrOMDhTfHbR5c21Boy9tOP3l+cBE41dShdKlrtWWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(6486002)(66556008)(86362001)(8676002)(66476007)(508600001)(6666004)(66946007)(6512007)(8936002)(44832011)(2906002)(316002)(83380400001)(36756003)(6506007)(1076003)(5660300002)(186003)(26005)(38100700002)(38350700002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EKFGbLhUW/62CKWSLVz6sXnt5tdVU5ujMLoxb26eteV1BOohbciFnBJ1b9d5?=
 =?us-ascii?Q?abXJpet0KsL0NwKY/U9nEKoeS0cdWPFlL5MeKgXRwlUbvYRzu4yAnOp0BB7R?=
 =?us-ascii?Q?JtvMmbgAYLWnYoSxr8AKyT0bgmoQ9oxHPT/Uizg60AhX4MtUAlBPFCsOkQP0?=
 =?us-ascii?Q?ocX6K7ccFEnbZ1ipdzb2K1CF6F1GA4xE0aCqatr5M6R482P/abVF//kwX/K1?=
 =?us-ascii?Q?QIePujjCu69zLtJJsBIjwTJc1WAURssEdP7SA6ULrXB0PwwPsss3uMugjBDZ?=
 =?us-ascii?Q?3DlnnTqmoVXa7IhlOajrOGpXuwLVfn1XlLLKB6KzMEq61GfPbArsT9vBUeG5?=
 =?us-ascii?Q?7UN3WaGs0YJ0gNnKsylJBw6ccBB4Ujo6KT4mli5b/y8L3imK2I06FhaXjk2q?=
 =?us-ascii?Q?C0llBvBOamMc7USPSi0MfjhIz4DvfKO8FZ2XsrkvH62/R85DjZaN1KczgqlE?=
 =?us-ascii?Q?+twPOIN4XgvPMp9wvUmtuVomqsu2FIXuU1RprkwVq6scLFzVpHeBcBG5BHvZ?=
 =?us-ascii?Q?uuadd7JU7KRpSiy8nqazQIj6ms0nXEx1YTfIcw5zir7EYyGlClUNXuHbSO6V?=
 =?us-ascii?Q?k6oEtW/uGlYqeTj9QyUfTEWAENCcV0AwOilHOtCDbJCpjGUJGhV9/74prNGU?=
 =?us-ascii?Q?ZJwwsFZNQOJhq32Cfzyk2jSXP8GmDe+KWHDqtwFJ+varTJ6MI55EtRR6A6aQ?=
 =?us-ascii?Q?Zq4HbvBEFHRDp0NA9Wtb9ABT/1NxU6XUZVDklJCghudZNNtccDVAHNcELT+c?=
 =?us-ascii?Q?muTdzs/GM5qIokujXAS5jwopcVLBUgep9m4hmzZSqbSEufu6gpmgWqR6u1fK?=
 =?us-ascii?Q?VVEJK2WG0TqSB0fGt5vsXp+xs9YFsinF8sjr6jmT/uM2vgp8lmbO0TazYS+W?=
 =?us-ascii?Q?5QLKuiEmOkIt+lWc2ARnFID1jnAr9asjJC5EdWcwFPu2zy2HAsG3qBZU39xy?=
 =?us-ascii?Q?r2wTpSmHPXIfmftd0duGWLWMSC/L7nbHRmCtjfEBnBVmMHhN7bRJaeR4L3ic?=
 =?us-ascii?Q?aVZPA6pRskR71TWYeanVfTY3+tl8WJ8RSDvdv2hZ55w2qwe4WdKjPETqpCkP?=
 =?us-ascii?Q?VzBA10MxMW+6eJfLslbBt0ORe9VMtfTJo4+Up513KfYdaPepF66DO/6XFORJ?=
 =?us-ascii?Q?wn+CqpG71KaHRcgmqS8vVmkSf0h8exzEatbmOOjar5Vy6OssE6QoMHeFa9a5?=
 =?us-ascii?Q?ZNklncyXuL0tR0IAFuX99r+a3ZIT+g/DKddIhlOHLqfi0cOMnkRchTyQ4CJk?=
 =?us-ascii?Q?m/avN5yWnriLOykCTsVRoGQVnMA+6DrHGW8cu9BytG4Rm8jijFZy1sDzV7WK?=
 =?us-ascii?Q?/L1aa5DR58RvacJ2FSMSzGaol+N19hnV1KKLOyCkKcBDVuvlwLBkt8J8a1ct?=
 =?us-ascii?Q?u1JvUGYP5haXlT/UGEjvZuC5vT6WhMGDCfL/w8ldRkvOlYWeAjo0oqckMqaL?=
 =?us-ascii?Q?y5I3XFoHej4VKa5WK6INw6dx8T9tcoFJBAr0ugQ2vsQgI6GTZSBujsoP9iMP?=
 =?us-ascii?Q?V5bZ3LEi6y7WbAUkgjaP7zg1u+qvBMJ+1x6YNJGEzC1c/oY2qtwDI2iIlh/3?=
 =?us-ascii?Q?ywyHtk0sq2rPn/aTkvwod6pLYpq+NB10kLdJHHavS08QZ29yZjYiSCCj2u2E?=
 =?us-ascii?Q?GlkhbeLe+RmBONyCKSwu06cRKhwVkfg5AwSfpoGz/qEZdSbNUSSkXmdPZJJB?=
 =?us-ascii?Q?o724uw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0064721d-4dea-4eae-12fd-08d9c90618ae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 06:57:07.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /+R2u8OuaT+Cms8sl/8hKa6PtkpxZ9uVjm+cAxvc5zPesFbdDkv/h5YrQeJpV4OYaBQCuDJ4KLnD1SDHOUk8/R4lBFPPGk6aVnByyXKWVO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
X-Proofpoint-GUID: 6_nWIOPhwpcFMCL2c00hzPYjG8jLGuNS
X-Proofpoint-ORIG-GUID: e_AVksObTSWUuRAJ-7kBrq_U44wu1orC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_01,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 06:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160016

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 ...onfig-Restore-umask-for-the-grub.cfg.patch | 49 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch b/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
new file mode 100644
index 0000000000..dae26fd8bb
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
@@ -0,0 +1,49 @@
+From 0adec29674561034771c13e446069b41ef41e4d4 Mon Sep 17 00:00:00 2001
+From: Michael Chang <mchang@suse.com>
+Date: Fri, 3 Dec 2021 16:13:28 +0800
+Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg
+
+The commit ab2e53c8a (grub-mkconfig: Honor a symlink when generating
+configuration by grub-mkconfig) has inadvertently discarded umask for
+creating grub.cfg in the process of running grub-mkconfig. The resulting
+wrong permission (0644) would allow unprivileged users to read GRUB
+configuration file content. This presents a low confidentiality risk
+as grub.cfg may contain non-secured plain-text passwords.
+
+This patch restores the missing umask and sets the creation file mode
+to 0600 preventing unprivileged access.
+
+Fixes: CVE-2021-3981
+
+Signed-off-by: Michael Chang <mchang@suse.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3981
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0adec29674561034771c13e446069b41ef41e4d4
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ util/grub-mkconfig.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index c3ea7612e..62335d027 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -301,7 +301,10 @@ and /etc/grub.d/* files or please file a bug report with
+     exit 1
+   else
+     # none of the children aborted with error, install the new grub.cfg
++    oldumask=$(umask)
++    umask 077
+     cat ${grub_cfg}.new > ${grub_cfg}
++    umask $oldumask
+     rm -f ${grub_cfg}.new
+   fi
+ fi
+-- 
+2.31.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bb791347dc..a72a562c5a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://determinism.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
+           file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.31.1


