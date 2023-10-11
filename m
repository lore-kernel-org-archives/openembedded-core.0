Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7454ACD6E6A
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:27:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16452.1697030814233603495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 06:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KLP5zJ3R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86481965b1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39BASd3N031859
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=am5xEiXTZDFVQsm7PvIFtlCWC0NJNkkqtx7cB2wHIPY=; b=
	KLP5zJ3RLE50x5X/Z1VqYPkK8N08HgmP7RoEpsyGdDf3iQ3p7U0WpMF6Y+2dypat
	c44Jnzdg8FVrTpp8KXB5cKnZhTaHNSZDcuL8j1pWWiSG4Kta7Ln68vDC0zvrPLHZ
	Wk81C0dTuRJbiTzhRJRG/fCjXkp54UZzoV/xD7RvAT+GbYGIx9vKiZp425sDG7vn
	ZKyk+O8H+o0HhTf3wm2Z7JB35heHv4hQztYVJLi+48b1vQEexuoYzMqRrRESxFBT
	J6ciWJEqnY8OanjHoi4Vv43b3majugDIQ388c0VHJLr4PVYaG3c4Fx+xCtjCs9/Q
	doby69dx5+9bemPQ/pP4bA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhuegfcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:26:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOExXiE0z9cDZRB1/xtRA7xlBrjYCZ91B4F6avFsMNj3XNovlLT27PzrcyB4bPUslE+UmRHc0gQoVrnI4Ir8S8j1EPqflDaIrtjh+KXT3xrJs+EZFTnhVB6UbPkkSWlSGFqTCJVIcjDKgH5/auIsAK8B+uoGrfGTWIBtdDQiOUbtH2JDSNp8OLsNz1HoXlX7xA+Q3lQy9IUS2t8FNOMJxmQZxt0EpHEqnRRBrZsZgP2Nt5cwRpjm1T05rANzxl97andyxT+xN2OBgDAuo9m6bWRFMLHMWg5jadM2j0G0wedHiVl0Z/CSv0ttNXl2HfxfD8UAQHZ7wgLoHc7tHf2xmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am5xEiXTZDFVQsm7PvIFtlCWC0NJNkkqtx7cB2wHIPY=;
 b=R/bElgWT1BKu7FYEaSU9XEvpJf36Efe5TM8eictHwEk87PHkFpxY70cPN3ofZCfMzoRAafqbYQ+0ljLwthBHY5qWV4QAZFz6A1NlKyGJ++OCG0oS7ThZJ60tlTdaXnfT2qxoDD/C6PnP+t0hY0P6ljtKkcbZq5nZjm4xlv7lik5OsTzamuhVjpQ0uDEldUOb+EaNz7l8InhAn4XP6LnV8TOdrcC8W/8afmafyONFzypREY3BL4ChPWsWpn/M6fyJ/vEZOzqVgSe7aNSkjwimards97GnGkO4vMRP3yfq7BAYMzE2Be7nacG7ZK5KB82BQmYHmpj6mY6o9AZDYsWs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB5678.namprd11.prod.outlook.com (2603:10b6:a03:3b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 13:26:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 13:26:50 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH 2/2] binutils: Fix CVE-2022-45703
