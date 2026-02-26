Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB077FC5933
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:25:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67848.1772105126429659642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 03:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U4miD6OK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651757bcf4=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q9o3W6563849
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:25:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2OZr//zQfT86/6vFLSUp98DBdqTIACJ+HbaeKFY45ak=; b=U4miD6OKzUoR
	nNUhW3v43TRY4zbn4QIG9KR4XAVN7SC5NXeI6A4V+yfT8QQ28znoC0YV1NYhgDYU
	QTFglvVinMkroyxxMLwwnd9uRFxOdiFx1cwzvPNbGUoZFW/c+1CIKFTj9VDfw1JC
	t48uij7wXUwNxNpnWnpwyj6ChJIRugYYYKZtLcrTL1/jGdlM6u4bFai69B2ZhLUO
	veHy2QpOhJizoZOPPi1jb2DKfeM5zePFrRjMWXX9AKloeeBZ00C4v7+enIFrRQ3f
	n3BwuweXUUiv8ngMhCjykkdA8pjfkr4Q0Bdk5KrIKZmxQO5PSs+ZtIp/F7F9rkbY
	OkRhF89n5A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdyjrbq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPAe5jC3b4aQAmXpJGk1mhQAlH0B8z1nE52lpv8NOVwj3RFHu2++YZswdLzFWrksAd+PX0Yln0XIAteVn1FKfQet10RpjI2+Uds9IzNpuHu+Ph3e/rUaWF4aGYQDa+smI8Ovg3mo5qv/R83U2n8zbpk/anFJw/6YSthoIrw/QaTrotYwpy+xlcWNplQRrz0Qb5iZQparvNSmu9ubQXjl9NzUjciI1Pslr4jr6XMCLpzkrfuz0GVuIOMxKMZT3jVeGnhjrSJkbD5sUtelI9GRqmMVoZ77Lz/MC/gK7wVlHco6YlQuuIPvWdZ8Q7ebYf/Tj1XnTf9nPPG0Py1Ve0mCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OZr//zQfT86/6vFLSUp98DBdqTIACJ+HbaeKFY45ak=;
 b=Zy4uMpElDpaChC3VaNT2C9pXIwXtlEdZVzd51fbhw6OuOhlW5E4rXb+B8etZn9BQY9qK6lhEC9D3veHBX4WM79iv581htzfzgFmKvjgyj0DNQw0Gq1j2923VMV2SzC6RuA7uzMCmriBDtRli7ilhS70yMBdUb9E7vIVn7UhxWBqXxar81D6mXbpA8Skg6ye/pHbgxglHzRUqqjUMr0A2xE3GrGzCPb+Qee9zE/d/8Jc5aKfSfOG3PW64PPp6izIH5+OfFc7YD6LTmsFWxqBXeT83BwqjuJvls0hmygP2P4UgKzEN1uytAeCeWcfx3lJoM8RRZfdWdl2mCMhsdm9qmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 11:25:24 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 11:25:24 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] perl: upgrade from 5.40.2 to 5.42.0
