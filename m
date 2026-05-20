Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B13DCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 02:54:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3888.1779245666157928774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 19:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fRRcsl8i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9600d7dd68=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K2if8S1117579
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 19:54:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=n2Mg49Q7ls4m+o37yq3GqojZKzzGChwvmzvnh2ufQuw=; b=
	fRRcsl8i7H5xY0NvTEQv/4vv8Uaqw9ZDqDlr17QLy99EL/0X9zg8mEX1xt+sH6c1
	weMEgsGWB3RVBE5lFDHq4Na4/RIRutsnpi9XEIrh+JGrvy83FdgMTUTh/e5smwAI
	p7/XjNFGSju6sbatHFaS2Vgv/SxS34NE3APqG1QppDzttoXu3PezZ0RnaMz3tk7+
	E5NWIjMtj9+PZd52exVsg4sQLleq4zPprT6mKaDmuT3ynBNWBJd8oILdLIwg+4Tm
	6cFZR/ua51SFrY3OIk+tQ3iu8ZT1g2TwxwxKaTBI0tYvuq9TuHFxw9SnAW/GqJw/
	fwW2zpkUdAHfTZdVbBnYuA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux4k24-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 19:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLvnT8R0wyVO67SgLU4I9aJGo66SQ2QsJ8HZ2V1lMFLc3vnxMPx40Ga6+9GwGvCL3kz9ulgF6ZTuCHl3cBLsl/bl9KCRBdRz9rpLrOy3SlogSYbtC9W5/yO1NbjYH9RUz5dk0NEDaYpFWQZFZTu4dW02uX/H2pqPpcYw+F0DWuBkbKfyqt+v2B8fbQvL88a2Yz0rdKOSCVMpT/koroMVhAqR6GPyi8tR8Sc/+ZZujDbUNEIV7VguNWNbYZpMCB0tOA4fEBbjVdXK/ZFfEyxPbzM3IYT4u8se9bAmsO9tPaD8if9rAwOzmz1DXMFRlrq9zS1Kk7yePePHIAQYvF/UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2Mg49Q7ls4m+o37yq3GqojZKzzGChwvmzvnh2ufQuw=;
 b=QHPEkWJkFTff3qLBblclaetw1E8nDqpF9d2Z14dXDGeynj2HiYloBPmmVVK7T7RjqeYNzuAMo8NskcidRku0wOyOOD1Iec2S89SLXZdFzl43LbX/NPFx5wnkxd5WZfBpJKVjgz9rBDm58JAm5Eazw8RGjB1HyAZwEs3nt2LyILBByH5CwxLX4xROs68kpx6t4J2BEHMS+BDSf3dYfXSak24e3eKkvbONoC0ELLXUFYEcjhaywsfRdQxreM5BcTlkMRioxaSqY6KEPYg7RNjiguizuutkZ5SKf9uBQn9zuaCIik4wp2LPg0k89A7ZPhxvAmXuEES7tI6a+4pLJwRIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 02:54:21 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 02:54:21 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: [PATCH V2] cgo-helloworld: init add
