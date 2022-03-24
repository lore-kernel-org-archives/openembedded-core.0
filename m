Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5877C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 15:33:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.12336.1648135993396681530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YEE7J26N;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=008236cb41=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22OBwhNe027093
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 15:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=iTogSKqmlM+6spVWOXc+2GxzhQxpXjvXZ/Q86Ev+pkM=;
 b=YEE7J26N02uhu4/ycudRv4OlugR8+nNau2TNFgb2bNcSISYwkIsbq9x170XV243HSIPt
 SLFHsHBFhdezGElEo6W6XrMcOEIWgAtW2GuaepJ506ZviiLjDIKiOj+MdI5iUDu0zswa
 hOQvet4G1SzpHbKMcn1tWdSmDh5kwzZMWIjo2DeDI4ykGY556YKK5hG/H/1LnAcYhDB8
 egTreq37mJrOa82Cp6dtYJhgqLPNqapA5Avac1hcPC+eF+dtUkmdpd7t/FujQIIk2Pe6
 zCneJSOlw3UCU78LLVwPAd5LI3X4WKQXcdbVaiPUPxjygyBgl38Xp7Qc1HMkYIF3Wf4v dg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew4d04pxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 15:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyUcayUNhra0E6U081Cw8g6dJJOCIxQqjlwmaJyM4TveUKEfzta3KR+TSbfMZ/x2P1oEhVF6R8ADwK3tZYe5LaIX6XVNRHc9n1RClZ5pWeDw9Nq8scy1ALaTjLtXdhNdT5rwybwJV6N6MLD+nZSJqMtzMnQQfJA5QKu/r9/n7ogEcshwR6bEeJUsGLckBJgU5hSbXk9RU1iCujtz0yXM4pq5QD/utdwEuCglJRTKvx0YfVQX6OZH9ZXWyfisfuVgXOz+gpcyVi14vk4+gHaVfcQ6Wi41AQ6NszrUcF+y2t9z4fXXlPcdD9LEkK7fICRyF8+keqnvqsIyQ6Onsw/74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTogSKqmlM+6spVWOXc+2GxzhQxpXjvXZ/Q86Ev+pkM=;
 b=Q4SyzTxdbM03ZedYtTwIK7gtNa2ykZu+hm2yAcfeCbH3A+TtoNRxF7s7MbUD/UnsprqDNEu5mhYo+ZuOJfplgV6wf1GheA8zQzGrWyfJdAbgdPdD9qzwaiGxg9kPQRMg9r4M7agYQ2SWvQ9h/I7qatTr/On7kM580dUghAhLQ0PbS9rPztb5jkPn3TSO16Peli9ph7XTANYdIkiUv1qMPzPTxK3nz6lpziMNbrlr/zgUdoqRmDCypKwPB0id8ynHS1WbU7dw4fVy+uY1tg3QItMHPQIVCPUqGKTT2g1UZepIzkyn8mXRl1RhMZhRPdlogl11t5Sob71uJDujN/6Nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SN6PR11MB2957.namprd11.prod.outlook.com (2603:10b6:805:cd::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 15:33:09 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5102.016; Thu, 24 Mar 2022
 15:33:08 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] libxml2: Fix CVE-2022-23308
