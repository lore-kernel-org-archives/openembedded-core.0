Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDB2EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 13:55:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12620.1688133300057781542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 06:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gH206/ix;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65455f103e=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UBnREa011514
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 06:54:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=UJPfHq35KwqTLQxe/N
	2zyK5Ti3qbtPbO7neshyeADcA=; b=gH206/ix233jaan/JaxGeJ7jqIccqFL0nL
	DTi2jXPg41MuGZLHTI7Ro7EXOkkH33OmelRG6qkzvlj+Xvsl31y5w8Au1bSvsG/L
	1Oeo8tCfLCYOgqEfj5li7ol5IsfxLzl54wuvUAi9tCdhR2Pkquxv5XKtllZhm7yF
	BY4XqP244u0Yy7O0KaIFbxctYD1BuFHvoOL3ZJI9XZCHwnZF+mD3rNnAwvdjkb/K
	Q3ZQwUMkYX88iGK88YLXE0iWKxDDGmoYKtAuCPcQQteLTwattrlG9nh6NGyKCnWm
	nZK9x4nllEzf0q6U6U0qvI87hw4ENkl3OTzUun819j/NSgHc+wkg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxwt0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 06:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOUxLcxNrTkAZOBPaAFDDDb/Gq7/yWIuBWKnI8bJ7avH2J+P7eRKD3JrT/VQp3Mdp7O4ZeRw/F31ODoNSVYBbKQippAHIrscUMzTPvLOmFOqF8BlVrODUavZNAs7FZYK51fp/WcyXqQTV7aeII1KrhPGpfLalmBzM92wSiH1rjEo1Gtx3gb4uiWDMXHhhgJf/tmBx7uG5GPop38ewdR+/t5RCCdSJHqbEfW9HjG0QLOFczwAtsMgiApiXcjOyHdC3ZhF6N76FtAg2d4RRQ9NAeGzAikDGz6IAyzgenfjG3PFch6Ls7jyYQDu5V62ZPrdXKYVuPAbWuS2UPbeUwNaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJPfHq35KwqTLQxe/N2zyK5Ti3qbtPbO7neshyeADcA=;
 b=QHcWZKEhH85QTHEr8gJuV+BIwcCsVT1D3gwGtFJEEyN90VtCZAMd/dXRn5Hjsv8t5oS15u0GMQgyWIOADMdwUxaVlZa0lVq4taFpEFaLE6qC3O49BgNVsRI4OK2U+GWstl3k7qAXnBiHOGUGRBo8rILGIWjhfrS/Luzguu6eB1Qy7PhdBBuxkL69UbZnvLR1dpkLpd+Uwu0MmoZBuq0DwNOBKJVSrYev+NPBOrQhwoY2rQq2d3v0XQh9zX7782t48nWSxDxeJFQ4mk6V6UTwMeVqWkFE/y9iuUo7FhpbklJ2NjbyZgTtY86Oj5bUFiSVnyDms1+uSsYnD5tPIW/DCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 13:54:55 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 13:54:54 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mdadm: re-add mdadm-ptest to PTESTS_SLOW
