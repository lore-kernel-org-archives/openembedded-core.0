Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E942C6370C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8837.1650467519761334436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VIngz+R9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=110971793a=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23KDv0jl010739
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:11:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=IDixxfyBNNz7aAF0a6ZLdXWzdk8Hq0eNRqnq3jhwKTk=;
 b=VIngz+R9PiF8YxCKtuWTTmpL5e5GLWJdlzN8Wx9k79+YnNPo582KwwX/cTnGOZsUU/6v
 jnqNVxVniFQ2vusBkWQIuidShurtTXGahNpXLMHQ7wl3tp5tLtB5pasLYDHkxgfP105N
 WqVcl1AGXPir4bZ795gwHaxvlK3lysp33EhBpi0/E15iSXIbWMcG7WlQHOP3ojCFcB0l
 qPrl/+OL8HjTk0C6EHPUl9kfxfoe7DHZ0pkx0Y0dBIwafubc8AlGipT9Evqkm8a534VG
 2MJOI2kGWm0m8kjau0kqluIOeJYoX+lpJAu/jD3PPYnQwsCSuM1rCtWzrlmq+BEvN1H2 eQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs312ycw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:11:59 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23KFBwmj022205
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:11:59 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs312ycu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Apr 2022 08:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2jVWozzbkRdOXLB0ZTfBoMi22MQrqH8i3lOYWbGfJaw1+WZwtZaA0r7na4kkyKkB7qblhmZlmjsOdX7WGk4a+Mwp+MT1VvhtbyGSpHDTvoFx44D1U/2HiGyK7fqMj5VMPg93xONio4KX1TZBlxdpkri8a9REvNVWJTbvcK9DMd2QnGjyRn5As+k0nP1st0fgmts5OJaqhr5GSXHuwOd6RI1YoDgDt6jvHcPDcV41G3oExoosDxIKmytqih4AVpAI1dwvXnghXIuopREsUCyV+i3MEgJTjuO+djEOlXQluxsBwNNsyuhsP+EtKHmPd7LkfowE5pGFiR19I8+kxoDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDixxfyBNNz7aAF0a6ZLdXWzdk8Hq0eNRqnq3jhwKTk=;
 b=np0/Lw2xz2zX42MBvtz8eq5uqXhtoVU+6p5tewuThq2Bfch3WMF5/aZtgg/Jlq5TP3b7ml30Yg4gfuOiyxlhdjypnFDk8oNfOG+ozGw2o/wb0EgLILJzY8Mq+JYHYYX4jX/FzK8JM4gW04Qx9t51jzNMzF7GlFbfmBtSOFyQrO5o3HyWPe5OCOugEmzhKhZmFrA2lQKauHaySioyvNKV4gpnhNvp+Mith5p7oy0ZZunhVP6WV0Pnudd43lWNfM0H/OTgF2hew0M+Y+imbkRWXTQNgDoxm0cmN60X6tfJseMeCVpheoACKvWfs0CbGdXwkY311DRpdt0TAXBnpHOvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB2892.namprd11.prod.outlook.com (2603:10b6:5:61::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 15:11:55 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::89e0:ae63:8b71:4a0f]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::89e0:ae63:8b71:4a0f%5]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 15:11:55 +0000
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] devshell: introduce intercepts as per native / nativesdk
Date: Wed, 20 Apr 2022 11:11:41 -0400
Message-Id: <20220420151141.25027-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::44)
 To DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39bf3e13-6077-4e5e-14b2-08da22e01b96
