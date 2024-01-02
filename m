Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECF3C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 06:10:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23863.1704175810787823803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 22:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hkQ0vhmg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=173143555b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40264L26018103
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 06:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=IFsmpZYWQ1j2/g8eLfZaEQV/akZyLhDK4A1W4iH4A7c=; b=
	hkQ0vhmg+O9lfdv4iPpnL+Y5EwyszPjCzEsHWDU5DSQYwHWi2yLOHZzVjEPIw1nV
	W8A/5+OYhqBTlgVDEymUK+oucQ21NXk0pqypQ33797J3/WTCtRbtJpStYt2j7B1Y
	D1vpiyKC4ZJBCS+KACrtAQTJcPks/yuX7xBmejOk4v2kvtM+/x8P3iznnZtLLxtQ
	xYthAs8x5lcfBMxuwScwCysnfWQndzztxVmfjAw3F4vANhmLTzU7HReBJlP28HGv
	sI8J1Adrf5LkATJvS2XagfU7rY28H+1TF/ppvqw8gGBbvWlG7UoEbCR2q68wNhv7
	1r/x5RuYBBNs1lcQmg4KLA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa662g4g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 06:10:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0b31ulGx85+QlPgCpWm8udc0Y4YVe7NgvuSQTDa+FuCGpZtTN4W+P+yX4fZRprlePFGjGkY3WG1/Z2YPbPo3SIQTc79VwqyZHdPerHj0FQvHNGmHrWWwgMjv2l9h93BHYYIDNc2wf5IWKXqHG/2SDrn2hzt/LQ/kA5v9GVwdeK3KjXRYI7UGMrdwhBKlwO4elWlYLnILB2SZIToIcJak9r5zNSPNPkCYbcfPwfO9SFg1oGDPzUXmbOgzeR4FpvnhZcoGGhDuKy3soJLZ2SK4t4S+ED9XQ7XacI5bsFTKg7miUazkd3miYLmIuhVoj1iGf4ZZDyogRCwkBrsoU+ZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFsmpZYWQ1j2/g8eLfZaEQV/akZyLhDK4A1W4iH4A7c=;
 b=S36TOumS0Q/Fu0xrmRp8iay4+0ZNKRpwA2nP5bxR7wb6I4AvmSwJDZzJc9ttz80zRbxQyNHLFjgXQT8+6JPB3iJHsZX00UuX/6WcMFm2PH4BhoyVRJsmTAWKxkyD21VNdExdMNOowk+li+s5YYSFBIrLYkba7XDQVs6qxw0GUPGnGMUHz0XCXDrQ1jCJ13fTu//B/ioNEfk77KxVhEW/z0XTRxwj8I+rc7d4vSo/XfGSxoPMKiLR2jBryaEEvbAf/wwS4IsXjevttlcn4znSlBIelCkhdGG+h7f6W8UvTXoKaEIriCa+UtiYuFne+C2JCEyNRMIi9VOKQtgBi4n0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 06:10:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 06:10:07 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] systemd-bootchart: upgrade from 234 to 235
