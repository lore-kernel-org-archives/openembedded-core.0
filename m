Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BFEF513F4
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 04:06:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62354.1772769979667707383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 20:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=er8nLClL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7525930d65=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6262TZeR2475200
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 04:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=HrspKSO7ObMRLxm4su2AMCdd8eooq60ZViiHZcRqTS0=; b=er8nLClLDw4G
	YQxd+PxoPXc+rHdeYmgaVrxzuc2RkjruqLBdncL/uAPVF68DJ3xFCL23xJFIEHBf
	zX8Dnz41vn3PPloUZnJLXtBrpTolJ01tiuEOIA+7z99uGDqQD7fBZSausKieZn5Q
	WQPs4BN/9ehz/ec351oI4uudcK0y3fciMZYyZuXrEDEKc/dXlrOdQj14pHURxGik
	nHEYiPUfcZPfnRdtN0w4cBPDkwMF7gywaOZ6lkHaOdXC82DF0rtY/Nlp4O8VK1uY
	DhzXkbsIW9IYVIB2ERakRrUI3epDfBqlsAiOzZnpHJaspN8Zkfi16risYnMOlJgH
	G6Ru0JPXJg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvqga8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 04:06:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ud8z418WsOIckTY53ES4UiJ9XIcvi5s3cUW0+dybiHZURT48kdtQTdgaF1uiPYj2e74eH2xve3vvm3qXCTop6mgU9989ArATyfllbNxf7TjLR5RAtM+2jag+QY5awgAguRoztmPO1xwn1JxaCC4WWyc/8YnA1W8zpi6AI9ZThH//pMnzAunyipBh87MLz0HpKYF6yB+7xMaQfqF/FU/AVnFPM3SJiRlRrtdPfIuRugoBaDOOCemr8XY9WtIxwCRuNkR/uISFQyOMmt/cUIuLdDOy6+9kJUUNIban/af6S3+0LnAsNuucBl+CR9iU3Pl5dqqz4jmK+UsKjdyPydi5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrspKSO7ObMRLxm4su2AMCdd8eooq60ZViiHZcRqTS0=;
 b=bnHC2Hb8SZUORJE9FGWuukmFNtvnVj9EJ7nckC/ZntxhNfNmqEyfXuU8qvedD+Iubu+HzvFjbWVSE8/0HdShApVQjSsxdewFmdkFIt2AUCWS6gaiXavLkOU4gOat6YqHrxNvqIQPAFo7NTHQ7+gE/u+ZpTGX43o/uNzCv35M8cq1hyv2dwS4a2pbIYum5lWCVGmzLMSkSlQ8Q472WviVD/J95QvxjsYLgSUltmia1+SAV58nVg4Eb1G0LKJ6wB4RrtdNvOyqyHI0PtkRqCsPdXFTbM1WefYC2SPWZKDQhQHtn65mZt8y9d6cuXfwgU/XmsjBJXEhaAbxrzwWXv+86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 04:06:15 +0000
