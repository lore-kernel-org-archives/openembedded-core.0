Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C75CD4F54
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6069.1779102233882203113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hq8UYawC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7oMgY849712
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t6Mpt3vslh6nfUBydXrcS4rySYYYBGmN68e5MpWLszI=; b=
	Hq8UYawCwAc7o861VJ+14LTPGDjR9pwLbdh5yQREvsljVo05noUZI9OHEIMtREXv
	NNH24VhSkwRSG0FbPBmWHfzt6j8Qien6axcN+HORYSkwdio80gV+pKNwTdHxrN6m
	Hj6La2aM3R3WJde8pzBq2Q3oPWwxDuIXlK7WDuDjAytkQGZXSgJfG8H4G7NPOo3H
	kj358nAjTMtwAQynmoxbqLAerswVEH+eO6sQ5SxmbTj01msUNMO2IUk7gH3m8+GX
	Y9AvCILxKBJ2T5qqNEYnirofzoeRhLpPI6FlmNMilqfxvI1O2MV2BhOzCwd1BKeg
	hbnZJTxFl4m213sTark6UA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-8
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsdXKX9Kuk4CRcof5eZdqUIJ90ITlRgVkyXD2yRtGaobSHMsC/YssCwjpWv7DfjkJHDVyJ35P0J6DVB/mQiBsCCKpM2bzgEvxyH56OpXmZtj8Uv5HyESkq3FTSzUDEqPj95kIIV62lzkJZr2owNq0FdjQ8kPS6pF3+Fp2uJ4eZBRTAhet56ZdFjUg/Qs3V6/bOhSGez759k3nP0plQdxfVrjBlHCCM0xfIrFeq/ktmzn1LV22EAM0Yf2scOWLdCwFmuFlEvyua52CLPTLj0iftjORo2V3I+LTuBYedqqEA/GGiRfZ4t/6UKJ/wfs4ULCl7FePSoUguLTqh3z8vBQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6Mpt3vslh6nfUBydXrcS4rySYYYBGmN68e5MpWLszI=;
 b=gtBY9e7vqIgUXkKaGFCWt12w/wnLULM7DDrTRp+BTQdh57slCj1guuslJ/JhAI3/4h62ZHbLj6gc3QiZHoHayzgxYP592LsxhHIskuuJpSBXpkSTFdJtnT+Os8+RVLnclLs7P4+ZRrnJWy5TsNQ/I/NgU1bax3TfLVyNXrcWOBrNqysImr17q0ilCrRa2vO0CwMoxScVBKbKsi22UTp+iWuqhH3FBeLDmsehHizB+PDO8Prr5AZyHkoJcFfflsXaDc5voS7p1pUSL2gRcEshMmzVKK5Bg7kVaJs4UNpJkqyzyeVdB/QmV+IZY9siXENbEt3fB7omIWxOQETsNTD47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:51 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:51 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 12/12] gcc: i386: fix ICE with -ffloat-store and SSE [PR125308]
