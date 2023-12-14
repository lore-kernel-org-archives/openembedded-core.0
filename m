Return-Path: <Sanjana.Venkatesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45129C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:18:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18872.1702549094338299714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LDZ+gw7A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0712efe949=sanjana.venkatesh@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE8QKLd016690
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 02:18:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=nm4ppWgjc6WYBk+o+V
	TzuNYek29GD1dygFWRMA0Gtsw=; b=LDZ+gw7AT6wqbNJFQdPxOsQB/wJyP+qgI4
	DsFuJsroStbh5+P8y50h93+s7wiid961xcUskKiDpMX8e7y6lWxmC3Q04meTflTS
	tigbt24aNGEk9dI0I5SjgtsNLG0PMz82XpAadastMS28fVxe6eKEiMwXe2f8DXN/
	vQfCYbjBLV+x9LiDQEiWyclzkW1pwVltrwpTTuE36aWCt9YAMGumfgLSPURYBPxi
	tMTINfXVZP9qsuAKBUTLM06st6T6NsqHrLjcMP5zm7mBpjwmz8Ppx4eumQDsTCSf
	qFERHuDV2JFfXy66HxjQG6dleOjK1F2uThu9vajpULihu8nOruGA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr9k0b1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 02:18:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pgs2tftS7f0DqGUlTSBZrPPjOyY1ZmgBeEacIoUvSHYg5J+QT8D3dJ9Fg+roP8z98aYAnz+Z1Lg4E1nWqtj3MfQ0IwTjcwgS8E4XA24kbdW/9rVicU2EiBa/7cvxonY42EGx5YvFnfUNnmaZ3OcWsiYgUI1dGErm0CCAhHfMmFh0IG6zu6vRVlvX7zxV8yUgkUrTExBAAKiKvEgcU0XJdjjT8ot5B0XH/3Y7JlJEkAAvFvcU+SfUgLzRGDU/cz86WsiNrfSYb/gpa+U7Cr4F0zSSIb20WeCbEBd03tWIqEQopTM/pJsjPVRldKvEIVKyu2SoT0w7OeMjXLzHRXO2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm4ppWgjc6WYBk+o+VTzuNYek29GD1dygFWRMA0Gtsw=;
 b=HBv5fl3jnFwFNibRtZpiWQ91rpeZ5gdwe0YKhuM6QduL/XnN3N7zAbWp+GaLvtqcrQyVLCqaxxrI0gheY4C64mXRbnP5Iz4CD2emFS/wYiswMmkt7T3O8Xx/FhqV2H6Yel/Y1TcKDJwO1vL4arXVretGW7rs8lD0gm/1UPIY3k1flgIuqBnYwylHzz5t4m5iiwTUDKgGXpgxIZ1VyP2WOCuNEdbqYh8ozU46l6lL3PzQHE9QTcV7jT1GMvhwQ5tBWZikI/caLBvVPgFs+t/0EBYBXfePl4yIYCz5JojKXoBvsqvljgOkojodHLzAynNfKDfy7vfmNFtKVE6wL5oR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.38; Thu, 14 Dec
 2023 10:18:10 +0000
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::e754:f759:8551:f0d0]) by SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::e754:f759:8551:f0d0%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:18:10 +0000
From: sanjana.venkatesh@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com,
        Sanjana <sanjana.venkatesh@windriver.com>
