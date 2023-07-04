Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3FDEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 07:39:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53706.1688456382328208733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 00:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pE6pqBh0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65495b23ec=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3646e2nR013068
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jul 2023 00:39:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=rXKr7yJMfw/x06V5try7rg/BCh5C9sZxFqZw5eeV6Ic=; b=
	pE6pqBh0+aKxmaJVAXLA+KkJg2agm21izVBV/6gUTbLavcDf9hUnnnobCEA45bbT
	OW6k4mNcGpx4r9Hk+93B6TIiPsdz9UrA341U0/ScAAfl9ACec47RgybiBHXD7ZYE
	+pqMrIcAZvZ8AbPpCBxoQGD+y72IBEFI9hN/+5mlOY4GEv/pdEVEIPC6vQEWQwGY
	6NuPE4/b7D78WcinnwkqKpBzeSyLeP7QdDrYP5McxjFNXzYb8cT5YMhSf/tTeC2l
	wQC1G/zTEDPlxr2P/p1Ea6qAkrdXRUjK2C6GM38PjHnmGvLzItrw+pk/JKcL0htt
	xKoKR9Nd7086Hhs2tqxNOg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rjfdyt1nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 00:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfpoBxZHb9pMvY14A+DzSquAUqN24Z5wW9NyhlpIjZ+xMmzcrWIxV4YwLAGAQUle6PAgZhZKAud9YfHfN5gNxzeD15qdf1EG1uZSs/IY38DSlvZAQUEC3iQtuaeeLYmYUJiL3VtyyOvwiv7NPwl5xNcEw3GEuNUzZ7lsMK2FX36h5WiaMDqejINkuCOQEKav0EfdRqak2ryhSO3JsifHrVgWi+sZRslfM0cmsbMFKQ8Qk9o6E8czkYoFqSQJ+imvGhaBhECfgGw6VhKrCDJ0Un2GbDOPSckWF3o5RrFdyeGh3mr5Y32ztHyGLkW2pn3+U0nvEMtwnaGqN1oFyd9/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXKr7yJMfw/x06V5try7rg/BCh5C9sZxFqZw5eeV6Ic=;
 b=UTceRbZRsPiuLCfFyaZ7Fu5sLhfg9DR2uh/+wdR7ftj4B+wYldrL9z6e8mXFeHisRQQMLYCTR7WTXyJMfel0LgzPvm7CXLhz2DIx/G7nVWcxtAg+poR0cqEFHUPld/qBZjqTS0DbaUV1PZQeTc6QJwqzkG9oCj/ILH/QJulsNg4dVbs8urLmRA5xjpj1TUZInMJOEGdjsRvAwpfwnWFOMhEbM3NjhosAqzap0IwYDteGsxCXTsaJoEm4tQwRik7NFkJgRa19EfFRkVvfW7WbZeIxNtIRGAFwCeOZ5J8DlINLCR7hugpvXamzIv8NCSsLzyDAM0TrZ2nftCJhnyc93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:39:40 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:39:39 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] mdadm: fix segfaults when running ptests
