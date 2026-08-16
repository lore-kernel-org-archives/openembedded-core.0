Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA4C5DF7E
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19639.1786921884543454055
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H+Fd9QGk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMUrwZ700047
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=B1comeXR8
	eJNJE26FcKxBmG+rrGZYUL12pcZ6s1t6mk=; b=H+Fd9QGkcbxaPqk5PyhKN5V5o
	u6KMlYAtbwSU2PpatwewNEk2pu8BA6AAxvJO2sFChVNyLhplXPSB0CQFBuhF+HcY
	LXcyh/bKOtC8cQIx7x+j3AKQ+oEqoDjWMDV1yv5qEeW34gCYEMTc7zgz0/46/QpZ
	EWxXQ1AqvU2tkaqNbmwmU0hhFMlyzI4IiFJsXjlGCgeCtJXDfzzG40rcLnRuUnjK
	aFw+Ovm20koh35LTGT3Y9djgh8DihRABNdt4AqzI99IbexIT0zr2SKVaLJH9Gnx6
	lbXvE2V3F8sO7xFAx4qkvF0BZVzrr/8jedi5JMghfHrY36S6XEpTFgPoVZH1A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023092.outbound.protection.outlook.com [40.107.201.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ss4k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTYSfaXQ1rhRAqlA1PkQ6lIMIKGAm+DZuRy/QVT6+bgF6tiC67TEbd65bApvcUMNvIIE1uLEueUIgHQKLJH96dcc93LRdohxwgf8TmFyBhfiUFT3qjZjZQH+XI+HAh3rBQdBCBeifo07KcIhLBJVgTQ5N0A028veUnRShe3YgXVQI0hX5Mkkf4c3+8wYJc6twzSPt8An3zSrKNDiAPKW1PpXRq/gxv8K1sUBHXT+s6u1OBW9XC9o4A6WQv3ZgC/4zbRkefR6/JUip9PfMDsooaplL8gdJTHD+PaqCtMj5bkxtT7QSPKgSk+LNK82Ezfv1WUo0wfv1e+leRMUdwIisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1comeXR8eJNJE26FcKxBmG+rrGZYUL12pcZ6s1t6mk=;
 b=S1ZzSWCXkZxVVLF6lmCFStzOXQQicitgTcvCzbujY/qv/b7VM0fs/xed+c7VWD8eUlEW/kU3IxojcuoRHhhQz3oRbP6aGd83Dd9JIAYVpcxxt3cX/tGamNqQN37DNNHGhWtt6VfWL7Vs1OQZ9Y3Z6XSUFOTSEInxKsYqise5Quq7qrXJRhT85ILWfb95jLkh0d+USWb4zjmelboQVf8BCTN+QebfkAHQc5XFnQVOfUSOwlHxca0h7gmXbbWOjX3u0fZSKCAoj2uqKRh4K2p26QmwM2BMHpccD1cpfXFqjH6kiFlk/YG3o5Zk1C5fuNY5MUvI8q1GwEEDxD4SKBOWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:19 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:19 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
Date: Sun, 16 Aug 2026 16:10:52 -0700
Message-ID: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: ed138545-5909-4425-703d-08defbebae20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|11063799006|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Bbj8w5zL74g/2ulQr/Mi4uNpTBZNwppxyLWSAE+BIoaal7Lb15h+StVUxz3RZB3vx+bhqKb47CPU0ydjWwSZNoVvuGHgoDFF7joG7PHrCk2e+DOLQby7NDyoqpbwmpheL/e+oY0juOKVHH4+kgkDef9EjlsWVnl3xy8wKVSLywqL0EpLC+mP5eTMWA7EQcq5FtWkmFRYWuTNb/xyE8mJftefKv6einq18UVvgtQ51+IhF5oU7vL5TJ4RUA8foOThlxc0USTG5Bf9Z1KWd81BjBbfeoaaRwtkSMOUiM/4MPMxFB7LwP0jODtswjZ3K45V/bEQfXV0ecyQj1YlJ6qJacJx/+Hjq+PVYdjsdEn6tJPdxIGbqUNNJO25VkYEjwaNn5j9jSdaIGlVngDIL1N/SKlGCcu2q8MLNSPVtcZ9MkAfMQ749tF/IUw8dPJedpc+K6HiX44fpQ7Y1+UJUIWHFz67IUWtTvPo5jUZg45RJ+VV//I9b/MAzZqlFw6DvOvpZhLjni3CwMzH852VSYtHFUqKbDVCv/nDuxFVnlVhl9lVIZcxCT0OllIk3bOpQiq91o3eTiY/JWKWIXfnKhIokuMKvr0R9L+scX56PPx72sPg/LFJSnZxdMrrpkNLYKXbFUCSC8ZMJIW57KsyOhDMWJH3D8V8N+uHXT6EWNdiSp3u/Qenh5+KsjsqjSCsBLObfTurqBO8yHjriwHZuuXJvK5HMT7Ol/wHfyEhOGcdZuU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wrbea4b1UY0iQs1M1/eUgIaj2Cfjtgl5/I1F7YPap8LTNACMLhJOLW+GmO0V?=
 =?us-ascii?Q?mxSeYtTttR9tuHgVE6dUOFDiBvL/4FLRqcdH3/zpccOlCB7rpHzdO1y0T9Kv?=
 =?us-ascii?Q?nMtD77JbfYxGteKjP1kR+765ZGrVa2rh29f+XE/kAItQcwA+BAK6raZ2egX5?=
 =?us-ascii?Q?r0IIAQtwuApJ7RuuyjsS4Fz+oYuy/vDIah2s8UiqaMwWpP9irvy0ZUy++c05?=
 =?us-ascii?Q?gsLSmQe87NRH0AhKLxmbBKqm6wO7uzGQ27IWfp2KGe0WrmViFTJtZoUkSs7P?=
 =?us-ascii?Q?oB/qes1rAAVpN1KWGg6lz/OD0VHceoUxPmjQO6+9HDnD5hgPdCXV8wJ7WjgA?=
 =?us-ascii?Q?nO/Y6vsWi5Bzcigz/FM2p9vTHIPkfrrkjoN2+v9Seki5j+YEl9+1dPr9469z?=
 =?us-ascii?Q?1ubQJ/wUHhdHAaKG2D56caZVVVzJMDpPb8S5w79dWsNE6uFVf1mDcfMbIL8o?=
 =?us-ascii?Q?djY3ptGRzpSJHgZUpDrXDtYwoLPUDkAlQIWyCyjV2BUOPGshb8vN1PfKEb6I?=
 =?us-ascii?Q?QZ3zUNjeqe4+7ZDmff5Html6uaJT3R2FAv5uum/xvbWYLQAkswY53sM6CSSX?=
 =?us-ascii?Q?CFyArnQpWpMtQcI9gwFWE9KUPh21zstcYblJjKePCUIuyy28BZsdEqZeEgpG?=
 =?us-ascii?Q?AidX0RZxiIwuO6YLMuXUj9HQP0ruIVO15931aKR4zYrehXcV4hFGz+mV6BY0?=
 =?us-ascii?Q?xn5lQkaKrLQqemRGnO6rXC90WzTlw3Iw84hHKozPsPERpPmgoqdohgPKabAl?=
 =?us-ascii?Q?ROOAS8GKNyhQIEXyFhBxyQYj/A5BIgzI0G/dogfLDnX3CMAtl88E0IUGfJiJ?=
 =?us-ascii?Q?vNw8svO7hdjC2OhKGoQqoanDcIVL1VYskBcs71b4PpvuDwEbh2uGQtaW0rFh?=
 =?us-ascii?Q?2Fs2V1fTjoRr5TzGZJ22hh/iWr3pJ1OrOC3WW/I3W2do1FtV9eLIktv30tHU?=
 =?us-ascii?Q?houRSyRmcOndlk0Pb0kdRLmHJ5e7eVX+Z0eXrD6U/OYUco/Yw4ei/cgcphZm?=
 =?us-ascii?Q?oM5r0e49tCIXZlR8FLfbJ1o3Hrfr3ZNZHGHqesD1tC2qd44xxDVgVwMWnrkT?=
 =?us-ascii?Q?Bjlsfh72SSI/smXQM2WtcPOouu4xIC+Ofn42zppyGIfPPvkMRAGL7TPfYD9f?=
 =?us-ascii?Q?C4JAez579Ny4FOkcn/WB8xvkcESmP1eOcY1kYrZ1RY1iznx/qaULjV/qLAsx?=
 =?us-ascii?Q?XZdqdpmjzYfoiydmiKzV10Ek3OLXt04RdwLY9EjhoyuLjNLDgoZxS1XtQg0I?=
 =?us-ascii?Q?QuqPRlpVUZDlk2LlIcY7Fcneq+RQ683UdykMZYhrInKzWLoInm/FRZ5zflty?=
 =?us-ascii?Q?ST4etpVGh7MqHdqV7Gmrx5/3a2ASSRP3Y6uELaTK9shlSa+1PAh3+tMPcI/n?=
 =?us-ascii?Q?dRmNgF7T21O9ziVatzdS/09MjzRcJoE8taLCcTJ2NP9amFnv+haGd5BURZbj?=
 =?us-ascii?Q?DcAsUNGJHlFehMVKdR69J/e2RHb5VXEoxa4cMIeuH3bbEV6qNjY9IC2X8sr4?=
 =?us-ascii?Q?GFbA0c3n1VD8BZLEpRw+IRJyK+1DTy3YvX6emjR/oQOXBbAlZZToet2YOqZG?=
 =?us-ascii?Q?OQyPz+e4lZ1Et454De915+vLLTKJ7LnmI2u9dd+mNclGUd2CT/F9HZf1Sjre?=
 =?us-ascii?Q?xo+LozIz1CS98wiHKSFfiHZOEdquh3Hw+wx/CZwlR5ISAQ5agh2zY2uSjGsZ?=
 =?us-ascii?Q?ty8Y1YTU/5EHulYbWkGtluOXNv1xD2M9tjE2MIWdq9C3z40m+wgRiqAF9UOH?=
 =?us-ascii?Q?2JKf3EGt882GrJLv9/DEJnOvUWjRctg=3D?=
X-Exchange-RoutingPolicyChecked: 
	Rx0l2zezumqSI80rNjo6rKRkffUta65LckaLWCuxWUIJsLfhkXXhgOk1FM31tQYg9oD2xO43uLFIMQM4ROTbdXjjTNUo/2TpMgdZPkocrX/t5i2kay3hjgT7sF+s4KeNn1984SA2nLr7F3Nj7jE5C/sGl/JEjJhoXUID23rw38StACJ8JVr11YQJ9O8eS4rkJR4S2O/wbd0hvCZ75wamc48WfQoBYDAhsNsNP3+YICxWtzMN+xFCSnRDkoOlxvBwRNLqw++n7b4XdJI+WbxD0N6HIStj4Sc6ndtgPlZOG/aM57e4gSXgbFxUviTVhRParxOhIZQisXhAQ2q6SZ2gVg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed138545-5909-4425-703d-08defbebae20
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:19.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38L+omHID8S8uKwRwLCl3GtlqV6W04+bA5zFjkhHW20pvijesKSTTPWjWM0pXaVWOir6nLNttpgnsJME6bvPNKrAqFpiwiy+M7/6PLjDSzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX1GxIXz2OHUTL
 yq5tA2QhgJEMhBxzSVDO47+/X8t5KK40XGm6UmrEcreepjIJGdu+ZaJ8oR5bw+mdFz2blOGv03w
 uW0Rh/dASTrW3NJYsP6at0zedrObuDsrlwzflAdO6FB65Twzcg8R1C1FwYIm0mpECCJ6j26LrrY
 egv6NQPwjRltXnf1dKXyL6Se/zVwAUDP/uFeepy9G6zJLuflrISkuIifcCv0cIEYpoNFL6S41+8
 T2uxUTvo1e5xABZGoOVPHuS6XInjE3zpX362SW0+yQlunUTRU5iqds2GO1ICepX22y2N5XuDE65
 WL+x5FEN/Tjgwgz1KiOGQ6kZmVvZtM5wgEE4GmNbKgYHUc1dSTXYAGqKPrsQYv9HPMcRjOowipx
 KIUqn6sBlYRL+45JuwMzauwrax7G92peezr4U0U5cT2SrzSqXUxl2zmhubcZ93KPBt57idNfL1m
 aCUjyfpsqZP/6CThJrg==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a82439b cx=c_pps
 a=HDWlEWCLQVEuMJptrEg8xw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=KET-q-R6hpJHq7B5zCgA:9
X-Proofpoint-ORIG-GUID: aa_A39rMUR65QkMy8_nnt0lU-7ma_MQW
X-Proofpoint-GUID: fbe8iyUuf1XxalFQT34Dj8DYWpEhWvyV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfXzAMd/D8c226Y
 s5skHvuXwd/ncq4PiXs0CIN4zErARervDY7mqIdz7mCERy8fUf8x6D7mNiI2mblfohPWUiPsejD
 r8TmwQ2yviAHeZQT7oBsrQUDMeGSua9gIfMOJeGd0m1u1rzadPfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243566

* V15:
    - package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
      compatibility.
    - lib/oe/package_manager/rpm: Enable DNF filelists to resolve
      file-based deps.

* V14:
    - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires"
    (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of suppressing
    the /usr/bin/pkg-config emission, added:
      RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
    to the pkgconf recipe so it satisfies the auto-generated Requires without
    modifying the upstream rpm script.

   - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
     RPM 6's internal dependency generator auto-detects file-level Provides
     from installed files, so nativesdk-pkgconf already provides
     /usr/bin/pkg-config via the wrapper script it installs. Keeping the
     dummy entry caused a DNF conflict during do_populate_sdk:
       nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
       provided by nativesdk-pkgconf

   - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
     With both the RPM filter and RPM format reader registered, the filter
     intercepted RPM files first and failed to parse RPM 6 packages
     (debuginfod scanning still failed after the 0004 patch). Disabling the
     filter's automatic bidding lets the format reader handle RPM files,
     while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
     explicitly, keeping test_read_append_rpm_filter passing.

   - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to include
     the test_read_format_huge_rpm.c changes from upstream PR #2846. This
     test now correctly exercises the format reader instead of the filter.
 
   - Updated patches 7,9 and 10 for the latest master changes; no code 
     changes; removed upstream modifications   

   Tests verified:
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
     - oe-selftest -r sdk.SDKTests.test_sdk_manifests
     - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
     - bitbake core-image-ptest-libarchive:do_testimage
     - bitbake core-image-sato -c populate_sdk
     - bitbake core-image-sato-sdk:do_rootfs

* V13:
  - Added "rpm: Fix pkgconfig() Provides missing in cross-built RPMs"
    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh
    so pkgconfig() Provides/Requires are correctly generated during
    rpmbuild.

  - Added "libarchive: Add RPM format reader to support rpm 6"
    PR #3346 from v12 was insufficient alone. Added PR #2846 patch that
    converts RPM into a proper format reader for RPM 6 packages.
    Existing RPM filter kept for API compatibility.
    test_read_format_huge_rpm.c excluded (filter intercepts before
    format reader).

    Tests verified:
    - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
    - bitbake core-image-ptest-libarchive:do_testimage (libarchive_test PASS)
    - bitbake core-image-sato:do_populate_sdk 
    - bitbake core-image-sato-sdk: do_rootfs 

* V12:
  - The previous libarchive-related changes for 3.8.8 are no longer
    applicable because libarchive has been upgraded to 3.8.9. Updated the
    implementation to work with libarchive 3.8.9 and applied the upstream
    fix for "attach filter to correct bidder".
    Upstream patch: Upstream patch:
    https://github.com/libarchive/libarchive/pull/3346/
 
 -  Dropped the following changes:
    rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
    rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
  
    Why drop the old change:
   The filedeprunner() fix runs at OE's external scanning stage
   (do_package), but RPM 6's internal dependency generator runs later,
   inside rpmbuild itself. It re-adds Requires:
   /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
   operates at the wrong layer it's like closing a door that RPM 6 walks
   around.

   Why the new changes:
   It operates at the same layer where the problem originates, inside
   rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
   %{nil}, we tell RPM 6's internal
   scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
   equivalent of what _use_internal_dependency_generator 0 did in RPM 4
   just scoped to pkgconfig specifically rather than globally.
  
  With these changes, the previously observed test failures have been resolved:
  - bitbake core-image-sato:do_populate_sdk 
  - bitbake core-image-sato-sdk: do_rootfs 
  - bitbake core-image-ptest-glib-2.0 
  - bitbake core-image-ptest-libarchive
  - bitbake core-image-ptest-libarchive:do_testimage

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------

Sumanth Gavini (12):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: Fix pkgconfig() Provides missing in cross-built RPMs
  libarchive: Add RPM format reader to support rpm 6
  libarchive: Disable RPM filter auto-bidding and update huge_rpm test
  package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
    compatibility
  lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps

 meta/classes-global/package_rpm.bbclass       |   91 +-
 meta/lib/oe/package.py                        |    5 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |    3 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 .../recipes-devtools/pkgconf/pkgconf_3.0.5.bb |    2 +-
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...Unset-cross-compilation-PKG_CONFIG-v.patch |   71 +
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   15 +-
 ...-Verify-that-bidder-and-filter-match.patch |  103 ++
 .../libarchive/0003-Remove-bidder-name.patch  |  258 +++
 ...vert-RPM-reader-into-a-proper-format.patch | 1440 +++++++++++++++++
 ...0005-Disable-RPM-filter-auto-bidding.patch |   73 +
 .../libarchive/libarchive_3.8.9.bb            |    4 +
 29 files changed, 2171 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch


