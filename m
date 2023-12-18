Return-Path: <Sanjana.Venkatesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C706C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 07:41:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.39650.1702885292423564605
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M/QaanDB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0716da4c23=sanjana.venkatesh@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI6lhlc013151
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=gnT3sJBeL87VR1oDBM
	73x/995Z+G7+QKZtqyFsJmRfo=; b=M/QaanDByksHFeh3XfJXMBtxaLfSzf+rx5
	FfT+WML1U91U9RqKFnSrg6v7ltuWd8JRZfqIEN2M8xOGN314VXzGOeGOk3TxsN8o
	KjtV0vbc1IlDyiAYyYVKfY2odcDeIm1gmSP2LmEYYoPP9EvMj0BvtIzIZwoeURgt
	TrAeabX5xvGQySvXklSK76coh8YgVgtnyroRWkQ3cBn4N4Vr9P3MFV+FCoY5t7MI
	SrGNvM7vANd5N7twFeJWX1OnZCQfk0hgGR73XNIgwQ/Atp1uGwTSsK5ExL1WmkDh
	lzYbd1Lljqs+P7/EL4nHzbQHQdMwB0XLUXpFAhjNDGDQaFY+VVgw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5snsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:41:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFPOQwNmkzBVZl2Uz9/PvHr7bx/995NChtkTnpvV4ECliAjMDJh5o/2o/w5GrqgTFzVGgZa218AkQOBpW60URcKuXxdNsbD0sILF8MQcf52fx4S0RiZKdybJbAUGucTehIZDrkASOBhhmj1JRWN2MePMYhS82+c5bNXS5A4FiiRtEMFoGL6u3/bP947BQxWpYcwCYsu+0HZNsxxKUIvo6P8Wg4epEMw5KHo4wTicQZJ9cSuf7so2JDY/JQRJLMnlXM99k1AefZISgHkfrzZKK3CLKVwUPi0ielnlBlOfqOpbF8M//B+indbs2TcPJA5VDe1sYog01SlzRKjpCGr+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnT3sJBeL87VR1oDBM73x/995Z+G7+QKZtqyFsJmRfo=;
 b=gS/rqrAaXhoFZWtQjpP407GkoLtxXj6n5FM5VGCRIuE7y8SSzIOnmqosvseW2EOZ5pNBXxHaaNTZ4rsfn0Rc598Fn8vn5Bu4aOC6CpoRsBJDVtiOSs2d/RD1RIYBvQVJuQJwbZvjzSW9zdOzyS+PiOjNdGjnFDn/GhQ68QJGjP7VcMp7OrQPtrjf91DoMhkCPzth73TK7O4QLobsDeEmnxoHoHTcXhkNA6c2MBGcT28xGS4jKrmX5gulwDqB0Wji/Yq55gwa1WRWaNI1CfsSzr/DjlPNSg6el418bYcVVnRciaYm2+MQWu/XssGjWSLu9k8t3OeVpD1vHsOU/bYe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 07:41:26 +0000
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::e754:f759:8551:f0d0]) by SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::e754:f759:8551:f0d0%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 07:41:26 +0000
From: sanjana.venkatesh@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com,
        Sanjana <sanjana.venkatesh@windriver.com>
