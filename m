Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D55C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 15:40:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16920.1679413239681709334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 08:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LezLIjwk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2444fa4cce=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L8P26q030425
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 08:40:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=PPS06212021;
 bh=K9PpX6in//uhVloOniaLWqAI2PBQDddsWi+b+mADifQ=;
 b=LezLIjwkg13Rfb9/LBkRWBGvqAtkwdskB7xPrAXiShd+FewyFUdZKkGfCw3LPM21FTag
 WI2OO0XoevIYvOenD5PZ1UBBEtkfVbuZJ8myyQ5Gn5NfI4vGQcRqh8gKQVtuouLXLkGx
 qIWeIt3yRZ9NNh+DP6JdTjCDpFQvYmntb97WYwawEJioZP6MpHOMNYBGJEjJzQ0BHm6g
 9ajCVgGdJX9EKUqnsyU0WKeYCKFAJ6WzyQW3zMlH0inTt5eRne89heiObWH3M2NBPO7N
 SP5K8hcnlC4jq4wkymdVaxGp9NzaUoGHOl+gcHNrnPBYx+q6fHpGwnNC9DK2RWHGmqiL eg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pdctmjw4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 08:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBlozQb530tW9EGqNny6tiqWe5BR2VtRBzIARIaDbpL9/Ht15G4ObgQh9ym6jjlwq3N/I6kdeBYHFequq2wyWLkHIMVDw2HyYgQfxH72FIWa1YwXp30QUGc4XbbrMWTme5r5geEcC1NIdFgJ5B0nLfmpFDcUMF5EB5tAANx5EGdOA/Y7q9OsQeqT9Ly7F+BqGFM3OtZxd7oKFWnGTYWT7VrNOEHVrTy/RcUMz1yzjkrg2QnUEblWNnSGeFx1r0lqGvxGsD4lgmdRYE6IDtmkiYNlrhXcM0kOzMBpL+0QJr9H3yFds4cYVKRdnrY30KX0avJ9tsT6rkNY1hx9mEalWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9PpX6in//uhVloOniaLWqAI2PBQDddsWi+b+mADifQ=;
 b=H4JFqLxkT8AjFEmQi7N1QJwZQXj5M9ZhKVSs1Ah6eZEZWJo7DRkECPYP78EEFLjYImRDm+wHGe7ZX26cD23HpCDrSggA3h7Fw91C5XkPvDereqFL79W9nQcZ9U9oynhMIs9p3tSSFs6DcWKaThZcA+xOmXLEv+X6AtvSSsAOvLYTgS95KDG3GrQTYwhmAmiX4KjwU/+Ph4pbfhtA8PSBNfpUlbtmoTUDDTi18mRSBLb9o9MjDXlrdITl9gyvhz4t4xig+AnLVzJdQ9HP5LX819l6aO6++U+u3EZPBgX07Ntx3twn8wtV0hnfWwm8xCVtsDxyXC3kUuat9p416E4R/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:40:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:40:35 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] rpm: add back find-debuginfo support
