Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA48F531F3
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:38:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12942.1776148693848476273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RNOluZcD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85643df1cc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4JCdg1736977
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=g/ynJynfBtghPFizZhkce6MqzMsBOMEm34XNbP6pulc=; b=
	RNOluZcDV+5aXRiXetiAKyJWHw+hqaucC5dST9/hqZ0jq6rMSk3MBHWUnSooYIqC
	IdgcX2pEhPhgxEvJB0Gcjqo9VLQUaBA7Hp87EvOZhFxvHy7TA/2i1b94moTucr+Z
	X5Pj7NkOihaldKp4C57GV/ukboDLD1Zt5DSUMGEGPemGuy/YJfZRa2awXkTZjPEy
	jhhQAlY3fSV7EM/t4dFiHWLNDnSCpWBXe4Yk8ct1hwXonvGPxqESfgx8mEwFLbgK
	D2uDvVSNbe1hoZXEfmQQW8CUIDUfAq+dILy4uth3QXvkKNXrqbIiqAuNZL2Q9S54
	DQREpt6hvqPLvKClJol4UQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877gceg-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7xCgnh9W+Y5Muya57qNo9hD7uqCb3gS4duUolQQ3Q73MvH4dJ0RxwG/oyFBI1M5Z0cZRQhiaDU8z/zj5Fh5hF+As31tQIvvaISG9hDQXP5jLEbmQKtzwfrghl9+9pV4QTX3cVFKGPW+ekEBuo+dSHAsFwUef88zu4rvYruxGZxHZWHXMifoZH3VUcDUyvRYGL7GyUtonkcD/3Y75D/ABOQYis6w18HeWPBU/JSWLmLDgqh8+pnpgV6gUmAcXSKEZhmpkQ8XnpqM5D/42TYBAIm9DEFU/5+0R0u2xgexAYvTURdmly0jjGtb+IpJsOtqM3Yt4pgXwHXLCFRKMyrzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/ynJynfBtghPFizZhkce6MqzMsBOMEm34XNbP6pulc=;
 b=f7RwpRhzpeNThy6qAlwTgzv/Mn5o/rVqrwggk3hM92ckxlh1SsswgYoWZC247jc3jFUPVneMdYNgT8Ro51Kf3DS5uXrs4RHM/LDJXL2+MG56SoTSV9cZw/UE8bPC/JTx23eLXaKmbRNagn0tkNe203cmK6NOwanzh1MdKNRaPLFX9QAviCaWln37kKhLRDf7QYTRM3B3Xck53HA/QJ35RattZXtiQeAyCeYkGKtB+mMYeyme+LbvFaRUoI/7yZL4M49ktFwZT1uu3Ljba8XnvXrOxKuszly9G+VDz48Cl9LqUgWW5Tt9eTTF54tLmH4betw2mMRXW7IogViUmw7DwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:38:10 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:38:10 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/5 v4] clang-tools-extra: disable tests
