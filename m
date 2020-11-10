Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.53])
 by mx.groups.io with SMTP id smtpd.web09.678.1605049680392692260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 15:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hiiV5pq7;
 spf=pass (domain: windriver.com, ip: 40.107.237.53, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/sZj6mhwv+PwWeWxsQTReeFxXg0YQ81M9GIcMCa8U5GVIla2JWh1SrJtE5w8qjtAl+7Uk95awV7xwvk653exHe+tI2KX3sXb05ZM7rT4LTG+SKI8UpTgzqAiOrmocUcgnGYYJZHQBhMdCefnjvNxEaRzE0MkaYcSvpCny/zGoROfu9c0vgcKIR0y5plxDbZtZb+nYwSmmg27FpxuNaAWmIAlKLwo9NGgDnOJJMSvomtfRQKPAnO7MBLFythKgqxzK8HeNhP8307aVicLs+1cM8qKWgNfnwd6TELHF8mwuirbDnALV7PgpjKtqAUWjKyWGRH05/o4boB6wlvoFTjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R+N4m4BqbHvuQEwU/RIIfDsCipq2BBi4qJ2cMWtVtM=;
 b=Xv1f23cOeSD9bp96qwyLOAfCgLBlrS6u1N7CESpRENdqDYMlVVDamynJ8ZUnFhsLJTKhL8U35Qmv++8zGNMDvDQ5QGHtcc5EfnLzfcXTszo9s6fLQB2Dq4RlleX+KyEwEnexN3f/+QI0M2l4HK2Dm0MWFnMk4HvN0p+10DDf+1xG+UewtDCGOK1hZW/ZJuC6WJz9gmiuNn51cHbPBrE6vuCeG1rt8HPtAWK+VWjYM+Hh9nCQlg3jvSZVe+72j9ZCW1GpoR7G56b1VNwWr2eVrDuO5ZLo5B2+PrAiqYKX6hOGyzv8Zuef/aYizO7SCuECrUS9sH7kAnX4CruY9d0Peg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R+N4m4BqbHvuQEwU/RIIfDsCipq2BBi4qJ2cMWtVtM=;
 b=hiiV5pq7pWI9hBwCHZRsd+PTw0ogeQATNTK2nqZ6bsCg0E9yShsG7+h22pJ4o5n3A/lLoamM6h/pCd/bq6AsE7h4XGk3SYvjYFK//Km9CdshVQqGZIWjRCS8t/tMxG8eO34aHj2mjR+7DsdPq1vJ9g0Ujab0rkdYLdmeB3Tci0g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Tue, 10 Nov 2020 23:07:58 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741%2]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 23:07:58 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] buildstats.bbclass: add functionality to collect build system stats
Date: Tue, 10 Nov 2020 18:07:44 -0500
Message-ID: <20201110230744.30544-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 23:07:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e620c8d-398b-4fea-fe6d-08d885cd76ea
X-MS-TrafficTypeDiagnostic: DM6PR11MB4202:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB420240B825DC0A97883E20FCF2E90@DM6PR11MB4202.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XEzO3vFrQ8a49ThEDOwlFn85NkdAQfLoPfSjqv9hhzQxHiGzSb8P4HjVCIdSR3xGcxLNvH4ONgwW6E/LADuDZvCi3ZPVTzSLbiWNgbaoCivWHOZBBwCmJurmP5zRYE/xu6aSsvCuD/miq7Xl3MFrC5cO5IZPHg2+ZtfKhCBFAaVoBWK8UuaV/mqmRZ+lhWcCuTXuNbHrdET8mThvu6ZnVhenZVg3V+ttNZ68jtZdFn9COAkjRQf6vim6v0jUqHNiEsGvjWmGUUBJozboNlkWNYsYZWUh3dxFlXPIQR6PVyRZgJnHMX/taQq5cvytMDiuVnZtwlbTAaoL3zQ/BNcSUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(478600001)(316002)(44832011)(66476007)(1076003)(6916009)(6512007)(66946007)(66556008)(5660300002)(6486002)(52116002)(6666004)(186003)(8936002)(2616005)(956004)(2906002)(8676002)(83380400001)(6506007)(36756003)(26005)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JCShRz5WVs70p6rjm5d/nHECpuxmsh7nb4kYCGXZQ0ZIUUorkF7hUn9SCobxMVWFFX81rg+ZGk3bL0WbtYB5BoFc+5fCRo/CzGGh81KcLLjddLh/w6WgM9xWwAmxUZeATieT1iDhjkkWOy0fsvW2wRE3iAj6q1CHYHtWin9pIYmmwsV+mRW1qg/57ZA6EPThRPaugCa1bEFDXOJ3NQyvYtwYKVXjVb4uvVp96batDOIldg6btNg3n1H/wATht04drWx35mvGXu6H9oaKZBFBtw6wkS2ihG1GHE/4IWGLz3D6tN0KL2L75nJDwq5XUEs7N7CvEHctnfSaAzF+Fl+LWy9wnrpPDWCavnlLWtNlmzxwZh1kxk1iKn4prmmhXhvvvjmPET2cYASRnv0MRruWzQtFTCnw3Epp1IEWrfjMT9/WtkWheAbw9Alh0jXJqEWDjn/jWw9ZWJVgk5TvZu/R5TuZMrhg75jAMWJTE2kX+10qUaTs4jCd/a5P/nOTHsDPWGfG3I+cYdD/bD3qoslsyWJnaCCrxZjo9xU4qLk84XUV/PPIM1kDlaXGxH54FVe/qdBpTs+IdlWv+vl8tOFm9jbqBMN1m9DyluUO4Mud4ymfkrDGOlw8wAX4m79riMZHZAct4XDgrE9vtb4TV5blfzbs62Y4+8NS5srXtqA0CZZNlreifj6eqZLerqiSQsBFN14YFK+xK29HTG8G/jNE7e+c171AUgLU2g72fLnGp+Voz95yyw2ScDy0Z+8KdI7UR8IwqO2yziJdxx8FZsUxPVMXWsYihZzEoRbqKmjFu4OTDeMA77L59GlG4Dcbk8+SBhD0+qJmQaO2q7PDW0Gp2+dIXl3aribvqmZTqZl6K8b1bHREbQ2Bhpd6pzub+B+Y7OdjDdI+OOrraQlk+3KuAg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e620c8d-398b-4fea-fe6d-08d885cd76ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 23:07:58.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GZnUpqW0Q4WGm8WIt3bFLmlvBKNEaXqpIQ3OfesU0FGWS5IEk9bZd6LdxK0AYfLKgII64n4PQyP4wdt9Oy9ncOqYlS0wA7odSkPOUq+duE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4202
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

