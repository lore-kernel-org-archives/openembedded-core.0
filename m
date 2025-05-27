Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98560C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 05:00:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44301.1748322050058705343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 22:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=724287ab7c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4cXpN014852
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 05:00:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b12ap3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 05:00:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC95Gopvz9BFWGOaRV8EJIO/kmF8E/TMzngkL9RkruLQTsksWaBH6/6GdF40YYLYjT6x/llV7XnYbNvbAXQiTI8yZv5sTCIP9TkrEbj0iytKdnUBD4k43HNTVrBeKwPR/J+ObDC8Cd4qcYHH0/rWdE+EKh4OBvMZNHsAr91S5IzJYD1Vh8f6r0ago1mi5YL1X5aTXEMRMlPrtf8JioAgM7V4PzFUJsS43JjfyzGsxYr5Cwg07oHBuu3NZOFWrE5yymFr/fhyrkkvMxoyUXKxqJlPnZ3yGbr4RX6oppxZBcPD5XaIecl31j87F4ewwqz3o8V+23XphuoOPzuxTv2qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuFQMCr0tQAjUlAEgEc6Nsm0+oY4E9XjxNA3yCq5q0g=;
 b=vvlYnq1nbEyoi5juWsK9L5elvjXbJtO9OTyf+D6fJW+K+1njKEMqQp/DyGb+ahqD5mZPkwYLzCqvriKGssTfOjZsXMdXwafjE8t1JqEMWU8W5gC5yHGfrUa62xfk5cudJjZB7pOg8yzEdGIPR0qP/SIP8xY52SqUlWV6EBzOEQlUfT37sqtGxHE8lJtH0eNXOEBtQC81pNEETMZ/3N5o2cKPc3cOKK8R92LnEsvAopSygj73ujSGPYTfx6svSxdYACgWOpdS+jmN5GVcXJD0XwvACoCZZ7FywRJnD3sh69XLxO1i+hSnn1xxpihyBlmwcYczrXX5TxZPLVDAp5FxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 05:00:46 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 05:00:46 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: set CVE_STATUS for CVE-2025-1180
