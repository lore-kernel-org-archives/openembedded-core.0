Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.12032.1603472223611592581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 09:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Yt4DO0OM;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOKCX4WOORqjJRmUX+bsERURCotA5TeO7cY/YkE+5p+Xlhny5ehT5q+omYzfCcwWuhrxRT2x199dZx9QoRhdXH5xYf4XOA6vHSeGt4yaXTN3YY4uGxqvfwguV4BtFx2ryXUy3F7UeKu6JaonF0gLw1Sr4bJEDZ3b6ktM/jXQa9rhPX3KfMIOdqk6BGCNoAVXT8P5rlDxloAR8jyW2CWdTRO0oHVx9VilqefEHTjLOh+TAk5R2McLS+FZ/vEd4GuMoVrXIic+PXZkpI5FEvyua244RMiGA4tO8WvyNbBvXyPW+5uEDlNE4ov0iDXdqndxsRpZxcsMViRweEfI3SzWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCNWqAHz1WRX2GypkFuXsUY25/2IBfB8V+pdHwBfcxg=;
 b=jltrfxub9bHLa3QLhofNRx3ksk8c3ZUXWnsgaMT7OO2OE1/SSACYT2qDa2SdeDlzETaRSDdalxXVKtzyClyCUt8+D+axX8JZRbSTZ8tyZDdjXV+mpa2Qhbz/0sPkvpF+pdnpgtEFFuKjAxEMYnaJ3vAUtCX57ioMINOuYBODGFmXIw9TGBrU8CFHXgTslbUz8z3TCX8EcmUtIdFFMukc2rHNT17NDTL/d030NS1ApKGdJ7Fc6siUjm3AHPS0dlxOiE16fSetXDmTIxY7L6hYDjziM2k6tCH+NR8JgJbk7tWUah0HHkkoNWKnHCm2z4Xz1SYi+5CDx0cpI2F5aGOd0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCNWqAHz1WRX2GypkFuXsUY25/2IBfB8V+pdHwBfcxg=;
 b=Yt4DO0OMQoonFJaTRiear9F9XDezN1wrF0SfeUcf1qJSc/sWy/C80q0SaKgraJyz8PQ0fPjc45NEpf188lv+7k147v3PyWHZKczpwFBcklgwdE2kcuWxHtI53eA8C+oGkUpNgv39ZhlntqK3zXedqFhLiIturIp9AQTVBHdO0gE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR1101MB2106.namprd11.prod.outlook.com (2603:10b6:4:54::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.28; Fri, 23 Oct 2020 16:57:03 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 16:57:03 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] buildstats.bbclass: add functionality to collect build system stats
