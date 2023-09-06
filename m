Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C27FEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 07:33:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3202.1693985571397615934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 00:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oMMwCqS3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76138bfad3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38660DFa024893
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Sep 2023 07:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=dt0QzpGVeet8b7A9Ga
	BGv3gSfDnsiNiHvIMJE2hLpB8=; b=oMMwCqS3x/meIU3pO5XidZex8mjWf0HJOc
	4UgRH6cf15dTARqdNLr7/Zx8WN3AVI5CUMIq0dYwCgcRBGj+tMY0Qs56Smk9TfKv
	RmqDSp3nKyEmxAOuOVOkJXdA4U16fJjpasB6mYVDH0NmatvVg/kfBxubExl+e3JG
	BcKzZSEaQ+96lbEExKr4TYL/aA9aW3kI/K2I+JnMz8zf0RIGb99KkOr4LUHpBxJz
	zamLW1vw8E1XBjGXRn6beOv0U+FR6xj2cUx1nY+OvFy0Y8DHcRum1MqXyxJ9ykfG
	mlNRtebdjYVGt6wNBqAZveCVRQPbBU6CCJ9k8wHk/UpuB7KFGm3w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k250r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 07:32:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNSFFzPKO1+C2ULC5ng5BLelpMgDPgMm5yqsgMD0Dp9V5Kk4rZF1Na85TOpIaxpymW/8VY6Knah/KSgUNA3yWdKqsG7qvyaA5JZI0bLj/PMsh3G4U3A8ksn/K4Yt9ll3q8xT9Lhcj5g8wjo8Wtql+0dlAQuE5j5lpoLrYeDFHYXw7R2/InkgiaRYDy0ouO6BPj0gzHDpC5xnRqXJJrZm41Eq4S+IIcdXXSs4ucxyrLbNUWJA6zYBP2WcdRJQ7p/Vu1d30VJOlWGTlo+IX60PPwjN4hEXQHKgkSAs1KUhwHgkwjFbic/Q+lzNGujR2g9SGaZzmozE6VfCMdGBSHHX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dt0QzpGVeet8b7A9GaBGv3gSfDnsiNiHvIMJE2hLpB8=;
 b=Jr4pJUInFKN0ivEB5DnyGbD54tGTEtuGfW78eZfZwdjQyF+gUvTM0fna1nJ2QBHQpb0BYg/5+A8I4ZDYFwuZ5bIYQeJiBQc583L1MfAKFUTm1bVG27zxeGlh9YBFYzELRi5P8PJgW0V3Haw6RAwsjqUdZFCpSQtHRoI3mM4EC7iH6JE2wIaAQ0akurO7FkB4oGBFaCOYlTSPsXc+MaR7OJ1FuWSQuUcJxLdFg0hhI8RENYtqv1r+t8Yt8xt+9kwxTjfoTel6ycitWv8DLMPPspLqCXa8n5asc3xMlfm2IUvKYRpH1tHMTcWPDaVMf5k1Tqe1v9VuJWnSJSsmcPKHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 07:32:48 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 07:32:48 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2022-47011
