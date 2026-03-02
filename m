Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7415AD58E6A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:50:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154701.1772434200889827058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hqxFs2AU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225VA8v1328217
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 06:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=HJ48qmTDPxuLfg3THHIzebPnUDlayc3ZiA0q/+pM2qA=; b=
	hqxFs2AUDEnWhWDqSofSBxQ+15LThSADBEg6few66ojeKvYtp370HsioAWWXQ14X
	4/U7rC2geZ+tqMv6F136b62qMA8ZjsnSJV9KYLL8qcAwVKwKwB5VPlkZgRpWI0WN
	0WK0fuFsHhnVJCDc7lWK0vRNQ78NdmECJ84siCDsPQO/33htiy8cDk8X7YjZVasK
	oGM0X4ETodPQW/iFkGThh3yWzu84MiwDrHRK2EDo1d8r3lGqPic+laQs5Ks0pZZv
	tvhVoNkYvKitaOvkIej9sDJsYbQUSCDH172V5YI6rxXN2MCsAIUFohiBivY1/nid
	MUwqclFbgbsZQFvTzDOqfg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010068.outbound.protection.outlook.com [52.101.193.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj2jk-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:49:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUxjnpsBVeb6pVQX6UlwsheDgVv8f45fsKt+9tT5LVlFXEg5IRgoJBCD2N3TyjWbcA+JMuX0NNpFNQA9gjF7OiE8NG8O8m0g5SVRvL60TUCKo1fJ9OdzfIOzYAqaZxnIWREgDPz9zBGhDGY+RJ77XZq9Pxx3l1TtYQxZ6Fc4nL25OgG5tA+AOSE+6WHYWg3IAiwFdkwRvfNxyHE+/o1I6KGeSZbuKGQclE5BUaV8wIpvgPYQdpgc+LyUnzkSNJjStKLV2FPky01mM9ub1mwPicILBnA7BZoRgf3pdC1IsuqygBkSG9CUs3KBeYv0bf+pQTCacouGQwywEU5DK09cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ48qmTDPxuLfg3THHIzebPnUDlayc3ZiA0q/+pM2qA=;
 b=yzRTHNpd1tyCRrwgmjxq/agGJgBReF5+NYbxRcnoxP0LcxUNprmHVjRu2EFQAeQU6tIN4an7aSDfHFvwNuPBo4Kr+Idvz5+Mg5g8e77/ky9SJINRlcNCmCLNcsplc4x8yej45FFuZzm3o1dJoqFiC9TrpU8BZgc2SdW5UfVsAvKRldSV3T8wWmcmjmYb6MN6cL3n0by2na9EtnvlJ9xmNrI3iS79fMFg+k7oJ/xBPnXpufUkPvs2PWQg3J/58f3b8xik0o0YzrQZfZfquvyWjd1qlnSFRAkphiaKBm879VSi9Z6QfM4VGf9fnIy54E4YJKgsEyn5KppmX4pDZWtXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 06:49:58 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:49:57 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/4 V2] clang: Use CLANG_ENABLE_TESTSUITE to enable LLVM, Clang, and LLD tests