Received: from CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229]) by CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 04:06:15 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V3] procps: support ptest when TCLIBC is glibc
Date: Fri,  6 Mar 2026 12:05:53 +0800
Message-Id: <20260306040553.680410-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5CBCC8E0-6F27-4C8A-83FD-1E96B5EE8CD4@arm.com>
References: <5CBCC8E0-6F27-4C8A-83FD-1E96B5EE8CD4@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7297:EE_|PH7PR11MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: e5062b76-4e02-4e10-be85-08de7b35b602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	sz99VV6UfiglOqiwFXSb1JunDYa2/ZDFcVv2BxzjrKTIWzOSuNbfpj6qWFWI9JvwrPqHRG2+8ZN7isgtSAtGZeDGb+LvTaY8ysVAw8goqFfYVe/H8vNcOCafH/tPkkiqVnc4rP7gTF2nVCbsOsrmIrjF/ZrGzbOq2awtXvbArmAuEgsEYK5U4tOPt51GdrzRrVr5pWsMQ2vQaCYLz7eERQ2CZqpHPp2MJJjKVvDIgqY15mb+FBQbBUF50z3O8n1lTZ1FDCpWOyyO2Oxsy5o2gP0a8pZINcR3K0CH9WM2R7AEcO4VFYbW4uQ82h3J3Iva8Jf4KWl/G74N/5+XG1DbmI+UvEjgKqWFtsPOUamd6fyC+1YBpeoJyBighaksEu5jSF4CaIggl4qJ+Pxbkp0HtAiviVqGeK/jRDCJXsQFzqcFizEHlntlMeksuRGU7aeHJ+ldhDLNdaJESiljG8pzHcmvr3UIaWsBlPQuvzSgvdmJjSja7lHMe7D9Be53S/6T4wcT/VtRScwlkVKD0ic6/ean8rKrD0rTU6trjvo+6SOh+WQ6eSSu8/Eb/njYKF0TAkUfR4lAfj6qgPXWOMwLMsdYQ1m/nbHk8LR8Di6/eelDN5kMW+MKkpewoPuKCMf7k9qGdolit87KzTaJfghVBC4tOc5W8qWKODoy3YLv6pCSMQ8QJip08QqGWPUOlXOyoqrFIu5NjXcCo8Me7Bh9vrKaPskSnNSimxEAWWlPHJvjcVMlUnavvLRoduo3I0BQYz0tiEqxUHVN3umRNRAhkDOBwDQfDX98X1ZHNAKoK5ngDHhFRZXu5JQynsHImTXs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7297.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vb2TsYb1pzXUC2FiGhLTNMWGZvxn661oaBxkA8kVnFBFo19YFFSaw3aKJVNj?=
 =?us-ascii?Q?KGsqsd6MFQOBnmLElagCCHeMdYjo1HWorzEWgbiuzNdDB3Z3x9wosH6Sue/h?=
 =?us-ascii?Q?LKolf3WxSI5Uprr09tir1BHZVzEPBNpZ2am4eQSfwCbB7IgCaBl+C55uYbD1?=
 =?us-ascii?Q?QfoTX2pL11ZP5oUoowrEfJtf/mQbdTPhnKyh3SjAfHUN2Tg0ZSOP47DpgpHu?=
 =?us-ascii?Q?ol1dV+KCLGw96+c0ewdHEIFaK+32B/ynfpfT0y+PHWR8HyY/G3Bll/DxVSNA?=
 =?us-ascii?Q?qd0PH3S6B3fw4/N9jdY819oPNxuJyr9f4oe612fTjvHLqT/lCdGd2BmlgPVW?=
 =?us-ascii?Q?5xXuBxPjfrjK+wiiBK55aknjxGRzRTZdQpvCFRZivE+df3jtuOsvgF7RAtoM?=
 =?us-ascii?Q?QoTyqVOq+UNuLnqoQZKVinyUS3xgapFowImhAvvRb1HbjEyFZa6+7OSlo45d?=
 =?us-ascii?Q?vdJayh/QrR0OCbp2B5ZGl/mey3ayj80nIPliQZNIetFQTqtObtCTv9UApQa6?=
 =?us-ascii?Q?Zw4T0XD0KeE0cHKJxtxIofwQO7D4ohs8LrHIbEPx1XBr9deXsxGszaeFjxAs?=
 =?us-ascii?Q?rLsE92/RDOhj9syf7mSfTGptZwgcTm9QazHTbgOJaZHhozqj+cCgKtQNWGIz?=
 =?us-ascii?Q?D8SJ4ovstdKI2htyXgV353+K/J3Ppxrlbcu/Hsvj29vuKVk/5Nu4FqarvSFJ?=
 =?us-ascii?Q?5tPJZVpi5J4WvN0QdXRx7ODohZyLXg4o3f5m/FBAinmaHbdcBGfeCsAyngoc?=
 =?us-ascii?Q?HCtDed8OIFT69q1ZjnMS7x+zNx4/RczlOl0ew0ba+xqPzOBg75c3UnMg0WcS?=
 =?us-ascii?Q?u1oT03QrftF3xKmqiMYiN08J2yEGfTy2AXsBEB3sZ2PHKIbTYbchFw3CRiRP?=
 =?us-ascii?Q?7xaEPPnpmdssnss7Q2lSMsUPtXZs59JUtCHZXhwMKE9aPN1EKKKBcWzPtiQ5?=
 =?us-ascii?Q?Hs4RLOC3H9IVAed2DTfmwnnB04IxXha/wtIiVJgODHw9FsbnYRnCpc/M8veb?=
 =?us-ascii?Q?+RPRE7IBxbN3DFe6vOGsTt6UhH0zFRZC2uwfYDFHoaCiw62ttUYKM2sCxIKv?=
 =?us-ascii?Q?hn8yLEp2TMJw0S3nJoCwurD+irj2wG7pX2jn/ggUGW12wjQ0ST3usIHGdkoT?=
 =?us-ascii?Q?xN8xqgXB2TNsltW+m3P5XsI3YJ9nUp5hoFxe4tX5roDXsQBWa/l/ibSJ28MD?=
 =?us-ascii?Q?dSbJqTe+4L8ed9hxwfN1J5v5fBviT8JJAu0Y0U4pDDVQlcH90+uTD75xgumU?=
 =?us-ascii?Q?tdAkjzlF5TeRFoJLLv6zlFr75mWuXBThtYoR+ffCkYwT3xdpY9oI/ryKwEnK?=
 =?us-ascii?Q?9A1s9JhLV5LsTt5qtr+t2DYWQ7+zWMoX05iIbZud50mnOfBRPDo9PknEX+20?=
 =?us-ascii?Q?dvgwjl9oVBii6f5YGHmIdFeZ91KwNcumqbKtqP1XN6nKyuERtko0ItRmSYcy?=
 =?us-ascii?Q?f9xPDQt+Q0ZxibkaFmfUJNrrQvkHU+KWsFD/zBYjXmaExggGgQ/SWU9AM+z1?=
 =?us-ascii?Q?SmslYhGdt0Uygt6VuNiS5DamWeX9lpN4cUfRW/vs9jc0Da5jcpKmr/Vch1/c?=
 =?us-ascii?Q?R7mK56D6ZfBvu0nkvixz1LO43njXZAghXNRtJGPFEiMyKVESnLG7KjW8LkIA?=
 =?us-ascii?Q?IOYmio3Pw6olzZcwbAoU1pw9tx7trPg5MdtIa4ERwKxAb8SczHh83/WPnLvi?=
 =?us-ascii?Q?4X8IPwdK+DjVth3P+NFzZKkMqeyO5YxYvA2A/oY486RlIf84sYQwotSZxUbw?=
 =?us-ascii?Q?HdlBZk6tHy48z+blOa1bRfTUuFVqcMY=3D?=