Date: Thu, 24 Mar 2022 08:32:57 -0700
Message-Id: <20220324153257.533-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ace5e84-2803-458f-6051-08da0dab991e
X-MS-TrafficTypeDiagnostic: SN6PR11MB2957:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2957606534FDDE99518DC93B88199@SN6PR11MB2957.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+3JmlyClH2VWOicwyGxhB4+zW8ngq0JpXuxrLcPYijnkQC1xMMiDC1qC9+I52Na39EC7Jw07wrak79nIaWNtPKadN2zz6mg+56+Xoa+Pf89BlWqttM+mJ8yyXQsmji+ifuuoYmn/ArEHOwuHAfYy+7E6/hw2lBi06+Y4Xc6ZZfYh7Cvk2HOrbBYPbW/F3hg555+oJRNxZZU8nmOdh3cnnEF5mtopsTNzDDiHxMrxYKBIuWnF816Z6tDdmTK/+MMIEohA18YngqhJr7s4SoK7+G4DOhWlGgLNcvcp9vWqt7+06ZNjd/O42LvZMh/RMOTyDij9TVPV65ZlgR7p1VPjwui+Diy+XdQ7Fb4ZkbOjugjMG+kjGaV4/bxm954z/Cl8sjnlVs9PRTmR1h62UmG0/YqJcVjd0tBgAcqQKER4AWeUdRsBp4D/zkom4EAXN+TlfmXrd3NIQSZqtm8RxCiXbVbji7+KDwOUd2VN6nPabyHLWtEqov/OqHuSeVy6UrFivrRQ+fqoV2/ICznC217xzKBw/bY4Q73giBl6y3tt9o5OuWQXMDA6WYRwVpMOrSWqR+YiGHXVjrQfz49+vVxDeXDfMoDXTQ9RluAO8NF5sZg6o1YB26k+3FjAaEe+NaGE6fMowvIVD1lQGKazpZ4wXPDjWlFAGIsMdXRHdE2b0cONYY6f5RVqOMB9P5/JN114oMfEfgNqCjcprnNdELjrw0WSUHR2PEhQrQSbaiPMS2KuvNCAsBvlCrIyvHFLiV5DbIYvrp7pP9hXFF5cSpT8WA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38100700002)(2906002)(86362001)(1076003)(6916009)(107886003)(26005)(44832011)(52116002)(5660300002)(186003)(6506007)(36756003)(6512007)(508600001)(6666004)(66556008)(8936002)(83380400001)(8676002)(66946007)(66476007)(38350700002)(2616005)(4326008)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I78jmBvyBuGvwFAUpiO0zBmOEvPV8NSA+jsysOBUwG/edndYYPg7idOo68k1?=
 =?us-ascii?Q?jT9vMnmMsvE9t/Oi3X8pumz8Sa2pGmtOAXA1NEhE2YFoUMtMSCOezMnXUYBi?=
 =?us-ascii?Q?AKWyKO+gabuDNEVzilRp0FCnPKEO4p3YgAAaXREhzqnvqT1oZBH0UYqFjCQt?=
 =?us-ascii?Q?vAK1R11CgelvwHMkd097eg3U+2oXoXbUQcFF5RMYnuuDMjyZgLdORCauLvnf?=
 =?us-ascii?Q?5XpAYuq82dF4s4+ldTQ42omqNcmd/toCLlj33QEd7tDiVaOe21qWPnnm3rMl?=
 =?us-ascii?Q?zwaGzOQzmHMHGOg3AxOnUfQ+L/faP8e9ifphe1qqdRQkaGOXmXaytLnPfxU0?=
 =?us-ascii?Q?Y6NlGbXtF9t/WU4aQK/uvx1bCbmis69HfnoLHlnOcHAn0zPCdN1CHKtnVPO+?=
 =?us-ascii?Q?7x9mH0o7lH/lTu61LTZBYX56srhuzwaKO2ueQ0zhO6di8ndK3ooobGoEZBUL?=
 =?us-ascii?Q?i4cQBrWoZpHs+f+cy37jpl3Nwj4oQcpc0+Y7g0PmeNQDjDjbCmmFStWwWpcb?=
 =?us-ascii?Q?86sJPrtArC2gjHWYbr2bKsZLgON0Qdx+mv/oM297Vz5wg/iWKBtiNQuDM82h?=
 =?us-ascii?Q?3ummSgw97BHWiibqYSpowZu+A+sZtZSqBXSGyrNyuScKWbqP+wSmgeqJKsWx?=
 =?us-ascii?Q?mXZHjoO7P32iWmzRC/fB/hpIfu3Yx8022dizX595IbDFO2W6c67izA6eXXPT?=
 =?us-ascii?Q?ZmRnXYCiB04ms+7ylnmP/YpbxKImfzMTwVYb6dvEShgBhbQz2fG0MdL1hq9r?=
 =?us-ascii?Q?WhIcYFXyYJ5EMHzrxHbKOJ1uCNltvMG6729s20o+qaoOJ1rV2zXOo3h/iU9p?=
 =?us-ascii?Q?85wtjqYEmW0qzsEbDSMamMZVYzhNvN/lq2na47f46KRRy7CGsB9golMI4tMK?=
 =?us-ascii?Q?r4CnVVEMsYm+ivmIzEckUgwFFzbC6zYST23tpAVra7UPZAFDUpV6C13sV1az?=
 =?us-ascii?Q?B/NfYuCO99Svr+lfxKwX1Jqi9PgYbP5IJQ5ov0I9STW+y8W+RqZ38P+QASlp?=
 =?us-ascii?Q?nhzGvV8sSdJRWRMDp60PEcnDWQmQ47UTjF+oFeAanRd/XvVp+3XAVyD8z81Y?=
 =?us-ascii?Q?pyJER5gK2E1M99YskyKBGi3RTyX/6wz42piwLFuoHjMIyZUxN+a9v7vg34yv?=
 =?us-ascii?Q?CnWWbpZCiCwVZfKY62EsCGVywjrKDP7+YlvWOOfSWgt2N1Hxc8Hc4JSXMFIl?=
 =?us-ascii?Q?blI3fpkMhaxFbSW1uLNzuBopQqE6uVkhTkS2R9LF9dl5LPWny4FQXa1Juaay?=
 =?us-ascii?Q?y6Nk5YOAjoJcFVsOErs48Pkt4wOcR4HdLhq4BSVQNb8aKCSCWT9jY3Jd4p9E?=
 =?us-ascii?Q?Csf0fW0MADPVlHiocv3Z8ubARiujJ0GZ12kEwJKvr8Qm+LtB26lY1GshTSqu?=
 =?us-ascii?Q?xhSfQpOE9n9R1+2VORvzpHgBUcJRIyjaSqVSMnx6UWLcjbcQe5GkE6wpi6sI?=
 =?us-ascii?Q?vg68AqERaO9eenqriYC29LWda6Z7q/vCU58kMjaQY/FjP86yWHc7sQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ace5e84-2803-458f-6051-08da0dab991e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:33:08.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YbQQ/g0l2QyeLJjqTEPOgQ9eej1qdVlvVX3VSMZd9ixB+QOdKT2Y6gy/ea78jc8k3hs8fg0HuaUaD6CnGchKrNH3wp5mJYh0Yeva/H64Me0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2957
