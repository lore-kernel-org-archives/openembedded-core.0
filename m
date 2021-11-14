Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F8C433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 05:16:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6062.1636866970314581320
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JLtEdNO9;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695237d4c2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AE5GAhE000686
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=l3NzvqgHItuywZhOP/F5uNE+/lwsJ03qXJ8b5tC9SRg=;
 b=JLtEdNO95xRY7DvMCSOam87SpXjNrK2fLLH554a/P91hqK4q/lT0suzHClcXUaZn2TXA
 AeGUWkSbSXzYiRROIOO51baxSEYBcoe6Wx5EOhbDNiCjhWitZIn564LQP9LhlCSPWzVr
 5qQFGngIe+Y0Is9maCfRJizIjKYyq3znK9Oy4YCOd3gBXk+irt5oVNoygtAGZmivw9TE
 +BrRxAj9RzN5rcAN3pbsR6bhyhx9LJj3u2/2OX7RiOSbwnIrHUV1qi+xM/2CGntPc+/i
 bJZrcgxhX2S0Rd5CQW0+YdNvW7jdxzkUQKDrACFOuAeY7Rn1ZghToUzNKc6z/q7z8pqv vw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca9h80kew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:09 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AE5G9Nd000665
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:09 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca9h80ket-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Nov 2021 21:16:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9WYEz6lg9uCCCQEr9XzbhVuckImrceUjTEhrUk5MBBD8q4Gz0SQ6L1PhDxHxaK+/jc3Nm1rpIixD/SkFxA2AZBZldAGFmphu5Ee7dmCGedNmCP7So01b8HiyjAfIeIKsSTfD5u+C5bIftn0X2GbMePIdILU6VMdytsWBoVi2oenziqnJtFDOIGQEAHQMcYBaLcYPpFZf7gGwaz2jQg5eYGlw+Qk2e9OK2agAy4NDf/93iq1/nSKneJ2U0AfpkKNRMQrQo/bktNGDRkpfJGy4uxDxwj94HoKgNsUbfSnumIv9IHcxy5QlvFAfDO8EU9LfnPbVwIC9aI2fgylQwKMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3NzvqgHItuywZhOP/F5uNE+/lwsJ03qXJ8b5tC9SRg=;
 b=M8VE0ANn3mlyItvSxeUMy7Uf0/wWvjqf2XpA8FwLIgaWHEOeY+dNKzwKrJ6RSg3mG/NnuGXeq6gIR1cgUixYdwSh9KlFcYVUOZ0tLMrNZGO8fB678sqyC2Z00ZjtkbirU+tDivpLv9MlKRI5U2a0xvljkfPPaDUrG+seJedJdceaxoWbb58aMJtsRAqVMzewLqMyfWX2NQylEVpNrHvORIKz6G6AYH8YY9wHodknbutCQ3uTSt+2S5kSB7BTxv+yL/cyUBEpZP4bIYuGjfbckTb4zWF+ZqQWA6m6C0o0G1+5fG0vYOCuABdPiC3giauSX/ZM1uOWvTlEyAVhTpT3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Sun, 14 Nov
 2021 05:16:07 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Sun, 14 Nov 2021
 05:16:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH 1/2 V3] python3-numpy: move recipe to python directory
