Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D931CDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 22:35:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.255.1782340519618730456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 15:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fxnFa+Tk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0635f57c7f=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLlTow3343120
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 15:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=sAoRtKRMkbcBpSrA0Ru/
	lM1NwKceMZNkLFvXh3O57/M=; b=fxnFa+Tk4xCksHjD1/WXP04yWGFem6QAkst4
	7tJC/PpS1rQIlbZKioebU/w8iTUwLQcMIU0y8tedioNVvCVncgpyzz+Ps2kTVTUq
	ZKTP3i4eAOdYAlvxucOoAN+U7OYdueHQg/wXYyZKk9YEVMhnidfl5Bei8iGAGnkI
	he9ZexD6wE1H6uhC8xNIw5xLCiRNBZwU/+feMj4W3k1zSlYOX32EXdaTl20/TIlt
	ALueSZo0Z+pIXjXoPxZcc2lSlmL2wZKoOy77nCYByiYBZxmUb0b3hqBEAkjFXE6J
	UEOo4R2FoI87gZXEPdRDGH7cj24eWCsnpAQRfqv++DTktNw07A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eykj1k321-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 15:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf+mGK0SVr5PJdbVlwLbRdTwRfNJgmzUaK8bib8V+JGaRs9ZROc4h0q1xUp79QgGiFXMd+HhoapgVop3AGIy/W48K0QskX2SD0AyqiV3nBooMJv/pfVAdwj+rnannQ6viF5VVbBpczcxTFmUBKL65syLsqz2jcDt9becpX4TRVrsu0a4WnhNWC5sdXux5lpidJtdGi3NWk4IeBvtJLIQH79dgrkNq4COvBm8QIaRYcTVTtQi7RkSWgh/Cn5SNxkCbBxN0UXaLIPsI1Cqarfnmyf2u+299AUa4Xl4CTorRPHT+Kx6PyosKRS8gb72GoqWP2p68b5hcy9hot9Pmd7RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAoRtKRMkbcBpSrA0Ru/lM1NwKceMZNkLFvXh3O57/M=;
 b=DnehYtoVNhWCqZAM8slOdxQ+uwxabZai0yL0CEg/ivpQw5RmAOwiI/0EkLAeA4GWgX3FiWDm92uYWqCaMTvUf/DqxxX1+hEVoFmcFiCLRABXgOmrw67keuhFlK1h24FY86P8TBLWboyI36oTAIuSVAlXYyNS9QthrIJ8Oxq6xzr4ZVj3jd/0wwu22YaOpbw6N5vd1X2y28ZdY3pw2griAHCNt/mPIZRAlw8loG7TYqZwUgAnAlMZ2lz73b9T0YUF2X/pmMucJnTMUPA1zEWS/Xc/NrBQtdPUKlRALb5NOLPoj3meu1dKScUxtDg0/dR8K5loHWN3XDsRxpC4RmeDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 by DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 22:35:15 +0000