Date: Mon, 18 May 2026 04:03:27 -0700
Message-ID: <20260518110327.2347543-13-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: a3963a3f-d599-485d-e770-08deb4cd24cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|13003099007|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0OuIfr+aIF3LVYP9NXyeUBEoCQ8wy/htGIDNL7UFBg9ZkaXHQjUKghjh0PZ/XxT4cYileQXaUOXM5LbSbSmEXWqQ31wLnxrNDtFllRnm1mb6qRN5jQPk4zvVe0QaUQZWAlmo1dGaSdJZp/Zf4eNi/vpdhSRAvXMdUk3i5xgLDhyjIw7J6RIk103DPtv3zZhZhRiULHKA5a6IiLpg3PxAqZDlTqP/viYPHkHo60O+8P8RBj5+Q9FvFDTEhXZsIWwDKTWnDKrezD1YlD8HiGvbVF4bY6/GldXOzgRGPiFQNTZBN75y8TEPvHfPQmQdrMJBGpe4joOR6oFymBkgzlOXbvBL5XgLOr3OztNWN/V+M/fPt4QL4pj/FdPoPiycAJkHJadbeIY9KurDjEXePM69491yeqvpO1Y7zq4JhATI0oQ12dyIs0DtABtf+fM9GuvO76wih0Men+u1+Yhd7BuTD+XC9ZaARB66Gp0DPPEBfgeR392Fg0S49j2lM1TmZlJSQVp3CDhOfrx7l95U/8fgtearBFu5URM2y6Z9fH4Y28LCMayXdi7QurPzEA0hUQi0C1wsxb2VjDdcoZMOvl+zYoPR9xs8Y1m9qjWsV8zbQ0thq6OW6UAo5JpvDSzrj+OzpW2CrVV3sf3TX4wehH8iB1+euEBI0Oo2EbGAO3u7QJ6rD8QiFKvkigSJuJdt7+TKVXt5LSc/U4BJvx768UcXWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(13003099007)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XqEySQyqi7XWh5maJbR4uQyTNDFoicYycfLWJ76/JdpKGF4RN4aTfRPpNIsc?=
 =?us-ascii?Q?s73wr44MePpP0h5ZysKykc3cpbcMeinFApOQgp36Q29ZyRQZUxnmxB+7HhUK?=
 =?us-ascii?Q?vhwMuhdHFtZj4Ayj2HISZa7V3hL+lUCBkvB5SkLrL+xVFW96/d9AKb31ml+k?=
 =?us-ascii?Q?dZO6rYYjHMttcov3Lge+IjJLMOnpjbOsi5cz/B8rE937xQPnYG4Az+9uSX9W?=
 =?us-ascii?Q?Z8XmQVk2bQfMAhHtWSV2N3WjHW1qO4uS45bvxOMq3l3XhK3uxEDYYLfjEOUQ?=
 =?us-ascii?Q?2ZtfF5krNoPGtVNafvN95/gCHf1828iWDrZOzzliLsbfylDyCbTjQFtqGmd/?=
 =?us-ascii?Q?yHMdWsR0fu3iO0N2AUuLjozZoOU8qCtYIfQyOXhNJs6ix/acEB0U3PVPYNE2?=
 =?us-ascii?Q?9dYH+MF+3CZu1d3IJ7j3ZebQKtmnsaX8aA09PEA94khagSTuHStw7LE2aA1G?=
 =?us-ascii?Q?W/DUBg/+YseqTrgHpj+XCZ+cts8m5nsA5F5mzdukhMF33W2s2GtvissV/Jiq?=
 =?us-ascii?Q?0Hn4SaKQ5qbtvT01ZxMkCoGtxOIjshCoM1DbwS8rNB1aaw5+H8TmUAb5VZAt?=
 =?us-ascii?Q?9eKLdAncTZZS00AefOn1u2lWIhwqCJk8mG4GPCaPBEhnhTGFaQhwwy9ydkmm?=
 =?us-ascii?Q?XdQFlLr2S+c8Qi3tkw4Mk8LL/URGk0SzKqLeAofBpFo4rNzIp7IYVOrQIOZA?=
 =?us-ascii?Q?QkF1a9qvHQKqh3QFNkvAfXBEt0NQdHX8Byf5HI9hwh/1ySm5COpi1R5lGcn/?=
 =?us-ascii?Q?KyCpS9a4K9sKK4vKMr1kaVM0R03liY5wr9E/kWuGrIlLiZpqZ1INXVpHcfHr?=
 =?us-ascii?Q?YAEuErF36L0s3mbme1EramNnpKALOcFu8Fzoa1utO4XJ9pyIeOyCOGxNMuEM?=
 =?us-ascii?Q?EK9TdON6WeWp+Q9fPFIEaMJwO8GfcfDtIrZKefVl/brczRaPT01LQK3Jq2Lh?=
 =?us-ascii?Q?RBQaMk9VM8+QTRREbhxbCfNah0s1oHLPwrR3Je6Rj8zbvxNb/H4FMpyUD47o?=
 =?us-ascii?Q?3mjxXJwuLOCGagNZzneIo0VTo893abvJm5tTUMJPuiAYtyKbr6ywpcuabFCz?=
 =?us-ascii?Q?P5XpVl4UtP5ZqceHyJW7FFtmhPUHr191Zg8p2IIByj/JOobX9yhh4TUimRjo?=
 =?us-ascii?Q?ebczhjPgQjP1LAiVy29rd7Gk5iig4lqpMg/MZ6VmjP623QJk2l3q4oVn9Eox?=
 =?us-ascii?Q?UhmE3M23DQHoxQusP8IccajOsS02cR5rIvHQzjSYcCFWCgmmS+CjFbLLzbMW?=
 =?us-ascii?Q?EpguYLJzFGX9HWxuJd5JRx1bAGz9z5ml5pTKELnCBNNqnBw7ykMglZw80QE1?=
 =?us-ascii?Q?+WmazCmmMsuIrOHdE4+yzlCxFFSfgzhzC757jIodoUtXbon9L8fkzTltCEIA?=
 =?us-ascii?Q?oeCAoMxwfh7tuV6ZFKi5nfvIVmbYuu+h2fwk6uwncbq+oXiAKu07KSNFocZy?=
 =?us-ascii?Q?MHJNfr/cJALYtOeypqo175pz2bFCux45ypCtEdE1j5M8A387R8LGHB6kZuwM?=
 =?us-ascii?Q?R+BPgP7eFBgzsIspQjGYxR7xBldZVQUH46XM46HHB75mg5dafbp4ApGwsVUe?=
 =?us-ascii?Q?EXOM28Ip3bug8SfMn6xtdRZrKw01zyS2qfZ3DJ9bP2Q6jpniszF2fLEhaHt4?=
 =?us-ascii?Q?csePEf5IGrPpaeR6IiW5byDk/kgXacGTVJgZIR1tHzcmkb3jlRz4bCnTrVhB?=
 =?us-ascii?Q?rO5AKA6uAaQrMp916nDWm0J83Lg7q5CyAYi8Sr1/ZZPt6K+9JiPhmSI1/XqT?=
 =?us-ascii?Q?4icqPBQbo3IRJbDUtMuviDmudSpNPPI=3D?=
X-Exchange-RoutingPolicyChecked: 
	qbtfbD2FOqM9gSa09QnIQ5O2BIjitwgs7Eam82hdc81SCDqmajAycU7TuePnhiLURHk3PrdcEqx/ozRzn0twa4PEJNHWQ8o6sEJ7OmuLH8EVQRYYlQD4LTXDPzrzGwxh2qBn8OGwq/J5gq+T+aDI90BDFRfRhAp9r1f+FXU3zHcINLj1bf5mjglboljme9BYmnzwkBxYjOI+rNYnRTVDOEU5DwlRXNtlME9t/Uw26kQgAp8/5dGnb8FrQy2AN6QtZygWCuUjHXF8RMuZTLiWtZpptUgwhY3lhDO2PUVUPwCINC5DzgKKELTaVVHDiKDytDHz5JBjZx9hkU5Saw67cA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3963a3f-d599-485d-e770-08deb4cd24cf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:51.3303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiWGBc+i+8oNC8mQEdSbOXKolDrV3lZBnNu8i4mrRnTPiAXScBs0ZAerBDBCNXf3IgU/izeMjholb4uy/ePbV3e36T1q05zuEy3sJ6TQZmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: q1vagDsj9ScWtj7PL8NTlg1E5piYs7mE
X-Proofpoint-ORIG-GUID: 5QA8iyJ0M1Uuy0IoD2Xi7hwD3Jcoy_oK
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af219 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=CUwP28Ib14oBlIJf2_AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXzQGYMnsr7HaA
 xb42eHkoYgmZZBT26UtXPQZ99c94QNY1Mwze7EDKGnjWUcs/lgSDEbaIkLkLN6iv/nbcWrxoq6g
 hm/VAOnc5bg1ASZcl1HQgByB7q+c3DwMqItWKto6IXP6OVUgMkIXigLA64CDOPMILUR3sD5H9+V
 UPQ3P+jJSACggoE1PGnwY8EKE2Qis7N1kefwU11L7ITPGKyW5mJRxZDatHEpOdiMHEIoNXFra3S
 DdATfhr7Knk6yeCXvzDISYWnh6VHZz2Ck9LhhcGSNiXB4YmEPqcXkbTcxBkTjBphoSNJBwWlF9U
 avhiYq3lVpwe6AlOqrp0Fh/l8XDbLHslJLiGbV5GR/Xrkq3hdujKqmIl6UoPzpK+2KJBEAqBYYt
 i+deqHfzChzn/qJErn9b5JF+/aP2JdcFbm17+y97s9o2SFfnNyDl4Df1XbLKXCPg+3Q7jmx1QuA
 UBzNHtTjiRg4gvBSLkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237232

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Backport upstream commit c96589414eeb0e46d9fe9cc1d562e048230b5f67
to fix an ICE on i386 seen while building piglit with GCC 16.
The failure happens during the IRA pass in extract_insn() when
handling UNSPEC_IEEE_MAX patterns generated with -ffloat-store
and SSE enabled.

