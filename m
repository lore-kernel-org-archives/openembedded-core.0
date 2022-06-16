Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FAEC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 19:10:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.22035.1655406630130259438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 12:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bxE2X1pF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3166309cb8=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25GJ5ilI005459
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 12:10:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=qCzEhqRA8S1FgoQ03U20lhRQDuASSdElKpuVuhxIDTg=;
 b=bxE2X1pFklcNqVO411bsp8iKfHXTWq92VKnCk2zc8Q+bpGxasNAkVPwbuVc3Y/5nkZQc
 JqD9ZO5bUpFuyD7TR+6razayh5jErzOX2e3Sg1KA9ol6ha5uNAKEQJk6dK2kRES1/g12
 GgxhXwEUEzM8DFx50Sn4NRe0GSTJ+2cpN6n3kPqZhRnBT8AaI6k4ueY8ncYcn/4X1Q4g
 Mm2BHjHzrA5b8ry4NhK3RrAx647egxuLNgDiAWWOUIavcsFnqZJE3Op0hmT/X+ZwydbH
 +uZxG+Q44Uzpro10vSeQWF2ZyhhW8yC7yexXpz4ejdaYhN+ADmNDFJ7vDKT+kAMroXyS pA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkm7hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 12:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxtzEa2W++Ku9dhXF46px8YvFVasPsLTey1zsEFwUYmE/wHyIYiB6snG3jADeXc5mO+JSfknlPgg017Qt//sJ5sHcvK6IX2lCXwsauGoETgNyxGECwaPDWtEYnkGXfnDa5mAtfCN/0WVhh6/X6QXgf7K0z8kcs0ZT7WJBe21VOpbKiY2UQ5yXKQEq0XJ+h2A/gOS/TDUVyHXEbuLb3XjuNztaoJuSDvHPdzSul5YaywKQwxjFyXLRsTvvaiXJSbP1b/wj0MkoscQ+U7IuC9H9ZipiKsikYJDIrGAZOWAry1cOm2kuM1PZduYnpqImakHHcV4Y2QBHfrgY1c3wZLdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCzEhqRA8S1FgoQ03U20lhRQDuASSdElKpuVuhxIDTg=;
 b=B4jS+0Pq4VMoUWlzfHHh3lQdUpNrldQOBSY83x4oaRSctpGpvv255/nAfsGZUZtzanoxznKULxkqA2Nq1E9GEQDKXLZVgvCUZVdgcxHdUzvBuqquFIdxYxlrwefMS8FP4SmXu5qNYcU0mebNkIEY8HEfzo0KCSbWyhmnXVIGGM40F40HT1j3WlzFV7OFaOlWgzTQT2jfe54HthdALvBq8TrEWz4YuCL8WF1J6N17DpZDsI8VI74T3nXurTMQZwvFHzl15TPvU+EGXLo+MafHvveQej+hsaDy+tJHQgbANKeEQEJS6dHcFtiCqksSNWMht4N1bzxyE6qjHbHd3O3wqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by MN2PR11MB3936.namprd11.prod.outlook.com (2603:10b6:208:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 19:10:26 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::155:594a:ea54:1563]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::155:594a:ea54:1563%7]) with mapi id 15.20.5332.016; Thu, 16 Jun 2022
 19:10:26 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] buildstats.py: enable collection of /proc/pressure data
