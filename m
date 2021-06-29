Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.9378.1624978639519315933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qwyd5c9k;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=281492f5e1=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TEo4Ka014342
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:57:19 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a800uh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhxfAngKlkL7T+vQUjJGlD58CtCsGq6FUhYGOegcg1n6vL3j1EYaxsHdvUmzL3T+ehzbGEYcwsdTfsxfKVhI0sPdN4cCbXBDlm8ETDGrVm6ml7NzM7l8DJgS5/OcZJSP38+4e8qL0hjpui64jook6oKBgmuOznwxRb11VnjAbONLXk0rXtgTrUeVm0wU1o6H2RZYlT+KxOpV3Ih6VNo23/PfOvDzbqm4MQ5sO5An/sTsGHbBm046cK8dNNys81cj9WZRIjFWS4p858mkSrtbBWtGxHhsQVIE+H7km0vKnk/p2WioadsH1x3hpjdMSa9ixUe4NX2KgCPAapL9vsBFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y6c3x5VUil9fKEmslcDO2esJok1do8xOxCse98QJ7s=;
 b=kYu+OCQAV5c0/pmOE5qVBh+lN6bSlZv4SD89WNkJ97o7O9Y6vM7OnAY48Xa+ft2XYlowdqndoI6hy9UWTgnqD4SPd+c81jxKSdjaSfwtfIIFzcsG8FlOpszczSjUVCifTV+JCJPyg3QLzM+zphmnCTWJgvNTfYmXzJtSABwmZ4iap26+YXGHptzM20lyhB9VMynDBH/lqyW1TDo4cKxvcs1v3aLvltwpn2jaQDgJaHCF2bP1GtElrYK45REe41OxsGHoKImfr+jJJcdlFQqqzjmNsgl3EAk8AhttfOoOJoI0SR1JDsSaum94MRW++XFbIQxi5ESRK49rO9puSINYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y6c3x5VUil9fKEmslcDO2esJok1do8xOxCse98QJ7s=;
 b=Qwyd5c9k9kG+++LmlHlmiLkL7mCM5cT5ioURRlDEABEIGe1fBj40Z7Iu4NqH/g6cypXKQyaNpdKPd5m0MnOX2pumtNoDhglq5UZJ1JkXpNemnGahoRrzcotbqoJWCtfQGXVq94TTYxK6UHppcyf6oLuhLe45EzyNumalJX1N2/Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 14:57:15 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::c0d8:4c7e:53dd:6b1e]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::c0d8:4c7e:53dd:6b1e%7]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:57:15 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/dump.py: Add support for QMP command arguments