Date: Mon, 13 Apr 2026 23:37:46 -0700
Message-ID: <20260414063750.2315189-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
References: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: fe43e467-11c5-4646-ba3c-08de99f0655f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	HegZJx5dJC82RNrvt57KwPww0/V6VoyldzyoaCp2b+FiHRzWk25G2Orw/h59kNVAV+7yPwPOlnLFlAWEvO8YT2tVRISf5uZ7lNcMjnStr5CpEbtWxq7yZlhbXZ1I2QwMSRbCuK09f4OfgdEX9kitSoTgntKcNnfq3BqOo4gZDqXY2qXyRZYl8wsPDuvT9qPUGnvwfws9XiqDH9T2ZV0/m/bjCYES8tVF200u8ZUmjeIfoZihafRRB7UNLXKjq4EhonRbLxRUF8nz3l2yAAHOljJwiZ48/fIyP/42NBr/7Oe6E4TjR1ch1CbNvzHd9ViaoY0klglZ4PLSjGLA0+YWDfr889dPDgIVX7L7I486SBOmhmO192xjDdYT6CHz8unGRD/hCIs2CPU4n8ZNssPWIqV5qjOxcylM33kiG10pw7Ty0j9P76KePnJb//etrbQAzIySY/Sbk3+Jzvz2oiePRUYm6NvHUhMc7gd43HpnxpukZiIdCQ1lK0CCJmk+77/dVoqLlZwQ5D39eeXsDANN/MYrVhYBel44MvY/IDN7wXNhnr/7QGuG99FFfje1uMqetZyYoWV28GKRUGGI857w1brC1c7CWe0Ls5TBCNwWXUHOVXqSRq20KgzbnblTPE/35zjwAC+f+w75HFY4i161bp3q7HkXpa4hfZKJDdkGQr1DPGoWO4t4uRCZdQRSeowogCtxPbbQzVzlYQi2B4ETi/xdZoQifgIc1D/qmW9bpOIJwdPQGKTYLy96uR00N9NQCcofRm3E7mIWjMxxq29RbKrCDVa798USYPcXqsIiTE4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IgIghynlNeVlPrScIicSRUAo1hLlpVVhWp6CunL97gPRuVpLyYhqSBynIqwP?=
 =?us-ascii?Q?n6Rm7GbpEZ8OWHHGH7TeY1stXsU1DV+6VN+wONsqZ7ZQ3PW7pB0/f0FqYPnP?=
 =?us-ascii?Q?zp4XNiKz36Xk7D11U/5wWlQ0jHjK9RNJgff59xFlg4dab3XL+094KEfyetBS?=
 =?us-ascii?Q?4cwcqtJo6WYMX8bsL/Hs26J8Adih8baPB74YRteNfK1ihNOVcOFaljpGtiz2?=
 =?us-ascii?Q?IyjhuxyGgeIMHWNJMM3bp2rPZrOkPqxPaNlyFy9v4uZS5lT3RiqwZ7hDpS3p?=
 =?us-ascii?Q?vhtT61/gG5/TSVUdAkvq+kWG3DFmjdhY6Dbk7sMzCc0u7k7CNqayTMLhTjNm?=
 =?us-ascii?Q?kSkZj0TH4kfiPUZ78G0vUDz3jTJG73yIe9PT1yVqNocSdAzziXEO4W+eFEM0?=
 =?us-ascii?Q?xfXbVN7DNwkR8WkdWL+FwwzhjqqMZVuGWw7nyqLBFp0xggcHUoVeIMLyrvlK?=
 =?us-ascii?Q?/REwJGNQFtyoGyGUHl6BCXM9H/uigZ4DGaOQJnhdYKrAKcfixoQDZW03pv7l?=
 =?us-ascii?Q?ObLhQDXGIYXDD+D4sRhWCVE116zZw52UpwgePm9RdnpyyXC2zx2td39xP70Z?=
 =?us-ascii?Q?t2LH7ud4viQ1Z5jYKm6XnVZ60sBaiedbf+sVkgPLmYXARiDl55hrWP1JlOAW?=
 =?us-ascii?Q?p08ge81hoW0zr5vpymqo5BztoixTDf7M5IPoUs5TaHvyPbqFavKn6SHQQ0YY?=
 =?us-ascii?Q?pGNKKqwmT0RoeLnvzLl2GAxrCw1YZs8ef/qa7HzKsM9ONZxwZCuKdUw2dq8V?=
 =?us-ascii?Q?qcYkP/MqaxstOncZsG2W9lk7XO1WXQ25Q3DtRBt5hLdOItwhLMYsEYaHHmdi?=
 =?us-ascii?Q?KtLHcvcrUejy5sUiCeRVwaBWtrUKaVVdVlVpWz9N5VHhNAEdpuCeuGIQFAt/?=
 =?us-ascii?Q?4bf+LVhcinx+wmaU9HsBEoYIJKD2zS9X59YfZ4SQciHd6AcxgowBO89UzTux?=
 =?us-ascii?Q?oaiAdU/lxi/9Mk6J9KHFQvUmYyd+FHJ0nS6oWouZmY62Sh67C3hw70uC4BMx?=
 =?us-ascii?Q?eIJ/d9hXqRV6u7OxFVXqx6yiuxbs1FJ3qbVR/xYbgm+5BJEig3Sy6k+/o7y6?=
 =?us-ascii?Q?CkVY54bb+Gk71l36WAT92U3klaYwzbkNelHAK5Y32N8P5bsGYBfP+lHJRlJs?=
 =?us-ascii?Q?7vuWqhwk73yFkwWKqXwsynSAPeDtdZfpLRla4qrGwsACSDUx4vnUm5TKLCUs?=
 =?us-ascii?Q?vmjZp7nfJWFAIuZIsLMM8cGgdU/qFQQSF1dAWeo9aBKu8tB7ymb/XizHiq4y?=
 =?us-ascii?Q?ev66LIDSo54/hrkRtViv3/LeHTJYEj89aqsnYOjk9gmsrp+LWAVtPMSFdd17?=
 =?us-ascii?Q?EbSsFcO6icNOktlbhr8TSvkqB1GgCuhq7gnuxSQRb/rx7q9Xhy2GLoEpyIWm?=
 =?us-ascii?Q?ZvGZcJWVtBgAuziaiySq+NsNvTUB4voPQ8Rrh8rekA/Pvv2FFIKhQq7/RJDW?=
 =?us-ascii?Q?/PI8iH31eWjB4zBI4QGXIpRz/L2N/rqsTMpksFk+awlVPfxXzc59GfgEP9gB?=
 =?us-ascii?Q?XB7V7OCfM9f2jsVJ4QWgGTdGV6tGjvH7gPNtfRjpIIY8e0p/o5uyFHdflo0r?=
 =?us-ascii?Q?5GkV4Im9I03Cjv7Ua9y43HjrRLjrxPgtOXWKCb+SxQ/uWYzhkdy/hISlIFuB?=
 =?us-ascii?Q?a5yPTWLZ3J0MzFTDJkBgYWXGynLO7p5jKIpxSmXOTge7ZX7WAAV6JDOE++Rl?=
 =?us-ascii?Q?4R80o5ApJSNFhIDiCKU1NuD9RfOX2THYrQOHkfXCry8AkSk/jBvduAMk5pNx?=
 =?us-ascii?Q?A3R/cMjydDmbmCnPaHVdtR5R8C6+C2UtN/YL0QJo1pk/60gzeY1x?=
