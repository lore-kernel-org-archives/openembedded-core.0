Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7572BC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:42:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6043.1676497367754623190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R/hnBC6/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141000e515=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FLSeL1030867
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:42:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=RyKa0/ZbyvxaAl+3pQTQmcGRh5qk82mLz9WePpyiNnQ=;
 b=R/hnBC6/zO1uwtuLpcCLbD1SdKqSDIsJrXo34XAvV7BF/MJ2cXGfodXJyqPB6vu4dL+r
 +IO4ciPWYTNo3IVbwLTxx0WkZQrGACZfgPXrNThQsJo0HCsz8PX3EFeJuAG7l2MWNuJA
 8CnYOYEZR9Pi9UUTluDy0v0dvvO4xCurWr3ygS6m3hAKAXP9JAzGAmDt3+2g/MgY1v95
 Aun2soyV+E8ZO5pj8Q0a+RLrM4LvMwHGdZ4BgHozMBA+qceG6RigXCrLffFw7m3PVge9
 RvJfwGuOpa/R/StRkIYvS7kofqiLWUAWsjvUUaW2Vms3bsZrtA1zJSSOOgwYlptahEmy 3Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdruvjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:42:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq80MI84eJfq4bJNo3PafCxR2iBrchoC7GBxwyhzeTOy+lK2OPIx3K1omz5FJn0qq9Ayx4PmJdy/MFOJ3NPB/OBlt+umYQ0YUgCdpZWFrSaNczeq/vN/pyJPEUL+Rxxgafk3CsadCeSoRxxSWG/BByk07+9IvuknojRR/6UdYoGi5Q4VLqV/0tGJQGjAjv+gRjj/N62q9rI/ezrIIrCzkQssoeEinxd5tXc5DVY9dAKp0kJykYCVskC8ULrGDyhfn9eKlL1ARt4wnL9Mwyywma/VHI/Q7zsWJbrngmhvV0hTnIKEFJx5oeb2EEdx3ZnM8V1G/7TsVViqanN8MSoS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyKa0/ZbyvxaAl+3pQTQmcGRh5qk82mLz9WePpyiNnQ=;
 b=oHAGrrhc2TPb26WtFkE6WxJTu9YBcN5f2RAnMdzr00YHbVRGdz8keTkY+Yp85Rw9SMqvP8NRkYBjIEdzu112Tlzvg7Vs2ceRZoXlfLgOw/uYYPCPJXZK9saDZpFluQtekPL6aL63gXtoRnQ5evEDYLHzgJ9QFVXyVPjfDXj/TSatlr5dTKeoQkUu6hV07kEKVNYgAcfkhsV/4wTwzFbxFX+oIIx3mlO+nBlk/f1ki8asqVDsfOz3t+AVGbHIOvJj05EFXx2fE0OEMfWW/QsX4TAGbFwyvYniB7R7K+2c+0JuPwwP6Kjcpak68FlE9mHKnnHLf5RnbNyo80Q2Yc3vuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 21:42:45 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a16e:168b:5b9f:3548]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a16e:168b:5b9f:3548%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 21:42:45 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] git: upgrade 2.35.5 -> 2.35.7
