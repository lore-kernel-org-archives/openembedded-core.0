Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6E160124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 15:59:32 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f126so32076517wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 08:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=CyoguLAvIIklrb1UtZIqwjcFS6mSiR9fq88pPX+BrAo=;
	b=AUQ3Ev4fw6sK69siCh52sPIX6k8YVXL5/JL9u/mPALZ0Epj816Fcr4rxnzZFSwF5G4
	37AbSOnsjJxS9sgkcMGqwLOHNO1B5EuYKUBWUVxVax6JCD/c5IdoZ/NlzkmgeRI4VAt4
	5FG2af/KqPvbDkFkrqTb+p4T8IWUIchMTD+tyqZvTV4qOg2PuR4B2ocRYsDuv6d66bPJ
	aoBoB2AVznvGJNz8nxXS22zcJJo04hqEesZLbJKHDkgw8Y3t3dg4/uIj6LsCd8j82n/u
	g4VwunBC0n0hfr7+1s2/iaFMdQjA7oQWAwPurg2fbBQKFIw3ZvTYsOb8SQ7rPoZ6QrVQ
	/12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CyoguLAvIIklrb1UtZIqwjcFS6mSiR9fq88pPX+BrAo=;
	b=NLuoYYCT8D51ptXu/PnEAlQWOvyHHVmBzT+OoyplHZfI1ik7Nb7VGupa1wdtbRajUG
	LzhatGLhlRtU1jHKmgESvMHhopc+itlPvCGSW+PgRW0A8l6CB5Jy0FEo/8iqnLTDwKpN
	Li3Fwqq4wEEgV4F7+vxEcmIDcbeEYhrVzXQy09hfAYe7XfNwNfB782AQI6D/z/6je4wN
	hh5apatznQmu7cSVsGL6nlhQCTgHw40Ox4SAiMs1KG3mgbFBcOK63OIVl6f7CLGG75W4
	em9hQ7gzS1Gvs/Ai4E9SyK/Umv6HKhPoZXjvm00boQjlLHkireEN27xkqLIjzra6iSwn
	6AEA==
X-Gm-Message-State: ALyK8tI1CdIUVB24YBCukBvvQCQ6c+c8O1797YXLgRQoVG6d39R1gAL7KLL/YVdI8GXlwPtX
X-Received: by 10.194.216.33 with SMTP id on1mr4211083wjc.153.1467388772699;
	Fri, 01 Jul 2016 08:59:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b84sm4870141wmb.6.2016.07.01.08.59.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 08:59:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 16:59:27 +0100
Message-Id: <1467388767-20705-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] lib/oe/path: remove oe.path.check_output
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
X-List-Received-Date: Fri, 01 Jul 2016 15:59:34 -0000

This was a copy-and-paste of subprocess.check_output() from when we supported
Python <2.7, so simply delete it and use subprocess.check_output() instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/path.py | 49 ++++---------------------------------------------
 1 file changed, 4 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 413ebfb..dbba60a 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -66,21 +66,21 @@ def copytree(src, dst):
 
     bb.utils.mkdirhier(dst)
     cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
-    check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
     """ Make the hard link when possible, otherwise copy. """
     bb.utils.mkdirhier(dst)
     if os.path.isdir(src) and not len(os.listdir(src)):
-        return	
+        return
 
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
         cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
-        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' % (src, dst)
-        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
         copytree(src, dst)
 
@@ -105,47 +105,6 @@ def symlink(source, destination, force=False):
         if e.errno != errno.EEXIST or os.readlink(destination) != source:
             raise
 
-class CalledProcessError(Exception):
-    def __init__(self, retcode, cmd, output = None):
-        self.retcode = retcode
-        self.cmd = cmd
-        self.output = output
-    def __str__(self):
-        return "Command '%s' returned non-zero exit status %d with output %s" % (self.cmd, self.retcode, self.output)
-
-# Not needed when we move to python 2.7
-def check_output(*popenargs, **kwargs):
-    r"""Run command with arguments and return its output as a byte string.
-
-    If the exit code was non-zero it raises a CalledProcessError.  The
-    CalledProcessError object will have the return code in the returncode
-    attribute and output in the output attribute.
-
-    The arguments are the same as for the Popen constructor.  Example:
-
-    >>> check_output(["ls", "-l", "/dev/null"])
-    'crw-rw-rw- 1 root root 1, 3 Oct 18  2007 /dev/null\n'
-
-    The stdout argument is not allowed as it is used internally.
-    To capture standard error in the result, use stderr=STDOUT.
-
-    >>> check_output(["/bin/sh", "-c",
-    ...               "ls -l non_existent_file ; exit 0"],
-    ...              stderr=STDOUT)
-    'ls: non_existent_file: No such file or directory\n'
-    """
-    if 'stdout' in kwargs:
-        raise ValueError('stdout argument not allowed, it will be overridden.')
-    process = subprocess.Popen(stdout=subprocess.PIPE, *popenargs, **kwargs)
-    output, unused_err = process.communicate()
-    retcode = process.poll()
-    if retcode:
-        cmd = kwargs.get("args")
-        if cmd is None:
-            cmd = popenargs[0]
-        raise CalledProcessError(retcode, cmd, output=output)
-    return output
-
 def find(dir, **walkoptions):
     """ Given a directory, recurses into that directory,
     returning all files as absolute paths. """
-- 
2.8.1


