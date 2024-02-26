Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E17C54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:59:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17045.1708941584216863042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 01:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2786b44cc5=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q7Q2fC029240
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 01:59:44 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumhcef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 01:59:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOrrNKx1OAmiswATvljq39Ykh4QG3Hq1B751AywzfHmQxU7wUdBG3FV0y07yGi41Fw5ayk7xek1QEPTegjjpttESgmBpbwJS4n/tuILQbSkYq+hdfSmnPcrzlwibylaJBIPZfcffbn0AU7LJxg5nWaCTP5nMRRX2t1to81EdbER70xwo1MR5+inux8QENFY+NLIMsjLVSBVVxmOxJPpTkrUQNX1MoEQHoFL5lIyCBwcVEqul4tN0xaLmvCG+Kq5VooTxeN2XZVhJfb58EaiIc4PZnMrxQyeec+p+npWyE3+EiLYTTW3uU2hsY+Lpg+TNbTYovX4/qXiNNTZb3SLEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2GvHEVp05DQaU1BiVu+tvQttnMVkyAEPE97tI7UocQ=;
 b=S69PgrCSEjwxYumUvzzcWvt91w90M+IYzFou0LbVXVTZYZt6Ru9LgZE9E4gK0ENqKsCMSwlDCQGQW5CwrWRPETtLl3EdiXCEJPqCnZ4u9clssu1+D8WAiDGGAoUSXBZm37XxKvCALQk47ri40rRBC2P4c5UJMQaQ1RmeMEfg9jbn/gDZSrXwuXoIxK/nx65ptBe4b6NmN2fa94wvADiypZFkc9Vi4j0nEUQRN91fWZmlZsALPROvhwTgEpPW6/zHnBamAkUojU4q8QbxCkwQhcVmRpT0GRjtL9yTBdN7PFp/qjaUKX40oV/NTI/4VKiZM/Rlg0GguFr1KhQibTi2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.13; Mon, 26 Feb
 2024 09:59:40 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Mon, 26 Feb 2024
 09:59:40 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libc-locale: fix ASCII compatible warning cause build failure.
