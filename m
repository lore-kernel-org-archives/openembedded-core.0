Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48657CF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 04:47:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8054.1727498838428475758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 21:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9001a1a943=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S4j2wL016200
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 04:47:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x710g5ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 04:47:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6XHf99ys7UebSEGeXjZ8/ftJwu9Us5/QuvqKrF3KSNVZTPq+Pq11PF6d5XcvofrldIe6aN/uCKalQAsrSm4qxnL14s7XNb9xsbGM0gKrmnyP4q3wOMm2yqfh8tkxgbKoaS3IqfxCl8X6DPfjJUY9rTUPfuP80kMvRhC6qQRX8WIltCJ3VNBze6WfNVtQZOdg62ODyEeEPPt2zFWt7f/sBMP7nRhEB3SAwIZ9P2rFN9kc9n9rgBYYPDOmAdz/Axx/vgRothROyIk7+QBRkUOyW1CqvolArxqxq30W1zPTgZH3m0jhXWjIH/TGJaCP0n7aLNKrpCcAvaxoX9cN8EazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNbz13bJEfDWmQUZuLabvhgPR4RzVy7NDb83W672w5E=;
 b=tN0Phpfu3MFGWxbDVmq5V0la2o5n4NIeORvO/7fZp1A0CfaG/M6HIp8TFw7k5wWCy3lJotKzXxMsjjeUWAHG7tke0icgMn/9UQyVV2StEaDr881B3PctGEVWOC92KrKBjAp7/nYCta2N+RRiV9rQ2k+GFk+YwhUh+etJpWx5l3J4kWp6hnCLtddv6aW0Um0YiKcDalUvtuQdxL2t3iXPfFsnm5nRYMNixnLlTuFfjWhYKwItUkp1jG8qwanBJpxJcbUopjLAAqI6h6Ir3b1JuvSGG3UC6EdK/DUxJtQl9cYhXmZ5T6en8MOGy1tdr4wZ28p7c9ZzRDkBtCM3zTWF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Sat, 28 Sep
 2024 04:47:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8005.024; Sat, 28 Sep 2024
 04:46:59 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] oeqa/selftest/gcc: Fix kex exchange identification error