X-Exchange-RoutingPolicyChecked: 
	j1Fyj5+dWSQkqwTi6npFzjZvPMgt+XS+8UOqNlV1PtoYNVCMdEZXQq6ca1pJJiENyx/KhdChrdAYokcsI8WRf5ALxVMpX71PDzn71U8WjZNkyCmMVGiY1HWBE8e6WYt5FywEu3q9D/BZwts/o9GM2/8hcxJgTkOxd062Tq/XR/LqxDNO9eu2NxSLfq5J7uWdNc00sAmtriDraVuOaOM7KZOOYAdyDJqCZPpqq2sr816RTIB/Zri+lh5YrykFc6qO2HtP8eent6bGBuNZjnnG7PB0+MV9gm72DMDY8gKEm8WiIg2VplaJE7PyIq0Bp7CBM56uZ+Y/LNZYRNnZc0HwDg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe43e467-11c5-4646-ba3c-08de99f0655f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:10.5854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FA0Px0OkcDF+fDw1BQervaJ050l4p2DN/jYVdCSk6/qHbNN2OXtzxMS+j4z9NfvIlHbAi/B+GAeTiMlm2j42PU6X/rhh5lk4PrBlqZ7NTlOswpVV37eI4QpM8aXWP/S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-Proofpoint-ORIG-GUID: nwmvtC7BgJsPMU-vzi_F_X4T0haiMr22
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69dde0d4 cx=c_pps
 a=htKwazZePKloe4WR6Wq9JA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nwmvtC7BgJsPMU-vzi_F_X4T0haiMr22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfX+ahLkP2bY+TK
 GlsqNQNZXg3Vn0CK52r3oWh4Hd25cir3n8jX75CHYAghB1+hboolNpwuZ/AInK88uj1jlX+DWcJ
 1+orEJlYvp5XlPyapxRvkmTSUqArGbmeeaPdYZEAOuRKiwfdVVBGcdDS7GlDoIv8h6QepSV1GcQ
 w8AUl+fnFuKu8U35Hi9H8APtwZ/tAk7T/MeI4oumfW8qH8tH0L8Anj+LvHY6TcfCq6D2ecznukb
 SboPlP4pZGx/oK1R6/3UC94NsvVnCBhfsEdU/Przs1W3QPnbRqLq1iTGad91y6hM5b4Rs30e7oZ
 mB5v11LsVcspNq3iFmJMyBiqOFqlpOK4eIp1aQY4plRWa4vouG6R7nNctHlrN1rHouIHDg37zR6
 PR8rNXNcFZSvm8EysNl6ZLu+PuPSTG9FJ5AdJtY8LGiEmDdvkIyqIG9Svw2kDpYMJCHPDvKFTs4
 WryuxGisFPA6l+K39cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235137

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0041-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0041-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0041-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0041-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..9b4e29ff64
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0041-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -8,7 +8,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
+   "Enable query-based custom checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -215,7 +215,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index fecc98d70a..68ef2c00eb 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -61,6 +61,7 @@ SRC_URI = "\
     file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
+    file://0041-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


