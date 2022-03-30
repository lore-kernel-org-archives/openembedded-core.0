Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D695C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 03:09:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3029.1648609751204600620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 20:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ho87L1yk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1088c18fe3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22U38p74016585
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 03:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=v4EXZcvugoFFkL30bfAUJ76/9qUJdr9iSv/pEZH+MR0=;
 b=ho87L1ykxeKZK3xcf27M1mDXrF4aYWMkEs1mdtG04mN8u1R8uWEaEikL/YmPpjBynARN
 0UP8MP5lsSj7Bzm8TeL+kf7yP+pV+viBuh2afdDArC8DcQHHZ8xyajTGHP6nnNEW+azx
 XJBrQsnzFrFPHuVb3KwCKxlXG1/zUqVNOaz1GdfbSEAcQMqFcKPmBMITnCnzaZ61mDWl
 XlrWAQof/xe014SKQAsWZbaEjrtb6V3vyJ6MB1hmqD6Nap0zLEFP1F2nHfx+9nDfn2sG
 221TUCcZYtxtAE+ok+cmyDxdH3z9VAZmfF9xH2bOpVuXlc2M7MR5+GO+0VDWZgMU0LXX gQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r2135kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 03:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ7+3K/nMj0tEa/wUB3AJpI6BoAp6Gvb+oT/ai6ee+kYscILMiHaR2XzQdTnmtQOVeZHf0IK7j33eeo/nNw1CX15KYh+ujykRjEgAYOp2zL89+44ITReMfbpTT87pxVHgS1kX5HvYx3vyWurJEbGWenP7i0BTn7JrI8mxpoobdKAXxVME4RLc//z1tWgBXBTCX3o3tviWjFbCYPUDpd320JiFhsk9BYQXk2IQ93f3oEg5QFBs5QYbPWFrNbSohpfJqFlrD8JkogK0fGOObpJfgd25VHgexwGRj/Qk8anYpy7Ixy7vmnelhhlK6s0Aybipebe5mGzCtPXN8rDgtXW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4EXZcvugoFFkL30bfAUJ76/9qUJdr9iSv/pEZH+MR0=;
 b=mycU/wVLWQVa0HWI2a2CA8FPpcLAbIdpYuzSfp4YqxM9GfoGN7jLn9g+YoasU6LyL1odu6GX4pGEaZJ8ucAz6QqMEoRd2CyDFskDgltxdGDbTGhNKKQA9kjO+ZEJbfUWCaQFX4gc/DGilpc25i2WqsV74XlU476bCJfF7+8B3IAPrHd41+JiTEt0PHQkcbvF+Fra7cEikeChmB0ycgY4E1Z6rflIdX5YaRsGioPD7tFPMfvicwwuTboYqb/H2qaQ7276AUdQrJWSbQP4kqzjfZR9EY/1BH2q1N6ijh7Y/GL7oknUt75zJf5Saj5F9W7xnFmH2wIQWc2p73JaptuLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.17; Wed, 30 Mar
 2022 03:09:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 03:09:06 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gobject-introspection: fix default search path for
 girdir
