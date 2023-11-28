Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCDC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:54:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28705.1701161651093793741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AO9lBw5h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9696896673=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS5ujl0024661
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 08:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=EshW0nX9lZb7Ypr+4O
	Sf7TxdV8w3yrHgZpoljVrj75o=; b=AO9lBw5hpdK/Dr8ao/J8jDByG/4uYzyQTe
	ZIjQjFxteynecCZdSp+bbFf/rEELWyUagMiOCmVEn6o5wfj4pamsdrW0c3/h6FEl
	pcgZIsimEtRRRhXVOu7px9sjwzu+PBSP/yqIkTb99srq8cdozbqiLIvrXVvCQO54
	TxEcL5S1xHEo1JLElmQi0YNJT18jp9hhHThsbGh+5F2hSekQDVhO3WlTPQTgDuXR
	/lsD+acI/Nx/yCpeBi/P1E/kJ73pFOtPN+2UyfBHwayqR65Uuphd5B525MYjeSxi
	AelXxf98cEdpL/XmcYXJRSyRZhOR+sF6JJMMz0thFQGm1m6f7o5g==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6jf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 08:54:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPp8AOtv7/b0iG97dPfJlwhgsWVS6jlta7kd6p0/81pJKbKyss2o+Z58wcdpYooG62HijD1JN7s7CSLfUWENPUezeBEMwKCo8v3swsvuvmXWuOaxKf1VCb4QJLzl5nfmmU5cYOCwTsx8Gd3hkooKISS7Vo8y1vd/7HsE6UtmZQMe/0KWVnNzUb11hRVO9UqhQb6We3Fs4BsyhlicWmxI03EZqHFezsOP5E4R4saH9SovAPE69Hv64d9OHEtAIdNW8O4efaJFgbme/uwsijXTxwtxTuXyf2BBVXrPA2qvVSoEXOuXU6JQuC7dnw7vP20XqALGYmGVgepnqM4K2oYdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EshW0nX9lZb7Ypr+4OSf7TxdV8w3yrHgZpoljVrj75o=;
 b=WHX8ZRizLpybNbyzt6l6Wt2A+M6iil3zJix/PXQizfFBtrGdTiHHXmbeOiFKe8gE2Wp8JcCOVmeHiXV4Cq6bciCU8BoEGC9XSe+lROqEZSK9tKVdvu0gSESroETiwO5bVzGMZSqiVA/PY7jaKXWVtGBjrFGbCu9E5TnO6qKl4gWfOGQT3wVWtEix0E1BTinYjvkC5izAkcZBEa+4nYlvEzt2bAzug/Qbutw9NZGt1vhleinfAz2oPZglOO1MfEXUAWd+evHyo3LAE4FUeVxNLJl/+jNqfjMylNlxjZO7as96/ObAKOgeViC468uhbdp9yiOOcuYJfjX6eVmBb1+8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 08:54:05 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 08:53:58 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Subject: [PATCH V2] glibc: stable 2.38 branch updates
