Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30B3C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 04:43:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15266.1703047418862035153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 20:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VbUJyIfP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07185b366a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BK4fRxw027233
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 20:43:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=b7cjcJvinziVo5EWCp
	c1k6DAdzwuf3n/FFWdR+au1/0=; b=VbUJyIfPux+6Q/F8VfKssXk18z80SopiIc
	P91zhE8uXgOh0HoyuONjtzvKNEomaqHdRF8+mfl1tgj+MddMGPJMolfR1Ptz/sBS
	fAT91/R+rcndhXm24yuJvzALQJ7k1ZZi1twmnwHI6bdMRlkZDabNVN5Nnc4RbdT+
	Fo/PsCcFYqud605mKhYJpu5JNsNuIzosZchJ+cxI4+o1G9nWQln4di3nmRsFeFZA
	/dRf29Aj7bZ+/mNt4x41JiRmwnpxui6SaMtqhapcoflaAQzs+1vlBnaP96Zr7mlv
	8RAF6h542jddzqztdjgMrOBLfeNSO0NKpjcZU7XarDuZRjR5FzwA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824ku89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 20:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCzsJdD3yjG8uanT175AjHcjPBS5kw247EbFOEKsf3BxxBJ2Ybz/pJzt5SuV1EaZZHNhdbFp5vhFYe7tej0GJiPT81D4ztbjpiUvHeez44d6CrjchTH5A5TmNJZe4rdOFCNzFeG7K2IkNa+01afVGbfw/xT3IiDgCssYXgbGFHO32XOwsIQ5aQhkTO+a3x0VzRUj5GumztqA5EGXnybneDkQ9b+VDqKRArWueybOh030WWHdRJGJa7pNrxUDx4hloUUgoHIptZ2KPiTmP2Qvq3ORrJDl6uCNsv1/XQY0cloLv3RJUHC6dn0Zqj1Iv0znXp9PfBzKjuFZabMiYP/OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7cjcJvinziVo5EWCpc1k6DAdzwuf3n/FFWdR+au1/0=;
 b=GV0lYcUg2OR3VnIjjEgWVKFfjKT6m2+ecc3fJwwELE6PbJ4Ty8beU8/LQzlpuLVxpMKwGd6znk0Kd3ADMsiKHSzDWVEOewCu91EMoivT7H1w6aGWbpeflKM7d+KdSYzN4v59Vp7RTW/wywY7GGh3wEOxD3A9sC23/W1djJ7PTwmdg6MgUt2VdJPU9cJMcMb/Ytn086+iGDTmZGx7qiPz1gsC2RXXt5yl+TaieP4upARFoxnN8ZpT4uN95TxWp9S1rKSI9+IEp4ZjtK3lL08mJmwnk9X1WZJrGwovlEXHWGhkTLXQXy0kqkbootboNA0WikM2qb9KNGpcvphiycZaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 04:43:36 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 04:43:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] debianutils: upgrade 5.14 -> 5.15
