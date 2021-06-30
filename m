Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3218.1625087840621321402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 14:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Pdzi1Rmo;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2815bd32bf=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15UL8qaS002039
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 21:17:19 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g6pkh3j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 21:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSkI/SL3q8NcYt2LW5kPP/MLJ+isCiXATYsptecZTES1dDZOR42AFGfcw/bqaa546GwPLqJUj+qS45Mv1o6aX5FcZHgqEhH5usY/fKm3sDoBs5aZGgNNfhTq1M+bg6yHAdyyhbbskhFygkKIWGeBozXa7bd2qdbYxNUJ7Q6fN2XRs6RFCCbN8iqu0NjOp3TCpUdTjphDnZhSPjmE56qR+dMRe6wfDdzA9Kv7ZJvPmjY4ebrXTB2E1/mxzAHxVUSozOG35l8/jfQcRdcnA6BFLKNMUnlsWgXbuKhPX78XbBsywXkd24cy07IXJiXPW1ISZp/6s851vWqS9qzfh0ExKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymCw4NxVuGXI69pzeRJfTuSwP8w6lgSiBpRY0v95SRg=;
 b=KusIl30i+bAHm/Ph4oXBGJa0Oxa3xfNg/hmQz4KqxjlinjDZUcd/w41RMtMI+x+zSBD6UO3kkhEQv9a4/a6aMNKDQk5vOV9J/E1ztSjcU7M+ziIrvA8GBfqrVFAbGT04nLORqXieyGNSY9br0mG50pXUoMrkGtcA+MvuzqTuy2sbmd5gBZVydKcUyeSG2g4olgN7P2+2SFO6F8E6UBbA4uw1+2FwjhTw+3urJxw9sarWTYMWL1UcwKylNmwBy+Uf6+XxCdmbJMSlaCZu1XKIu1h9lpmbtORSP4exBDRHc6Rr9kCIY06zr4vthaKczzBDhP74gWz5vN5R1qlspZJALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymCw4NxVuGXI69pzeRJfTuSwP8w6lgSiBpRY0v95SRg=;
 b=Pdzi1RmoSBpdHExSdG9W9aH1r3l81OVsGHtWsGLSTkrnWXZAofyLCymg0MHrzSLmmvawmfsnTC1nEeVu2I4QrToT5J6JP9IB1sdMlBY6yYHJEXepr7xbaRsQmFLhRBUoypNmMnAsnGcLGtDTlD20h7nvoE40lO5ya4OyeMht9R4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 21:17:18 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::f006:a5f2:fcbd:3424]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::f006:a5f2:fcbd:3424%7]) with mapi id 15.20.4287.022; Wed, 30 Jun 2021
 21:17:18 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/dump.py: Add support for QMP command arguments