X-MS-TrafficTypeDiagnostic: DM6PR11MB2892:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB28923E219A671EBC34A2D1FF83F59@DM6PR11MB2892.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iKgIcnGpLHrx7ZAlBa1bCr5n0oYKIWebiSu0c3yvEsNe/ru/w4Fc4LtaFb+r36K0h9etZiJ7qgd7rGye0GCe9RIq+m28XS+yXHykI/r5SiEzIEjERps3GhCOliLzKj3FuyMF0wsZTRum2FvpPoJfVeYwIij2v0VYUnI3TkO1hOHln4pC4W3sG5YKXs9swX17fA5uQxv6WPugQJNaOdUL11OQROcRdXm5tyQKfSv87C8mkPRGOo5LHEgNY2xBDAnRT4RLC86FyUL1wSC2sUblYty8wEQkqoDD96SfrMHIVbRu6+CGaw0Enjrl+DGxynaK8PhdksfYXFHLxvMi3eal/safIOx5ujj91qwQwUDUOm2//hCqQCAZrt8zyP9T7nHdFbN/H+8rrg85nFWnem1wAUMI+SCoDSOpru005f0Dvi+Xpc7yre+6fh755g6oxEN+b1bq3s2lX7Ba95oWt6t1mKMRlduVmxlyptgPb5bisA1gbQLgJx3A7+SG+013ueOeFmC3F2g14Cx86GHP9t7bZbKZVac/Xm/SOH77BsAmc758wDKhFNIvgWHHbPh7JytyEEfaDzR3Uq7o9GKrn7t518vg6HTx1Djf9ZYyP9QlgvAJd07nvjkk7mS78J9sp3iJdzFd79M5UAduzRslQAy4TWwko6NjdHm9/W4B+Rbjr48DLkODyoeMOEKdWSLMeGZlmFsG1HUdjZSZkqKZ6kzXMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6916009)(54906003)(316002)(5660300002)(38350700002)(8936002)(38100700002)(8676002)(66556008)(66946007)(66476007)(86362001)(2906002)(26005)(6512007)(36756003)(2616005)(186003)(1076003)(508600001)(6486002)(44832011)(6666004)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yTv7PdTwsPAt0r8eYFUK2ICSx1uQsT4z9WlFiK71kVUKidXCcmDfTSkSJGVa?=
 =?us-ascii?Q?i+wMVwFlvkuwBV08Muz5D/GaMxaxe5d6ChEODWDt8VHVdqygrw/wKe3LJwEn?=
 =?us-ascii?Q?rzvrVkl0qY+YadopJUA6Qfilkgpwz6T+pWhTArbxZCZP4kdgOEDb81ZirJqe?=
 =?us-ascii?Q?vL21T/rhO61X31BxE05gwczhRUIfxWcjTeZzA47Nocp+49yTT82j1OExyqi0?=
 =?us-ascii?Q?GRSkIZNv3WyUaQkudLOk+cIP04zMXytxgoja496n1LZNdWJQbHh2/IDv1x1P?=
 =?us-ascii?Q?xoPZM6WRjWVCSqJ0MakbB4xZ+O5IrRsXLWylJu3O7/NYh3xPpQs8rBm+Ov8K?=
 =?us-ascii?Q?MWOoKdt2iIeQIH4JZog6ka9TnB6Xm+u+DP7nr/fZRFhQyux7K6C+A63algwo?=
 =?us-ascii?Q?he5WyrJQ2IV8Q5V6oau8WpX+ajP+MV7avsSkfeOh60rerj+9FpJpA2dMucxV?=
 =?us-ascii?Q?GlegHuj8DsYQnMqBvMlfX9K/xcYJEplz7SxWn8cczXyDnap2A3mtFzq8DuNo?=
 =?us-ascii?Q?t/333opp6orK8VU1s/b8Fo9HMQwNW6KkYCzTb1R5nA+ngnBZuwkS9kfb+eD+?=
 =?us-ascii?Q?XEfTcL4xhDuNDca/qYsAR2CXdO3EyOAci9jur50D2DU75p+uwMZX6RCQdA2n?=
 =?us-ascii?Q?Xq50lkkkrhwUxlUCYBRBBQa8L1WW309t/a58Rrj7jolsFkLQkK43uqyW/w2Q?=
 =?us-ascii?Q?tlE2NSBOmXyYV49fN6bpTlOJ306QHJOOCwdDk++yy7orsoSyNA6L6qpLJZuK?=
 =?us-ascii?Q?zgKkGTlLnS9OOc0dCpkaRKUHD3vPta3jMFLZCCwom+QrMNrq+XNnNLj8zmgm?=
 =?us-ascii?Q?5Q1cjWyypEFnPX7yIqsuxvnhvtOn/NEkXVc5oo5RsZ7sbuhht++/DcHF0d4c?=
 =?us-ascii?Q?IEIWOvSyQ83bX0QTkLczHuY+Uz4T70suwkB848qjOGiP27fwo4Jgvw/N7DaK?=
 =?us-ascii?Q?lgU5OIDZWep48qA1rr+cWPOXF6z1nDc4g4f/mkBcDQBNBoBUslSOJdfRQnkZ?=
 =?us-ascii?Q?sW/0SQpCRGtPE0vP4uCukcdCzdkBtBYBUtJQS7t6yxKEsdXKUGQPNgE9d0wn?=
 =?us-ascii?Q?GkL93chLUGuTlTxiyu1obWx0UpmmHK4gayNUi1rL/RcBlm2WVhPIPBdctK/A?=
 =?us-ascii?Q?jhtC/ZXAOKwr9+K5wBKggJONdiW6Y36kRO5jj1npNqE/6NJE9jRh89t9a7OF?=
 =?us-ascii?Q?lBh4ThOj9k/q9fPlp9ZXY0Ln6n2RUZ/MCmQaqIPeLXYgNqoXZCL70DNS9IeO?=
 =?us-ascii?Q?xq2a9zKVt08Kbfkic68WCpYJpdw8ECwpOrtmPGyG83HI8xVZfMN/hlQXJwU0?=
 =?us-ascii?Q?bIqAhD+uJpspagwAJgO9Sqz0CT08yq5ERJ+3DW7txcLn53l5RU3kooc6mfKD?=
 =?us-ascii?Q?fJ8QgPj88jjmhJlCTY7uEQvW9hBYr+4fQrdEe4c4A6vFnc2Wc2MudkBu7aM3?=
 =?us-ascii?Q?EFDax04bgkXJP9dvhWTWKR1owWVUJSDfQDV95Nui39NwhgivZxPAkwT4+eO3?=
 =?us-ascii?Q?ZHpgWr0yR+qqFZfXi0H3ITAzS1/CpLdgBTCS+WhMd4RcrXQmEMnx6AxP+Hrz?=
 =?us-ascii?Q?lsDo37SYh28W8U4+162535e1k7yyEIq/zuJpAfB2cNDwB90//WE3X9Ga/fFr?=
 =?us-ascii?Q?S+GittdvGQa/P9KJx21SeZFVznm88Kw12irBFfRSbec+C3IjhYAkw3pzy3yB?=
 =?us-ascii?Q?keXG80AhrfckatXjW41Wc4CvgabMKqwZ35zAnrKZFRrGp9dy8mCnAtFez53M?=
 =?us-ascii?Q?7xMchue+RfstPbklBW5hNFsPCsWYZmQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39bf3e13-6077-4e5e-14b2-08da22e01b96
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 15:11:55.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wqKatkYeu9Nf9WYhkPmrrmhC0Rqd0e5jAZt3iZBAKHE75XvUtgzwb4TnLWt42fH/eA3kRFXPXT09mbnMtIHVNkDFb3TFXWAVGoL9yoXVAHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2892
X-Proofpoint-ORIG-GUID: E0JIHWvpCH8Mmi6GSReRjQJTlQqgdpun
X-Proofpoint-GUID: LPFZ6SFAc7Snz9yTASVxOS4SV0gpv8A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_04,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=853 mlxscore=0
 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204200091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164701

