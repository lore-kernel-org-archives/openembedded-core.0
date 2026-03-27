Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEFF10ED679
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 13:47:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73561.1774619233597865257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 06:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bEjt/g2Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75462cfafc=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R4vuQM1439033
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 06:47:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=4G+EsdWcd
	CHyUp49wZ1qKZNcF5tfH0aXe6Ysh++yCWM=; b=bEjt/g2YQWpTWH9Nt32qgIHjj
	14ObmxjB8BhqjSJFtfz0xr73lJ73wwOcSk0DTQvSdvhhPyBBjnxsxscIL8Cxqnwm
	1PW2gqBrI44owI3yuwLqhztz24mjt3Me6Dfl3wW3QutqTDCKn52KC5fb2LhBciI4
	CPz4sIPosUQScfWM4CPDjZYsebjr1OYg6B5GhqqmSWYKo/oGkTIq+FJxzUh9Z6Fr
	P49KmPjbgTeQNWnC1OItOwzQ2f1AyjU65Hwq85tgAsoezCgsursSFmMFPhCaoi7v
	JvPlKR7Wmjpb0qf5sGndsr0X1TSKkPJ+IWlJcLSvzEL0F5NtCnq06ZjDglr7w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucyr14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 06:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULeuE6I1HqwIBb90iUJQlJwy4enzblX+j/5EpMxLpZ0Rbv9iAjF/iW0Wym0z9xcy3HHcmo4z3pwyzwWjQgLiBGPuonkMKF9uMp5IkGGf0kkpuCVg5OtTappxXrp4ZmYW+QUb3TPhpCVzsI/8iLJt9dkcmmaUvlwZ9GTybKBsCYPtFx61V+f4PB432f/kuviKWBkScmIfQQDDl0Oi3VQLSi6d0KcbjFy3QoDKdt07oW1r7ns0hOeZHQIQPlPuf13Tp9SQFNEM3w0wMpyk02aa4DQYEqpkYrJ0yMqusn3YTLM9Du+omorVGNIeywclKETTTreVq12xpuyzTeExWJXj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G+EsdWcdCHyUp49wZ1qKZNcF5tfH0aXe6Ysh++yCWM=;
 b=Hsn9g/udhwRsYVONAcJ4xKg801oK8wwQM7IQpx/gg2O5p21YXoh8nbPw/iH5qa0UA06iZ09jytrm+9HRTggWGTQf604zaD+4thCAYJKQHXvo6FL0oWJ2WeA+vBWsFqf4ein5Y47/ZePiKK4lMAPbrz3LIgoqWLdsjg8YjjHtUpbIQAQEQIs5vdoIqn5YhMdQfz7nk4K24fyG1Rl5nxJP7UYJ6w1fYYeiKBGsieCeGm/78syG+b9QrRX4FVpq+e74173mJoeVfPdGybBsZz/EYbU2vV7fQwrD4w7K8WHN1irVZYq1ZqzH0jgNMxdNY3UQIxTkfYpIluw4EAqouDZosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 13:47:07 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 13:47:06 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        SunilKumar.Dora@windriver.com