X-Exchange-RoutingPolicyChecked: 
	FZJusyYNQBTZPgGntqnO0ToAxoV1t9lyqaoeazcxiAdpUAMQ4YprlzQ2B2dFzfpyxHegJOnSUwUE6jddJIHrd7jvzOCtKr/ry/5S3en86vjf0lzoiUdXyaVETmeTWBdUF1ZNx46aUdUhMD1DNU9NACe+D8Ms169rfU+bllZnmcveI4MPd/MjDBlBTpagtXsQp0czPf3hz4Oi2nPFOfJbk9kByqZoQIICUisTP0mxqX30WumNrT3jPWhumdI6+j1RHQBa6nBWyUlj2XgPtJ7PQ+6AghmcWe31sKMWbwB0v34RtNyqDUKf8eeQoIn/+VHe+8aYsVNVAV0viJxal59iLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5062b76-4e02-4e10-be85-08de7b35b602
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:06:15.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmNGDeswxbKTVYdOh2+E8x4nhqjzr8B9JMthKn12sSOc1mCEYPLD0eJKs4MNUorhv9WTOTEqcq9KoNi3hvWVRW81/EpzpLYcT/N6AcSHgU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
X-Proofpoint-GUID: FXNol49zvTOa-yt10iAf8h0ThukPIJLU
X-Proofpoint-ORIG-GUID: FXNol49zvTOa-yt10iAf8h0ThukPIJLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAzNiBTYWx0ZWRfXwP5LSYfBrUWM
 MiERlNov5RvQBMDQXO6DJbRNv4SAtipShAA6uvtBc0/by12I2qESLMomtLBuYeqF8IpaE5p/5aJ
 fP7eKYcFRCLncWZowW5aUrbv6nNbVnNmIzS6S9r4YutSEqH+Z8CYklz5UCjrnI39IhjUaDaef6j
 4d+fkJeZESPzB/Q9FesROGKaV1oDIRxAkPgh4/6SLkNcWqW7DZ4jt8Kk6MYAUlVfXOyG0yzT1Jx
 B2rAyZkgTKwElSt/b/s1iIbdwZCWshKhzQ0YICP+6SIUv4+6hX8OibOuUJlqmT162XZPc45XfK1
 QAmLSE952bktu9pXpX1rCnvE2UjrDz2bjnFE5GilVj7f1ZVBzv6eJGuA1i1cDoUk95eUry2QgyD
 owlowO2t/mc9bCVWPrCCHnHcAyCpogsAevYG+Qjj2ZI+p3aCiS6K8vSj/oAv1eWdFjEdypBKC3x
 TF+2lzxb0QKp80sVtzw==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69aa52ba cx=c_pps
 a=/vFeFcp+ixIfR90aQz5jMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=p0WdMEafAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=jzd3iM5pAAAA:8 a=GjWSY80A04DYgau4zBgA:9
 a=c00F_cqylG7lAZhP:21 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=TO2bqnfdc2VIsZqNzVeZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 04:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232530