Date: Mon, 26 Feb 2024 17:59:21 +0800
Message-Id: <20240226095921.363844-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d81cc36-31d7-4a37-e414-08dc36b1a5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ff+1CHXsMaATcnQ0qpDhc8n9SNVIU0o4EwfcRQs4FWzerL8bHITYNU7968z34tgG+SzjioIq4jlBIn4R+PSiDEwG9RdK9i1GHPINkf+bnxai4+4CrlB+60xiO0T3GcyYRylJCTtAHdIRM+Qxph7Ee5V7wCEj/oRrYvzDh9LcPkOEwhjxOdtbRaO1DUS8j8nMbPVbpGqhWd2yZLGIH3E9dUtUCm1r/xvtbPLsAk6O6SCHmJOKwmCQ9FsmHkkbzzRlkjbfNwP1F9N6YuUZV9+lW4aLCq3ohADMd6PPa557Q+kSsNQWfc3EFWCDa51q8TnYOSTo2HuVVvf3E9Sx56aRelkSgMW0JTrZuPjXRcj8YMUIepYb0cxVbz+8snHDxNMfxnCQO3m+O4iCRA9kgGz7AS794hL04WZrguKbNvUKdq4D6PWcOeC4Q9dwHEAbzBUw7424owIdYKW37Ne75AN/fHmv/SapueZoATYHuC+4fA+xT9BoGID+l1W9eq7jTKICDvjPEaJjlj5quaCi3aT2qAcjEV8yHgWeiQzgsMqqhfrlJY5IK+s4uNkBiS8ZUHEnGLBRV//aQRUyFwTvgszaiG+2D74/blZMUNT0e9JAwT2I9/Zwq93Z1Oc4XpUi9BCaO4B38mNPEf4dB0qUWOurr1ktW3PJjc0UWK5amGkNSMb35jVjIIbljxKLqVeEVFFySYZye8+mI3EYvSQNNUxy2Ovu3dy3JFPO5SBZl0XAjw0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZpJTPvVTKW1yF1ae7OKoUJxQVa7XGR0RIJe170/aEyM4NmDEebL0w/vcg4cz?=
 =?us-ascii?Q?mwxuGc/VOMYVjquaYJKRUsEPOSQXkyiVFyvoM2n2aRic3c7Pylma8Qii0iou?=
 =?us-ascii?Q?RCE+y5I2yacYQb1fUZlnyUnJcB6O+n31Ge/EUL3ZFh8NcbxSnUKjVifuIyFK?=
 =?us-ascii?Q?o6slnn27GC2hYu26pYfMe9ICr/YqlIVPVrzoxXall8keWpYEiScGbtz2uZk8?=
 =?us-ascii?Q?N8k9fUuqna5FMgyTiBg7Jo0+nkUdJ6/MdnMvoB9IsSql335sjug/MmIXM4UQ?=
 =?us-ascii?Q?QU0W0S5Z5uHQrxpTyC1guiwMsbbtxIXav1+UDBwxYDzEhCMj8+SEbfPZqu+2?=
 =?us-ascii?Q?WeTkYYqRqei8wADMW8q6Xnf55s+q/j8SVjIpliML2JY7SkTQ3F2Cd6RFzuJ+?=
 =?us-ascii?Q?vKOtXJ9OEwOep1RnITw6Z0ZJZd91U1G3LoWlub6P5w50GBemMopf9MHcC6N/?=
 =?us-ascii?Q?VEOec50yV/5rojWbF/nnav2tqCW9Y/eZTdFRAxEqLA7dTqVk2qC7a0nt2k49?=
 =?us-ascii?Q?sq3eGPfBoIh0TfCcLkzdJ5XbA9/TMgWylOG+OYp4BMgzd/U4JTS2CDY2jt0K?=
 =?us-ascii?Q?uor88EHv/9bbcp3HdSbKgw1yXAX0/mpH7uR8q4XM7gVNJtelm4SDOy+h5HTn?=
 =?us-ascii?Q?mTT2aXN0CysUTh5JCChbLsOK2yvXrCa5KRpnRj/8dugJxtS99hITOsUli2om?=
 =?us-ascii?Q?Z3/a0jPB/k9b7aeMF55n54APCTUKcHeU1r20o2UGMQxC6rWxR3mP48OsK4i1?=
 =?us-ascii?Q?HnPVg9UWoGLNQYPlCRTNzyhY5YP/FlNA2yDU3WbbOoZ9fSEYIsSvD7CEsSa4?=
 =?us-ascii?Q?XuEwYhJJoXL3Kmwwl6R1weIWmE+MhMYxhLnm7gCBi5Gn1vF1epaMauhrLDWr?=
 =?us-ascii?Q?6XgBNJn/HxUHmoN32Rt3NlzcYfrBpTtP0Rteln7UgQs0RBs0nOzeTlMr5+pD?=
 =?us-ascii?Q?x3R0OBurJYSz4bY/Nyc2c2CgVE5NloSfWVpQVgeGk1ViQLn8PWyx63BAXfjL?=
 =?us-ascii?Q?MsEP4XcczXBOReR3WlkUwPKfmgTMWM9QywIvqQ0yiBsKGTb0qZQMv9QDahRV?=
 =?us-ascii?Q?4L62HuMgSX+E0Lm9fkpbK115jPbUBFVoQ6KIM070aolphbaWnejRY+YBQHrc?=
 =?us-ascii?Q?8CmgiF8Lgsx1LLzhozkeenl/7jgkxqnuPS3+bjbGBlUsuZBkMiKHag4DiKFz?=
 =?us-ascii?Q?cjo2cWcnG4MgX4LlmEOvaAXjCyn9rcI+zb1hHhW/ZaLlGyGH4fe5QxPtLx08?=
 =?us-ascii?Q?y/4LP6qMzx7r1njzCQXevA7LceYB5Kf7Gn2u80HR09dZ30U5Dr5litqxKo0M?=
 =?us-ascii?Q?eBuorZ6Bi6SqJSlTn3Z0U1fZOe2XPO5DgRuFPqMScW5bcCNPoArqd9TgAQjE?=
 =?us-ascii?Q?mJGV07VMIdgU90SG3nzwiQtNcX7Znb4ycq04Nd0QaQfd9rAlvjOAX2c6cWcp?=
 =?us-ascii?Q?Id9VTXYnxXMidiqo2GOAHcYIPLyeTrscPpaOw2ljrxHPzUbsSCoOZObFjBDO?=
 =?us-ascii?Q?Ut3aUUaSqezQMBRaXt1EeDk1iM19HGtsJL2K5OSXXRtVW5y60c0Z4VWLwTpW?=
 =?us-ascii?Q?OLJkP0AYx2f/0cUeFmLAs6jf/4HvTH5VuNBx41WW0cBiXeNfxhUdQFx12R7r?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d81cc36-31d7-4a37-e414-08dc36b1a5df
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 09:59:40.1718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dztGtMDu68tBgRzwuQ6dG5hwaQOdj2uOXCRJoBupRfJRprU0ueSrMtddlEHzggZMNgSPC+P5JukpGMwntFhekPCGw3xo0FM5SQ87lxikLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
X-Proofpoint-ORIG-GUID: QFh1HNlKtsKU5sy86LpYv4irjiWsyP7q
X-Proofpoint-GUID: QFh1HNlKtsKU5sy86LpYv4irjiWsyP7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402260075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196197

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Some locales are not listed in glibc locales support list, but can be generated,
here using ja_JP.SHIFT_JIS as an example. We can add following line into local.conf
to enable and generate it:

GLIBC_GENERATE_LOCALES += "en_GB.UTF-8 en_US.UTF-8 ja_JP.UTF-8 ja_JP.SHIFT_JIS"
IMAGE_LINGUAS += "ja-jp en-us ja-jp.shift-jis"

The localedef tool would report a warning and exit with 1, that cause build failure,
error message as below:

[warning] character map `SHIFT_JIS' is not ASCII compatible, locale not ISO C compliant [--no-warnings=ascii]

So add a --no-warnings=ascii in libc-package.bbclass to fix build failure if someone needs those locale
in yocto.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/classes-recipe/libc-package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index bf160b115d..c06a2ce90a 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -278,7 +278,7 @@ python package_do_split_gconvs () {
                 bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
 
             localedef_opts += " --force --no-hard-links --no-archive --prefix=%s \
-                --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s" \
+                --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s --no-warnings=ascii" \
                 % (treedir, treedir, datadir, locale, encoding, outputpath, name)
 
             cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
-- 
2.34.1


