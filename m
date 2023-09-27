Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B6E810C2
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:47:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14569.1695811659878663280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gGDS/t3j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7634b29f18=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R9uMSI016551
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=xYXBIY6c1FSR+nvp/p
	b1Jhg2hfFSi3XMfLoW3w89stg=; b=gGDS/t3jz7YzXQMe7vWCcgQf8dIehIyKF/
	BmI7+ezRVFb+V1W2claqw4hn+n9YfYstrWj9FiDbRYaecmPJ5nxWdQZLoEZQEtuE
	VyOgxcC/eoe/wLzYjMQhUZ62raz/9hAr8clPbq0bXfdRXTdkHljFg/ilbOh3xGx1
	uE1+lz6dq22vgWMA4suqqy6nU5IGpocDFW/tXceTmfEweIoVB1b23pYgeXXT8PR7
	vswAzmwbSWXLQnNkX4iYAIdz37ff0zCTKqezG124C9UmsLNcsJqxjL2OPLtOoSPY
	Qlnv9WUfvRfyleIp4TiELgoLP0WbxQiyT/OdebBeujg7EVPP/Quw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x3u2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:47:39 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38RAlceb008960
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:47:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x3u2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 10:47:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OK6xXdrTmDmdHR+EzcvKI+1iAzdwmBKr2JxVyhtdXg0W8y6RQEUeQMZlyqJfRnV0Wa7GrKyMuOutkq37PtQkGQC+e34a9VxNyji7+KF50Q8cs9DJEFotvbt40UlnZwMt81uHX9QR4+MlQTuPM0/yHR69fCOKm4reJRBnRRUDriDw3V9Kq2zGrQyHBNKF4Sunbv3yiJZ8BfrGu1c+/GvsgEJATInMcNdbVQGZHi6hjYl9qNcqoXfNGX5jJu+VQvi6Lku6QkaxhX+P0gtwrCHV3Bk/fWqHxVvFHGMy/rWoMonagKrFDN7VY/6pNtbVweu9uypk8mR9o1qEjZ1jGnIs+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYXBIY6c1FSR+nvp/pb1Jhg2hfFSi3XMfLoW3w89stg=;
 b=MBh+GNILFzgt0TMppDWrRTtQIpbyQ43vRSNDmIktI4BcG1Y8YjlucXM/VQDK2RpDO3n4s/JzxD2cMt9mYwvhNEhvL3+YA6oYqpR6h4VkuuAq6l2QeOVt9LNjVOzMwqcjEDnDsalUw0uNqXVGu3fgwHvmPWNkhER//dTWT5hihlpZ1QbAACkYxTFycfJsNztbjVHv4VUHsGKcpATe5ImQhzRN9mWzIDPeMLsNR9HQ4Aow3hhxk5dKu5wPIKNjX0chT6CSEYPA34pP7vW/jNn6IhYnRSK4tOXKqLf+BWi7Exd9seqMPYUCRHNQW0kO3yUNh8GZcC7dkSCTBFWIKAMjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:47:35 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 10:47:35 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [PATCH V2] glibc: stable 2.38 branch updates.
