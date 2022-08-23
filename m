Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA39C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:57:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1153.1661277445781704071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HtXBhD8c;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5234c0b320=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27NFrp4o026775
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:57:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+zMAXdH9qlg09TGciHXGzkABtW0kip01hyV70Q6gL78=;
 b=HtXBhD8clt64RmVw0bgDgjKmI/KS3yOM3fB6EaGPcPmUaoilepRXKkII4XvaHy+Vai0T
 r3rIKOcvZp09FweFsw0WRryHbnm5HrZaUv1O11C9ajAOEMa/Je7LR97seIH4eX1XoGi7
 KxwmLwXT/cZoGouh913anOQfViuJac9qnyUeqpRR25iYc6ykTN0NX9PLqXqH1j5FEemP
 eHVMdqqG6kcaF3uf2vwashWFYcOLHN9V/LN//L1LllIF6p8oYgnpZY9QHVr6WkUR3+EZ
 VonjrF7h+P/yjv37DbLFrMcpb7HxnEMGUYgetyC6MSdH3ohHnbpW5uPDTvGEsjgxs8Va iw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2w11u28s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqAtHasUBFBufR590zhmXd/LAB0T4gVFIgi4Bjjv9nmt+3SzRkscQnga7kkQbGpONdicA9Z/f+radwiyvV4FOpqv7NMlhYQpZ0ha6ARQoLJroF/k00u7MQ3+Yak+AFIu6PKEVWdt4xo9TfYt6PMla0WVm6OyYMe7FQ/RQUCYzjwxS1a97lyVsgo5EpV/ZtqbIBim/dHwiVYi04CO0kYZQkbhGvWQzgzBZuEiVfqadBnENTGRDs3gS3pnkd2YeXMaJzPEsc4I1GjDaV4pd/MjVjrAoy7g9C8SOgGqKkzmlbVQJUcZ/u50tKtyZgfutQRxGUHRC224sAZMDor183Az4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zMAXdH9qlg09TGciHXGzkABtW0kip01hyV70Q6gL78=;
 b=h0KzOYtqqxU+sCGNJAA6LIrJinRvhANqoJ8IUrlnwW36JxMSfBw6QkAlmfCjxdjsuopV7ERd0KJqU2P44ve5GrEd9F6WKLaRheTbon8slxyyDtTmt9WgD18QE7x197nKFklFdUvlFwx0CPUEwa07AfBDowTRhp8xQy8fO2ilE2Cuk9Viwq5yMNx0Q3L6ZmMFdOkYNJWeHL8AQ3Oi850POFybSP7TWdm7zhvdHB5wdb0StdBRmU4YCsVkM7HO6HR6G1mDXQK4p4WZxWosk9KkLuTRi0/tj4+fuiitApivaUv9zrPQcl3Hfseoyw3s4Oij5dvjrp0jvlQ7B+znTGU6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3577.namprd11.prod.outlook.com (2603:10b6:5:137::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Tue, 23 Aug 2022 17:57:22 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 17:57:22 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][meta-oe][PATCH] minicoredumper: retry elf parsing as long
 as needed
