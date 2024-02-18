Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C785FC48BC3
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 02:57:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11888.1708225049587754581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 18:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hsqixa0u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2778647e52=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41I2opSm025201
	for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 18:57:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=cKp459UFLU4qXc0yJq
	qmFF92nHLOWVNZ13Gn18pTpDI=; b=hsqixa0uuHO6ryFW3B5tCueLZm9aQ5iEvX
	toJA2ReheA12yUFOpyL9VuCNH0nEnjqKxf4LXCfzW9eyQTfDa8wQfDEZKLIujUzn
	kiyQ8wpyMOldK7CWGD7e5r2kolKL0Dsu9USjlt2c/2n/s6Ml7Ee4rf5f8+rgMraL
	8mQZrzfKbZ3Ra7YNjdR7FrHOJEzXYiThe2G5cVfQEOare41izFeVEC/IrIt79LUD
	mo657f4mm7+NzDcv5nEPY5GWVP0+5H9a0y93Hybb5ct1sD1OMHCX9G9MKxLO2JcV
	b8z8fWEVbItVpCOqEk+OFoIB9y236/DHHpZdi2kDYiqMbsMxe5Gg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wary48gg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 18:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScCvwRbmZOSPznSQOZw4ooNucWGBsxqvvGkJ/He6V79GLpKLJXZamxNd1iley0mheKuo0g7xvbpq7fWlCs/mnGhOYx5V+6j+exP+qBLDIZZzgXMFkImorrtmguuIJ6qaD0dFDBqTP+xlNan6MlaLlbbLNWzN5cPZNSd1Wml2Q+xYrDCFui89eGfLC9hQVi6LRUjw75TNiZs3kQIgCS/SqOgslb40YujZDQMB5uLbtxdEmVMxcwoHAL+3E1q1sfg2RLozBVXDxjxUZ5GwdFeIiNX71snIrU7HgkEr2dWJeu4ktx88uAJ0xyA3EDWRKDOeO92YB7tDi8X43uVKD6Ngvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKp459UFLU4qXc0yJqqmFF92nHLOWVNZ13Gn18pTpDI=;
 b=XayVq8y7N4J+BgAbzRLQzR1VdZEERuAUvxlTUWX+T/NoVGnU0MflYDkhdj3lvLaUD7eeiMTc93BHqVltwIz1oy9J9c5w+mK1GtcmEJyHmA8rdUOc/+edmZHai17pOA4VSWQ50NfgjNj9zUvHPzQWd0EhCwJcQh3SAiAQlMb8sFP4ivzfOxr44E5sp3np4P6o0FeVUH2hUTwQTwSHe+c93Oc/pfcLbT+Ue7XLi8mP2oq9Op1Uz2gWt+RxBzoKjNxH9CyzubeUSl8n2I15T4HvRsb3GDJNdPlPMIMSCVKKP9FgrIYwlnD4Kt1r73c3xplJlotOImRlZF5ExddcSR8XMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Sun, 18 Feb
 2024 02:57:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7292.029; Sun, 18 Feb 2024
 02:57:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gnupg: disable tests to avoid running target binaries at build time