Date: Tue,  2 Jan 2024 14:09:47 +0800
Message-Id: <20240102060947.218414-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102060947.218414-1-Qi.Chen@windriver.com>
References: <20240102060947.218414-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 036d75b4-0ab4-46f1-1077-08dc0b597431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uthR8PQmu40MQgMjYiQwFnvnXRgc5nsv8Z/OrgXPfUI3r6YBeFThbcGz+rYylCM4tzT+n4hdoioQT+i0p4WHGMLPj1Tspj5OtW/FceObmVYhmQ+/rBYMcydNj5B4+1nep+4DkUznwxXjfaaVhlfl5rhOB/AcVn5jtKQatZ4+74aCC5Af+eHbGVXiDbR5000pwqhXXEZ/0QKs85RvXXjg1lk4YX+vqQr54SpHgTRzVM851D80X05ddBIhiVrmLuZc1Rq/KwoiP+slKw9Oa45l9iiNozKg/h2x5nf6qz8ZsNaO6JZkXNNBSmN8/Jd2tNnrjCmOsOA8DoZnK6WRcg0V9PpuAmhL1fwG0nc1K+QllXzhExrHyF8O+rX+9iBFeXVD3A5BOHFQ+ZBpJJFdtuM48OYS9g9yRi3FpxYFgHo90E+wocp0LX8aiVlCkjfzSfDczhU+L+k2MAzHFLyLpby5vYuiGemWR2ncaHRI/0csaeY0oRQsbv9yxShVqdUDE2QyhNRjJMnsAl/SXsuZJQFPBrvaAIKft21aigUy0jT+5ql16vEadVWWsfpdTuQUTT+a5qeKxskMAFHQLyC6Iede0MVRSvfDmHCSkmA+eFSVPnk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39850400004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(5660300002)(8676002)(8936002)(316002)(36756003)(66476007)(66556008)(6916009)(86362001)(478600001)(6486002)(19627235002)(41300700001)(6666004)(6512007)(9686003)(6506007)(52116002)(38350700005)(1076003)(26005)(2616005)(38100700002)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IQwiJcIAhF4J0URSCiOJHI53UcLENbxXKJBBVR/2CFCUu7bml6dDGUYxmwY0?=
 =?us-ascii?Q?Z9SJxOorRHX+sRq+qbIEWGx9zbNyvpB4YIfmbFXhzhPHyq1kBnPKqMbHR53N?=
 =?us-ascii?Q?1JLG9ei2C3qNQQK2fqi4FenPaF088i8bwa+gTKHV8irccVQme8n62tKC5pX4?=
 =?us-ascii?Q?D7VySl7tuCoogqb9TUPJu902UvlMLm6p17TZ/WMDsgeg9y+7JM4tZogNHSou?=
 =?us-ascii?Q?YzTpK7f7b02clVLtNsYmXp3EWMyobdrlb6nq7PSWktuMitCyyzI4Xiup3nxV?=
 =?us-ascii?Q?qbyYTqvt5SoyO3jdNwfFXcDelYcrrOtL1uU9F2nB5Xe5VA5RaPx5ny8aVIza?=
 =?us-ascii?Q?1Xc3i82Di3Rdv21FzDGSIMZhuJ1VhcTArEZHmpY0tvHmty8RpUwdtvtw/w9J?=
 =?us-ascii?Q?ESbXnxdaGX3M8m9THnM7IDnYyEttaOO/hmoKayZ0xjupZpP5BWBNhyifr7k9?=
 =?us-ascii?Q?sog/vCRlt7b0jhmpvlyPEpN/R9q2dk6b/QTIfsMp38z1wuCf2aFn4SBxLPvD?=
 =?us-ascii?Q?yZB6kkfaf0gWz2VPmum5x6v3Z4Ah2BMUYB13QloEuPVotHZJE82WERKmT/bs?=
 =?us-ascii?Q?4T0Vtr3jhq1POl6qQD1SADUKChNrtaqWLv+BUaA4XzwfOu0J800h4fOQk8py?=
 =?us-ascii?Q?Huww6HnKyUMzjWk8Gf8FAyYYIVNrwLhHIj+R4UnIl0BgpF24fFgUYDEygRy4?=
 =?us-ascii?Q?DN+CIvAF6dRa8UZWBxK+jgQNyoeR96/aMBMuRu++WVJfXQzssM2Qr6m0icxp?=
 =?us-ascii?Q?+uQV+/SEAOXhCQ1wAB9yB5To/DniQj8c6K4ysMPF81QYyP+iKBYP8SjySjv8?=
 =?us-ascii?Q?7gl2Tr6i0ftAL3su7CXtxd/NAvb7j/yr1ncC/3XOW8g9wWHpg/qgTn1TNkMk?=
 =?us-ascii?Q?DEB+YTzv3fXyDQgWSoqZW2dlk1JqXLFvldjZ17c+L3n3BzrqsF9XtaC4Br4s?=
 =?us-ascii?Q?jN9Tn/eJ4zZy4sO1XAh08NtvFCl5O2SVjPfGSfY+fRKTGMUBFcBkSx3sek7I?=
 =?us-ascii?Q?JvwbPXn3CO2BZ+6fo0MtQsQpLdbI2G74DYJRZkk9A89rAUX13dWklqbk9FJn?=
 =?us-ascii?Q?D7DBUEND6lVjEVYCBUo4v/wqGlY7nGCXjI01A/nBVL4DdIK3Roe6hopmwJsU?=
 =?us-ascii?Q?RZtB1UL3FYYO5dMyiqZofj6PP2yuxyyDyUmE4GO/QHu+UgZN/t0wsBvEOiUl?=
 =?us-ascii?Q?wtEeBsVZnXoNvSW9u1fDGxhgfFwWyhcXb4v1TNBQ1dLTce3mu0/vPQmqvIUm?=
 =?us-ascii?Q?EtPJR9PC8V8Fyy4CmlmrWU5H2SEN4VztFCgfei64EU3aFj+S+IbaoElKnbS0?=
 =?us-ascii?Q?IqoB8ifqO6MudX2CchINm89S48CaLBpC3KK26v1IE16MltYnYlk/Z7LNmv3H?=
 =?us-ascii?Q?Xh4GiMRKwne/xkU0jTVRMuNfMfVaDUMgm+cznCKgI95gxgW02pL+N9k/faYw?=
 =?us-ascii?Q?wq05/mfmV9Q2fMX5zyg+lyAiEiOVFSv5nuR5C7tbx6h+7Dpts//jqk9OB7YR?=
 =?us-ascii?Q?6py4be5cpB+a1m0LKj19SQw9GYEesB8MDlHYj3RalSt7L6ulWV1D/MdeiytI?=
 =?us-ascii?Q?4zPIu7gcADANsDFH90qMpEO7ovalMkd9HpKh5IcB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036d75b4-0ab4-46f1-1077-08dc0b597431
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 06:10:01.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3F289p6WHupKIU7IDnZiSsHgK5sqfc2Uoo4fhfd+8brIuxC1YRY9VG04EDJ7iovLHaZc3UU4Ng9raqbh36gEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
X-Proofpoint-GUID: 3-POdG8npLKU8Qq8AeVV_eceWmDXO6vW
X-Proofpoint-ORIG-GUID: 3-POdG8npLKU8Qq8AeVV_eceWmDXO6vW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=453
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 06:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193206

