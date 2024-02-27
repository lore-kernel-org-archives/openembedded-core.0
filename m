Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7D5C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 08:57:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8305.1709024263098414995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 00:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=278765d1f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R5Buvj028836
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 00:57:42 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42phc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 00:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD6uW60lAkTYdkbpgVpBFRi5bXMU4b2B/mQ4q1Vi3zNANjB6DsliptOIcecsccGi38QB02OFtlg4d7LsCGd58MdZAms7V8hg0ehiUo4aOqwbKaM+jFBGQFuNb/t1+hou0KkWOQO9le0ykSwtYXwtubr57UHLMxtFRSgxLGRzCrXJpwfWI7QOd7s2yG6LT5TZ+wFy1A0bBVna5O5kxvKTWfbvEJRZ8t89B0omXTPjp5jl4nZS8X1Zt2+R69qs+UyBLQOdZnFYTQQGSjg/XxtyVIxIB+f5nsy+RpUaVonhpI1bIwqqCbz1TIGBqZwEWRnL/1sOa4zCcxbUhvYeB4ToGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HazMBWuyyLxFPUDC5Cj66bWNv9cqAVu5ApXkFobUUpw=;
 b=h6G7tDJhCjQBON7fTGzHRSD4plBrIgn2EB4bmPyqWoTix01BBNI7S9ZaXFdhpyrh3BXAb8tNyyL7Vz6KIrmacgPwAgkzQghf151gOaEpLO+94CEMeUBHV+KJBGVpK2e68Mz2RthZ21UBf3LpLqF/fvIzKvyB7/LljRRDumWGHVm2sEIqUTSqxRveo132/Mu0ffW2iAyfG22tsTwIiG5CwyDDv273yVf75mkq8Afi+lByaBwKPacs73AWCM3AR35LzlVRNZqBqMm+DOj34ZBpeTI2GUdWYEl3cPCVbR/jW7GPy7gqe+vRvr6SSKE9saTv8oDVfmgQLXFDgLYSFJKbMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 08:57:40 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Tue, 27 Feb 2024
 08:57:40 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in run-ptest
Date: Tue, 27 Feb 2024 16:57:21 +0800
Message-Id: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: a8be9dcd-da32-460a-c8e7-08dc3772273d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NBvhvpmVgdoScVTWxmAy9Y1dhkDUoWqfwmloVLavEYsBVk9zrW8n2/7dppnrMOUcUs+Q3i5ZVW1yu1bU7tDcZ4z1Ehzt1JtPHmBDXKjWtSvXznN9Oj4B/iyoUlwH+mJrTRSJHMrwpPpVtY2iN2lSQ7KxGAVVlPCnviZ9/NL5fEyDhLmzDTNZz9spRea1jZlYZztnD8+NMO1+k0bkTw01Ziv39epna1XMS8KFYLfrn48na6RwbgIsb7Soy7/1pSvuzJCNqjq7891JEeqRpYWxK/crzJwGeKpqmXfsxzp9zteXyGGbQRBL1T4/wZGiNxjOmkgm7uU5S4iCX72gnTxU4hNlvPGNOB0DqswWCr58n+8wKSs4u2UsOguThQm1nPd1+WvoGNvHn7LuQv4J/Eqe9vSacudbE9+DUW1v6o27ASzlvpWlwHQv9HQLv6negGLa2nIQtkDE2dsbWYstrEgHwggIJPaOuDVjYXNcts2xRnsErFjQI6iOPv3PArO91cAwzWWSYyeZiCXlNXbIIeOt7/P2clJWo8nOtwVP/srMZtIPCqIajt4vdwhr0ljEXvSrDGAImfS+/pROcUTirCR37dFUQH3Wmnt0Ix3Mr/y3lR0d75xftN5zxybF1eALMrxGeojwpEjCo6gQCFHJEiOzOSAQq6r5gDOhT7iVugBJXmWaBFTP0MhFLUMf1+xLDpBfjm9LaOf7eto2dhB5KH9LBd1vYwqb+IAyvVfTZoaYkMM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iwU5sG3tHxe38uikhaACgGCTBHTC6OI48P4hl8R0w0r+lKHWhL2QEIGZsfzH?=
 =?us-ascii?Q?CvTPMKbubs98g/BABuhiw4RgUPMv7ReI9SnsJCfxwvpzSJNk7Dm+Fl19/04E?=
 =?us-ascii?Q?sKfFXYxwayT1UELZZRu19JigE4oAoN2zmDo2wFv3nwUHwOdJ2oTm5Yvu9ieL?=
 =?us-ascii?Q?v5qpCRpLsXHb+THnQdWpF/2b1/IUDYTyXrrmymeVhhAeO3fLxTMEV3r1EB0A?=
 =?us-ascii?Q?SRMFhBca9hUWRpP2kPQ07GjGL9qiWhoQRG/enH8SGmsA7cUr5+LmX5ydqzPs?=
 =?us-ascii?Q?acba/pRuIh7zS2U675XD7M6rzfYZKokegO3Y9oR8MRVVLwojrnrf9nqTuJ/V?=
 =?us-ascii?Q?pIdM/it1qzpPQialLwARJvmljorQkTM502yXpqFVQDQ5VDbSrhK5RUMK3FXU?=
 =?us-ascii?Q?IGO4xS3UrOIUNoM9ymSQC2/bZNxvXzOa8UTN3KRXwz4y+TZJsNOWWyjp6jSs?=
 =?us-ascii?Q?29L1Lm53aZLVCPtvIYizRnxZPmO5YQKd0iaOBS1z6L54QXrAP5Av8sdTGxkM?=
 =?us-ascii?Q?gRN8jDDqfXdLjgqkoSxFfJMG94Nx7zNtWC6A8xMKGNb/5uE3rZ3ULewj9u//?=
 =?us-ascii?Q?LCmLi7a92Vo5thYrEh19P9I0WIlx6U9QD/JKXkVH9/W5u6IC78B/EjZ3eglF?=
 =?us-ascii?Q?BXQaRzhOGOmKqPY4te8Vg+hH9AuRwTg5gy9LPBDkWMyeSqK2B7YKcQI1q6ly?=
 =?us-ascii?Q?4XUjQ44E0ibDpnoDeF8D396lxXEYgvO9vtZhDQI7AA9l7nXjcN9i1yRTrxhP?=
 =?us-ascii?Q?iyZHWNQ3CnTjUXEty7NfvGxeGGmciT38RUUB7dv/sUfak7qGOYBC78sUVI7E?=
 =?us-ascii?Q?dRyv9zRDXiFbJengSLP5fPhCJ7eyATGPKcOI1yDAtpaQ0WsGUi6RXkL/TdnT?=
 =?us-ascii?Q?dzvvEz5Zuz7AZnXH8eeMdv150zLnsOlpRRJg/OpOE68IhSVXWzSX/bd6X5Pc?=
 =?us-ascii?Q?+d4nqxzF3ldKnkS+QBB2g9WMFfoiLHJ4s2vZt/nF2QXeLYu67kyO1BRU171y?=
 =?us-ascii?Q?Epogk6Qi+Ze3qrwApgQ00g4c8j71qY54kfUw9L8CPSxeYJHIQHtezWDWT2mI?=
 =?us-ascii?Q?azYJRY1EbHZw47mEXCuyGT3Xq5x0+7tnw/soitFfWY/Pie/jhHViBAVHqNGK?=
 =?us-ascii?Q?LA6xSTlRzTlvlmoXSl+QethPskFYcpxz6A64yJMhTTkIsVFN1U8YhsFXdBC+?=
 =?us-ascii?Q?EE3aFy/IYc5Vtg2XjEt4LIZNAXRP4OEytMnC7DFzLwsqzKC2k4X3AzTOCkmj?=
 =?us-ascii?Q?LxnutcGUoKuRXOHLwh/RmZ68RK8OjHxEkpcBStvkykZr3EAlOGM1tuldcO5L?=
 =?us-ascii?Q?BUscdAek7eWrvs0rIWMFiqWITxxFF955HRCXte4DT8LHVOFWr7jvHLAXU71L?=
 =?us-ascii?Q?TENX3T2sZ6oYV4MZKfEYWGsakt1sHTTEe3Hh4TJoBEqnBXVJkpItbWQTyOk7?=
 =?us-ascii?Q?tWVKp351cfDTCpRPSIL3gqp7UyMC4w5u0jgLQs+FfExLqaqzAWoEkqUJpw01?=
 =?us-ascii?Q?UmauYKSc0F2gmrx2cwA1b9qcThV0EyN+Ae1aVI4DYJZxlnjYvRJs1yJjuDSr?=
 =?us-ascii?Q?XHXPYOOD9+bl9a9T/58cs4kKrlEcuCqg31Qq+3j4XELJ9CfTmwOUhH5bXps4?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8be9dcd-da32-460a-c8e7-08dc3772273d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 08:57:40.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13o/uGvlfR4hNuCU8Hj6Y7qpMv33eveDamaegi/mMaA3aD+n96QuWATHQ+a2kZit2Hk2Neantr0XsMidq/2IFD1z9YgAXrtYXEuAM3AsoQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
