Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFA1C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 12:20:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12909.1717676435898518592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 05:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68873e2400=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4563mMjm021165
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jun 2024 12:20:35 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxd8aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:20:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpktterBryIF3xkO+bMLBZ3z+1fQqLN9I0EhhB7+XZPg9gCBToSJRgUeXfewO/Zc6Op4ZVUXm33E+SyIepY5mEQUMajQCRyJh6hjUBP4PRaSkCT5zQbKM1VOnmPH6N3/WbGRr7wXm+FW9QR1BXZn9pniVxMBBDe2YaMqs9SBJoJr/JK2V0CcR7bV1EPvpV27mHuA7VYv1i7QVtHFf17uBV4HawCy4CbRSqQTyB7CqO8Njif97eJwrFjK9RaZNEokpSdsAImeC/PccU0pXt4/W9emEtS3YKFEPXBYZkpxvnlIMi7xnVSahInHEr9IPBQezmnU68Pjjanl+A5AK3QY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aktGWpa8SD4OTscwckNKYyReLBaoFNz7GHabjFrzWk=;
 b=Xt6FeaEByk/UoGlEfuls/SE3TYEvJeYxpQYfnQduOdfZPQQkm6XilfjdWDxk1u1xoH5REAid4bDH1b8zb6h9S2ajm+vW5k2DV/6wWlt8Ba0AAhnZKSI21+5jlfNoFlmBvfNqxX4Ox3Oi5Co54Me9CDhUpGqbsuwF0kjUeqpa/1j6Nvkt5usnHsI3MPijeNoy0WcacwUfmYPxZ5ew2poBApJByBeVyED0Xn6P00WoVvL9ng4K64izZo8FjsgTRoRgu4OD7fvVN7Mdf0rW1sFoxCYUZDk30KhyirwPTud1czMgiH+uVVevYF4lLz5j8GChlef6Pzxp6YpEnZw644EStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 6 Jun
 2024 12:20:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 12:20:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Date: Thu,  6 Jun 2024 20:20:12 +0800