Date: Wed, 27 Sep 2023 03:46:59 -0700
Message-Id: <20230927104659.2900531-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CY8PR11MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 212a7a73-95de-4e0d-3d4e-08dbbf4728a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wE6lPC/dSImBDh8CkMncu4H4v72M3YQhgZumu+dGuc3BI1PVhare7yfnV5shyZciXDTOuNT9SJ5ia+VL1JGk0+P0MVkKwAJtUs1uGlocmhC0azxcf+gXiswIOY9rv2rObSFcwLj5V4/qzpH7FDLy1L3D7fWAqfhyBH5fvL4RsSai1ORQbIiYE42rkSnYJoNkkpZ9W5QZcco6uRYQN+D9sszpewxgGD9VURBhxDcRZF+cyC3lDKP0sF4Fu/hV3004ANQlU75W/kaXE41NvhrxRkcxJzxzJcMMCybds/rgu1HSUJHPN/X7XGBoheN5XHAKBcs/Qbk/UrwoBDy7raHRuMp35DaMvzeJD2E/ko4qGE7BaRgfx9OuKuJmpFAKEPB0ELJcDIZ/ZnZdnMGlpg4E16bwNtpsL0l7HrD+BsixgsEYX1lck0tuzhpyIN9MemT64qP/PrYqbqwZ2LphRHTkuxib5Ve9mbjRiVqeaXIGfZrZtE1m7XcyBrw6k9ry+ZA+XP4mfuWkqtKl/p3FrdSGAvAzJhFSqHH6P4S45OeP60izcqsGe8GVNBtOQzV5+yfd3betmEHNJFpG5Par7isekT1dK7Rj0olhiSZv9BAseEQYoLPdFbArzN3dN42z+08w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(136003)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(478600001)(6506007)(52116002)(6486002)(6666004)(15650500001)(6512007)(83380400001)(1076003)(26005)(2616005)(41300700001)(66946007)(316002)(66556008)(8936002)(4326008)(8676002)(6916009)(5660300002)(66476007)(36756003)(86362001)(38100700002)(2906002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gv3LpzSuFpfAbjwyXLosOkdawR4h4iDJrVr6RS9kP42JWjBdHtnJY/I5aBna?=
 =?us-ascii?Q?8igIIPQ63pDnYERGBXq6sxMcFiEdsn3HDq8klshyAyAaRUfD713XmX9uNHQi?=
 =?us-ascii?Q?isEyLqFyuSc2SgayGPvGqaCjR5bnvKZLdZVuF9fb3kXFat8RULN5bHGotFyg?=
 =?us-ascii?Q?wXiozL+nJbIbJ6Zqqq9/nyzE7yEYk+SYcy6kTtmrBOdKr+hmLeJu29GqsUFz?=
 =?us-ascii?Q?CqLme5bkZUv7B/AHOFMzmWF1JgK0uRmFTLDk8Zr6U3ue6qml2R46uwL+xYf0?=
 =?us-ascii?Q?DiNVufwH26s4SVM0ZeetmEeMxEcb0iCAB38l+8a7Tc4OrpNbd+ERr1MtcLgq?=
 =?us-ascii?Q?mrBxmqBIa1VUTOzdt1NhbuxdhDeo9d7yPJlIsIKH4JMJQn0cYWrNePWlXYg6?=
 =?us-ascii?Q?zzp+vimKRwHVxfqZj8SPVaxhyk0g78YJa8F/fEzPJOc7UhvJdzXC836/dqzh?=
 =?us-ascii?Q?Akgb6rksh2p79pYisv7W3BWiIHyCo9WAQmzZHHJLofoQ/dbmgVLlSjfsCdnd?=
 =?us-ascii?Q?CHt8mVgWraIV6dfWe2NYV/PZ7OHICy/Lr4/G8sQenLOp4j4gLugouGG99gG8?=
 =?us-ascii?Q?A7b1YCJi6Lm2BmAalWSXfUgveVIYplqvilfF44RCv/Ga2Boh2Rn//omdeFR3?=
 =?us-ascii?Q?GwyPM0ih3SHRzpIZwIis90qZ6QNpCxV9DVMIa8ktVS4IksOuaKxnYfmgIwyJ?=
 =?us-ascii?Q?Qw7orAVFwCwAggGDJPcqhTOfdIc6u3BXWf8JZsfxXnXKDAHxSoMS+5VWjYeX?=
 =?us-ascii?Q?kGv2M1WNHZifGkVNjUGPbIJvZi43cFdM9aJWVJ2EUCSE/3T50NkJij7RHxuy?=
 =?us-ascii?Q?/yCeD0GvF84g2ReBnMrs27P3WrzxIziKZE7DiqEMhFmGx4udaqakEN+xYl/W?=
 =?us-ascii?Q?+5qxb84rXG1P78CLq+u4X8kYroA08fk/8PUItIfelebIa4Tk0K0pDhhR/6hy?=
 =?us-ascii?Q?8eFguvArRcTsfFwqC2lCvdXJu68acAxqJBbt5OkkjKEOfm5pvormtKheqZ9Z?=
 =?us-ascii?Q?lQC+BQJnOulbSJN2WEqvsQv2UaqqeUeqkt8+5QgFmNHLuan2geE31ZrJuO0J?=
 =?us-ascii?Q?mgiPmTQrY677W/9aiyJuckKAUwtryHJTqRL03tLcJzjWGUSAZ2lqwmBCvwam?=
 =?us-ascii?Q?C9T08DN9xegjo5ZsSSVpyOhQZjWnAmU3dWbemHdmD+gLt8UEgtOv+YIOQk7/?=
 =?us-ascii?Q?InUv4cpt2Xv0KoVDWkntreD//IdCP4+0T0ZNcOro0YgtwVf89xzRploLKsx9?=
 =?us-ascii?Q?FCXykQqLjW4pp+iq7RkLr4aA+HYggEzJT73qpnLaHZzPRY+1ocKZDl2dGIwE?=
 =?us-ascii?Q?iPVQyzBJ89kCBJLJOGoQPMEIQIiiqS2UJHfzk22JYRA0WxkxjrdNPOSV9znb?=
 =?us-ascii?Q?rev+KknbvEljrJJXStF2rokwTTiwpotjr5uJARNuyzTb8vNuemcJ0yczhk9r?=
 =?us-ascii?Q?3f3y1VoA4CHFiiGeW21OMIuEUBYxY6Wf5fGdA6AlczyczQi1xuNb4AQ3KSxr?=
 =?us-ascii?Q?fNp9bOf1LgbFgAjwqEVRfw0mKJ2AGz0FUye5VVHKC6ICor4hMr/3aaCV8fjv?=
 =?us-ascii?Q?Kb1w3AqQyvN9tcvdeuPPd1E/prEnotMeAb0QZc50MHHuRjpvaFH1cecDOGLH?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212a7a73-95de-4e0d-3d4e-08dbbf4728a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:47:34.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/Sl01p0dFW72sXG3LjCy+2kbDO8kox8yBJwT5BcldgpNl23CPtHtNG9fsVYM5U4V5Fbjt9VMVKOPFR9Y2xoUhelqz0ZoFX1u5awQ0RLHn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-Proofpoint-ORIG-GUID: lZLenBfXrBohBWb8VUqtKogF8668I401
X-Proofpoint-GUID: CBX0N2fdLNutdWTth5Am25iHvqP-zujn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_05,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=727 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188300

Below commits on glibc-2.38 stable branch are updated.
0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manual/jobs.texi: Add missing @item EPERM for getpgid
d94461bb86 string: Fix tester build with fortify enable with gcc < 12
63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug 30694)
00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
89da8bc588 NEWS: Add the 2.38.1 bug list
d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in link map
750f19526a elf: Remove unused l_text_end field from struct link_map
a3189f66a5 elf: Always call destructors in reverse constructor order (bug 30785)
7ae211a01b elf: Do not run constructors for proxy objects
92201f16cb libio: Fix oversized __io_vtables
5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a907444f50..f5ebbb2ee6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
+SRCREV_glibc ?= "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.39.0


