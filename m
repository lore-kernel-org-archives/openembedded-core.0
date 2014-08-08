Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA64D70A65
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Aug 2014 14:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937659"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:06:30 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:39 -0500
Message-Id: <5fb320291a7abb282a12b417301815a7340ff05a.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 14/35] wic: Remove unused misc code
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:31 -0000

wic doesn't use it, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/misc.py | 180 +-----------------------------------------
 1 file changed, 1 insertion(+), 179 deletions(-)

diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/mic/utils/misc.py
index 8c1f016..010b16c 100644
--- a/scripts/lib/mic/utils/misc.py
+++ b/scripts/lib/mic/utils/misc.py
@@ -18,29 +18,9 @@
 import os
 import sys
 import time
-import tempfile
-import re
-import shutil
-import glob
-import hashlib
-import subprocess
-import platform
-import traceback
-
-
-try:
-    import sqlite3 as sqlite
-except ImportError:
-    import sqlite
-
-try:
-    from xml.etree import cElementTree
-except ImportError:
-    import cElementTree
-xmlparse = cElementTree.parse
 
 from mic import msger
-from mic.utils.errors import CreatorError, SquashfsError
+from mic.utils.errors import CreatorError
 from mic.utils.fs_related import find_binary_path, makedirs
 from mic.utils import runner
 
@@ -82,115 +62,6 @@ def build_name(kscfg, release=None, prefix = None, suffix = None):
     ret = prefix + name + suffix
     return ret
 
-def get_distro():
-    """Detect linux distribution, support "meego"
-    """
-
-    support_dists = ('SuSE',
-                     'debian',
-                     'fedora',
-                     'redhat',
-                     'centos',
-                     'meego',
-                     'moblin',
-                     'tizen')
-    try:
-        (dist, ver, id) = platform.linux_distribution( \
-                              supported_dists = support_dists)
-    except:
-        (dist, ver, id) = platform.dist( \
-                              supported_dists = support_dists)
-
-    return (dist, ver, id)
-
-def get_distro_str():
-    """Get composited string for current linux distribution
-    """
-    (dist, ver, id) = get_distro()
-
-    if not dist:
-        return 'Unknown Linux Distro'
-    else:
-        distro_str = ' '.join(map(str.strip, (dist, ver, id)))
-        return distro_str.strip()
-
-_LOOP_RULE_PTH = None
-
-def human_size(size):
-    """Return human readable string for Bytes size
-    """
-
-    if size <= 0:
-        return "0M"
-    import math
-    measure = ['B', 'K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y']
-    expo = int(math.log(size, 1024))
-    mant = float(size/math.pow(1024, expo))
-    return "{0:.1f}{1:s}".format(mant, measure[expo])
-
-def get_block_size(file_obj):
-    """ Returns block size for file object 'file_obj'. Errors are indicated by
-    the 'IOError' exception. """
-
-    from fcntl import ioctl
-    import struct
-
-    # Get the block size of the host file-system for the image file by calling
-    # the FIGETBSZ ioctl (number 2).
-    binary_data = ioctl(file_obj, 2, struct.pack('I', 0))
-    return struct.unpack('I', binary_data)[0]
-
-def check_space_pre_cp(src, dst):
-    """Check whether disk space is enough before 'cp' like
-    operations, else exception will be raised.
-    """
-
-    srcsize  = get_file_size(src) * 1024 * 1024
-    freesize = get_filesystem_avail(dst)
-    if srcsize > freesize:
-        raise CreatorError("space on %s(%s) is not enough for about %s files"
-                           % (dst, human_size(freesize), human_size(srcsize)))
-
-def calc_hashes(file_path, hash_names, start = 0, end = None):
-    """ Calculate hashes for a file. The 'file_path' argument is the file
-    to calculate hash functions for, 'start' and 'end' are the starting and
-    ending file offset to calculate the has functions for. The 'hash_names'
-    argument is a list of hash names to calculate. Returns the the list
-    of calculated hash values in the hexadecimal form in the same order
-    as 'hash_names'.
-    """
-    if end == None:
-        end = os.path.getsize(file_path)
-
-    chunk_size = 65536
-    to_read = end - start
-    read = 0
-
-    hashes = []
-    for hash_name in hash_names:
-        hashes.append(hashlib.new(hash_name))
-
-    with open(file_path, "rb") as f:
-        f.seek(start)
-
-        while read < to_read:
-            if read + chunk_size > to_read:
-                chunk_size = to_read - read
-            chunk = f.read(chunk_size)
-            for hash_obj in hashes:
-                hash_obj.update(chunk)
-            read += chunk_size
-
-    result = []
-    for hash_obj in hashes:
-        result.append(hash_obj.hexdigest())
-
-    return result
-
-def get_md5sum(fpath):
-    return calc_hashes(fpath, ('md5', ))[0]
-
-
 def normalize_ksfile(ksconf, release, arch):
     '''
     Return the name of a normalized ks file in which macro variables
@@ -232,52 +103,3 @@ def normalize_ksfile(ksconf, release, arch):
     atexit.register(remove_temp_ks)
 
     return ksconf
-
-
-def selinux_check(arch, fstypes):
-    try:
-        getenforce = find_binary_path('getenforce')
-    except CreatorError:
-        return
-
-    selinux_status = runner.outs([getenforce])
-    if arch and arch.startswith("arm") and selinux_status == "Enforcing":
-        raise CreatorError("Can't create arm image if selinux is enabled, "
-                           "please run 'setenforce 0' to disable selinux")
-
-    use_btrfs = filter(lambda typ: typ == 'btrfs', fstypes)
-    if use_btrfs and selinux_status == "Enforcing":
-        raise CreatorError("Can't create btrfs image if selinux is enabled,"
-                           " please run 'setenforce 0' to disable selinux")
-
-def get_file_size(filename):
-    """ Return size in MB unit """
-    cmd = ['du', "-s", "-b", "-B", "1M", filename]
-    rc, duOutput  = runner.runtool(cmd)
-    if rc != 0:
-        raise CreatorError("Failed to run: %s" % ' '.join(cmd))
-    size1 = int(duOutput.split()[0])
-
-    cmd = ['du', "-s", "-B", "1M", filename]
-    rc, duOutput = runner.runtool(cmd)
-    if rc != 0:
-        raise CreatorError("Failed to run: %s" % ' '.join(cmd))
-
-    size2 = int(duOutput.split()[0])
-    return max(size1, size2)
-
-
-def get_filesystem_avail(fs):
-    vfstat = os.statvfs(fs)
-    return vfstat.f_bavail * vfstat.f_bsize
-
-def mkdtemp(dir = "/var/tmp", prefix = "wic-tmp-"):
-    """ FIXME: use the dir in wic.conf instead """
-
-    makedirs(dir)
-    return tempfile.mkdtemp(dir = dir, prefix = prefix)
-
-def strip_end(text, suffix):
-    if not text.endswith(suffix):
-        return text
-    return text[:-len(suffix)]
-- 
1.8.3.1


