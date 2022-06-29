Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB4CC43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 20:10:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16267.1656533432190520183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 13:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oga5WdQW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=417919b192=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25TJaAsY028256
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 20:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=MkFXezlTIHn1dY+BN2L8ji6gN9aP8r2mrHpj3h88xhc=;
 b=oga5WdQW6jKlBfxOMX52FqHytygOztEZZnICU9X9lUFvRf+bQhzYXpm5/4A/nUU+CdsF
 aYi07g01x55ZEk6bYcY52CZPrZC60SxnILTNni2QKmn0dexNYOT5/Xtvehb6W/M+ENd0
 QxmFD4aLpjas9MgHxd9aZyX2xZ/c0gfztyD7gkj6jFyKi7u5whnzaK8qC3PpZ9EjaBID
 Uie5iWojszjHC9BGDhRbbl4Cxo3pDkXYyXienS5qEXAA9r0dKK59AAm/jXXdKIg6eAXw
 QgNNvVmRMam6UrDWxoVGbr6e6LPhQJ3Q6BOuSUsTFC9uYR3WEDoDgZnRI7h/SGjUM9bC iw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwqk23k1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 20:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia9AeRVv36QySJI0i6DgZ4/bMetqWHOSHXM6VG+ByBUibMFUB9ffXlzV0oAZx2MwnczulJyiv+vNVj5omIzohRdYcNFB7d6204SQ7kbKTVBM3ogDglAgplu02Rxlq5e6IRmul7JJmMXSjeV/lGp7FtfSDz0HMzRxkSmQNeR1C8E/wGsUJSEWsBlRJzTlA3X9+ta4fFYqcxoYOzC9g3zxIMe/R256t4fgqU3OK/GURKQoDN60yx5gcy2WVLWuuFnhwYygJtq6CC+cv9GsIGYVmlWmpzXFtaT+cR1SXQjTrTL830WZxZrbhUHoYouZsPi7fH5jQ4ZMOIZlHR72NRg0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkFXezlTIHn1dY+BN2L8ji6gN9aP8r2mrHpj3h88xhc=;
 b=ZJiFp6l6uGJ337V6fNKWYgkcJ5m07xuin6YlDB5NGJBMLhpJMi1cuFSFeOgMBXytO76GUZ6HSsTWJ7IWhjLslQQAv0yc/f2YdfE47c+GMoCQKHa0qvuj/rFZLjSAAEn0oZosLmcHc3WMvzrBeFT+YLFAoAaxXCQouI01JyWJeNP3nxMkB0cYifS4xLAb1yP0c1p5tswSnU6YV0tKCCsZ8bRVswznRTNwvOcX7P9cFuxs19omFXfMOckmqt1C3IHrxeGCKrglWNdIJAsH70FnHzKUfA7FsjZ5x+9lNwJFdm3C7iY28IRG1YnfyZ5Wz5Cr8OVvhPAxpXkVNpChW2zIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by DM6PR11MB4411.namprd11.prod.outlook.com (2603:10b6:5:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 20:10:28 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 20:10:28 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqueue: add cpu/io pressure regulation
Date: Wed, 29 Jun 2022 16:10:16 -0400
Message-Id: <20220629201016.1948793-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::32) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9d7e9ea-e7be-4294-08ba-08da5a0b694d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4411:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XG039a880Ql9N+LTSFB8F2KzvoqoruktwHt7xJAwEUJ74oB++tE8jvELAW3paJOxze+ZiRWjY0bF05/OSFcZ6ibGXnhss2hRrw9UM0CMzqA+zhXZeml/kdd++EOwGZS/hIaz/Eftf3rwW+1QhByzAcfL/FnGA1CtRhZuSidiMY23y/VfEn7L8YHixgUcd2gNjguR5JlD61UCOnte7pcUPrp6wLSFNnTKTrMQ7lIkbi4cc5RtF74RzPoMaT3nYm7/2GHLen0gBYNpufNmK8NaWsIcNHbKUNCt6VmqZ/nxx03BLwOm9rdbb7WcTLAfAR/698b4KN30h5xGcqH+T0Xs1PFRt/5pUhNSLiOeznGZJtSav63XxNMic23qMtrjTm+/iC+Gs5Zws3RQTOZf0ACZW1uzQ9Nc0Vb7SWErFQDQrQabQOat9QjUJwWieaN01xy6z6xqv6WmV7lCFmHpn44FRwtEMvTGABmZLe3KAiFS91z4o+baDXNGO75thl4k4Mo5aV2zvZ3gJ63SWga7n5TUetQImc2850/cbBNA4H/eK1X5QojR/IpXd6puHoho0EN++BpUs/jAqewsXI5blCopT1R+8FmhixTRMCS8jRdSQTAjNz4q1zK0N7f54RPOSH/kdlnk292pcIjBCgWl1ehpAIS99LvA80quCuwtgVZGNAlMPoJr8fBGjw/L/9wKBaOOTLOQb6VLoUdwG7pkRVvEIE5jHNtj6ET91ZvFPaz2HnUAjrj1dbrjw+h9o/ceKY4N/aNu01UdwkaRVOiUcJPj4SH4cJkRNiVkzI4vvhUwMtA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(478600001)(38350700002)(52116002)(66946007)(2906002)(6512007)(6506007)(2616005)(66476007)(36756003)(66556008)(8676002)(38100700002)(26005)(41300700001)(6666004)(1076003)(316002)(186003)(83380400001)(6486002)(5660300002)(6916009)(8936002)(44832011)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5yrCzcaewASiK891lcEMB8+uGX9HX1Y5WJc1W8/yc64mEKr65eXnu2orkDTl?=
 =?us-ascii?Q?5oNw3ovMDctfkLnDyEbRR9wd2XjcY7oG1hhhXR+zfksPwMbK4zPf73mn4hCy?=
 =?us-ascii?Q?F2K6fSmOwlSh/Kbt4F/bLogJNKl8WNWMqJ4zp9nLvEjDCdSAz6msEQQeeDhb?=
 =?us-ascii?Q?7sjn9XZrw5c4JTjIFW50YPEf6GWy04ZBPGZ70r8RUbIrnvrRRWql1m89XJCj?=
 =?us-ascii?Q?aXwzU6+6XxfUuEgSh99BSqUqEOJkKkPW7u8rKyfx2jzrYIZFkLcnAEwyLiaA?=
 =?us-ascii?Q?3A2N1EXw3YfmkN/HC66NHAfie+OKxLbuHCv17y4GntViH4w+WNpKcIQzaf0Y?=
 =?us-ascii?Q?3lFhtfCQAKPa3xeHu5LgZNrMdMF7QWjIK5gxDOpDZP+jHvVo+YdaD4jaJasi?=
 =?us-ascii?Q?17JcIaoIHihpyT0Db5a3pDm8CP4uQk+JM6X6kxp+k9qP+mp3sIl6Th0hxkRW?=
 =?us-ascii?Q?Ms1ldXEoM8egBPSSEoqbK/wBfFAz0R6rwDRQGU9RSqP8x4Pi1SXmwVzHgzSX?=
 =?us-ascii?Q?3qwHH7ZM/CRoKcioUNOTVJN3v2jlb0aNMlX9qKJ1wO+fMLUlNN3n5O7Zv2lZ?=
 =?us-ascii?Q?21L1V3Cr+oKxM9Dv20wcv+xdByVoWuE/ZFdlgr8p1EI4u8hRAUPZ+xNm15nt?=
 =?us-ascii?Q?6KCgqV3oHpaqXZdjJmaYHgCAy19ohtGy1xvbTV4KMlaExBKefioOCRoYRQR6?=
 =?us-ascii?Q?ypojMDwGP2/VwjSs72iZxDFOubZ/E5eoeuhtc/tKGg1csjfA7zmDZMbpZGqG?=
 =?us-ascii?Q?b7hhRYsgwcKshcWeU3UoNpbEHVle0g+WQEojnuKFIcW2lm6Yub1umKqEC51L?=
 =?us-ascii?Q?2dyHbvPRMtlUOUMG9k3D5wwp0zEMhyLg+OyPGilHoqdjNUNlC+rhEhioa5Ir?=
 =?us-ascii?Q?33uippUsCIkFEX/VMynbGYurRKaLtZmLXcOrAKwPSSc344SDgWdJy8uH1xie?=
 =?us-ascii?Q?CqIRxRRSFqWJptMMC+UcZHU15h8tINXKpcEze9j2KLiQQnny5/9bCQ4+3F7O?=
 =?us-ascii?Q?iG1rT69E82F4Pb76PsAD7Mg5I6gRWN+lS0W0yyhsFYZOml4MnRxmZdH94wQd?=
 =?us-ascii?Q?7bQFLbh3HG1sxalwZUIh8nOiLW0cY665/LrupGHyNb2ZPZyqC2bmNE0pyDKI?=
 =?us-ascii?Q?rnWe+kkGVexmgfXEJWyTTfEH6+ATWJ1B0nXvsi/i+cViMGSJ2t/EfeadhWgS?=
 =?us-ascii?Q?Ub8vE6z151SnMflxnMfH5PuGHgOToQwi5GQG1jUG3lvZHYuCQqArdTzJ46W/?=
 =?us-ascii?Q?Y0KbA3XgQdo9EhBB9dizX+llNS0y0jEBjrseU4BcW1Hcw88sB5qylIh7C1EP?=
 =?us-ascii?Q?eMXAtvym4Lk3Bg1KNTq61nCZoWYnhJUOEg+UPw00FvT8f97dGZLlUR8gTVNG?=
 =?us-ascii?Q?l2xshKxSd6tdkfZ2tyQ4ZNsc0TAtjOmvaplmCvkRTtIsAxKQZxX1hO7R4cPB?=
 =?us-ascii?Q?ZpscnbNy5br/9rc9lwHjT8C2OwiIcWg1vr2lzNbiL6oGlkgp/UxBjht74J2v?=
 =?us-ascii?Q?KvZ2EJcfrmAa+aTwgwdVDa57FiVQpaWP/+z48D6ZNaSSytz5VAhxYhd1m2cA?=
 =?us-ascii?Q?wO1d8AgsUnZ1tpx7EpqwN5WnQZJ0XLTVLU1qsnYHdieyaRFb0cQ16EBMBwJK?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9d7e9ea-e7be-4294-08ba-08da5a0b694d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 20:10:28.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T/hDhpzCfhs77DwVbdEXVSzunQ4QS3UzTtjc9JdbQv1vcrwN7RVNKZnZS20RA9to8qkqeefH8BRwcpjM7Ccz+PJOSwiyBUwlv9F/Tt6HF0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4411