Date: Wed, 20 May 2026 10:52:28 +0800
Message-Id: <20260520025228.3317111-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3e3c326a5b907cc8c10521bb7590c8738bdaaad6.camel@pbarker.dev>
References: <3e3c326a5b907cc8c10521bb7590c8738bdaaad6.camel@pbarker.dev>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM6PR11MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: c7183520-6ed4-4ea3-0751-08deb61b17d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|3023799007|38350700014|56012099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	HPkePg8YgtbxJI0DiNENSLH6mpPD2/JwabTS+tfcF3wo9kxU8HR4YX8+8H+ZrcdYWCnceitXOFWv1BXn1FmLq4S1Jh2JfnJwvl1M7z0X/7/6boMKey4CDvRG55Zn+1KpErOm6Nb7Gbot7mDZHDlQh5p/CKPr0XTHf50cd00/xuT7hqgFlfvBn6gYDMHtlWcFdD2iSLpqptKNHkQtVLTy4SeKNjpgYMKRkXYICmc3FVMEGXxth8eM8bUhXri1jFs5hwAo3qigUU7hxUg5oiz4G5DchuCccz/mPGtZLqj6XJ64TY3dUqQimSEAijHkoMAV8CdfaASS03hknWWEqLwcW09rjDWXfgf2nltaXBynbJajHlXAa3inWX8FOAdUrEIEnpbp2BH9ApxElqwlwIW2c9ofPVOZWDQybRcqfjfZxNQfLbd/lc3k8R3DBq1JIkLJmY08nEQhiqHJ+9WPm1iLH4KUgSZhVCC2F8NFKJe1Sbe9+0guSMDin6edALT/1kH8ONLPI7n3RQTbCMbbkvP7nSaBo0vEBhR+X92E8ie8px237e8O23KUPfUGPf3vs5r041GR8mGKD/XLCI4T5dvC3C0jQfepHLIc3TnIniDCLffN7ZHfxsZIxzgwXBqyucis57hXZLNNhYgPlT1ZAcljYGEIHazlpaJ5yIInAWBDfwm5wL9GaCULyPdomcuRmlvB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(3023799007)(38350700014)(56012099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?luNEHGCSgO2YYyMqHh4nnz1DkRp6rwK+3M2zWhnaQfo8H0pwfkBjCEzefNWl?=
 =?us-ascii?Q?HWZdAj40uCso9zdHwODS9crO+P0M966/Omjh+R52QcNkYjVy0ulcQZ/946U+?=
 =?us-ascii?Q?Xjb/G2n4FbopfKS+RA/8AakucdusJ1IzgEq7kXwAn7cgLHbALGiPeo6UqHva?=
 =?us-ascii?Q?FYWc5zWCwd+lVMhsmx8hezwQ81hYNiIXSkuViVKWI9uCbotBfjtgFLgQJpIQ?=
 =?us-ascii?Q?hX2qedXF9V0i2ZOFmEaBRs0ukLtqmw2SrF5LqqePr60FDuV0s3wfGCCYFJKl?=
 =?us-ascii?Q?76pdvQLbOUYpDNBcz7AqRxnyrntnyus2yPH8Ip9vlKkKmIPKha0E64L/dqd+?=
 =?us-ascii?Q?6PlkPOhM7xAV7zXy5vX5Sf4mcRfnUv3U1k3RQG4+TAtTQdFBQN/V2wLGJx9V?=
 =?us-ascii?Q?pl6ZmF/0UOdP4QmUTAvOlIy54DCMXhfLKI9MP+k2o3U4s5O6p2Hb689yd4mR?=
 =?us-ascii?Q?LlVXoFJ3G/yDrs6uaQgfndFhZVwV6dn7emQuS9XwTWrrHjHMZk3s4hyZ1/wY?=
 =?us-ascii?Q?RUymS4bcxKJqjuoSBKLgCIfAj9Vh8GRb7jrbQQd1UwtuTr68cLU61cx/iz8P?=
 =?us-ascii?Q?txwRIgZODzZKEgYFOrYrjObOZA5HAYJXDahBftA9RbbNZoQc8ZH9NubmJiTt?=
 =?us-ascii?Q?W0ZXcOPSkUaJr8tG0dCGzvAEc96nkyIxTEh/A3h1dYn5YCepRTEpJoAKRKWY?=
 =?us-ascii?Q?DnSv5qwAC71cLA4+k80XD+fQvD7s1Mv43EFw5B3U43uugp7SkhWUFaOhtfd7?=
 =?us-ascii?Q?Sze6xQeEeIh+ZYNHOMbpdWhSPJ6CogpTzJrIOJf8oLNF0Uegji4BXOmK92cm?=
 =?us-ascii?Q?7U/cdX5IUtdgeTWwSFww8GI0bmYpYy8G6aX4iprtVLVdKdcC+S/Up6l/s00E?=
 =?us-ascii?Q?/f49vTbP+W7bExtL7IYEGM9Zbiad7yhzZ+2yPRwwt162q1na3RM9slQbI1iG?=
 =?us-ascii?Q?Z2KscpWNpZ6dXrTVEDa4VETynSxuVUpk03nutr6/A/b7C50vLN46Re9XJBX0?=
 =?us-ascii?Q?ywIQEZC4AeJbaRYLXcvK93WMQoaGtDozq5JVGDA3QJ+GiDdI4Uosg+DzqOsE?=
 =?us-ascii?Q?3g62CY0jzonwMmCa1Sfo86LJTULS+Y0LH8pkvMX3f+HgLAWUz5NozxaP7CSx?=
 =?us-ascii?Q?0raJ8IuhzhEOSHwmWdO0IV5fHoN7wIfb+CV16O5cos51jcT9/Ys6R5IVkMHi?=
 =?us-ascii?Q?QAplKstIu2fVd9gDuzaZePIGfOrHN8pCiEFmaNmoZuc0g5vokcWXOLwla/qj?=
 =?us-ascii?Q?M3Un9zewRqgYrdjy6a4/O30MKmeEgVDZ3l1tyXrPe/r07WNd9LRsUyZd2JdO?=
 =?us-ascii?Q?f3nfW8hM4lHIHYvcG/7Vyr47hErK9dUmIrnB7/CjurlaVjnvqeIrHtbAEofK?=
 =?us-ascii?Q?4yd8IgXr2LsmBUdq0oUvnoXYmk9/t6WFaNer6ZCiPtP1q6hqq2t2oNaLMYrM?=
 =?us-ascii?Q?PLG6PsrBR9kS3sTQ+N5xcW/eGV21ZI5WAe323YaMnTcvL8VWC9Y2u6gFKDD6?=
 =?us-ascii?Q?uTf9ufgh3Xh8xMxTAJqOcLZqu7nNyYwul/nTDxQGem8wNz749dXjSKmFTgfU?=
 =?us-ascii?Q?c54ZPSmPKH8gET5EdhTTiiT4mtp4gHkZkrCc+5y9+tdlZwpEQfXQ6N2Sv7X9?=
 =?us-ascii?Q?7Bux4jsDb2eJejUIIEn0nIqLZ4tB9f3ms1m9X6CS6e4V8GYx2E0A/JJcAAvs?=
 =?us-ascii?Q?oUN5hIR729Wijjxe6gMQW0bL2ECsKDyKwOj0ttRfcUqstZp6wAv36Ws7fzHf?=
 =?us-ascii?Q?8OAtMtSZi5Sv+JdSW4iBfQXrrrNjn+A=3D?=
X-Exchange-RoutingPolicyChecked: 
	VScQuEd285uMQlPPioXFJDf3120Ea7XO0uCCQcj7+BvH8uDtZboDBNKLS1q0vISAS09cr8KkDQyi6obHf2sxz7IrbN57culu+vyAJWMvBKItkhzbBIVnJoW1VurE8rzEXVWm/PFn8B2HuuOku6Ky2OmU19Y8Pq+h15OlWeYWchappplTCP5QS1CiHKy4kFuJVC/CcvbqMrZ5RlTlEyBq9J+pMqJCfx7rk7etpvDYRv9OvnJAPywtwhBzz3SnoZuKvCW6dZAGc7xjCoxgQaELCfDzx0y3i4Ee3+yflzKAeGD7YrHUgnOcsC2Yq2slhodSxy6W1nwDfY8E1ekv2CC//A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7183520-6ed4-4ea3-0751-08deb61b17d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 02:54:21.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60A1M0kHYZ1cj7IEnBKqiY1hon+D3PJWBeLmzCwl7W/2+5JLA5J9HqwIjD4hTgE+dQ9cN7ezscUvfl5pdxamMKyNP+S6y0tIlpE95Qb/p1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Riv3MnkGbDaVxmzaRjopv6TU56Jmz6mE
X-Proofpoint-ORIG-GUID: 5i3Tz8Iuy6k5J6cnsTyuDPCt3WZTC6GZ
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0d2261 cx=c_pps
 a=SygfnsF0+onPdWEB+AKh+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=dNRKKPjXAUMUdoJpSbkA:9 a=JzoqPLP9JZdtOgQq:21 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyNSBTYWx0ZWRfXwXZRoJrB5POn
 VYpPhgz+6n0rvxNwDQr8Mrf0TLMt1yovcUrKO2bUpObqg6pnltazjdxoyFHcSECNSdGMwy3Lcya
 FLmyDqaQ2wZFw9EFykx+LH6IwWlEIYtNroldajT6kLNhaEiOfyxIq5glnKEsWjzNhvJ/okCHcv6
 Xdgu1ONnflaWIEHNTvdNRMlhs6EiWeYUo5y2B05RGG38cmJH2w0OqAdnvMPlniTqrY2wtS6Vmbd
 ydEiAv+IKSYoJkmq3hrLWUfjUvvxmT5eHX3k5BYipOVcLPHFfNLhLDCVOxbl5wot/CLGgDIt6Yn
 yqTI3omJ46cgsaOna4B1Bnw1Yb60Lyo6ai7pjZM3zqpQAJ7AKEdOl8ZMl7bdJIEhkEiDTLRN/Pm
 r+0FzIHly5gTmGXVhDeDXCQT/GRlusxOFFI5Qd1WQP53TRr1YCA5mmDoJLNBfMUEQPyV5wYDRs2
 hzPOeoc3WkH8g9Z1W4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 02:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237379

* Add a go example recipe with cgo enabled, Flush the stdio buffer so
  that piped stdout can read the output before the program exits.

  This is for covering go reproducibility with cgo enabled. The test
  coverage is provided by the reproducibility world build.

  Related to the following commit [1]:
  [0642d23230 go.bbclass: change GOTMPDIR to improve reproducibility]

* cgo-helloworld is a complement for go-helloworld, also add it in
  runtime case for go and gotools

[1] https://git.openembedded.org/openembedded-core/commit/?id=0642d2323072f561a4d0eeb9266213387b2997fc

[YOCTO #16100]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/runtime/cases/go.py             | 12 ++++++++++
 .../packagegroup-core-tools-testapps.bb       |  5 +++-
 .../cgo-helloworld/cgo-helloworld.go          |  9 ++++++++
 .../go-examples/cgo-helloworld_1.0.bb         | 23 +++++++++++++++++++
 5 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
 create mode 100644 meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24c5a9d712..b72cbe7c93 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -97,6 +97,7 @@ RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-cargo-c = "Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-cgo-helloworld = "Changqing Li <changqing.li@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-clang = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index 0c9c4ff4cd..6e7a9bcd94 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -85,3 +85,15 @@ class GoHelloworldTest(OERuntimeTestCase):
 
         msg = 'Incorrect output: %s' % output
         self.assertEqual(output, "Hello, world!", msg=msg)
+
+class CgoHelloworldTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['cgo-helloworld'])
+    def test_cgohelloworld(self):
+        cmd = "cgo-helloworld"
+        status, output = self.target.run(cmd)
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "Hello, world!", msg=msg)
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 25561f6878..d6bed8d32c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -21,7 +21,10 @@ KEXECTOOLS:loongarch64 ?= ""
 # go does not support ppc32, only ppc64
 # https://github.com/golang/go/issues/22885
 # gccgo may do better
