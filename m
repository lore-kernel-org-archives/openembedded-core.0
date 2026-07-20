Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F362C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 06:45:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3366.1784529944131656505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 23:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YmngOAzO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1661409e31=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6THsd3549242
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 06:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Jl7/EVUex
	ZCbEXybRX/ci2wgCqvnU3WwrBxStwA9M7M=; b=YmngOAzOHxzzVzcMLK2n6u6xw
	ALrlXlfv2/yWwX8sfeFnZlI4NdnywtMg9gklevmp8NPtjlT6ltJGDhmyHCiAgtfy
	wYLBVGyRJXJfaIrYqml8o/u3Or1VGOnXmWf+sfJ5av3Ne3SxaIoB8A0z/wxnsXT1
	f4j4JG+HrnOF1cURiODx/uPOsKA6sJ18eL3zE2Q1YOpfcv5ERqHnmKEAQCuZrYkc
	hxveQO2zT7x0nP6zz5N86g5uyLSBybwgZ34Jt1MSKTw+ZC0fXw6Nbw9cL9OxGtUr
	wzSkJKbqSb2lETokKp8QepMjQ73q4g2j33d10Fwd4D156rA0lSgx5xpPlv8uQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg0f59w10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 06:45:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytTgHog7vVP78dVGE7Ac/Z/PNmSqYzOdMJdiyxTgGXHxaRAQJ9ZjWxs+c5xEouTnhLyA9uwYwqAI2h4ThY9FNnvX9/z232VRu2aj6IZdyaJ5hpCLUuucyxEfy/qMp0koetL9glDDgRxE8zwZVQGVh0tLSUrJw87jFbxCghHBGPTYFh2nOHYtZRNSn9HCcdqI33urm//mLzGPF7DqRvAYa1FiVb/dzXRuGGZWq6CeUFmnYY4YBEoWpeav4UA1qbFiXflpPYbqhbvOw+eHVrbhQ+dctPitwywTeQcofOvPnN3mBrkaYZo/wzmpTvVKrr3gIX7x3TPW2NH3RtJ94xkFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl7/EVUexZCbEXybRX/ci2wgCqvnU3WwrBxStwA9M7M=;
 b=d902s5jtRRnB7qAdbmkUPRuys4yqAf4sfQrATaS4s4JsTAX31ETdvp4TlUm/eEkeUOFqGtMT7zNVpIuPjMVxXnZlMo9om26JELSuHJ/4dHwvSrN5vu6ws+RrG/RhZRJ8i8T/1bWkUGIZqhFAF+rl156LOUc/m4rHtd1g7EdqtSM0VgLgrdF9e0iywEKI9CMKddKdwAw/DxjhfY226yCWLLV3PvLft8QPep782zjdfbOXxLUUgqY/D17lG6ud5oeS0CdshpheIh37Oq/kevF+lC1e6ZAYX4CP72rPZ0v1fNELQmMa1knaqyLtqyDa5eE4pSZqWmaK/WCCGMLNVP2Oiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW3PR11MB4699.namprd11.prod.outlook.com (2603:10b6:303:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Mon, 20 Jul
 2026 06:45:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:45:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH v2] binutils: Add CVE-2025-69646 to "CVE:" tag
