Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0039C60102
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:12:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2017 00:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="35166801"
Received: from lmoriart-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.27.58])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2017 00:12:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 10:12:47 +0200
Message-Id: <1485331967-4606-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] scripts/buildstats-diff: simplify timestamp handling
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
X-List-Received-Date: Wed, 25 Jan 2017 08:12:49 -0000

Simply use floats instead of datetime and timedelta objects for handling
timestamps.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index f918a6d..5cea184 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -22,7 +22,6 @@ import os
 import re
 import sys
 from collections import namedtuple
-from datetime import datetime, timedelta, tzinfo
 from operator import attrgetter
 
 # Setup logging
@@ -35,38 +34,11 @@ class ScriptError(Exception):
     pass
 
 
-class TimeZone(tzinfo):
-    """Simple fixed-offset tzinfo"""
-    def __init__(self, seconds, name):
-        self._offset = timedelta(seconds=seconds)
-        self._name = name
-
-    def utcoffset(self, dt):
-        return self._offset
-
-    def tzname(self, dt):
-        return self._name
-
-    def dst(self, dt):
-        return None
-
-TIMEZONES = {'UTC': TimeZone(0, 'UTC'),
-             'EET': TimeZone(7200, 'EET'),
-             'EEST': TimeZone(10800, 'EEST')}
-
 taskdiff_fields = ('pkg', 'pkg_op', 'task', 'task_op', 'value1', 'value2',
                    'absdiff', 'reldiff')
 TaskDiff = namedtuple('TaskDiff', ' '.join(taskdiff_fields))
 
 
-def to_datetime_obj(obj):
-    """Helper for getting timestamps in datetime format"""
-    if isinstance(obj, datetime):
-        return obj
-    else:
-        return datetime.utcfromtimestamp(obj).replace(tzinfo=TIMEZONES['UTC'])
-
-
 class BSTask(dict):
     def __init__(self, *args, **kwargs):
         self['start_time'] = None
@@ -86,7 +58,7 @@ class BSTask(dict):
     @property
     def walltime(self):
         """Elapsed wall clock time"""
-        return self['elapsed_time'].total_seconds()
+        return self['elapsed_time']
 
     @property
     def read_bytes(self):
@@ -118,10 +90,10 @@ def read_buildstats_file(buildstat_file):
             key, val = line.split(':', 1)
             val = val.strip()
             if key == 'Started':
-                start_time = to_datetime_obj(float(val))
+                start_time = float(val)
                 bs_task['start_time'] = start_time
             elif key == 'Ended':
-                end_time = to_datetime_obj(float(val))
+                end_time = float(val)
             elif key.startswith('IO '):
                 split = key.split()
                 bs_task['iostat'][split[1]] = int(val)
-- 
2.6.6