Date: Tue,  4 Jul 2023 10:39:17 +0300
Message-Id: <20230704073919.1593400-3-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
References: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::17) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: de6a24be-770e-47f9-da60-08db7c61d2ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NJc+YlVAPilStak9+JHspNW/dbEA5UZGV/JGyyLsrd45wO60RUC6Ub3t4l9wRCUciTT/Pyx+IVi0sDrIqKGVNJpey4DC6NbMdUi7EvnkgoE8ja/0kXA4jVuLv/u6Tco0fmVDmircCCPo1CwZpAnHCwWXdH20zBdwxpZqW2DfVPmjqJ5pn6moLYhWVKYevxmCU0nii22dIQ0eBJc09m94rqjjhI2SVH5P4IlWFujo35GQlVoLB9vpDpj2Cz7GWkblqwB0Ty0z4njk8u5BAGWCZK8W15mm8gAT71YoAfsekjVsx8B+cU6qfHbkmEy5PV+tZRSFI2ScdzlhV0wfYZXoPuyhnpg8QeOCsV7Hi5l1I2nTG3pXr6DbiDvSWvOmr07mBCPAP1+7zuxnBpXFsWhCwFyGwRGvVcKdyshbeCwzMooFgNA0e3IPqenY7dWd2v2couMAhzzGvr2SNfhgSDwNzJhLUeOa+zBCklFpzcAp12gbSusXdGb2EICHlRPdQDlWW0Thv+0N664qrI4ua4tInmHZVR2xHM6qBXBZOh3I/xykM8u+WOnf12UYfuoVYa2KeS1cgGNgfggqL68CNml3Bh2+tTEe97bH6QTtNdyeM5E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(451199021)(41300700001)(38100700002)(30864003)(6666004)(38350700002)(52116002)(2616005)(83380400001)(6506007)(26005)(186003)(1076003)(966005)(6512007)(86362001)(9686003)(6486002)(478600001)(316002)(2906002)(66556008)(66946007)(36756003)(66476007)(8936002)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1pNGP20F64UYD3+buflTu1L/wD7VZ75UhyzaZv49oKp1W2rL1aowV53zKfeO?=
 =?us-ascii?Q?KUYDgpWiiiugbpZD19/cukasLHkjQZguII0qVQM0hn7Lg2c15gUHuFeYisD1?=
 =?us-ascii?Q?0XlQlZkR2M//FDQeCXIhNaYdv4dNvZthuAalaGkOg6xb+hnXw6tML/Hdbbfy?=
 =?us-ascii?Q?hBEcwRFDsMSJE3Cqmv8xIYattTb64civhR84VKwhuf061Zf5Utggd0yU2C1j?=
 =?us-ascii?Q?KoNfMakhVXPM5zzwV09ge9em/CZCD5ZRgpM5YOs3sON3Zo6YvaWy3IdwwrIz?=
 =?us-ascii?Q?7jDuxsS4mUQ7WuP6kgrgbVxUoeZ73Z4OJhi3e3z2Yf3IxVIqiMvEB1pYb30p?=
 =?us-ascii?Q?BswqbjxohedQxMFt58I8xHj+ioeieMcLmtlKxsQFNpU0HmKgjrowy/PVswC7?=
 =?us-ascii?Q?iVFl3cl4l1qKD5E0TXpqQe+jf0xlQH3NS9rlC/6yiA9QA2gm94qJNEk0jk5+?=
 =?us-ascii?Q?CoHB+UGBJC9cbx+wkM+2rTxwjM/GDrAkWEDpUJZAooYMAQDSqK+5rmVj6aFQ?=
 =?us-ascii?Q?k12VqihjaiVwEqftGyO6LlFvuIyd6HASWn7HD+g3E313B1BxgPavENGfFjtD?=
 =?us-ascii?Q?VgcBo3kwOsw7+zoQNZndR8NOLJ+mrpTJPVOGhm+xJ/EMgCD3C2VYY6TRdZnj?=
 =?us-ascii?Q?FtIFoTDccVhgUCAeqA85ZL8zeEIm3BvzB4mhk7Nzl5/L2mdwmtfiw8NQ9PYS?=
 =?us-ascii?Q?ffie7T4XsSp1zxBZkZFGDIdUp3Hz1hHx5FPehknKd46YpThS7D9Z58yson4c?=
 =?us-ascii?Q?5fD1gCnoqlM0jdhViBaboUarU65cFSbsgmC4MGqkVD7sUSXwRb+DuU0Vst2o?=
 =?us-ascii?Q?knRXzkr/EhwiHw/FVQJgmFWRD828ImysZIkDEzsa0uUwjHVF47ADevG0vqYh?=
 =?us-ascii?Q?C6oUpD0H7QFjnA8Ii+bBZfpesmcZfQbIjsVegeonHOmEgqWm1tNozYuRwxiw?=
 =?us-ascii?Q?u53tVaxnj5/SiZhWfJNk/J1diwnnuCz+B4jDgvNFX025xA48eWYwVQvcj8gE?=
 =?us-ascii?Q?TcXj3ADHz34LuvhaNkGKHj0IQLR1f4c40H5tdJwZoV6QeKsXDE65bdH8/c+u?=
 =?us-ascii?Q?LTwGqcHodjIXp8WTIlZzDQcC1MJ8MduqxwymJ1WA0Jofc+VkBlIMEAHl+qxP?=
 =?us-ascii?Q?vGGnI1tfHm2QWsq5YBXyvdqlxUxBMKhgVeILq+LPtFExwklQIyR25SNAWQEi?=
 =?us-ascii?Q?JMQlVYypPlNraPIGbe2SKjezMqWGxQv9MaVc1ZISCQQL0M8Ke0dwARH1/ZnE?=
 =?us-ascii?Q?Nj0ALbDEVN/powUhhI+YACO1QGHunnS8DB2kBkj+hQ7tfow78VLswtY5P5am?=
 =?us-ascii?Q?csA+PAkoU9euzgBI5wWM0XzRFVuNpojbl7b6YzFa/SK4PAi7Plo8THkKhFR9?=
 =?us-ascii?Q?7K83V97a6EfkB40RkojYbcXFqvXbW/fz9wuMqSWJlwK4NGWS/V2Y+CNU1kgy?=
 =?us-ascii?Q?SjLNzgYzB77G8jD6a/xa3N8irUzdEe4eOAOFmf3mfovmWycBNk2gRtJ6UsBC?=
 =?us-ascii?Q?v0h8i9IIDzsg8Rj18ldbU1x6dxlxRCkZdi5veU/HwOHUt2BcWQcsZ83XUEQX?=
 =?us-ascii?Q?GQ6n94N+dvnQVI8cgdzaGuFv6MO9oJtkQT0z6H7TS1jGlh4BjOdZzYgabeh9?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6a24be-770e-47f9-da60-08db7c61d2ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:39:39.9397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VI8VqWcqCOtW/zfB2QEzwOd8MCDuTCDKOmkmyJI0A1d8VjfcO7mpiYVvFjfRMuSkXvEU+l9k68OI4IM5QQ1ejL0gmWnOqgxYXV5sXDt7UqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-GUID: z8iejk9BGqoq2gniaDNPbqVUzfTfXJD_
