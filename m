Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E67C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:31:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.61302.1707136304089198120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JiHdqS6U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2765d7cc0f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415BdTQc003214
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 04:31:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=HEmKFMUzj5O5iV7eK6
	t0nU60d55eg2/Rz1k9SWBOMqc=; b=JiHdqS6UblZfKhWV6wXkxsiv2Z37fyPykc
	5vCHayDRpU5PynBgUj35v2MVgXqa1iPXoRCayaanmwE4DbvMRUHGFmPRxnLJrq/2
	OX29aKSlTajVq/eDpSx76u+whRLesMw2vPfkb46OpZxnEIJ9sGONixwUfkZggnbo
	vT7YqxA/X0LHpcYbiJBUCwr4C/9leY3/KMdidctG1BabU/XTGiRo6DN6mYrb4/+e
	yagco5P2Kb9ReyW2REn5nutARQIRMdfqqXEnXkaQ7FDFKaqT5NsL0xTHid3lnBm4
	jhb4SlPcHuwAi1cgI7kzkgghH84FJDgqodONzi2JZ0DQt6v9ODGA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm1e8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 04:31:43 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 415CVgHd032740
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 04:31:43 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm1e8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 04:31:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdeAvovZiisVR1Yjq5/koR13UQE6q+IFEH9GEnCia7n1yZJ5lrNFn/3JOngVINZrDk7iDaBLy1528tWHjiDsdREvZD6NXt9G3+E0EZv9pvnJmmhtSIxgFp6wNeKx9tuzHU7TkXwZDwlf1YiXlBiq1T14kBf9biCZb1weat1ttyXi1MPBltrp03ZP0a8erWCVMU5s7RXxsj3cz7iMxY0f0ArOsRZey1miZ83fr1FNId/KScQn2e7cgFbC/yAIRddfzcDAb451GItog8Hk+7cQFTXIMU8hEilYDhJkJQHFchRQVuki7QAyXVXOdA/4NIxGzY7HKENqDYIPFwEtjcB1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEmKFMUzj5O5iV7eK6t0nU60d55eg2/Rz1k9SWBOMqc=;
 b=cHc3voJNn1muMjRK3IZtzS+AeOfHkYGysrnSuNnBladmRTnFP6pul/VSCKmt0xXAsDIluIY8c/laLJTkIImUCnrOoJA+8iuc6Q6aOYvszWnPnACMy2/s8jSEMuM2+zAa0Cy1cUweG7oFXFAnGnulqHwYnsSw7fg6QgYdSN7c29dXzhvg9o96Zg1+3VO9KgnC56HjamWYfdlMP3G5vbn4fJANlaISRfGddNr2sOi5HstZrOQkVhFpQZU1zfk74Wh+KX8WCH41ZnmIgBJyRPCHPxtF+VTrsg5nDV262JxXJsz2EUW5W58/LGLVYanLsy6ph6qtzXs5W9l0BwaV5rTF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 12:31:39 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 12:31:39 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V4 1/2] gdb: Fix CVE-2023-39129