Date: Sun, 19 Jul 2026 23:45:24 -0700
Message-ID: <20260720064524.1305644-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW3PR11MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 42716912-982f-42b5-7d80-08dee62a82ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|52116014|1800799024|38350700014|6133799003|18002099003|11063799006|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	6TX2sQql2Hd0i33hgfUsbVgxQA9W+DFCWe4hvMsSp8k3KlGhoHEwv2Wbi0IMVpleenGEIWGwJJxhQRL7jSzYkYVPD6rItrmRKcJWiJCOtf60t1Xi8Tz1vf5TymKQd+2H9sZtahPPRCI0xv98ho/wzPRNfU3laHLak+/oVTFoxMDRkWsHzXx7mPebBbIPlozbmsVImYEGgP0M40sLULVBwQLLMoNTtmvntOoRk3/QRJaacSqa1CNTOr4ewA3rapr5YZLlQsYmH1ta/TQR21iHRtks2zrvW7Zycw8uOFxrc/K+M1O7V4D0ZOarbJfImX5Rba8wUCHmtyu/VgVdauDpZtPSGuhaQ6CDWUc3wdl8jkoxIa9kUL1gtroDT44RRXksKX7lViPZsWT0K4gQoZs7ebcb7VUezFn5Hk4+ciZWzgXY9eIBPohcyhPmrr9Dq6WWeGwXu2NFsWQ5asLLrh46tf5F+6MF89K6pR/yslmFWmEzwObqkBTY2IicVbnsFlwg2ByHj/iNQGu7XBMw6ytCLYwU6wtWcerdHIBjKGibP2l8fsjaSDqG895L9RFk0M+eWHEKdj4gzmDsMnt2OL+Dh0BGxHZhvjyFdPmFkgCag0ATmrgvptgA3q3QDVjoSJ7xOT8y6f4rnjIN8k0LKxca9siMsSL80IPXdRjbGySA5KA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(52116014)(1800799024)(38350700014)(6133799003)(18002099003)(11063799006)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kc/sE13Y/w4YJfzQtkoBLvAD25BS/rB6KjO9iBM1csMk/dzdOXzqXJGBD7D6?=
 =?us-ascii?Q?VJrBYCv8OmuQ0/aEHxU5FKNkDzKb30vDu+cGMlQLvmj4rBVty+QEtWvMzEYa?=
 =?us-ascii?Q?7mprjgtzmn/K+3hEv614SPW2MMLU5+Z8M6Obndcx/nEUdL+ZzLNxAZlQpBaR?=
 =?us-ascii?Q?/EsC/ibjij34c1R3uYMzoAVbNgq9RFWBf9tMKwfi4EQ9sSU5Viz2fJxViHl/?=
 =?us-ascii?Q?JgWpNR179pnETTUwLuluT1GdE1L6NO4+Bv+2Sw9tABtnFmS0WKWslokLxqdA?=
 =?us-ascii?Q?rzA3xvx2ogl90cMTQiV2uO/QtbHh7Le4VqKFDYPn1ePzkj69vIpb3ElqQSRc?=
 =?us-ascii?Q?M93VgCisqRi501qwdwLAQCBje6/ozGSo09MUdi71TjiWmG8nl6wPeOUk/lNb?=
 =?us-ascii?Q?D7urNo25ugnkgt5vT2MqF1n004eanJojS7WWq9wnrgjG8g8QY5UUNlgsKD31?=
 =?us-ascii?Q?tWO3kuaO3bnF22nmPykwMmjMHpAExQOle+VDOfEp45cl2fhadZgCDYNNDKcM?=
 =?us-ascii?Q?F1BIUa0ikRTUOnNNK//f6YO/4omZSTxMwpSdPBZxX5bWJyQrbSPMy4kwi0TS?=
 =?us-ascii?Q?JOD0eUrYV4QUK6ZWORMaSFJRSrbfGnOxasn55/VnN+l9ki7P3pCwb4gR/CWZ?=
 =?us-ascii?Q?BEwP3jwgrpHEq7+LjUKwAYxfXmhhOFWS+n0ZIvyZ5DY0/aZmifty1Ph97dh1?=
 =?us-ascii?Q?HbH3S1E72oFHHmZjA36FtHcg0GJtimhwx71jnUllpMeUro0ZIcXmwJWSsYM+?=
 =?us-ascii?Q?fKnDM69tsDaHN8AgZFm/4MrKX9CxT0JE0VDRXuR4DrE5/dZaBoUWUYb0pe/i?=
 =?us-ascii?Q?gjg2HwOH8qkbmmX2fuJSPhIxOjJPSKK2DiT+soFO0t2XxFt2VklBYfP0m87e?=
 =?us-ascii?Q?R7xdraoeWZ8AHgewphPJMEL5XXtTpbKh/2JHjF149jTzM2+cc6koUXIe0UFd?=
 =?us-ascii?Q?3AHxJ5qVWP7rfmK0FHIc5zMVjYOS9/ajtfjJMzc0hXsNVsJ7X/vBK8nZFYrH?=
 =?us-ascii?Q?HFaDJ0pQTROV7QXPbn7Efn23DQknq/hQ4IayNw6YQv6FgrEoS5UXsfiYgKj2?=
 =?us-ascii?Q?Vh7QW/7a4qpykoSpC+dPc5vTOM7+7fG0ARC7P/6eKL8hplKwbgM3r48gX1Z+?=
 =?us-ascii?Q?1afj0MBN9JpTT5BClHDCZ4ABCXyXVhd41BZwJe/ndApN2cORUy1KqRk1HT/b?=
 =?us-ascii?Q?+++fn7qPbIBWd9X8CAfmVYg1QM7TM3jgz5eZmnF3sKtkP2AXDG1l/TXVzJvy?=
 =?us-ascii?Q?fIB0KQ/vX8hsQD4F2HYN5qiZkplLug4ZDAqy5FUOn7zgrrDaC1P7LqyGBQ4w?=
 =?us-ascii?Q?qcNDk+yFhNMMJCD208o4GlY4CMBpEh4nK0ed/wYwoYKfYWm3ipmixd2SgSns?=
 =?us-ascii?Q?XmG/9zDHRLxvC0LVKTpubuE/lFmkq31GqkxE8VWaRZTfphtwcKJVePwijvYC?=
 =?us-ascii?Q?Z1f0+XP2p9D3rC9jbDVbEi1XGW2ABjrF5PZS8lwSvtZ8jsy3i8axXOTpQ2YY?=
 =?us-ascii?Q?9M6PFI3xi0k7EoC0ckHe6c3ruB/cRLqYVktSM10uvNmWPmmwqo84U/xzyu9s?=
 =?us-ascii?Q?n4dQ4v7sixyDpczDChpOYL0YqnQHJku7fF/N4EZIZjhMPV28IgMMf8RE9Nhe?=
 =?us-ascii?Q?YXuxooLpKPqRJVm25pSMxQedxWQLSw/PzKVcgTQ09xtNVeFKH1Ol1ji0B6yh?=
 =?us-ascii?Q?FgB9qUnyMa0RVrY12565AJoMPtvd2f04AkEzvLOJIPpOFqCncqKU1tNzrQ0c?=
 =?us-ascii?Q?YLkQT/xqf4F03iko9TJoJJeb4uzABYM=3D?=