Date: Tue, 29 Mar 2022 20:08:45 -0700
Message-Id: <20220330030845.98674-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0019.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d5412f-c830-4415-c738-08da11faa631
X-MS-TrafficTypeDiagnostic: PH0PR11MB5174:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5174826C09818FFE87A0FDA0ED1F9@PH0PR11MB5174.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	maRyAU2p3G1VbqfVycPD45GZ7iboQp5vYczcIThADGh3UNZM85cGW+2NifVIGgTj2blLaEzgBR1qjn2oppgsKmxZNVKuUH70QvU4ClFzCx38n4vkRfOP1lalKLyF1LReTyHp1I2sFIKDFz1JhdZQmHrJjSg98pgpfeJ9myyNCCqx4jx4B0FPC5tj7rljxO4V6OAHxv+VOgS3ZrcylRlMkwG8u/9eqVwHAZ7xEWI8WQ+DtTjxDnObTxhGt9bXKB9LX4w7So6U+xZigvFad0H1sib8pFOme6fC0lhcWh7bCqTb7sb2h4fziJnGSBmHi4VbzDcfi11yQWE8KZZTh3Lq8TKmV5++CMHwlpBUKAcbGAG37AZA/a+i3heDrIXRlQ2AQ11FAbXLHX65vOY1eF6G2IrWnQbkccvo/7CUANfM7BgKTV2v85i57sHVJR3rVGcqbtgOACcE7sn7VMJd3YWuFHCJkVbfVJj8ehKVFN80CJAfWD/GsJNukgXZUckO4SZqEsJERp3lm516WD67ugsOQxe8w5EJMtsk0lelH2leLmtWJqECtCuuZgH2iWnt8irCOfr6wQgYm3Fa0V0DncNRtjRgpXUuJHsdKq7NdczrahqYWalYCAfWb4QbqrwnjvzA0zSAS5RIAjYNhG7kCQrqH961E5mm6myLAIhN24FVt1AKL9FUoV9Ow103Z0oxq/DlNnuwGZi3PrregYImb1hWyequzO1ls4+WTvn/TDA6IWHCk2py5s3rgRSJIHMcLTyGAOh6lSyaP3wfxjm1IAHeWTBAGZ/obx/okwT/mUK+U+U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(66556008)(66476007)(2906002)(5660300002)(86362001)(66946007)(8936002)(8676002)(36756003)(6916009)(316002)(38350700002)(38100700002)(52116002)(6512007)(2616005)(6666004)(6506007)(186003)(1076003)(83380400001)(508600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TbZiqkL9rPfs+CFAS6WsYVWF1/PjO2cWgCRmNogcQUEXBXQ4CR0WWfZK78FG?=
 =?us-ascii?Q?vzF6W9ZcEx7IzXOBgpqmWJBGRAdV/ItF0H6VJcTtpl8JJlicUZjR5AyIbEj4?=
 =?us-ascii?Q?uVWjZISOgeTOE4OiX7XwOCUAt7wIGv8VpYzH7hmrCzLzoKq097Qa5luRxTVS?=
 =?us-ascii?Q?6Z85/8Qy2/9HjmHvEIUg8WPsm63WY199rT39fBv35fewR9DKdSDAkiRxGF3B?=
 =?us-ascii?Q?I3ASdsp8y+dCvmcxIBfYLrPnWyU/Rk68V4LB8gJtjt6yiihzDmaLViugg/5W?=
 =?us-ascii?Q?7V//sqetjt7F8S0sOGrmvspu62/pHT17kPc3M4sJf4uOps1yZd9ORlRiiIeo?=
 =?us-ascii?Q?GSpV6lK90OaGC0vNDmLhBDg5bQwfQ95jgDfOD0P9WsOPi4c+aogtgyDCrOwU?=
 =?us-ascii?Q?Mcw3GUSPu3xuOakSylJ4KXIBTDOKWfamOIhsf2Khiepj7OiKqxtCMnJvanqj?=
 =?us-ascii?Q?gcPszlqeRmz6Tuiq066OrYDoKTKTcOXuTAENB2go98o/wlinI4yu6WLMk88a?=
 =?us-ascii?Q?KH7oX3MpUrMwTnehPMEVBTUp8xfZE4dyfnkeeLVctTlnHLPJhk2Wbg9ixtga?=
 =?us-ascii?Q?b8v+ykZsZ6VqIFZ3G/rAyJDY1hfeKadcwRalZnoOLiM06qf15uDcfpsUKhTY?=
 =?us-ascii?Q?EcWTtr/AgkqVsq6I+w7nhKUrkuNHxZKMrj8IBwIEO+RaKGmocAsQ6Os1c4zm?=
 =?us-ascii?Q?e1/VjGRWwt0e1qdka+kjiIgjTzrjf0UtOqT+OF3f9l4dLSFzY6pRr/2nbNy8?=
 =?us-ascii?Q?VNWGZh03cRvPWECIaCu6eQ7ivgOhHAR9adW4R8INZGuRwuOO03DLWlFSZL+H?=
 =?us-ascii?Q?9dPI6QuLnjShLBes7r9zbR3SQ1vXhuP2DiDAkK6DE0gkfI9QrPU14rUMYj0U?=
 =?us-ascii?Q?b6abSTIj7cpukwaamXDEt9b0tFlSBYNutP7FP68VE8S8/dlhPCVC34PmNwuh?=
 =?us-ascii?Q?2/jJEvhnsQVZGQ/7EnWGpXC40enpnvVIIiipmIAHi+ZgS0X03gIGa+iTLScc?=
 =?us-ascii?Q?zsZasLSBhRh4oe67/qN3m3Qm5WfeBW5DeBkyDl+2rHVl70OWafdnzs9viXB1?=
 =?us-ascii?Q?nbom/IoajS3d28r3r+rIgeLlaZaUst89ED5dMwS9XTDa37ruaSmzQxg52t9w?=
 =?us-ascii?Q?5qqvpuUQtIMyRvpSvZFO9fEiM2Po6QvJkkkFF1BotD3CgjzLmIn1KEebgaR9?=
 =?us-ascii?Q?JvKYS73wmH76InY7eVBuOXnKMoT6FumGdRR0EwMLeZzAN7AFJxfDRbKJ1dmb?=
 =?us-ascii?Q?q4mRf3vUwAjkMhkulz87VGrnkwE/a9VE4fYNWZ9FWif48GQbk95/QX1+ggdP?=
 =?us-ascii?Q?pbX05fHV/FFnuwklnL4ACBxrbzt7HZXDb2qrGL1rOqUITrrgOvSo5U1NTIyV?=
 =?us-ascii?Q?YSabYWGcyFqPyLC7ya45Zg8RUm+8bfK9xXEIGCfzwpZbiaDZfZmp8GmlhuHn?=
 =?us-ascii?Q?0vsm+5P8b4mQU5TYvwd1BPU8ybrSFF0U77itlzrzTWUTKseLq9AHq2y3KpF5?=
 =?us-ascii?Q?NRKA+w931naGV+SmGsW3ymtloF/x0IJKJU+8LAYhS5MWZ0DT3mvJBSLXRh89?=
 =?us-ascii?Q?/uG9kQRl88aGq52ZxEefIfjQTz6gCkyc3icE5FYOHBqAaG17fs/O73Qy5YYQ?=
 =?us-ascii?Q?5CKb6d4RdMmplzjMDFJAkvacWdppAb6KAzRtL7744zkiKjFqzb0huf1ycFZw?=
 =?us-ascii?Q?H7/fAqjmma+VADK7QXtAL1Oz2I1uH4FUQbf5qO9+cUkN3zeIP1RTY1nT/WC9?=
 =?us-ascii?Q?2qe01aw+W8Pm1X4l7ogS08zHIcYZFdw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56d5412f-c830-4415-c738-08da11faa631
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 03:09:06.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +KyeeRyVtR8/AQ79lipDAZU4/bAEh6C7YXhacbRpMvZkNpoqJQdZ9518+Voh77yXdNZM74PU+caJjLpW0xHRuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
X-Proofpoint-ORIG-GUID: eu82F15n4zJoh8se7Oi0xkv6BhkYu_kD
X-Proofpoint-GUID: eu82F15n4zJoh8se7Oi0xkv6BhkYu_kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_10,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=674 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 03:09:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163773

When running g-ir-scanner, we get the following error:

  Couldn't find include 'GObject-2.0.gir' (search path:
  '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0',
  '/usr/share/gir-1.0', '/usr/share/gir-1.0']')