In a devshell, recent versions of git will complain if the repo is owned
by someone other than the current UID - consider this example:

 ------
  bitbake -c devshell linux-yocto

  [...]

  kernel-source#git branch
  fatal: unsafe repository ('/home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source' is owned by someone else)
  To add an exception for this directory, call:

        git config --global --add safe.directory /home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source
  kernel-source#
 ------

Of course the devshell has UID zero and the "real" UID is for "paul" in
this case.  And so recent git versions complain.

As the whole purpose of the devshell is to invoke a shell where development
can take place, having a non-functional git is clearly unacceptable.

Richard suggested we could use PSEUDO_UNLOAD=1 to evade this issue, and I
suggested we probably will see other similar instances like this and should
make use of PATH to intercept via devshell wrappers - conveniently we already
have examples of this.

Here, we copy the existing "ar" example and tune it to the needs of git to
combine Richard's suggestion and mine.

As such we now also can store commit logs and use send-email with our user
specific settings, instead of "root", so in additon to fixing basic
commands like "git branch" it should also increase general usefulness.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 62dc958d9a4a..7ac134e0950f 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,6 +2,8 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
+PATH:prepend = "${COREBASE}/scripts/devshell-intercept:"
+
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
diff --git a/scripts/devshell-intercept/git b/scripts/devshell-intercept/git
new file mode 100755
index 000000000000..8adf5c9ecb71
--- /dev/null
+++ b/scripts/devshell-intercept/git
@@ -0,0 +1,19 @@
+#!/usr/bin/env python3
+#
+# Wrapper around 'git' that doesn't think we are root
+
+import os
+import shutil
+import sys
+
+os.environ['PSEUDO_UNLOAD'] = '1'
+
+# calculate path to the real 'git'
+path = os.environ['PATH']
+path = path.replace(os.path.dirname(sys.argv[0]), '')
+real_git = shutil.which('git', path=path)
+
+if len(sys.argv) == 1:
+    os.execl(real_git, 'git')
+
+os.execv(real_git, sys.argv)
-- 
2.17.1


