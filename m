Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF48C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:46:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1008.1661276778395971550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QroEiKaY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5234c0b320=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ND1dGS008622
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:46:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JluUYqUg7ZD7w0KhIs5YggvLEgQgqVNUyOPuf8M6Wcs=;
 b=QroEiKaYQKuYyu67qq0UHOEOBx5bMWelhBm/M6lnOJ0RArLXlM3ELrfskCGMrBQ2xQ6x
 MuLnGe74KXHowsJYdaki7A+Il2PVDjqAT3wj21LTFDm15BWY4nhtT0JFZMUImoMs247/
 T4JvPoscG/45NnwL5Fg2Nz1KrFvNtgKNkIMvf4m6Qe2t48vCSgk95yLAW/ZgSUk+vCHz
 oK+wR/NpUOD1K3XRwYQHhCGdghlxckgzAN/4tHo/fT8V8Tbvg1jaHfTZfiXYzVUJsAwC
 3Dlss+iANJ5qO+02grmCNjPSTtn+KXOqs4zBQB5RvqYqJ7Pl4kt3lm6ye7oPAHzn8yoc 5A==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2y4jjvxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/IgATbYTAs3EFBSZQFXgRbr9Rty3hXrtN/z4rQq666UqdUSfrtPp1f4R9YYGpSUVn4XprggTew7z/nD/8Qf/ELGK+Il+Z8Xg8IRK/oq7bzpx/7lFOoAweyNn5VUZBCUim2Zn7pE3szaYk3EYNTlfTLsmNZgDcYt4cDazzvFMPuugZT7ee/wqXAnEqgIMPmfq3ytEjfTxb2sr/ObmEZDEmvlyqlz5oMwUBH8zbY5LijroYJzxnJmwWsMkkuhfatEt26ICUt25J2c6EW6oN6R2+DPdxGpPDMju97oMrn6G0pIvgjw//x5j45uQappxA2WioEMzoiL0cmkwRlRug/Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JluUYqUg7ZD7w0KhIs5YggvLEgQgqVNUyOPuf8M6Wcs=;
 b=XhWi+tnnFR8F51qr+H/FphO4fMiT/qjI1y+G3gL/Nqi+92cc+Za132mgN5aDK+mXcW22MrJePLVoNF7H0XiV0/whebY5nl1qBoipV8S3D53sBbZBxv/xXAyhb8OxqXWAv0YgK/s5qXXlhMQmQJZekdMCHnl/FdAh7UPr9OaBCnvysvczWwS6vPT1uzTTiVSQzQ7c35cLG2QEMvZPka6gB8ybDwWLKN/8Xuwb4DRB76OpDm0eKXu2YZXczfMjOou10ha32NAthTIieGc45tjGtOXZejYd78xirf1EBBwfmWQ8EVTdriwb4XBPpdR06tDnSlt5++NqGEgf4Lm3QFQ37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.21; Tue, 23 Aug 2022 17:46:15 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 17:46:15 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][meta-oe][PATCH] minicoredumper: retry elf parsing as long
 as needed