Date: Tue, 23 Aug 2022 13:56:56 -0400
Message-Id: <20220823175656.22556-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0195.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::14) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ebb8c0c-3314-4886-f154-08da8530ede4
X-MS-TrafficTypeDiagnostic: DM6PR11MB3577:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mAAmlQWGGZKVkfXVMMPEMngeP1PmLxVOCj7ZNABrogtJf4l3DT7gSH1PsMMljX4EBCyaQElvAYMtPcsbApm8T7LSnZ6YSTm9nF5QvWXMS77CIWYWNT2xPlLK6Ke9kr0/4kHHixePny1oTJ/jcOzW1KvTdxyAwqscjp7GnCSEce7Qe5xfuYt5HkhgN+DksUYHytaTH9pk+/rjxGesArbexY12KsRTciTyJZzWu6XFMoZBXkv+kQACWhSKSsjpHKV09DXrRryaTHTxTcE9Kh8sap2HRnxYpUmEZyLANhTplTGQcsHUGXdjpEurc2y0JklNIvnsIA/6c8oo82qk7WxuRzU5OaFJjxbaBwZWlDA0CxjDmdSDVY3936issoIgTU3WzLspLZEJeFvCXspuXULRMmeUqjTZyl+jbK1RS9cuyqtGhZoq3kLQ3iq0leJOhEPl01d7C3Uow9A8na9/tDcK5VsQNrA8ixIYSt5unyuhpR8P87vepedgTkC+psMEi19zaSJuSE/Xk6NRyKq4pcjWvyOoK2KjAzjBuClRLAJwCk3NIGCx2dsiFCSX/QszY6MO8Od60yfpNCXH1nUNhQAH2hKwNLgm5DZAnicfVVo9i6FkubvxY/io4b6Mm7gmnoujBNdqGgrVoqfF7t1yimomhwaFxGeMe10PoLYvRbtCDBnIHyD1pARe4tlaWzAwMrNFRa3Fe/0yGlU9Gzb9VKDL7YLZHmngjBWZdEXRqphcOSfjanhL7ojBANV8yw72jD7LHlw3d9Muex4sSYU3b2I9OZT8M9+zn6xPuhuPZTnug0c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(83380400001)(6486002)(86362001)(38100700002)(38350700002)(84970400001)(66556008)(66476007)(8676002)(66946007)(8936002)(478600001)(316002)(6916009)(1076003)(186003)(26005)(6512007)(52116002)(36756003)(44832011)(41300700001)(5660300002)(2616005)(6506007)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?79p+yWVsmQ9dBoeQzZpNxneWcR40CahbnVJn/mXUcdi7sTEeNbhg/JiQ/wzQ?=
 =?us-ascii?Q?U5SYVMORF5M7FJTDhPqw0Xv8nQQNnS7qUz49Y8UQj/4pfY+wBSDxRBr0jR8U?=
 =?us-ascii?Q?gAoIVaogKGc68Qg1IWBCv9tWj1GLdzrmABDx7RfTPkso9dS8djmoa/egKlw7?=
 =?us-ascii?Q?lChFmWs9gvH9wILUXxqKzYVVLVqdpbzNEPKjkonhW9b4ql58g+Gleb50rJz6?=
 =?us-ascii?Q?N37dAVXuAryiMbZYKrLLr9TVQJXsYMAAhb1gpHtkioMWNOuPO+Bgwvuh/alj?=
 =?us-ascii?Q?z1h/Cit3CEfxCBRBd8N9lELzgcqRDN8PMg64aP790Ey7ksCj9RLCVnsLCIAL?=
 =?us-ascii?Q?ukQD1e1Of2ugh2jGj6w7sHrwDOXAfyJFwDu0/yLgKVh6sHFILHtzZpDdXprM?=
 =?us-ascii?Q?eVNjeaDhzrnaODmB3L3Se4JC4hflGBGT0/aKHei8+3MoANx3WlBycYiMVRO+?=
 =?us-ascii?Q?QwL8UaTsQjKvY16Jo2xIu9XdWWScHv8yH0i7a6O1t/g3OUUVmG3uKZy+28fW?=
 =?us-ascii?Q?oFD5kwBLhNBnKBPDrPspGry1doTn8uA/RBFveKDAOIqWtJ+0iUpCAjnmIP3O?=
 =?us-ascii?Q?mgnKK0cbYtP2IKjgSe6qT/LR8CIBRLPFN/4+UZNE04F4QxCJWm/viau6A8FJ?=
 =?us-ascii?Q?H8IvPPCxMeqpdflimYmkUEL/wHLQULZpIpBq+kLuSWq+yyL9yNcIYhShAwKg?=
 =?us-ascii?Q?2mAhfPOyIZR+gr85NA+3oPVoRhsNpLXlxSBFCF/OzuHKCsWXyJj8KGDhQ59+?=
 =?us-ascii?Q?H8+Fn0qa7aO/3avfsLI+YRKPzboEaWWkD/wDSLGv6dikP9/7I/O0HcbwdVRz?=
 =?us-ascii?Q?yNHUpOtrUgp5AU4ixMBlohgVdBmvTKdCZpNaqz8SKVXpv4bbxnbI2uP3bT/c?=
 =?us-ascii?Q?s+U/lBQQgpIccPiJ2kJGKGDcdqdOOfC7iXBfi3zD8pdSN3T/LWZg5Cm6dmlB?=
 =?us-ascii?Q?oxTaFGBwd/BQPLuiOchah1UzTyGKO7BTjMo6dAGQnBSCIF287tEhj2hkBRV0?=
 =?us-ascii?Q?2fUnCVg0VA2nOqNhofvtJHM0b2TJm1lZeSLgUsbVh7YQ5nCkjXh9sWOf1ibP?=
 =?us-ascii?Q?nYMHj7M2+DNIgTinkMWShs0AnI6RCa9jxlnlFptU+ibQ44JSq3z/rpmeUggx?=
 =?us-ascii?Q?XZyQBD5XtZMqr/511IvoR82237jJJQnXT3LA1vyQW7Gv1mVFDpgeVHkKKclj?=
 =?us-ascii?Q?2bw2bUlywNWwlQ7nn7SQfN3FxaeIlLAapiENc0MwZiOVL1qkMflPttKSASHW?=
 =?us-ascii?Q?deLB60e/Eo1rjGVettxedNZ6SHJvFG/MFajqy9hbdoOmZH6a25cTEYS+oC6N?=
 =?us-ascii?Q?9bD4iLA2ltCxkCfrtN0FV0JlJ/0ho0H1pM+/2aGgEq1PEdCp684UWrGoHC94?=
 =?us-ascii?Q?nO1W6b/E8a5awsiWgmYT8EmRteGGaeJA3ZqVzj4kN6IrLvzo+2MF2Rlfu9yg?=
 =?us-ascii?Q?nAbSl0/2XrVEvuQQSO87dQRu71IAZZDKvHHM94izMbA7h7feylquSDQaPZGX?=
 =?us-ascii?Q?RqCofa+rJ8pbhA6eVfuIeo9UvumyigLmJoPfpDtaoTfjbdNTh6npDL77Uhf/?=
 =?us-ascii?Q?O1FZkcJ/7J+ZafcCAWgnN7D3BqrqZsV0FNaxifQCeHyBA76C537adwlplbhw?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ebb8c0c-3314-4886-f154-08da8530ede4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 17:57:22.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SeGeDTROcO/LS8tHt0oq1dotWkfpSP9KLAAAV38QwHAG8pgLD1atLUXFtOQDZml6XKmH8rIIPontQxod2sdd8L96Po06ejdH8xGoUsCRutY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3577
