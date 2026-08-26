Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A83CC61DD9
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23523.1787780772655174044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aqAqagP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKe5XX406368
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=; b=
	aqAqagP9ro0eP3KOBAi3I0FhvH6Qq9RFXN/zV7md/pBjyACbFQBOKeE5z+zlpkzO
	DOlkiJ4MqQ3eKd4G8ks7rWAUmeGxboqtRUXILQSpkB4Z2tRkrtQCcr4RQ2wnjIQB
	GYbZPrM2CpKEdvpnw3srzfrCcgXE/t1QUK/8bBK0xwyzLhf1bUCZ0nPSmtreastj
	UqYDdoH5S+Yxzk9S5LjghYQgVXgfUcEUSaEnOYRyijr075sztodnrweqVRGydv60
	0oOj482nREbvbG/JmwZLFvZGVvouUwX3FG/0J7SmjPQdiLtWHaYYgwwrrtsB3tUP
	Cp5cl7ZrW4/OmoVc+HDATQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4OJwnJ8xUZcPvmSzmtoRPsqsXEn1o3UKjXfEJK/PCLVhVwKYnsJ0N9LsV+c0UDoBOZdjbFoJjRN0uBIe6gdbq1fBy+K7IhuZ4fVxgxkONQmBUoq5Em5K/ifrsBw/8bxnYRz3NPQp6o8AAiOqM2iGXJyUfpPymDNiIANTumGyeFoy03oqhq4o5rkqpza3CJcKxm2PgPUpDVjHX3qg2w0Vmo82ZbXga/q3Em4ToNv9t4xzKu7J0myp8wJzORMhyG82dHak3JJ4/FTy1J9/87zYSK+OFlwreOSeoVxPaviaqeYsTsfkXD9GLMGRA3qmmP/PjrjGf7VNocVN74ABvCpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=;
 b=f2Xck9TugU+q9U1/HL+H/eDg4QeMx4fm5bKEroYmB8YmfAB8Ia6vVVwW+CdUjCWjOFx8CC7dl358g+GcuLrtI5UJTzTQS6K/I44SysohoqG1xksPnzx7n8jyGlyI1nsAhdXPQi+ujgdvkkHHxiHDfCc69IvkWEOP/YXknR2eYLqOA1IB0T7YiReVmxcqILwr2ZJV+kGgELq3FZzeXH43kJrhU2Q5jpFlyNAlTY3vSCLbuVbsUQJ4MIWRC1ugjd93PQ35V/1P34Ehn6DjD81b40Bcm6CKLAcCdHbtFSny14dlj5ss/YOM4KYiln+ZanUowbqd2gqhRFhUZAgGkjID+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:09 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:09 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 13/16] lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