Date: Wed, 30 Jun 2021 14:17:06 -0700
Message-Id: <20210630211707.1783570-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR01CA0025.prod.exchangelabs.com (2603:10b6:300:101::11)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR01CA0025.prod.exchangelabs.com (2603:10b6:300:101::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend Transport; Wed, 30 Jun 2021 21:17:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f459121-57a1-435b-bef3-08d93c0c70a9
X-MS-TrafficTypeDiagnostic: CO1PR11MB5138:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB51382FE18DE99CA09234BA38EE019@CO1PR11MB5138.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kn3eCF5tcS52xzj9mNmumzHnj9iUkmT4Z5QGjqSK4/9MFfWNq/WpbipSxmCYh37kLjGTpzReUC5bh+5eVgMHWvqzd4lm6WCB/USBqF+rzBZRnGUl51Xh7Qw8GWZ/Wf8g7xUr+AZtp8hJXdjRZS4eCquFQZr1ZPB8mvszJkkLq1bqWMId7XpTDUpYPnjVv9NYmVJX2CQDPkBk7ZepzLxmctSpLGisSvXvoGfJ2Jcu1OxeavxaRkjDEXO6AZ+7/5x1Z+evnFxkSzhoUoE+f+09UyYtxwV2EUwX7We6bgzQKHIwLnXGg+Ry/S95HurPl5Ic36KLfARO1yLqzTTX3mvqWYBla99B8mdZ5YRMXF+DeKD70hi7Rl3fX57Mz3YEVvDNWx/ZzCpenU5x1dVSCTGzq071tBEwvXNQICh8BQB2AUGRXoboWzvfAmjQqUehOSXgJKD1BPfnN0bfY7D2zux+bJRcIoSVS0hqCOIctLRxWwjJguAsU6DJyPQEbMwTX3zurfFt717oR6TJSN0KBUMN/2hLzgFX7nZt3GZHk8J8NyUIZjGCPoa2qL/SavO/FErrGtqQ5y7j4RIw1UUCskCytqp2gd4CcGvNKSOocnpRCsGldMj/XnsG0+T76xEIWCZvK26LD0GbbHMBaqTRvatXqaQ0AXOms5ELIeCXr37M+TRnjgv+j5Ve8MG6gSX1fRIqNLJNTzs7oLdA10pxBcTMbmynR5xhHV5jrI1u2bTVZxg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(8936002)(316002)(6512007)(6916009)(38350700002)(86362001)(186003)(83380400001)(26005)(38100700002)(52116002)(6486002)(66946007)(956004)(6506007)(44832011)(6666004)(2616005)(36756003)(66556008)(478600001)(66476007)(5660300002)(8676002)(16526019)(1076003)(2906002)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JPBp8X2hGbOE9xPYENwbmqLXdvRH89mbeMwbW5lGVnlu8vhkDV/1EYlB2QAR?=
 =?us-ascii?Q?E7B+C1NWaygVEsvkvD6e2098fmRCPFBBBJnEFC9hjPl4yTRY6fRKnrYiIdUX?=
 =?us-ascii?Q?D4aqks2Wtcr7OfN0N1YMuN2LJ7e8/UFXfIu9/FxL3oxbcF2foHmNygk/LqvR?=
 =?us-ascii?Q?RkE9VRM+zru0NWWZZqvafu7QB7lqX+c9EQOceadxRTOVIjb7md+1UN2zLSUh?=
 =?us-ascii?Q?eisJKAz0deNl6a0AvhUSq1HBFrJlWiP5dduNscBC5u0WfZ+XaCadBL09Wyx6?=
 =?us-ascii?Q?9QvaLcw5Bu9vdeQqX+uiUpB+sgcAsaYU0ViwBLLQKjJVIsQCnLdcV1mqhoIt?=
 =?us-ascii?Q?Nr2S3bJP4AQFkfS2icLm/iOSskyDdgO5x0rbegHXlZmC1lyjDWfltsQBn4qx?=
 =?us-ascii?Q?3T1ZAreA4pkzhiBee/LUQkWtp1Hb0uOaXeFKmyi1rK5dxaw/K6pQ5YH54nto?=
 =?us-ascii?Q?tfamcg811UK2AbnqA1oD4uhIDYuzIa5oVH6O37k3ceKMggobiFYk7rDGH7uH?=
 =?us-ascii?Q?fweVl5hBbwjl9kqAf/5jzOUwePmki0GC9N4d5ZjTOirAruGFR1TnweTEQylE?=
 =?us-ascii?Q?GZDMCY0NcY0T7MmA6AT4wa9uL1VjehwWViRJg0xw37KAOJEh+clVW/uDXKu3?=
 =?us-ascii?Q?m2PCOkpaAobQvrTKq7T44dfPggDVSi4FZCy4Gk5CQqvshg1YUuVF0UVIl1vv?=
 =?us-ascii?Q?eU5PRfTVjx+82C1RnAniNAdY8bj+T1YP6at9kNaW0nJrC5VsXA5Xo3jfqEeJ?=
 =?us-ascii?Q?x6fN630XcOm3CVKMymdw1k+bp+GFcNGJogAjiKJyrZ0JkhHsR3CFtwLq1FeZ?=
 =?us-ascii?Q?DfiOjs9lelo0TxyBf1xIWQl47NL1HMoDNEaIHrNuOHRG43xfEQgG+GD+OMdv?=
 =?us-ascii?Q?ytNslu0Tb1ZTja0DqILlNvP/kbp5WxmtujCg8/Fvqr9RlNjhAzoPhQ0d3rZs?=
 =?us-ascii?Q?HrqUgAREehkc4xcfSCScU8wXrEkaoZRTUQhasF98D2zVSrxN5MKlHhJCK4vw?=
 =?us-ascii?Q?bYs2z1yPukPR6anvSWhzXCBkkMWw5U5kuuNjTuWnfmcjlr+P9reMHBGuQ/bE?=
 =?us-ascii?Q?fDMdiT+e+YiFqJQK8B/KFPU5w7O2+jB2KnKzTa9YsaVThXdNnqE1akPkvaCC?=
 =?us-ascii?Q?GRsLNQCwx0YzSDEsvSmHg6yplfJoxb470N8munC12P71zng8IZraYcGaeaMw?=
 =?us-ascii?Q?gcFT6kzKde1rZgzzMZjomkU0aDwgOOV2/fOjMhQ9XWhThKSiTL8Gw9mzidOh?=
 =?us-ascii?Q?Eio6nbOH0tkVkH2sfHx7aSYMHxo3knyg00Kzeana2Pua519ZE22eBrXiSSQf?=
 =?us-ascii?Q?LV89UeQfxIudk5kSOPx06zKr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f459121-57a1-435b-bef3-08d93c0c70a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 21:17:18.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NoksrlSHVY8HtnZv2z5PtYyUmEcHFV21uuxNHOPdVNxEhAtdA+/0hhwjPLkMVIghQs/jXqPmrRhB8RxB36JMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
X-Proofpoint-GUID: n7ZOnOjPP26Fl9GOpDiGfoUZLjEPLY3z
X-Proofpoint-ORIG-GUID: n7ZOnOjPP26Fl9GOpDiGfoUZLjEPLY3z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_12:2021-06-30,2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=99 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300116
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Need to ensure that the dump_dir is created correctly and available
When command arguemnts are passed construct a filename if needed and
convert the arguements to a json object to pass to QMP.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: Fixed: host_dumper -> monitor_dumper cut/paste issue
 meta/lib/oeqa/targetcontrol.py |  2 ++
 meta/lib/oeqa/utils/dump.py    | 23 ++++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 005ebaa7f39..1fdff82889a 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -152,6 +152,8 @@ class QemuTarget(BaseTarget):
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
+        if (self.monitor_dumper):
+            self.monitor_dumper.create_dir("qmp")
 
     def deploy(self):
         bb.utils.mkdirhier(self.testdir)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 843e19fe8a6..bb067f48462 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -18,6 +18,7 @@ class BaseDumper(object):
         # Some testing doesn't inherit testimage, so it is needed
         # to set some defaults.
         self.parent_dir = parent_dir
+        self.dump_dir = parent_dir
         dft_cmds = """  top -bn1
                         iostat -x -z -N -d -p ALL 20 2
                         ps -ef
@@ -47,7 +48,7 @@ class BaseDumper(object):
                 raise err
         self.dump_dir = dump_dir
 
-    def _write_dump(self, command, output):
+    def _construct_filename(self, command):
         if isinstance(self, HostDumper):
             prefix = "host"
         elif isinstance(self, TargetDumper):
@@ -61,6 +62,10 @@ class BaseDumper(object):
             fullname = os.path.join(self.dump_dir, filename)
             if not os.path.exists(fullname):
                 break
+        return fullname
+
+    def _write_dump(self, command, output):
+        fullname = self._construct_filename(command)
         if isinstance(self, MonitorDumper):
             with open(fullname, 'w') as json_file:
                 json.dump(output, json_file, indent=4)
@@ -117,8 +122,16 @@ class MonitorDumper(BaseDumper):
         if dump_dir:
             self.dump_dir = dump_dir
         for cmd in self.cmds:
+            cmd_name = cmd.split()[0]
             try:
-                output = self.runner.run_monitor(cmd)
-                self._write_dump(cmd, output)
-            except:
-                print("Failed to dump QMP CMD: %s" % (cmd))
+                if len(cmd.split()) > 1:
+                    cmd_args = cmd.split()[1]
+                    if "%s" in cmd_args:
+                        filename = self._construct_filename(cmd_name)
+                    cmd_data = json.loads(cmd_args % (filename))
+                    output = self.runner.run_monitor(cmd_name, cmd_data)
+                else:
+                    output = self.runner.run_monitor(cmd_name)
+                self._write_dump(cmd_name, output)
+            except Exception as e:
+                print("Failed to dump QMP CMD: %s with\nExecption: %s" % (cmd_name, e))
-- 
2.25.1