X-Proofpoint-ORIG-GUID: zQIksTs6BhqJQbzoXtJzQzz0g-BkY3qv
X-Proofpoint-GUID: zQIksTs6BhqJQbzoXtJzQzz0g-BkY3qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 17:57:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169721

Maximum number of tries, in rare cases, is insufficient for
elf parse. Backport patch that fixes the issue.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e231c86e282eefff0e8164551f75f8e01682abe6)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-retry-elf-parsing-as-long-as-needed.patch | 128 ++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.1.bb    |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
new file mode 100644
index 000000000..8d5b8b6cb
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
@@ -0,0 +1,128 @@
+From 7a8c6a06c86e133e4346b1dc66483bd8d0d3c716 Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Tue, 24 Aug 2021 21:10:43 +0200
+Subject: [PATCH] minicoredumper: retry elf parsing as long as needed
+
+As was reported in github issue #2 ("maximum number of tries
+insufficient, in rare cases, for elf parse"), the number of retries
+for parsing a process may be insufficient. Rather than setting an
+upper limit on the maximum number of retries, track the number of
+headers seen. As long as the number of seen headers is greater than
+the previous try, try again.
+
+In order to avoid introducing any new issues, preserve the behavior
+of retrying at least 10 times, even if no new headers are seen.
+
+Reported-by: github.com/ssajal-wr
+Signed-off-by: John Ogness <john.ogness@linutronix.de>
+
+Upstream-Status: Backport [7a8c6a06c86e133e4346b1dc66483bd8d0d3c716]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/minicoredumper/corestripper.c | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index d96d1df..c96b350 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -761,7 +761,7 @@ static int init_log(struct dump_info *di)
+ typedef int elf_parse_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr);
+ 
+ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+-			   elf_parse_cb *callback)
++			   elf_parse_cb *callback, size_t *phnum_found)
+ {
+ 	GElf_Ehdr ehdr_mem;
+ 	GElf_Ehdr *ehdr;
+@@ -770,6 +770,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+ 	size_t phnum;
+ 	size_t cnt;
+ 
++	if (phnum_found)
++		*phnum_found = 0;
++
+ 	/* start from beginning of core */
+ 	if (lseek64(di->elf_fd, 0, SEEK_SET) == -1) {
+ 		info("lseek failed: %s", strerror(errno));
+@@ -809,6 +812,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+ 		goto out;
+ 	}
+ 
++	if (phnum_found)
++		*phnum_found = phnum;
++
+ 	for (cnt = 0; cnt < phnum; cnt++) {
+ 		GElf_Phdr phdr_mem;
+ 		GElf_Phdr *phdr;
+@@ -891,7 +897,7 @@ static int vma_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr)
+ /*
+  * Tries to parse the found ELF headers and reads all vmas from it.
+  */
+-static int parse_vma_info(struct dump_info *di)
++static int parse_vma_info(struct dump_info *di, size_t *phnum_found)
+ {
+ 	unsigned long min_off = ULONG_MAX;
+ 	unsigned long max_len = 0;
+@@ -911,7 +917,7 @@ static int parse_vma_info(struct dump_info *di)
+ 	memset(&type, 0, sizeof(type));
+ 	type.p_type = PT_LOAD;
+ 	type.p_flags = PF_R;
+-	if (do_elf_ph_parse(di, &type, vma_cb) != 0)
++	if (do_elf_ph_parse(di, &type, vma_cb, phnum_found) != 0)
+ 		return -1;
+ 
+ 	for (v = di->vma; v; v = v->next) {
+@@ -1614,8 +1620,10 @@ int add_core_data(struct dump_info *di, off64_t dest_offset, size_t len,
+  */
+ static int init_src_core(struct dump_info *di, int src)
+ {
++	size_t last_phnum = 0;
+ 	int tries = 0;
+ 	int ret = -1;
++	size_t phnum;
+ 	size_t len;
+ 	char *buf;
+ 	long pos;
+@@ -1642,7 +1650,7 @@ again:
+ 		goto out;
+ 
+ 	/* try to elf-parse the core to read vma info */
+-	ret = parse_vma_info(di);
++	ret = parse_vma_info(di, &phnum);
+ 
+ 	/* restore our position */
+ 	if (lseek64(di->elf_fd, pos, SEEK_SET) == -1)
+@@ -1653,9 +1661,17 @@ again:
+ 
+ 		tries++;
+ 
+-		/* maybe try again */
+-		if (tries < 10)
++		if (phnum > last_phnum) {
++			/* new headers found, keep trying */
++			last_phnum = phnum;
+ 			goto again;
++		} else if (tries < 10) {
++			/*
++			 * even if no new headers are found,
++			 * retry at least 10 times
++			 */
++			goto again;
++		}
+ 
+ 		goto out;
+ 	}
+@@ -2106,7 +2122,7 @@ static int dump_stacks(struct dump_info *di)
+ 		/* find and set the first task */
+ 		memset(&type, 0, sizeof(type));
+ 		type.p_type = PT_NOTE;
+-		do_elf_ph_parse(di, &type, note_cb);
++		do_elf_ph_parse(di, &type, note_cb, NULL);
+ 	}
+ 
+ 	if (di->first_pid)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 8188ae599..5c5e0b241 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -16,6 +16,7 @@ PR .= "+git${SRCPV}"
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
            file://minicoredumper.init \
+           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.33.0


