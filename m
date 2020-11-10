Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.76])
 by mx.groups.io with SMTP id smtpd.web12.29540.1605023976860912190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 07:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CGYlqBmG;
 spf=pass (domain: windriver.com, ip: 40.107.223.76, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVQzjpu3WA7MOOvzmOQuUbp4T7iCci1QzMxFUQuAqsvyaQdHJdRgUFklsXgkHgwtDqReEIIUtmGDvt1w3Nt6JAsJyfto/cOQc+/Y7fDVpwvuGp5dsNx+h7w3PPd5rojcirNfqP44ebrjhWynYcTsPzd7ChHsjjT6xaEC219NF8/7QyXk8G16bKrlq6Eg3leCrtGAkEzjOrjjjgobuNj1rsk5/4xLZwIb4GzJ1zt5q9rpAdUuXqrnrfZ6XtwFhIiVIRwU8y3xQ2wgSeSN04p8JZnJtwsdYOk65OO0s1zB+BIPK1ZA/C05EQ0ZD46Mn3q7wLkeA/Eq6Dixx+XZctTTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R+N4m4BqbHvuQEwU/RIIfDsCipq2BBi4qJ2cMWtVtM=;
 b=kOGHwch+mYymDXL3in5Luf8+oAKm5xslIzgz0YffUHNhAQ69x4Vb26PZkTDxJTEVVp1i0czGJu/f7neI8TpgjHEywBaFlEAPaainJXS3G1hqQHgGDwR0nzCS+l7tjzobyL3RNgi7lDN0eAYz/002BZmJrrkmVMDaJTxdhZ+raA7eWvPE3gG/typr3Endh81wsHI6V9QOKMyNqyonAtF6xvvHlKBHaJYboYjILXN9k7PjTPJjNm2B5Dsh9LllA0NUMICLKpqSP8fTD7TmYURHFkpk3+cL9XSXoHC2s4GJBXfwqyHOiM4D/12mp2DLPAG+5fslVfF7rav+NAxquaTLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R+N4m4BqbHvuQEwU/RIIfDsCipq2BBi4qJ2cMWtVtM=;
 b=CGYlqBmGl+qURt9jpaIs4Pqte81zh6pAjg64IaVANvZlfwHFdL/g7x8CZYw3d0bxY7SSxoE1v7EaTI8568i3vX7KXqGUmvd2tTqz6DqQDzpfETJam8VewvP2fszBGbNQrSTAbYP+KBt/FMH3xjGRPXdUf/T7yW7ExRm1bDtCISg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3867.namprd11.prod.outlook.com (2603:10b6:5:4::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Tue, 10 Nov 2020 15:59:31 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741%2]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 15:59:31 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2] buildstats.bbclass: add functionality to collect build system stats
Date: Tue, 10 Nov 2020 10:59:15 -0500
Message-ID: <20201110155915.6193-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 15:59:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1f3507-a5d6-4c5e-9cfd-08d885919c67
X-MS-TrafficTypeDiagnostic: DM6PR11MB3867:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3867DE2BE0E7D79578D6116DF2E90@DM6PR11MB3867.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A1KQACi9EJi19hEurBC5fXP8zKsFj9rg19vjUw7cjnjIPMFzCA5/YeBkcGvbCILd+FKLeh+/txWj2dW/vEIGEjN60C3h+zshlRxNz8OTm78QBFEOT3lau4zvu2yiNgVqSlVD2kUvnDXU8j9Z0JZg3xoLVJl4a00Alq9skR22iL5NXjIAn+CB+GPgmKF3RtC0vnPWnZMyRyr7mO8snhBBKEKH/eSg3vr7pLh82ALLwr71ut6xtMRp2+1w6AGG8FcYY8UkuJSKfUlfFu6n2aW/ljSlcnYc5xkAvgj4Ksv7duRVDAv2ySswnksiUvF/N5zgPRw6Ls1O3Q6z8AfdUJP2OQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(83380400001)(44832011)(8676002)(6666004)(316002)(52116002)(26005)(6512007)(956004)(86362001)(8936002)(6486002)(2616005)(186003)(6916009)(6506007)(66556008)(478600001)(2906002)(5660300002)(66476007)(36756003)(1076003)(16526019)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KkjYytUqq+pDj0ADJE/h/chNklCQpCgv4aWhxBHwkJlxFGwZ9vhxKNICA4JbOSa72MO4wBGCdikqP/oFJYZNikaF24XvzuizndoUU1LieV5KLYVygDgcfnpzQbox1/Jy6/pNIP8zaqO4eE9P0MuguF2aJgUwHGB57+jeXQuoLK/a1jp2IbH3divPU9Lmv0oBhPBMdUqhew5gXNZZjjsvalV6slvZQGwGFYKBYnjCP7HrGpT0hQpoYOmfDAN11YRlL9isA+qzAy3JUSDlZRppB1KrAurEki8RVBcVo55MRfw5HFplT4Y0IgvRKit/yU2MP7/5gvlQW22O6GcpacsnPqN1ZUTE8viYOAjhxub5kGfP+35lr/MUDWjCHYDK7dYVygM9JwE136g8gf68brXARQ8DbYfFpE4JyQF0skCj7DKK2yn6mY55zGTyD3qRmA4vYH6ywkQU14sCosIHzv+d7JaS6GLG2Bk+QQV9fcFI6ClzJGXNjENO/PyJWhaFAoqoS20kMn7LzIcuhoyvq/oYFgSiAePbl9RE4nr8MgW3hzKeT3TVJSqeQLaw9xWTJpBJQXZqi8jsr38JyaJ+E2kUQMs7PO0w9+n8jmjLseE5H3CgglgyZJYGblbak4wSDjrO0G0QLGLAsytAdCqfmhV6ltxjkiyFgvwklQNmxTY42FxdVtTO3q9Ka+CBDmeGoVvzDQ81Q15qOsyhNAxaKsWhWHKrk7RHO+8fePOLHWRVIrnPNwQThAb5LAXsjcFkKXDkSjTgxv9W5i+wDUSW6rLWIshu3Hw4xuI8XOQoTTcSboUyHyy0mdyPma2/0O4QCxHE3EztIe54ZgsaSY9bBub9BQnU3DoS2OjULTsA8a8PNx7J6oEfBBcRd+bUAAnPGXDmgiIX1/LKsboXxxg2NxgPEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1f3507-a5d6-4c5e-9cfd-08d885919c67
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:59:31.5552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8B4IFGZp1V+7Tgaj6vrPhmahIfqEhUeGI4COXZOYhx2E1Ins3plp6TXKdqqSgiyfRRMbHjpr8G7eig/tIXYGvJI1GOhxNouz0H6jbZvzIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3867
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

