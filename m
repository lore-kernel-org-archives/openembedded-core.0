Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E86BCA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 15:39:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.80775.1756827573959689207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 08:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l2c+nWeM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1340513edf=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5827aPm61353899
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Sep 2025 08:39:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5a3j+P+4eTemFV4raoon
	5cJfHCjD/gj6b49dYO5qU9g=; b=l2c+nWeMDLCj2wP70GI6oBXXL3PSUDnmttzQ
	Qe3o9y3mcuGuvvBSu5bKpiizeqUfg5V+HTNePI4c5yy7Eq3KEitVAXtk/HkC0urW
	87NEu0KgENiiFiMi29IVYsmSOjIJ8BUAd4zh+6uHECTJvrHBMoo1Z9umuVPAoamR
	vWgWqHqcG4uYemOcGHa7DGjExcukueoiO9h0jJoO/A4zlh1n6sf54DGEsk5z1l57
	ghNLp9cuaFijU8xH0CWP5tM5uTawpPI5mZnB1vIFcLOeCVAwyDliNIP8EI4SuRI7
	R6LEDWzpUHwV2vYxCPNR3BihZ4Pur6FfI+TyUr0zcWKkgKdvtQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48v0tfjmb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 08:39:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 08:39:41 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 2 Sep 2025 08:39:41 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: Looking for feedback: Add memory to buildstats-summary
Date: Tue, 2 Sep 2025 08:39:17 -0700
Message-ID: <20250902153929.3365588-1-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lKZjwlB4eXxYYA0NaeYN-zHbAg1hlqOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDE1NSBTYWx0ZWRfX737YI6X4l581
 A6JVBC+KBtKyWN4hxWHbDWkCw+kIrzvIl7oVOnzqEniLXOqTprKaultgR89UuemswYraJkl7L77
 aFlSpxW1XJStW2FHGzsferZscdPICH5GaJyWJsHUfXZpo1U0wNm5itOnw8NpfDDkj+VpqwO7peM
 I6NxOs3DDXhOmS8pFJzF+biBfvQiid+bZ9kITV6hE4kfFYkQ640+JWFL+l4TBn+rLUQf18T97s/
 JqE4Q9iOYjOtac0kmEbbdAC7NsEnuBNNJLS1Ej72L5nWeqq0eMAxP9ylfLGIra1RHKfjWJiE3jQ
 2Gn8jPhYIKQCSIAc/WhrE/N1irqfyV8uDvjbfmrUSglQk4u+j6rCWS4Dsgmq7A=
X-Authority-Analysis: v=2.4 cv=XJ0wSRhE c=1 sm=1 tr=0 ts=68b70fb4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=zOdog3y_kAqkJFGbxkQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lKZjwlB4eXxYYA0NaeYN-zHbAg1hlqOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 15:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222737

I was observing processes being killed by the OOM killer when certain
recipes and tasks were being executed. 

Many of the physics or mathematical libraries consume a lot of memory in
the do_compile phase. Running a build with buildstats enabled showed that
the maxrss for these tasks was very high. The highest maxrss value I have
observed is 7.3GB.

I wanted to summarize the results, but noticed that buildstats-summary
only accounts for the duration of the tasks. I wrote a quick enhancement
to extend it to also print and filter based on maxrss.

An example of its use and the modified output is shown below:

```
buildstats-summary  tmp-glibc/buildstats/20250901144058/ --memlimit 2000000 --sort=memory

start                          duration   maxrss     recipe:task
2025-09-01 09:27:54.740000     0:01:22    2027764    create3-republisher-1.0.0:do_compile
2025-09-01 09:21:13.290000     0:01:16    2033980    ublox-gps-2.3.0:do_compile
2025-09-01 09:23:04.960000     0:01:04    2037628    pcl-ros-2.6.2:do_compile
2025-09-01 08:07:39.810000     0:21:03    2061548    clang-native:do_compile
2025-09-01 08:45:10.120000     0:07:03    2351164    lanelet2-core-1.2.1:do_compile
2025-09-01 08:56:17.390000     0:02:02    2414996    dartsim:do_compile
2025-09-01 09:15:27.110000     0:02:00    2445608    mavros-2.10.1:do_compile
2025-09-01 08:27:01.290000     0:03:16    2450224    rmf-traffic-3.3.3:do_compile
2025-09-01 09:26:44.610000     0:00:04    2468600    openvdb-vendor-2.5.5:do_package_qa
2025-09-01 09:15:26.830000     0:02:18    2535556    irobot-create-nodes-3.0.4:do_compile
2025-09-01 09:26:48.090000     0:02:05    2542520    mavros-extras-2.10.1:do_compile
2025-09-01 09:27:21.880000     0:02:38    2552664    sbg-driver-3.2.0:do_compile
2025-09-01 09:28:58.090000     0:01:12    2586168    fuse-viz-1.1.3:do_compile
2025-09-01 09:26:07.880000     0:00:26    2627588    openvdb-vendor-2.5.5:do_package
2025-09-01 08:59:03.790000     0:04:26    2636372    libflann:do_compile
2025-09-01 09:07:55.820000     0:00:04    2657452    openvdb:do_package_qa
2025-09-01 08:25:42.940000     0:02:41    2674024    ceres-solver:do_compile
2025-09-01 08:27:56.430000     0:06:14    2804552    cargo-native:do_compile
2025-09-01 09:15:24.760000     0:03:05    2823900    robot-localization-3.8.2:do_compile
2025-09-01 07:58:15.970000     0:09:31    2990388    linux-raspberrypi:do_fetch
2025-09-01 09:28:31.750000     0:01:55    3033436    fuse-models-1.1.3:do_compile
2025-09-01 09:15:02.480000     0:04:02    3064352    gz-sim8:do_compile
2025-09-01 08:44:39.500000     0:09:58    3176792    fcl:do_compile
2025-09-01 08:46:12.870000     0:09:08    3213876    gtsam-4.2.0:do_compile
2025-09-01 09:07:19.880000     0:00:30    3261900    openvdb:do_package
2025-09-01 09:22:39.530000     0:02:00    3455096    microstrain-inertial-driver-4.7.0:do_compile
2025-09-01 08:36:26.350000     0:08:22    3495032    cargo:do_compile
2025-09-01 08:59:07.570000     0:00:55    3532888    gz-physics7:do_compile
2025-09-01 08:44:16.130000     0:17:53    3716804    opencv:do_compile
2025-09-01 08:58:28.070000     0:02:46    3862464    lanelet2-python-1.2.1:do_compile
2025-09-01 09:11:32.360000     0:09:22    3985780    rmf-traffic-ros2-2.7.2:do_compile
2025-09-01 09:16:20.870000     0:03:37    4400996    ublox-dgnss-node-0.5.7:do_compile
2025-09-01 09:12:30.060000     0:05:34    4592184    ros-gz-bridge-1.0.16:do_compile
2025-09-01 09:11:05.580000     0:08:14    4599324    pcl:do_compile
2025-09-01 08:28:38.090000     0:04:39    6326400    sophus-1.22.9102:do_compile
2025-09-01 08:46:44.050000     0:18:08    6964496    openvdb:do_compile
2025-09-01 09:24:36.750000     0:05:58    7093536    performance-test-2.3.0:do_compile
2025-09-01 09:14:37.610000     0:11:23    7352348    openvdb-vendor-2.5.5:do_compile
```

I would appreciate any feedback folks have to revise the work:

Notably:

1. Do any existing scripts depend on preserving the old output? I added the start time and maxrss
   as new columns as well as a header to describe what each column is. Should any changes to the
   output be disabled by default and only take effect if you pass in a new option?

2. There are additional variables in the buildstat files that are still not exposed.  Should
   we create a generic way to expose these values or wait for a use case to arise?


Signed-off-by: Rob Woolley <rob.woolley@windriver.com>

diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
index b10c671b29..41b34be042 100755
--- a/scripts/buildstats-summary
+++ b/scripts/buildstats-summary
@@ -24,11 +24,13 @@ class Task:
     task: str
     start: datetime.datetime
     duration: datetime.timedelta
+    memory: int
 
 
 class Sorting(enum.Enum):
     start = 1
     duration = 2
+    memory = 3
 
     # argparse integration
     def __str__(self) -> str:
@@ -64,6 +66,7 @@ def dump_buildstats(args, bs: buildstats.BuildStats):
                 task,
                 datetime.datetime.fromtimestamp(stats["start_time"]),
                 datetime.timedelta(seconds=int(stats.walltime)),
+                max(stats["rusage"]["ru_maxrss"], stats["child_rusage"]["ru_maxrss"])
             )
             tasks.append(t)
 
@@ -71,10 +74,12 @@ def dump_buildstats(args, bs: buildstats.BuildStats):
 
     minimum = datetime.timedelta(seconds=args.shortest)
     highlight = datetime.timedelta(seconds=args.highlight)
+    memlimit = args.memlimit
 
+    print("start                          duration   maxrss     recipe:task")
     for t in tasks:
-        if t.duration >= minimum:
-            line = f"{t.duration}    {t.recipe}:{t.task}"
+        if t.duration >= minimum and t.memory >= memlimit:
+            line = f"{t.start}     {t.duration}    {t.memory}    {t.recipe}:{t.task}"
             if args.highlight and t.duration >= highlight:
                 print(f"\033[1m{line}\033[0m")
             else:
@@ -113,6 +118,14 @@ def main(argv=None) -> int:
         metavar="SECS",
         help="Highlight tasks longer than SECS seconds (0 disabled)",
     )
+    parser.add_argument(
+        "--memlimit",
+        "-m",
+        type=int,
+        default=0,
+        metavar="LIMIT",
+        help="Hide tasks with lower than LIMIT kilobytes (0 disabled)",
+    )
 
     args = parser.parse_args(argv)
 