Date: Thu, 16 Jun 2022 15:10:13 -0400
Message-Id: <20220616191014.3935485-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::27) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5351673f-826e-4e25-6902-08da4fcbdeb5
X-MS-TrafficTypeDiagnostic: MN2PR11MB3936:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3936EAC0F420269D2D4D3B2BEBAC9@MN2PR11MB3936.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C1c+5okBzQNiItH3ItcO5FjPieFvaaMFIhiLUqIWOsVqAR6WHTlDhiOw0PyvAbAk4t562psINRPhWYRyP+Wh5/dxZ8MritrxbTY2T9u3uZ5f9AmSp0GugyEMksrP8baxAMeYdOV6qweCurQGpZd4ZrWmK6w7G3I/xcbxvvaPXL1Sw9aUMuD+QtpY+2GyoxxTKu5vMbhoyLycqUWhz+xuaOvracmnypUWBTDIjtCo4pGPmV2dIvm92QKxYwDnJRvXaxHzbpXa/3DuooLKDPRNH9/Z1lyJKM9IUjjFW0xewCbcI0cFewE2FLGvqCZ6CuaFwMihg7tvatsuKks6qNr//YsKCX5CRPWTrRRhwfamfY0sYDifxA1A4QoA9C6SQPz8BpS1XxzXgU9fFN2ofoDNgC1lq+P//E5EJypvIOcHToVOeTxRzTaHeBNR0zc4o95AaiQyGb9BQJg8sil2fm6o1k4j9aCdE5dbwRpz9K2kYwVZEYbxl8aRIBdH/kFB7n+PX39xM6zkdvWaKqGYtW1dl33TwDfupaWRG00dBrfPOHrDUP7XYY2ewRR9Ysw1nIJJPBQlZ4wu90YvxAHzsSqcBrvnFnT41Xrxqt6WjcnY83hijb6xt/FaqHiDlaw6ZSa3HZcllnPiiLTNTsFRFQ1up1jcvZCACTgU+WlCjmLLi1U5lmqJ2c6V4SaLF9QxO1dkIGZVn/u20QFndZVN/A8LRojvombsrum9YLyr+Z3e2gfvhQY8jVI6qa45orQ4nVU630fEGQQE68e3bpZBpPYMyFtf99Ff2NTGenVAbLzAFto=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8676002)(66556008)(66476007)(26005)(66946007)(6666004)(6916009)(6506007)(44832011)(316002)(2906002)(8936002)(508600001)(186003)(38350700002)(966005)(6486002)(1076003)(5660300002)(6512007)(36756003)(83380400001)(86362001)(52116002)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pMcTJswG2i5lefjsw2T5oPxewhIXZJAvFZXLLkSFGC8URMeQ7YGFvzvCPCs6?=
 =?us-ascii?Q?4uQ0UL1nGfxtmf3wWRQyTrwVLO7g6HxGa2YMEr53NGDiAyXcMHbdO13AJDGP?=
 =?us-ascii?Q?eXMR/YmbPUJ/VwFiUbXUCYJpYqZfhZV0YSG9pFhpaEXfBSf5HUvl0fzBu2my?=
 =?us-ascii?Q?/LtnYa30x0KPTSRPW+Kwf5dVYSuJMnUVcb9HnHAweiwFxGwvcuUMkrJn0ZPX?=
 =?us-ascii?Q?xIlxevxMNjgFQmGEpCeEXuzhUwb1wxZoZfMExGtJCalwaLuvlM2lLRahISJR?=
 =?us-ascii?Q?BC1cZzPqyp7AnxHgMf3pyDecRVpDnh+stHYWK+f9yv6Cgn+UpcGmtBbbg4uL?=
 =?us-ascii?Q?ds/eWl6GuVf1YsbfwQyl4Wl1YXLHApZ7uANplCsOpyYnZRSzXxL9TqB3ou3w?=
 =?us-ascii?Q?0JeSAXqJ7qox2xIyEgqk4OvdlpsS5rofpDF7cnIElDF2o6TAZWwV+F6be4z2?=
 =?us-ascii?Q?e3Jz0Mprx9pkzCbwLQOQkPU2upqde5Jv7xiyHYlVgPe6yUs1VPeXa+dbWKP+?=
 =?us-ascii?Q?aGYT3tFYrNU1ZdV35pcqym+T495qXnhkkm56quIthCktbKATTNF7O9ndQTD1?=
 =?us-ascii?Q?QD7BaN+UtNZ7inxATMf5RH/GBPweoS8XHj1Vgxj44sb+rgwhJFtVYdXacKWN?=
 =?us-ascii?Q?l5H+ZdwkXPoHoqJzoPRYW4IIp88XN46xoVESuvI/pJDgplPogSFYAvtpEdkr?=
 =?us-ascii?Q?77OFM+k+N8/QO0AY8R0rPAVAxIHTUFRTVXApPalFbn58a4ak8pOtttE1t3qt?=
 =?us-ascii?Q?lKyrwivUNr9bUi7aIlMiHfKAB7mK4OpXUjNXS6ZB2Aemieb0F/rm/T5237v4?=
 =?us-ascii?Q?i5FHzrpMwFB3DPYnwgf2aG2gnEvNrtZF95LlFGWVHHrb2qKRhAndRiRshJmO?=
 =?us-ascii?Q?UYULN9pAvzaj6CacAKynADG9rneSm9x1WyOrbFW7oJSt5H77gKcMnhcbte7k?=
 =?us-ascii?Q?Dry7FeAdZOWvg3Igr15B34hh6f2T6LW/Vty1x76bct4fvYk/5evaeLa21nZG?=
 =?us-ascii?Q?3CK57ARy+Iu0/4gy8SwrdCukYgha4N4SzlbvL75zTW2Gdvl6ajDXKcM5z0V3?=
 =?us-ascii?Q?aVyEfNYDryCVNhs4IvY90mB2m7jZbx1VocL13NUMU48TBAVGaj1by5fVqSEc?=
 =?us-ascii?Q?8JjJBMXitLQCpIp9YEmwKJrXrP9bm1v4niUEw+vZtRzvE25BuKKuCsB302Kg?=
 =?us-ascii?Q?Ggbn7Eunf317utJoDWdA6oSlWF+fVWpqJsc7+RZvxAVAAMNYoUWQzO1GDWHN?=
 =?us-ascii?Q?F463NIx5pJZ+TcsxX/1NzYejA1NJ9bzb2qoF9Wf4AQC1XMngHW/t/GQI/qma?=
 =?us-ascii?Q?BEU2x5B5Mt52hCV8fU6yFxkPoBIU9IlLrawd+IljloswzbvD7kpeE4jaqHGZ?=
 =?us-ascii?Q?EzHF6fv4iYuJ0C4Myk152l+F+ed0wSkVZ8GGjSkZuM33Lr2loAHBmZqA9Vfc?=
 =?us-ascii?Q?Ve/Sl3uh0BrTDEVJyUJPl7LEq0POAGEHLhZvQdTkYK8nT8r1e9F2yT4rbPBA?=
 =?us-ascii?Q?NbYe1us0rJrQroRQocCtwAyp/CF2mQ/O6W3eaQ6LoWTjjeBEChhCn8kxlRSj?=
 =?us-ascii?Q?dvcez7ZX9GR7mACwKQ55jaUngi2wQm1QKdjjb7pkWji8+UYM4iS3kbXYu99S?=
 =?us-ascii?Q?isUXyC50Zw6iqSp2v8hampGXAaJrVEZ0aoxdOoZe5AV8twom9wBhZKFKnk7d?=
 =?us-ascii?Q?RnLQXikYvAY77UMJEtASVIQWXzabar1FWOEDBpTxKXr8vinht91dJONePvvx?=
 =?us-ascii?Q?R1N4hB1xRNdd3UbLc2joYvQCJrUIEP8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5351673f-826e-4e25-6902-08da4fcbdeb5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 19:10:26.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 khQkm2G+jAbtgFRU1maXt05y8e6GJZZok+GIacpXMpNUOxjuSuMp6XYVz3Y1PqGNhW6P/Adke6j2i+8xBihpY95k0aT2/Y6f94zDg0AmYVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3936