Date: Fri, 30 Jun 2023 16:54:35 +0300
Message-Id: <20230630135435.3608574-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0311.eurprd07.prod.outlook.com
 (2603:10a6:800:130::39) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: ae993993-dbce-4590-1d2b-08db79719533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ae1xWklvOvjPt5seLvDgYYvKNgqbgqLNYZGmhdypnLrKzSgdQZTAD81yzYwyC29fKfEuqrt180fpEzJxFfYohC/1WuvC52p8SJ8ZZ05uEERHSQKbKy7bVimB26/R8B2CR3SrisE74ks9sF3pT0vAhn57sOxIg0P/XVb5vY/AT57Y0LRp/lZbqmGfsyRK9a5SwSdcYnIIxbZnB15epCh0tARU7r1J0hEBrENvBKysPqyijzd6zTk0dxADPj6IWP9l0wcJYvztIa83A5/OHSH7o/Wi6fuJ2Ohc62oW0B39NrepQ38xgCj6Vx58owmLEOSMLXymPHLZFkDdr5aM6mV3SdcIkVnkKSxA8jJ22rdkmmIv9PQdnHUnYLrZye6Xx66hungitTUscHZjXwFRfTXyAPS1k7NdhUFFxHixUxUom5qgZcBue5iR9suSoz9M7dG52PSN1rj0LSia+0UrBfwBZiRssItYZ/hjsX9eos64m/1uZdui5+xYizzUMsNlM10jrsEjHttslP/I7C4vgEPD5MiG7XJ74+9y7EtxHHD76gFH53tNW+OtPOzvxAWwJ5HJzt6GCaSQXX2K742KgbwKDEICwbtpFDZILOtPKnWtD6hO0FwFyeHCm7o4f1x5DYiz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(451199021)(86362001)(8936002)(8676002)(5660300002)(26005)(9686003)(6506007)(1076003)(6486002)(52116002)(478600001)(66946007)(66556008)(66476007)(6916009)(6512007)(41300700001)(316002)(6666004)(186003)(2616005)(2906002)(83380400001)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CvgYumNELXmRU/TIfwQaxfqSFBfQCsdkgpjtVHYUbKZp4eWCMPBapjUCOodC?=
 =?us-ascii?Q?k0Ri4vHUVg0JS9Jd6OHgxqDPq50qhL99u+zHbzq/bTZHqt2WnScd2WCzDW8m?=
 =?us-ascii?Q?ONGyVDe/AwhXEk2xUuyrpPgv2+uirm1oGP5hzxW65DDNjIQjdhCMK9fbDvPx?=
 =?us-ascii?Q?f6KTEW9T9T/X1/QM8lVaSFyv960Ek9vldv7Z3K0uJuRttbzR1FeutTV3SwPp?=
 =?us-ascii?Q?VuwccUQlyCkspWngKO1L1Dieo3//gAcsEwT+daw3l7tq91GH8YnJV0gbpBn6?=
 =?us-ascii?Q?Xve3Aq3aXEaLtACZAMHQJtUdgtIW7jsiauXrDDZKdR/OBlxJSIR8PR6XiGJh?=
 =?us-ascii?Q?h3qpLB040XupXWr6HxKAq+snyhSzmaSYdii6Dq9S0FG6JhDVwUI8WngQ9rhL?=
 =?us-ascii?Q?6ep0LxfYqNvSqViOhngtC4sxcuUkzGfJ2sz+K+4mdLrr1IdHoZryT9MoPHJ4?=
 =?us-ascii?Q?oSJ13jU9QcmwHhSB+xLsGOoRABXQ0XVS38+43SBE1f+9m0myA4zXODOlA6uZ?=
 =?us-ascii?Q?GP4dE5rp6sK6GPzQvJaZcDHwlSSuZDAk1DRoNU0aFfy+wSTvvPf4X70vPrak?=
 =?us-ascii?Q?AqLOGme0fru/CJ3zVWqNWGIZRJ786XnA2bqtVl+9blvDekyYfltXN9Ej3mky?=
 =?us-ascii?Q?BzSILY05u87EMcNz94riNGpVkWg5a/a2auLHOrUwdCQL0ck76ml++YlxsJNk?=
 =?us-ascii?Q?8UU+gK39KR5AIvX3wFIdUhAWsP6hA86LolaOziiUVJCqFT/yCTMQGPEfW1ED?=
 =?us-ascii?Q?2S2jYVccbXHB0RgBiRZUreP7ildwSTsHXissPCgIL6Hb2w7rCFxvNk/he1pr?=
 =?us-ascii?Q?gCBgDyuXD1FrBKOEDLmoukcPaRfzXNKzp0MWkCgtP/1SY/zDNuYXxAv1TI/n?=
 =?us-ascii?Q?8Qd7P1ndGaeu8An+bkbM+Mdx6Dbngqa5BvCPkoktC/ioIzwqPRwsgprVu3Ie?=
 =?us-ascii?Q?Eefz2DggQFiL0CWfEL98T26mduQ50qbey4mvjoiaLXojO3tTVr2GN4W6T8KI?=
 =?us-ascii?Q?mwEf6NXu+V8kf2oipEXbEdZCeH5G+lKvn73VwTjw7Dhv9WaWXn+sQJUgldWC?=
 =?us-ascii?Q?XbNZrPxvFBMI9U4Cr3gd6w+gdvZNvYD3RC2SObqsVT6wYPV33jQgiIvOWq1D?=
 =?us-ascii?Q?fMPbWrh9YgZCjy/L3Kht2YeI4z9c+SQSa84tmLbvFVBNpqelfCyweyKlAB5v?=
 =?us-ascii?Q?UIlyOWSeV+UAdw6J26tWSWKAPAG9hgKDMSPB0gECGztycq2mNOAcu4GlYSrd?=
 =?us-ascii?Q?Am9jfe8Vu7rMREvRFHgLaFB2ugBsCY66/5inJBGV5ItvnpMkDBqTQN6qZ39z?=
 =?us-ascii?Q?cvMFHfSoj7tZO/pHMVVLFWU97R0CFAs5wiY9b92YgxTFmFCLR2bfYSZ/9+Om?=
 =?us-ascii?Q?sgG+gVZUD84e+Aesu/RsiGEMAb1n/7QWF1puNSOvTju6zwT8TO6mUUFeJGW4?=
 =?us-ascii?Q?h5DUg2wyXk/mLra+RO4R8v/p1ICZb5JtD5rj2iXJAqzbtjh6mXngbTjv95Nz?=
 =?us-ascii?Q?3gX6yUC3ysmIUmU+AMZ4P7RjVVLNUoso+9/ZUGOP91h/VnA6t/jZGeOse7hd?=
 =?us-ascii?Q?X7XUt6VcvRRk7pktjUqTIQynw7M8FIbxWOyTAEaWRDPmarb0kBZQXu/zgLPT?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae993993-dbce-4590-1d2b-08db79719533
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 13:54:54.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iP9xs614BT9tsbStCR4ORkeuhkrYXg1CCbDJ/ELTqFHiAi6ePl5yYQKNY8ER9gU0+i7+fwqlx1p+lIQ3Q8LbQ5L4B5xKqu2Hbd+PidlK5Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
X-Proofpoint-ORIG-GUID: M4K0bj_22wgZSkoixuse5qtjAl1u6E0J
X-Proofpoint-GUID: M4K0bj_22wgZSkoixuse5qtjAl1u6E0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=924 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 13:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183696