Message-Id: <20240606122013.145187-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:404:14::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: ec312ad9-f73e-429e-fde9-08dc86230e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G8cMefXEbvYTWe7OFZ90Bf7s0X71ntwKM8YaXcfzwdFeQb7NfQ337Iz9fmRw?=
 =?us-ascii?Q?Q68J2GVCE1v27hjHb22NYISMZm3qMmVezkWAkCKr/0mwtIC8l6P64mXggbM9?=
 =?us-ascii?Q?6AHqWdp08P1qIo6gmxmqfNdUtwjj+YqffToHTyzunbAPVnZzM+8JoiBRbSlD?=
 =?us-ascii?Q?mxAeXqSHC0v4d4t9nlI2epkAIWy9J/9Rse8j9j1SpdT9DFCxlSqpO4wX/jn1?=
 =?us-ascii?Q?XUBGhRHHcnJpd7ki8ri4Q2v/L4Uctsn7qFjcZ1lFdzQGc+sApBJEW1gyOGD+?=
 =?us-ascii?Q?l3c9UdxME6iifpp416RtVglDfeuh1KSUfoNOah/qTTlWCN3hgDoi+akMxWug?=
 =?us-ascii?Q?dpxLyfOcSDr/ig6yRSrTjffs+y7vpn7XfSYxZWqES5Jo/j9LtgpELTqFsvcI?=
 =?us-ascii?Q?OKeHBf+sw7+LEeTP7gqrz5fwzDHPYdT+JunS4hn2rdhF4TS+J/zcS/A6z4pr?=
 =?us-ascii?Q?TFt0UXmkRfcqZMGEevCzYKBs0OmGYrCMylskdOEUMYciRkI0sQ8WZYoK3htI?=
 =?us-ascii?Q?bEwiZV1xTdHnkIyTbQc/XNo6uWYNTTXV8ADsViTiGTTP0l0nAGIR1op1vWxb?=
 =?us-ascii?Q?S7mItwY6GBVpIGFL0IideeKFUsaNKGpmmGtc3D5ASNRl29Mtw+FbpC/MfmXI?=
 =?us-ascii?Q?eZwsP//9xEf6mf1CRe8cPIAgMGB3eML7HoVzu6PauA/wjoD5jlHvO/aHwaxW?=
 =?us-ascii?Q?iDsmOTo8+FDLplAUorF3FX4wj57Y/SbDT9o57V0O0J1Nmy5a4A7HZ6oNKW63?=
 =?us-ascii?Q?4D+rHmeLx5fvZmxI2qNmEzC6UHltZbu3NkLyjIeCmEfk56yiW2Kbt7W1jI/c?=
 =?us-ascii?Q?2By+ZgKD+DYdotrRP4MEs88jIXwPdT1680PZ06pZX5ewwaIdImeb4h/fvABf?=
 =?us-ascii?Q?8gslzMUz+tdVCcB2TfFOYSygBS4uDlwh2RO0PgofMitsmC+av54QhDfziAuE?=
 =?us-ascii?Q?smJuOW+LfJd5S77Wjxhl+ZGfd7mav9U9yBaY8M38AQgA8makPG6Q7XVIiS9Z?=
 =?us-ascii?Q?VdzxC+G/VHtJrh5y/U0YlI5LF/qa+6dqc/2QFESbZIYforp58eftlD9TS+jX?=
 =?us-ascii?Q?oIyCmz+sM8+GHTJGKiJkdJm/l22BD1GnSOkXKtLCf7/hLMuJW95Zse/vtG/l?=
 =?us-ascii?Q?04qfyM7WlhJJZvz6t2kdZJYfRW8wtQeqzDfePrllnQNGNyGFzYeGkVHuMexN?=
 =?us-ascii?Q?VWyleXtFFnDhXi3v86+q1eMaLAM7r1sIUHmqDg99W4TjSc/XABbJvOdxJkn6?=
 =?us-ascii?Q?OuAKlAKN5bqJnijg1Q3ozzNWfwf1+qYLz6YW1Xt//sn+vl9k/hRtUIROtKAB?=
 =?us-ascii?Q?LVNeT7+yOIzni7hXc7IYO4FzdPg7IqvtUDVHOvfNngyeyIlS//cPVoQBDq/S?=
 =?us-ascii?Q?JVkNmuQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u2Eto5sp8cht/VU3LZzmM5AxXtMo6LYiDo7QOak4ATX/KRLu3QE6wWorOkyn?=
 =?us-ascii?Q?49uqWPchyd1+dt3U8MsRxL9qgK7kNv9QsANuzc6KbvNYzWf5ZkLg7EJh7fGO?=
 =?us-ascii?Q?f9ljtKv7vmioi4uTzikDlU7FflgvmTW83NByDEnWnfZeWFmLG1p1Kg/urY0K?=
 =?us-ascii?Q?7h3+mh4lgzvm/fKHbag0DB3Cmt72DfKNNmo7yPj/Fcz7IyJQIKWvG3dQF9cm?=
 =?us-ascii?Q?nJTUzavLAofzM7ny5LvYlAwFVU5u0mXPvjbpmcecE28YPMhlSfz4z3rgnIVQ?=
 =?us-ascii?Q?twN2s48zoGgzrMzg+GXiMj1QRP+3XZG2SAiuF9g0g/ceBwBFCPmGI6muyWYp?=
 =?us-ascii?Q?Afx3MXU6mD/fQ1ZLxuSS3TKA4R5mH1HCDTZ+y8E3yVCwyYJRD4EAyEgtJh5g?=
 =?us-ascii?Q?iB+hER8o4pfbBrhXe0KV6J94uCWKHmTHBANhWYrvTaxQAaQtFx4lB0Ycp8mB?=
 =?us-ascii?Q?dG5ES0xaxsQKdpyNKKvaZGNtrIG5TV4uuW5BjwSc6R3WohunnqOosIZeKp4l?=
 =?us-ascii?Q?3/7d8qPT1AX6Cq0nXT2VVZgbehoFxVGlW7hLiDpMCAwf9V5fb0+bRs2o1TFS?=
 =?us-ascii?Q?p0CsHXUsUhhHajI1Q74gycxQj2z3E7g6O4IRPSekbCHu5kXFj+xMdx7uPkqG?=
 =?us-ascii?Q?xZvvsniBBx+u76Ubm+TCrl+CWBAtYljOnV+q9v3nXhEeJGFNcrYkcNCa4TZX?=
 =?us-ascii?Q?QJyyoIWJsCE54wha92lZ0MWCfIGYEjN+FVe33sQI46+PFZ40g0uyhS3Vzz9o?=
 =?us-ascii?Q?AqJAKsT3W11s+PicTDKkANqAfeWmZl5FC7Sq0fwsIHWRYAXAtjX1hlQ8+djZ?=
 =?us-ascii?Q?vrM+1Q3Es3SeC23Kh97JRUQcN/ZEf+z0L8xCgIAxx81shCf4arZLZDKmtvoN?=
 =?us-ascii?Q?u5WDS6KA5VjCGrsn54jxO7N5zqnWmrX41Yi5fG75dqJN45v0wUpbivFm3jgq?=
 =?us-ascii?Q?oW5tWLqJ36NxfdlmQyJwO/Q831z5wQt0ld1tUHKBypROOftcvf+y583YygbO?=
 =?us-ascii?Q?HDtUHQwIMxYE2PzGQ0QoemJdot0Qgdj+Jlg4D3XIlwAoUGJVhUOJpXWIwW2d?=
 =?us-ascii?Q?gXx64WkGQW26k2OveiQ6YUvTCFlQngiLNTZTtjkGgifjOC99KmjsptQCGv7Q?=
 =?us-ascii?Q?cscvP7tzF3OcntTIiXzUl6u6OM+2pXfCOP5vm5OJS/l7qsbxYPYMn64AdCUn?=
 =?us-ascii?Q?/0Muww+hOC8a0fc1112p0b1L8o8fPxqrj0JDZ2L+hGZslubrDk6qZL32H1jK?=
 =?us-ascii?Q?omZfQxFYtLZsP2mq06fa0+tyBbQ6nb3GIowHhDM/11DRcYYiSm8E/WQ4VzMA?=
 =?us-ascii?Q?vS0aC4W1QXDsMyT+Vl31/RkprlmPuG3zXSlULwjrpUllqPOhXOKXM+1yv7e1?=
 =?us-ascii?Q?lVeqakBfgOK5qeVOh8E3doGczfsH8bGHWB+8rHwaeAmDWxCShSRm5JULvTNf?=
 =?us-ascii?Q?8XhshnizDz+l/ewyJLnBk9j9bO2kNa7YvchriFxTu61X3ktjvkKOityJQVaI?=
 =?us-ascii?Q?6ydfS7Bk2g9E4BJqiAtLHF/sLbLj+3dpwAfiI5WlKAjLG4pQSc4AkNdymf3y?=
 =?us-ascii?Q?EEVN/fA0SnYxEkFrhNlFzqSgIha3xpYRjnNH6CER?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec312ad9-f73e-429e-fde9-08dc86230e32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 12:20:30.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuN93/dhXswVoD/N40xBChKiQtNcSk9zjo40DQRc69xu14aIAjMWnn88rnPPrcqYi0jasQ8JZYVxySRihUyvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