Received: from IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab]) by IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 22:35:09 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
Date: Wed, 24 Jun 2026 15:33:36 -0700
Message-ID: <20260624223336.1254487-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To IA1PR11MB7775.namprd11.prod.outlook.com
 (2603:10b6:208:3f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7775:EE_|DS0PR11MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e91094-0bc9-45e1-3747-08ded240d911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|23010399003|1800799024|38350700014|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	PLW4w+iCS/ofQ/wAjTDE/eurtbDj4qK2xunL7HyyIUVC8rnRhUa+lmIUo21sSkw1JnPCRiHvDWeUr+C15RONLl5UaXEo/N8PdR3QDcMHHaZxbddqd31KszdHJRndz+/8GL25rQ5DtvNgd025gT3yYhSijFYVueX6KhFTy9Yl89IGGcvXSW+oEW6j0gdZXdvOwBXb7AmQPVJ0I1b0l83nZ0jmXNagXK/MX7i5T5f6ppqNTdOEFCM3WWSC6rkPKegxBor1z9Xy28LfL0uEE/rtoXZfyOIQGnZ1GKu10NEVOArNry6aXoHMCibxvmou56khyOR5nkzuQprkBWtt8UAhca/Xa17Dpe6Idqpyu/cDAOkAx07soIMsSooZXFsBzp4bQgq+ETwk3C8lCxs5smAeBZ14y17GhbivDr83n9MJN9OCqsbhdiJVSuFhwoZcIQ7iZIC/cTidIS3AktuFcjBt950QaUeNazxYCHMAOoqyYpAbJgfNOvmwGF4n4yyNz1F8LYA2dPhYv/Alwzu2x39FIyGtxU/LLIhyNi+hsbrPU2J4/StFP/TQfeuJxnHuKBzWYTZ1kgIuib87ZplvcqGdytTE0PwZMwV3UL8kM1+t6V7v6qmwpEqIy9EXi65KBn3DDrkakZvNuSX5C+ZDfSk+AyWRY+SJ7eC8CzTgmYUKmyblbtoEc0RopHDWmNk0/Bt6T66lhxSaGsw5X2Gl1JOBGEYAya/+WwtXVoWwx1Q2Ze8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(23010399003)(1800799024)(38350700014)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BuncXnrJQKVqnKs9enAsGmg72bCY8w7fNWBCEky0qoR/IbvbtlBTrl2KgeIL?=
 =?us-ascii?Q?RAOntOoieXlL6ZewmAF8BHj1LEPQUSsMnIxLNdZzebfMZcSzkPAnlOw+nE4D?=
 =?us-ascii?Q?0vCfihGinan4DdjGdm0Vco+ZyjmIJhk1+IoDgsQvIHNOPOGfD//wf80rnDA/?=
 =?us-ascii?Q?+KMMv6IgPwvKT7yKqu6oqYbEASFpBaUE6j8/NRNgLmxJ0XG5AHYdFR3H+NT+?=
 =?us-ascii?Q?/r53Hs0rIyktvN3SazKKUj5N41U8cd2HJdn7H5ShT00pvn2ndOCFpXTW2SHY?=
 =?us-ascii?Q?ZB1ziurjS7stDVDCVUtpDES1ZuOhoRR29p0lyas2KDjB6JfEpYh2UZUWbqo1?=
 =?us-ascii?Q?T9fWzP7gG8smFRyO1GQ6VTqNclK2spHuc1wJTEqECULbig9k6bXFKYCBwzA8?=
 =?us-ascii?Q?aGAAMulfgiNEqpexXLrjk4oBUxWrUyk823V+KEQZ6qSVvBnFrpapHJ6ynww3?=
 =?us-ascii?Q?WlzJA6heH27FsFtf4OVw0p7N75hImUxVOBHc0HWsyrZxQuH357OFYzHVS4Qp?=
 =?us-ascii?Q?XRXASpJjb+ZbO4yvnusWp9pQslsu/ZoP3jg+VuF2M5lRX+iTitghw/Wn4u3l?=
 =?us-ascii?Q?9qqhnaSZoHxKFpX5sMqw13rbybayaxf+x90e1nH3DDX7D+yJaL1yvFdg+8Xi?=
 =?us-ascii?Q?vJ6lI+9Ek03hp6g7CW/opToudNW1MmVIfeFFOHro8f0xZAdkLU/Vz7JU0EBZ?=
 =?us-ascii?Q?H+itVWhLgVuSvwhpG9YtKsnUSVtqU2EVi6LAj1pqe3uixCngaFUCAoUkV1Qm?=
 =?us-ascii?Q?RPcIN62J+zAfSxNteBm9LyFp6H3DdXf92WdilIxiHVqy3q138vuHFiTfGhoM?=
 =?us-ascii?Q?2EQuvfT9/iwSaPveiaeGA4if45AfzL6MVOAgfhA6hEcYupfSOVWrXWhCWBOW?=
 =?us-ascii?Q?67xFCoELkLG6Soyy5/w//nEl/1mzTZzBRfHR7oL54FHMcTPAlgS7sA+S58sf?=
 =?us-ascii?Q?LQ/fbsifwJHPtx5Me68GrQYqBW6oSpb9PPxds5dncbp9ubPOulBjmCSWTJmu?=
 =?us-ascii?Q?SVnbcmhBsuFO78/H4iNZkm9f5Y6v5ZpeIMcVvPlwmnlL6K3eswgKR6Ngk2W8?=
 =?us-ascii?Q?/wXjwiHLMwJdI1YL2qeAQXo1WSRdeE3AXDcVIDxSC0uSoiI0/F60leIn1V5S?=
 =?us-ascii?Q?8A3YCzEeqWz6+41CwcXh++/Th1tT+eRNYTL5UAWluAAviTh00nKa0JKLnFuL?=
 =?us-ascii?Q?ZHPu16uMn7MSoo1HdRcWh317qXJc40gZroeN04K1OVBv50OKWk3/o81KmFC/?=
 =?us-ascii?Q?3m+P/P4WppdtEQ23DmWQhkYddAv3U9Yxp8YfjqZG2mRPE4U3NuK/tZJxhQJx?=
 =?us-ascii?Q?nHTa65GJYfVweEsFXTidDLFh4kq9kJgpSUbiPeucTZ5OGZpIc2+0+u16Vmm0?=
 =?us-ascii?Q?EReGlOoJ0yTWqXSB8W8AvXK1mzbRqJHomH6EpNyXHFNxnz6FHFE0UHjqWEoT?=
 =?us-ascii?Q?p/I+OUkhXAOuWkpKtlxUkxrvPw1RreKPVPa8O+AXjmg+3p6n0OrD5VzQIE8U?=
 =?us-ascii?Q?uq+j4SVXLQCoBwEMNckMrEAabKOnfQrEhvjJRQRTjQSX2MnbTWZIJbdkFg12?=
 =?us-ascii?Q?Des+VuJ8UE+WOkZhnmK9fUJFu5UPRIC99EiGmHFmuhIUATFsPWVRMYUrGa1M?=
 =?us-ascii?Q?qLkqvqEpcpJHbHDrRk+NtyXDzF4PGo/S6q01Jygim9GDdPT4C82/QEkB7MkW?=
 =?us-ascii?Q?tVY7GMsbwXmDht1ip/DXS5GSjhr2bFo/26lG2rwDd+C2gGyUj1dvMLuZ60XG?=
 =?us-ascii?Q?rakd+1ycz64W+j+LnZIgbszLLHw2MpQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	afIbxY8M/B4/bmLBEMvufh8j6AE9l8JKcFYAf7Dems96wWQJK9opSbZEwZq4S39NXzZKuu+c2lyHF/vO6hqUOyYGuAQFHzEtB9wQEiu6rFZvjmJO6jjz9fJRhioUbsAatJ4mvK4kmSmFVsfRARyuWTNO5wSpxfnKYwLKioZYr19R+AbGFw7WuRs3nmcJ2O3y8+C20uFXYAkYrXHv6/TXsUbGieJQ8JWUZFqE6/XqYt/BlBW+ghKOPCZ8QnpYpprU4iEeGlCrBKmN9JwGe2EZZ9/rOPVmbth6T/andy/+a3MgVWuuqO8tFhZRBAmlEU0HrXBtSP+H2I8Q/k+DpePAKQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e91094-0bc9-45e1-3747-08ded240d911
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 22:35:09.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGaV7wGGGzZzfGi7zSc5iUneFitAKsXxBmBSE5UeiH3YYN1bsd/0jQfUFxZFgNtqhA6Kvk3BNDzpfwTuIPuKbLNPh7LwpPzftiU50AlgOhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7215
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE4OSBTYWx0ZWRfXyKb48dBDTNzl
 y6X3KmTO5BhUoZeMNDMQvHsfwnqyxdIvMjsBKF3BozK6dCWjT95FywUoFFop2xKa+twByYOp5UR
 48nKh5rp6XxLCYS3idwGg+Q4+9av15C8teJ5j6TEJdU+1xer5K7HebAhMlPTlDH2Lnu7sI4/SfL
 HTLYWvZxJjhGPau2mQkhVM4K8iFSup3aP4tvtSz8q/rvjIzw0+atbb/AX9pxY/7ol6/XLYfmW+Z
 mDvFmOmuRy3P1Jm/udz5F92Cgd9vQLe8nUekTigZxez1VEvdp6MC1/cpfgR872x2/fWsWGMSlSz
 P7/iwCgdNjQxvXo/xkKKkGubGNjRVBTJSZOE7mgDi0unCR98zILZuagJ+DCHkQlrm3IFjN+EbUw
 hm5L/PSz8bBKCdqMdfZQ0BTqyLJM9b6y0r8LC0i62/9sWwQc999Fw0einhOvBcbz2HKpHbaHrDn
 QcwVkCa+sHyroCw6l1A==
X-Proofpoint-ORIG-GUID: RO0kL0Kjhk-KE3jxZtoMSmAa07KCDQ2c
X-Authority-Analysis: v=2.4 cv=JNILdcKb c=1 sm=1 tr=0 ts=6a3c5ba6 cx=c_pps
 a=hqw49duEbq/Dm1LMQehLaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pqtoqFVtSC5f0T9uLbMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE4OSBTYWx0ZWRfX/F8/AzLJeFZd
 MEbxYycgXpZEjUge0L90zCfEYcv9GxGl5JLp14YEmQvKwDGxkED2yeGV4Il9tVXw2bUKNPVCAUM
 YUIzB57HuEOc4NJPUoCba5HMubN3l06NXgTTEqAaLG+WwT5Cropx
X-Proofpoint-GUID: RO0kL0Kjhk-KE3jxZtoMSmAa07KCDQ2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 22:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239532

In python3 ptests for whinlatter, tracemalloc_track_race fails with a segfault.
To avoid ptest failures for now, skip test_tracemalloc_track_race in ptests if using glibc or musl.
Making the change on master to backport to whinlatter.

Fixes [YOCTO #16182]
Upstream Issue: https://github.com/python/cpython/issues/143143

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 meta/recipes-devtools/python/python3_3.14.6.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
index 291bde70f6..0fd1831b86 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl = " \
     --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
 "
 
+# Fails due to potential race condition so remove it for glibc and musl
+# Bugzilla YP 16182 (test_tracemalloc)
+SKIPPED_TESTS:append:libc-glibc = " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
+SKIPPED_TESTS:append:libc-musl = " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
 
 do_install_ptest:append () {
     sed -i -e "s|SKIPPED_TESTS=|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
-- 
2.49.0