X-Proofpoint-GUID: B-B6t7sZZ7zIK9FopWF_xO75gP-Ebnz6
X-Proofpoint-ORIG-GUID: B-B6t7sZZ7zIK9FopWF_xO75gP-Ebnz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_21,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206290070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 20:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167390

Stop the scheduler from starting new tasks if the
current cpu or io pressure is above a certain threshold, specified
through the "BB_MAX_{CPU|IO}_SOME_PRESSURE" variables in conf/local.conf.

If the thresholds aren't specified, the default values are 100 for both
CPU and IO, which will have no impact on build times.
Arbitary lower limit of 1.0 results in a fatal error to avoid extremely
long builds. If the percentage limits are higher than 100, then the default
values are used and warnings are issued to inform users that the
specified limit is out of bounds.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 bitbake/lib/bb/runqueue.py | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 1e47fe70ef..9667acc11c 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -159,6 +159,27 @@ class RunQueueScheduler(object):
                 self.buildable.append(tid)
 
         self.rev_prio_map = None
+        # Some hosts like openSUSE have readable /proc/pressure files
+        # but throw errors when these files are opened.
+        try:
+            subprocess.check_output(["cat", "/proc/pressure/cpu", "/proc/pressure/io"], \
+                                    universal_newlines=True, stderr=subprocess.DEVNULL)
+            self.readable_pressure_files = True
+        except:
+            if self.rq.max_cpu_pressure!=100 or self.rq.max_io_pressure!=100:
+                bb.warn("The /proc/pressure files can't be read. Continuing build without monitoring pressure")
+            self.readable_pressure_files = False
+
+    def exceeds_max_pressure(self):
+        if self.readable_pressure_files:
+            # extract avg10 from /proc/pressure/{cpu|io}
+            curr_pressure_sample = subprocess.check_output(["cat", "/proc/pressure/cpu", "/proc/pressure/io"], \
+                                   universal_newlines=True, stderr=subprocess.DEVNULL)
+            curr_cpu_pressure = curr_pressure_sample.split('\n')[0].split()[1].split("=")[1]
+            curr_io_pressure = curr_pressure_sample.split('\n')[2].split()[1].split("=")[1]
+
+            return float(curr_cpu_pressure) > self.rq.max_cpu_pressure or float(curr_io_pressure) > self.rq.max_io_pressure
+        return False
 
     def next_buildable_task(self):
         """
@@ -171,6 +192,8 @@ class RunQueueScheduler(object):
         buildable.intersection_update(self.rq.tasks_covered | self.rq.tasks_notcovered)
         if not buildable:
             return None
+        if self.exceeds_max_pressure():
+            return None
 
         # Filter out tasks that have a max number of threads that have been exceeded
         skip_buildable = {}
@@ -1699,6 +1722,8 @@ class RunQueueExecute:
 
         self.number_tasks = int(self.cfgData.getVar("BB_NUMBER_THREADS") or 1)
         self.scheduler = self.cfgData.getVar("BB_SCHEDULER") or "speed"
+        self.max_cpu_pressure = float(self.cfgData.getVar("BB_MAX_CPU_SOME_PRESSURE") or 100.0)
+        self.max_io_pressure = float(self.cfgData.getVar("BB_MAX_IO_SOME_PRESSURE") or 100.0)
 
         self.sq_buildable = set()
         self.sq_running = set()
@@ -1733,6 +1758,20 @@ class RunQueueExecute:
         if self.number_tasks <= 0:
              bb.fatal("Invalid BB_NUMBER_THREADS %s" % self.number_tasks)
 
+        lower_limit = 1.0
+        upper_limit = 100.0
+        if self.max_cpu_pressure < lower_limit:
+            bb.fatal("Invalid BB_MAX_CPU_SOME_PRESSURE %s, minimum value is %s" % (self.max_cpu_pressure, lower_limit))
+        if self.max_cpu_pressure > upper_limit:
+            bb.warn("Percentage value of BB_MAX_CPU_SOME_PRESSURE %s rounded down to %s" % (self.max_cpu_pressure, upper_limit))
+            self.max_cpu_pressure = upper_limit
+
+        if self.max_io_pressure < lower_limit:
+            bb.fatal("Invalid BB_MAX_IO_SOME_PRESSURE %s, minimum value is %s" % (self.max_io_pressure, lower_limit))
+        if self.max_io_pressure > upper_limit:
+            bb.warn("Percentage value of BB_MAX_IO_SOME_PRESSURE %s rounded down to %s" % (self.max_io_pressure, upper_limit))
+            self.max_io_pressure = upper_limit
+
         # List of setscene tasks which we've covered
         self.scenequeue_covered = set()
         # List of tasks which are covered (including setscene ones)
-- 
2.35.1