Date: Wed, 20 Dec 2023 12:43:26 +0800
Message-Id: <20231220044326.212203-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:404::18)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c262750-4dbb-4640-d2ce-08dc01163a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oFYoA5tukBfQBSvRTl6wkiYR/DJ+0VajhGEFVFn9FotteHa3KfdGYetTPCziRRZ/dFTWaBnv+ePrAHtaCmm/eYZsVsBIUFDFPgA1bG70R1W7CTtdtd/AuOb4av7qdGqnDTsITpp+Iio8besR8j5HEZThO9u2Q9tLT8hBaqoLMjAjkVEJJmvtuSlviT/NW8KrIz+UUN2TKXJ3ZiTZzGV77PIXRcoWB2pHMpX1S2MceyXo+MtgPe06VjvNzhIlfnZe2lQGJnAHLl3RPS1k1yuYwRTcYxnTL8FDR1WzO4YwQN0d82kxEu84ai1hI7ZlBtu7aE86DFjdPpYVbAlX84Fpt+JdWXyBCxEldM9Tl29GgF5Ov6mpqoJjinQvZLDChWkgihi6bFYNRNlurmoLHe3hdwyzaja6xBfTqVpw1eFEbUTbhacUj9ZTgbCrf64I//Qiiu+wmvrW0nAL6FPGymXBTDmnQeoDZ0lnC+WDNlMguHRBj0m8ceb2il0yz4m5bPAkeEEjCMTzgy36tDnwQ8UJIgy36uxzQ+p/Rd7fUOVqhzJE6Tp0U++xzWagkduMAe2380fISlBSR1RgQJ4/p9q03IHknuCv91nOcZS/vg7TgbH6FrE/gshwWwK5+Hdh9/Pt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39850400004)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(8936002)(2906002)(5660300002)(6506007)(6666004)(6512007)(52116002)(44832011)(478600001)(66476007)(66556008)(316002)(66946007)(6916009)(6486002)(41300700001)(38100700002)(86362001)(36756003)(38350700005)(26005)(1076003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EPRcsU//geR0+Obn9FVcUIPOZcN0VFYLRUEx9pbtULXWGRkc7LzPL+o9bTDL?=
 =?us-ascii?Q?IwSiIu8E4q5vCqEOfCU/MFTkiHQLVxxSHlk4GiRZcdbRrKC46eibjQ7u7rGK?=
 =?us-ascii?Q?o7IOXvCQQKfsRQvV7RXx0QQfxgyIgmlAAxe3JyQ5/I2A1Y3Z3uDwzrymUc2b?=
 =?us-ascii?Q?M6On6jaKI18kwatzO0LqY2pegq8eb3+TCHDmeEHlLfsLp9uUVxxPfdvf7xIK?=
 =?us-ascii?Q?qYcnW1OFQbJyTuBJtP2aolJbTc6kA6wLfxRC/XHd2s9CqqR6YuuAKZgKfjfG?=
 =?us-ascii?Q?X9XUD/a24aZ6JnuH76B3/zqSDeT849J69MxTaQnDP7aaurFKpkSTSEwie8XV?=
 =?us-ascii?Q?V6Wq+eQkBGRdcSRu2d8PlqIUGZ1nfQlabcAGOJnFmGncKCqDQhtUQNHykq2O?=
 =?us-ascii?Q?RliV4+SsNgOaaT8kzxgEZWlgpZEXbiUKVOw/yfQvSYsvtWsfNn2DbiJgMa+j?=
 =?us-ascii?Q?T/SJeEHOTEXa8iaay/f9rVYRz1tHGKfqIrrpJFkcnTigFgnNEW5svZwpyjbj?=
 =?us-ascii?Q?Ui1YPSHJCmII22Lt3oNsJ3BFP4PA/Ee33cFQlJLZRuZSLTVnIx0MrkBPABkt?=
 =?us-ascii?Q?cz+l8QW3OoZfDBWa3gT35eJNeiKFXNQWv5N2YBJ8aLgFMbF4ftXEsVlD8S8B?=
 =?us-ascii?Q?krWXbsbvkWgxFd78ACa77xRgPqh19+/wuDf7NPo5Eo7ID8cdpxayUiuvYAKJ?=
 =?us-ascii?Q?Wxn664XqmuSuXaAQigTLL+Soau2FrXdqxzH3zTL1wXFpRylY7WUXG0jjT5Uj?=
 =?us-ascii?Q?6iFJryxnDjhx8HidjeL5NqSn857B+Pj3oTPHt35FlQsAi+ISSSbWdxdAyeGv?=
 =?us-ascii?Q?j25AnRo4+C/B4m2duzOrmBICkJ5trzbHdFB2HvTCmChG6F24AgNtKMJkylJw?=
 =?us-ascii?Q?sNY5DKQKeS+fmwaH+y/ZkArPKrHQiYSUVWQ6thMcqkbri+t581B2B2PPtj8r?=
 =?us-ascii?Q?F4kUow7c/qiwDD5RLngQCxrcm4yHz7SH2wMdNPt+m0z/DUT2jMByJNxH9ekm?=
 =?us-ascii?Q?YxRnnjLd1voerFSmjB8lgD46RzPn2wXRCG6mQLh/NVFb6oK/ysrPBHl3HoPI?=
 =?us-ascii?Q?QDz4PtbABEeNvPw5dKyACYnZtHfB3SO1SNtMznZscWsbuFtQv2jv7xTotcno?=
 =?us-ascii?Q?oJh/fX/7sIW78w6+PjeJaT1rKhxIb/3dWmLjYhWnieMb2bQ3SW9fak5T7/Ex?=
 =?us-ascii?Q?Uk5kyHlqw6PBKKaYZHKsmmNA5pATvuqP++XzzYUj1MZRch/szjpuU0WVu7ce?=
 =?us-ascii?Q?7cS6Z165ye2P8grVMqTKDZu/zCOFXE+3d1TuUDP621rv7ShGjAIi5njD1bhy?=
 =?us-ascii?Q?C39sZ9wdspSb5S+9phPlqEWo0F3AFR+zjIuY43KXgP3J0ZMj+ZRFhrRNJn5t?=
 =?us-ascii?Q?RSIVNrB3Q8xr78EmaVisN9ky1Mqk/QXi0GbXiWGq3fvnf5FEsP1Zm7Q94kuY?=
 =?us-ascii?Q?+Vf4yo2EvCSZY4Yvv3/yFF+XmNMz5VyAJLghfEnMqARsRi3gxRhnYLta3Thl?=
 =?us-ascii?Q?g4rTmXSwpQHy4eOrn+yYmf8fOa1B++d3YPL5tYOAAiOgajRKYwyd/N6paNnT?=
 =?us-ascii?Q?asPJujwAIoQaNZomsxSBIJwb+FI5rZ8w5lwLMvLp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c262750-4dbb-4640-d2ce-08dc01163a11
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 04:43:36.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pzzphd+J0iN9xfEJFHbf2Ac/MmBPUz+RwKF2dwLvQQ9FzlUe9//eGuh4oLufsB2wNspv2uq46rncuDF3cqS21g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
X-Proofpoint-ORIG-GUID: wUIusft5BBdryBJ8Sf7Ge-aYfC63SOn0
X-Proofpoint-GUID: wUIusft5BBdryBJ8Sf7Ge-aYfC63SOn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=784 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 04:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192770

ChangeLog:
  * Shellscript compatibility with BSD and Mac, for "which -s"
  * d/tests/smoke: Update to test "which -s"

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debianutils/{debianutils_5.14.bb => debianutils_5.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.14.bb => debianutils_5.15.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.14.bb b/meta/recipes-support/debianutils/debianutils_5.15.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.14.bb
rename to meta/recipes-support/debianutils/debianutils_5.15.bb
index deec8d1fe8..b1368a3b2e 100644
--- a/meta/recipes-support/debianutils/debianutils_5.14.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "7e63b32ea4126c70a5da958f0106add267810a94"
+SRCREV = "d886c15810b58e57411048f57d7fb941a6819987"
 
 inherit autotools update-alternatives
 
-- 
2.25.1