X-Proofpoint-ORIG-GUID: w7p3iTjSzapRwUXOvq_7y42Ez8mCOrRW
X-Proofpoint-GUID: w7p3iTjSzapRwUXOvq_7y42Ez8mCOrRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 08:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196244

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Bash has a test case that needs ja_JP shift jis locale.

It will check current system has ja_JP.SJIS locale or not, but in yocto,
this locale named ja_JP.shiftjis, they are the same.
So create a locale alias, making ja_JP.SJIS link to ja_JP.shiftjis.

Also add warning message if current system doesn't contain shift jis locale.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-extended/bash/bash/run-ptest | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index 738ad3c42c..3cafb5e2ea 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -3,6 +3,7 @@
 en_US=`locale -a | grep en_US*`
 fr_FR=`locale -a | grep fr_FR*`
 de_DE=`locale -a | grep de_DE*`
+ja_JP_SJIS=`locale -a | grep ja_JP.shiftjis`
 
 if [ -z "$en_US" ]
 then
@@ -19,8 +20,28 @@ then
         echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
 fi
 
+if [ -z "$ja_JP_SJIS" ]
+then
+        echo "Warning: The ja_JP.shiftjis locales is needed to run the intl.tests, please add it."
+else
+# Yocto generated shiftjis locale named ja_JP.shiftjis, but bash's test script using ja_JP.SJIS
+# They are the same one, so add an alias in locale.alias
+        if [ -f /usr/share/locale/locale.alias ]
+        then
+                cp /usr/share/locale/locale.alias /usr/share/locale/locale.alias.bak
+        fi
+
+        echo "ja_JP.SJIS        ja_JP.shiftjis" >> /usr/share/locale/locale.alias
+fi
+
+
 useradd bashtest
 chown -R bashtest:bashtest tests
 setpriv --reuid bashtest --rgid bashtest --clear-groups --reset-env $(dirname "$0")/run-bash-ptests
 chown -R root:root tests
 userdel -r bashtest
+
+if [ -f /usr/share/locale/locale.alias.bak ]
+then
+        mv /usr/share/locale/locale.alias.bak /usr/share/locale/locale.alias
+fi
-- 
2.34.1