Date: Mon,  5 Feb 2024 04:31:09 -0800
Message-ID: <20240205123110.1898532-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: d407a088-b5fc-4dbe-b03c-08dc264666ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U+Ufc/s2X2sIA4ZYMQW0pxefgTA0X2y8YSKi8vdh3Vp+QqQVwc9ClzFt88/EyOf3cRW0g6Gxkh1hDkHfGtcvsaV6RzhqNvqHuC4cztmALu6z4BlPAKN1ZhDBA20rSGWUkb7Mw844xWpmOQIulwgrcJSG6I4OcYIzuiquPOyCQEOGz8RuxEfssPxq2RXlc5k0EvHIrZANf6OSqCnVCG4DEqTxTnOOCLdAPvdVK79nmM/aTiCsD0SFpd0OwzXHnPebHpOvNSynNY3jT8/DtQVwiOmXOnsOv7+6tuotnx4+S4Q6xZXHqQgLLHTNufJcdL2WM01Rd1AlTwlQmw/q3WRKduDl7K4ZmEtgB7l5rlTCH2Kisy/PvgGxxoX4gcf1cVzvz2MLc5nn5+laRAuUDKuNMmPQvBNS1e5FLy2GsfdQdvIkZls+LSyzlzUYybc5VnIJM8aOD7JHHJ2Avtlg2EQqgmiaNd49A40bOgfpKmUZTNGqEPNsMKxeXkzTnmGlNPZLQRL/sGT0TUvPgf8RjTRWLw8uClaPzo7ieE8TLuKOdUIny936wycZMFy9+TbdXT0su41RZe21AhELXOy+Rtjc29WaKMgZ5phmEL+MPjaB5Xk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(366004)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(86362001)(41300700001)(66899024)(1076003)(5660300002)(2906002)(9686003)(6512007)(52116002)(6506007)(6666004)(26005)(36756003)(38350700005)(66946007)(83380400001)(66476007)(6486002)(966005)(478600001)(316002)(2616005)(6916009)(66556008)(38100700002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RRrMHCottWFzCvfpklDJYx6lDYeLwUtirCfA6S7xuzsUTR/ROVOGhqqLIuTo?=
 =?us-ascii?Q?lGZl9C/i9WptTseRD763m73ObPnxwEVmSBTcaZ6ekRU9j9DB7WIuXtxHDHsd?=
 =?us-ascii?Q?tZn43NQYWiiMEg0poWpATJUO/3Hd40yLA24erIJknnRkIHX5yfM2ipJbyKEj?=
 =?us-ascii?Q?ChKRzKzflgn2PhfnfPibjz7RiYzFvUixjURE4SuQvuxi3Uz+alArejz7xcfT?=
 =?us-ascii?Q?n/BfD0527JpR/W3HoRyIQ6sCLAE9cK2xpqTD9ap4+3gsdVQs5ul9+XLHxRO/?=
 =?us-ascii?Q?0/ZEKRzflh7qG+XmXuIsHrRAyTGS1zDlkieIclhIqz6t0CA9NXMJjddos3Ub?=
 =?us-ascii?Q?GFIPTdcu/2nBYLZGqZUq9phSQz/gxoY3hFAZ+De/yoHCshED+Z8CznOelTai?=
 =?us-ascii?Q?3tTx9nxe33EdCcSTUQ5griD0Ih49E/+s2Z57spOQqipupxKBCW1PD0vGz5Ie?=
 =?us-ascii?Q?8TFnzLJozBTFFk9lLpd4XqNyMucMvB61uJqaiWp4SvmlKjg+WKoOXRvT1bdu?=
 =?us-ascii?Q?KOTecnogSt+vWvYC4rXGEYXHpXrgmiwdX7QP/JxiDXA/uFtqW6IkCp+dsMu0?=
 =?us-ascii?Q?HCC1Iz77P6GUqQ1FnPxISIielzA5jo+dYRwK2+g5+McNbDQmvQme+W8ksQaX?=
 =?us-ascii?Q?HwTfcwklyhTOel/DUnul0bTXtEKpvXYIrb1xD980qSoHJTh4MyXt0A3SWI5N?=
 =?us-ascii?Q?OhRKLU3Z0lpsMJvq0aOK2YbvHeap0kl66dOdCHBR/DaSVSx0V+mJ3ERmFxko?=
 =?us-ascii?Q?Kv1qsPUxKEEh6qxH2gsqw2TZqkOQfA0IYpgYMrYeZHVMZ7BygT+awDgvHEkQ?=
 =?us-ascii?Q?hKPRsFw8mcIlsto2pFLruFp6YQS73Z3eWuI8n1A7YWG+WRpfw4IPvxGwma98?=
 =?us-ascii?Q?/+8u6zg1FSagrd1nv5QeY7ebrrqsxzMjSsX769IbMr8BLGO9+RCZ1YtZk82i?=
 =?us-ascii?Q?JjqVSxOlBwaMaLJQ0jODS/3FjunfT6sGxQ6Jft+GGxGBrwp2Pvjv9cYNDq7d?=
 =?us-ascii?Q?cEM2mCgWsfAxv6RRZIJ18by0KDmdJfwB8M0NJas1cb3Sgsj7tbDm8asCSkOX?=
 =?us-ascii?Q?xETK58O+LrWVztgh0dgz5DSiUDtbULlh1Ibv9Q67efflGfUyCKRWd6QCg4Hg?=
 =?us-ascii?Q?NNawp6nDFOlUQt+KSn4bRiBe8dZbHyUgNwS/+NSo8hv5OJIfI1RPmq6rZKa7?=
 =?us-ascii?Q?abNcvZDM8lWtx2JiEnMew2+TQl7YiK2SO6eHme5THPmQZ9HFvbEFXx6PryPR?=
 =?us-ascii?Q?/q2SWKrR0kyUma94l/GPTnu7DjsLXEuBCGknbp1pZBgFDmHLvk0rqNmkxEHH?=
 =?us-ascii?Q?LyTwpYpastMTFp6nIR4OC5CBfzKDBNJqFKVfU13AME9RpzvqJooUl20l42++?=
 =?us-ascii?Q?xDZmZM7/HOwY3bA91LU8NJhoI3K9zt3hoH+Bim99x4m9BnZFdfY8P8/R5d1z?=
 =?us-ascii?Q?aBnlE3RYCfdN9jg47AsNi5oMUfFi7s+Gek5i81KQXhgXc9LnWXixNzVNregO?=
 =?us-ascii?Q?PmlEtAdn9xrBkZPaK59THU4WeWnrP52IHwRkMTV7YclLBGA6RsvqZcPL7QGQ?=
 =?us-ascii?Q?XdUgZAD+v1opmIaC8byoiecKMT/FwaB7nUgh2n+0Z6R6Q9XhCuGJsC6iU0P4?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d407a088-b5fc-4dbe-b03c-08dc264666ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 12:31:39.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5pWXoWK84Px+IYPmb56Hfe4SMNTORtAVagBSMSM/C4jvE+wrpsUJpQh13hinmM6ptEVe0hNVkZZ557WsIygP9YU62/8ezD9Mb/FpGkmiQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-Proofpoint-GUID: ugBFGdYhJrhxSBX2IxmUs359dy9ae0h_
X-Proofpoint-ORIG-GUID: KXFLYiGjJ9YThuQHUqtqMzD5I7FdDA2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_07,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 12:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194930

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39129
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

---

The commit replaces the internal issue number mentioned in the subject of version V3 with the cve number
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0012-CVE-2023-39129.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..ad2b3ad4b7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
+	   file://0012-CVE-2023-39129.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
@@ -0,0 +1,50 @@
+From: Keith Seitz <keiths@...>
+Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
+Subject: Verify COFF symbol stringtab offset
+X-Git-Tag: gdb-14-branchpoint~473
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a
+
+Verify COFF symbol stringtab offset
+
+This patch addresses an issue with malformed/fuzzed debug information that
+was recently reported in gdb/30639. That bug specifically deals with
+an ASAN issue, but the reproducer provided by the reporter causes a
+another failure outside of ASAN:
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a]
+
+CVE: CVE-2023-39129
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
+ 
+   if (symbol_entry->_n._n_n._n_zeroes == 0)
+     {
+-      /* FIXME: Probably should be detecting corrupt symbol files by
+-	 seeing whether offset points to within the stringtab.  */
++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
++	error (_("COFF Error: string table offset (%ld) outside string table (length %ld)"),
++	       symbol_entry->_n._n_n._n_offset, stringtab_length);
+       result = stringtab + symbol_entry->_n._n_n._n_offset;
+     }
+   else
-- 
2.43.0