Date: Thu, 26 Feb 2026 19:24:38 +0800
Message-Id: <20260226112438.2413203-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DGNYN4ICGR5R.29DIPU8EA51MG@bootlin.com>
References: <DGNYN4ICGR5R.29DIPU8EA51MG@bootlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0699ed-33f7-4658-7262-08de7529bbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	GMTEteWnSECeqiJdWMX2fpVfx3AaiTVkTptUXSmYlXRi208w7LoIsk+G++5/aAsIxmfImiaSCAjoDs7ZgkKHv9TiahZCreeXudblzaU1Me0lScYlTQx113CWqnS+eCNzYx978Azlhv3rvLnAdNnJJMB8hlNYq5izNt6h01Z97ifjRwnTlXQm6CHhJO0yfbXx9ks+sawj+H7xTR+idKDi34+02AdD/Q6JlLf98EpBpoPd9B5P8T6lVpWA8Nd0B1A49dlt70oBgaIpw7kKsfDmo/uP34sU0K7wRse/sZeZP4yL6thUmpyddTnqaLjvUxyHERQSQ4rMek0pnd49e77uOBQ3ENqoh0LQIteEebfFrohLf1V8nVLj5n3oKzYnbs8FvAi3WJ/MUCZI9gWHiLd6R5Hcv67lhqGdOqGZ5eaUzzGq2Z0DcC4R/w7bmUk499lAuv9zf0QBwUW3Gigwcpu7Zr15pM6Zel1kODsIHixmuQJIhGjHaxByateaIBf7Ndp8pvo2O1MF+/IXYz648P1AL3C4FHij1bRCChWxsSoBmdjpNMaUCQ1P4y7CY7cUwQJHMK5ZL4tZs515NKhVb0ViCf9T8GK66bFvoPtOhIGAOBuPkgvGjEbSXDeK8D1ECB9bKTgmf6ww8pnOXcgeZaAPj1psDmxGbmW0G+lvegiZnRLssw1XOuwjjuGRWC8hXKieYs8dyinss1ORsJrJk2tJZbZoAA4whLKqv298a9DXOyE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c+criZ68Lr4sDWN4Xw947ghDcEJf/JRsRMEz+80pmikbS0cFBnu32qKuWP2+?=
 =?us-ascii?Q?uwI/F98oD8eUB+3XKAsmm7grB7j9Luh8gyQx8p2peTaoHBJp5Hr7orNQK+6w?=
 =?us-ascii?Q?mfUP8abm8HdnbUyVad4Twe+e+3UN44lYi28eyYdlBPEIuiT1EL33jikO1tZA?=
 =?us-ascii?Q?H2P2Khbcrms7UjdH4Ihz0XepiLAt8U+irS3R6650lAyya8m+AoFNoBhjSofK?=
 =?us-ascii?Q?Okb54AsFP1OhoDjonaSTu35LtJoDBcMEF4lmZ8nIVvEd7C2g1e9UiVvc5b5y?=
 =?us-ascii?Q?sxoowCKHk9CuXKjS3epgMpEsDQjECCwjOOhLo5UPrSaogUJ6RRbW9CgqQWB+?=
 =?us-ascii?Q?8GDl5b376iGZ4cMC7oCstPS1i/jGNp5P0MQba6WefboUud6732e+lPzcTmRM?=
 =?us-ascii?Q?5YT2qxC/wAQEq4Q4W4QRsgMX+nPvaxMzr/B082Pk9V8Zu2QasDLvUljglkeg?=
 =?us-ascii?Q?rorUvyLmdt4prbQz/Zs4o8oXMxD50u+UkE6CtslMvw5KcnzyvdjsA96hr8ai?=
 =?us-ascii?Q?qDDcXSUBn+of1YGkpS2AbH1E4twpmRdfZp0mvwXBBUjNws/XslhOB3pVDIa7?=
 =?us-ascii?Q?6w2gUBOoPpC5M+2PA3Pt5MLCJgVSEtoDTS7nMjvyYLw4Ob9fAFmWc3HgAtRR?=
 =?us-ascii?Q?fwmkCQnDYKS6HyyLzRR0Q2ormI/zOD3Vl6R4DheKS3pUJwuhh869n9Iot+Lk?=
 =?us-ascii?Q?NL0bUZWxZmRK/89Jm4pveED5pffGzoZ/YmUku1PScyJUXckKzuFGouhN6BSL?=
 =?us-ascii?Q?QKItOxC6KJKoCZB3e11QC+XL/4qlX4TfPzkd6lZvbEavWezjoL+Y9h3RI99F?=
 =?us-ascii?Q?D6TUR04/evJ5CbPOeLy49G9rUMRUP5V8C8kQC3CkhrvC5PcCZ7fd/s1iXzU+?=
 =?us-ascii?Q?6V0Q+Y94i83rixWvEoFXtHOeliA7tO0EMRRuiS/FWHwpZ6uIUbwTrPX9YcEJ?=
 =?us-ascii?Q?d75rKAjODygXgxZmSDo/QjOMrJTwNu2XTKKhRllBWY2c/hsbPv3D4yXvoz3S?=
 =?us-ascii?Q?ACl1ozeJknxXIKAZb1Qsqi4D4qrXMCpGb8G9TlvQs3aKR8wSbmLxgMtWk5wy?=
 =?us-ascii?Q?ZFiKWnnrSRZfb5n6TxlF+YUoxIVvyMg8s+vrX2R7Ep5v0Jk6su2tDoinZymF?=
 =?us-ascii?Q?zv21+Lbz6BDFkSVDLjtr3zteYMVxy9k0aAgXmdQzG4JdnKvoBFlt4M0wdTSk?=
 =?us-ascii?Q?6n6qeqRfVV+9VGZMHC7QGs92KQ7qmyyD18C7hQHtRlcinACoj/M5PUTCi1Vm?=
 =?us-ascii?Q?2qHfMdByv4qhuxMoTKppPlxLn8RXnAsL556Kmbk5PUU4KHOirLZx/9besgrD?=
 =?us-ascii?Q?Xf+kUpZJ3Lm1Q7jAzkr9luSIxrv7R/pluvQh+b55PbtNNtD1R4L3c8jZxeTl?=
 =?us-ascii?Q?856X05nRT+PJ2Dx41X7JZM2d3K7r+ACcWXY+JoqAt/cS2tN36bkn6ehfHsNR?=
 =?us-ascii?Q?V7WqyA3r/KnrJGZJI3JacH7AKsqV2Jrj5IXqLCa87wf8r8rCvcqExRhXgqw2?=
 =?us-ascii?Q?4AfvQOtpMqMgZAhuxFzIYJMSPUaqKnncRLERckC6kiWTfDl/b/nx4hfXql/A?=
 =?us-ascii?Q?C5a8tNX31mojRFcYxMekkNKU5Yx+HMSs0oRHaJqGsmQYfkcKovYAktvTbUbA?=
 =?us-ascii?Q?NFSgM1sI1SY7a88aJVgigTssusG6b6Eu4zZ40T2gPim7cZfsIG9Qkoe148ZJ?=
 =?us-ascii?Q?df6K/lbg6d3Txh40gSbjzMyb9jhL+ZcpZnyls+XL/yUqBlRhpxKfNNXK2olW?=
 =?us-ascii?Q?vmW7LQcnNjLR/B6RHzSJsPtCx9yRiqg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0699ed-33f7-4658-7262-08de7529bbdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:25:24.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdmfPhHxW9ZwntsfCuZr3lS8rQuO4uYh0Z0UhEfXOUcTE84sLA6Y9tGKnwUUiqZrdoH5IFWwtvIt/ljPlUfl8/hRPHhyjpig4eeeJ8CKKNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwMyBTYWx0ZWRfX7AXbJbq74t/q
 ulSulFjWvMqHruoLRPMkdiibLas5S8sk0IXiyllniR7AojfvmOm/7cBqAWx5k7j26uDWucllC8c
 b9p2MqyApAoKGFHuFCcxWpbedTDZ9pJis4SDOyD+cokTRIrfIv/ilp3Gt4UzHPsnk6y7PSQ6No7
 ce3tet8ssXjz6+ABElQRsTaTVvTlR8oRVQUkEgfY+R8P7YtC4CwvOYSstNN52imZFEQfaNykhWJ
 OndqxXhQvrmdrEw336Y5/k4EhgJLnGpf+uoZ+K0UjWYJ31AG2dhzuyreHk6DjPB5vfngqLgaODc
 DhtLJr3QngDN4JpgHXZ0KYidZ5F5P/Yr+THdmSll/4tPd2JbaztyPOxgD+CKxhJK4DAV8UNRDFj
 VE+BoGA22gMV5fpWMie7fL3x+QsH0fmCMjWvIalozapdna/UV8D9BZHQvzScP5awf9jJtvqfd5v
 hTsDPjYmsZviTv0Br4g==