Date: Sun, 18 Feb 2024 10:57:08 +0800
Message-Id: <20240218025708.3343647-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: ba122ae7-24a6-4c30-62d1-08dc302d549c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EuKWJMtZDjCFwIEEOxiqVFb1T6xUt1WApW0qDl4WMcmKAGvs94GYkRGu/cMzuWYzRynQPX9xAdKxxdoyoWUOiPvGKMFctgZjf7PM0DIA+njroVcYtw7iIYZlJHi7jTdtfjwbKmYmGLKuigtBes8Wyal096AxfRGP52821pV6yt1XvP28oX0RnkAy4B8x1+w5BO6n2iidj5rtv8q6nWWr/ltLjFcUsR0E4//FVKlPAG6mRK3lxQUByzo3lHqrwPzjWb1/g1GCqdXqYzVCSVy5LXCWlEGVxVefT6xcvdIWTGwBZBolIdP3SWu4l9nrpg8b4p48eh/vtydCEn4aAhXsJxtzK6XlOVpgRIsKy9kWntncIUgeb3d20wO1X/5r3tJ7Zw5IwiVe2P1IriWq4v7z/9I/q9HRrg6cLLDsU04dwqAwkHu+m+XidNqyE5V2lE3mY0lOw9oKC9asiKCJBzr1ziQoTTD14a7RQAmlfw2pJAajIoGCDAvCcgVuiNGKubxkqzGRpcLx4VzlptLbANavaNbso1rRlUo01vHK/VUFyV++mXe2zaADrwDfh3Tyi3tn19tbBxZaZ2iHdp23iiOwI5niAKtBGa8KATzJmlr64NwK+ky9HfjsZyAw5bu3AT95
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(86362001)(36756003)(2616005)(38350700005)(6666004)(41300700001)(316002)(52116002)(6506007)(6512007)(6486002)(9686003)(2906002)(478600001)(5660300002)(66556008)(66946007)(66476007)(8936002)(1076003)(8676002)(6916009)(26005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OQDrwq7me63SGOJ+jg7saMWit1hhmdQRDaxHKqw9eZSwGeBZNR+YmZpxh/7t?=
 =?us-ascii?Q?yf3kHmqIw7eda20Q1fe+TPEWTfKPRbjNFyAe7hVH/2uh4Ut1UoRcKkuYpYx+?=
 =?us-ascii?Q?frcq2EXjnuhwOTjJkqjlmT6eqsDnycjTQK4SK/rG+69uDlU+9qKPWsMcjcIq?=
 =?us-ascii?Q?q3P/E+DIV2YMUGsZnZeqDO9dn80BhHoL8mwP66n5vZXD8vBWqUyDw3JPxpdp?=
 =?us-ascii?Q?+G3Fiuqp11NszjQFqnTy6E6zbuHBA0gAZ1u6niR+E0PcbPZlZer92ckvUxkj?=
 =?us-ascii?Q?wbJuD6a2LkS6setLiGWUlR0BPnvqDbFRNlJ063PmGr9PZaD2PxpbZmp3Z3Ie?=
 =?us-ascii?Q?lTX2v8fAWCi9NuAT+BrSprjLod2s76XVi58B/TUtpO9lQT3K1ZNVJAekg4KJ?=
 =?us-ascii?Q?PZ3fSTvahoHcbIr3OHUXmqnIC1Esm/SF4bimY0Qy8LUeh4PlimfGiKJYAL7Z?=
 =?us-ascii?Q?slbOh4DhJiuc5ZsCrz0sUA36B/hT/+GgiwFKOafTFnZkQluJGSDnlA/LaGch?=
 =?us-ascii?Q?l/Zulq9hlcq55IXK0PWKYJZhXis7sOcNUs36kqGwlKwU3pqLSKBSZRkMMDkH?=
 =?us-ascii?Q?I4OLcVje/B03k5hPYvYT7Lw2YwzDMAdklEgjovadjPmnTFAlwrzicJB/iDgf?=
 =?us-ascii?Q?XkILD77TGpyrlnB6TYohwwKDYtWTERyou8n7FbgmPxqIVB9R6dYnRX5+Pv0e?=
 =?us-ascii?Q?gjFjS16/OJc5b1IPNaNh/JnQTuNsGDnEzIZGm/b9X5z4ewKcFbi67kjSFO+m?=
 =?us-ascii?Q?Lrc00pWDEn23y9xjuYeYgxuaZE/XXga40KwZpqOOdfLa+DH7aHYM5gFDzvu1?=
 =?us-ascii?Q?cXsnEZoOhNZabb8PCKo5LikANzyGkrvT72HQdV9Z78XrPogMxYM1o8imQ9Ix?=
 =?us-ascii?Q?Xbo2Fa3rNaBi2es/SR+P6FToFC52gHDDZIGEsHB9ptC9A/T7vzWdibizGKhq?=
 =?us-ascii?Q?+DJUe+M5A0Z+NmQjSvaSX4d4mIxVeF8Q7ZBRo9juBg8Hwi+IsiQZ9XTds8ZO?=
 =?us-ascii?Q?n5JRx98B683CJIqQHR39bBsqtyDC2xHzrcvZhYKO5XACCGjU1Z3FuOEcS4UK?=
 =?us-ascii?Q?uUog8Tm8fA9a3zLtut5sGLsuDB8+Aab/6aoKQ+06Nw4xC3Cu2fV0UfYCTcMV?=
 =?us-ascii?Q?tPHqyqq02eX9EdEu8xGnR4AB/DcE9mAERTp8xsM7hof6l8LS7l0brcWKdJf/?=
 =?us-ascii?Q?irwq+v5mAqxv+bcc9crQoN9hAjfjBLbXLndQxluZsyiPTqqUnfw/XRz84126?=
 =?us-ascii?Q?zHYS+YybyG82+D2LYnb/a/0R6bR+2QonKUxHxUp4VIWSbJh4z2cgbq3S0EAl?=
 =?us-ascii?Q?PPnKR0261pApZVhs4lOkjc3hOv4RU6aVlB9l8TI0lhujg1+nkoR+M92gclyc?=
 =?us-ascii?Q?dWu3iLiJV/cMIPieeGpaX5AjfbJMgXhnJTsakRZYe3dnkkLl7kDgfXy4kHBd?=
 =?us-ascii?Q?kaHrzj7HjDi7hCeUe+BWIbAwR7AphMur5vCb77Y+VPE95R5ocHR3UaxxSg3r?=
 =?us-ascii?Q?84QcCz8miWwoKkgA8jM2HHZAcZu5fpJ7yNBSMkjsUT5yc49NqjoWsrS+2foW?=
 =?us-ascii?Q?TfFISMlPxGe19rdZKeQLp1MqqqG+UfU0NL9mD/ZZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba122ae7-24a6-4c30-62d1-08dc302d549c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 02:57:23.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlAgCR17cDqKMWnb3cH5pqm5hF6m0f9zrNhCSUMLEHp4Wmhl/bLo9rm8DyW5KAywLsgjT7LU2kYDeYVoUIvERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-Proofpoint-ORIG-GUID: -HiISLwsQRlE57iaMddOeqiCsx3ROzp6
X-Proofpoint-GUID: -HiISLwsQRlE57iaMddOeqiCsx3ROzp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=854 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402180019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 02:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195819

From: Chen Qi <Qi.Chen@windriver.com>

By default, the tests are built and run at do_compile and we can see
errors like below in log.do_compile:

  gnupg-2.4.4/tests/cms/inittests: line 99: ../../sm/gpgsm: cannot execute binary file: Exec format error

Note that the do_compile process still succeeds. However, we'd better avoid
executing these target binaries at build time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
index 5b9869b4f3..fff7d8c6da 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
+		--disable-tests \
                "
 # yat2m can be found from recipe-sysroot-native non-deterministically with different versioning otherwise
 CACHED_CONFIGUREVARS += "ac_cv_path_YAT2M=./yat2m"
-- 
2.34.1