Date: Mon, 26 May 2025 22:00:29 -0700
Message-ID: <20250527050029.2628452-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 554e2c07-f4ab-49dd-276b-08dd9cdb70ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UtJiFuWNfazjGbfj7JcsEyB31LeKmck7XGV3WOeMElZ/YOwIaIXGJWKk3T4Y?=
 =?us-ascii?Q?zKk6Snt9JCFRvMamE5coOp0oLAz0e3sg2lHaCTunP3+o0RXRtHQ/7frej4kO?=
 =?us-ascii?Q?GztNj6K8d/OQeuLkxDrCbfkL4Dx4r3Voy1L+KcEl9QKn5BMRjxBiHxUCdXIR?=
 =?us-ascii?Q?oWZApNnQRyGI87KwAGMhLY6IJXlbypGzkA0NtrJUlAcMKuwIl2NQAELM/dL2?=
 =?us-ascii?Q?hbQJ5PTNGXEErHYV5EWYCzD1AIWZkElli9SKKtrUPBoh6b/3m8YAYoBDOeND?=
 =?us-ascii?Q?AVLwkH977V/rx2oqd+OnN0VXxXGGipJ8C2JZuOtwKrA+Mv8NcbYRbu8zgxMZ?=
 =?us-ascii?Q?skqKFZQlnNwKdr86fio0BJbZvuPzKjlNG+wt/14A2wFzRh5UxtJ2ieDolgRz?=
 =?us-ascii?Q?EatT4vdo+DxJ6pA61daNt3foiV/c9BDoF43YJ1Iz+rip1zr7C6otq8p8Y7aR?=
 =?us-ascii?Q?lVv9q3abBYp4uYgdXFTOUzepxrBnh+VYH89recY/AqJs96XlkvgvPBw25p7Q?=
 =?us-ascii?Q?kBNkajKFNyk7O0vRF5DpOT+rnSjX1U+GZdJGLojFD2iTDCPcJZs8mhAQ8xhO?=
 =?us-ascii?Q?GoJC91pJhA7VC2pKWTczwxJ0TJhuhTt9rS+j5g/xC6c9/cdHVdKsT+7ukf80?=
 =?us-ascii?Q?a7iLkHDZiBfggKCbn8UZyesYlFvbmOsBQyLbyjopEzGVbCnKoSfJcxZ8oZ1F?=
 =?us-ascii?Q?vToAQELwTNMSKe+jxtK/TVQYdp1THb7b8bHh0z9/Qw8+8RfZNFYOZFsszsmt?=
 =?us-ascii?Q?129NB6+ZNZAMWNibhVzuzhpgxhrCoZeR244/LWaT9YSIoSKJe0e/MU3FqHUw?=
 =?us-ascii?Q?Gd4UNGt9meHKo3zmrq2b9GTwPF0Lq2ye/+P6qrS6QgFGWsSGacjzZGrb932Z?=
 =?us-ascii?Q?f4ghSYE91PJ7qGUTMVPjdaCmcNjAKDATVem/bzrxFIN21PWlYF0V7tSo3XB2?=
 =?us-ascii?Q?xX2ws5gKSVH2hcz77tZgSDhUkLST2AFgKlp6wLWeIeBiA5Yndg0p5CoA59lo?=
 =?us-ascii?Q?aTDyoTn0ol1V/oBnFcaLOtYau2a96R/RVdDmhWs4ZyxoHG4QD6H13n34h/TU?=
 =?us-ascii?Q?AthZKGW4R0ra2ypERGRTwz1WYszqHi+Gekl0mgrVZZGLG/c/cLV2UX7kD4dq?=
 =?us-ascii?Q?YC+JDpgx64PUce6cUwM1axPlOLnRLsKqcHLn0RsNoeaMefxGRv0e4YDD6xfO?=
 =?us-ascii?Q?saxnVoyybtLzLZaubpns3vDmA7f+9yZiF4S6zF+LzZ4e02L8mnCWy6ar3UwY?=
 =?us-ascii?Q?1xx1ROVa2QLYD+s/+JlPXyJiUeLA0y+CruN1r4vltgloBHOA6SU/ofknU013?=
 =?us-ascii?Q?imVdZCGIAK13YkLL0rj4ic+x7yO7qKudUpmc3/KwvVjLfa9vL4p6+KQg9DgC?=
 =?us-ascii?Q?F6T4J0zWxNaL8/G/oaAgDCnQdypIU9Cn72RTcL67TNZOUPBndxe5exzEJc2t?=
 =?us-ascii?Q?WaBU9DV64XdaHtOGFNlM3ywYAY+1KVP90Z5lSvBUBt3kUeg6IByzC8EpPQ61?=
 =?us-ascii?Q?HdIWFwTCno6GQHY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TxvBQR8ZEobH5bTvW/3JYUINav/AWNgGPrF4To89vzO1vnf21TYiW3TvwDyX?=
 =?us-ascii?Q?IiQEjHRBjuNS7iwc/MH940hk6c9rhCCcGqI8vWdfTchb7XGGzNPM7/8M+ZTy?=
 =?us-ascii?Q?q04scPkCKorba45qr8PlvbJ8h23yhbe/OFLkEeLi6iBd8yJCo2vG/hYlghcW?=
 =?us-ascii?Q?po3hydzoKBUlIFplQ8GxP5RtpmcdRNLAPjI2PkQookAVDmTxOSASPyDyp3R4?=
 =?us-ascii?Q?yTKoRaT6F2V/nhH0+ri3AUkwHoL4Z6UEIFVVcLScpWVvqnb4zLsXgcJi910l?=
 =?us-ascii?Q?eSo+K7Ym/3PPu4Fd8Y4J0CKNJ+dRtaxkK0q5nBlXcBilXzMVUypWadOadrVI?=
 =?us-ascii?Q?ENCGsiTJ9+xPcWu84OYEDhLkjT6wlWKhvsJO1KqVOrpRvvKVWWU7+3VNDKJo?=
 =?us-ascii?Q?3dBXJbVzyZqEb8viLG77IkwW9K1JQ7f5/k1GiH8TATpd/+kD/HDeUQls754b?=
 =?us-ascii?Q?IH7KG1tiNPr93RdmNjjczxXcmgBPpvDV+CMU11TMaQD7tZBSObSy7sSu+3RN?=
 =?us-ascii?Q?hVRNoyTZdu5KyQtlo3otqHl2WvDDXCpQsZTfnpmtlFn72yKyIhSxpurcqqTC?=
 =?us-ascii?Q?F/1SFEdQy6g9ZGzWBCATZFvRkfEbQBELhmGShhPUFfvNt/PMMwU2LljWMZgi?=
 =?us-ascii?Q?YzNR1Py2toL++v0QK/HPKSFEhWtOO9YEVcyOhP96TVLh1wXK+0XF7HXwPB7V?=
 =?us-ascii?Q?Jdt14tuYTshCe1IZW5dgR5TySD/wB6XlthsyT9Vuz1PN7VxLKWsKCLEoTbbA?=
 =?us-ascii?Q?kNobQ5n/NQKe6YV6Xa0hXHDYjqfJRO3RuAOETpZmU9qLvO/Cg7ceEDb4WzIW?=
 =?us-ascii?Q?x5zhhnf2u6KiIrqNyzsYaL3lORfzbs/yXcJdyVpyifvwUtOvD0WiMv49GBXG?=
 =?us-ascii?Q?5SkUaDPCV/ncuyjFyS5TNImehiyDZDDJf45UlxS5T0YTgzxtAPx/Heh6lWy8?=
 =?us-ascii?Q?0ifcy14GpDqLlffbe85C3bToSHQ7PuuzgNq+jlIPBQbNbIp1Fb5a6IxBARp/?=
 =?us-ascii?Q?/yJBem9c2sLubp8arLQ3bHLuTVAWaJe/ETYkyqaXhfrcuA+ig5KNxcOtb151?=
 =?us-ascii?Q?Ksay+6HUiEOvo/3ze5PZRmP0qBQtSAnUpDivc6BekxYCLKd86aZMjee8pqPc?=
 =?us-ascii?Q?A8o64g/+3JcgsyyrPwUN5XACcWnk5ngJO1PIF20/cWgDoYT3jwHZMabApjA5?=
 =?us-ascii?Q?YrgOlnb7diwP0l545WwzBPuIlEsAqpG7AFTocgYFVe6GfqFUz4pEqfeoXNW4?=
 =?us-ascii?Q?zvtwZx3jzFFsBaS9VmMf44PVCAIRRX7Nz74dxhg/khjJ/VxkB3AyQCxCh3Ck?=
 =?us-ascii?Q?hVP8xyij8vzQ7bakRXas6SezGy98kaLFchOsUjkmLU1vKXt1loa1H5LUya1G?=
 =?us-ascii?Q?UNwz/L1L8LByJg8kWboPBfuodSmliXRTXokMpbjvzYaYh6I6MOAjV2SnyAwF?=
 =?us-ascii?Q?pDaUMuBe+RazOkVIqtS5JRtxxMau1RwhKl4PQioFaHBFXv/WfYBEBtF18pV8?=
 =?us-ascii?Q?iH0acNcB3yLB6CP4HR6SOX5+qWWnhOkiKbDyYu2cSA0/1z5cJ140z6QZUT7y?=
 =?us-ascii?Q?UcgqwkzrfAKtWsMBgGOxDs75YHjLKqaA/V0AMTo3Ya9ruHRMvwWIvlO4tG/z?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554e2c07-f4ab-49dd-276b-08dd9cdb70ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 05:00:46.4290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5CkizkHfbIKBneApKGcGRpX8XuTSRUfGbz9IPspZGi0UZ2NegNJYvbJ0Mt7AajSeubNB4P8vcjOmc9YNrvlNZC5rBwCMIUSjoe2g9p4614=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