Subject: [kirkstone][PATCH] gdb: Fix CVE-2023-39130
Date: Sun, 17 Dec 2023 23:41:03 -0800
Message-ID: <20231218074103.2583708-1-sanjana.venkatesh@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To SJ2PR11MB8540.namprd11.prod.outlook.com
 (2603:10b6:a03:574::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8540:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: e226097d-f5d0-4dcc-1cb7-08dbff9cbc9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2o7dK03Gr3b8BDEZ9YE1xg2PYsUluHwCMHeJvQ23eHDGRW/e5SQ9ZyUp+imyKRP7BBgflLk+s5pFaROLHPO6icPZIm+4OCt91z9R2WeCdmw7Iu5RMzunBZ0qufCwRxjAwojPVsiu/XmC0CEPZcfuRaVYcqNfaCf4nPnfyL6CHlpajN8O8GNMLuoV/tmIc3LiLqmyZyLfaHdnw1lqhiO1cGOqoryTlGGqOJHFeZSNkqojcfImNCB2ACp7yRTA3Yi7Pt2LJRFrr09sG5ymuOogyBqdEZbFslKd0LCCIBNEXEnTeC28AULVRAbYLM9Hzb7iurZ3ar1WvQuu7UnzQ0sk1cuBa3qb6plJw9l0pIo+aiwDqGSVsq0sIGow12bLHjgvs/K6orZs9b3QqIg+5EA6NlPOF/ZwFqbKNV5CLFZWy7vv1qn6gWWCHiNLOBImfu6qHGlqe6BjMNiiWf868lDzp4PyceVqI+5vDaX7hbIGk8OKDOD3W8TyjyrElwtyULw6puVJA+A96sfsu9hlHilikZgdRcX25gAwbRpuWnZ9ZuwTN0cB9ZoUFIaAKn70OaF+4ghSRJxsWuxaomilpIMC+Y7QsdanEUQxmEBCA64vprdBkj0BA0MnnZqIpAcZfckptAMVwKIXEEd5wxPhEnsTRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39840400004)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(26005)(107886003)(2616005)(1076003)(9686003)(52116002)(6666004)(6512007)(6506007)(38350700005)(38100700002)(36756003)(86362001)(8936002)(8676002)(4326008)(5660300002)(478600001)(2906002)(30864003)(83380400001)(41300700001)(6486002)(316002)(966005)(66946007)(66556008)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gl4cUriXEG23c3AcQxL7rqkjY72BtWkARoqfQ1nW1F0dR2AqV1APDcL+W/Qn?=
 =?us-ascii?Q?J9HJBmthmbI6GcwDGB8KXr6XMfl55O9ZkPZFg1PMCUXmYCzhJrXXzweXvyjA?=
 =?us-ascii?Q?L1xJ64hAaMVajBjFmnOGDHpqdV0U9n5lusWyMI+CiIlJ0Lg3kHKyQsW89CZV?=
 =?us-ascii?Q?RBUi+m+KjQ0vyHyb4Rcup3nBLKVCzp4lwdmJ3aXJ2fn0xPwof+ACOxS7GhA8?=
 =?us-ascii?Q?bxI5odclHUGoxtNKPI2Li7MKYaGSLEJM9Se0CIcxe9m5ZgUlc0Cj2OwZaXu6?=
 =?us-ascii?Q?A4w+VumyKPf/izq4djImZ5tw5Od5QKbSO4AOEj6dPfZX8qKAllhOMBAmuiXO?=
 =?us-ascii?Q?6j/m7Kzwf3h4tjcZcF+R9GkPdhEcUxX9rFceteMYc+IUReSyZoJqj619r5se?=
 =?us-ascii?Q?iZzTSkseGDYvzR//shF6Ztx/aVz3OsIa4msreAv2ZATEG3dyGrF3w1MA6TJH?=
 =?us-ascii?Q?hDlGpHtPQBHQZmJBDYKzW3qE2gCpuZZ0o6vP91BCtJ+KoETl5Ezz+Eer+Mt7?=
 =?us-ascii?Q?AO55bF81Ks/NhIcHJ9S6z+fsazo97T+YyILA/2avBmy/uj5lI9KZp5hoklg3?=
 =?us-ascii?Q?b3zZNTX+l+ZilvoJ/5LKhvwTWLrzXdlP9qvjRnnYDpaX5KJusCvxPqD5QSAK?=
 =?us-ascii?Q?lwLwIkV9SqslC8W4vBebkzlT2ML3V+x/LumItkwl6Bzsss9afZWyrS0co2ox?=
 =?us-ascii?Q?/Ewsn/gAnRpx6q7acPiwGRwrUAPpRvbGFPTgR4ryzxiRNMNLXmh8TatsvULu?=
 =?us-ascii?Q?OuNVuwF5LXm4gfmpuOFh8HpOVf4+faYlX+G337SdVqqIQipAbTcE9u9JnSBL?=
 =?us-ascii?Q?mQqXnsetMNQeVS/GadygWGyTsphwJJvjc/Fm9a7HtSO0iPrBlsnjoUxPCW/x?=
 =?us-ascii?Q?Pxi7bIj3OBOH8+aL012E/YqzLC4QD3W8j0rf5aeiXJX2L1E64paQE9gKH3kN?=
 =?us-ascii?Q?Gl0sBnP87+NEBi5vLWMtAjmTRIpaiMm8qawMr3clOYfyLV5LPEI5Id3HjPYi?=
 =?us-ascii?Q?gZkU16IYaHyqeDojsaau8oz9adVKaz6b6htqLM97IruIH0DnKNlSSW7wIR2O?=
 =?us-ascii?Q?d/pM2sRIB8Eyt2aaWvZB2oXr9vrL2+CezGtadrNFpvZC24pr/nAXcOPupsyA?=
 =?us-ascii?Q?C/hAxve+bT2ETKAdYHpq5HN02TEpWWCV3jW2eOahn+ylnrllqJxLJpd5LRDd?=
 =?us-ascii?Q?c03FZd9TRxrClwImBlAThTcVAOG7oQCVpQfwdKuD/4jxfVcjQqftLbe+vzK7?=
 =?us-ascii?Q?qCwUGKs4RYoIwowRmIHqNesdFW7tB921AlHaaHTbeio0ic0bAQYEtR1HN2LL?=
 =?us-ascii?Q?WffgzYSJA52g2RNef6QNPT8pXa23sDEOAvLGG8XefI03QRbwyOSurwMEP2Gy?=
 =?us-ascii?Q?tti3EPKX0e9u6UV9u8HFbjTgWZ/1eEZCIkwvLLKncYjX1GtpYeTQpaQGQQcE?=
 =?us-ascii?Q?MKohMUpca6STQl1YeHeN/D1EyCA8QTe1+AmGI0z/RpvyDSDx8FKRv7xZUvG6?=
 =?us-ascii?Q?a5TdYsQrxgCCaiFf3wwJh6lP8HaJUPDsXcsiEe0/+/KJrZXCXjEiRqk/UGG0?=
 =?us-ascii?Q?l12jPsZabHMNnkwNwIl5RmazJYcnjvJGRM4Bxzjz6JtFXkE+9B+/d6upHji4?=
 =?us-ascii?Q?3dD00lqGDiekAMNNxrQlhwA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e226097d-f5d0-4dcc-1cb7-08dbff9cbc9c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 07:41:25.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VMLn9cwBOpjly8Zguoyz4sD0BHslwcXMYufpo+HuhCMCOagmBSq8D97ewVN9ujGX8CXBGqQa0pdycSG2Pjg3mGrFXQTwOsxX+ioBg0kokA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