X-Authority-Analysis: v=2.4 cv=Cv2ys34D c=1 sm=1 tr=0 ts=69a02da5 cx=c_pps
 a=SJ7/6Usf5opWGcqe47ja0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=_IEhM8lNAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=vCHbrTk8KS4qZ2ypa2AA:9
 a=WN5SZLvFwbRUu1hQBHWk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: y7R_0hijDo1H6OPAXXUUDs6VEw87S0IT
X-Proofpoint-GUID: y7R_0hijDo1H6OPAXXUUDs6VEw87S0IT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232000

License-Update: Update copies of GPL to match recent FSF changes

Changes: https://perldoc.perl.org/5.42.0/perldelta

Update RDEPENDS for perl-module-extutils-parsexs, refer [1], this should
fix libmodule-build-perl ptest failure:
Failed to load or import from ExtUtils::ParseXS (version 3.57). Please
check that ExtUtils::ParseXS is installed correctly and that the newest
version will be found in your @INC path: Can't locate
ExtUtils/ParseXS/Node.pm in @INC

[1] https://github.com/Perl/perl5/commit/36118f523541d3e74ab495202ca8efbd9c9611b5

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/perl/files/perl-rdepends.txt            | 3 +++
 meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index 462456bba0..de383d5ccc 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -727,6 +727,8 @@ RDEPENDS:perl-module-extutils-parsexs-constants += "perl-module-warnings"
 RDEPENDS:perl-module-extutils-parsexs-countlines += "perl-module-strict"
 RDEPENDS:perl-module-extutils-parsexs-eval += "perl-module-strict"
 RDEPENDS:perl-module-extutils-parsexs-eval += "perl-module-warnings"
+RDEPENDS:perl-module-extutils-parsexs-node += "perl-module-strict"
+RDEPENDS:perl-module-extutils-parsexs-node += "perl-module-warnings"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-config"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-cwd"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-exporter"
@@ -734,6 +736,7 @@ RDEPENDS:perl-module-extutils-parsexs += "perl-module-extutils-parsexs-constants
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-extutils-parsexs-countlines"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-extutils-parsexs-eval"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-extutils-parsexs-utilities"
+RDEPENDS:perl-module-extutils-parsexs += "perl-module-extutils-parsexs-node"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-file-basename"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-re"
 RDEPENDS:perl-module-extutils-parsexs += "perl-module-strict"
diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.2.bb
rename to meta/recipes-devtools/perl/perl_5.42.0.bb
index 2225dc202b..a154bbc0a9 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
+LIC_FILES_CHKSUM = "file://Copying;md5=8f7dd0873e59530abbb36503972afcdb \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
 
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
+SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.34.1