X-Proofpoint-ORIG-GUID: gqcYc-Y8eH6Gs_i1C0R6ka2nA6KzOA5z
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=68354701 cx=c_pps a=jY3SVLPFeUttfGeyR2Uc8g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=4wFUqDAEqhTjfSuwD6YA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: gqcYc-Y8eH6Gs_i1C0R6ka2nA6KzOA5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAzOCBTYWx0ZWRfX9GjHZ4+0dRyl tyFLR58EjWZfSeSW8Y1ME6cmBoWD4kDX4YHS5JJO4Vf9pQf0SzCyCd14extpPyhi46l6WfK8Yj5 w+5mGcvFs4nNmURHFGiI1ad1mc2Uzu+Mx7SO7y/DdrMN7Gc0NHwm82HviPZ4qy/Szd+GPF2E2lH
 VL5eJfo0KNKKApzDfp1P2jJjMaup7nTPT+ZfHiE5Zn2mqzrH6rn8EtW2ZgW9CNdBsjIJ9DtULMy sJsUv3UF1VFQdyQ6+biVn8WZXjDioqz1wWDHOH3Pt857W30OT94wr0939LOEWqwmuHDuW+Fddew VZjJnXx5UuftVDNRhsyMn2PUqR23uo4r54/BfWgUpkNGnHt5tWvsxn7HL/SVvm944uGQNcJYgxX
 HrZQD/CxesrfuCKOgdn3+QH9xlQV5BhE0B1OKbOOxy3tfJF1j9/tsxfTDovu9lWqUuLx5ZvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_02,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=819 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 05:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217281

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-1180 is fixed with patch from CVE-2025-1176.
More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2025-1179

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e103e712a4..86f6446aa5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -19,6 +19,7 @@ SRCBRANCH ?= "binutils-2_42-branch"
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
+CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
 
 SRCREV ?= "6558f9f5f0ccc107a083ae7fbf106ebcb5efa817"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
-- 
2.49.0