Date: Tue, 21 Mar 2023 23:40:16 +0800
Message-Id: <20230321154016.34836-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321154016.34836-1-Qi.Chen@windriver.com>
References: <20230321154016.34836-1-Qi.Chen@windriver.com>
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0192.jpnprd01.prod.outlook.com (2603:1096:403::22)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b37a3ad-8c8b-4011-5796-08db2a229ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R1PZRYYPxDKV3WBjUGFICuYAaD2KGKahfmFowU+zi+spba604sfD9q3ckektKfapmHyNMCQEvNu1OH0xCQmXaPR5eM+D2fthgf2ITyd2vHcU0KChLPJXSnya3pDOGSgwHMsuW6QUYhOVgrF7eUpLYF57FPAKpAgC4WHBdQ6mB5bbeY4mClwLLDW7eZwjrYtbDETICj0fPu4w9YcoTNsqIzJ9So5RMejCNLlD+2EhgBkiDDUYUzqoGSHiXe0l5/fPDLCM0af+jSSF9iyLhIMFwACgA4p8FaWhQizChn25xJNQuMwt9KXQXvOQUhh45Lwasim9stRtRE5lrigAMSowSQSgy7y8tonxmVaX3dZknD+tGSVFpiNLeKfeZV/LPH9qG0c6prZzDp3NrRnyTW1n02xm1oy5HZGAIzbpvidVdFSrzvGqr80EdMAoWqOtGmJMgwXZOwO5oMkoWowUMMLbaugtU8PwKPWRJCWd4ToYK7gXaDazxt9q+w5gBHWtvs7GutKNu6K4gDQk9F3arNT/I7lvi0nQX00Nis/xutTkRlerXQpSoV0BsH+n3qFsTXyJgIrtLik/EVN0eQwkmS1I8JiV4GxEmuk/5Rt/mhOVBCa+9YQWuBFJntWNA3r2C4l7qfbTPEm6SO6g3Duz4rCrurlwiMW1NIv9wMO5VKY5TwESLKrnY7cooZbSSp5VmCaL951aNWzAhkVbSTji8EkYrlo97pFfRf3hzBLwGMDuxsg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39850400004)(451199018)(5660300002)(8936002)(41300700001)(36756003)(86362001)(38100700002)(38350700002)(2906002)(6916009)(966005)(6486002)(83380400001)(6666004)(478600001)(52116002)(2616005)(186003)(26005)(6506007)(1076003)(6512007)(316002)(8676002)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZOElc24+xjRBhn+I2G+3JmNCg4Fjwaww5vH1CZhRfSRfflM4W3dlBx575FP7?=
 =?us-ascii?Q?O1uwu/L/WUMJ2xF88lhG8BEIO8D4OAhoDpmpyO57Ps6JXw0XnE7FiQ9Xgilh?=
 =?us-ascii?Q?sS8kfrmMCbSfXfuhHDNeURVOabF/vbdFS9X6JPNerzUisjCuH7u+AyRJ1CSC?=
 =?us-ascii?Q?jIDwMI22CO/nDQby6yfhaR7c61fwdgJ6Tzb69uIixKcGdxWz5VaoRYSCdOwm?=
 =?us-ascii?Q?vK5S+105rNwmVRfyF+wSs+rq91D/NJv014qPYQhmXpRE9XQ3/JUshQ4q5HVp?=
 =?us-ascii?Q?UJatNunAjsUdLOZAZScjauBhdcH4wmkPT46O51iBXmrmP77QmzipPTr2+BX4?=
 =?us-ascii?Q?PtVmE+8l5KW9QG/Gb9O0f9+ooEtNNA8XJG3xWjKnfv7Gddjn8+e34lwJXq/p?=
 =?us-ascii?Q?MiTtqKenEK6JUcpfOyB2z/D+XGpguyq8y4MYW6nxEPh/0NM7u6EujWKdsjdn?=
 =?us-ascii?Q?bgbStlcWg4QFIzKITLgpy/m0vFjkBOe7l+qETVuAKPAJNjiU7jYD8u5LsJjq?=
 =?us-ascii?Q?4LliOeZaNOS/1a3xGbM5ETgPlNVwGkAqgOi3ZUOyCZZhoCo88phVdGVkyigs?=
 =?us-ascii?Q?XqknhhepDLdHyzr9Ocnuf1Zg0V69u0kfjPaVsMwY9cLwO2amkaUyF1IRKA7a?=
 =?us-ascii?Q?1US8ILMqTSOtMAalgX98Oz+KJc+YDjnwIQX06ik2D+yaSMs3FVjctYxQfrkr?=
 =?us-ascii?Q?PqkAxsD9ShwESQNGu0h/rAreYRqCwYAydgJsjKmBq+c6zoC1hiJstG2eibvU?=
 =?us-ascii?Q?X5wCKCachUofQ34SV/j5KNXYYDC2B99eJ2kk8pbk6HKrlWgVYTAb7Xk7uDR+?=
 =?us-ascii?Q?s4cxOvAEWqQXgVlqWJawzHLWFjpb0sEacsd+WD/QiaQ8pyma3ckTDQKpzmtT?=
 =?us-ascii?Q?YCP9POMmtZenvPlHxjurJJKnlPVFWW5D6G/Y7ZcnwDEC6xsiAXjkYbQZAFeu?=
 =?us-ascii?Q?0oTphmWeLMTglS/1SisSmqosEM12mLpUWBkoBLETLarboQXCz2qVoC7BK8zS?=
 =?us-ascii?Q?zz7kh3pyRPI+CKNGTrkKZfHbseRRgGCiOdPWIul30DN2RFH/+J8DFj3c2b68?=
 =?us-ascii?Q?uSu2AZDIUB9gXEMXYuYJMoq8IAKBZc715H97BhfbXKDijuH75eMXdfwWq2lD?=
 =?us-ascii?Q?5RoE5rCWwJkq4PdjcbNsjLHIIA5Xg8LZ2JhqdpUT8Sc56gY0FC3hEyefF9oq?=
 =?us-ascii?Q?x7DZK/bJCjoP9nrxbw0qzmM+qPayUkV8Sv5S8d52y6tUT+vIJERUDagcJvj6?=
 =?us-ascii?Q?GXg0Wh4FTpaShictE5vUPARY+MXhS/MwMFxGTf59fkOK8ZK4btKa9yBtkSVv?=
 =?us-ascii?Q?jIDhjzmD/tPhN4d7tfJBHcDUCc4dEAKP19bg7jsjpZnv49tmOzZq77RHaC0l?=
 =?us-ascii?Q?5bWbLhyFIsrJykfzgrtbH31I714vloG1O9w9vTDAnoVfpdlkqndIIngfkB7j?=
 =?us-ascii?Q?cf7kXUzshemygYbtuJvFW4qR0jB7HUlreCGvhhVaSmP0I1cZA8QSvjAtC45u?=
 =?us-ascii?Q?Rj2KaYE9XIHbqN77s0NXp7d3Hw7uuvdNr8eaHXS4aq5Yh5LbFg+wiwOa1rrc?=
 =?us-ascii?Q?4ERikd2rZGgNur+w0Z3aEfuro8DCDqbdU0TzMEKI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b37a3ad-8c8b-4011-5796-08db2a229ca7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:40:35.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxmVBQ0B9IWODXeLDNsQ6wJR+Q2392CXt+F3GdAG0yE4xVVtATlfrkTmb6BU8lntpSvUEUh94wCxUyOlDrKC1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
