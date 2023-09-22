Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA48E6FE24
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:08:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20690.1695388085304498944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 06:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bnTj2Q3r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629193b84=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38M9ukQk028118
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:08:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=jCOyQPHD9DrlMgwx8a
	cs+kLAfPuckSXNEQHlTW7B5uI=; b=bnTj2Q3rIL5FJTW2cVDedCgYsPX/fr+jl3
	QaEHuWcJPq+eiyH61E6IdthD0yZEB2oB9Ttlk8KwL9k1oJrUZgmczER6r81DeW2X
	hON2TZOQYv9p5a7AQJu5m6D5zex0vJj8JLw7PmGrEX9m5QPrspgzoMA7+RIhzeFe
	qaVoVFeSWWSxRS27XiXql2IZdmgune3gcy06SFpM+Z5/I09AsX4LgH5B2fPg6Wly
	vvqOl2ToJCpZL8l2CvrDzWKWDi0k49qi7VyQOHKNzZCHTjgLuGemY7R2de+cIBxT
	CYPeZb4xe5IO/E8aJibLenSw4pn11EdaJIKe1owkTqjkyGdAcuww==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr1rtj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbEbzK+QB+r4SLO3pk1lykuKET7h/HDTanlCHx9wHXRZanzkPyHw8H9t0jReWywTkjh3bdg+MDqhLUXNDL6TkSvkJHBr9rfXphBmGiuYZOoBxWmF/ovDJerx1bx+wDxe2+Fy0rqDG+Zm3ELqJbFIgQbOf/gxF6JPDgBrTEZPIs3iOFaXuIIqPqjt/p36QfQpVlXA+TMaqQCpZsbptmfyt/BNiShCZmR2CntauhZ5oJdHmgq9ohl1/we6c5DNK4hBlN1XI4kYZcMg/jcwcqAy61RD0P6UVGQCT5B5Oo1TcO01PFKeLchksh0vFstneJzA6j4RVvWl5btLcCVi6h1xHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCOyQPHD9DrlMgwx8acs+kLAfPuckSXNEQHlTW7B5uI=;
 b=TkIHWdvlh6MHG/c+coJASWC8jX/EkhqlhnRrsf2NrkzSO+El1cX8EABIhQcAABbP14IxMdQ+qgggb4z4tXWkDXxTo0DM1aKUp3z3uvf9SS/4tp+YUl+4NtMdfC3OptlnDLbUS1vb3J3DDyZl9vfTjfpBmFHOYqCVlNiEgxtsKiM9g74gvRnblQUGxln6C3etP9xYOFeMRO6Qz/NPV0pS2ZRBhKhDpc14lt84iWwg/rf0EUM04C5PZNXkOw550Py1z5jlC+z5l1j8Ev99NfMUKoIDsrigNmQmh6Yr/qD/4U2Qwct0BiOHDqH483DE/J4Yi2tF6i45TJQEflE5GvLHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34; Fri, 22 Sep
 2023 13:08:00 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 13:08:00 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH] glibc: fix CVE-2023-4527
