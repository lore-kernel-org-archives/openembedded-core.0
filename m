Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF381C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 05:24:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38795.1674105883760814114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 21:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03835df60b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J5KM7I003629
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 21:24:43 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqcfm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 21:24:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4vr6XoDTG2bqkPcSQN9p0dE5cTEc9WEFy63Fq9b+SbYOZqQi9VQaHB7X6/Ah+vdXqfv1mOZhljcmh1psZ+Ne5dYNERjXxgUvRRqqyVn6kLfQctmVbVDrmptqwEwlPWvr5754VCrEZJSJCdQ3M0D7B9S1bWrBgWcJ2dDaFZXo76XVvyBk+j0s34E1K9/VdJz5zrAIdbZDt04tydBbi9vheQqOzLYk74U+cYOhNkbDS7xSPw7Iet6G4woLREMhzWh1HWJ6aQ19/2zHuSnds8U6Vcgc1WSe8lnNo7ZNY/+lUZkeyOAKXdYdo2yK3kMAD4J8J4mxlFxGTdekZWG4VhgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97W9Cbll9skCvnB0MSSWV6o+Xyp54SgYjX1rwMEV5Dw=;
 b=P4CiO7xqVzmS9DX54YjMMA1sMvMHcFSF0gjd136jVZb1UiAByMwG2RFGK3Zkr/Bnqh4pifmJ4dLqklS4IubDuZeEXoKBUjEd8CBTn1NGgK+f1FdHi5t3GrBoxkMkMHsqm3W4Hwjve7xN9N5eMJsArVYNbbXKRa3QTX1nC3OSoduDQxWHaN99Y6Ng2ZxfcOtIfiZCajf5J9L5pEYcwUIyF5qCypFwazH3J8ZQcYTrO41IqictKabB9QQApd9bet5lihjZLxfrS+cS/IKx0h0rxtXJ4HURF4Ahz5SN3PtXovgg16UDtEf479u7wrJcNrcQW3ifBCU92DXeLJVNDF6npQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN0PR11MB5710.namprd11.prod.outlook.com (2603:10b6:408:14a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 05:24:41 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 05:24:41 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][kirkstone][PATCH] numactl: skip test case when target platform doesn't have 2 CPU node