Subject: [PATCH] license.py: Drop visit_Str from SeenVisitor in selftest
Date: Fri, 27 Mar 2026 19:16:35 +0530
Message-ID: <20260327134635.36573-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::6) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b24b8d-4bb5-4403-474d-08de8c0755ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RDMa7M53X3G975NlzLs/2wM31xrfjYI2feqAFrEzJtGj3RoriGsqEXCKMr/wnl1ALGM64azInTMV0zRMDDk/GnmU7c4qvwlB6rmmu01ib9P+g19RvN0j8ACBT3OpGGMwv+FmunWj0ol6bzfOZ1JcLHREVo8qFsa6voEmd3rn2jT0XWJBJ01+3kaG2mUPhXyRh8cEchiwrzkdvi+X6kcsOLwyzUACAb6rC8/lvzseD/uA4guQuWOqzbmZz46EWzEivdFfB1jP3XTspNhhLiGdd//po6O0aN39PqcXLu8UEvxdRrjMhGfNixslHSnvGRpkG57VDMgpq03ucDq77SZFhSGpLi5du2fHqvDygQXUXidj/OhkRfWqxgnnUOYx31B7TkwuQ4TnCTpBCVs2hYXBSYkGhAq8z8arAS1jvxMu1uz44OSXaLVQGU/HccIXv29L7ToJDF3C08p/r8iib324K8bYVgohipE5G/abOKa6UUxdHJMoFC47PiabJSRpiatSybFRBve5NAWtzZrUc8XpyAS5SOqxatRazZMuxBs4ozTp1+2WY70rAoL/HSQRsff2hYjgKIYS/zAXTYSVvNagJtKynAAWWiw0Fxh0PCGb07Ei8hIjuxXXBo0j48NxEmofPeZjlioo4neLycoNPIgOdz7JgaBtOkL2eFgnBAdWnjjL+sbzSDUpbmPHXR+YHc7nuA6ZBMGBK+4GgnDXTIeik0CYDlHQ7oLIfwu0jXJ9RitYpIhuTsdnvOw/lheVxmaEYSJfxUw3jRwG870GOcBpdxpItYfd0zuMMAkWme4ucjA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OWsE5jqSESV/scS1HEvvdPlgo7/CBNiWVSqPfMqwb3lihjCi2k3Dus5X0PT+?=
 =?us-ascii?Q?Uwcj92mS31wsMpg9krQw4bYpsQ+IpXi1Tj/pLC+AKkshvOuFuGzLhBA04kjM?=
 =?us-ascii?Q?NTgN4uJ/fAyXOQyrYOI6Ew321t5f/fapnDhQln+zJ36gWhd5ETSYdCSqXNpg?=
 =?us-ascii?Q?a60m5A+STGbBymsqHfEFsIg9ddUwWtNtTBVyFEAPG514dCuCfHoNUzVTYL07?=
 =?us-ascii?Q?vpSDwUMGUpDjkmNkVvLGVEf9ghE5MQYprXbsyD9kz6tS8L1dUW4GZE+bAKrR?=
 =?us-ascii?Q?LkhFLs39fqTg+IWkVSbRnrtiMlkcusniTxOC+5QuUY5wpEYe9eGva0I/ikpV?=
 =?us-ascii?Q?TwFx0hCbohT/NnCiTtvhcV96eXVNNCzVLD1nUCfUr8OCT1+z/fjgp7YE+3Yl?=
 =?us-ascii?Q?TpbDMzTdA2W5NYRAGnjyVtwFbxHdfE/WmHzaaUEBcwTFQ3rEO1WRXoSjAs5B?=
 =?us-ascii?Q?XPRgVELdLFs7zX12wwrLrijvJsWJhaoFu81WqQMA8dj5eN2gpD94OcoGJLko?=
 =?us-ascii?Q?0wpHLcAD0FfSE2ECBEj4CYj4fFWrMAHE2yRMLnz2j6v/MsaSJiOk5wbBN/T4?=
 =?us-ascii?Q?1vtdyvrtnC3IdA8g4GoRCfp7sjznFhzuF+ZHACRF6BGnMRK5r8xxPT7adgZX?=
 =?us-ascii?Q?9cuCZwI+vl6ENHxoBhvizDXa+fecXqgCyTRMPPQIXN35sBaB4DYqnPMWV/tB?=
 =?us-ascii?Q?HPfPZ8A8N6UcOdt1VxqWdt+jWu5e+ARhnN9xgcxFN42mW4OFhgV+oADyJwpO?=
 =?us-ascii?Q?xH02yzKRrWfMxWwboPKd7zWx5P+PAkF9eIYth/BZUlGY6Yfu6WvUBQp1CoIA?=
 =?us-ascii?Q?cJpfbr1ULts7tF87X0XeBFw8e3Fuvq2fc73V/OdM17+67200hfNY/4JjhY5p?=
 =?us-ascii?Q?e0TtBaRSjYA6tQ9pVTu4yQ9NoB/O4qLKYCwsKyk+J3I5piVg0S4bRhdGaNXV?=
 =?us-ascii?Q?KWMnIhgHjADfR/ouSMo2zIO4YVb8wFFiuWkSozXpXNzWoIxVE7Zk/r7HpqwF?=
 =?us-ascii?Q?9qQeasPFDB+qhNhbYL1ECwBE+dX+FqyoNgJdFww6N5yqrdfyXydWa4QTN1MH?=
 =?us-ascii?Q?X64r5BoN//yCnglIo5iPRqsfsjm0krAfwfd1GSxH30Cjr6wFrD1XMXGkO7kx?=
 =?us-ascii?Q?kAKFSWMv/hJua8HNGG27gj26zYx4IyH0uMVrAjoORPTm0cTBAnCPmE+Rj7A6?=
 =?us-ascii?Q?RNJfm3w6FlOyMUi3tC3t79RkfUpTBB3J8w9Z9ZXMF8L6kHVqVaY0BDbe9zgL?=
 =?us-ascii?Q?a5zVHtEbPlpgG+KFlz6VqzyQd9DTM4Njd3D0bIpOQG1QHrjZ9HILt3M6SZbr?=
 =?us-ascii?Q?xygxVgQcpSZZui4fCIEp2K86IbqXIJmTJDpWQQ2OIBBoeKk4sNE8+NJfeDa+?=
 =?us-ascii?Q?rU+7syBptVLYefbjh1tULcyO7ZPYwnL79fpF9oOR7JD7x1QikmUizHW2pEJP?=
 =?us-ascii?Q?Nw9g7TBfqstkGjiOhmf6BdejWNpxcKP+633QD92wCm85GcJbIA1dwNNHyNp5?=
 =?us-ascii?Q?2X4TR4wDqI8uF/meeUIyOjdtJnCoMh8BApLHd2uVYvYXZdA9wzoKkwoZtfEQ?=
 =?us-ascii?Q?Xq+Q5GVo0JJwH8BGtA9DhIk5iwM9mpHdCaLSOsobPso+OSaXv6mDChDRDPq9?=
 =?us-ascii?Q?nXSYl5lcPcsihzHrXq41NPyvqkOniS3+u5cfJG54OZN6lSiLfXT7YZ4MuuRO?=
 =?us-ascii?Q?lRa8LO7VRcbodQYTln07WoeRxeQ43Bcu5+kmzhDZW8sNozBkEBPPHseeiuPz?=
 =?us-ascii?Q?O0OFmuHKLX6V0F09wlvGNghR1u20lYQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZWlH4IgB4BasAGZaKxOx19Ywf3/XzDufX7I3MYN5MbAZQEf0bBrPvtd2GZHK0BtngQwYjxi3OVXtJllaVRF4sQBmI/nxfhg0+86fS0WNkb2ZNGHOcgD0KAzgUH5IUcXkUnFe4GUNLH6sw2g6Yci6rCo1x+Q8sq/rhJf9y3lWmbAQbDKUe4qmo+UnqCSbOF1SU7qXyQV5+oZzlZt4bK9bOnCJMVl7Q/Olju5wpKXJ5j43QTRBbV/5aH8/1JbUz2Wvz51TeAGPsyKPLvIAJKyGDMRsyyWuVeQrROfi5vNuyouGEb2AdZE/UVjVmyED1lv+xKQlDY67S26OWCnG0w6RVQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b24b8d-4bb5-4403-474d-08de8c0755ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:47:06.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1c0bhFXWZhn/kpkgV+kSqAzgYZsoRkVvN9wExCRCi8HinKFaRPX5pd4z/apqroxXa3WMuVcTpFlbpa+TUcqshO0Dhkvp+b97or/3rxet6Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