Date: Wed,  6 Sep 2023 00:32:32 -0700
Message-Id: <20230906073232.480764-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::6) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 5618f8fa-d0cf-4b1a-8c0b-08dbaeab77ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uVEzC1bIklXaxEawvb67L8yjJ/ni03/ErEkRgGjCyZ9nQLmoyP+BsYn6RReV1t0WOZwnvspw+3+XUFi8G0kaY+qR2zsG+H0ZRTauhguaUmyplOa7k066ZJK9mO1Y7zMt0+OEQz2DY+8XRjDm36fGu5PYaJK9fWfgOaju/d5yEmUMOQb2sHndVTfLJsXvizjw1DSZECeKpLHlKQm7+SXg9DdbXjK/55yg+4NQtMVWkdco9D+1lDaWhebJCJMKEgNj2FctBZnV4VmCgHUZzOeL/o5vsf4QXMJNDjh+Jlr/uFl1aC4oQTBp8b/pa7W66etTbIEKyx+sDxt1OigQbMb7wlQca0+4rKm1fDEUhRX5K6QqiNcIO1DOrPMvP8vWkn1wrvGHTPVSgsqU6YoBA+VL0s9+DuhX1sZoMWKRx1sKZE77j+KCbVBOyXBH31OyoYYifQ/6nfh1TPAwFO+IL35ajOCXFbxwZO0B1YO42/db/RqyECGSrMmFcqwuHI/N/hUol6GLaBINNlYTRYOgsYhMU5vY2xNGDBpPa6RiXFoscoQZtYtbAMeBZwxrbRaqdaYKut2oC/ZtLgT7wKLHBy64F82buXdE2bvLKqb5QgbiAdz36lHBh4drCS+uLy73cqaB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39850400004)(1800799009)(186009)(451199024)(52116002)(6666004)(6512007)(6506007)(6486002)(86362001)(38100700002)(36756003)(38350700002)(478600001)(4744005)(2616005)(26005)(2906002)(66946007)(316002)(5660300002)(4326008)(8676002)(1076003)(8936002)(107886003)(66476007)(6916009)(41300700001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iDfywMtSFOh70wzU6LAm3KinnsveQOn/N0smgecZhTzWtq5EwA9peRhP064x?=
 =?us-ascii?Q?Lv6MY+8SlT+XOl7EZPA/5bUdx70pDEHkQnIv9wo9EvjN5TEhSq/2RX0hogDm?=
 =?us-ascii?Q?Y2nYUvccGXnp556DUvPDqGLdoZMszYEwsP6fiyuGwdTj+ouKlIBOcoeT5Cf9?=
 =?us-ascii?Q?6EBUNOh0vZJhSK40FvFQh4AfkzvuHYDpKCOTylqqhW/ZwN7fTy87NTHyA9Bz?=
 =?us-ascii?Q?LDu0LwVuiaeYZiAaaibIgnO3y6BbJGNCJpkiSBFGYHBDeUExc7xIG8xhmOy6?=
 =?us-ascii?Q?msyOxkF9NFxB76okoquOAV2CObiMs4nSNZQlIN8dGGpCao9K+HjGAqGZNEy2?=
 =?us-ascii?Q?E8UtmNU+OHHW01gJ6pr76zkEEfog4eUKPTZttqi6cGdjzC1fhvkZmBsK5ySA?=
 =?us-ascii?Q?bX1kQuQnsRS0qGSYmmYnmCp6PorHLwQwKZm7RnKlKR7FfT/IDlLkwA35uYju?=
 =?us-ascii?Q?sWWf7jbfpKWeIknj0bYtx62F4xkGR27kqgwwJtSVBJDDBJvU7KmWvNOp2G9J?=
 =?us-ascii?Q?OYB08vZ/xGBmFBO3zyBKR3kZYFwvrXqjaJfllsY97X0gXahSOi0B+cu+WOL0?=
 =?us-ascii?Q?ws9ELZ3NMn8l1VOceoNwZyRCIwHhwjBcWPLjbvkKc1o4yXBfN400zHWiTa4j?=
 =?us-ascii?Q?nUPp462ZgJwo6qkz+2P0ezpQZXHkcbDWSJY8pgfbanWK/5Id45fvOh4cp7ye?=
 =?us-ascii?Q?whSMV8s0vR9MmI6CXC5nMcoW+HYnoatfl6EksK0DvWrf3ooSnHSj+klwuD/x?=
 =?us-ascii?Q?RNZiDKbQxzWIGSeBmPhFa4M/nsi38kyTiD7DYW+g46kg7jrmtwHDkzqDP1AD?=
 =?us-ascii?Q?wnlJ1QnxI4WgcipMSpICngQxViLWm930rrFYBDSMJ0zaIBnF8KwB+c6sH1M2?=
 =?us-ascii?Q?KvRrEMMb8lNLzx0wi4mcf05R6RnZkfmWzlxl+hrXHYtJWDXPr8Xh/OSddkhT?=
 =?us-ascii?Q?8GJurwa1o+en7F5IVp8C1LUbb0MWxV5f1eFDjTvtyO/TK3EbygWw4G6jg1TN?=
 =?us-ascii?Q?luK16A7t2u8qkYbYPSHzt/UGrbCEBXs1+Ul1LcZRGuvfapRI0VYONxc7gTPb?=
 =?us-ascii?Q?MwfXSalDMMhr00OxNOIix1gIhRlO98+OHoQv1Pdwx3MgbNh6E8ODBFiy6UWU?=
 =?us-ascii?Q?wX5GDXMvPZ5NujDKXapI7fipfA6fpLlyWSbsL3j5HgLW3dGYlyQ8S1Y8QBMo?=
 =?us-ascii?Q?vv5UotHGZ42H1EM916Alba/JR8vgfKLsYbiel0Y3LO53a1Cj1ku9swz/0irg?=
 =?us-ascii?Q?Rq61wWOdf/Sv/nVN5zA+QH9e3izuBqO5BWKzGkTBi6DvitKjUl7P3MT8XFno?=
 =?us-ascii?Q?+/cPuOVczlDF9lELD2DMVlHsJwOmcBa03+SQZGIXVruBg7jldNEfbaEj/P1m?=
 =?us-ascii?Q?usIJjDpOqZflfwVyHXjz3LaK0PevRSdVPGJH0Vz583LzzwFEFF+w+bVrld10?=
 =?us-ascii?Q?fEqfyo4/58Dht6mLyijlV88iKsq5HWAOhV8ErUXpyPbJeRdopAOgqv9PmMxk?=
 =?us-ascii?Q?ilxnxrSq15YElI5Q6JtI/3j/0v2ruDzMwRO2sA2i+zpxImdFFtN4wd5t2KQC?=
 =?us-ascii?Q?qlQmj6liNl+B+gXrJ7EZ+O2j/VctPHTgULbSyqKnPD0SiDuCJoRbc2uLgAcb?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5618f8fa-d0cf-4b1a-8c0b-08dbaeab77ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:32:48.0601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWkFkk9bLJBdmV6L+uYBsn6x5CsjRjtDjAxxBL2B5RLKXG7+AIYzFHcYuaFmxRBFQ8h3T+cI34/e0vp3oh7JIktzgNhWyp8avcR5Hk+20DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
X-Proofpoint-GUID: ln7GZSvk3tLoJdPk5_WCo1vIxTa2IHlW
X-Proofpoint-ORIG-GUID: ln7GZSvk3tLoJdPk5_WCo1vIxTa2IHlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=328
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 07:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187281

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..aa77263c66 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,5 +56,6 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0028-CVE-2022-47011.patch \
 "
 S  = "${WORKDIR}/git"
-- 
2.39.0