X-Proofpoint-ORIG-GUID: 65tE04OWdXiNOtkQoj6DmdGN8iGQG0pm
X-Proofpoint-GUID: 65tE04OWdXiNOtkQoj6DmdGN8iGQG0pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=911 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200398

From: Chen Qi <Qi.Chen@windriver.com>

Previously, the noinst_PROGRAM getlimits is put in coreutils-ptest
package in order to execute the ptest. However, this command might
also be needed by other ptest packages. As an example, findutils
4.10.0 ptest pacakge would need this command. So we split it out
into a new package.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.5.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.5.bb
index 9a5f836ebe..178dadc3c5 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.5.bb
@@ -76,6 +76,11 @@ RDEPENDS:coreutils:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'singl
 # regardless of whether single-binary is in effect.
 RPROVIDES:coreutils += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'coreutils-stdbuf', '', d)}"
 
+# put getlimits into coreutils-getlimits, because other ptest packages such as
+# findutils-ptest may need this command. Note that getlimits is a noinst_PROGRAM
+PACKAGE_BEFORE_PN:class-target += "${PN}-getlimits"
+FILES:${PN}-getlimits = "${bindir}/getlimits"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
@@ -109,6 +114,9 @@ do_install:append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
+
+	# this getlimits noinst_PROGRAM would possibly be needed by other ptest packages
+	install ${B}/src/getlimits ${D}/${bindir}
 }
 
 inherit update-alternatives
@@ -204,7 +212,6 @@ do_install_ptest () {
 
     # Tweak test d_type-check to use python3 instead of python
     sed -i "1s@.*@#!/usr/bin/python3@" ${D}${PTEST_PATH}/tests/d_type-check
-    install ${B}/src/getlimits ${D}/${bindir}
     
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
@@ -216,4 +223,4 @@ do_install_ptest:append:libc-musl () {
     sed -i -e '/tests\/dd\/no-allocate.sh/d' ${D}${PTEST_PATH}/Makefile
     sed -i -e '/tests\/split\/line-bytes.sh/d' ${D}${PTEST_PATH}/Makefile
 }
-FILES:${PN}-ptest += "${bindir}/getlimits"
+RDEPENDS:${PN}-ptest += "${PN}-getlimits"
-- 
2.34.1