Date: Fri, 27 Sep 2024 21:46:38 -0700
Message-ID: <20240928044638.2513628-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcdd3ed-7ee2-40ae-5114-08dcdf789649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7GipD9B1441LkdfGyta8qKhAGRVPTyy6KKH0QmuzvsDq0bFlzyJeHNoC0OyW?=
 =?us-ascii?Q?l9aZxT5pCE7ha0hM5TeLdJ/iEyN18VHWx51e8zgsi+nf3RNc5NmzooY+SoSr?=
 =?us-ascii?Q?VJOqwyZF1+0JlDDEQsBoW0i3yZebHmmDEYerGzRE3Et5C3HhH0FhVPNciuUn?=
 =?us-ascii?Q?1R07MOGB2awD3eU24Baxlk/suGwZ02dfGhkoJ5xPJ15EQXNA7IgAGgic8TmN?=
 =?us-ascii?Q?8f3bZffj50l/sT/HNp8uDrOail4EMAzvLCTmIDxibiP8TLl/i/6NrsO/gPDK?=
 =?us-ascii?Q?ueWLTfRfTnLPvdEun7u7r4faSLFxm2PLfKSLf9kK96dP1SVXmM9P/w+XVokj?=
 =?us-ascii?Q?siyGzjNutbNrus2jBcyNa1gH8Xbu2IKI+yb6MGpAwOdianpIHSTdbKw9tYfa?=
 =?us-ascii?Q?q4aufIp3/olznFH+jJhj1AeA748hGcmqOzzb1RWGmvCezANDVFwuy/iXLg1M?=
 =?us-ascii?Q?7cnYubq9Q7N161eq2EVGeiS2nU2cQMWvG7cD+jOfS1BNT1dWKc2Y9CmRPG6/?=
 =?us-ascii?Q?ZzC3GToR4N/UUBYA1E2J7jMBO+n/kiAwxe5M8EGZnAZVcrsi0FsorFSFP3OE?=
 =?us-ascii?Q?vJ6b/nUjPs0UbA8PSfz9Nsx+iPOA2A3HePoZ0hHE0sCHsxIWd/3EgYyuklBK?=
 =?us-ascii?Q?GZTSkykSpN8zd75Era+DHMh6E5AlWilxNtoG++YArEkjOnfExtG6TWi0xoFf?=
 =?us-ascii?Q?h4FNJ2SMy79mKoSJUHPstDyu310IXEZx+uVQwtvj/+h5ADFs9QvJ1GBGwpBE?=
 =?us-ascii?Q?D0VgPMZ18e5RewIXlZ16fkuQmifN87xDFUaR+LcCoHc4mUR931opbzUqysbD?=
 =?us-ascii?Q?UnZ3xrivGYtSKUys5AdBM9WmDo4tjWQGUvfW4mSt3/rs2CWhufqpC7AzpwWp?=
 =?us-ascii?Q?uZV1Pko+EzAeMSzSoha1I5/rvjT09XfzIUkMdOJCpSnBIYAmA+klCWTRYHmK?=
 =?us-ascii?Q?pqFjPRkwMlbiY+LYMP0Vnxgq7xOELy9K5ZdId0oQhC+NsMSZdCJtVRhfh9Dp?=
 =?us-ascii?Q?PhFPdfuSBso7AV9zfqeZr9KIpkj6kDyq7fk9z0sjOIywPvvl++Ek8zCIVyyg?=
 =?us-ascii?Q?2WtZ1romd4dL/GNerUhBt7LXGuefN3yDd5JOd5DIpWlM2EjyqDytFgzFKtGP?=
 =?us-ascii?Q?rN9VbjVycCFhDbH6XqpDtcBiMYUPHaq4UBFECE4Wnf9XraG+09aK6StklJ1c?=
 =?us-ascii?Q?5MAsX4bH1bQpi2ZNGMV5u4yOjkrsxEH3Q2XNpRnKfT1z3xetgLDNQTTUO2s7?=
 =?us-ascii?Q?SqlmxD7szrGiiWuyEHHPsQNdrT1KbBWfne4IQW4NHFogWfge3AsrDloPAl1z?=
 =?us-ascii?Q?ZbV8DmShFO0LfRzj618b/d5iP9GS1mOSu3VXzZcvvCMPQQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p5AVCudwZDAlRuIZHe9KAYh+7S8SgkbhtTn/mHPESgNu+d7Rm6m3FBxfTc4x?=
 =?us-ascii?Q?SkrWm+Sya9gfT+EzacaEt1skiT+dhNtMI+t3/nDfrpGM922rpfHNLkEtrZIc?=
 =?us-ascii?Q?RMs8W3p/Pbba8nT920r1Y7HXFGHqW3N39/HgVltGoekFMqV520ZwKLybdcIt?=
 =?us-ascii?Q?Sz4w3hBYAcs+zaPLfFq6Aq2VhCOQ1LHrN4/VTTK1yViaftg+ENuDrlfmb+dG?=
 =?us-ascii?Q?LmrTuDNty/OTo+rSN1qUuY5+HemBz4yMAFr8D47jkuOxrDWYYlE/YKvHTQj6?=
 =?us-ascii?Q?zqwuieiJXxqb97d6H8SAw9m0jHYkurUbosNxynivESDm8t7doawYR+I0AuXw?=
 =?us-ascii?Q?CuBrmVBYxac6UR09fwzL0wbEtMCGthNFecC88JnQAQ/VJB1qJaHa4OWtlfFA?=
 =?us-ascii?Q?3SDvN5ZqJjYmBtWKGhNdG7N5teS9LKrwn2dtpI/AIEUdsIuLdGq6V7y+zxx5?=
 =?us-ascii?Q?CRRYh1pbMNvKqVBb4rtO1vtnmRc/4yJ8DPiofO9PKtCdmWiwquDpKgUC0ZjD?=
 =?us-ascii?Q?g9jXR8byVIqTbKGkFkiEBTzKYG/2QBSQ0+ZGxhxJwVQfGWzX9JHYzpypEuhK?=
 =?us-ascii?Q?xHw0pU6eKdeAcs2F2/EOfTtKEzvEaxKuDFWGpQQxD15mHUCc9BmE8UHhkHVW?=
 =?us-ascii?Q?8xO6ebTWek1p3LmtKyRezj6bSX58y4gT4h/CztMLse8rA2sn4zUB7M7V238J?=
 =?us-ascii?Q?gZc9vzm2qkqvxxZbh+wtGZLduaLhbkCC63p+WYPy6ULGoRa7QhqnN2rcp6ud?=
 =?us-ascii?Q?yIvjPjcJfsF5hNvsY4aP5dZGcBGYu+AzXKoVXNd/u+INcmtK9ju2bCCgKV2/?=
 =?us-ascii?Q?sMGMAADfH5l8PyNs/Ffp9pkw31fMRKGgbic8UoP0macwibJzIQj2evBkzSY8?=
 =?us-ascii?Q?cMDH3UV6h8QSzliaHOXo1E3E712tZ6UGfzLBCtx3gEizLSShbi1Qt+s7g0Dl?=
 =?us-ascii?Q?9dus3EvJz7E/bTGm9tN+Vij5Q648hfNR/kNjHqiKfst8k15E5RXD5Nv1D3F6?=
 =?us-ascii?Q?KR09/WmhEmjsNOmUOvA2PAkDyEitQaZJXiLf/4fCTJAE2E7cN2kO+XsMjQVS?=
 =?us-ascii?Q?CtAQMId4lHSmk1DedwRBJzeoN65dbV4yXpd3B8dpnc3TjyYAnLbhXXmEyCr7?=
 =?us-ascii?Q?HHz0AijMokijUaE19z4AVH7udLe5qDJzDbd4VLIWTuNXns0srnZfrzM//H/3?=
 =?us-ascii?Q?YsY4Izjwp+dov1ZeYttCpVHI+10qDO+EACd0OzYdVJTlvSLAQL0mR5tq3NiH?=
 =?us-ascii?Q?pB4GrCGEvtqcl+36NfxHzfV7r9bvxptGl9IcfVuH30FTNOV4qgXFh6GxkjHQ?=
 =?us-ascii?Q?4dW+3I+/Su2tR3aSIOG099u34LDvTNHQhfQX1mgpuNmvzSbDr6FN5MQsRY4I?=
 =?us-ascii?Q?jWWyUyeCfA7oQz6QGTRKVfGl1hZWLxxEtlO2qubuA8gk0E1hBFoCa5Bkt9PP?=
 =?us-ascii?Q?QUskixq4eouCcWtobtfA75VQzf7fp6p44tO8M17XnGxwzTHefau4DIAg7TVb?=
 =?us-ascii?Q?h+KMFkW3Fxj03SzqYvh4tIT0STGDjdDYyHF+zsofDRUA+u+veburfhr5WQZv?=
 =?us-ascii?Q?A8sKq2iSYCDcLqhYuPh48GWJIKo2jgt25V1ezxIaHiFy45FLftei/w4e0hc5?=
 =?us-ascii?Q?aA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcdd3ed-7ee2-40ae-5114-08dcdf789649
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 04:46:59.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtwK9r5QUqtkDXvXCaPxO1mK2NrSjGb8X/jriVcPTyLwzAgLjAQDFc1dgJeL9GkGzyK+to1b1oWB2ZmU4+O3tmW4WRKC5Sh9gMcloBWoccI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
X-Proofpoint-GUID: mUW8qRUwBYkN3c5OsHgcuvzMRGouYQBF
X-Proofpoint-ORIG-GUID: mUW8qRUwBYkN3c5OsHgcuvzMRGouYQBF
X-Authority-Analysis: v=2.4 cv=efNvfKEH c=1 sm=1 tr=0 ts=66f78a55 cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=a7vr31CzYvJzpkUOuFcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_01,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=883 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409280032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 04:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205043

From: Harish Sadineni <Harish.Sadineni@windriver.com>

while runnig oe-selftest for gcc, some of the testcases that need to be run on qemu
are not running due to below failures:
- kex_exchange_identification: read: Connection reset by peer^M
   Connection reset by 192.168.7.2 port 22^M
   ERROR: Couldn't create remote directory /tmp/runtest.3549814 on ssh

To resolve kex exchange identification error increased the MaxStartups.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 4cc0894d42..1bda29a72b 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -83,6 +83,8 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
+            qemu.run('echo "MaxStartups 75:30:100" >> /etc/ssh/sshd_config')
+            qemu.run('service sshd restart')
 
             return self.run_check(*args, ssh=qemu.ip, **kwargs)
 
-- 
2.43.0