X-Proofpoint-ORIG-GUID: g6nWk3zZY1TmvrR89hNvuWP3mpeRUgWS
X-Proofpoint-GUID: g6nWk3zZY1TmvrR89hNvuWP3mpeRUgWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312180054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192608

From: Sanjana <sanjana.venkatesh@windriver.com>

Issue: LIN1022-4855

Signed-off-by: Sanjana <sanjana.venkatesh@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0013-CVE-2023-39130.patch         | 328 ++++++++++++++++++
 2 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..62b813d5cb 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
+           file://0013-CVE-2023-39130.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
new file mode 100644
index 0000000000..9cf6645c58
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
@@ -0,0 +1,328 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Aug 2023 00:28:36 +0000 (+0930)
+Subject: gdb: warn unused result for bfd IO functions
+X-Git-Tag: gdb-14-branchpoint~669
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80
+
+gdb: warn unused result for bfd IO functions
+
+This fixes the compilation warnings introduced by my bfdio.c patch.
+
+The removed bfd_seeks in coff_symfile_read date back to 1994, commit
+7f4c859520, prior to which the file used stdio rather than bfd to read
+symbols.  Since it now uses bfd to read the file there should be no
+need to synchronise to bfd's idea of the file position.  I also fixed
+a potential uninitialised memory access.
+
+Approved-By: Andrew Burgess <aburgess@redhat.com>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80]
+
+CVE: CVE-2023-39130
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/gdb/coff-pe-read.c b/gdb/coff-pe-read.c
+index b82b43c84cf..0d76ebdbfce 100644
+--- a/gdb/coff-pe-read.c
++++ b/gdb/coff-pe-read.c
+@@ -254,23 +254,31 @@ read_pe_truncate_name (char *dll_name)
+ 
+ /* Low-level support functions, direct from the ld module pe-dll.c.  */
+ static unsigned int
+-pe_get16 (bfd *abfd, int where)
++pe_get16 (bfd *abfd, int where, bool *fail)
+ {
+   unsigned char b[2];
+ 
+-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
+-  bfd_read (b, (bfd_size_type) 2, abfd);
++  if (bfd_seek (abfd, where, SEEK_SET) != 0
++      || bfd_read (b, 2, abfd) != 2)
++    {
++      *fail = true;
++      return 0;
++    }
+   return b[0] + (b[1] << 8);
+ }
+ 
+ static unsigned int
+-pe_get32 (bfd *abfd, int where)
++pe_get32 (bfd *abfd, int where, bool *fail)
+ {
+   unsigned char b[4];
+ 
+-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
+-  bfd_read (b, (bfd_size_type) 4, abfd);
+-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
++  if (bfd_seek (abfd, where, SEEK_SET) != 0
++      || bfd_read (b, 4, abfd) != 4)
++    {
++      *fail = true;
++      return 0;
++    }
++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
+ }
+ 
+ static unsigned int
+@@ -286,7 +294,7 @@ pe_as32 (void *ptr)
+ {
+   unsigned char *b = (unsigned char *) ptr;
+ 
+-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
+ }
+ 
+ /* Read the (non-debug) export symbol table from a portable
+@@ -335,37 +343,50 @@ read_pe_exported_syms (minimal_symbol_reader &reader,
+ 	     || strcmp (target, "pei-i386") == 0
+ 	     || strcmp (target, "pe-arm-wince-little") == 0
+ 	     || strcmp (target, "pei-arm-wince-little") == 0);
++
++  /* Possibly print a debug message about DLL not having a valid format.  */
++  auto maybe_print_debug_msg = [&] () -> void {
++    if (debug_coff_pe_read)
++      gdb_printf (gdb_stdlog, _("%s doesn't appear to be a DLL\n"),
++		  bfd_get_filename (dll));
++  };
++
+   if (!is_pe32 && !is_pe64)
+-    {
+-      /* This is not a recognized PE format file.  Abort now, because
+-	 the code is untested on anything else.  *FIXME* test on
+-	 further architectures and loosen or remove this test.  */
+-      return;
+-    }
++    return maybe_print_debug_msg ();
+ 
+   /* Get pe_header, optional header and numbers of export entries.  */
+-  pe_header_offset = pe_get32 (dll, 0x3c);
++  bool fail = false;
++  pe_header_offset = pe_get32 (dll, 0x3c, &fail);
++  if (fail)
++    return maybe_print_debug_msg ();
+   opthdr_ofs = pe_header_offset + 4 + 20;
+   if (is_pe64)
+-    num_entries = pe_get32 (dll, opthdr_ofs + 108);
++    num_entries = pe_get32 (dll, opthdr_ofs + 108, &fail);
+   else
+-    num_entries = pe_get32 (dll, opthdr_ofs + 92);
++    num_entries = pe_get32 (dll, opthdr_ofs + 92, &fail);
++  if (fail)
++    return maybe_print_debug_msg ();
+ 
+   if (num_entries < 1)		/* No exports.  */
+     return;
+   if (is_pe64)
+     {
+-      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 112);
+-      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 116);
++      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 112, &fail);
++      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 116, &fail);
+     }
+   else
+     {
+-      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 96);
+-      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 100);
++      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 96, &fail);
++      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 100, &fail);
+     }
+-  nsections = pe_get16 (dll, pe_header_offset + 4 + 2);
++  if (fail)
++    return maybe_print_debug_msg ();
++
++  nsections = pe_get16 (dll, pe_header_offset + 4 + 2, &fail);
+   secptr = (pe_header_offset + 4 + 20 +
+-	    pe_get16 (dll, pe_header_offset + 4 + 16));
++	    pe_get16 (dll, pe_header_offset + 4 + 16, &fail));
++  if (fail)
++    return maybe_print_debug_msg ();
+   expptr = 0;
+   export_size = 0;
+ 
+@@ -374,12 +395,13 @@ read_pe_exported_syms (minimal_symbol_reader &reader,
+     {
+       char sname[8];
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+-      unsigned long vsize = pe_get32 (dll, secptr1 + 16);
+-      unsigned long fptr = pe_get32 (dll, secptr1 + 20);
++      unsigned long vaddr = pe_get32 (dll, secptr1 + 12, &fail);
++      unsigned long vsize = pe_get32 (dll, secptr1 + 16, &fail);
++      unsigned long fptr = pe_get32 (dll, secptr1 + 20, &fail);
+ 
+-      bfd_seek (dll, (file_ptr) secptr1, SEEK_SET);
+-      bfd_read (sname, (bfd_size_type) sizeof (sname), dll);
++      if (fail
++	  || bfd_seek (dll, secptr1, SEEK_SET) != 0
++	  || bfd_read (sname, sizeof (sname), dll) != sizeof (sname))
+ 
+       if ((strcmp (sname, ".edata") == 0)
+ 	  || (vaddr <= export_opthdrrva && export_opthdrrva < vaddr + vsize))
+@@ -420,16 +442,18 @@ read_pe_exported_syms (minimal_symbol_reader &reader,
+   for (i = 0; i < nsections; i++)
+     {
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vsize = pe_get32 (dll, secptr1 + 8);
+-      unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+-      unsigned long characteristics = pe_get32 (dll, secptr1 + 36);
++      unsigned long vsize = pe_get32 (dll, secptr1 + 8, &fail);
++      unsigned long vaddr = pe_get32 (dll, secptr1 + 12, &fail);
++      unsigned long characteristics = pe_get32 (dll, secptr1 + 36, &fail);
+       char sec_name[SCNNMLEN + 1];
+       int sectix;
+       unsigned int bfd_section_index;
+       asection *section;
+ 
+-      bfd_seek (dll, (file_ptr) secptr1 + 0, SEEK_SET);
+-      bfd_read (sec_name, (bfd_size_type) SCNNMLEN, dll);
++      if (fail
++	  || bfd_seek (dll, secptr1 + 0, SEEK_SET) != 0
++	  || bfd_read (sec_name, SCNNMLEN, dll) != SCNNMLEN)
++	return maybe_print_debug_msg ();
+       sec_name[SCNNMLEN] = '\0';
+ 
+       sectix = read_pe_section_index (sec_name);
+@@ -468,8 +492,9 @@ read_pe_exported_syms (minimal_symbol_reader &reader,
+   gdb::def_vector<unsigned char> expdata_storage (export_size);
+   expdata = expdata_storage.data ();
+ 
+-  bfd_seek (dll, (file_ptr) expptr, SEEK_SET);
+-  bfd_read (expdata, (bfd_size_type) export_size, dll);
++  if (bfd_seek (dll, expptr, SEEK_SET) != 0
++      || bfd_read (expdata, export_size, dll) != export_size)
++    return maybe_print_debug_msg ();
+   erva = expdata - export_rva;
+ 
+   nexp = pe_as32 (expdata + 24);
+@@ -626,20 +651,27 @@ pe_text_section_offset (struct bfd *abfd)
+     }
+ 
+   /* Get pe_header, optional header and numbers of sections.  */
+-  pe_header_offset = pe_get32 (abfd, 0x3c);
+-  nsections = pe_get16 (abfd, pe_header_offset + 4 + 2);
++  bool fail = false;
++  pe_header_offset = pe_get32 (abfd, 0x3c, &fail);
++  if (fail)
++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
++  nsections = pe_get16 (abfd, pe_header_offset + 4 + 2, &fail);
+   secptr = (pe_header_offset + 4 + 20 +
+-	    pe_get16 (abfd, pe_header_offset + 4 + 16));
++	    pe_get16 (abfd, pe_header_offset + 4 + 16, &fail));
++  if (fail)
++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
+ 
+   /* Get the rva and size of the export section.  */
+   for (i = 0; i < nsections; i++)
+     {
+       char sname[SCNNMLEN + 1];
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vaddr = pe_get32 (abfd, secptr1 + 12);
++      unsigned long vaddr = pe_get32 (abfd, secptr1 + 12, &fail);
+ 
+-      bfd_seek (abfd, (file_ptr) secptr1, SEEK_SET);
+-      bfd_read (sname, (bfd_size_type) SCNNMLEN, abfd);
++      if (fail
++	  || bfd_seek (abfd, secptr1, SEEK_SET) != 0
++	  || bfd_read (sname, SCNNMLEN, abfd) != SCNNMLEN)
++	return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
+       sname[SCNNMLEN] = '\0';
+       if (strcmp (sname, ".text") == 0)
+ 	return vaddr;
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+index 583db6bceb0..6a995ae2241 100644
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -711,8 +711,6 @@ coff_symfile_read (struct objfile *objfile, symfile_add_flags symfile_flags)
+ 
+       /* FIXME: dubious.  Why can't we use something normal like
+ 	 bfd_get_section_contents?  */
+-      bfd_seek (abfd, abfd->where, 0);
+-
+       stabstrsize = bfd_section_size (info->stabstrsect);
+ 
+       coffstab_build_psymtabs (objfile,
+@@ -807,22 +805,6 @@ coff_symtab_read (minimal_symbol_reader &reader,
+ 
+   scoped_free_pendings free_pending;
+ 
+-  /* Work around a stdio bug in SunOS4.1.1 (this makes me nervous....
+-     it's hard to know I've really worked around it.  The fix should
+-     be harmless, anyway).  The symptom of the bug is that the first
+-     fread (in read_one_sym), will (in my example) actually get data
+-     from file offset 268, when the fseek was to 264 (and ftell shows
+-     264).  This causes all hell to break loose.  I was unable to
+-     reproduce this on a short test program which operated on the same
+-     file, performing (I think) the same sequence of operations.
+-
+-     It stopped happening when I put in this (former) rewind().
+-
+-     FIXME: Find out if this has been reported to Sun, whether it has
+-     been fixed in a later release, etc.  */
+-
+-  bfd_seek (objfile->obfd.get (), 0, 0);
+-
+   /* Position to read the symbol table.  */
+   val = bfd_seek (objfile->obfd.get (), symtab_offset, 0);
+   if (val < 0)
+@@ -1308,12 +1290,13 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   if (bfd_seek (abfd, offset, 0) < 0)
+     return -1;
+ 
+-  val = bfd_read ((char *) lengthbuf, sizeof lengthbuf, abfd);
+-  length = bfd_h_get_32 (symfile_bfd, lengthbuf);
+-
++  val = bfd_read (lengthbuf, sizeof lengthbuf, abfd);
+   /* If no string table is needed, then the file may end immediately
+      after the symbols.  Just return with `stringtab' set to null.  */
+-  if (val != sizeof lengthbuf || length < sizeof lengthbuf)
++  if (val != sizeof lengthbuf)
++    return 0;
++  length = bfd_h_get_32 (symfile_bfd, lengthbuf);
++  if (length < sizeof lengthbuf)
+     return 0;
+ 
+   storage->reset ((char *) xmalloc (length));
+diff --git a/gdb/dbxread.c b/gdb/dbxread.c
+index 75bbd510155..ddc61d9d539 100644
+--- a/gdb/dbxread.c
++++ b/gdb/dbxread.c
+@@ -809,7 +809,8 @@ stabs_seek (int sym_offset)
+       symbuf_left -= sym_offset;
+     }
+   else
+-    bfd_seek (symfile_bfd, sym_offset, SEEK_CUR);
++    if (bfd_seek (symfile_bfd, sym_offset, SEEK_CUR) != 0)
++      perror_with_name (bfd_get_filename (symfile_bfd));
+ }
+ 
+ #define INTERNALIZE_SYMBOL(intern, extern, abfd)			\
+@@ -2155,8 +2156,8 @@ dbx_expand_psymtab (legacy_psymtab *pst, struct objfile *objfile)
+       symbol_size = SYMBOL_SIZE (pst);
+ 
+       /* Read in this file's symbols.  */
+-      bfd_seek (objfile->obfd.get (), SYMBOL_OFFSET (pst), SEEK_SET);
+-      read_ofile_symtab (objfile, pst);
++      if (bfd_seek (objfile->obfd.get (), SYMBOL_OFFSET (pst), SEEK_SET) == 0)
++	read_ofile_symtab (objfile, pst);
+     }
+ 
+   pst->readin = true;
+diff --git a/gdb/xcoffread.c b/gdb/xcoffread.c
+index 8ce4b28d133..63eb538ca05 100644
+--- a/gdb/xcoffread.c
++++ b/gdb/xcoffread.c
+@@ -779,8 +779,9 @@ enter_line_range (struct subfile *subfile, unsigned beginoffset,
+ 
+   while (curoffset <= limit_offset)
+     {
+-      bfd_seek (abfd, curoffset, SEEK_SET);
+-      bfd_read (ext_lnno, linesz, abfd);
++      if (bfd_seek (abfd, curoffset, SEEK_SET) != 0
++	  || bfd_read (ext_lnno, linesz, abfd) != linesz)
++	return;
+       bfd_coff_swap_lineno_in (abfd, ext_lnno, &int_lnno);
+ 
+       /* Find the address this line represents.  */
-- 
2.42.0