Link: https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.1.inc        |  1 +
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
index 3a96228631..4598aff045 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+           file://0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
new file mode 100644
index 0000000000..7ef8660ae0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
@@ -0,0 +1,85 @@
+From c96589414eeb0e46d9fe9cc1d562e048230b5f67 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 15 May 2026 09:55:40 +0200
+Subject: [PATCH] i386: Fix up *minmax<mode>3_4 [PR125308]
+
+IEEE min/max are not commutative and in the pattern
+(define_insn "ieee_<ieee_maxmin><mode>3<mask_name><round_saeonly_name>"
+  [(set (match_operand:VFH 0 "register_operand" "=x,v")
+        (unspec:VFH
+          [(match_operand:VFH 1 "register_operand" "0,v")
+           (match_operand:VFH 2 "<round_saeonly_nimm_predicate>" "xBm,<round_saeonly_constraint>")]
+          IEEE_MAXMIN))]
+the first operand is a register and only the second one is register/memory.
+Now, the *minmax<mode>3_3 define_insn_and_split does
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, tmp, operands[2]);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+where operands[3] is the const0_operand, so operands[2] can there be
+a memory, but in the *minmax<mode>3_4 case
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, operands[2], tmp);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+operands[2] goes into the operand which must be a REG, so it
+is incorrect to split it into something that won't work.
+Now, I've tried both disabling the define_insn_and_split and
+the following patch, the former to the latter results in
+        movaps  a, %xmm0
+        pxor    %xmm1, %xmm1
+-       cmpltps %xmm0, %xmm1
+-       andps   %xmm1, %xmm0
++       maxps   %xmm1, %xmm0
+        movaps  %xmm0, a
+        ret
+on the testcase, so I think it is better to match it and force_reg
+(it is a pre-reload splitter) than change "nonimmediate_operand"
+to "register_operand" because it won't match in that case.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67]
+2026-05-15  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/125308
+	* config/i386/sse.md (*minmax<mode>3_4): Force also
+	operands[2] into a REG.
+
+	* gcc.target/i386/pr125308.c: New test.
+---
+ gcc/config/i386/sse.md                   |  2 +-
+ gcc/testsuite/gcc.target/i386/pr125308.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/pr125308.c
+
+diff --git a/gcc/config/i386/sse.md b/gcc/config/i386/sse.md
+index 51d1e9b455a0..de092f4b9ae1 100644
+--- a/gcc/config/i386/sse.md
++++ b/gcc/config/i386/sse.md
+@@ -3468,7 +3468,7 @@
+      u = UNSPEC_IEEE_MAX;
+ 
+    rtx tmp = force_reg (<MODE>mode, operands[3]);
+-   rtvec v = gen_rtvec (2, operands[2], tmp);
++   rtvec v = gen_rtvec (2, force_reg (<MODE>mode, operands[2]), tmp);
+    operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+  })
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/pr125308.c b/gcc/testsuite/gcc.target/i386/pr125308.c
+new file mode 100644
+index 000000000000..0a4dd7c8ea6f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/pr125308.c
+@@ -0,0 +1,12 @@
++/* PR target/125308 */
++/* { dg-do compile } */
++/* { dg-options "-msse2 -O2 -ffloat-store" } */
++
++float a[4];
++
++void
++foo ()
++{
++  for (int i = 0; i < 4; i++)
++    a[i] = a[i] > 0 ? a[i] : 0;
++}
+-- 
+2.43.7
+
-- 
2.49.0