Date: Sun, 14 Nov 2021 13:15:55 +0800
Message-Id: <20211114051556.421031-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0167.apcprd02.prod.outlook.com
 (2603:1096:201:1f::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0167.apcprd02.prod.outlook.com (2603:1096:201:1f::27) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Sun, 14 Nov 2021 05:16:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f56ea579-dbc2-4639-e700-08d9a72ddd00
X-MS-TrafficTypeDiagnostic: CO1PR11MB4945:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB49458102D8F40BA56DA018CDF9979@CO1PR11MB4945.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gY1KUkNMEWKoaVKbrbu3qxwhvoVAzfDT61tGY0Ey5oVDZhyxmPhyEyphAqQWRbVcv4O2547WMJqUU1BYBlRi54KgihdnK7rQIjK1I+DTF91sK72IIwovarnRmv6Jq8s6cx6RWsWBe4fhHjRUZLAyfHCWxqtfRZGLOc5kYyJDAfPvMT1XB5NuGQuCxwQgjjUf8JTm59XAMZQJJ7wz5UETzuqXNhPbX4l40Ds4BOaE6QNIFM4QGNkE2gEt+pi1agZEVwA/0sSQ1UfbIXp2vgJfvDfrGa8byy/9+eNXmMWzi6VCteY/MoezaEcjkXqwB0vDJ0b4Rp1RNjBVadyH74616/zR+uuraJSwF8XlYZve+7mB/OvO3MDbO/HHRT4OpGS6lHNWVqUYJk/F/+/5Wq3Hs0nsTm/M8kH/Gjms6ZLs5Y3AOXnU0MrtOz38uDpjzgRiyCpfNHA2thofFKA8kVzIO+Zx+FBifVMZt4/O3SIZDPhRFJ9tzqpqQTlFU8GMtw9v2dU5i4RaQnE9cwtb2Y+bGPXoMVZLTnztC+wyy2GxbZPkiT7HkdNyjO5VagcQnRFJA8pXimHgfMGydrM67euB80VSkUShJMjNMRkKkDFuC6oZW9eC1tI6JSGkeoQBsAkD78V43Kzn2efZOUdC8S+Fo6TujFy4rRhUuvgjM7+pR7AEXj8qd7zKBQQIH2Le/DowIJOlHw3+w6rGUwPIEt52I4bwChjqkEy6ZI+BmTQinyuhO59/utdZLSOf8P7w84zhA/73W0MCTSpljprdGo8djtWLqsPPqAktcDqVIQeHIE4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6512007)(186003)(66946007)(36756003)(52116002)(1076003)(86362001)(38100700002)(8936002)(83380400001)(38350700002)(316002)(6666004)(8676002)(66476007)(2906002)(6506007)(4326008)(6486002)(6916009)(2616005)(5660300002)(66556008)(44832011)(508600001)(956004)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lLTqnJ1HrtNhAztrrrtBIkiOnExeIkPUZD1CWu1Q8Z6N3FpdQsXY2yQE8R9F?=
 =?us-ascii?Q?Aku6zvjORMYT633clMrp4zTS1lYaUolaRuq4xSefO/rSRwJQtuFWgByYHbeT?=
 =?us-ascii?Q?b/gDU/UyLKQ68Hn2gWrg5m/oGfBNE0XxEW0v4+zbenMfkFl3BND4v9yk3B6B?=
 =?us-ascii?Q?Qm5tlHs4+CBRGAMhnjYnDTQTiy38fi8q84xGbhyPede7azZfVZuawuGSAjMD?=
 =?us-ascii?Q?5GPHuBSDiqSgXC3XFOS6hSURnF7skH8GS/3xx7WZT8x2aj21VC5J7GxK1raM?=
 =?us-ascii?Q?bNxu+tPLS2UprPm6HI+DZktR+c2GtsbYULqPzU6KCPwW/qehW+EH6Dspb0/8?=
 =?us-ascii?Q?BlivsUWKANRHMlck3N7tID1Blc/XWYxw3Z4j7VGBhpDaDtCnN5ekVQfuV5Wb?=
 =?us-ascii?Q?ng/+tQE1xi/qYDRDaoGoRnH1TMdL9sceK51ONVaiI1i4DsJkWSDGMIjmj6vM?=
 =?us-ascii?Q?TPP4wcyk4BjQdxv2bKpJ6lGdVD4M68/T0ZhKh95NP6A0RpuerSspxFLqpj6I?=
 =?us-ascii?Q?R6WaFwL6Xq5ekWmA8z6UsBQPKcCmD34v4zaHT0qeirpElfZq7Bommkuohm/R?=
 =?us-ascii?Q?8QtptwrjU80DHj18OxrKEmIvWIck2yqSOqPHqYFDJKAqXsC8iViI4KdiPD3V?=
 =?us-ascii?Q?Z8zmN09y6d7Xa7YhTpBgTfwzv8a2oTBiiFfQe8iIPVs0wCosz9l9qP3HSBD8?=
 =?us-ascii?Q?qdAJykiZweuuX85GNc08IETDSKOHAmu1vPsRvf9NbA1q/wgIRbu4mLcMNaQ2?=
 =?us-ascii?Q?XroUDF1LP+kyG8AIOnvLRh87mXC8lnCzHXU8XqsFenjVb8xyKLPW70HqR9jp?=
 =?us-ascii?Q?ASQ2+3BLAFkAiWQwWyHNz9R5nvKZ1LZZVEPJBMa6Cb00MXv77jahAl8DNmuI?=
 =?us-ascii?Q?EIV7vhJavZplugHMw4mc72VMRWxGZEA+3xt5z+FTfSkkdGBxAJoKRMp8YBMy?=
 =?us-ascii?Q?9ofq0Mwh5Fvq0b19ToUAwVTne2+RMGBGQ9F+cGGLo7OGthDhkBZI9BFV0AHy?=
 =?us-ascii?Q?POcAzF5IKf1N11vp+WbKIyuWTV0Oi7gp/TeY2+jhVU1WUOWcGCnJAlhQLJZH?=
 =?us-ascii?Q?LqQ2w1FnaEEsMr0zAYWJYd52CcaS/RF2dyPx92GzHkZaxQtmh7A5kAso9nLN?=
 =?us-ascii?Q?dXWULNFwSFzntGdnP3wmwNs9ZFRULeU3OYyWYMFabCN+d5uSYbfqr9X5DLz2?=
 =?us-ascii?Q?0Ky7L8x+9SaAD8u2gyeOROEvnaVmFO8IvwJExW5UG8mBjES07arT1FbEtqDX?=
 =?us-ascii?Q?zOhPaDsYwafCfsJEkefeNUukJpUcf1qlSBqtMtMksBKF0nz4XjT11zLQoGQE?=
 =?us-ascii?Q?oLy812zAhC0OJBhOga8166/33ZfOkL75+zddco6hnPdI5ZwdHYomiNZ2yZHP?=
 =?us-ascii?Q?PoqKV1ZNtamXjb7fHE6+VxQO507otMcaYd2uZEl8q0o86wxbIvtaCbVb1Tip?=
 =?us-ascii?Q?eMFPplrj/q494hSNA2914DTaLjD6gpJ+UMhTBDZY1hoMpGmG/NnfokW0o9YG?=
 =?us-ascii?Q?o4yYBgSdeJfxY6gPDjcLKlnu8zVjMmQjV+zkegEejOWl3yryxIeXDpMbl1Wc?=
 =?us-ascii?Q?q16qeP29KwtK35Fqa8josV5kWF81iMqyOacHuENMRiRXhcIeCAfRtV/x56/N?=
 =?us-ascii?Q?DUyzMCEnsvFuG0PY7tav0RI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f56ea579-dbc2-4639-e700-08d9a72ddd00
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2021 05:16:07.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RA14vWuQX6TGqNZ8+X3MEksRWuEBhi/e+WxvQU7nwjx24EUMcYmCPHWHcM5LcMGzau2g+fSrjVq3T6G9ojhj5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-GUID: y4U2qnP12Bl0XVfg3_OsvdD_0ptDyYxQ
X-Proofpoint-ORIG-GUID: 24a7tDnEdPckKOeMhrN8loT_tzUxYfaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-14_01,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111140029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 05:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158253

This recipe had been moved out from python directory since 2016[1] in
order to share patches between python2 and python3. But now there is no
reason to keep it in its own directory as we only keep python3-nump.
Move it back to python directory.

[1] https://git.openembedded.org/openembedded-core/commit/?id=9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0
 .../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch  | 0
 .../{python-numpy/files => python/python3-numpy}/run-ptest        | 0
 .../{python-numpy => python}/python3-numpy_1.21.4.bb              | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/run-ptest (100%)
 rename meta/recipes-devtools/{python-numpy => python}/python3-numpy_1.21.4.bb (100%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
rename to meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
rename to meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/run-ptest
rename to meta/recipes-devtools/python/python3-numpy/run-ptest
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
rename to meta/recipes-devtools/python/python3-numpy_1.21.4.bb
-- 
2.25.1