This is because g-ir-tool-template.in is not setting girdir correctly.
It's using the prefix instead of the actual girdir.

Note that we don't get such error at do_rootfs time because the extra
directories are speicified. But we will get such error at runtime when
multilib is enabled.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++++
 .../gobject-introspection_1.72.0.bb           |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
new file mode 100644
index 0000000000..5c78649de4
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
@@ -0,0 +1,33 @@
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 13 Jul 2021 02:05:11 -0700
+Subject: [PATCH] g-ir-tool-template.in: fix girdir path
+
+In case gir_dir_prefix is set, it's possible that g-ir-scanner
+cannot find the .gir files. This is because that the girdir
+is set to gir_dir_prefix, which is wrong. It's not a prefix,
+it the actual gir dir.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/329]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tools/g-ir-tool-template.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
+index 6e98f52e..62c07c31 100755
+--- a/tools/g-ir-tool-template.in
++++ b/tools/g-ir-tool-template.in
+@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] = datadir
+ 
+ # Respect gir_dir_prefix
+ girdir = ''
+-girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@'))
++girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@', 'gir-1.0'))
+ builtins.__dict__['GIRDIR'] = [girdir]
+ 
+ # Again, relative paths first so that the installation prefix is relocatable
+-- 
+2.30.2
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
index 39475daf2e..355e77d107 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27 \
                     "
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
+           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
+           "
 
 SRC_URI[sha256sum] = "02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc"
 
-- 
2.33.0