X-Proofpoint-GUID: 2x_XsbN4I_4lw0VOkb5nefN5CkoVSNEW
X-Proofpoint-ORIG-GUID: 2x_XsbN4I_4lw0VOkb5nefN5CkoVSNEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015
 mlxlogscore=727 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303210122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 15:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178890

RPM upstream removed find-debuginfo and switched to use debugedit
since the following commit.

  https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd9466fb9dc717846f5bf15518cc

According to https://github.com/rpm-software-management/rpm/blob/master/INSTALL,
debugedit is needed by rpm. More specifically it's needed by rpmbuild
to supporting generating debuginfo package when %debug_package is enabled.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index be81c3eb08..aa398793e2 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -134,6 +134,9 @@ do_install:append:class-target() {
 }
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
+    # Ensure find-debuginfo is located correctly inside SDK
+    mkdir -p ${D}${SDKPATHNATIVE}/etc/rpm
+    echo "%__find_debuginfo   ${SDKPATHNATIVE}/usr/bin/find-debuginfo" >> ${D}${SDKPATHNATIVE}/etc/rpm/macros
 }
 
 do_install:append () {
@@ -159,9 +162,7 @@ FILES:${PN}-build = "\
     ${libdir}/librpmbuild.so.* \
     ${libdir}/rpm/brp-* \
     ${libdir}/rpm/check-* \
-    ${libdir}/rpm/debugedit \
     ${libdir}/rpm/sepdebugcrcfix \
-    ${libdir}/rpm/find-debuginfo.sh \
     ${libdir}/rpm/find-lang.sh \
     ${libdir}/rpm/*provides* \
     ${libdir}/rpm/*requires* \
@@ -173,6 +174,7 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
 "
+FILES:${PN}-build:append:class-nativesdk = " ${SDKPATHNATIVE}/etc/rpm/macros"
 
 FILES:${PN}-sign = "\
     ${bindir}/rpmsign \
@@ -187,7 +189,7 @@ PACKAGES += "python3-rpm"
 PROVIDES += "python3-rpm"
 FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
-RDEPENDS:${PN}-build = "bash perl python3-core"
+RDEPENDS:${PN}-build = "bash perl python3-core debugedit"
 
 PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
 
-- 
2.17.1


