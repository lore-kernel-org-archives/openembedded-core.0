Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50E4D3E788
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 02:25:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13335.1765419940341021269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 18:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jUIUrfT4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444099e962=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB1Kh0V2037202
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=wWua+r33tpWCKBQWQWsO
	eELZitlALhJ6vjXBrKO8rPM=; b=jUIUrfT4gGljYKy0S5o8FIVza2mghf0d5w8I
	ivaMYZzxGCKfrWsyXWeyQyLikXCWbWFMEwPPgN5bvS/NF9CQskX//V2E/VLzuLML
	4R3wTE9YI+GGsHAxEIJtsCo7wSTpCeJ/FjU161yO0IO/oplDFEryBZgbPN4TiyEv
	YpjgZzq8ihk4iPMoomP2OUNwhNmdmYpQXKAPrTHcCcFFSkJ6t1zza5s8GbrWEG6w
	R5YrEDSNwINmNSp00Mv6MI7V9OfJJ9O3tZ/0KkjdJcTTPfBKJjRgdQP7EAl/U1TO
	wu3AZ1lgLsmNDU+eSoj6Cyy+BHhEykqIH9TzxiGGVnkn1cKYXQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hsf92-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:25:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONL9PC397jp01OLTZrHKGwQxsyTtAvJseRapKpOmgRQIwEJ0HKccLnWtW3s6RcGXjOHAk0IHPb7EF4Ou2Qa0pyojzXDLTGKfVDc1j0ZBTMWCGeVFe/BshWAEF2d/8nHIXgaXz2qqE6lWPzRZISGP/P+5B/5+Cmld8V+VvO8qFtUF/LYZhmm4lidnPkWjfFkagKi6rjhfJobeSQVyhDmtX4xzRQ7Hx2RF4mqr7BtyhqwzzvJVFy1D/YjOOKxtfoPcOeDHtRVWydjIf8GGipisjdHYSjVezwiZdyvYZsDCjI5ht+bC2KH1eL7cEtCZRGREJYniQDJ9l0llOraWgYoegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWua+r33tpWCKBQWQWsOeELZitlALhJ6vjXBrKO8rPM=;
 b=gt92meWfKJ7gG9SZpRQXDgbjULASE70oTbn9Eyo4/DlI+g8KHHq+bJ5EddyaOGsHy5oNVoKnEzzw4KU3ywTB9HEPHZBCDr/EOcZy3Ln76xcMk1eRhFbtBSYVWv7udUBsv4Tj96FajZ/aFvTWlA4i1RmuyKW8rgLCwzCxfX9L70INuCFPuTtaH9+VI3WDixbenGXZGOr+4wyhpfS8ICYBMfvvKHY02s2smqUhgxkw3EjN81rvjOtzRlIucDfNzEQiD6KvQIB7TyZE+DtQVW9dyxllAtWicjmxQvyFtx6HAdwfWVeuGpjnsTV2dBCfZoNgnMGjRs8wcOxUP5a96YSFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 02:25:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 02:25:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libsass: fix runtime version when using git shallow tarball