Date: Tue, 29 Jun 2021 07:57:02 -0700
Message-Id: <20210629145703.979269-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629145703.979269-1-saul.wold@windriver.com>
References: <20210629145703.979269-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW2PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:302:1::26) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW2PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:302:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.4 via Frontend Transport; Tue, 29 Jun 2021 14:57:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8c2c7d-b209-4e5e-be42-08d93b0e2e54
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4401CF5763C8C87E691644EFEE029@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TZXS9h6vZzGes6HpgU0bNa2cN6KvrHJvV8QUcmVUYIy3OEy2yShTFLp/5y+llKEiMSg6lIRZujNZOd1cOCIbrmxy5APKjKB91shSqDgDdrixdgYvOkM6Wip00uPzvfRI6tn+LKjYeSZIZ+OLmXY8saii+Hhk4QkMjovNdL8JjRbnyETGpzmcejLUetoW0tXTT7EtQV0wFfpimXPzvStfFsv4X20DdtwhTfbkq4IUY6b/0HWbpuWn4e/1G99SrPlHsbbj3yo7uNvWg/ODAleMTx9BtNWskFYHO1PUoV056pofppv0nIxMdI9tD/4SzMlsUGU6NnLlKugwiYSnmANvsleQei0PUQiwx/axM+1MxrrnuSW9/EOPWsXO6mySCSLu2sKuoS5tK6GZV0/INxh+1gT+ObVlT1jMmB8PkkzwNw7JTABa5NtTloEj4lMxr2brmzXGN8PWfz9vKMp+Ip3mFjADK6AoJmNyv8QjMiG006jVSLLuwgiLjoYX1v2s90bR4aOPzjT1WyAGF5KuktN03J4SSy2wdG4eB+LinYHMt0BamF8Y5wg7faA6mZO5aiwOrUMit7Jn+sGSEMot2qQsr158tonkC3tPrbQcKw46YTBkyxR50QEuETeOwODDVmtZr8KWKTWF+0vsz9WJsUAZlEP/+ZacmSPi6PWh1Exw3TzvtY6cMuH2UEDnszXYdFK0LY67XkcCvEpZBrsPrNxcFvtdkNayuTYwGgOlWOYGYJI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(8936002)(316002)(6512007)(6916009)(38350700002)(186003)(86362001)(26005)(83380400001)(38100700002)(52116002)(6486002)(956004)(6506007)(66946007)(8676002)(1076003)(66476007)(5660300002)(2906002)(16526019)(36756003)(6666004)(2616005)(66556008)(478600001)(44832011)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Y4ULEKdDPHumf29tn1ib9YGW2rk82hKkcIy1V2vJYL5K+Dd5Rzza9C2PAUz?=
 =?us-ascii?Q?zJgVZUbhwI8H2ZQH88kdRBceMdFvmN5DALdRoBNz0XQzCy7ut6zo7QlQXFnU?=
 =?us-ascii?Q?7u16xd74wmexMWtGpRo+DvWdRe9XGZdm2EvgJSmBLVhqVgFeq1TmzS6Vrqun?=
 =?us-ascii?Q?FD5HNUgZinrtJzvHUk7bNA7yKAthr/WlwTcM/Epv7DqvPSCmjb1QAmJAg1KF?=
 =?us-ascii?Q?L2PNtd0+A9V1Bck+iSKPXI3FlOU4kp1sjbqLkiC29NZ3FSJ0b6dRUGHtub8c?=
 =?us-ascii?Q?CyZcgX/2csT9oF+3Z7TpfGMEX1Ui22twgt4icBlL8CDhnYN+xYq1cMLeNDBZ?=
 =?us-ascii?Q?xZcDJ48lN+yY5AHinrBukNjKXvE9lvFg2YVeDxWPtdMqms+WdJR5StBiJQjn?=
 =?us-ascii?Q?FrCK8O+2z/PaBCh7pB+sC3xqjtCwEPJYx6qzH5C43uEKfv38+jmg8VkZcnb2?=
 =?us-ascii?Q?FrcGlgVpZM6T6CnBQtqpek0S8e0S6JRF+C56E72NIGEKRQ6i0tyc9lI8e6ut?=
 =?us-ascii?Q?5OddZFCLF19hSYnMnxWlqs08yaiDWH7548608zkoSI4FEnMH8QthZ3PB3xDc?=
 =?us-ascii?Q?MTcjhvAbRQl99lgvw0tTwOrNlNvaaoGtLtuposvmHi8nes5X9mml9PN4AaAx?=
 =?us-ascii?Q?dnaM+eItsadc0QA9C+wobwduSBE7+AWdC32VHvdo34uxgQA/TXL7K6X7oq7p?=
 =?us-ascii?Q?MXlrY82F1TSg3CYQKfZlreAe0E31nM1aexrlhIaQts7iX19eO4Ny1jrNlD9n?=
 =?us-ascii?Q?fdjBPG4zNFvYgp8NH3ar/IlHoZM+BglIgVupCEzY8lcZDzB6yi+9a92iviyQ?=
 =?us-ascii?Q?7hNCjYl52hcdFIgduK2Qpc4GBrhkydXeaPWLDXr57i0uPB0JTRhqN0OCM8E5?=
 =?us-ascii?Q?oYoyFU5cyOpFEDyfHgEuy69cF+bt7SMPsjnCr8iNyzRL06XWihklc7ezivtz?=
 =?us-ascii?Q?5eyX8g96Qm0tWHyBkaSx8SWENkmOWEJ12MJSgxyM7VnWUQSa3qdD7miYixFC?=
 =?us-ascii?Q?AT7Da58Ahf8Nv5iCxMW1kIFJTzpWdNFgbLW5RuKf13O2cqufK0LKHsVIttp6?=
 =?us-ascii?Q?RcPsYxmMjXXqHs6Uw0Nq6kBglKzoflN28UZHHYA02W/srqqM0tuA8RD43eas?=
 =?us-ascii?Q?hdkUuTIp3Zz4xeIOk6pKh/ET+eDS7qoqUbXvZ5NOgFOF29Jbbp9bl13ssH5Y?=
 =?us-ascii?Q?P8MEkiGwJeDG8GUelzOhZtg0OL30htJRiXURG9pTyrHrOrD1uZOiKOWjB0P2?=
 =?us-ascii?Q?6WrdjrvsFmZLe7RZpMnNqx4BSbJWdR7Lr4ZmJ3esYiuPJR2w0TTtZyrX5ZM2?=
 =?us-ascii?Q?alll3+U3OcG34JyEv0E/o73R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8c2c7d-b209-4e5e-be42-08d93b0e2e54
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:57:14.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+W+0kqUiVegx3R2TQQU5tqtJt6H3acQKSHk7I6+iLSaTDqCoMXgDrCrDb0bc3D8mMKpm58nCARDVyD7j7ii0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: fDri5uHTEn6BWnPJoNrgApDvCv2uPJs5
X-Proofpoint-ORIG-GUID: fDri5uHTEn6BWnPJoNrgApDvCv2uPJs5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_07:2021-06-29,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=98 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290097
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Need to ensure that the dump_dir is created correctly and available
When command arguemnts are passed construct a filename if needed and
convert the arguements to a json object to pass to QMP.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/targetcontrol.py |  2 ++
 meta/lib/oeqa/utils/dump.py    | 23 ++++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 005ebaa7f39..5b925e4fa4f 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -152,6 +152,8 @@ class QemuTarget(BaseTarget):
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
+        if (self.monitor_dumper):
+            self.host_dumper.create_dir("qmp")
 
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

