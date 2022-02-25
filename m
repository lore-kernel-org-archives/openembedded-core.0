Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23012C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 15:48:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7778.1645804106470305676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gUAirrLY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9055d911ba=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21PDYUSH017584
	for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:48:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=O56IDG7M3w7MzXIL/RJe2LumPHdu1BYnge9zzZHdjRk=;
 b=gUAirrLYW9punu0rFzDiXjxhJI7MGzKG/AFqpvwnGFY3C6wL+mJaqB80bEkxOSFP5sb1
 v4iYhKpleprlK0Cg9wOiQLBlcH43buLfbGuIEvg8UpzwS/4H4TN6DUBYFyugqoie3GzH
 FAmWGHbUi1+4Mnb6v4IrszOqJhsgEeu/3BSVEctVB7Vvtkmj9NE/dz2eMYFHl82LPXm3
 haAzzNRDo5516F3v47SPnYoKsKqRw4tF4c7EQL3SaC8k1V0CN/6FeoumYMK4thqUYWtv
 r5f5B3hJA6cEtCVf5mXxXwhYyNYQZvT5LzUptJjaqQh3wAJJjxMWAtCw28U+Bmdo1shj IA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eej5b0rh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:48:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxgzkKeCw81cshks3HsY0UD9lY2az5dagIs2kVzogkPEDXTcLrcMkH+W0KTJKf/4XyL+QDO9zxkew2yyQj1pO/pasUsvHF8jX0VB0Eeg0FrUe9lL1REXCbr4ASR4wapR/vz3KEoRAhE5grhALpEV1re629PRkV0OWFVTo3JjPv78+NIDVjUFwYHYzrRniV5pBgG8UoCT7AA0W4k6laKuIp7S1KBx3PWwz6E7FsALrG/kT+kGx1HW0tlfaxHwOvZGbQ8ACz5J71w6vdd0h2TWqa2VHudaAhszv2oTlg+1CaZbzaj3rEIkNNgLIILa+6Z/7s+6r1FfPbq2+STaevzkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O56IDG7M3w7MzXIL/RJe2LumPHdu1BYnge9zzZHdjRk=;
 b=QEJYnOa0qDxTVJkfCWFZpUrq2q5CbCTf3SFQcxhoXMWmWqOYoucNpXVg02WXZOwt0yq6WYkUr0u0zCAtl+t0bFpGLuuRuN2KNqnEmdzj6xWP5Mc5IPOZ9ORgycY3iGOHl5rmhVVXxxEZqPDto1X0UXfpyr7i09kliiTPEZzmC9na5o7ylYUh7TSXF0GOW353AQQh7w+96EKVDzPN4A0DUtUnuSyZYNSo09J9tVMWiIUvjoHhffbXuqQE7cdobDJ6gcl/ZJUWVADHUAYiIOzjnbJtXwVXQATmjQLTT0G4nn3QajsB7s0qp2aHOYQTiwO2Ybw44tdjeG5HcwLYWW6JuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 25 Feb
 2022 15:48:22 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b5ab:c064:2e46:4726]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b5ab:c064:2e46:4726%6]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 15:48:21 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [v2][oe-core][PATCH 1/1] zip: modify when match.S is built