Date: Thu, 11 Dec 2025 10:25:15 +0800
Message-Id: <20251211022516.954232-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: d59fb7f8-2d73-43da-0acc-08de385c915f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?obHgCfDDaUArqnmVmlK2tGisLRtyTI5kDze3Rl6OnnGjKHjiljki+hVfmn4t?=
 =?us-ascii?Q?QqfuzPJok0Yj33yIQejEIru/HKcXcjholOvVCME4KuIeWBkoi/FbImMjSXc9?=
 =?us-ascii?Q?qE7Ri10xqSgY1EcH+wPxWNyqaY/7eOyhyYLGgjSLoyA0/jtzk9Z7BMP1e5XX?=
 =?us-ascii?Q?Lv4mcM0VGcCz873wn6TT98XGCrjC2ZpD1232PaP6mTu//niIMd+K1DrHaQTf?=
 =?us-ascii?Q?hqsbOpsQGcvuEc08E9RPcDgtx1afTZlBUn4dvaEOpEQR2oeqgIl0gMIfw4Od?=
 =?us-ascii?Q?bN0oVD9VBfmnzGZKGWM6XPmGBVxa8cY9mGn4fTgKWgxe0tbvQ9rJnV6J32UZ?=
 =?us-ascii?Q?s7auG0YgYmEo75W46+CTIoMdVHZFLrt1SczyItW10wRJ7GNffU7fnGzD37jj?=
 =?us-ascii?Q?BJFpRRemJcQ2M/dziGtwPAl3XA6gZqEHHYQ65BHpzWFNpmGKk1f+qewcUfKw?=
 =?us-ascii?Q?nvQHCE3pi1GHn+DPRblmqRxxiENL0MltJ9ne1wR3owMIXNTfnMtTYfXU8xZ0?=
 =?us-ascii?Q?Ao4J0EjURCJCk/cQG63kr+B7zjxTYh4cBYNi9Y4p9H7mM7bw9r2xthbrqNWb?=
 =?us-ascii?Q?fXa5IK2gtHAU1wJBPS1/O1NVzG/9KZyU4qHRgaJ+YEw5wP4NW9qcLvbLHdab?=
 =?us-ascii?Q?WKp3+lmC+uP4jsspUlkrgPhVUodZYrI78lEMd9B1EA6K45c4LebcW0dTILhj?=
 =?us-ascii?Q?IFRwMU4A60rG14OKfGub9Z3IRz/uRwag3dhFt6Hx/amT07q48nCw/YodJVcn?=
 =?us-ascii?Q?4BNKs92X8EytZ8Xzgn/2e0r6cFR0crUeaCzG243bXg7b4bI7DmD3r2wkG2/Y?=
 =?us-ascii?Q?ZocEzx1BbUqc+oFkt/vEzNZ3+BxGDG9x1mQrDzIeqp3E5+IYDP6yp4jYTmQz?=
 =?us-ascii?Q?WmuZSTKgj7Ztdi4Uo7j3vt1mm8IRtCSNKvFWpwVIIjJEpTKg+sa1vDFVdF4b?=
 =?us-ascii?Q?vdaEGZCEWSxbm47amHENXwhJ0A08fBnUpzKJag6PnmkUVd7hlDoXv5jqMHMa?=
 =?us-ascii?Q?hcEaTRIzGXLP9DTD4VKqVRlWwVCGa+jInnLgpSTcOycmDex3zVGqz08qHfck?=
 =?us-ascii?Q?tGAjA76PjrGdYd7cAWEZGuwgA1Dk0rYtgUlCtnrIZW9a9iWiGgcnnTff0GOy?=
 =?us-ascii?Q?IcuiNYwHEmedRwSolvuvFqfQRvtXLrpu3l0zdi45mOQ5Tv/Sns+phk9Ik/VK?=
 =?us-ascii?Q?bHvQZ+X7xPOMJh76zNZhsLdTsOJPdWx4L5WF3dLfdS+tLe0O75RHuEjQbIb8?=
 =?us-ascii?Q?MeAM4D8n/HRGMnZ4rxV/b+WNUvZPwsYRFgmImRmpCqY3Uz99SSKE/3zc0HHU?=
 =?us-ascii?Q?MHez9hku/NySudgag/YtU8R61ckQoCCKKd1H9/plX9OGc6NhZmXbizRSTnRQ?=
 =?us-ascii?Q?SZhGLLDPHz2S6wnUAiyIDCPEBqr0e/dqsVRTP+S0W035UB3cYMs7Obk1x8X3?=
 =?us-ascii?Q?k9h4g7hi3YIaRs4UNT04VCafkzvArWJMxuzOliavzqd7lLpyr59fzyHe/wdJ?=
 =?us-ascii?Q?DLmnI6X3/CZnvjNoaUkJa/MJz9+I0Ii6HtY/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X9EaUEqZVyA36kZt5QdBK1/3pdg6oFrua49Eq4kyrF/KpQ6aF9NgXllrXeZl?=
 =?us-ascii?Q?eTwhUP5+9/Qtn5jCE9Tjy33aVBOI9LGrmgMTl1NOP+bEhR//zl2WjBZCCsfH?=
 =?us-ascii?Q?5agjG1zYS6wNGpTGZeRiOn1tmD4bGqPt6m+dbzjV48TxFmIfU8R9McrPE8DX?=
 =?us-ascii?Q?kXeEeMvhPjmHloZJMKnsC2fdDk6A8KMvEQ+nHz8VPa8r07xnNB+FrjXfc0Ua?=
 =?us-ascii?Q?XYy6oGiO1Se2VeI75aiTjI21CMJlzVJ4VJdJcLlhQ/wdAIpQrwRxSLOvG/kU?=
 =?us-ascii?Q?3VcS2SvE52Hpx9tA4ZOdSUzCLQ76rj5nzsAVrLjIIBFHZTjLhQcj5IRnMzzn?=
 =?us-ascii?Q?kqly0v9JjmxtADzsAeGcZptWH/z8Ce491ppAMkdIEQXX/TrF+hzGQP3xcHuE?=
 =?us-ascii?Q?zi6t7Hs6JkpowMn5T4snaFCY4rVQei9BhaNAPLJcQmpI8SRK+4rr5aTT+JGi?=
 =?us-ascii?Q?T1YfDCu4tdHe48wUtM9w8ESUkDQ6Qq6s99IPNpF51TQXwW7/OJu6iQFypLWK?=
 =?us-ascii?Q?H2I+N24OXDvvl/jApZUpP6OpWQaohfFmkcirJY9/Lgikzn+t9PGprrWCNNrb?=
 =?us-ascii?Q?uLyJM81jO+uiKqovORYWoZav3jasupID6x9KOl690egscDGrAoSkxuHLyXyg?=
 =?us-ascii?Q?2lKTNRLTGcuYyFkOeS0YtlN2aPuPhS1t56NHjC6FLURvva7P9e4Bi+hHqj10?=
 =?us-ascii?Q?I+Ko1oergQSIRYAUtlWXigrQDj5rYObEwJYp4o7DH85tYl81g21/WYFGYLRA?=
 =?us-ascii?Q?ZX+TzpvFvHSxIvcjhySPPXnKivCaEkUaxZQrU0Aj9R+LG6Qm30N+ZgrJzHeh?=
 =?us-ascii?Q?vSITigqpi/uxE1Wm/e4rAv3op5ikmmW0W4sMKeZqJLhvy02ocitOmwSMxxCW?=
 =?us-ascii?Q?2iNqyrn07BmNdnlnGY4Hjx3S9id82Y0pamDYTqKQTBJIxSeVF4qcwG5GD7yS?=
 =?us-ascii?Q?kLAoGnmol+yqmQeWTUZoE+WHtdFGpxl5JD0vyxZB78KvBsQKJQQX2u8OBMfI?=
 =?us-ascii?Q?B1XqiVMyywdEEDaNoGP6+Nm7i8UzdY7bD0PG4Qa9ggWmFi8keoTtrNtULTbK?=
 =?us-ascii?Q?RMyfaBRYyQB++xebwKem42iL0UWwgrpa52WO88I1y4UtlyUaB/I8ficys77Q?=
 =?us-ascii?Q?3h1QMmyDXyW87I7JMbGBaXIU9A0nkm5e0rkr/ng14nxiF93g4L4quSwtIthp?=
 =?us-ascii?Q?i7pCs/MosYljIhU/Fnx55u65VzjKrhVqZR2YEDf59CuVnfYP6eU0GoExM80v?=
 =?us-ascii?Q?+Uz/6PJKckdGV/QJWr6hKk5cdIEMtY+wK/oKI+vsEFYr1LMvS2ylMOaNDken?=
 =?us-ascii?Q?FGj+MLbQUI2lyVtrXpF0CAzxL1u8RjCElh3yBjuiZntW1MzlMnpARj0oB9Lh?=
 =?us-ascii?Q?i2EyRKGeNaq9XGbwlF0/Wy17uf3uNQBhtnfBfPBcdpp7lJVctF0l2rwypgMB?=
 =?us-ascii?Q?zpSvAlZ5OjWN9dLCeuoYwEZYSHmeqqtO4EaBhsV0MpNeUdqfetbAxZ2yjsJZ?=
 =?us-ascii?Q?fovq3+oHR6jig5BO/SYSBrMA9sf9rINWfoHIgpNAzlCuErbveltbgmF/TmPp?=
 =?us-ascii?Q?144G3j+g4R+AFyaROVsAP1cOI05O43Szwv4oilg8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59fb7f8-2d73-43da-0acc-08de385c915f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:25:36.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6F+tndEid1XywyQV325oKTc5QZvUuqba1Hnnc6tqCSns/OtYVt5ahGquhS8bVxoUkMuIDbLnntSR+i8Ms+I/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMyBTYWx0ZWRfXxwUqmGeT7gnl
 ljn8a0Imx6kJmz2Oqmnk1kVjPs2DNj5J5TPRUhtMqMFAs65fCulkPvSnaeXnMnNLqTvFuu+Nxw/
 PfrgsjB0hqutug6yCXOh35fRC1rb5UUqO7PekHYQ9kx9hLNHd1sqvMn44koKTI4htdQccFwuL9n
 psptJBF46xfIcsHuw/v0xYZ8sZ+Wlch7NcgyIHo3TSUqZ61CqVYFFbN72pj/tnT+T7KY2xy9w7l
 5E2mxEYi/YUeMMo3MFxQga6uQBAPgyDd6ja6l9yJBD/1O/1eqmCrZZAM7JxuEBpVcDqocQn8IFq
 YjsxRbLox+x3rqpxxdQS73TBpIvhWlps9GkHukWioEssaokgTUfQkNBOr8eTvkPHyJ9A3Hu9LUX
 Wfi60W7z4geDYRwOx8BgkVHdGtjcTA==
X-Proofpoint-ORIG-GUID: nWp_6LYjfo2LijhNHi2ybL6LLxjJ5s6R
X-Proofpoint-GUID: nWp_6LYjfo2LijhNHi2ybL6LLxjJ5s6R
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693a2ba3 cx=c_pps
 a=23BBZRleo/1KOgyGqX6yRw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=LMwnC9RXHQX1ALpVkKsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227507

Add tag to SRC_URI to fix runtime version when using git shallow
tarball.

Before the fix:
$ sassc --version
sassc: 66f0
libsass: 7037
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/sass/libsass_3.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sass/libsass_3.6.6.bb b/meta/recipes-support/sass/libsass_3.6.6.bb
index de608f0a6b..26f549e53f 100644
--- a/meta/recipes-support/sass/libsass_3.6.6.bb
+++ b/meta/recipes-support/sass/libsass_3.6.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 
 inherit autotools
 
-SRC_URI = "git://github.com/sass/libsass.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/sass/libsass.git;protocol=https;branch=master;tag=${PV} \
            file://0001-Remove-version.h-from-source-directory.patch"
 
 SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
-- 
2.34.1