Date: Thu, 19 Jan 2023 13:24:26 +0800
Message-Id: <20230119052426.378833-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN0PR11MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ff678c-be8d-467f-c7a7-08daf9dd7724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sLlGfSotv5ZH2nefy81lBTTULMparOQVwP+ZwQM489OfFsn5rdNCrnOzp3vYD30REEOEMduTSuYOHWxl2ICSba2xrxyWqC15wzmxKjMX7puPP/QPOhhBABeklg9p/mN/0DNLRp+AV3/Xlhs8DwAoFUv2vZT8xWDba3BS3Fb21DAOv6UQV3VV1r8+z+Jj2KEnAI2/m0vi2dUJ1BofIH0HRKn/u8UqTP0AmqylGHqIFdZqhJv3iIuBLEflwHzvE2RiuENLCepoekUSCAYRzZJlUoY5rgjYpBX10ubT8SsqrIRytEpu0j9V+2ycXYgMCuaA87nzdINa+8heNmMMlxdfKSf7NPZX6OXZcJlYS/0at7vPpBKW9DT2e/3DXZSDGqQENb+W7RgrFVThVbvtKAtViI2uG9owbhueIHkaqe18ajSJHGG0If1RHultHWO3Q+JNZxyjFeBUsJJLxFjcey/wVjvh6Xi7bHJg7ajjUohdmxbGBUxQGknwMbNAey6Ag/7eZL1HoXv1Lksw1GudT33vTuVumn8XAk2z2ZRF2dWDHlFBIMlDfydfebsH//ThRZ3ak3uphEvH9WOeg3BHvxRXlKywuxbkD9Wg7s1MABlRDNmYr/S790SrMSoCC+cC34bwr5RAFRlFf9nLFrqtHxhmeLmX7UzoutJ3/XmS70D3G15Q7sBEQFT9H21HpUXF2/FiMWOmS+5cFvobz/tvaaQC3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199015)(2616005)(66946007)(66476007)(186003)(26005)(8676002)(6916009)(6512007)(66556008)(41300700001)(1076003)(38350700002)(5660300002)(83380400001)(8936002)(38100700002)(478600001)(52116002)(2906002)(6506007)(6666004)(316002)(6486002)(83170400001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0IuoGcbOZgJuUdWu3h7XOdaObXRf8ub9BbBfFqd1LZNI6vCHzugvO9nEjmpn?=
 =?us-ascii?Q?lcIWxY8KqJUS48I2uw/azsON9f6FAdWi13DT8lAovFsGxtDYQ04bvvqzVTEf?=
 =?us-ascii?Q?6pgVgquZReDPIELcwIqqhFLB2Vq/6Tf3sK798wprw3MrQgRdiLbHh/ONih0H?=
 =?us-ascii?Q?c6oFGrczozW7Sp9jbqRbub8hiuxIHOVyqiYx7n33zE9QjMJ4KA+Y9dhhfBct?=
 =?us-ascii?Q?wn8esQEvZbhQA4E9WMDcUFl1x/suXDgNY2Qwdn1Lw2TjmnKie7QlVLJsBxZu?=
 =?us-ascii?Q?dz+E5oogkP65OK0p4Hiyo6w1I7ChWkGpOZct2JMArGoWsDTSAccp+mRWRP27?=
 =?us-ascii?Q?3VAqeyZqUoY3aEzAMslOEBwvP5mdkLaMkbAXYEAtIF7GFfJuJ/48H5f9vFiV?=
 =?us-ascii?Q?YaTRDfPxbi2cRybWjeBTuuSUWAV+8TWgG/3h2XuusgC4mGGmHvYN8tXUPv5Z?=
 =?us-ascii?Q?JWoyP3VUV22yQjVkJDiNGGtU1S/5FUFHOX3LUtJxYzjKWRhBfakjzx3r5RK3?=
 =?us-ascii?Q?SjaRLzpaIdFdKcQ3UZMxdTcr/ImoL425kmqyNfjdJcyM0WJ7xM3uvwfl8Jeh?=
 =?us-ascii?Q?p9rsj/tGSAMeB5Qmhqu4WuOmLOFDsaGlh6gmXpxMKRekpQoFtoDccgIGLZ/p?=
 =?us-ascii?Q?KSGOJDQoIbfC0R/QZRZ05AJcyH6nEDGOUTtW6btYee1SxzALcyAfeB43Q/Qa?=
 =?us-ascii?Q?u+1/ZyHnuI41I8cA5iWfxT+xy6CagjL6kyaLOPsdmi+0Ort6T6IxyBPtuqDO?=
 =?us-ascii?Q?0EPRtXCrI+GQ4t7dukKA9ckV3YopfZ7AXC5sM/GhznGmdxzT2hvOZ+qb0mBB?=
 =?us-ascii?Q?8V9zJ+qabbkqc7m7bYtF9XjlZ1FnPdMGVXqDDS0MWMp5++HL4NAag/ZB3TRz?=
 =?us-ascii?Q?Tzci/h9xN32iKLoL4FT6UFBVPRyLo2cZHlXdQ9RfhLRZw0XwBHuh5TmY+9HI?=
 =?us-ascii?Q?S7//bSFd1p34JfeyQV1ZyykeTa7FLM6ml2sPxE+Gg5lhBn2hlkv6FRQw2adN?=
 =?us-ascii?Q?G/AfhUMSBKuhMFNgXOU/dgPIuY6xz26u3PC5m3CTeb6Gdz2ZjyN6g+A7D7e3?=
 =?us-ascii?Q?PqCZfXEqUWlgb2Rtr5bOQfiiiYRaKBCm8CB8jMaYR7aN/AFoTb0vxWk8HQr8?=
 =?us-ascii?Q?u5Pz1Yn4D+CzYylPvOKfnqOdcAYOiz8dZO9sgr9EejDAhOZGyDprCBt8DdLM?=
 =?us-ascii?Q?Ay5sJelcCgcUOrDSIeZfw4sU+NAzjY7VScTRXBJNOD2p5mYsWgCPZyiHZnPK?=
 =?us-ascii?Q?kyWxQ7RvqNE4mhnPghZrVTPD4PaF/bLv8KGso2njh4Gx5aUJS3pFeDlvSenJ?=
 =?us-ascii?Q?P1ovukspWVQt+Fg7xYzleBoTeJabJLSbxPfPk0NEe/YHtk8CYJeP02/1HiOp?=
 =?us-ascii?Q?ZYcgyfYKrNsrENuH8u0I1hOagl7cmW2/hLfYIuhVNOy3HawWwbb2rAgu4Eqq?=
 =?us-ascii?Q?+54DYfJ9xqVQNih/KdzrPMFUJlZOjvuLoSI4kJpZIMLlV4IA7iVeBYfjRtEa?=
 =?us-ascii?Q?KcXJNYscgRFQHi93zLeSmnjkMi6a98amjRKmI+ZtP+WTw+IaJ79PiDUUV+M3?=
 =?us-ascii?Q?qhwBinzDQfU5oQrUfyTYeKmMiBmEmdr78MfKlU4j3E4Zm+M/G6cAW0Ffe30Z?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ff678c-be8d-467f-c7a7-08daf9dd7724
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 05:24:41.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBrLAY/VKgVsC8gNGU8rBrzwXdCbgGgNUwhN/cQxVM6KmQKnWpnhg/i3P0nM/Z8c1SQ1y1KlJKi3JBcivzbZHXJ9/n5htDJiYhICZD5GMO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5710
X-Proofpoint-GUID: s-H5jjd4b0DsZCwkt_3TpCTG0MPDx8f-
X-Proofpoint-ORIG-GUID: s-H5jjd4b0DsZCwkt_3TpCTG0MPDx8f-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301190040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 05:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176122