Date: Wed, 26 Aug 2026 14:45:45 -0700
Message-ID: <20260826214548.3002838-14-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 3349b3aa-6696-40c2-c7cd-08df03bb707d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3d2ZLQr5TqOpd5EB9N5X5cA+dsXKa7jw6snuFVv9n5UFdVsb9jUi5fAlgFdN4dfm0rtbqn9PEV2iRi4A62+m/zB0fmG7C1fY65Z01cWLISeWU5AQJmCpixdeHqxvb/AoC6qYJf6tshN5485LvLEJCX+4DTUabvMCSCC1dZ1MIdwI5day6EEUBnv4jZq0XbhbPASs80HyAYwszobXmWPr6Sa0SsMrhgRSt52qv4a6KhbWKpzDdpEsXi10O0mz++NhLtTrROItt7Gp2FROWK7GXX61sW1UVHl2y+QZiQdIz4pisvqi1hHHkPTU3KB9buR3oykdjVzAII9BrjtDGrrdBH60ZMGtFfFCWTt5COvbcDbUyQbEbKcu2VokSG+K2pyPJgQ/0yFKyrwklWUxByfeH1lQp2rI7C/bovGxsR16llJ3DaADoNNm5VL5DDMtdFWn7pDvmDpprIvudTDCvkLUuTRVKDzy6YWUWylFZj+OOaUjnPyaCx8RpAXXgVl208c8FvoQeolP+dG1F6NXHbqF94ygRaatC94yYGqU7suwfZwzlinhyVYekJRrMeKXIuENvrcxznINmY/3n5baL2per1STr5IGLZyNOXsXltM2ryh8kz+Pb6ZdXdCaan5wfsflvBH+a3ANUyHlVbagiP1qIoNpIsxp0N6WdJM/DnQVdveayNDtzWX2+czOrHkQP8z8jZ80rMbjoLet2Wh57y7V/WX8aEAz+/Y8MnIf2ER0nv4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PzkT/kKT34zkVoC9wne8B/iytyFPREiYvaFi8ASkc8geSbjgGXtD+hM69F/t?=
 =?us-ascii?Q?3AjeTbbVzfXiXjAkN+U79zeUsQCEBWIUFouvNtqI86A/VQgmuC59KpY8Gnpp?=
 =?us-ascii?Q?yhHlMKEd6Pdt80TO7GVVlKctrPCQg+gm6bFxCBdsDye8PEpJEcTWsQG9vMBZ?=
 =?us-ascii?Q?9YMCg2bk9r8WREnRlhSG4SLQr9ZJiiQL6FrJ3tSohu5/aNJEfo6sA+ew+y5b?=
 =?us-ascii?Q?HF4kjVIPbUPFwgMVFoF+pJYNmjctAqpRcDpkgkqZhq4fqU7US295uzJ51WiC?=
 =?us-ascii?Q?lmKcS0U9HHniSMVY0t9S2Voj2JGfJzD5r2d9UtyUdR+ek6jGmjWXCAlWGlbR?=
 =?us-ascii?Q?nwtK9Vb2HiQ1jTYvxsM4hk1nIEJQQvalfA/bqS2qmkO2UY35v3KuGMxndH+J?=
 =?us-ascii?Q?DLx6jiTZcREH3h9nSej4608T3aqbMkQGzWOS1ZXCh5S3eiihrpCOr3r/G60S?=
 =?us-ascii?Q?d294Hz6XYhdpmGnmT2wEOaQH+isUrwooHSG3lW6xzN2TeppFF+NXM3TVQr21?=
 =?us-ascii?Q?rrkKFVVHp52eeRx63eeYSM94VhmDzROmfbggjoeA79UpzNso0TGBxIlWosH2?=
 =?us-ascii?Q?PK8Wg0WpizKL6eGMTnqm8HH3tK36qt+Z9p6+xwXHfG8Fl/rTIAm/eoasTXbd?=
 =?us-ascii?Q?X3BxFj82VfOERJK4q3liPRFGOCaN0Msv8EOtBewgY8l6gjHVn4Yu+pxptCVj?=
 =?us-ascii?Q?I7YDOYMUl3QWQxfJvfWwzIIZOxLVzCImwCqx16Y+G18nWHNCschylmBMcXOo?=
 =?us-ascii?Q?8W9dntVHnxzuu6BsR7V/+xxmbeYuB7aq93JgAnV6Y77yhYcZ4H4JVOsRUdlF?=
 =?us-ascii?Q?t/grEQUBenWB6pBeQ/owX6X5VO00UaPY/5lnA+1znoK9Qe0HHVYcN5KI/RzG?=
 =?us-ascii?Q?3LcCVkX06GaCJZRKQzkWdMj8LcqhkoiE8qAD1CODceqqoYg0Q05cLnE3gctu?=
 =?us-ascii?Q?68j/9lM72qwGw9EPxBMiwFczN3ps4fiSow7f5b47zz4LF/eql4iVaOzfdBhk?=
 =?us-ascii?Q?mxcYd2OGk49Rd2MHNtfmXAsPlESMNyAvv8NsYyo7rugZsvioz9I54XIIL5l4?=
 =?us-ascii?Q?xsKo2XCvRl35tEXThf2UWWLdagv+2kLf/IyrpkMU5K1VbvLW/ka7+k16c+6t?=
 =?us-ascii?Q?3txAeAlaKPu43uHuCdi4g54+wIzgz7FQY3uJnIXOG5/YsLHFsySPxDsmocz8?=
 =?us-ascii?Q?PHSd7huslS2ZegCb7UkAKecnZnIe+tLY3QOn/e4gfbzs8iWqjSIKknMvxNV8?=
 =?us-ascii?Q?sr+KXRbBXWyXMxEjXhMpYebkJ2zSQzOwTcPbdFdzHpRG3jTsrn7bHwOJj0Rz?=
 =?us-ascii?Q?FiYM6WNCDr5bPVqpqJdvTSimToJeyRQSIf8K8uZkDg+gvsvVcSV0hqUui3rU?=
 =?us-ascii?Q?isS2Oj8ezbPeiI/Yn1FUx9FlVcJBKdlAc5Bo4x9cm4FEC0bpp1DuchDyMaZ/?=
 =?us-ascii?Q?TqRaxnlYo7by+X5mlRVvlQl9fRmqjQP0J/My1Wds8LHbLfq+gXfZdvPLOEKd?=
 =?us-ascii?Q?A7YJTxFPqa/2qqXszpX2Rra1/ZN/P1hOLnH3hyqjkzVFtC2jYmZhff2QprdO?=
 =?us-ascii?Q?cs1rrXKcNIVjX6xbCmFBONdORbMHcL0dnXOcRx0kipN2pL1SUjq7bMikDepA?=
 =?us-ascii?Q?Tvy64//j0KOyxjUxLlnZwc9dhOx095i/BNtpuayHkNsLQLAfQ4KxsnzhHH4g?=
 =?us-ascii?Q?unmkwJgkfhxuUG3Xc0jBVlIKCofOVMX4C3bKCdmADAEfYmCbZBdFRKfYAGE6?=
 =?us-ascii?Q?Sm9+Hi/hoU53Hlk5TW+2Asa+iH2jVLg=3D?=
