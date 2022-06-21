Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDC9C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 16:14:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35000.1655828071093705997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nWzBYpGK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3171c08643=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25LDTFrY004368
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=SHqpb6CSW8CRPBLL2I8Ydj+EO+dRgwiD1oEXjo9eIzE=;
 b=nWzBYpGKD7i1ByElxa1xvCiI2h6cOmSAXHkhJXA1LxbFBGKNBy/wJkBc/wUHVf+kDKwk
 zAWiwnWCEEaUMvgHO3RO0kEiIV3MCnQcTQjPKcNvfsZ/5m6HBuSC69xU4bnuqDnlIMUg
 sWxC1Q1WMOmnj4yvEWcb4o5Ux5HlaJ22jxlp6UaeHxCheOwbXR2fClencSZ+rPLR8C04
 scclrRJuIJFsZFSkHQKRMW9KGU+wUlyU8edD3HreHj6QV9Efk9Dn9Pf7JYrqsdnpv66/
 O5CPz2F4t2Mxrv32xZFZDv6i7WD7dLo467h4tsP0mp2snSPC6sSMrJrYeCEixisL+Eg/ UA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gsa06a7ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmSEGPcuAaSkt8WnmorKhYCChOrou2LGBuw/dIdk/7JP+SbRM+Mtrvb5I5eBkPpK3VP187V4Ea9CqHmqKtkFl9g832u+KCv+fjUOGJs13J9G9TC/7Lb7IGgd+gV7scAs+eaeGX0+9BQPiPccjkaatAANifrCv1SR5EeygXYx+D9NjPU7gj5Ue2ZBdESwNXZDXvBm89wu2GSPbbt1ZamHsb5hpPNVbCifEINluRibe3yj+e2I7ciGaNxxSktc8w3iBpBU76qQlBCqy+Wd4AoghQVAFpB3ArvuAEV4vYRdaqDqmoaVqbqUjlivNxs3aH7OSb4nSzr0sPIF/l50mXUlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHqpb6CSW8CRPBLL2I8Ydj+EO+dRgwiD1oEXjo9eIzE=;
 b=iOp9gre+D0Akj/8sZuOQO4b6jQyhGB779hfuSIuAxQRvM/e2biGHd8iz9ZkJlN7BjkLgwzHOqTG9F9BxKGdjZdg1eES8RMOk5+UKJtIVkjwnhR6UCs+9Q/SwidvZ3goS5BxojSe677lfu2cWZSyIBpcKkrx16V3Pb3QANCnolmptkwnR+Quvb6KODNnlrL/k8Y9gEgo+aJnHYhkoVf4ZAl9h8zsWoM90+lwnvkRDm/jGoQTML/KwoQLbruLxi3pysDrbvQb+dS0Oi48mZgu1m8rGKLmiPBHmxjEKHcv2Nfw1j08oIs/uQW0j34NE18QO3uz5aNLP76XnJIshY//eZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BN7PR11MB2865.namprd11.prod.outlook.com (2603:10b6:406:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 16:14:26 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Tue, 21 Jun 2022
 16:14:26 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] buildstats.py: enable collection of /proc/pressure
 data
