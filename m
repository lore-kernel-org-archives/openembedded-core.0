Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F79F6E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304299"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:56 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:27 +0300
Message-Id: <1472500111-12358-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 08/12] oeqa.buildperf: measure io stat
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:56 -0000

Add data from /proc/<pid>/io to system resource measurements.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 5987bfb..95a0abf 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -340,6 +340,11 @@ class BuildPerfTestCase(unittest.TestCase):
                 ret = runCmd2(cmd, **kwargs)
                 etime = datetime.now() - start_time
                 rusage_struct = resource.getrusage(resource.RUSAGE_CHILDREN)
+                iostat = {}
+                with open('/proc/{}/io'.format(os.getpid())) as fobj:
+                    for line in fobj.readlines():
+                        key, val = line.split(':')
+                        iostat[key] = int(val)
                 rusage = {}
                 # Skip unused fields, (i.e. 'ru_ixrss', 'ru_idrss', 'ru_isrss',
                 # 'ru_nswap', 'ru_msgsnd', 'ru_msgrcv' and 'ru_nsignals')
@@ -350,7 +355,8 @@ class BuildPerfTestCase(unittest.TestCase):
                 data_q.put({'ret': ret,
                             'start_time': start_time,
                             'elapsed_time': etime,
-                            'rusage': rusage})
+                            'rusage': rusage,
+                            'iostat': iostat})
             except Exception as err:
                 data_q.put(err)
 
@@ -378,7 +384,8 @@ class BuildPerfTestCase(unittest.TestCase):
                        'legend': legend}
         measurement['values'] = {'start_time': data['start_time'],
                                  'elapsed_time': etime,
-                                 'rusage': data['rusage']}
+                                 'rusage': data['rusage'],
+                                 'iostat': data['iostat']}
         self.measurements.append(measurement)
 
         # Append to 'times' array for globalres log
-- 
2.6.6