X-Exchange-RoutingPolicyChecked: 
	vxtLE29gmBgU44GvDC1/xeGsKJqFhWm4jyN8CfV6P6v80syQtU15Yik6Lrn2gXikPjcQQ+bpDXz5n8s9C/edcRFX8B5VuuXms8wsIykzV/I4vDXqyHB+4DwWNsdOWZrjLAxhMg6ySqxMsiyKsFpWX02pNwp3nWzlZo9LPUyRewDTI9sVuzC96guYtS4KBxFeIlLMhQJjCtnTJxdG3G1SCHON0X903vbkjb3I6LwHO2cWS4nfQjXxo3jc3qdeHpV9Khsczzz6JgyjW8L4/WhRfmO11X3+P7d+661gBV/dDy14A+b5BaljORf4a/hPRAifbI+9KXiLl7GgVf6WQ2iFLg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3349b3aa-6696-40c2-c7cd-08df03bb707d
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:09.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ona+VPsTZppTrSa/HH07QSMpW/MRn8NqelvYy5JejH8+HVUo8nJi8DaOCr/gYA6u3wH8Zwj0d21MRWzbIcn844ol22g010UZAhTTFk9sfq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea4 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=p0aGjYm6jqd3QCOFG8EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JlnYkP6ZHqM3duccjbsc6hCZcGEv1LKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX0ArhMOpyvs2P
 nsclC0bhXyR4EyC9LuC+aEqV0+Vs2gP6Kw7YRc6x06MoPjahSE3MeVd4a7UwUorc9fQgc4UjExW
 tOoXZor5Ghak+uH1naxu8o4lFiV6wL1YH3HaPiuJ8t5EhRWekp2Swr57BL9Zq83XnQS5Xb91MZr
 soNpmwPzNQY6SsRv0DYSCTfqE9qXRbuOKTGcZaZd/KCoBKhUVpfiH3+2y7U2NHlssKZ89ZCWyZF
 sPZ0wJ/UANe7QoQ7AIRddY0mS8RJlFrawT5J8cB5VGA3g6iQptkV4a6zYsrcLVYMSIIZ4XPXVyG
 cLxPtlQbAvr9Wxe/Zj0/ymjz6ptd1C+fAnDOFd7JeAjkymQ6+0NEz2XyGRsdfVG7HxiSnt2R5ia
 qRzCUnPuENjNoqj3fU5+maD8C+jyxkFD9Jin+U5jMoYlzYbcI8sRn5ofRysgFMDiK+I6TqxolVT
 ElclVmAubUflUVaff8Q==
X-Proofpoint-GUID: aT4MbpEHC6Xrl_GeRgKgPPBU3UuXN9Q4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfXys0BKCDXRLnM
 yNUQPKXqjzKseujPL2BOM8uG64JtVkwmgokw5NN+pHTKbhccS02i3e1Id9nyF88zVHh+Tsb7AZu
 UoYr137Y+4WoW7BGB9M8yoL08gHVYfGrsFfn0dozEpkf8J/O8oAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244430

With rpm 6's internal dependency generator now active in OE builds,
pkgconfigdeps.sh --requires always emits "Requires: /usr/bin/pkg-config"
for any package that ships .pc files.  This line is emitted before
pkg-config is even called, so packages built during the early rpm 6
migration (before the PKG_CONFIG_SYSROOT_DIR fix) carry this requirement
even though they have no pkgconfig() Provides.

DNF only reads primary.xml by default, which holds explicit Provides
declarations.  pkgconf now has RPROVIDES += "/usr/bin/pkg-config", but
pkgconf packages fetched from the hash-equivalence sstate server were
built before that change and have no explicit Provides in primary.xml.

createrepo_c already generates filelists.xml by default.  Enabling
optional_metadata_types=filelists tells DNF to also load it, so DNF
can match "Requires: /usr/bin/pkg-config" against pkgconf's actual
installed file list regardless of when pkgconf was built.  This covers
the sstate transition period without requiring a full rebuild of
pkgconf.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 1d831745ff..cd6efe3d3b 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -318,7 +318,8 @@ class RpmPM(PackageManager):
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--installroot=%s" % (self.target_rootfs),
-                             "--setopt=logdir=%s" % (self.d.getVar('T'))
+                             "--setopt=logdir=%s" % (self.d.getVar('T')),
+                             "--setopt=optional_metadata_types=filelists",
                             ]
         if hasattr(self, "rpm_repo_dir"):
             standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))