From: Ovidiu Panait <ovidiu.panait@windriver.com>

The ptest problems reported in e21021dc00ec ("mdadm: drop from PTESTS_SLOW")
should now be fixed, so mdadm can be added back to PTESTS_SLOW (a qemux86-64
test run takes about ~12 minutes to execute with kvm).

root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
2023-06-30T08:25
BEGIN: /usr/lib/mdadm/ptest
PASS: /usr/lib/mdadm/ptest/tests/00linear
PASS: /usr/lib/mdadm/ptest/tests/00multipath
...
PASS: /usr/lib/mdadm/ptest/tests/19repair-does-not-destroy
PASS: /usr/lib/mdadm/ptest/tests/20raid5journal
PASS: /usr/lib/mdadm/ptest/tests/21raid5cache
DURATION: 723
END: /usr/lib/mdadm/ptest
2023-06-30T09:16
STOP: ptest-runner
TOTAL: 1 FAIL: 0

For the testcases to run correctly, there must be enough rootfs space to create
13 loop devices. Similar to strace and lttng-tools, add a new
IMAGE_ROOTFS_EXTRA_SPACE entry for mdadm-ptest.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 meta/recipes-core/images/core-image-ptest.bb    | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998..6250cf081e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -99,6 +99,7 @@ PTESTS_SLOW = "\
     libgcrypt \
     libmodule-build-perl \
     lttng-tools \
+    mdadm \
     openssh \
     openssl \
     parted \
@@ -122,7 +123,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
-#    mdadm \ # Tests rely on non-deterministic sleep() amounts
 #    libinput \ # Tests need an unloaded system to be reliable
 #    libpam \ # Needs pam DISTRO_FEATURE
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
@@ -134,7 +134,6 @@ PTESTS_PROBLEMS = "\
     rt-tests \
     bash \
     ifupdown \
-    mdadm \
     libinput \
     libpam \
     libseccomp \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 90c26641ba..ddc56c8f9f 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -19,6 +19,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
-- 
2.39.1