Subject: [kirkstone][PATCH] gdb: Fix CVE-2023-39129
Date: Thu, 14 Dec 2023 02:17:55 -0800
Message-ID: <20231214101755.1124580-1-sanjana.venkatesh@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To SJ2PR11MB8540.namprd11.prod.outlook.com
 (2603:10b6:a03:574::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8540:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cea1946-93ca-481d-c00e-08dbfc8df89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZIK33isQb7C8fbZY+vj0lMp6kO4OdtN5f/DCi2yZNDSl/WeEmSh+plfYa2OuYMCTv4+9YKkFTiupYFFSkTtIHoEBCWsb44jPy95TWfe5HV/kiuL7FGHgGk0rxEoFaHEH9GsG+hlJiZb+rNDRfQSvylXTrZ4l2x/dE1NcNT2B6cV27bGN8tIa9dMM6TvEBMUEd7ea99uzfsLfDBSRYgc8xbZMcrKJfMvkYxRODhp2M/vz5N3lApl7cSnpNf2OcsgwpV0xpppceEJLCyutDusUQdu4zq6H1kFp2n0jnbzuSLiebvXuVmVGNPrFOpMdpJgt8NVS6m1r+dezUFRYspxIVFylbiu2QBgFmyUxuDEL1e0wahnazd4h65+r0ZXIzjaaLl+1IzMPKCpbDP9j/M6FxqAVk/VhSEo6TZO6TgnaPrwwxQE0FD21H2EqPG/dq561FamQYnIflpcSZwsMs0WnOI99Symts2WqtY53440ERNP40VBdsK7qj2zMt5bWQctpKs3wnlY1Um3UBSevRqS8zw+Oirv6NkrdUlAeI7AmxuBrkz15rfgu09TSqYR1J6q7Lk2zfxnujHWPpHR1Muco3uOUNb+BarzRFKs01qkWfIw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(5660300002)(478600001)(966005)(6486002)(9686003)(6506007)(6512007)(6666004)(66556008)(6916009)(66476007)(52116002)(2906002)(66899024)(38350700005)(1076003)(2616005)(86362001)(26005)(36756003)(316002)(66946007)(107886003)(4326008)(8936002)(8676002)(41300700001)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C6oxbycVogFb8gyxBZ1ZfudrnfW5jMnpuddUMcO2Nel89b95EY2+d6sSwxwR?=
 =?us-ascii?Q?eARds6lPbnhDASU4+0rF7zL0MKVJy0t9NDgvlGpnsVgpygEJP3cO6zaMH7/9?=
 =?us-ascii?Q?/IKxNmNg9GO5Sje0KLjmJVvTiPkTlqtQ0bEQhxnDYApiiU23y5BRSk+zxI5a?=
 =?us-ascii?Q?jJuRla2v8y2ASElhXhxnYESv/3ZmILWkEnD8NQ/V6RN2aVCLnTehwtW77oz8?=
 =?us-ascii?Q?zg6k8C7vntvu9ovZ+jrEteoxfbBvCNygDGalNb5d+JSCa+XFkwzsDlR9lN9a?=
 =?us-ascii?Q?suXSgr7VV9JT4dND47NSF7slOA4z7kzeRVKxUbA53kCEeY0nGShcrdJSAEKH?=
 =?us-ascii?Q?0YUZgwTkG6knkfY5O2H377n+ygXikYRXQz6AJMAASnvpWlCxdAYJtmQxRfR0?=
 =?us-ascii?Q?zVAilgRWzOAGR9kyNLRUcuRidChrRup6zehhLEkoFZiLy6PMTUJk2/nJDoSo?=
 =?us-ascii?Q?B6aChNP4T2FEgq6BsMNXmy/KyoCzNhSKTkrRVpe9Wdrx9MBHu8Id6Rh1AM3L?=
 =?us-ascii?Q?nYECpoYQlQ3WzdGl+e59oCjE+KBMrfZeTwH8Cmj5Y5qYuCBtJJgV9HBo6jPx?=
 =?us-ascii?Q?MYHvkgbE3JsV6JTFJGfPp13BOMtLxVG7w3pCFC/iQJRR6wya5szyceO3RiUF?=
 =?us-ascii?Q?MGxv+LaARneASBsTkyVZru5kMvpQlhZsqRII9IZM2sIEGwAr+ZMuNrnkQkwA?=
 =?us-ascii?Q?7Ag5L0PmXMIKlYHKjg1eXHjZBQeeCuXWxWNQGtnSIkS11PvWOUfqMRVZlMbf?=
 =?us-ascii?Q?NzNbs+um0AltusduEpSr4dBTfggg40TCDy7d7NKkl/AuBMFtzjKiJo3IBwkB?=
 =?us-ascii?Q?wg0nE33FqafU4J2tJugeuNA6H7CVPjZLwVtowsHXKjFAdtxONklGS/0+31/2?=
 =?us-ascii?Q?xqlhkWGJD/LKGb5uXUck89QJohgwj2M7poUQOM8mnq9qyzyavUZkYs1VFcGy?=
 =?us-ascii?Q?lb9E3RPIwG1HS4lI2QJJwKnSU0I3INlXaJ4JDttGuaPl6bKR/snbEW8wqdL6?=
 =?us-ascii?Q?GEIc1yd3oKVovkJfHq2otVCRx3IdtA4iAJP8TPltWW3hcN74iTq63a+gvOwk?=
 =?us-ascii?Q?2r7k7PEBLwfTLL+M5TqCdfHhbkusTtRn0t+LLVotZbWMVtMAxFurZbXDvNtY?=
 =?us-ascii?Q?kqw+komAXCTOKVtt0uZ5QwEgTK2nTHd7RQHo2Zpng3YIW3uKt4ewTcga8Yau?=
 =?us-ascii?Q?wl8yJa1FcPApksil0xoR4Gn6N1k7hQbMyPHT2a5ntkAIFO59CRJ3Pr73p0UR?=
 =?us-ascii?Q?rDJMIfTc6OvSt1fbLe2wjFwp1NVq3zryRkbcbZExMDqQSQ/vQV0nxPG+eZUa?=
 =?us-ascii?Q?fIREw4lSwGxsQVw93D2eb3nERThV6ioUYaXulrPQaPCDIjGRij2Q1XAihQkw?=
 =?us-ascii?Q?S5ybC4GJqq+ETWbxi+ihiz9XRh4bWKvlRI8UvXCwNNByCOg2OFyTbDM8c5xE?=
 =?us-ascii?Q?27E8uFbGHFNIhpU9yuLeIaSpcxvQxbP9u/8p9nCWhwKeQGuzt3T0Nr+1sHyM?=
 =?us-ascii?Q?TblGQCMR0iPOfjogQb4EgYTSaW1kV+0fFLRJM+vLjf25v2dgtAhqppJR5o85?=
 =?us-ascii?Q?h5hYMdyWPynvelqrQfzJAFb0G4SahzQxaofrt6wCHVV7Ni23k6JnVKfvEPqt?=
 =?us-ascii?Q?xpKfJVR9Tz9ERqZgmLwBVbw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cea1946-93ca-481d-c00e-08dbfc8df89c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:18:09.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCfO8QLx3jNo4jGjOEGwp5IBx7GcB5csUdLVxJmzNTtWLqS5WMBjgHi1SRRZWUr1MmFvPjPVPLjxZuVROe+nBYWnD+7/3xG69ZohjMV2QVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
X-Proofpoint-ORIG-GUID: 3scAp_58AUx317UNsTHuxq1AIygogKxb
X-Proofpoint-GUID: 3scAp_58AUx317UNsTHuxq1AIygogKxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=972 mlxscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192346

From: Sanjana <sanjana.venkatesh@windriver.com>

Signed-off-by: Sanjana <sanjana.venkatesh@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0035-CVE-2023-39129.patch        | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 3787063cba..83dff20855 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -69,5 +69,6 @@ SRC_URI = "\
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
      file://0034-CVE-2022-48064.patch \
+     file://0035-CVE-2023-39129.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
new file mode 100644
index 0000000000..39d96a9d6f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
@@ -0,0 +1,51 @@
+From: Keith Seitz <keiths@redhat.com>
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
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+index f8e14d8ad93..ae7632d49cb 100644
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +159,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1304,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1324,9 @@ getsymname (struct internal_syment *symbol_entry)
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
2.42.0