From: "Changqing Li via lists.openembedded.org" <changqing.li=windriver.com@lists.openembedded.org>

* Support ptest for procps TCLIBC is glibc. The configure.ac only match
  LINUX as "linux-gnu", we can patch it to make test can run on musl lib
system, but the upstream testsuite should only run on gnu libc host,
some test cases only suitable for glibc, eg: Some of the error messages
for free command on musl system is not the same as glibc system, which
will make test failed. In order to avoid some other unexpected failure,
just support ptest for glibc.

* Bug [1] is filed for musl support, we may can add support for musl
  libc later when upstream add the musl support

* procps's testsuite use DejaGnu test framework.  The testsuite is
  expected to run during build time, this implementation create the same
folder structure as the testsuite expected to make it can work well.

[1] https://gitlab.com/procps-ng/procps/-/issues/420

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +
 ...sts-Disable-twice-total-pmap-X-tests.patch | 55 +++++++++++++++++++
 meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
 meta/recipes-extended/procps/procps_4.0.6.bb  | 54 +++++++++++++++++-
 4 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
 create mode 100644 meta/recipes-extended/procps/procps/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 1bb7458fc9..627eae417a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -64,6 +64,7 @@ PTESTS_FAST = "\
     nettle \
     opkg \
     popt \
+    procps \
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
@@ -104,6 +105,7 @@ PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
 PTESTS_PROBLEMS:append:riscv32 = " qemu"