Date: Tue, 28 Nov 2023 00:53:39 -0800
Message-ID: <20231128085339.3837196-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 50debb83-a1f9-4010-4e0c-08dbefef8ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VYHpuAiB16//PR5Uek8hryw5LTYHw34r4L5yxxxFTwC1bggrNdUMRMoK9kJGXJngfWURYfBw4M3v3Zt2T6rL+GnHunFXW3F1D4UoRYYNDSRtr0zjJeMLsSQhhmDx74MMeRIStFkwye16Ra7BewxLrntYLONEoUK6nLeRipngYxIQLqLqKL7xsmsi797oSfDNoXU17VKj8Nv1ulbpA9dOrN/yvVORVaDpqCk2yHdNiNwK+MbkHcEkRbpxrWvQ9BBOHdPKgx8QZ1wPcnh/FwfBenUtn+hy7iSsqKAOglXGxKfTBh+4/lTy1hNRVCfmUUjGH9PGtQJt1O8avf9QIOTxiynlHHhiHcK6jyUsGCTVZjvQA6WjnO5R2DGXZYECiUcSd4NDKYhHKspHSA9xHBNcjubFZNv5acTgSD1Ujc7wa0S2UTPALh6P+T7eXxPVUFGmi25AWMOrcE03oeOe92SsHfuD6lR1D7LO0oVapiRXGtUKyhBswzd1Mz06/Xku7eYHIXBjMIRmryr1si4rXiZLzZzXKOHGO9aYAHqGOYyALko+fcgBaB8FzWTN3WQ0QlpSz5ufOO54Jzgq82QIbiqoBf8OGgfCygEyY4cJh079+jmgdTpKMXkjwP4bz2DFy9ey
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(41300700001)(36756003)(38350700005)(1076003)(15650500001)(83380400001)(5660300002)(26005)(86362001)(107886003)(2616005)(2906002)(66476007)(9686003)(6512007)(52116002)(6506007)(8936002)(6666004)(8676002)(4326008)(6486002)(478600001)(66556008)(6916009)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QEyPBVKp3dCDCEt3qyCOMPF7eT+sS0q0fOwOSSmod2MC6dgG9o+oMW0SGBkl?=
 =?us-ascii?Q?lYILVLYT6lTHZNJKYZ4DcEJily8Xs6tKT78eU9GqhivVhrFQ5AsTmZAoZksK?=
 =?us-ascii?Q?BFHxBEE+BcggULAE4m+blcVdipftf9q1uzP353Sz2GORfN37wvZvc1jovP76?=
 =?us-ascii?Q?4bofSdbzJbboV4bn0oQGYb7KFUKaSucCMMPpepcnflwuO2m/YAOIxVevygFX?=
 =?us-ascii?Q?hIKLnFTU1NdhsvgGCzr+MGTMYj8TlRG3X4iuL31rNFXoa6dFOyHU2mp3t+/q?=
 =?us-ascii?Q?jE48cg/+I5c4NBo52cZvYhkTcSXnLZaJtD7oe9Ad93eUAw5zf2bnggp8W1xl?=
 =?us-ascii?Q?2o20kZ0pUYn42E8px5Aej+0g/iQ2dUx6M5+PFGGcvtowRuz2mH86CEQEbeQA?=
 =?us-ascii?Q?jq1Xp1xZWgbu5t6SAjg7+LunK8gI5eP4r9dn8LLop3B9mUhSznP3Bsjs+zOz?=
 =?us-ascii?Q?t1oleej6Ydetxtvys8DVocK4F49BPaUbszLm7da9tWQh4OPuP1xpVeALBcYv?=
 =?us-ascii?Q?z2/4WxFbZk973ucGayz3Lzzoa9BIRHcCgWTXycpF9Tre7IFwNpOr0+Mm/n/D?=
 =?us-ascii?Q?NFnnQe0ZpjNMr7It3Zx3IRinhs7iZ99bqMoCE3CxAILekjT2cHiynukhtVn8?=
 =?us-ascii?Q?LfZTlqNT7+ECALvO9IjPgXUlZ5Mmvloh8FdjAEkkPVaV0IBW+vNSa/ummw+r?=
 =?us-ascii?Q?ryNO5u8Z3TM7KGmAEV6sCJll2UEPtCfvClsHCuuegV9Wv2dBrf+53EdLjwF5?=
 =?us-ascii?Q?tOnCOdC4kO2TLA4bM1padvqVKSxxsczoq13kEZqDBT8HwMcnYfquoWSoWWun?=
 =?us-ascii?Q?ouhWmPlNxc8j6hlkL3zyKGMrfuVDBETjei0i+WgYdtdw0ERakZ+T7KpZ+XAh?=
 =?us-ascii?Q?INntrEa/jCiIkXUlP/VezU8pm7u8crc8wATVRq2mnw+7Hid1vdJTzbHKokEN?=
 =?us-ascii?Q?h5cZu9YY9V2lcNO+0c6t9Gwm6lvzNRV9TnayHklprl/cF/MWQgeFw3v6oqZq?=
 =?us-ascii?Q?Q7phFQ7J72Z3vKn7jXfCz7FvGRqRQfehyyjiKDnSte8F4R2c1ZYVZHNHRJdJ?=
 =?us-ascii?Q?d2P7uVHIny6SHIJS+m1G4qZLunn+r5eNJIIS9pJBOYU9pFdotxa+EUGU+p+d?=
 =?us-ascii?Q?VIl2Wl1ov/TN0QOJs4/tx6+E7lAVXjpBoSqHLpq6PWiwPK767o/5qtMOGdoZ?=
 =?us-ascii?Q?2kMQsuDBU80SVA6GCR91G4L1yftI2+MOuAJ8n3xAqVwUoHVFX7CCuACl67PA?=
 =?us-ascii?Q?pZKdZTsG3oWLlW14K2mnIAZRZ6lDRBFhw3MSLf0wP/dPWpTdj7+r4h9sIcdY?=
 =?us-ascii?Q?5EhDhItMDSXMlWuB0X8EIx2AjWaWdIvR6e+fUKsXxO5NrjcSwrNaJwGSSr7W?=
 =?us-ascii?Q?R+xdxUhnNxUZb510YllO/ILxIIavZxfSdqSVs5/OzPivj1kM2JVPE/EiYSc/?=
 =?us-ascii?Q?f30sRdJDipNUJGV8SNrvL+H3WS1gHc14WjAxRXa+GZOTU7Ogdi/vzNrT5mxb?=
 =?us-ascii?Q?N5b3NNFHrGCqsiX+g50oMyqqy3T0JoT6igWXmNj7FqWC7A/gXZkC7eq1Z+on?=
 =?us-ascii?Q?qllle5w4mo63vu5Lnr4R6hydvjn90ng1uWVGEfA18DsjJKxdWQ911oSvbJ9y?=
 =?us-ascii?Q?VY1ss8KIDquopN632mJ+a/A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50debb83-a1f9-4010-4e0c-08dbefef8ed1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:53:57.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEhV+fWXyYktyDu5swDVLwCxRW8UK4lyAiU4vzE2Fcfy9HCv2P+7+C8JDegdWSAfOIgxigFgGGYxC6hrz3ejAxTEHWYdGvnHtBqcEKVktPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
X-Proofpoint-GUID: QXl0iuzqFFJdQYJpEt1NNHuPa7A_G2DB
X-Proofpoint-ORIG-GUID: QXl0iuzqFFJdQYJpEt1NNHuPa7A_G2DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=779
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 08:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191347

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on glibc-2.38 stable branch are updated.
1e04dcec49 Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
719866ab2f Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
e0b6c9706c Revert "elf: Remove unused l_text_end field from struct link_map"

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 19b98bc11a..ccf9d505c5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "750a45a783906a19591fb8ff6b7841470f1f5701"
+SRCREV_glibc ?= "1e04dcec491bd8f48b5b74ce3e8414132578a645"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.42.0