X-Exchange-RoutingPolicyChecked: 
	FgOrESNKYn6B/kbuWe0KAK7kvH/KuU1vBwoUt5Sy2NjmA3m2fWNddtjpeu6Iz3aIMdEgwFKKur5lZZZG3vPDSZjmIb7zzrhS3Rno5+b2nS2SWdbVtuiq5tQpsoprpljzFjQqzX6rEiRApj70gWCMaHcNDCa4ua63Jl8XGMPZutoaUQz2pyy+6TcsnScTCPq6rU8gIvc4W/RoqMvTYfp9D7eIfEQCzIIUrQCZ7XPEn5y1pTczgU9LdJpo23xv2Bw5NuaJPN5nxM1rmPuSFGc5vec67xDJFV1v6GKHKW2WNOwh86RzSzLW5XCSZ2nGMs2z0CJD1GzBDRmMUKAEI2IyNw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42716912-982f-42b5-7d80-08dee62a82ef
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:45:40.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiHK8EdJ60ScAep4JUe1TC+Zl8qOFz5MJVDcfrvLeIXu/03qSjUBMcq3IVXV31bBpiIp68eaUR+m4TQAG+HcS/w1h3mpp5ThGrVMTUbToJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4699
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MyBTYWx0ZWRfXyAg0D5g75WQH
 DQWiCV1gJHgZsExKHfK0E4TuBJpzzJisAxYr8cpPMh3sHUrFE1wubEQ0eUdU4rzegqGI+WNzzCP
 yMLbaRM70lKBSPgT4ijh1LNzDOn9H/LlnI30xMmXXv3u9IB3G3LzzQlDJPfl3SybSRj5GKQy05v
 WxxAjnvxpH/1FZ8gK53G4P2Edm2k/Yy+KrU6o4lXDXnp6qxydKxzwrrULS0kC+qeSPcqsp+blaP
 NLUbZcI/Gy8fjDVESR4Gb39Y4osCug60h9d6qRFNUPuNsX3/rU0LFTfTcbQucoZAKrJQieCAvkr
 bloXnwM/DA3h0rJHhRSCT2XAi3UFTHUGuLC660tVYGTNUDbuxWGThLtd6GcegWE1ldQG5Yy8Pr1
 /1pzRTq8y7CNRYn+5PbHQX0bkBcba57n9BcQJA/7uuPCyXeaKU0Gjt/UDncmcz0PsvhSq3/0QIS
 IZ1vN8fISSl2UTEIKvA==
X-Proofpoint-GUID: lhjb4L-6szjOYzffp-NlEhRgnMMliBCU
X-Proofpoint-ORIG-GUID: M4IHVUH1wbzlsNl9WtmDcHo7wFTji0Oj
X-Authority-Analysis: v=2.4 cv=IM0yzAvG c=1 sm=1 tr=0 ts=6a5dc416 cx=c_pps
 a=beY4+7vfl+OHeoikwBMclQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=_GvhCWdWHi7FI4QqkgAA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MyBTYWx0ZWRfX4FgZ1YaimJAh
 6PzFd504z3WyJmYaYKiARG0mnIoF5Ptvuw5zW96VGtyniy8m9ewrXnxGGEaq1wZobBWppywTR+e
 9eCkqSINZ7QJCrljEmfWOT+VkQjETe2bBVRtV7T4v2eE5a6O0nWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 06:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241326

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Bugzilla bug 33641 (assigned CVE-2025-69648) has been resolved as a
duplicate of bug 33638 (assigned CVE-2025-69646):

https://sourceware.org/bugzilla/show_bug.cgi?id=33641

The existing patch already fixes the issue associated with both CVEs.

Update the "CVE:" tag to reference both identifiers.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
index e04d7ed6c2..e123273338 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -19,7 +19,7 @@ length field.
 	(display_debug_ranges): Check display_debug_rnglists_unit_header
 	return status.  Stop output on error.
 
-CVE: CVE-2025-69648
+CVE: CVE-2025-69648 CVE-2025-69646
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
 
 (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
-- 
2.49.0


