Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09B1C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:35:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22993.1701437720689971689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0699760636=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B1CQ665008490
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Dec 2023 05:35:20 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3upgxthrue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 05:35:20 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B1DZJu5023952;
	Fri, 1 Dec 2023 05:35:19 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3upgxthrud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 05:35:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F28ASpSKpMOf8kFRT6i6jz52amQg5HCDVFph3DkoUr05w10I2Cer451vc7l0LDU1d2HmcXDNtr3b7K1S2YBuw73JDeg2f0NY5Q6B4F7K4n5VjMyrcoMa4Nu6rB9M2gfLwYh2swfNjOOtpoFBmGZsTWm7UMBzT2xJakf835vrEOXkwOjonWeuPEYarP1zkoXCCaiQaRueJdL54kwS4Tu+yee9wk7A+0fpWy9U8sQIGuyfbkNnUf56iIg1Bjp0OGbykaPaQDvMby9lbstuKQP/rHWWpxyQmqkviOie9IQnvgQsnPdv1kabRQ9x4m2wxUxUw/tIBAswYzKM9EsktFQUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3quKPLy2PyIi+r3Te9OBqD2ZoyeTXmJVXs+pMDg6brE=;
 b=ClfUXCtLYgx6B6h1Ar8EwbpOMv6JuabefmzA+0Jb2mb22facS+AFxZy651lEiFhkQav1BJLgr7TSLnV0uXj0VAoyu0j5upPCTNwXxg4B7dVDhgEBFnCEPgehieRLun/WN2MHAG6XdofDJhqeRqMH/1jWnbvx5egITxHuk+OdUNg9XBMwAnDHIjHZ5NC+afMHEcsL7FcotkCkGLHpRnGVjVyjYX4zSkcC88xR+hjmkGyVho8xfDNCUFK9fUjHRTsIYnV9KOA5CC11RcNOfBzm7qzCKsFzaPgXdTqdFZVfMZ6r8DCeqSvybrFT1dIsh4wrVbImY1SNlefNSaHDn0C99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH8PR11MB6856.namprd11.prod.outlook.com (2603:10b6:510:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 13:35:15 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 13:35:15 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] openssh: shrinking to a new PACKAGECONFIG line to set systemd readiness notification support