Date: Fri, 22 Sep 2023 06:07:43 -0700
Message-Id: <20230922130743.4142689-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 507963cf-7dd5-4510-5adc-08dbbb6cf268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HAs+Mf2gwvmC4uyD1RqIHZyHlt3yewPCVPj226nCB3IOeJFkjZYsi7zAE7ugLRSAgmUKP4PWwuqoODXlyh1fxdA7q5OY6g5DEllLA7kZ3nHf69pbpu3IhwaXrbr/RTHufWqyFGczKwA4O4/TOjCoO43TPDEbam1GxmjVDTlXV0VeJxtxzjkZgwOQqzaqbeAY5XZ/ym/EN5KHEw5KpxzaRpn8qTd7EBXjW666Yl5NuG2CKdNZoFeO62qfsBrhkSFPD40zy6gKEjnWC1qmBKx3R0sXCDhS+TRDMd6j4UUKj8l/UpxZObMk2h2txaKwxjjtawuxtwje16+baD1gf5+//6YWOs1HdKZDKJRpAaHNlcfdkD/AiJW4dV1mDLo71Kp1pc4Cft+ppiQuttOHM/t3ETurfITVD1P78bmC8AqF1eXWfh4ZROU1mQTzuHjEV82TzeToB2Wq+A+HgBCWiXD/Tvt3hhJBKqqHUJ+goHo/evZCPfBs+HmtqZhZlyQAwfti2kgRP9CMHjzmWmS9hVU9ewzX4ZiTNYziP7YhUYBrYjOLULFAz4Z7wkhKQjT+0zWoj+gSAbHNFWwGMQ++tyxSYIU/E0ioVa9RlEySPYlgqwMwb+Vu9dxtGQcOu++snoqj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39850400004)(1800799009)(451199024)(186009)(2906002)(5660300002)(26005)(41300700001)(66476007)(316002)(6916009)(66556008)(66946007)(4326008)(8676002)(8936002)(478600001)(6666004)(6486002)(6506007)(6512007)(9686003)(52116002)(2616005)(36756003)(1076003)(107886003)(38100700002)(38350700002)(86362001)(83380400001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uIwT5iIFhFgdn3obOaXl0Y0/ZQ6UdDFbP1v0Z8o1nyRxWdXFQsCGhQD8hAbF?=
 =?us-ascii?Q?D87enHm8tBnd8w9hW8Hox15KmTBa03yh6J1DOVVmxOrdTeYg4OcCxZE/5Iuc?=
 =?us-ascii?Q?fBopW+YDIJyn4lVAr4/agbCAxTa0mFMsUU+MhiZ0TGAcli3ihX0UwxEcsvFN?=
 =?us-ascii?Q?TGIDuEFgTZ+pTJRRgJoYj546AtY6WNV/3OwNp3f7529qg1yizaFgnLhR493m?=
 =?us-ascii?Q?O/aVeh8Vm6bsGNp26vgDiM/q3EHZ4CnDzBcajbCuopa9E+lVDW4k0htkvMzO?=
 =?us-ascii?Q?bsCI8qfNufv8L1/RDdCDYZO/Tasj5TkZ8Zom/hf7KM1Ne2g1EkWeKhZgT1kS?=
 =?us-ascii?Q?cvzt/wpCkDUB6rx0mYTx6uWFROg9Lea3JbtL7aNRXsfw/2A431uD4Ev5wfT1?=
 =?us-ascii?Q?ypk2tlxfvGlD479Z63/EjaLZaOaRwL/L+g9JpnkonXNo/w8lo2KiMRrSFB86?=
 =?us-ascii?Q?3jVkp8bENY0ILXTMj7P0XilXhrZaLMZs8mEmsVt6RMNZ/99x84M/pzmRz32d?=
 =?us-ascii?Q?5vNKEovtoUGTsrIk9Th6QI/JRLt0zGp845SE1CiOGUkRLSK6HY63OWuMHccH?=
 =?us-ascii?Q?1Jnptr6GaxA/qnH/6qL8oW4WKWLCQu+PyIo6GEOdXbj8PWDe8Bp3nr4/UJ2G?=
 =?us-ascii?Q?/ZLCFP6ou1/IiB3soJ9ua1mi9IY7j4nPEtMjnDR3jDPipoXv7VQB8THHR6N/?=
 =?us-ascii?Q?TplrBvOlbssYmJjxgD3XW3FGtQE+Jq05P5hCOo47NpW88EN7PrQ+ditykyWF?=
 =?us-ascii?Q?Le2BFUblAxf6KaVtfRHkFAAqjodsjcjS/CWbeud8NqLY2sRiBxNyOGhl2BGt?=
 =?us-ascii?Q?5LZZHdb7vU1AcPCpeMuL3SMvPYVhaLguIvx1/HIs1V/PRWJu6cpgTkWvYPzV?=
 =?us-ascii?Q?10IlAEtgYXxsm6bEQcbzPhLSxJNx60K42pHjzVah/fy4CCxPiOQDD0TWaCC0?=
 =?us-ascii?Q?LlaRc/RO6CZpMhQ1hTspQhG1wrlXhkzFM8Y2pSe9jmDNaFZzhj+9zjOWmRbB?=
 =?us-ascii?Q?O6N2dUnmN9JSvQfBQ9nJPYDrPX9BqLWuSRLVKL4fdgduKsWUsWiKsnaAG17i?=
 =?us-ascii?Q?r+tI0dvxs1rTbYOhRO7x7khZr25wOsanUJ3RTTw5texslqB5mK4P2xHlVI6M?=
 =?us-ascii?Q?QhHNd6CF71LED3di1sKUojVb7pKe1T9KLDN7y+wLd31x3i8gIVsONEXaOT7K?=
 =?us-ascii?Q?rdrZLD4p5No7VmLsY48zdWvLHabgV48tdYM6b+P4WCu1OM1yCXZ/xqoSYP0F?=
 =?us-ascii?Q?XZxTBHxW67wWBh4nzcO0+jnq4ULXqZE9DLsL5/n7laE42SPWMwmR4pSUjgW2?=
 =?us-ascii?Q?wWfwKqkBF+r64Py8mwtkMSXXhKQtNodgw+fW8OzWS3FHE7ShCCB1p6/hnO7S?=
 =?us-ascii?Q?KBEuvLE7ulcM/JtBrL+TMOTeMjpS1UaxU4n498dYVDE920t5lzNOBPyC0ywm?=
 =?us-ascii?Q?tLqb0igyfmTp+Sw8uk/i7v3o1UVscxPCWggbE17STuwg2XjZUtkab595HI/l?=
 =?us-ascii?Q?RTk+iXSzFbbrnOzAYdurwuTedd+ROo6iHZWUtcAN2THtPnj9JXib3EJeo5Dj?=
 =?us-ascii?Q?bOSrk7wBbJAVEFtbktm0otxWVcETI6eREEdN597QDiqY1OrMmJBMjIoShZ73?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507963cf-7dd5-4510-5adc-08dbbb6cf268
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:08:00.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjQVAjHll7VnxjNBjrlTdRuINmS9M34kJD8eu/0Ds39k7DQOSp65wUn/Q+OLHkBcr4/qwZcJ5Ks60D18f84JEhq9klmEYTyz3cmJxuKA4us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
X-Proofpoint-ORIG-GUID: 9wF1rlIu_shHBVVRBmzeA1vw-ZdVyixv
X-Proofpoint-GUID: 9wF1rlIu_shHBVVRBmzeA1vw-ZdVyixv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_11,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 13:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188100

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport[https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0024-CVE-2023-4527.patch      | 217 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.38.bb         |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
new file mode 100644
index 0000000000..70d5c8afef
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
@@ -0,0 +1,217 @@
+From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 13 Sep 2023 14:10:56 +0200
+Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP responses
+ in no-aaaa mode
+
+Without passing alt_dns_packet_buffer, __res_context_search can only
+store 2048 bytes (what fits into dns_packet_buffer).  However,
+the function returns the total packet size, and the subsequent
+DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
+of the stack-allocated buffer.
+
+Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
+stub resolver option") and bug 30842.
+
+(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
+CVE: CVE-2023-4527
+
+---
+ NEWS                          |   7 ++
+ resolv/Makefile               |   2 +
+ resolv/nss_dns/dns-host.c     |   2 +-
+ resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
+ 4 files changed, 139 insertions(+), 1 deletion(-)
+ create mode 100644 resolv/tst-resolv-noaaaa-vc.c
+
+diff --git a/NEWS b/NEWS
+--- a/NEWS
++++ b/NEWS
+@@ -126,6 +126,7 @@
+   [30477] libc: [RISCV]: time64 does not work on riscv32
+   [30515] dynamic-link: _dl_find_object incorrectly returns 1 during
+     early startup
++  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
+   [30527] network: resolv_conf lock not unlocked on allocation failure
+   [30550] math: powerpc64le: GCC-specific code for isinf() is being used
+     on clang
+@@ -157,6 +158,12 @@
+   heap and prints it to the target log file, potentially revealing a
+   portion of the contents of the heap.
+
++  CVE-2023-4527: If the system is configured in no-aaaa mode via
++  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
++  family, and a DNS response is received over TCP that is larger than
++  2048 bytes, getaddrinfo may potentially disclose stack contents via
++  the returned address data, or crash.
++
+ The following bugs are resolved with this release:
+
+   [12154] network: Cannot resolve hosts which have wildcard aliases
+diff --git a/resolv/Makefile b/resolv/Makefile
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -102,6 +102,7 @@
+   tst-resolv-invalid-cname \
+   tst-resolv-network \
+   tst-resolv-noaaaa \
++  tst-resolv-noaaaa-vc \
+   tst-resolv-nondecimal \
+   tst-resolv-res_init-multi \
+   tst-resolv-search \
+@@ -293,6 +294,7 @@
+ $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
+   $(shared-thread-library)
+ $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
++$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -427,7 +427,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
+     {
+       n = __res_context_search (ctx, name, C_IN, T_A,
+				dns_packet_buffer, sizeof (dns_packet_buffer),
+-				NULL, NULL, NULL, NULL, NULL);
++				&alt_dns_packet_buffer, NULL, NULL, NULL, NULL);
+       if (n >= 0)
+	status = gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
+					&abuf, pat, errnop, herrnop, ttlp);
+diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc.c
+new file mode 100644
+--- /dev/null
++++ b/resolv/tst-resolv-noaaaa-vc.c
+@@ -0,0 +1,129 @@
++/* Test the RES_NOAAAA resolver option with a large response.
++   Copyright (C) 2022-2023 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <netdb.h>
++#include <resolv.h>
++#include <stdbool.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/check_nss.h>
++#include <support/resolv_test.h>
++#include <support/support.h>
++#include <support/xmemstream.h>
++
++/* Used to keep track of the number of queries.  */
++static volatile unsigned int queries;
++
++/* If true, add a large TXT record at the start of the answer section.  */
++static volatile bool stuff_txt;
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  /* If not using TCP, just force its use.  */
++  if (!ctx->tcp)
++    {
++      struct resolv_response_flags flags = {.tc = true};
++      resolv_response_init (b, flags);
++      resolv_response_add_question (b, qname, qclass, qtype);
++      return;
++    }
++
++  /* The test needs to send four queries, the first three are used to
++     grow the NSS buffer via the ERANGE handshake.  */
++  ++queries;
++  TEST_VERIFY (queries <= 4);
++
++  /* AAAA queries are supposed to be disabled.  */
++  TEST_COMPARE (qtype, T_A);
++  TEST_COMPARE (qclass, C_IN);
++  TEST_COMPARE_STRING (qname, "example.com");
++
++  struct resolv_response_flags flags = {};
++  resolv_response_init (b, flags);
++  resolv_response_add_question (b, qname, qclass, qtype);
++
++  resolv_response_section (b, ns_s_an);
++
++  if (stuff_txt)
++    {
++      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
++      int zero = 0;
++      for (int i = 0; i <= 15000; ++i)
++        resolv_response_add_data (b, &zero, sizeof (zero));
++      resolv_response_close_record (b);
++    }
++
++  for (int i = 0; i < 200; ++i)
++    {
++      resolv_response_open_record (b, qname, qclass, qtype, 60);
++      char ipv4[4] = {192, 0, 2, i + 1};
++      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
++      resolv_response_close_record (b);
++    }
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *obj = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response
++     });
++
++  _res.options |= RES_NOAAAA;
++
++  for (int do_stuff_txt = 0; do_stuff_txt < 2; ++do_stuff_txt)
++    {
++      queries = 0;
++      stuff_txt = do_stuff_txt;
++
++      struct addrinfo *ai = NULL;
++      int ret;
++      ret = getaddrinfo ("example.com", "80",
++                         &(struct addrinfo)
++                         {
++                           .ai_family = AF_UNSPEC,
++                           .ai_socktype = SOCK_STREAM,
++                         }, &ai);
++
++      char *expected_result;
++      {
++        struct xmemstream mem;
++        xopen_memstream (&mem);
++        for (int i = 0; i < 200; ++i)
++          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + 1);
++        xfclose_memstream (&mem);
++        expected_result = mem.buffer;
++      }
++
++      check_addrinfo ("example.com", ai, ret, expected_result);
++
++      free (expected_result);
++      freeaddrinfo (ai);
++    }
++
++  resolv_test_end (obj);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 32ccb888f0..237458d066 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -51,6 +51,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
+           file://0024-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