+PTESTS_FAST:remove:libc-musl = "procps"
 
 PTESTS_SLOW = "\
     apr \
diff --git a/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch b/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
new file mode 100644
index 0000000000..ec26af92fe
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
@@ -0,0 +1,55 @@
+From 56505e2ac9b703aac979f0849814ab7c83af57e2 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Mon, 9 Feb 2026 18:19:35 +1100
+Subject: [PATCH] tests: Disable twice total pmap -X tests
+
+Sometimes the memory count can be just a little different
+but the test is equal, i.e. must be the exact number.
+This means sometimes the test fails.
+
+This removes the pmap -XX pid pid and pmap -X pid pid tests
+for checking the result is the same.
+
+Debian buildds this test never works and has been removed
+for a while.
+
+References:
+ #409
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/bbe21e141b77398586c90884a43ff75996b83843]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ testsuite/pmap.test/pmap.exp | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/testsuite/pmap.test/pmap.exp b/testsuite/pmap.test/pmap.exp
+index d37b55e5..6fb6fa1e 100644
+--- a/testsuite/pmap.test/pmap.exp
++++ b/testsuite/pmap.test/pmap.exp
+@@ -93,13 +93,14 @@ proc expect_twice_total { test } {
+     }
+ }
+ 
+-set test "pmap X pid pid has same total"
+-spawn $pmap -X $mypid $mypid
+-expect_twice_total "$test"
+-
+-set test "pmap XX pid pid has same total"
+-spawn $pmap -XX $mypid $mypid
+-expect_twice_total "$test"
++# Disabled twice total as there can be a small change issue #409
++#set test "pmap X pid pid has same total"
++#spawn $pmap -X $mypid $mypid
++#expect_twice_total "$test"
++
++#set test "pmap XX pid pid has same total"
++#spawn $pmap -XX $mypid $mypid
++#expect_twice_total "$test"
+ 
+ set test "pmap finding shm"
+ make_testshm_proc
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
new file mode 100644
index 0000000000..7e132653b0
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# Run testsuite which use dejagnu
+cd ./testsuite
+for tool in @DEJATOOL@; do
+    runtest -a --tool $tool --outdir ../log
+done
+cd -
+
+# Run test programs not used by dejagnu but run directly
+for p in @TESTS@; do
+    ./src/tests/"$p" > ./log/"$p".log 2>&1
+    case "$?" in
+        0)
+            echo "PASS: $p"
+            ;;
+        77)
+            echo "SKIP: $p"
+            ;;
+        *)
+            echo "FAIL: $p"
+            ;;
+    esac
+done
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-extended/procps/procps_4.0.6.bb
index 168027077b..a9ec3f39d6 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives ptest
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
+           file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
+           file://run-ptest \
            "
 SRCREV = "4dafddf4c3f4646caa517f039a2307e92657ec93"
 
@@ -24,6 +26,8 @@ do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
 }
 
+PTEST_ENABLED:libc-musl = "0"
+
 EXTRA_OECONF = "--enable-skill --disable-modern-top"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
@@ -46,6 +50,53 @@ do_install:append () {
         fi
 }
 
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
+
+do_install_ptest() {
+     install -d ${D}${PTEST_PATH}/testsuite
+     install -d ${D}${PTEST_PATH}/src/tests
+     install -d ${D}${PTEST_PATH}/log
+
+     install -m644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
+     for p in $(makefile-getvar ${B}/testsuite/Makefile noinst_PROGRAMS); do
+         install -m755 ${B}/testsuite/$p ${D}${PTEST_PATH}/testsuite/
+     done
+     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+
+     for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS);do
+         ${B}/libtool --mode=install install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/tests/
+     done
+
+     tests=""
+     for p in $(makefile-getvar ${B}/Makefile TESTS); do
+         tests="$tests $(basename $p)"
+     done
+     sed -i -e "s#@TESTS@#$tests#" ${D}${PTEST_PATH}/run-ptest
+
+     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
+            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
+
+     sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile DEJATOOL)#" ${D}${PTEST_PATH}/run-ptest
+     for p in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
+        if [ "$p" = "ps" ]; then
+            install -d ${D}${PTEST_PATH}/src/ps
+            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
+        elif [ "$p" = "sysctl" ]; then
+            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
+        elif [ "$p" = "kill" ] || [ "$p" = "pidof" ] || [ "$p" = "watch" ]; then
+            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
+        else
+            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
+        fi
+     done
+}
+
+
 CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
@@ -78,6 +129,7 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
+RDEPENDS:${PN}-ptest += "dejagnu glibc-utils"
 
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
-- 
2.34.1