Date: Wed, 15 Feb 2023 16:42:31 -0500
Message-Id: <20230215214231.3566494-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0313.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::26) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c298261-013d-4d6e-6662-08db0f9d92ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PEjjBs+YHa2X5HRMC1IJCYVfPQ9eZ3/lB/MWd1eNc1IRWn057vC0HhNPTQoOW6BHYrVJJguTBV8ltBTaYgxsK9JBFDcIBfTzth5K7olTgxqrRb68uRCvDRdclAR8ZL89+X438ixHHP72ZBiQgih55NsTEK/8EvyWYl/hARSOrtQfUGsvq1A18hd1KaCLfAWLTDgELqX2Hw6Ba/qvMZxvy8r4le4VEpUhrEVHTeBrslQrzSuv+KpMaMO0ed38OQO9Vyjlg51T9tbnTnmfCv+wvQTcpexNO5dSGtUXcyYxOTooUwCKQ7SH86Cjqz1XlPRgrVYk9tl+LzInQ6pAhYroqulpnGoAtcx2lbXHVdtDLgPB7Ot3J5TWbETqadmzb/lGOZ7/SlvSGerRK9FzvZUiYeIk3xd6ZhQ82afZ0trg3svtAjiCo+J60Hum91uB8NxPA0hj0mvbjezTGX4FVwXDyVto7rnXUInQ6FUaHvEfsNrKp3mkHYwtBapX6jluNXj6Mzx8k0gngwvL5vlDWCMt5hxFhZ3CwbtsZuEhC8mMBc92J+u1TgGgk5cBquQaFh/DajSIEpgz48hqYsRbVU/GxRGRjk8e/2neT95yKHcIxo+1W7IDwIcS0p5tdUVaqmZFcPmVEd8zv4uhuKRaPlG/S5+QXLGrmP3e3RE4Y70D7V7iLU//Q6mTDf9RLtwUwKlQ/PCxuPL/P1PB4s5HWU0G5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(451199018)(2906002)(4744005)(86362001)(44832011)(38350700002)(38100700002)(52116002)(6486002)(186003)(26005)(6512007)(6506007)(36756003)(83380400001)(66946007)(316002)(6666004)(1076003)(2616005)(41300700001)(8676002)(8936002)(5660300002)(478600001)(6916009)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lSeBwJXw+LIbQayuqkb06XXymN6jhiKDB4BvEJcwylYRQvf6N+gvTiZbIaFa?=
 =?us-ascii?Q?xs8M2pp6+NBiqy3HSHx7Dk8zfR3cDUPY9te/1T6TjUN7ZCj0gVxJQkmma/Uv?=
 =?us-ascii?Q?N11BRqqF7O9Ihnq0JEOsf6CgUU1W/gMx5e7tq79SGVfjtQTuzs4Rha0sL6Kp?=
 =?us-ascii?Q?tPJIiNoI3ednBSYa8N1aZeqz//av/6LSgxgHYGAHpkiCKnpVHFhD99iu0HwT?=
 =?us-ascii?Q?bARxPlMyKkgVW94B9FLHua/mJafHCJiehfE3gWXn2m7CrdaGD8V2/alznEvT?=
 =?us-ascii?Q?aj3Kr+S4vdez10XKw6/UYItACPGqGHhf/uHOLf1CUdAtaeROxy+Ti4MArWEl?=
 =?us-ascii?Q?0ickmcWg426WmGTakTWFItW+Nb1w+n3eg71e/EFVuFYMz50CDr5hIwq/dBUO?=
 =?us-ascii?Q?In6rmzXX1oQzEGzG4yNm2r4Ri4awkXARfmDIBg4UqUyg3G3YUKQsT1fzyaiv?=
 =?us-ascii?Q?VrGu8geIhjvCGzJrf6ED1yaNHIHvkokw1vtm7kDKr8FHunAIOIx2WzC1/XQp?=
 =?us-ascii?Q?J8AlLc5kyLLxD4rVOfKewIRfdc/lNM6fWlixTqlqYaDmaVuDfG27PZ45wFER?=
 =?us-ascii?Q?O2qhS6O3sg3Nd0kMO3x1knAJENJDjtkhvhYpfsAeo+4dWh+ikMsxfHJ9fDSk?=
 =?us-ascii?Q?p4lzIH2+qRy0I5XZzFGKJlD5mkJsbHhDru7E1n/GfM1OZnGsbMrZKe4v3jdI?=
 =?us-ascii?Q?S7cvN3SHlJXOYoMDaIzZb3AoDsHf5zmm/S9XrZn2iTq+kjLRmxS9Z30LzCwr?=
 =?us-ascii?Q?d0vrLQf5U/aX1QMhvysb865cBH0wdr+69Qmf148+Jv//sSQ/YRyyzc+1FYGl?=
 =?us-ascii?Q?SulHDdXvQtdg6WdNbGRRp/4Wz7yMWcqq1fMQu+XIwKF+pFYi8aIYA/ocfs9b?=
 =?us-ascii?Q?KWxOx0t/ebqDXxkUW76ntQ4O4KypkPtn3AGk5espLpViXfzTMyG80HU5GtOD?=
 =?us-ascii?Q?YbeNNaxrCn3BftpyhIUkUuccNi6yUd4Va9ucubn12qEzFv+tnGNu9lqx0s2J?=
 =?us-ascii?Q?1e+x1MFLZt49ctFWQgKVmc8PeoJdKF+vSVGiORDP6BqNXY9En44GoE+EWOwM?=
 =?us-ascii?Q?I5JezPC1C3P3AhNnl1CKiLO9V8MCRKv9UllLQe/bUxCxfKlq0AoAhLL6FQxJ?=
 =?us-ascii?Q?RW78VaN6AaZ4rz7ztFIEBzTkhqlm610WLLov1SoYyVMVjEUr+OygBGEw50zv?=
 =?us-ascii?Q?SoeY30TeqG5ddSXkHCmAdJPYjLRPrsFoXkvWFzefcU0ITq84el4Gn6XBr6EL?=
 =?us-ascii?Q?sc/xE+/P6EE4/JXDw6YbguVaNjmlIAyorJ+MMJO6xg5GRepVoAmGctRhSG90?=
 =?us-ascii?Q?rzyO8VFjY4OlwBrLjtSKXW31fxDWAXrc+7hwPDTtdu4ZSJ32dm+SN04M7Fii?=
 =?us-ascii?Q?10UcURA6HTF/yj4ipJBUO2E25Q35cQ02UqIT9PxS851DX5DC3wQPH8ujf8ky?=
 =?us-ascii?Q?K8dgU+7Nl+C9u6aqwsWzgMbJvBzM1q5HG+FBiTl8xi2DMTur1wxOE6+y1ZWM?=
 =?us-ascii?Q?/oiyCXstlchG7igfGidxCgBRusk9x+Syp9JY9M0esh+AEzJyWL/px5QKXjy6?=
 =?us-ascii?Q?64fqjui6t0oWqAfnqzmk/iu8r9GLK1mQIWxbzlKpQ0bshzqQWQNUWV8Uvfs1?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c298261-013d-4d6e-6662-08db0f9d92ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 21:42:45.4180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crCXO8rfhm7uCUP7LhpAkfgl9lFHpPMfok0sHFRnDUoqrky53rGYLkxvE9s0/WwKCtEOXVaC+ReYCWmkEL7LN//BSbn7YmSS1rPGmN2Yu8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
X-Proofpoint-ORIG-GUID: kyMf8znft9vi9jNiJJGjnaqxkBs9YusR
X-Proofpoint-GUID: kyMf8znft9vi9jNiJJGjnaqxkBs9YusR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_13,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=561
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 21:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177218

Upgrade git to latest 2.37.x release to address
security issues CVE-2022-23521 and CVE-2022-41903.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.7.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.5.bb b/meta/recipes-devtools/git/git_2.35.7.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.5.bb
rename to meta/recipes-devtools/git/git_2.35.7.bb
index be4e3ca1d3..1dd5915703 100644
--- a/meta/recipes-devtools/git/git_2.35.5.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "2cca63fe7bebb5b4bf8efea7b46b12bb89c16ff9711b6b6d845928501d00d0a3"
+SRC_URI[tarball.sha256sum] = "fc849272a95cc7457091221a645fcd753b3b1984767ee3323fb6a0aa944bbcb4"
-- 
2.33.0