There are a number of timeout and hang defects where
it would be useful to collect statistics about what
is running on a build host when that condition occurs.

This adds functionality to collect build system stats
on a regular interval and/or on task failure. Both
features are disabled by default.

To enable logging on a regular interval, set:
BB_HEARTBEAT_EVENT =3D "<interval>"
BB_LOG_HOST_STAT_ON_INTERVAL =3D <boolean>
Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats

To enable logging on a task failure, set:
BB_LOG_HOST_STAT_ON_FAILURE =3D "<boolean>"
Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats

The list of commands, along with the desired options, need
to be specified in the BB_LOG_HOST_STAT_CMDS variable
delimited by ; as such:
BB_LOG_HOST_STAT_CMDS =3D "command1 ; command2 ;... ;"

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/classes/buildstats.bbclass | 40 ++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbcl=
ass
index 6f87187233..a8ee6e69a6 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -104,14 +104,46 @@ def write_task_data(status, logfile, e, d):
             f.write("Status: FAILED \n")
         f.write("Ended: %0.2f \n" % e.time)
=20
+def write_host_data(logfile, e, d):
+    import subprocess, os, datetime
+    cmds =3D d.getVar('BB_LOG_HOST_STAT_CMDS')
+    if cmds is None:
+        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
+        bb.warn("buildstats: Collecting host data failed. Set BB_LOG_HOST_=
STAT_CMDS=3D\"command1 ; command2 ; ... \" in conf\/local.conf\n")
+        return
+    path =3D d.getVar("PATH")
+    opath =3D d.getVar("BB_ORIGENV", False).getVar("PATH")
+    ospath =3D os.environ['PATH']
+    os.environ['PATH'] =3D path + ":" + opath + ":" + ospath
+    with open(logfile, "a") as f:
+        f.write("Event Time: %f\nDate: %s\n" % (e.time, datetime.datetime.=
now()))
+        for cmd in cmds.split(";"):
+            if len(cmd) =3D=3D 0:
+                continue
+            try:
+                output =3D subprocess.check_output(cmd.split(), stderr=3Ds=
ubprocess.STDOUT, timeout=3D1).decode('utf-8')
+            except (subprocess.CalledProcessError, subprocess.TimeoutExpir=
ed, FileNotFoundError) as err:
+                output =3D "Error running command: %s\n%s\n" % (cmd, err)
+            f.write("%s\n%s\n" % (cmd, output))
+    os.environ['PATH'] =3D ospath
+
 python run_buildstats () {
     import bb.build
     import bb.event
     import time, subprocess, platform
=20
     bn =3D d.getVar('BUILDNAME')
-    bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
-    taskdir =3D os.path.join(bsdir, d.getVar('PF'))
+    ######################################################################=
##
+    # bitbake fires HeartbeatEvent even before a build has been
+    # triggered, causing BUILDNAME to be None
+    ######################################################################=
##
+    if bn is not None:
+        bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
+        taskdir =3D os.path.join(bsdir, d.getVar('PF'))
+        if isinstance(e, bb.event.HeartbeatEvent) and bb.utils.to_boolean(=
d.getVar("BB_LOG_HOST_STAT_ON_INTERVAL")):
+            bb.utils.mkdirhier(bsdir)
+            write_host_data(os.path.join(bsdir, "host_stats"), e, d)
=20
     if isinstance(e, bb.event.BuildStarted):
         ##################################################################=
######
@@ -186,10 +218,12 @@ python run_buildstats () {
         build_status =3D os.path.join(bsdir, "build_stats")
         with open(build_status, "a") as f:
             f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
+            if bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")=
):
+                write_host_data(build_status, e, d)
 }
=20
 addhandler run_buildstats
-run_buildstats[eventmask] =3D "bb.event.BuildStarted bb.event.BuildComplet=
ed bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
+run_buildstats[eventmask] =3D "bb.event.BuildStarted bb.event.BuildComplet=
ed bb.event.HeartbeatEvent bb.build.TaskStarted bb.build.TaskSucceeded bb.b=
uild.TaskFailed"
=20
 python runqueue_stats () {
     import buildstats
--=20
2.29.2