Date: Fri,  1 Dec 2023 22:09:47 +0800
Message-Id: <20231201140947.792594-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH8PR11MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdf2bd8-bd62-490f-05a7-08dbf27259ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PPntK7xalwDRrrrLHDkjJi2bkJOMrIxZkKHgvOYYunqXrEquXnDOOkv2hP/r6wtLkjEPDeR75oDDdrkjLacRmq9hrpwWUpIHdMX4OUjQ3imgRLeQpY0pNFs3wChUTZYSTYKzbSR5WSKQL/4FPayXQtM37nF5i3HIUsYl8+dGVwVu6TbNfLu2OQ4/DtLp91X9NL5yzaoS5LrFhogndhqEWHByT3NyhqpZDmfRyQ0NjbPgPAkwglQZy5NqEI3bXO/zMKk+0OLe7jvtBXlSKWahcxZAcBS2RIVcu/nEemTMQJ6Nd3ycDO6Shj/2hNIpmMR/lyPybV+n67IS4UzDs/E1O0nuvItQP284G8jSer9Ny2X6U5YLGrEQ2EVjdIoFkr2SNPkId7q1MRXzQc2OOiX50j0ZgnTHrKqd8Rcz6sq611AJYsq+rNF9JKf4Uyasg3BQkJXr6F3Id4/McbFXg9Y564ymT6VJ9HTr6lBU2yc3blbCmwR+PTrG3uTwEfgJnn6TOjNNlb7aeipmEYLfCP/kvdzUBc2u15MJ1FwFCLIqe/uEPQJ4SdSJjuI1daa79Loczt8iR4RexJt/YJD9N1aBFesLZXx186/5nN545iheFwrzI6fnBSU1QDNTp9StcCBP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(346002)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38100700002)(83170400001)(38350700005)(478600001)(6486002)(6666004)(316002)(6916009)(66946007)(66556008)(66476007)(41300700001)(26005)(2616005)(6512007)(6506007)(52116002)(5660300002)(1076003)(2906002)(44832011)(15650500001)(4326008)(8936002)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9uNfppzGkGxXDtt8xBWM+WB4AnQ+wdLokAgt8sulKGqLO48TApCUQzPWgdm9?=
 =?us-ascii?Q?S3c+1boS3ylvRQtQy/C1sDoukJlcfmZO539gNg99ZZextZHeUAdjqCY/Z7sL?=
 =?us-ascii?Q?4d7qgneFxNHKZI9zxmjVeWjIOcqepQ28VcqwAuk/qTWqnSPzSaes5r06Bn/h?=
 =?us-ascii?Q?ktPhJi6c7+Ur9KyIKO6Aoeah8KQBb03BknOUj/ggHnAeimTtaRo/xjw90u1/?=
 =?us-ascii?Q?x7fkS94zyXXPjblboCJpQ1yjHNlvBUk8heCRO2GJm+YaMgYDWcIM2BbwO2/1?=
 =?us-ascii?Q?S58uL9qCEQdqiIvZXOD9UXFU/sfcgEF/KJd1xLV03xYGM3CKSmD6guAm3fGl?=
 =?us-ascii?Q?EbJwpv4pZ9oW20itE5i/OAFrGCiftYKXfAfPw8RbXaewKuZ4Maqn9at8wrn0?=
 =?us-ascii?Q?R1U4SJoDe6z9LumatFE7Euhm06IxJUZcG0ByLQpIRfqHN089zfVsZ8UqSaCO?=
 =?us-ascii?Q?0rKcHWtGFTZTEeFuVx/77GGPlziU3481aFxYdt19WXk3EGh2KaV8JFqFUZ/j?=
 =?us-ascii?Q?YCxHUOxPfYdpTfqauFr+eHljAAGyMdE/mrPr9KEvKfUKdSzxbntv4TO89RwD?=
 =?us-ascii?Q?fLeWHfmDlf3dS6Kxpq6obIxfNqyg8dKf+PuA/SnqDbO13Q8nDnOKvIHHRsmp?=
 =?us-ascii?Q?h0L4FiA2vGuld4p+3wkj6ga7mph5I8Vz3n/xw7AfQEclW4g31LgHEAams8IK?=
 =?us-ascii?Q?mhGu+wKyr8H/JQDgNtfGLi2AQdq2yMZNownk6iXHAXRQ789cKWS4ctGOw9yn?=
 =?us-ascii?Q?GNSXLsfhG6QwummfFnC+WmDImyLERm8kdm0gwJWStsZliq7kZUIFk9sZZy1M?=
 =?us-ascii?Q?nlh0l0SmrxUwupiBxbStEjVB1Gt8YkV5OSDCgtr0bAkgrsOExh2IuaddB0gV?=
 =?us-ascii?Q?p3CkdbnFBc74nlXeGRJsRDV8+jNDgUM2RJ55CPtyookNxmJzsS8qtJlNJWf8?=
 =?us-ascii?Q?CsiSSVXOxJsmg6RnPkTGQKeoJDmbPXnNa3mXGjIt4mj37AoisuXVxgWMcvan?=
 =?us-ascii?Q?IzrKnag2H45/PhamkluzbTfETeG5xiVF8ENfVc4B+Sd2+VlasDQAxv7yOgwt?=
 =?us-ascii?Q?EuwoBAMB6eyWDQRyylZL9scrQ19rm2HuhSthPt7gA5qwW6EyXjZGlJLT6yrQ?=
 =?us-ascii?Q?SYoU2Cyq08o8endx98a8xqgjVD3GtjbT73FqTaX5FstnX2u6kLCG7hT/ua/n?=
 =?us-ascii?Q?63VrqRaF3qPljX6FnIVi+I9y3PIVFRbJoZDiduppUeC2T62cgNU5PLtPxfMg?=
 =?us-ascii?Q?lOD9WNSJCeg2nOIcoMkBiZ2YgI2LJ06UR9Bp123OC2+v1krkINeTsLJO1MNv?=
 =?us-ascii?Q?e4AUVbztPo4AFmjlg3qF3yIXihNuG6EP3GSXo5m6XXoPiEkSTe2pP9xW96lC?=
 =?us-ascii?Q?kcmEBi47hsCGpnGO5lm7ay9F8JPvHd1GVif3eWIqxUrzxRz9/w0R/TEXAeKp?=
 =?us-ascii?Q?TFank69rL1dD7qvt6dVjyv271gBDzupA9iEBkzJ9D2FjGGsiL8SqrIEpr6YT?=
 =?us-ascii?Q?loXziD0xB0bcYOVp/u2o6E92GYVPIOJqCk9V35ISGV1rAQ5K9lYCvJ/PqLwD?=
 =?us-ascii?Q?2Aindl0i9M0Y1dNbh57uLcrder7i5kT3vMWKAo71xdU2u9CQBm02mpro5faQ?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdf2bd8-bd62-490f-05a7-08dbf27259ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 13:35:15.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guqrqQuzabsLhu6StIIDlLrysY6FBwYRbXGwewq72NJSGbIZgPdrpN7AWIhgB/+7rQEdZ55YWL6S+gtMPhc1rLcahxvuwchQuRckP9ScTs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
X-Proofpoint-GUID: 5dmFHYe23vFiYaf_7EQcmv6TKEmybU6A
X-Proofpoint-ORIG-GUID: XAsUkC7zL5gHoXgOZkLPObnnhy9rhqnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=900 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312010093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191666

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Using PACKAGECONFIG line to set the patch of systemd readiness notification
support, it can make the .bb file more clearly.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_9.5p1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index bbb8fb091a..2c1c821ea9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -53,13 +53,13 @@ SYSTEMD_PACKAGES = "${PN}-sshd"
 SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
 
 inherit autotools-brokensep ptest pkgconfig
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
@@ -71,7 +71,6 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --sysconfdir=${sysconfdir}/ssh \
                 --with-xauth=${bindir}/xauth \
                 --disable-strip \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)} \
                 "
 
 # musl doesn't implement wtmp/utmp and logwtmp
-- 
2.25.1