From: Chen Qi <Qi.Chen@windriver.com>

0001-architecture-Recognise-RISCV-32-RISCV-64.patch is dropped because
it has some problem. It's a patch from systemd repo, yet it's marked
as 'Backport' for systemd-bootchart. systemd and systemd-bootchart are
two different projects. Now in 235, RISCV64 has been officially supported,
but RISCV32 is not. So drop this patch. People who want RISCV32 support
need to work with systemd-bootchart upstream first.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...itecture-Recognise-RISCV-32-RISCV-64.patch | 45 -------------------
 ...tchart_234.bb => systemd-bootchart_235.bb} |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_234.bb => systemd-bootchart_235.bb} (90%)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
deleted file mode 100644
index fc03812bb9..0000000000
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4a6ace0a965965ea15e88c3418c7158ca5cc9f8f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 21 Nov 2019 10:12:05 -0800
-Subject: [PATCH] architecture: Recognise RISCV-32/RISCV-64
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/171b53380085b1288b03b19a2b978f36a5c003d0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/architecture.h | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/src/architecture.h b/src/architecture.h
-index 26679e2..89c7d32 100644
---- a/src/architecture.h
-+++ b/src/architecture.h
-@@ -57,6 +57,8 @@ enum {
-         ARCHITECTURE_M68K,
-         ARCHITECTURE_TILEGX,
-         ARCHITECTURE_CRIS,
-+       ARCHITECTURE_RISCV32,
-+       ARCHITECTURE_RISCV64,
-         _ARCHITECTURE_MAX,
-         _ARCHITECTURE_INVALID = -1
- };
-@@ -194,6 +196,17 @@ int uname_architecture(void);
- #elif defined(__cris__)
- #  define native_architecture() ARCHITECTURE_CRIS
- #  error "Missing LIB_ARCH_TUPLE for CRIS"
-+#elif defined(__riscv)
-+#  if __SIZEOF_POINTER__ == 4
-+#    define native_architecture() ARCHITECTURE_RISCV32
-+#    define LIB_ARCH_TUPLE "riscv32-linux-gnu"
-+#  elif __SIZEOF_POINTER__ == 8
-+#    define native_architecture() ARCHITECTURE_RISCV64
-+#    define LIB_ARCH_TUPLE "riscv64-linux-gnu"
-+#  else
-+#    error "Unrecognized riscv architecture variant"
-+#  endif
-+#  define PROC_CPUINFO_MODEL "cpu model"
- #else
- #  error "Please register your architecture here!"
- #endif
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
similarity index 90%
rename from meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
rename to meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index bc3eee2093..25544029d5 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -8,8 +8,7 @@ LICENSE = "LGPL-2.1-only & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=master \
-           file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=main \
            file://mips64.patch \
            file://no_lto.patch \
 "
@@ -21,7 +20,7 @@ SRC_URI:append:libc-musl = " \
     "
 
 
-SRCREV = "8183cfd9dad8beca5434d625cf6b2df87775e956"
+SRCREV = "8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