X-Proofpoint-GUID: Jw_hH9V0MgEZOMYt9A-Lud3a7z3SYiB2
X-Proofpoint-ORIG-GUID: Jw_hH9V0MgEZOMYt9A-Lud3a7z3SYiB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=569 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 15:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163616

The first patch is the fix in version 2.9.13.  The second
patch was added later and fixes a regression introduced
by the first.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../CVE-2022-23308-fix-regression.patch       |  99 +++++++++
 .../libxml/libxml2/CVE-2022-23308.patch       | 209 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 3 files changed, 310 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
new file mode 100644
index 0000000000..eefecb9adb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
@@ -0,0 +1,99 @@
+From 646fe48d1c8a74310c409ddf81fe7df6700052af Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 22 Feb 2022 11:51:08 +0100
+Subject: [PATCH] Fix --without-valid build
+
+Regressed in commit 652dd12a.
+---
+ valid.c | 58 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+---
+
+From https://github.com/GNOME/libxml2.git
+ commit 646fe48d1c8a74310c409ddf81fe7df6700052af
+
+CVE: CVE-2022-23308
+Upstream-status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/valid.c b/valid.c
+index 8e596f1d..9684683a 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,35 +479,6 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
+-/**
+- * xmlValidNormalizeString:
+- * @str: a string
+- *
+- * Normalize a string in-place.
+- */
+-static void
+-xmlValidNormalizeString(xmlChar *str) {
+-    xmlChar *dst;
+-    const xmlChar *src;
+-
+-    if (str == NULL)
+-        return;
+-    src = str;
+-    dst = str;
+-
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
+-}
+-
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2636,6 +2607,35 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ static int
+ xmlIsStreaming(xmlValidCtxtPtr ctxt) {
+     xmlParserCtxtPtr pctxt;
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
new file mode 100644
index 0000000000..708a98b45a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
@@ -0,0 +1,209 @@
+From 652dd12a858989b14eed4e84e453059cd3ba340e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 8 Feb 2022 03:29:24 +0100
+Subject: [PATCH] [CVE-2022-23308] Use-after-free of ID and IDREF attributes
+
+If a document is parsed with XML_PARSE_DTDVALID and without
+XML_PARSE_NOENT, the value of ID attributes has to be normalized after
+potentially expanding entities in xmlRemoveID. Otherwise, later calls
+to xmlGetID can return a pointer to previously freed memory.
+
+ID attributes which are empty or contain only whitespace after
+entity expansion are affected in a similar way. This is fixed by
+not storing such attributes in the ID table.
+
+The test to detect streaming mode when validating against a DTD was
+broken. In connection with the defects above, this could result in a
+use-after-free when using the xmlReader interface with validation.
+Fix detection of streaming mode to avoid similar issues. (This changes
+the expected result of a test case. But as far as I can tell, using the
+XML reader with XIncludes referencing the root document never worked
+properly, anyway.)
+
+All of these issues can result in denial of service. Using xmlReader
+with validation could result in disclosure of memory via the error
+channel, typically stderr. The security impact of xmlGetID returning
+a pointer to freed memory depends on the application. The typical use
+case of calling xmlGetID on an unmodified document is not affected.
+---
+ result/XInclude/ns1.xml.rdr |  2 +-
+ valid.c                     | 88 +++++++++++++++++++++++--------------
+ 2 files changed, 56 insertions(+), 34 deletions(-)
+ ---
+ 
+From https://github.com/GNOME/libxml2.git
+ commit 652dd12a858989b14eed4e84e453059cd3ba340e
+
+Remove patch to ns1.xml.rdr which does not exist in version 2.9.10.
+
+CVE: CVE-2022-23308
+Upstream-status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/valid.c b/valid.c
+index 5ee391c0..8e596f1d 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,6 +479,35 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2607,6 +2636,24 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++static int
++xmlIsStreaming(xmlValidCtxtPtr ctxt) {
++    xmlParserCtxtPtr pctxt;
++
++    if (ctxt == NULL)
++        return(0);
++    /*
++     * These magic values are also abused to detect whether we're validating
++     * while parsing a document. In this case, userData points to the parser
++     * context.
++     */
++    if ((ctxt->finishDtd != XML_CTXT_FINISH_DTD_0) &&
++        (ctxt->finishDtd != XML_CTXT_FINISH_DTD_1))
++        return(0);
++    pctxt = ctxt->userData;
++    return(pctxt->parseMode == XML_PARSE_READER);
++}
++
+ /**
+  * xmlFreeID:
+  * @not:  A id
+@@ -2650,7 +2697,7 @@ xmlAddID(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value,
+     if (doc == NULL) {
+ 	return(NULL);
+     }
+-    if (value == NULL) {
++    if ((value == NULL) || (value[0] == 0)) {
+ 	return(NULL);
+     }
+     if (attr == NULL) {
+@@ -2681,7 +2728,7 @@ xmlAddID(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value,
+      */
+     ret->value = xmlStrdup(value);
+     ret->doc = doc;
+-    if ((ctxt != NULL) && (ctxt->vstateNr != 0)) {
++    if (xmlIsStreaming(ctxt)) {
+ 	/*
+ 	 * Operating in streaming mode, attr is gonna disappear
+ 	 */
+@@ -2820,6 +2867,7 @@ xmlRemoveID(xmlDocPtr doc, xmlAttrPtr attr) {
+     ID = xmlNodeListGetString(doc, attr->children, 1);
+     if (ID == NULL)
+         return(-1);
++    xmlValidNormalizeString(ID);
+ 
+     id = xmlHashLookup(table, ID);
+     if (id == NULL || id->attr != attr) {
+@@ -3009,7 +3057,7 @@ xmlAddRef(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value,
+      * fill the structure.
+      */
+     ret->value = xmlStrdup(value);
+-    if ((ctxt != NULL) && (ctxt->vstateNr != 0)) {
++    if (xmlIsStreaming(ctxt)) {
+ 	/*
+ 	 * Operating in streaming mode, attr is gonna disappear
+ 	 */
+@@ -4028,8 +4076,7 @@ xmlValidateAttributeValue2(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+ xmlChar *
+ xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+ 	     xmlNodePtr elem, const xmlChar *name, const xmlChar *value) {
+-    xmlChar *ret, *dst;
+-    const xmlChar *src;
++    xmlChar *ret;
+     xmlAttributePtr attrDecl = NULL;
+     int extsubset = 0;
+ 
+@@ -4070,19 +4117,7 @@ xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+     ret = xmlStrdup(value);
+     if (ret == NULL)
+ 	return(NULL);
+-    src = value;
+-    dst = ret;
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
++    xmlValidNormalizeString(ret);
+     if ((doc->standalone) && (extsubset == 1) && (!xmlStrEqual(value, ret))) {
+ 	xmlErrValidNode(ctxt, elem, XML_DTD_NOT_STANDALONE,
+ "standalone: %s on %s value had to be normalized based on external subset declaration\n",
+@@ -4114,8 +4149,7 @@ xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+ xmlChar *
+ xmlValidNormalizeAttributeValue(xmlDocPtr doc, xmlNodePtr elem,
+ 			        const xmlChar *name, const xmlChar *value) {
+-    xmlChar *ret, *dst;
+-    const xmlChar *src;
++    xmlChar *ret;
+     xmlAttributePtr attrDecl = NULL;
+ 
+     if (doc == NULL) return(NULL);
+@@ -4145,19 +4179,7 @@ xmlValidNormalizeAttributeValue(xmlDocPtr doc, xmlNodePtr elem,
+     ret = xmlStrdup(value);
+     if (ret == NULL)
+ 	return(NULL);
+-    src = value;
+-    dst = ret;
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
++    xmlValidNormalizeString(ret);
+     return(ret);
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index cabf911816..778312f662 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -30,6 +30,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2021-3518-0002.patch \
            file://CVE-2021-3537.patch \
            file://CVE-2021-3541.patch \
+           file://CVE-2022-23308.patch \
+           file://CVE-2022-23308-fix-regression.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.35.1