From: Xiangyu Chen <xiangyu.chen@windriver.com>

when current test platform doesn't have 2 or more CPU node, the test
case would report FAIL, according to numa test script and numademo
code, when return code=77 should be skip test, so using SKIP instead
of FAIL in test script.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../numactl/numactl/Fix-the-test-output-format.patch        | 3 ++-
 meta/recipes-support/numactl/numactl/run-ptest              | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 9812ecc8b3..a7bc8d322e 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -7,6 +7,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
@@ -20,7 +21,7 @@ index 2ce1705..d086a47 100755
  	if [ $numnodes -lt 2 ] ; then
  	    echo "need at least two nodes with at least $NEEDPAGES each of"
  	    echo "free memory for mempolicy regression tests"
-+	    echo "FAIL: numa regress"
++	    echo "SKIP: numa regress"
 	    exit 77  # Skip test
  	fi
  }
diff --git a/meta/recipes-support/numactl/numactl/run-ptest b/meta/recipes-support/numactl/numactl/run-ptest
index bf269da755..e019b0d364 100755
--- a/meta/recipes-support/numactl/numactl/run-ptest
+++ b/meta/recipes-support/numactl/numactl/run-ptest
@@ -8,7 +8,11 @@ if ! numactl -s | grep -q "No NUMA support available on this system."; then
 	if  numademo -t -e 10M; then
 		echo "PASS: numademo"
 	else
-		echo "FAIL: numademo"
+		if [ "$?" = 77 ] ; then
+			echo "SKIP: numademo"
+		else
+			echo "FAIL: numademo"
+		fi
 	fi
 else
 	echo "SKIP: ./../test/bind_range"
-- 
2.34.1


