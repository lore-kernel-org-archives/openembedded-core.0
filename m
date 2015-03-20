Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A815B6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:08:02 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 18:08:02 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 10EA62800CD;
	Fri, 20 Mar 2015 18:08:03 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 18:07:56 +0100
Message-ID: <1426871278-51418-2-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
References: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: =?UTF-8?q?Thomas=20Lundstr=C3=B6m?= <thomas.lundstrom@enea.com>,
	"Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 1/3] rt-tests: bump version and enable ptest support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2015 17:08:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. Upgrade version to 0.91
2. Add ptest support

[YOCTO #1569]

Signed-off-by: Thomas Lundstr=C3=B6m <thomas.lundstrom@enea.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py         | 412 +++++++++++++++++=
++++
 meta/recipes-rt/rt-tests/files/run-ptest           |   3 +
 meta/recipes-rt/rt-tests/rt-tests.inc              |   6 +-
 .../{rt-tests_0.89.bb =3D> rt-tests_0.91.bb}         |  10 +
 4 files changed, 428 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-rt/rt-tests/files/rt_bmark.py
 create mode 100644 meta/recipes-rt/rt-tests/files/run-ptest
 rename meta/recipes-rt/rt-tests/{rt-tests_0.89.bb =3D> rt-tests_0.91.bb} (=
72%)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/r=
t-tests/files/rt_bmark.py
new file mode 100755
index 0000000..e2280e4
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -0,0 +1,412 @@
+#!/usr/bin/python
+# -*- coding: utf-8 -*-
+
+# SPDX-License-Identifier:     BSD-3-Clause
+# Copyright (C) 2015 Enea Software AB
+# Author: Thomas Lundstr=C3=B6m <thomas.lundstrom@enea.com>
+
+# The script measures interrupt latency together with different types of
+# system load. This is done using the programs cyclictest and stress.
+#
+# The main output is:
+#
+#   Best case (min) latency
+#     This has very limited value, but is presented since it can be done
+#     easily
+#
+#   Average latency
+#     This value is of interrest for throughput oriented systems. Limited
+#     value for a real-time system. Also presented because it is easy to d=
o.
+#
+#   Worst case (max) latency
+#     This is the interesting number for a real-time system. The number
+#     presented is (of cource) the largest number observed. The challenge
+#     is to know how the observed worst case relates to the actual worst c=
ase.
+#
+#     To get an indication of the confidence, the following method is used=
:
+#     1) Instead of one long run, the measurement is made as a set of shor=
ter
+#        runs. The number of runs must be a power of 2 for reasons that wi=
ll
+#        shorlty be obvious
+#
+#     2) First, a list of the max values are created.
+#
+#     3) The smallest value in that list is recorded.
+#
+#     4) Then a new list is create by taking the max value of each pair of
+#        values in the original list. In this list the smallest value is
+#        recorded.
+#
+#     5) Step 3 is repeated until there is only one value in the list. See
+#        example below:
+#
+#        Samples:
+#          |  44 |     |     |     |     |
+#          |  77 |  77 |     |     |     |
+#          | 118 |     |     |     |     |
+#          | 119 | 119 | 119 |     |     |
+#          | 138 |     |     |     |     |
+#          |  57 | 138 |     |     |     |
+#          | 175 |     |     |     |     |
+#          | 130 | 175 | 175 | 175 |     |
+#          |  54 |     |     |     |     |
+#          | 150 | 150 |     |     |     |
+#          |  47 |     |     |     |     |
+#          |  59 |  59 | 150 |     |     |
+#          | 199 |     |     |     |     |
+#          | 115 | 199 |     |     |     |
+#          | 177 |     |     |     |     |
+#          | 129 | 177 | 199 | 199 | 199 |
+#
+#        Smallest value:
+#          |  44 |  59 | 119 | 175 | 199 |
+#
+#     6) The generated list of smallest values is analyzed. In this case, =
it
+#        can be observed that the values are increasing significantly thro=
ugh
+#        the entire list, which leads to the conclusion that the number of
+#        samples is too small.
+#        If instead the list had been (167, 191, 196, 199, 199), there had
+#        been a very small, or no, increase at the end of the list. We mig=
ht
+#        then suspect that the number of samples is probably large enough.
+#        There is however no guarantee for that.
+#
+#     Steps 1-2 are done in run_cyclictest_suite
+#     Steps 3-5 are done in gen_minmax_list.
+#     Step 6 needs to be done manually since there is (yet) no well define=
d
+#     FAIL criterion and a theoretically solid PASS criterion may never be
+#     available.
+
+import multiprocessing
+import os
+import re
+import signal
+import subprocess
+import time
+import traceback
+
+# See comment on the function set_hung_tmo
+has_hung_task_detection =3D True
+
+#-------------------------------------------------------------------------=
------
+
+class TestFail(Exception):
+        def __init__(self, msg):
+                self.msg =3D msg
+
+        def __str__(self):
+                return "Test failure: (" + self.msg + ")"
+
+#-------------------------------------------------------------------------=
------
+
+def tc_name(sub_name):
+        return "rt_bmark.intlat." + sub_name
+
+#-------------------------------------------------------------------------=
------
+# log() does the same job as print except that a '#' is added at the begin=
ning
+# of each line. This causes TEFEL to ignore it
+
+def log(*msg):
+        tmp =3D "".join(map(str, msg)) # 'map(str, ...' allows numbers
+        for line in tmp.split("\n"):
+                print "#", line
+
+#-------------------------------------------------------------------------=
------
+# Like log(), but with a timestamp added
+
+def log_ts(*msg):
+        ts =3D time.localtime()
+        stamp =3D "%2d:%02d:%02d: " % (ts.tm_hour, ts.tm_min, ts.tm_sec)
+        log(stamp, *msg)
+
+#-------------------------------------------------------------------------=
------
+
+def log_test_header(seq_no, nr_of_tests, name):
+        log("=3D" * 78)
+        log()
+        log("  Test case (%d/%d): %s" % (seq_no, nr_of_tests, tc_name(name=
)))
+        log()
+        log("." * 78)
+        log()
+
+#-------------------------------------------------------------------------=
------
+
+def start_stress(*args):
+        stress_cmd         =3D [ "stress" ]
+        added_stress_types =3D []
+        req_stress_types   =3D set(args)
+        cpu_cnt            =3D str(multiprocessing.cpu_count())
+
+        # The function cond_add_stress appends the options to the stress
+        # command if the stress type is in the set of requested stress typ=
es
+
+        def cond_add_stress(stress_type, options):
+                if stress_type in req_stress_types:
+                        req_stress_types.remove(stress_type)
+                        added_stress_types.append(stress_type)
+                        stress_cmd.extend(options)
+
+        #----------
+
+        cond_add_stress("io",  ["-i", cpu_cnt])
+        cond_add_stress("cpu", ["-c", cpu_cnt])
+        cond_add_stress("hdd", ["-d", cpu_cnt, "--hdd-bytes", "20M"])
+        cond_add_stress("vm",  ["-m", cpu_cnt, "--vm-bytes", "10M"])
+
+        unknown =3D ", ".join(req_stress_types)
+        if unknown !=3D "":
+            raise TestFail("Unknown stress type(s): %s" % unknown)
+
+        if not added_stress_types:
+                log("No stress requested")
+                return None
+
+        added          =3D "+".join(added_stress_types)
+        stress_cmd_str =3D " ".join(stress_cmd)
+
+        log("Starting stress(", added, ")")
+        log("  Command: '", stress_cmd_str, "'")
+        log()
+
+        # preexec_fn=3Dos.setsid causes stress to be executed in a separat=
e
+        # session, =3D> it gets a new process group (incl. children). It
+        # can then be terminated using os.killpg in end_stress without
+        # terminating this script.
+
+        p =3D subprocess.Popen(stress_cmd, preexec_fn=3Dos.setsid)
+
+        return p
+
+#-------------------------------------------------------------------------=
------
+
+def end_stress(p):
+        if p is None:
+                # The value None indicates that no stress scenario was sta=
rted
+                return
+
+        if p.poll() is not None:
+                raise TestFail("stress prematurely terminated.")
+
+        os.killpg(os.getpgid(p.pid), signal.SIGTERM)
+        log("Terminated stress")
+
+#-------------------------------------------------------------------------=
------
+
+def us2hms_str(us):
+        s =3D (us+500000) // 1000000 # Round microseconds to s
+        m =3D s//60
+        s -=3D 60*m;
+        h =3D m//60
+        m -=3D 60*h
+
+        return "%d:%02d:%02d" % (h, m, s)
+
+#-------------------------------------------------------------------------=
------
+# Sometime the hung task supervision is triggered during execution of
+# cyclictest (cyclictest starves stress). To avoid that, the supervision
+# is temporarily disabled
+
+def set_hung_tmo(new_tmo):
+        global has_hung_task_detection
+
+        tmo_file =3D "/proc/sys/kernel/hung_task_timeout_secs"
+
+        if not has_hung_task_detection:
+                return
+
+        if not os.access(tmo_file, os.W_OK):
+                log("Hung task detection not supported")
+                log("  (File ", tmo_file, " not found)")
+                has_hung_task_detection =3D False
+                return
+
+        orig_tmo =3D int(subprocess.check_output(["cat", tmo_file]).strip(=
))
+        if new_tmo !=3D orig_tmo:
+                cmd =3D ( "echo " + str(new_tmo) + " > " + tmo_file )
+                subprocess.check_output(cmd, shell=3DTrue)
+                log("Changed timeout for detection of hung tasks: ",
+                    orig_tmo, " -> ", new_tmo)
+
+        return orig_tmo
+
+#-------------------------------------------------------------------------=
------
+
+def gen_minmax_list(max_list):
+        res =3D [min(max_list)]
+
+        while True:
+                tmp =3D max_list
+                max_list =3D []
+                while tmp:
+                        max_list.append(max(tmp.pop(0), tmp.pop(0)))
+
+                res.append(min(max_list))
+
+                if len(max_list) < 2:
+                        return res
+
+#-------------------------------------------------------------------------=
------
+# Parameters for cyclictest:
+#
+# On the -S option (from cyclictest.c):
+#  -S implies options -a -t -n and same priority of all threads
+#    -a: One thread per core
+#    -n: use clock_nanosleep instead of posix interval timers
+#    -t: (without argument) Set number of threads to the number
+#         of cpus
+
+interval_core_0 =3D 100     # Timer interval on core 0 [us]
+interval_delta  =3D 20      # Interval increment for each core [us]
+loop_count      =3D 30000   # Number of loops (on core 0).
+
+cmd =3D ("cyclictest",
+       "-S",             # Standard SMP testing. See below
+       "-p", "99",       # RT priority 99
+       "-q",             # Quiet mode, i.e. print only a summary
+       "-i", str(interval_core_0),
+       "-d", str(interval_delta),
+       "-l", str(loop_count)
+       )
+rex =3D re.compile("C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
+
+def run_cyclictest_once():
+        res =3D subprocess.check_output(cmd)
+
+        # minlist and maxlist are lists with the extremes for each core
+        # avg_cnt is the sum of cycles for all cores
+        # avg_sum is the sum of (cycle count*average) for each core
+        #     Since cyclictest runs different number of cycles on
+        #     different cores, avg_sum/avg_cnt gives a more accurate
+        #     value of the overall average than just taking the average
+        #     of each core's averages
+
+        minlist =3D []
+        maxlist =3D []
+        avg_sum =3D 0
+        avg_cnt =3D 0
+
+        for line in res.split("\n"):
+                m =3D rex.search(line)
+                if m is not None:
+                        minlist.append(int(m.group(2)))
+                        maxlist.append(int(m.group(4)))
+                        n =3D int(m.group(1))
+                        avg_sum +=3D n * int(m.group(3))
+                        avg_cnt +=3D n
+
+        return min(minlist), [avg_sum, avg_cnt], max(maxlist)
+
+#-------------------------------------------------------------------------=
------
+# A precondition for the tracking of min-max values is that
+# the suite size os a power of 2.
+
+N          =3D 5
+suite_size =3D 2**N
+
+est_exec_time_once  =3D interval_core_0 * loop_count
+est_exec_time_suite =3D suite_size * est_exec_time_once
+
+def run_cyclictest_suite():
+        log("Starting cyclictest")
+        log("  Command          : ", " ".join(cmd))
+        log("  Number of cycles : ", loop_count*suite_size,
+            " (", suite_size, " sets of ", loop_count, " cycles)")
+        log("  Exec. time (est) : ", us2hms_str(est_exec_time_suite))
+        log()
+
+        orig_tmo =3D set_hung_tmo(0) # 0 =3D> Disable
+
+        # float('inf') emulates infinity. At least in the sense that it is
+        # guaranteed to be larger than any actual number.
+        ack_min =3D float('inf')
+        ack_avg =3D [0, 0]
+
+        log()
+        log_ts("Start of execution")
+        t =3D time.time()
+        max_list =3D []
+
+        for i in xrange(0, suite_size):
+                tmp_min, tmp_avg, tmp_max =3D run_cyclictest_once()
+
+                msg =3D "%2d/%2d:" % (i+1, suite_size)
+                msg +=3D " min: %4d" % tmp_min
+                msg +=3D " avg: %5.1f" % (float(tmp_avg[0])/tmp_avg[1])
+                msg +=3D " max: %4d" % tmp_max
+                log_ts(msg)
+
+                # Track minimum value
+                if tmp_min < ack_min:
+                        ack_min =3D tmp_min
+
+                # Track smallest max value
+                max_list.append(tmp_max)
+
+                ack_avg[0] +=3D tmp_avg[0]
+                ack_avg[1] +=3D tmp_avg[1]
+
+        t =3D time.time()-t
+        log_ts("Cyclictest completed. Actual execution time:",
+               us2hms_str(t*1000000))
+        log()
+        set_hung_tmo(orig_tmo)
+
+        return ack_min, float(ack_avg[0])/ack_avg[1], gen_minmax_list(max_=
list)
+
+#-------------------------------------------------------------------------=
------
+
+class cyclictest_runner:
+        def run_test(self, seq_no, nr_of_tests, name, stressparams):
+
+                try:
+                        log_test_header(seq_no, nr_of_tests, name)
+
+                        p =3D start_stress(*stressparams)
+
+                        bm_min, bm_avg, bm_max_list =3D run_cyclictest_sui=
te()
+
+                        end_stress(p)
+
+                        bm_max =3D bm_max_list[-1]
+
+                        log()
+                        log("Min: %d us" % bm_min)
+                        log("Avg: %.1f us" % bm_avg)
+                        log("Max: %d us" % bm_max)
+                        log()
+                        log("Max list: ", bm_max_list)
+                        log()
+                        log("PASS")
+
+                        print
+                        print tc_name(name), "[Min/us,Avg/us,Max/us]:",
+                        print "%d,%.1f,%d" % (bm_min,bm_avg, bm_max)
+                        print "PASS:", tc_name(name)
+                        print
+
+                except Exception:
+                        log()
+                        log("Exception!")
+                        log()
+                        log("Traceback:", traceback.format_exc())
+                        log()
+                        log("WD: ", os.getcwd())
+                        log()
+                        log("FAIL")
+                        print
+                        print "FAIL:", tc_name(name)
+                        print
+
+#-------------------------------------------------------------------------=
------
+
+runner =3D cyclictest_runner()
+
+tests =3D (("no_stress", []),
+         ("cpu",  ["cpu"]),
+         ("hdd",  ["hdd"]),
+         ("io",   ["io"]),
+         ("vm",   ["vm"]),
+         ("full", ["io", "cpu", "hdd", "vm"]),
+         )
+
+nr_of_tests =3D len(tests)
+for seq_no, params in enumerate(tests, start=3D1):
+        runner.run_test(seq_no, nr_of_tests, *params)
diff --git a/meta/recipes-rt/rt-tests/files/run-ptest b/meta/recipes-rt/rt-=
tests/files/run-ptest
new file mode 100644
index 0000000..8e6d3e3
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python ./rt_bmark.py
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tes=
ts/rt-tests.inc
index 4942701..68a972a 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,6 +1,6 @@
-# Version v0.89
-PV =3D "0.89"
-SRCREV =3D "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
+# Version v0.91
+PV =3D "0.91"
+SRCREV =3D "3fed00ff8d2c0cdbc5ba078cbd60ce3cfcee615f"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-te=
sts.git \
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.89.bb b/meta/recipes-rt/rt=
-tests/rt-tests_0.91.bb
similarity index 72%
rename from meta/recipes-rt/rt-tests/rt-tests_0.89.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.91.bb
index df646de..fbe2f66 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.89.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.91.bb
@@ -8,7 +8,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9544=
99f7abaabaa882bbe \
                     file://src/pi_tests/pi_stress.c;beginline=3D6;endline=
=3D19;md5=3Dbd426a634a43ec612e9fbf125dfcc949"
=20
 require rt-tests.inc
+inherit ptest
=20
+SRC_URI +=3D "file://run-ptest \
+            file://rt_bmark.py \
+           "
 # Do not install hwlatdetect
 EXTRA_OEMAKE +=3D "PYLIB=3D''"
=20
@@ -17,4 +21,10 @@ do_install() {
                            INCLUDEDIR=3D${includedir}
 }
=20
+do_install_ptest() {
+        cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN}-ptest +=3D " stress python python-subprocess python-multipr=
ocessing python-datetime python-re python-lang"
+
 FILES_${PN} +=3D "${prefix}/src/backfire"
--=20
1.9.1