Date: Tue, 21 Jun 2022 12:14:11 -0400
Message-Id: <20220621161413.2779759-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::20) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9aea868-46ce-4f34-aa41-08da53a11c98
X-MS-TrafficTypeDiagnostic: BN7PR11MB2865:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2865EE4479FAC842D7836A60EBB39@BN7PR11MB2865.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pec/uykh6q5F+y8Ln2vrYclh2GE1jprh8BKCuniGEwcW9Zd0k/DqGU/SEbVI7EM0e/Q7z2BGQI+RLTfh7qfTYi8Tye00RZ2T6in3w3AD+0n4z9tXVjEt6fSYeL1nf1GuWA5Y4savDvThRmex7FZEuFoi8d1qsqxaLaZ+xcQfcFuvJhQpkYWT5RAlC6SNZEaOutwRKAuD4ym+1NBvaXBKzrj14MuLYbTcCxplIs96LOD2MSwXSC3k9aBAxKtwDBoVAOAtpy0ey4/KA+zv/sLXgIWvnUZvvtlg+nTjt4HtFpBjb1ffTaygVbx9yFA2MfTBjhnr1SGk/5RltWgfcTP4Pmxh98jsGUquJ6pODUFyOuqMe3HuwVuEqeldb0eoDi3vs7Jy8Q1epfzmRran6zjEWwbZObz5W19v5MR0xIIq93rZBBXD6VC7bDZGJbKxDVJs3G6v8m9Dj+cnkCyEuE0lRQ5EiIKJmIGOdIEg5ApUQ60qCJSxcRQkq8qLx6oO72F4PdZBpP9/vY1/XAy5m5j9i2WGhesD1BVptJLm4Eb1nGvuokx4zt77P8WB5XqK4jtMdRg/3dz0kyCBXFn4/D5SIS89cKLsmDx+OZl+MiiM11zJmmQbf5RY1xboBuKlZhJMSvtq+fJkp9dhDBVwjj1tAsyHde5nFFm14vK3xsUhRG9fO7e73zhMbpqZxf+d3LZypJppO+oQ4gYDeabJZaaRc06LUvTtehK2ahcvTk7uz0rpZdwiaOvj26b+NE7ZIthOhjElKgeyDuPi/F5rWLjmszmQ5I5mx9UldLuAU43pZ2s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(52116002)(6506007)(1076003)(186003)(66556008)(41300700001)(44832011)(6666004)(2616005)(66476007)(26005)(83380400001)(38350700002)(6512007)(38100700002)(6916009)(36756003)(5660300002)(86362001)(2906002)(66946007)(316002)(8936002)(8676002)(6486002)(478600001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nq8FKg9E25RA/7mi+JDs5sxBCBsOZmtkXZdJf21heWtU0FQJQYBiQzzfXKKt?=
 =?us-ascii?Q?qXJBP4U5ZaavpUBaG8s3pwdpde6KFInaeV/QtGTKNZCvtLFNWwMv4BoE/Q7P?=
 =?us-ascii?Q?EHHnLQNBO6EyN5VQJWqETkn7GjJZJL+3m5ty4yoJ3toKonS6oeRtNCdrS3/h?=
 =?us-ascii?Q?7WD55UeZ7eCzRxikmcicqBhJUkeIMfdNwKjc2J5f6NOjG3YLfCH0ygJVmYYP?=
 =?us-ascii?Q?GJ/MPfA+TGZZGqjsrBvql9LPIhDiIi8nkMzFTJJZJRRraCNuWhCjZ+bm+PkH?=
 =?us-ascii?Q?1jEDaZr1LQpT1qOX6QOTx1QHvKGXRKeT3JAmGcL8mSFicNdkV9O7r6yKjMKY?=
 =?us-ascii?Q?szyAw4LcBc3+ArxIDABj72QJBs55loqt5hjc7I20OcFMqcTQIc/ykeIG/2BH?=
 =?us-ascii?Q?3170wxitr7RR8lsCuLs0nV7tqBrF3x+C5oeOKPN5AH1/kTtQI69VJw1073B/?=
 =?us-ascii?Q?/TbnbcxOlMcwk5OtLiQ3dS8ATNM4keT7f0yOopfUZ8iByyyix5N2PD47Y14W?=
 =?us-ascii?Q?WKdbRFVTqgkahAB7mqIGX9Q/u6vDSZJgKmZnELXkjmR2D5W/lFPNtIxSqoz7?=
 =?us-ascii?Q?6X/DIzvsx5mtDxbeuzjdF8rsmPN+Oy1dzZd6pRJapGvVMuMph7phjQUfAEze?=
 =?us-ascii?Q?dWPggAP5tcRWCSQz2ZocmkI4qeohBCNmLY0nup5zM/LPfkR8ZUtabdimav/1?=
 =?us-ascii?Q?NobFE2+CHfw+m9GvsF5tmeA8Dics0juUSpsWl2VL2G4h6c1/XfhpSCkebkqu?=
 =?us-ascii?Q?plDUUrhwOWcwQNOd2KR6qzu9jn/IMGzHkXk3i7RPmzVY1VPbNchNuiOgX0PJ?=
 =?us-ascii?Q?QLG3/YjE3eq33Ez9QE1uh0wjCLZPeC08gz+5ARC63kb4S5XwLHDn32faY73b?=
 =?us-ascii?Q?HcmedsK6InTRU4l+TxgxuIAybhhbmSpfaygotc4vIDQPlC+ygPB1wMIzQF8r?=
 =?us-ascii?Q?t9oxU1fhfR4Z0q4oj/c1DOC15XbuRwyjEaaR6P6Sdw0XOkkw2nt2pktpCN63?=
 =?us-ascii?Q?73gZgRPbK9P+gfrUoeQw3D3SnRA78q+41vws+z/p1M+isgWS2FYoMLL6tpan?=
 =?us-ascii?Q?BEPz7JoAvM6pUuh8qToZk9BkL3AJ6Pygg56Pa1c6bKVceR6qlKvOdrNV7BGl?=
 =?us-ascii?Q?igJkFIItMYLCvZzrlASATTVDbJr/VEMcdNGjLNCrxt1bP872lFvO5Nk83u6l?=
 =?us-ascii?Q?kDjYl5ubeeP+p4SNOyBZYQ8cRAhaVlVimslN4wEhjgpL9ObDPwncaEam6lDB?=
 =?us-ascii?Q?8qvbJv4PgepKK4OZAvkqEseyxtYH5UTd1T6tCfRIO9MCfiSg7l7B4ZxFUMC/?=
 =?us-ascii?Q?TPp8X8ZswYEm4gpF48NvQ0LhnQkvUr5nxs7QB6vv4/FBSuxmH+g4Trcxshrf?=
 =?us-ascii?Q?YvNpQDaOe4jnP2MZWtd9PKTMjhfJtD/JNIIiJcYVG+VLERBlT2UCP+uB6/dF?=
 =?us-ascii?Q?Mp5TIdrYZcKFTFhSwmDVTYwvunsGwOZ9faJLiQf8Ui3Y/DN+O31YPJVAp9w1?=
 =?us-ascii?Q?g48BNj97AFbpAGdrExXD7uTBKvfSWn7M1JtgKIg57yyL40LXjLUKSfmbjwvx?=
 =?us-ascii?Q?bvM3xp9cnbRaO0Tr66QYM/hRNZCbY1MsLh0MWw7N7N8f9T1TrWQJ7lNCO7eb?=
 =?us-ascii?Q?0F7NYsPpr5rTpC/VG12qRcjcfdZdUVvvQMGBAv7WVos3HrXGvO1pIsZPr1RN?=
 =?us-ascii?Q?MEERwaGAklyhnYwTW7Jba/TXiH/Iu5At8JVSIf5iXECvEdBM7oNGUzDHmOnX?=
 =?us-ascii?Q?kSi1ZJ12sbU60sHgBH9/Env9XvdNKLg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9aea868-46ce-4f34-aa41-08da53a11c98
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:14:26.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zgfEpjLpoRsT3z2JrEuDvhvDw/Mc99w9YGa6MgMZasZrf6AnIRQ5zBzPQUaOdiSvj09yABhAFj8tVUv1pJ6UrsWOVpWXcm8P5I3J7y6tbAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2865
X-Proofpoint-GUID: 4ZohRlxWsdiseYoTezOFkh5q-jFrLrw5
X-Proofpoint-ORIG-GUID: 4ZohRlxWsdiseYoTezOFkh5q-jFrLrw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=625 clxscore=1015 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 16:14:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167164

The Linux pressure monitoring system helps determine when system resources
are being overutilized by measuring how contended the CPU, IO and memory are.
This information can be found under /proc/pressure/ which contains 3 files -
cpu, memory and io. In each of the files, the format is as follows:
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
More information can be found at:
	https://www.kernel.org/doc/html/latest/accounting/psi.html
and in the source code under kernel/sched/psi.c

This commit adds functionality to collect and log the "some" CPU, memory and IO
pressure. The "avg10", "avg60" and "avg300" fields are logged without change.
In place of the "total" field, the difference between the current "total" and
the previous sample's "total" is logged, allowing the measurement of pressure
in between each polling interval, as was done for /proc/stat data. The log files
are stored in:
	<build_name>/tmp/buildstats/<build_time>/reduced_proc_pressure/{cpu,io,memory}.log
mirroring the directory structure of /proc/pressure. If the /proc/pressure
directory does not exist or the resource files can't be read/opened, the
reduced_proc_pressure directory is not created.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta/lib/buildstats.py | 57 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index c52b6c3b72..64ad3ef40e 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -14,13 +14,27 @@ class SystemStats:
         bn = d.getVar('BUILDNAME')
         bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
         bb.utils.mkdirhier(bsdir)
+        file_handlers =  [('diskstats', self._reduce_diskstats),
+                            ('meminfo', self._reduce_meminfo),
+                            ('stat', self._reduce_stat)]
+
+        # Some hosts like openSUSE have readable /proc/pressure files
+        # but throw errors when these files are opened. Catch these error
+        # and ensure that the reduce_proc_pressure directory is not created.
+        if os.path.exists("/proc/pressure"):
+            try:
+                source = open('/proc/pressure/cpu', 'rb')
+                source.read()
+                pressuredir = os.path.join(bsdir, 'reduced_proc_pressure')
+                bb.utils.mkdirhier(pressuredir)
+                file_handlers.extend([('pressure/cpu', self._reduce_pressure),
+                                     ('pressure/io', self._reduce_pressure),
+                                     ('pressure/memory', self._reduce_pressure)])
+            except Exception:
+                pass
 
         self.proc_files = []
-        for filename, handler in (
-                ('diskstats', self._reduce_diskstats),
-                ('meminfo', self._reduce_meminfo),
-                ('stat', self._reduce_stat),
-        ):
+        for filename, handler in (file_handlers):
             # The corresponding /proc files might not exist on the host.
             # For example, /proc/diskstats is not available in virtualized
             # environments like Linux-VServer. Silently skip collecting
@@ -48,13 +62,15 @@ class SystemStats:
         self.diskstats_ltime = None
         self.diskstats_data = None
         self.stat_ltimes = None
+        # Last time we sampled /proc/pressure. All resources stored in a single dict with the key as filename
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
@@ -75,7 +91,7 @@ class SystemStats:
         disk = linetokens[2]
         return self.diskstats_regex.match(disk)
 
-    def _reduce_diskstats(self, time, data):
+    def _reduce_diskstats(self, time, data, filename):
         relevant_tokens = filter(self._diskstats_is_relevant_line, map(lambda x: x.split(), data.split(b'\n')))
         diskdata = [0] * 3
         reduced = None
@@ -104,10 +120,10 @@ class SystemStats:
         return reduced
 
 
-    def _reduce_nop(self, time, data):
+    def _reduce_nop(self, time, data, filename):
         return (time, data)
 
-    def _reduce_stat(self, time, data):
+    def _reduce_stat(self, time, data, filename):
         if not data:
             return None
         # CPU times {user, nice, system, idle, io_wait, irq, softirq} from first line
@@ -126,6 +142,27 @@ class SystemStats:
         self.stat_ltimes = times
         return reduced
 
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
+
     def sample(self, event, force):
         now = time.time()
         if (now - self.last_proc > self.min_seconds) or force:
@@ -133,7 +170,7 @@ class SystemStats:
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