Date: Wed, 11 Oct 2023 06:25:50 -0700
Message-Id: <20231011132550.1977777-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231011132550.1977777-1-Yash.Shinde@windriver.com>
References: <20231011132550.1977777-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c92d2a-45a4-4aef-e591-08dbca5db9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4QoJwBX49KUjdjrslnstXkACgkWEGDW0EAZbNBXmFMWObMTQZmhEhzJ38RpbJOA/AdRPRiJWC0drHNDJdEMAnePJAPPMes8lAo74FN31PaHX1Zwl7kFTb/mCPNAj9BNZodRKS0Va6vNJjYqIcv6PckXxCemAWp1g9YkYG2axun4cf8E89o/UKV9YNME7lMHUChnqqJ6yTneyEklUTuYlLNd5jbjBamzmeni5dldKDjSGAn6nYUsoNwtyT2wwamupHrUeCMNdy+bZpX79oGjgyuRTPJFWAZTCnIo6XlmalVHtDGxhmiscBbdzZNK0Cdy7ZG51EOVtJJd8kfQO7CGR7UnKP1XceA5euXjRWa6PWLqmzW1s+tK1NvPAE/Pgg7qy5eruHkh1N2oEyW+pcd202xKkw6nH7XvfsDFvyeAuYjdZyr0sJsudVsb2vWj3B0xQv1fd+6fVI3Ee+QuUdgDv+nWcop0EuygUR2nGoazi4YFBibw05G1hsTkNjiCOscmSuQsTUyXegHx8YB1Dg4P64foliDi3OTAZtvAWynO3iZF0Nfagny3is8tGG6oG6N55PuZIQ3f7Q2NW4TAsPLBvwg84r3WStZnHzAfrtlc/mzjXjFlwf53MZ3xe4xSFnNY8qwkAjO2pxXH6L3Hw/r4t1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(396003)(136003)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(107886003)(6512007)(52116002)(1076003)(9686003)(966005)(6486002)(2616005)(6506007)(26005)(83380400001)(2906002)(6916009)(66556008)(5660300002)(66946007)(66476007)(8676002)(4326008)(8936002)(41300700001)(316002)(38350700002)(36756003)(478600001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9ykfImxq4lrzxc0AgfZMeXj8tVA8lpNMYTTW5eBjX41vcUPju7PMaBiV0yiq?=
 =?us-ascii?Q?IVG/7pVV/PvsvGkFYanwnl8NLitux8YHSRxd98rZBHpgI0p2qvDKVuT6TwDF?=
 =?us-ascii?Q?BqP+i452cH7OuWadK90y5Kf6Ce1ZrqqojAtZbVTWHjgqJYuwBFh6ADQF03PE?=
 =?us-ascii?Q?atTtIaEsL3JMAvIXvp0rmF8KcUb+B0Wzt/tlBeOk0jBJnYXFZ6muFzDf/jw6?=
 =?us-ascii?Q?IvxO7ovCAbTcFU4T43Nz7yk/fOng4P4/oScKc6e3Tx2zDmyifUW62lk0qNN3?=
 =?us-ascii?Q?5SNrPSyJgS1M4758bjpDNdGd67+JiKojRfUBhANxDdmNLBCp5sjWSvDtaCTO?=
 =?us-ascii?Q?36C9tbzFauKxaCLJs37qN8l6pqfqHfdPjIiMokRdmLwyJKZDuQbWU9I+0aHZ?=
 =?us-ascii?Q?qAYmR5jzOM2vXEDVm+/OEGheMDMZ8mBoPpHUWABxtAGwDROzm5yj0+xuAOa6?=
 =?us-ascii?Q?NZ5f9a9eEBM8IhD34Pm+DcOuREOiOojeJEmqSlFFq1leN2vmJBkdqQZNTqb1?=
 =?us-ascii?Q?zkA+WuWren3dlH3rRosQ+z1m3jOblLf6SNCw+ZAmR5uNM0Gwo4g7FCSsp/DE?=
 =?us-ascii?Q?tYzSzr5tDZ+jASwRfbSc442gKmKS0lKhxC+xQde8e/0MEzzbsNGIfqKs3fkA?=
 =?us-ascii?Q?kWWtymfCsUTcy/PvfR77T5WIHSh764E1PIpbB3oXVtQYHJDf8k3T9Okf52OC?=
 =?us-ascii?Q?WFM8DJOm5Vou2sNWiLO5fDi4gnusRtHmj+ykgJcszkMORufXbYqXLmCE8zHL?=
 =?us-ascii?Q?2Ez6DbfNjLLNb9LS0dvn04axU94Wkzq5LAtwcfo+0o7gRaUHfpLHfk8QIKN+?=
 =?us-ascii?Q?YMmE9tk4ykkN6vh5ljSrHUfOyZN0z3atqclS+3NmCpTnGladZH7b1d/kC1lg?=
 =?us-ascii?Q?qH+wUZt8XqRtNyOzpDkdT5vgw+qbv/MqQ0Vay09CVPbjw3g1UHzxx7kA+atX?=
 =?us-ascii?Q?vpUnSOoPfeOTg0PGFqtsL/8ojMDQ57ULpc4A+y64RR7mqaatn4GXDJi1SmMQ?=
 =?us-ascii?Q?xNMTi8UKVK3Smxl5/fBYSXJ+uZnU7Retv+L0zvTWzZLp9zG6MRT+arCjeiic?=
 =?us-ascii?Q?ljf4tc9lRm2gVIkosb4fcHlr6fHJtAQzVogJOeT8pN/2kqDoaU5OFREya0ZC?=
 =?us-ascii?Q?mAZw0WfsmPl4qF0x5WBir1i8sCddkiXjeCyPM9rpMM7WI690X1CKqbIA+fbB?=
 =?us-ascii?Q?6VCzh8aqaNqmywyJs5EA3+zWHp4+pMa2HV2PiBspQ2ylMadTl9yFJn2IfeCG?=
 =?us-ascii?Q?AZWWaBMoRwqdc0zLKxXlhiAsHXMh+xlPB65TQd8saLZfwRkFYNrPr28oOAUj?=
 =?us-ascii?Q?SZPk663SpyzwCMJYN+k+e1oh8JFKm+s6C4Q2Ih0ZsPhe3CXiHGlM/10zaQ9O?=
 =?us-ascii?Q?Jcsj+mcoUjzdvkWqPkKuyd3DjDCA7syQTLDVPphNjR4gCQpt+G4L7IMuoFLO?=
 =?us-ascii?Q?YBTenet3gFuhtdcZEnRYKe0OGeW71w5EcKoiuz8yKgRGA1rxeZSgAH969JGl?=
 =?us-ascii?Q?nw2v7xEp2kcOWvstadMuob4bNNV6tyf8g7+07cPZLaBBPJ5YhelHyFCRDTB8?=
 =?us-ascii?Q?HaUarvMT5GE5N3K+1967csCq48kv85OpNDQAM5JiiNGmqy/TMVHNF7HIra02?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c92d2a-45a4-4aef-e591-08dbca5db9b4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 13:26:50.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSoN9KO6yGimWv3oB345wV14R29nXQLEV1j3SWZqV4i5ZurL/KPIbtDO1RgQB5RA80h5snWEfiOJ6O89fcFjcfyVfNJchfwLwwpEir6IsHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5678
X-Proofpoint-GUID: NdOYArsFcu3G-5SREuTiJN1WgsHJglRp
X-Proofpoint-ORIG-GUID: NdOYArsFcu3G-5SREuTiJN1WgsHJglRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_09,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=956 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310110118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188959

From: Yash Shinde <Yash.Shinde@windriver.com>

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/0031-CVE-2022-45703-1.patch      | 147 ++++++++++++++++++
 .../binutils/0031-CVE-2022-45703-2.patch      |  31 ++++
 3 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 7c5d8f79ec..0964ab0825 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -60,5 +60,7 @@ SRC_URI = "\
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
      file://0030-CVE-2022-44840.patch \
+     file://0031-CVE-2022-45703-1.patch \
+     file://0031-CVE-2022-45703-2.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
new file mode 100644
index 0000000000..3db4385e13
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
@@ -0,0 +1,147 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 24 May 2022 00:02:14 +0000 (+0930)
+Subject: PR29169, invalid read displaying fuzzed .gdb_index
+X-Git-Tag: binutils-2_39~530
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=244e19c79111eed017ee38ab1d44fb2a6cd1b636
+
+PR29169, invalid read displaying fuzzed .gdb_index
+
+	PR 29169
+	* dwarf.c (display_gdb_index): Combine sanity checks.  Calculate
+	element counts, not word counts.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=244e19c79111eed017ee38ab1d44fb2a6cd1b636]
+
+CVE: CVE-2022-45703   
+
+Signed-off-by: yash shinde <yash.shinde@windriver.com>
+
+---
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 7de6f28161f..c855972a12f 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10406,7 +10406,7 @@ display_gdb_index (struct dwarf_section *section,
+   uint32_t cu_list_offset, tu_list_offset;
+   uint32_t address_table_offset, symbol_table_offset, constant_pool_offset;
+   unsigned int cu_list_elements, tu_list_elements;
+-  unsigned int address_table_size, symbol_table_slots;
++  unsigned int address_table_elements, symbol_table_slots;
+   unsigned char *cu_list, *tu_list;
+   unsigned char *address_table, *symbol_table, *constant_pool;
+   unsigned int i;
+@@ -10454,48 +10454,19 @@ display_gdb_index (struct dwarf_section *section,
+       || tu_list_offset > section->size
+       || address_table_offset > section->size
+       || symbol_table_offset > section->size
+-      || constant_pool_offset > section->size)
++      || constant_pool_offset > section->size
++      || tu_list_offset < cu_list_offset
++      || address_table_offset < tu_list_offset
++      || symbol_table_offset < address_table_offset
++      || constant_pool_offset < symbol_table_offset)
+     {
+       warn (_("Corrupt header in the %s section.\n"), section->name);
+       return 0;
+     }
+ 
+-  /* PR 17531: file: 418d0a8a.  */
+-  if (tu_list_offset < cu_list_offset)
+-    {
+-      warn (_("TU offset (%x) is less than CU offset (%x)\n"),
+-	    tu_list_offset, cu_list_offset);
+-      return 0;
+-    }
+-
+-  cu_list_elements = (tu_list_offset - cu_list_offset) / 8;
+-
+-  if (address_table_offset < tu_list_offset)
+-    {
+-      warn (_("Address table offset (%x) is less than TU offset (%x)\n"),
+-	    address_table_offset, tu_list_offset);
+-      return 0;
+-    }
+-
+-  tu_list_elements = (address_table_offset - tu_list_offset) / 8;
+-
+-  /* PR 17531: file: 18a47d3d.  */
+-  if (symbol_table_offset < address_table_offset)
+-    {
+-      warn (_("Symbol table offset (%x) is less then Address table offset (%x)\n"),
+-	    symbol_table_offset, address_table_offset);
+-      return 0;
+-    }
+-
+-  address_table_size = symbol_table_offset - address_table_offset;
+-
+-  if (constant_pool_offset < symbol_table_offset)
+-    {
+-      warn (_("Constant pool offset (%x) is less than symbol table offset (%x)\n"),
+-	    constant_pool_offset, symbol_table_offset);
+-      return 0;
+-    }
+-
++  cu_list_elements = (tu_list_offset - cu_list_offset) / 16;
++  tu_list_elements = (address_table_offset - tu_list_offset) / 24;
++  address_table_elements = (symbol_table_offset - address_table_offset) / 20;
+   symbol_table_slots = (constant_pool_offset - symbol_table_offset) / 8;
+ 
+   cu_list = start + cu_list_offset;
+@@ -10504,31 +10475,25 @@ display_gdb_index (struct dwarf_section *section,
+   symbol_table = start + symbol_table_offset;
+   constant_pool = start + constant_pool_offset;
+ 
+-  if (address_table_offset + address_table_size > section->size)
+-    {
+-      warn (_("Address table extends beyond end of section.\n"));
+-      return 0;
+-    }
+-
+   printf (_("\nCU table:\n"));
+-  for (i = 0; i < cu_list_elements; i += 2)
++  for (i = 0; i < cu_list_elements; i++)
+     {
+-      uint64_t cu_offset = byte_get_little_endian (cu_list + i * 8, 8);
+-      uint64_t cu_length = byte_get_little_endian (cu_list + i * 8 + 8, 8);
++      uint64_t cu_offset = byte_get_little_endian (cu_list + i * 16, 8);
++      uint64_t cu_length = byte_get_little_endian (cu_list + i * 16 + 8, 8);
+ 
+-      printf (_("[%3u] 0x%lx - 0x%lx\n"), i / 2,
++      printf (_("[%3u] 0x%lx - 0x%lx\n"), i,
+ 	      (unsigned long) cu_offset,
+ 	      (unsigned long) (cu_offset + cu_length - 1));
+     }
+ 
+   printf (_("\nTU table:\n"));
+-  for (i = 0; i < tu_list_elements; i += 3)
++  for (i = 0; i < tu_list_elements; i++)
+     {
+-      uint64_t tu_offset = byte_get_little_endian (tu_list + i * 8, 8);
+-      uint64_t type_offset = byte_get_little_endian (tu_list + i * 8 + 8, 8);
+-      uint64_t signature = byte_get_little_endian (tu_list + i * 8 + 16, 8);
++      uint64_t tu_offset = byte_get_little_endian (tu_list + i * 24, 8);
++      uint64_t type_offset = byte_get_little_endian (tu_list + i * 24 + 8, 8);
++      uint64_t signature = byte_get_little_endian (tu_list + i * 24 + 16, 8);
+ 
+-      printf (_("[%3u] 0x%lx 0x%lx "), i / 3,
++      printf (_("[%3u] 0x%lx 0x%lx "), i,
+ 	      (unsigned long) tu_offset,
+ 	      (unsigned long) type_offset);
+       print_dwarf_vma (signature, 8);
+@@ -10536,12 +10501,11 @@ display_gdb_index (struct dwarf_section *section,
+     }
+ 
+   printf (_("\nAddress table:\n"));
+-  for (i = 0; i < address_table_size && i <= address_table_size - (2 * 8 + 4);
+-       i += 2 * 8 + 4)
++  for (i = 0; i < address_table_elements; i++)
+     {
+-      uint64_t low = byte_get_little_endian (address_table + i, 8);
+-      uint64_t high = byte_get_little_endian (address_table + i + 8, 8);
+-      uint32_t cu_index = byte_get_little_endian (address_table + i + 16, 4);
++      uint64_t low = byte_get_little_endian (address_table + i * 20, 8);
++      uint64_t high = byte_get_little_endian (address_table + i * 20 + 8, 8);
++      uint32_t cu_index = byte_get_little_endian (address_table + i + 20 + 16, 4);
+ 
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch
new file mode 100644
index 0000000000..1fac9739dd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch
@@ -0,0 +1,31 @@
+From 69bfd1759db41c8d369f9dcc98a135c5a5d97299 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 18 Nov 2022 11:29:13 +1030
+Subject: [PATCH] PR29799 heap buffer overflow in display_gdb_index
+ dwarf.c:10548
+
+	PR 29799
+	* dwarf.c (display_gdb_index): Typo fix.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff_plain;f=binutils/dwarf.c;h=4bba8dfb81a6df49f5e61b3fae99dd545cc5c7dd;hp=7730293326ac1049451eb4a037ac86d827030700;hb=69bfd1759db41c8d369f9dcc98a135c5a5d97299;hpb=7828dfa93b210b6bbc6596e6e096cc150a9f8aa4]
+
+CVE: CVE-2022-45703
+
+Signed-off-by: yash shinde <yash.shinde@windriver.com>
+
+---
+ binutils/dwarf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 7730293326a..4bba8dfb81a 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10562,7 +10562,7 @@ display_gdb_index (struct dwarf_section
+     {
+       uint64_t low = byte_get_little_endian (address_table + i * 20, 8);
+       uint64_t high = byte_get_little_endian (address_table + i * 20 + 8, 8);
+-      uint32_t cu_index = byte_get_little_endian (address_table + i + 20 + 16, 4);
++      uint32_t cu_index = byte_get_little_endian (address_table + i * 20 + 16, 4);
+ 
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
-- 
2.39.0