Date: Fri, 23 Oct 2020 12:56:48 -0400
Message-ID: <20201023165648.5515-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201023165648.5515-1-sakib.sajal@windriver.com>
References: <20201023165648.5515-1-sakib.sajal@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 23 Oct 2020 16:57:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef7ba6b0-4c58-4bb9-68ef-08d87774aa68
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2106:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB210641C7FA7C229A5B5303FBF21A0@DM5PR1101MB2106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S2jv9ks2Aq8N3ADLgbABaqKAnjPeNB2x5cOvsSqdWYmVjZgPdPF4Nbu2wx/jIuvuna6AoFzuLiP83kCnelJdw2vOm8mbsPKZOy4dgh9QUw/RhDBTS6OOkfGF55cLZQv4WnhGXkXlpzqs6FslUyFILtPMIhYZPtNpi408bLQDvEPtTjUN8R99nv5WIiQzuFjrivJJea+IigM0Y21/7uvnIU4l4zyOWxNBxd7EPzhZOSGSa0CSfyOtwsSfj7ulDCg6UNEHSrGW12g/x/sIYFsadJ99uygO/L1S5HSxzUceSc/Bq3BTDowBWKWLahfHonBVpBXAk3Q/LSxgvsJS3Ohf3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(136003)(366004)(44832011)(186003)(66476007)(26005)(16526019)(83380400001)(6486002)(2906002)(6916009)(52116002)(8936002)(66556008)(8676002)(316002)(66946007)(6506007)(2616005)(36756003)(478600001)(86362001)(6512007)(956004)(6666004)(5660300002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	M2lvcWWb0Lc5UGqQwN96JhooBT6mU+JM6BdtZCyh9S/JgFzF7gYGWDqPWCBdmcyswN9cjGUKaaoBEdnAHfr9VOrBAircisc5AZVV2tgxofX+xcwvkCa3UlVGxhKj5rXVdrivekoVw0G6LeWeJqP5aWZpl8x4r2orY1qSSm5NH5oCkNRROtQuTivtlUSHv5p3BTmXYsWKpPlejF+KOlz/GzRcrQeo/Mxj7oFZXPcIJGLJyh+EsNKYvzbgTxxRw8IzkA8MXlYardT1Cn2eIuY+2fsgC+B99dfZD2vuvbJXQCVFMo/f8DayV0xTzKQ3Id5oj0YLPZlRvG+0Ivp5N61ct+yh2/dzSsKm0MagqxZLiv26b76xhXaHibu3HhrS4mhThcUvmVYzePYnOT/M0fipZC4JGAohNQN0ZTYolaO8zP4pq8jJp6vRBdcZ3OMNByNCj9NcgOfne+JN9EHx/rP1lmSCuSKBbkQkW81lVhrPW8muqOXYB+af+SUcg2JNibQD+l33ginfvkaOvGkM7lOBNHGQjBBwUzhTbfFWH8nk6VrlBwqGnYI+7m6blUeLhHjA3zMAOWkxCbzq9qytecE/kOu+bbzHSGk7O7LtGXo/osGXVVpEhWm+UTDnYssSJuC8A7rGGgEJfAHu7GxHgcZOMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7ba6b0-4c58-4bb9-68ef-08d87774aa68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 16:57:03.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR7nHIBdD7AGMHIUvC415cPFJ6Hcmr8atBSkShBi4cXNT0a8+6FiEmvvSTheiQSh7M/pU+bHtd5nwRH2YkBK6WN9bWGZDKlGNinaHv63igg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2106
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
Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats

To enable logging on a task failure, set:
BB_LOG_HOST_STAT_ON_FAILURE =3D "1"
Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats

The list of commands, along with the desired options, need
to be specified in the BB_LOG_HOST_STAT_CMDS variable
delimited by ; as such:
BB_LOG_HOST_STAT_CMDS =3D "/<absolute>/<path>/<executable> <options> ; ... =
;"

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/classes/buildstats.bbclass | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbcl=
ass
index 6f87187233..c68d7bb8a2 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -104,14 +104,38 @@ def write_task_data(status, logfile, e, d):
             f.write("Status: FAILED \n")
         f.write("Ended: %0.2f \n" % e.time)
=20
+def write_host_data(logfile, e, d):
+    import subprocess, os, datetime
+    cmds =3D d.getVar('BB_LOG_HOST_STAT_CMDS').split(";")
+    with open(logfile, "a") as f:
+        f.write("Event Time: %f\nDate: %s\n" % (e.time, datetime.datetime.=
now()))
+        for cmd in cmds:
+            if len(cmd) =3D=3D 0:
+                continue
+            c =3D cmd.split()
+            if os.path.isfile(c[0]) and os.access(c[0], os.X_OK):
+                try:
+                    output =3D subprocess.check_output(c, stderr=3Dsubproc=
ess.STDOUT).decode('utf-8')
+                except subprocess.CalledProcessError as err:
+                    output =3D "Error running command: %s\n%s" % (cmd, err=
)
+                f.write("%s\n%s\n" % (cmd, output))
+            else:
+                f.write("Error running command: '%s': %s is not an executa=
ble.\n" % (cmd, c[0]))
+
 python run_buildstats () {
     import bb.build
     import bb.event
     import time, subprocess, platform
=20
     bn =3D d.getVar('BUILDNAME')
-    bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
-    taskdir =3D os.path.join(bsdir, d.getVar('PF'))
+    # bitbake fires HeartbeatEvent even before a build has been
+    # triggered, causing BUILDNAME to be None
+    if bn is not None:
+        bsdir =3D os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
+        taskdir =3D os.path.join(bsdir, d.getVar('PF'))
+        if isinstance(e, bb.event.HeartbeatEvent):
+            bb.utils.mkdirhier(bsdir)
+            write_host_data(os.path.join(bsdir, "host_stats"), e, d)
=20
     if isinstance(e, bb.event.BuildStarted):
         ##################################################################=
######
@@ -186,10 +210,12 @@ python run_buildstats () {
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
2.27.0