Date: Tue, 23 Aug 2022 13:44:50 -0400
Message-Id: <20220823174450.533-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::20) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a239113e-7ff8-4c41-0477-08da852f601e
X-MS-TrafficTypeDiagnostic: DM4PR11MB5995:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/VtMbpM7AJNkmXSUlKCHKpNqhXl0K6X/vawHUzR9i10Y7MjjanJqMZZjSlSX91MA9sN3tPvqA0LiHJUnF0Ps1PqkCPd9SY6RXSxH1b70PANvTaPMFJth0DRyMQ/4U/VnXvnOLl1kgsZwfa1dxo7dfEfrz9W5WL5EadIMuBdbqCdQsLhP6wdh940odzvkxHQK1K2Ca+GbMoytnmHcNhURoU8n+K4iQx6MRiQDiupaTMg56B8cBJ4E9/lLNWf5/+WbmvvfHJuhCSVY4rWGPNeCWr6Xyfh7cyuULSBrE+LzWBRcn9ekcXY6jmeg9YfBuzxZQ3Eo3MkrL1GmAKjsTmezLPgBpJkCSxlRdqJMs4MWDUm2C44ZljygwHeA63C/Q9ou2tVIgok52D+vfCG8S4Y5Sn4omqsyUiyp0Vz4zbE6XERcm7ovLip8VQ6I05dFYdli3hfFP2KJ5oV+mDCRDKHW0sAH2Ms7Of4mFy6leVui2YmUenk0LwLe1dtMgKnCH6B70/xxPlxJfB2KeUOIf+AfbNARTVWJDcCbCF2OAHhCic0qEvWZSCLe2Qi4BOLe1mIyE6ebtnKYACU7zM9K8yNPK7cdxbRi3z1WzzBgE682XgO720bJrpr222l/k/Hczb0GMcveZSDrQd3E1VSg21Vhmp0lciEPWuGvYbi2carJEbVuDDJNJQGzQrrH6aKi9aEI5JSpuqxtzxomO2gc8sCBeAMGQ06bUaiZo+jFqY9ZRTDpXK4hf1ehoDcllS2pxK/ERsZT+ckn8xxfZXS24+nghCCXE+DLor5CDvdQCQb574=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(36756003)(66946007)(86362001)(66476007)(66556008)(6916009)(38100700002)(8676002)(38350700002)(84970400001)(83380400001)(52116002)(186003)(1076003)(6512007)(26005)(41300700001)(6506007)(478600001)(6666004)(316002)(5660300002)(6486002)(2906002)(2616005)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pT6ySjwNWeMUlPX4VngStbx1hG2eYB/6uZC5xqj/DHu7zsb5vqvaoqUu0OQ2?=
 =?us-ascii?Q?Vb4vGOWNFyI+afG4mNLEuSI+TT4S5tXRMDXg6XZH+RBBRJSBU4nE9JULwf40?=
 =?us-ascii?Q?ABkQgmtShGHqe5mzKoCrKfOHNBBXbuWAq27N+J7D79IZCb9Pz2kATFrWDWjQ?=
 =?us-ascii?Q?h6pv6EfN3bxqD2ezohCsBxIu8FcYdwDtGvWSCxrCGfIJrkwjTl4ctHrReZ8j?=
 =?us-ascii?Q?tol4cPxWIIkwFq0Yz1vogR1HWWL/EttPNQyf1oM+Bcqm6OhoRFE/UX7FyiDV?=
 =?us-ascii?Q?A53OdD3nrTePhdvfSFvhAZdW76251lR+oeP2YTrmlvnIQfOiXBUsNPX1ajiz?=
 =?us-ascii?Q?wbL5lC1jW4a976bLQ+nEX2Mde011v/DFccrKqkx6N4eIIVKDFj4BvhyE/Y/M?=
 =?us-ascii?Q?VP9dSr/vUt7fgX+BijYmXrQHSLzypOGOdWvBOVARVt14lZd/03pQPYD2ftLw?=
 =?us-ascii?Q?VH0Qwoft8c9VJmBo0yqkkkaZCVo/vmdfndHudCCwtR/TkGn5qnVB1nm1KTbm?=
 =?us-ascii?Q?41ZeUDNBgHXsamB+pLlmRTNp472kKHlc6i9vzLjVIW1tUYvU/Ujb4o+r7+1V?=
 =?us-ascii?Q?byYsRb4JZYD1/VoJikDrQybBhMGJWPg+io3YhwDpAtVAWVP7wfmMATg+x87u?=
 =?us-ascii?Q?Ydr+sO9rA8TvN0dYCytoqW3O4JMV1rmPFOG3w0UgMq7zQ8dSKVpTjAIcr41d?=
 =?us-ascii?Q?pJLPXncQHdTrdHFVbaKPPDCUh6M+umQ1UFdkpnrYcJLDIbJXCaIaiA6Qnnux?=
 =?us-ascii?Q?zLWDtg/FNyrs56ICT+Lx8zQPqEHJATECpzNep+KaE+4b0oy0TqD1h43aly8+?=
 =?us-ascii?Q?4WZ1a8NcoBqEVat2rU8o2b6Z2NSfqCC0DmQnoJo8G0dIDSkj6myWXfoJLs9D?=
 =?us-ascii?Q?aJLUKpaDof7lIPlZJncjZnG0MTn51jSJnvYF9yM0lLdOJdJ2hdHDdGsg3PiW?=
 =?us-ascii?Q?Oqt6rf6fcXxKQCRL2jIPKDSlbztxlHRthdUJUuzGxSjCX+xQVV/hO2YRqihq?=
 =?us-ascii?Q?x0oUSyIbvFttw2BWZmbbufI1cpIM+ggPJtZCcF2uahUZHDPaU0AEvuTbE6xW?=
 =?us-ascii?Q?CxdJVbIpsUzLsRtId85kjZVypVRPJtVwUDjf9fC6BmVzXsfQtgyDdpbocyMu?=
 =?us-ascii?Q?2sCdRumvV/o/ydTcFy3q2I09R1i/xC0IxgNMRu2SqF0tEpheRhT+pJymg+fA?=
 =?us-ascii?Q?24Tzw7U6VkmPH4VhkiGztG8G82aHdIlMVMvnkowyFA7+fLYKM/NN1koaT2X7?=
 =?us-ascii?Q?PLlENAbdtn+hVqqa1SHiqD1pkGAev1dHSToJUjEpJbCRzXikE2D53dex1xVB?=
 =?us-ascii?Q?sxsqdVxaZidyua1ZKa8FNfkCrSZa0doZr8a/sqvArQBD3sLlC/79T9F33fYz?=
 =?us-ascii?Q?wy3NdcJyRGKHYao40tQsmh8rnXlrAu54vBSWm9nRham7x2X1Pqb0MribhUAe?=
 =?us-ascii?Q?j4EjnuM9nLeYLuNBSTTN8odxGv6R049jE9OouO6GSrS73w0TddyeFGY5Pyji?=
 =?us-ascii?Q?ehFUF0Sn+4xgollOUX3a5jrdB4+U5NUKXrhoqvBRW3jqwtIcsU7i2Pw3xG8J?=
 =?us-ascii?Q?LQ6fm/4KCxgxJAVBe2S3BAEXhgTRVwu3bhDJMiu/bzfOwLhZr/oPgUZT0A/+?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a239113e-7ff8-4c41-0477-08da852f601e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 17:46:15.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OG1wFxVVIWY14WSf7/UPiAXV0ve+KvFl44OdgwWx1lmsRtiu1QMsJoNsBdK8ZIytWCnM4/y83yz7Ds38vttLmnTIFeLwHv/C6+56DY462GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
X-Proofpoint-ORIG-GUID: VNuh5Qk1q7qaKCG6obszZEnq8X5TfBUP
X-Proofpoint-GUID: VNuh5Qk1q7qaKCG6obszZEnq8X5TfBUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 17:46:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169720

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
index bf9915294..0b934ee2d 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch \
            file://minicoredumper.service \
            file://minicoredumper.init \
+           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.33.0