X-Proofpoint-GUID: F-9mpn55eDkvV-NOE3YSSVQNam6XnFnb
X-Proofpoint-ORIG-GUID: F-9mpn55eDkvV-NOE3YSSVQNam6XnFnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_17,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=501 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 19:10:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167009

The Linux pressure monitoring system helps determine when system resources
are being overutilized by measuring how contended the CPU, IO and memory are.
This information can be found under /proc/pressure/ which contains 3 files -
cpu, memory and io. In each of the files, the format of the files is as follows:
	some avg10=70.24 avg60=68.52 avg300=69.91 total=3559632828
	full avg10=57.59 avg60=58.06 avg300=60.38 total=3300487258

The "some" state of a given resource represents when one or more tasks are delayed
on that resource whereas the "full" state represents when all the tasks are
delayed. Currently, we only collect data from the "some" state but the
"full" data can simply be appended to the log files if neccessary.
The "avg10", "avg60" and "avg300" fields represent the average percentage
 of time runnable tasks were delayed in the last 10, 60 or 300 seconds
respectively. The "total" field represents the total time, in microseconds,
that some runnable task was delayed on a resource.
More information can be found at: https://www.kernel.org/doc/html/latest/accounting/psi.html
and in the source code under /kernel/sched/psi.c

This commit adds functionality to collect and log the "some" CPU, memory and IO
pressure. The "avg10", "avg60" and "avg300" fields are logged without change.
In place of the "total" field, the difference between the current "total" and
the previous sample's "total" is logged, allowing the measurement of pressure
in between each polling interval, as was done for /proc/stat data. The log files
are stored in <build_name>/tmp/buildstats/<build_time>/reduced_proc_pressure/{cpu,io,memory},
mirroring the directory structure of /proc/pressure.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta/lib/buildstats.py | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index c52b6c3b72..1875bac3c1 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -13,13 +13,20 @@ class SystemStats:
     def __init__(self, d):
         bn = d.getVar('BUILDNAME')
         bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