Date: Sun,  1 Mar 2026 22:49:36 -0800
Message-ID: <20260302064938.2052450-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: b03578da-77c3-4a8b-868a-08de7827eb23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	eOa+ZMmLtcqogvRKdvGsJKHAtZru7i1WuucNNgwlx5AqrznLlPCUTMmMjOBeZH10Ae7UU/gFFPfVmKX6uNk47V687AYTmnyPuecxDjUEdMI6q6CLwg61O6nR7TVFRUT7O60baLNECaCxL96NGpXna4gbC2vrUdBfIi/sBtmXp+c14/rgI1bML9t2aqFsdRZPpCXOTXy9xbe7CZ2bRwEixzJguv7xUW9GxkJccgpm9NDEUwGCq0eOjVqDVlV41csR3GDh7rXIyI8MCoLx/IuHy71T2h/Bu2pKieSV8eoXJjGYlRhAQ8HiIjyIVhlLiozPPfPkA5n45SkT9OkLuaDcR7PPpsgY+5VOAkz517pGAhc0VzJTMehdbMX/pi/xVdVwM6J8V4FDv5HMp2H9UIfTUGQIkI9XoCSA3W4XYW7WOBW6xCKGJbXe3DhQACx5J1EZkqMIbEZFGGNYoxDKb3nfmFgvfz5aYvxVe+QAsZCbP1GNzo/EUSNEoz7YiPKQYDVqSGLYP7EcfP4L5ZCwqdQ0coUIQXAvkNuCbiW2fF4WK0azGYrm1p2zFeHnBiJ9IC7pG+6PRs2fyRPOsxLQ+eKr2QRHrhN/fxjxxXwH3pCnCiv3/CATSf1bPCqwYEWZALD2IVxD5oj6HwUHCcfWxVmaXQZWa5n4J7Z+2dyQ5P4cjFqouRVouZG+/C20m31egaqXy8do776yIUF6Kgw1G9euiUCh3/NJrD7VfLWkiGalEghHGkHZag9szaUFJWeIaXS8crb5C65iA28No4jK+5W1NczfQC3bSmXrfV0WXhaCBsM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ah9A3dQRYjBLkQuBpBtZjnPA/0NfGmQydKBMx4pelrrtkyi23G6Lpb15uGml?=
 =?us-ascii?Q?EzGTRlcOtsSLFtFu0GcoQ4KjKVr295klv6JeYvIfi3356Hv10De6NxBGdAR+?=
 =?us-ascii?Q?VYu+V4gl/zTjgocEs8EyoP73MO01zNm2HaBBpGF2V7nE4AAFWMlvAQUgOf2P?=
 =?us-ascii?Q?Ri1luA+5Ch5R6XW4bka64s2hEkKztQSdIes9xEH3T1SGrwnFlt7r90LtdJcL?=
 =?us-ascii?Q?GdC3a/S23v50NkNpMw+SqEKh21Scm4shNC9HPUevK6QM7g7/vcjIZrSjNBFN?=
 =?us-ascii?Q?hSL0meTOLlilHJn/GcF+Zhta0RAKsnhVEadGPnxKQmHkZoKzmBHwXPww37oJ?=
 =?us-ascii?Q?kA06y7z53WOiKF+UAC0yWRcTk5BEAxRBk9LCcs9r2ZHnhTcNXb1oYQxznc/8?=
 =?us-ascii?Q?61V5F1uh+NYE8M1MU8mCfUAjGduDRP9xYR4/PElOrIRHhWEfKp50Cof7rovD?=
 =?us-ascii?Q?lVzR4+rVZguLR/66BgprNAY9TC2htZnLa8pNHyXiVV8LviioiBuwUCZ2tGnL?=
 =?us-ascii?Q?CSvQf3mTE6OiGw1Ep+DgfVrvY6diPi+Ln1k1Ua1EnEKFFgkzWKclfToxxEWJ?=
 =?us-ascii?Q?p/Ce8+CWskZQMjaFaHobkjhwbLZNNWBRmzjg+hy1J+letJDA8sE2p2x8vzmm?=
 =?us-ascii?Q?d9TMPusfp7kINp420aTWF9uWWi55ZlC/f2JABipRuWAnZdyoosuJXG5+fYcO?=
 =?us-ascii?Q?2qCeT3bejCnZySMf9CLhY8ECu/5k51Yg8fUjQBXTz/uHqdICEIbYjuCPpYxY?=
 =?us-ascii?Q?2+mQpZ1p+O8LEwGDMTLc3R4atnZehMS0tDSzBIf7nVf82dpn7ExecEZBiZ5e?=
 =?us-ascii?Q?ZfDqyLIWHW4RDo0FQ7ZA2VG35b/es/CzInoRVQt7YgiW7yUqRtSwWjolaqDK?=
 =?us-ascii?Q?kRDwmkp7g8RwDA0JMxCUxjvR8EyX/Q+98qMFu6CE3XPoSB97y08eEkwcjPmS?=
 =?us-ascii?Q?n/mMrs3roIzRlaqJ0mxxo0Zb1w0GVJb3Haux8l6Jj61ahHCg8GhbLKZq+Zv+?=
 =?us-ascii?Q?k7BiwoeYbPYq2nYG3a61Pa9bUmskqjyh3ugwXGGCI05n6EWI2h1luYuzGGzP?=
 =?us-ascii?Q?anOvbvL9HKs5ur+C81TEak2BvroyVkkbmL6ncOxLlwn5RSIEUvImjBqbkEPe?=
 =?us-ascii?Q?39qSJrCFsTR8SxCjIrhryf3BARexLDc6W40E9rhBIMowHO9KKI84gnwd/DOd?=
 =?us-ascii?Q?iQRCMU4S3arXkB9GZbh5xZ7TS3hXnV3Wr2PbNWWDRR3B8Z4nb2TRnQ4aiTtZ?=
 =?us-ascii?Q?I06hkEkuRaq4vyB1d0Tlch/OB+240pkGyM0iCAgIexNDNXykk8N952qzA7bu?=
 =?us-ascii?Q?0qcXRefOOAybB/9byN9j2f3ILBzoiouj84K/wusrTeMw3+HcgjZuvIJ0axjK?=
 =?us-ascii?Q?DG5nPQbRM1OdLNFzvAnQ/7XrFVmjGDMFRxxRgOn0Q+rxeK1nrayD0NbsEhfW?=
 =?us-ascii?Q?6uQ2/zfBFJoDIfd/UejPdNVPAW0rCLtSle7r5fq0S6qOOCduup8YxeO+7Xdd?=
 =?us-ascii?Q?C2eTRmH1cAcnQPEs8iAvgjUKcBYiEIUJDQr+OVL84s1Tf3mbcxrkcS6HmB1t?=
 =?us-ascii?Q?OyC/goUVLYIkTbB5bUuNvY5XbY0mvY5rVKRblNmgza5Ww3z5qrhWmIIaIqNp?=
 =?us-ascii?Q?fXU+sboNEOEsRkiCtDvsJmW5bOHy5hZghn1ohkSPTbDMFVWWrY0gTseJlSc8?=
 =?us-ascii?Q?L6ilzwSaeImYeXD/MByTs/iPsXyuaMYS68Kh2ZG98h6l6GrrSdpvp/vdYZL5?=
 =?us-ascii?Q?4lXcx3NEiijPkY7a4ldpe6P9I0NkF4pXI3Kt99s+so9+8ClvwsKN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b03578da-77c3-4a8b-868a-08de7827eb23
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:49:57.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0FTFg4hcH8m9QYK53/bzg748i1bpvDe4jQYInjdAhVOxqWMbX4qK1zhLjmgsYFGrsv2CObauhzvywlYZ9rqpR+PG1tC6V264CjmFNqKufDOgAhkXXtty32OCFM4dpGg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Proofpoint-GUID: xFl9GT_GWfAq0WJwK5Bo1zYetec_IQr0
X-Proofpoint-ORIG-GUID: xFl9GT_GWfAq0WJwK5Bo1zYetec_IQr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1OCBTYWx0ZWRfXwnrPhyBGwty9
 TAOCE9cRdlp8Pe6wCaksCk4aMrHjTdnky3ITwbZO1ouCHLlf29BFssf5ivekSqe9NnnW/I5HCz6
 Epd7HWj3+3WOpytgyMbt7l6bqILlTXDVCXOf6D6h0hN98RVfDtBdJPi2L/2HkkycLIzUAmxW4KJ
 rB528Eswf4yn6eOClo/J7ld1KqeaIM5ZwXw0nWTfSODDwihDDZvB5MpAxmFetTzG2L4xg3K+jU0
 yoO0qBITo9veonwp+VIF0GN+0pQKFKYtGassr/1vBu25beEiObtoGoIqo45RU+5Qz2qf+1zNVRT
 6pESqNOlzrQ+DjUro0TsYHWbqgiHgQs1qiHmWsvr7o8O+XHMjClMgoNrY1deusIBPyKrScG/V7w
 f3rT9z46a6zaRVsm4FNKX913i24JCUEGeonRYQ3V6qJoxCOTQ/+J1iwuSm7PNgqzwxdqkhtKHsu
 NGVnZd0ltCwZjjy7SXQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a53317 cx=c_pps
 a=k/S6D1Pxv1bk3xTbD0KMJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=IfxdZDZ_SRiogsoW8RYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232175

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Introduce the CLANG_ENABLE_TESTSUITE variable to control building and
running tests for LLVM, Clang, and LLD. When enabled, the necessary
CMake flags are applied, and LLVM target tools required to run tests.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  8 ++++++++
 meta/recipes-devtools/clang/lld_git.bb   |  5 +++++
 meta/recipes-devtools/clang/llvm_git.bb  | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..c3eeb34159 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -77,6 +77,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+CLANG_TESTSUITE_FLAGS = "\
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('CLANG_TESTSUITE_FLAGS'), '', d)}"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..8960cac2d3 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,9 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLD_TESTSUITE_FLAGS = "-DLLVM_INCLUDE_TESTS=ON"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLD_TESTSUITE_FLAGS'), '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..128cfb0a90 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -80,6 +80,18 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLVM_TESTSUITE_FLAGS = "\
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                 "
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLVM_TESTSUITE_FLAGS'), '', d) } "
+
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
 DEBUG_LEVELFLAG = "-g1"
@@ -119,13 +131,17 @@ do_install:append:class-native() {
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
-SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', 'llvm_sysroot_preprocess_testsuite', '', d) }"
 
 llvm_sysroot_preprocess() {
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+llvm_sysroot_preprocess_testsuite() {
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
+}
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