X-Proofpoint-ORIG-GUID: z8iejk9BGqoq2gniaDNPbqVUzfTfXJD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_04,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307040061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183815

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, some segfaults are reported when running ptest:
mdadm[12333]: segfault at 0 ip 00007fe855924060 sp 00007ffc4d6caf88 error 4 in libc.so.6[7f)
Code: d2 0f 84 b7 0f 00 00 48 83 fa 01 0f 84 b9 0f 00 00 49 89 d3 89 f1 89 f8 48 83 e1 3f 4f

Backport the following upstream commits to fix them:
679bd9508a30 ("DDF: Cleanup validate_geometry_ddf_container()")
2b93288a5650 ("DDF: Fix NULL pointer dereference in validate_geometry_ddf()")
548e9b916f86 ("mdadm/Grow: Fix use after close bug by closing after fork")
9ae62977b51d ("monitor: Avoid segfault when calling NULL get_bad_blocks")

The fixes are part of the "Bug fixes and testing improvments" patchset [1].

[1] https://www.spinics.net/lists/raid/msg70621.html

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...anup-validate_geometry_ddf_container.patch | 148 ++++++++++++++++++
 ...nter-dereference-in-validate_geometr.patch |  56 +++++++
 ...se-after-close-bug-by-closing-after-.patch |  91 +++++++++++
 ...gfault-when-calling-NULL-get_bad_blo.patch |  42 +++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   4 +
 5 files changed, 341 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch b/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