-        bb.utils.mkdirhier(bsdir)
+        pressuredir = os.path.join(bsdir, 'reduced_proc_pressure')
+        if os.path.exists("/proc/pressure/cpu"):
+            bb.utils.mkdirhier(pressuredir)
+        else:
+            bb.utils.mkdirhier(bsdir)
 
         self.proc_files = []
         for filename, handler in (
                 ('diskstats', self._reduce_diskstats),
                 ('meminfo', self._reduce_meminfo),
                 ('stat', self._reduce_stat),
+                ('pressure/cpu', self._reduce_pressure),
+                ('pressure/io', self._reduce_pressure),
+                ('pressure/memory', self._reduce_pressure),
         ):
             # The corresponding /proc files might not exist on the host.
             # For example, /proc/diskstats is not available in virtualized
@@ -48,13 +55,15 @@ class SystemStats:
         self.diskstats_ltime = None
         self.diskstats_data = None
         self.stat_ltimes = None
+        #Last time we sampled /proc/pressure. All resources stored in a single dict with the key as filename
+        self.last_pressure = {"pressure/cpu": None, "pressure/io": None, "pressure/memory": None}
 
     def close(self):
         self.monitor_disk.close()
         for _, output, _ in self.proc_files:
             output.close()
 
-    def _reduce_meminfo(self, time, data):
+    def _reduce_meminfo(self, time, data, filename):
         """
         Extracts 'MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree'
         and writes their values into a single line, in that order.
@@ -75,7 +84,7 @@ class SystemStats:
         disk = linetokens[2]
         return self.diskstats_regex.match(disk)
 
-    def _reduce_diskstats(self, time, data):
+    def _reduce_diskstats(self, time, data, filename):
         relevant_tokens = filter(self._diskstats_is_relevant_line, map(lambda x: x.split(), data.split(b'\n')))
         diskdata = [0] * 3
         reduced = None
@@ -104,10 +113,10 @@ class SystemStats:
         return reduced
 
 
-    def _reduce_nop(self, time, data):
+    def _reduce_nop(self, time, data, filename):
         return (time, data)
 
-    def _reduce_stat(self, time, data):
+    def _reduce_stat(self, time, data, filename):
         if not data:
             return None
         # CPU times {user, nice, system, idle, io_wait, irq, softirq} from first line
@@ -125,6 +134,27 @@ class SystemStats:
 
         self.stat_ltimes = times
         return reduced
+        
+    def _reduce_pressure(self, time, data, filename):
+        """
+        Return reduced pressure: {avg10, avg60, avg300} and delta total compared to the previous sample
+        for the cpu, io and memory resources. A common function is used for all 3 resources since the 
+        format of the /proc/pressure file is the same in each case.
+        """
+        if not data:
+            return None
+        tokens = data.split(b'\n', 1)[0].split()
+        avg10 = float(tokens[1].split(b'=')[1])
+        avg60 = float(tokens[2].split(b'=')[1])
+        avg300 = float(tokens[3].split(b'=')[1])
+        total = int(tokens[4].split(b'=')[1])
+
+        reduced = None
+        if self.last_pressure[filename]:
+            delta = total - self.last_pressure[filename]
+            reduced = (time, (avg10, avg60, avg300, delta))
+        self.last_pressure[filename] = total
+        return reduced
 
     def sample(self, event, force):
         now = time.time()
@@ -133,7 +163,7 @@ class SystemStats:
                 with open(os.path.join('/proc', filename), 'rb') as input:
                     data = input.read()
                     if handler:
-                        reduced = handler(now, data)
+                        reduced = handler(now, data, filename)
                     else:
                         reduced = (now, data)
                     if reduced:
-- 
2.35.1