-GOTOOLS ?= "go-helloworld"
+GOTOOLS ?= "\
+    go-helloworld \
+    cgo-helloworld \
+    "
 GOTOOLS:powerpc ?= ""
 GOTOOLS:riscv32 ?= ""
 
diff --git a/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go b/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
new file mode 100644
index 0000000000..0c1f9d4c96
--- /dev/null
+++ b/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
@@ -0,0 +1,9 @@
+package main
+
+// #include <stdio.h>
+// void hello() { printf("Hello, world!\n"); fflush(stdout);}
+import "C"
+
+func main() {
+	C.hello()
+}
diff --git a/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb b/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb
new file mode 100644
index 0000000000..9ca1e16c7a
--- /dev/null
+++ b/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A simple CGO example that calls C to print hello world"
+SECTION = "examples"
+HOMEPAGE = "https://golang.org/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://cgo-helloworld.go"
+
+S = "${UNPACKDIR}"
+
+GO_IMPORT = "cgo-helloworld"
+GO_INSTALL = "${GO_IMPORT}"
+
+inherit go
+
+export GO111MODULE = "off"
+export CGO_ENABLED = "1"
+
+do_configure:prepend() {
+    mkdir -p ${S}/src/${GO_IMPORT}
+    cp ${UNPACKDIR}/cgo-helloworld.go ${S}/src/${GO_IMPORT}/main.go
+}
-- 
2.34.1