new file mode 100644
index 0000000000..cea435f83b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
@@ -0,0 +1,148 @@
+From ca458f4dcc4de9403298f67543466ce4bbc8f8ae Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:07 -0600
+Subject: [PATCH 1/4] DDF: Cleanup validate_geometry_ddf_container()
+
+Move the function up so that the function declaration is not necessary
+and remove the unused arguments to the function.
+
+No functional changes are intended but will help with a bug fix in the
+next patch.
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=679bd9508a30
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ super-ddf.c | 88 ++++++++++++++++++++++++-----------------------------
+ 1 file changed, 39 insertions(+), 49 deletions(-)
+
+diff --git a/super-ddf.c b/super-ddf.c
+index 3f304cd..65cf727 100644
+--- a/super-ddf.c
++++ b/super-ddf.c
+@@ -503,13 +503,6 @@ struct ddf_super {
+ static int load_super_ddf_all(struct supertype *st, int fd,
+ 			      void **sbp, char *devname);
+ static int get_svd_state(const struct ddf_super *, const struct vcl *);
+-static int
+-validate_geometry_ddf_container(struct supertype *st,
+-				int level, int layout, int raiddisks,
+-				int chunk, unsigned long long size,
+-				unsigned long long data_offset,
+-				char *dev, unsigned long long *freesize,
+-				int verbose);
+ 
+ static int validate_geometry_ddf_bvd(struct supertype *st,
+ 				     int level, int layout, int raiddisks,
+@@ -3322,6 +3315,42 @@ static int reserve_space(struct supertype *st, int raiddisks,
+ 	return 1;
+ }
+ 
++static int
++validate_geometry_ddf_container(struct supertype *st,
++				int level, int raiddisks,
++				unsigned long long data_offset,
++				char *dev, unsigned long long *freesize,
++				int verbose)
++{
++	int fd;
++	unsigned long long ldsize;
++
++	if (level != LEVEL_CONTAINER)
++		return 0;
++	if (!dev)
++		return 1;
++
++	fd = dev_open(dev, O_RDONLY|O_EXCL);
++	if (fd < 0) {
++		if (verbose)
++			pr_err("ddf: Cannot open %s: %s\n",
++			       dev, strerror(errno));
++		return 0;
++	}
++	if (!get_dev_size(fd, dev, &ldsize)) {
++		close(fd);
++		return 0;
++	}
++	close(fd);
++	if (freesize) {
++		*freesize = avail_size_ddf(st, ldsize >> 9, INVALID_SECTORS);
++		if (*freesize == 0)
++			return 0;
++	}
++
++	return 1;
++}
++
+ static int validate_geometry_ddf(struct supertype *st,
+ 				 int level, int layout, int raiddisks,
+ 				 int *chunk, unsigned long long size,
+@@ -3347,11 +3376,9 @@ static int validate_geometry_ddf(struct supertype *st,
+ 		level = LEVEL_CONTAINER;
+ 	if (level == LEVEL_CONTAINER) {
+ 		/* Must be a fresh device to add to a container */
+-		return validate_geometry_ddf_container(st, level, layout,
+-						       raiddisks, *chunk,
+-						       size, data_offset, dev,
+-						       freesize,
+-						       verbose);
++		return validate_geometry_ddf_container(st, level, raiddisks,
++						       data_offset, dev,
++						       freesize, verbose);
+ 	}
+ 
+ 	if (!dev) {
+@@ -3449,43 +3476,6 @@ static int validate_geometry_ddf(struct supertype *st,
+ 	return 1;
+ }
+ 
+-static int
+-validate_geometry_ddf_container(struct supertype *st,
+-				int level, int layout, int raiddisks,
+-				int chunk, unsigned long long size,
+-				unsigned long long data_offset,
+-				char *dev, unsigned long long *freesize,
+-				int verbose)
+-{
+-	int fd;
+-	unsigned long long ldsize;
+-
+-	if (level != LEVEL_CONTAINER)
+-		return 0;
+-	if (!dev)
+-		return 1;
+-
+-	fd = dev_open(dev, O_RDONLY|O_EXCL);
+-	if (fd < 0) {
+-		if (verbose)
+-			pr_err("ddf: Cannot open %s: %s\n",
+-			       dev, strerror(errno));
+-		return 0;
+-	}
+-	if (!get_dev_size(fd, dev, &ldsize)) {
+-		close(fd);
+-		return 0;
+-	}
+-	close(fd);
+-	if (freesize) {
+-		*freesize = avail_size_ddf(st, ldsize >> 9, INVALID_SECTORS);
+-		if (*freesize == 0)
+-			return 0;
+-	}
+-
+-	return 1;
+-}
+-
+ static int validate_geometry_ddf_bvd(struct supertype *st,
+ 				     int level, int layout, int raiddisks,
+ 				     int *chunk, unsigned long long size,
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch b/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
new file mode 100644
index 0000000000..fafe88b49c
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
@@ -0,0 +1,56 @@
+From 14f110f0286d38e29ef5e51d7f72e049c2f18323 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:08 -0600
+Subject: [PATCH 2/4] DDF: Fix NULL pointer dereference in
+ validate_geometry_ddf()
+
+A relatively recent patch added a call to validate_geometry() in
+Manage_add() that has level=LEVEL_CONTAINER and chunk=NULL.
+
+This causes some ddf tests to segfault which aborts the test suite.
+
+To fix this, avoid dereferencing chunk when the level is
+LEVEL_CONTAINER or LEVEL_NONE.
+
+Fixes: 1f5d54a06df0 ("Manage: Call validate_geometry when adding drive to external container")
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=2b93288a5650
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ super-ddf.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/super-ddf.c b/super-ddf.c
+index 65cf727..3ef1293 100644
+--- a/super-ddf.c
++++ b/super-ddf.c
+@@ -3369,9 +3369,6 @@ static int validate_geometry_ddf(struct supertype *st,
+ 	 * If given BVDs, we make an SVD, changing all the GUIDs in the process.
+ 	 */
+ 
+-	if (*chunk == UnSet)
+-		*chunk = DEFAULT_CHUNK;
+-
+ 	if (level == LEVEL_NONE)
+ 		level = LEVEL_CONTAINER;
+ 	if (level == LEVEL_CONTAINER) {
+@@ -3381,6 +3378,9 @@ static int validate_geometry_ddf(struct supertype *st,
+ 						       freesize, verbose);
+ 	}
+ 
++	if (*chunk == UnSet)
++		*chunk = DEFAULT_CHUNK;
++
+ 	if (!dev) {
+ 		mdu_array_info_t array = {
+ 			.level = level,
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch b/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
new file mode 100644
index 0000000000..a954ab027a
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
@@ -0,0 +1,91 @@
+From bd064da1469a6a07331b076a0294a8c6c3c38526 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:09 -0600
+Subject: [PATCH 3/4] mdadm/Grow: Fix use after close bug by closing after fork
+
+The test 07reshape-grow fails most of the time. But it succeeds around
+1 in 5 times. When it does succeed, it causes the tests to die because
+mdadm has segfaulted.
+
+The segfault was caused by mdadm attempting to repoen a file
+descriptor that was already closed. The backtrace of the segfault
+was:
+
+  #0  __strncmp_avx2 () at ../sysdeps/x86_64/multiarch/strcmp-avx2.S:101
+  #1  0x000056146e31d44b in devnm2devid (devnm=0x0) at util.c:956
+  #2  0x000056146e31dab4 in open_dev_flags (devnm=0x0, flags=0)
+                         at util.c:1072
+  #3  0x000056146e31db22 in open_dev (devnm=0x0) at util.c:1079
+  #4  0x000056146e3202e8 in reopen_mddev (mdfd=4) at util.c:2244
+  #5  0x000056146e329f36 in start_array (mdfd=4,
+              mddev=0x7ffc55342450 "/dev/md0", content=0x7ffc55342860,
+              st=0x56146fc78660, ident=0x7ffc55342f70, best=0x56146fc6f5d0,
+              bestcnt=10, chosen_drive=0, devices=0x56146fc706b0, okcnt=5,
+	      sparecnt=0,  rebuilding_cnt=0, journalcnt=0, c=0x7ffc55342e90,
+	      clean=1,  avail=0x56146fc78720 "\001\001\001\001\001",
+	      start_partial_ok=0, err_ok=0, was_forced=0)
+	                  at Assemble.c:1206
+  #6  0x000056146e32c36e in Assemble (st=0x56146fc78660,
+               mddev=0x7ffc55342450 "/dev/md0", ident=0x7ffc55342f70,
+	       devlist=0x56146fc6e2d0, c=0x7ffc55342e90)
+	                 at Assemble.c:1914
+  #7  0x000056146e312ac9 in main (argc=11, argv=0x7ffc55343238)
+                         at mdadm.c:1510
+
+The file descriptor was closed early in Grow_continue(). The noted commit
+moved the close() call to close the fd above the fork which caused the
+parent process to return with a closed fd.
+
+This meant reshape_array() and Grow_continue() would return in the parent
+with the fd forked. The fd would eventually be passed to reopen_mddev()
+which returned an unhandled NULL from fd2devnm() which would then be
+dereferenced in devnm2devid.
+
+Fix this by moving the close() call below the fork. This appears to
+fix the 07revert-grow test. While we're at it, switch to using
+close_fd() to invalidate the file descriptor.
+
+Fixes: 77b72fa82813 ("mdadm/Grow: prevent md's fd from being occupied during delayed time")
+Cc: Alex Wu <alexwu@synology.com>
+Cc: BingJing Chang <bingjingc@synology.com>
+Cc: Danny Shih <dannyshih@synology.com>
+Cc: ChangSyun Peng <allenpeng@synology.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=548e9b916f86
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Grow.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Grow.c b/Grow.c
+index 9c6fc95..a8e4e83 100644
+--- a/Grow.c
++++ b/Grow.c
+@@ -3501,7 +3501,6 @@ started:
+ 			return 0;
+ 		}
+ 
+-	close(fd);
+ 	/* Now we just need to kick off the reshape and watch, while
+ 	 * handling backups of the data...
+ 	 * This is all done by a forked background process.
+@@ -3522,6 +3521,9 @@ started:
+ 		break;
+ 	}
+ 
++	/* Close unused file descriptor in the forked process */
++	close_fd(&fd);
++
+ 	/* If another array on the same devices is busy, the
+ 	 * reshape will wait for them.  This would mean that
+ 	 * the first section that we suspend will stay suspended
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch b/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
new file mode 100644
index 0000000000..72cb40f782
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
@@ -0,0 +1,42 @@
+From 2296a4a441b4b8546e2eb32403930f1bb8f3ee4a Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:10 -0600
+Subject: [PATCH 4/4] monitor: Avoid segfault when calling NULL get_bad_blocks
+
+Not all struct superswitch implement a get_bad_blocks() function,
+yet mdmon seems to call it without checking for NULL and thus
+occasionally segfaults in the test 10ddf-geometry.
+
+Fix this by checking for NULL before calling it.
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=9ae62977b51d
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ monitor.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/monitor.c b/monitor.c
+index afc3e50..8e43c0d 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -312,6 +312,9 @@ static int check_for_cleared_bb(struct active_array *a, struct mdinfo *mdi)
+ 	struct md_bb *bb;
+ 	int i;
+ 
++	if (!ss->get_bad_blocks)
++		return -1;
++
+ 	/*
+ 	 * Get a list of bad blocks for an array, then read list of
+ 	 * acknowledged bad blocks from kernel and compare it against metadata
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 6152a83655..f616746368 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -32,6 +32,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-tests-fix-raid0-tests-for-0.90-metadata.patch \
            file://0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch \
            file://0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch \
+           file://0001-DDF-Cleanup-validate_geometry_ddf_container.patch \
+           file://0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch \
+           file://0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch \
+           file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.39.1