Date: Fri, 25 Feb 2022 07:48:08 -0800
Message-Id: <20220225154808.15364-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d18ea76e-a905-4e50-084e-08d9f876400f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5191:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5191D590E159DCD6BE107402883E9@PH0PR11MB5191.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GUXZEI7LpwykCjkb+BxCmse8ZaBa8ITXEf4pS5JbSe4EQmfY9fxiyRFpjyjwqQXIUkLkRHSYAcEJ7jGEqSSl4Y/qsFjNMk2gzpW7sB3J7kt/SaQe2rMh5rIHeyNcMkXEdGNMTNjm2FX7f6DoyVVcaBv7j1+/RY5mlccGiMYSJ3sMV8/0W/uu1ERfVxvIuAsxtyDhE/11oCmVe2Ky8wZrPVEYJlFyD3dNa7rQqMpkEFJJKFjZ3mJjh+S/NyZTespvTsvL1TZkGECntBULyZTMOMuwlotYjiQfcNUOnJorxhUEGQ43OwvTEKx0DNE/0VJCxzof+UlrslYR6BYPjmW86Fmev8EWQfbVP1ZaQvRfVRX+4xB39yyZ1Zam2+c+94mBk34ZO/X2z8RTp1IiEp7Uh40+AwZxC3Tv4CWnAZ6Hc9rfvCqpk63yP5V/YhDtgIVxbUpNMKuxsAcOSlgE7Gl1XeGjwiQjgL0edbpIo3x9pR/64byH6gxQ9e8p9k9Ua4eDp1JaEUeB2QouEzfDNqWOn8BJKA0ntfk1E84whUvow/eMprbunDeco4rQuBZR24yauHcIx42aFEw+hPDJntubSkeiCyzmA+KQvAe/dO4c3y8LyZj7WArFOWbCV5Nvzegqaq52m59VPSnF8WY1MuMGPbiYfpqmtYNLKpBNui+oJNKOClRnXbFW5kYUShaZzU5taa+6Frk0IP9nONsfqB8RNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(8676002)(4326008)(26005)(38100700002)(66476007)(6666004)(86362001)(66946007)(66556008)(5660300002)(1076003)(186003)(2616005)(83380400001)(44832011)(107886003)(6916009)(36756003)(6486002)(316002)(52116002)(8936002)(6512007)(6506007)(508600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UYJe60jdNY4rQM0o4CtAet9RsmFQTaz0h3FwgofYC+CRdoTJmSq9+g7FfjiY?=
 =?us-ascii?Q?9GK48NEkp0n4otbpc5pY3FulW8TJXwXjGKxh6egyX1z3x04QzphV9LFPE779?=
 =?us-ascii?Q?bo9g1YeSbMJRS4xEzgUs5eKjJf9MmB3kRk+BB94jMC6AdYc3ECC891nD3uQa?=
 =?us-ascii?Q?B23JBXY8M9RpntEXcQOhttmXQylu9z9MVkeYsoAfWCvI74sXg+Mxyj1fc5nX?=
 =?us-ascii?Q?3VBlgV5t6gBwSHTkpPzq7giY3iJ0TFGbg5v7w3VZVQ7GIwZTb7+AMsZIouK2?=
 =?us-ascii?Q?7mRegZOeE3gEO+CbF816nJNuNmEsiiGOYpPXCmEP3l8baxBIh5I17Z0jgxfN?=
 =?us-ascii?Q?qt7ffbCThv2xDja+y+1wJDX+XYKPwVx1hHZlLQoSz9pMqN25Tvhe9ZovChcM?=
 =?us-ascii?Q?e1L+LZC3Meq3+mFrKXHkrpdJ+7dCd/c66lCjIWHo4OG8M4gxrtwG6f3xzTJI?=
 =?us-ascii?Q?a/phIK8RwOHbX34T8FEbfbl/UBdCEMa7tkhVCZ3VaFPJi67cY0TdQtpS1puu?=
 =?us-ascii?Q?tPg8sF5OZkXkAzgXcoKDxqQJ5r+3d4R4QQaqADKoCS8rxelpeLt8XLJAKSn7?=
 =?us-ascii?Q?ulJQ9BB2Ugk4iUssxVHZoxM2cOqwKbPdlhYb/1LivIDuubLnXs+X93o8w0HG?=
 =?us-ascii?Q?rYIZdUqnOROLdHg0CvESrpwC4TU64/oPP2uib51xgJ5TUQ6iuU6qHd83n8Fw?=
 =?us-ascii?Q?IiHLQBuEfGSugq7RlJc4dRSSwb/VPqCGD920BUlI7vLZj82miT9kVeSMvWho?=
 =?us-ascii?Q?+C8WSYX7X+jyAYumNAWeUMai1Hbyiw7LgjKmcCb1KreTzjCC8F7TulV3W2vK?=
 =?us-ascii?Q?HjFqtIgsvC16y+LTgceqlKMkMyFSfClh3COJkHQumB18eCxD/zcRey/ErfNp?=
 =?us-ascii?Q?t045Dwmgb0Di5A0LsmIoDZQ2d5oYITcQ5A6tUg0w9AU9txX1NHEgowUNfFpU?=
 =?us-ascii?Q?rskVbCjYACVQWSW4Yo0R9vJU9VChHCcE65YAfMFuc4PBJNBlIzi9g5d6A9Ya?=
 =?us-ascii?Q?lHUHn7hJXd95dX+9N4sLRZTE3voPkZ181ZmaFS02OaHWr3Afe17D0ajleeSR?=
 =?us-ascii?Q?1GKbuDzd/h4/wCtXmtiLUx1VeoIDnhe/VK2j09mkzn6GjK4ejmxU4HiT1P2+?=
 =?us-ascii?Q?yCgPIu+3qGVJemLUUz13BDI0xyQujxjOhz+MtLNp4tuzETnHHfxzYgHTmCP7?=
 =?us-ascii?Q?wbmzKzTAEnW4n5qkLLKYE3bxNhsmZYw3pcP42s5tD7mL+9yBpDpjND7cZPU5?=
 =?us-ascii?Q?BkwTfttQ0hFOpT614cczVwl8GPj8rHlyPbNHwEOYGOf5xishpGXUqLyKm2+I?=
 =?us-ascii?Q?mJRWMEBvMPQsgmxWV5pCNvv+UVzXHKIIJF9C075+VIf1UXOkJL5PB6sv9BBa?=
 =?us-ascii?Q?crYnjrcPIlT56eKfC0wgfJxE2oY9FSLMqaP8PIEZAm8CxHEYUHf49YYWl/S6?=
 =?us-ascii?Q?Z/MWNUpW4iQR4MBvfyyTi15AZu8anH69zi3ovWRboJsq1SkFijjrbOT6xqUe?=
 =?us-ascii?Q?O04RMlTymUK8WefmOJn4KJa9xfynou2h98EDsfPFsyk7gkgJc3+vbcFjgPsY?=
 =?us-ascii?Q?pHP3Cp4Mta9glNZtnZ23hcS9xnojUtlaprLObAPBtnEvbARffNuT5wipqW2m?=
 =?us-ascii?Q?NswMAFoO6ECyFfH/3kR+nJKAs3KJs1ius/0hpptUdrnY8ZVn2B0zMR5QqWlA?=
 =?us-ascii?Q?Wjtl1ttjTcMvOAsUsi3nEPm3xTw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d18ea76e-a905-4e50-084e-08d9f876400f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:48:21.6067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IzlT5wf5XZFetk/D6/IsLbAxXV5yflL2/dciaBUsV+oegNsCBogJx9rnO6Y3E51s5A2BmzocTwumcOwihZPGz4IpjgtYTST+kgOFh0bcUME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
X-Proofpoint-ORIG-GUID: SC9fLne3M-Ikz_LS8qf9k_MNCGheM3u_
X-Proofpoint-GUID: SC9fLne3M-Ikz_LS8qf9k_MNCGheM3u_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_09,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=710 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 15:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162405

Use the correct $CPP to test if *.S are buildable,
but do not build match.S because it is not PIC code.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../0001-configure-use-correct-CPP.patch      | 47 +++++++++++++++++++
 ...002-configure-support-PIC-code-build.patch | 34 ++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
new file mode 100644
index 0000000000..02253f968c
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
@@ -0,0 +1,47 @@
+From 7a2729ee7f5d9b9d4a0d9b83fe641a2ab03c4ee0 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 24 Feb 2022 17:36:59 -0800
+Subject: [PATCH 1/2] configure: use correct CPP
+
+configure uses CPP to test that two assembler routines
+can be built. Unfortunately, it will use /usr/bin/cpp
+if it exists, invalidating the tests.  We use the $CC
+passed to configure.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ unix/configure | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 73ba803..7e21070 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -220,13 +220,16 @@ fi
+ echo Check for the C preprocessor
+ # on SVR4, cc -E does not produce correct assembler files. Need /lib/cpp.
+ CPP="${CC} -E"
++
++# We should not change CPP for yocto builds.
++#
+ # solaris as(1) needs -P, maybe others as well ?
+-[ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
+-[ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
+-[ -f /lib/cpp ] && CPP=/lib/cpp
+-[ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
+-[ -f /xenix ] && CPP="${CC} -E"
+-[ -f /lynx.os ] && CPP="${CC} -E"
++# [ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
++# [ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
++# [ -f /lib/cpp ] && CPP=/lib/cpp
++# [ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
++# [ -f /xenix ] && CPP="${CC} -E"
++# [ -f /lynx.os ] && CPP="${CC} -E"
+ 
+ echo "#include <stdio.h>" > conftest.c
+ $CPP conftest.c >/dev/null 2>/dev/null || CPP="${CC} -E"
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
new file mode 100644
index 0000000000..6e0879616a
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
@@ -0,0 +1,34 @@
+From b0492506d2c28581193906e9d260d4f0451e2c39 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 24 Feb 2022 17:46:03 -0800
+Subject: [PATCH 2/2] configure: support PIC code build
+
+Disable building match.S. The code requires
+relocation in .text.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ unix/configure | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 7e21070..1bc698b 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -242,8 +242,9 @@ if eval "$CPP match.S > _match.s 2>/dev/null"; then
+   if test ! -s _match.s || grep error < _match.s > /dev/null; then
+     :
+   elif eval "$CC -c _match.s >/dev/null 2>/dev/null" && [ -f _match.o ]; then
+-    CFLAGS="${CFLAGS} -DASMV"
+-    OBJA="match.o"
++    # disable match.S for PIC code
++    # CFLAGS="${CFLAGS} -DASMV"
++    # OBJA="match.o"
+     echo "int foo() { return 0;}" > conftest.c
+     $CC -c conftest.c >/dev/null 2>/dev/null
+     echo Check if compiler generates underlines
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 18b5d8648e..f8e0b6e259 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
            file://zipnote-crashes-with-segfault.patch \
+           file://0001-configure-use-correct-CPP.patch \
+           file://0002-configure-support-PIC-code-build.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.24.1