X-Proofpoint-GUID: 190CX8DPfnN0kz0rBz8roz05vJDx63dw
X-Proofpoint-ORIG-GUID: 190CX8DPfnN0kz0rBz8roz05vJDx63dw
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c68a61 cx=c_pps
 a=cMqFfNUV/FaVxlb8CdtUVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=Nufdcpt3fUcSbpuBje8A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NCBTYWx0ZWRfXzBn421/LoNHP
 jznJuMsu4qsYX2JkQN1WwHhLT1vZ8Sce64ehun1NnhoeGFZofAqLBiB4Bj+n4Dzd6CF/lHtdDjb
 E37aXv7qck/l4pjeTzutyXLVnUYwR8lSFnbm/+mtA54/tfEFfGRqFgRE2NyZwPBRxqHZ1n+ZGWF
 /8RxfyIp4rmoomWGcN8SpspsoYUwu/lTi5j/ix2CY8ZDzvB/3wXoqp4Epg2Z4vsM1EsYfd7gE6l
 sUXHPitp3Js1R40gC6MGMzcPYKPfsxarA7oTdrIeJDpS2juvfThXX9PcLXFzBwBKFPpQFJMMmiv
 Ok+xHrPvIjzbw3ZQBXF6OtRCp7Ik607DWtmqG2AyrrSHlZTTTI1AGaJKY4yPpE3sJQdg3M7efhX
 7OC5Z5gJhBwCjSzcdCxIgVOGDDkTkT9pChQqObU4GL0TNLN3sW3dDnMIitIzSilniMnyQYRw9aQ
 QMj0y7n90ssEB5iTitg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 13:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234089

From: Sunil Dora <sunilkumar.dora@windriver.com>

ast.Str was deprecated in Python 3.8 and removed in Python 3.14.
In [1], visit_Str was already removed from the LicenseVisitor
subclasses (FlattenVisitor, ListVisitor) in oe/license.py since
bitbake now requires Python 3.8+.

However, the test-only SeenVisitor class in the selftest was
missed at that time and still uses visit_Str/node.s. On Python
3.14, ast.Str is fully removed so visit_Str is never called,
causing test_single_licenses to return [] instead of the
expected license list.

Replace visit_Str/node.s with visit_Constant/node.value in
SeenVisitor.

[1] https://git.openembedded.org/openembedded-core/commit/meta/lib/oe/license.py?id=6d3da37adbcaf5a7a3dade08f9d052571b195249

Fixes [YOCTO #16220]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/lib/oeqa/selftest/cases/oelib/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index 5eea12e761..49b28951f7 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -12,8 +12,8 @@ class SeenVisitor(oe.license.LicenseVisitor):
         self.seen = []
         oe.license.LicenseVisitor.__init__(self)
 
-    def visit_Str(self, node):
-        self.seen.append(node.s)
+    def visit_Constant(self, node):
+        self.seen.append(node.value)
 
 class TestSingleLicense(TestCase):
     licenses = [
-- 
2.43.0


