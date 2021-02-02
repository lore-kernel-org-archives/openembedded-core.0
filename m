Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.48154.1612244094073717358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5TmHR1npCJPuth0uvoqHynDkUNzgo7cNWonyCJPaaQVWAqjDBwDcEomnjM7YT3iss/GIjgwXPy
 VKpXGCT4ySyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876932"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:35 -0800
IronPort-SDR: NYtd+wjIP/NDOHuobYu0iClzNA87tfu5Kp+1y/vCiJkx7l8Ci76xBwwiq993XHXaL2nbFHTbSu
 LZhEtzfrKjCA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360993"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/25] lib/oe/patch.py: Don't return command stderr from runcmd function
Date: Tue,  2 Feb 2021 13:34:02 +0800
Message-Id: <1dadeb58e88c4d953be612654fe4a76b51ff0553.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If a function returns any stderr it will be passed to extractPatches and
used as path to patch.

For example subprocess command output can be:
| sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
| /tmp/oepatchhuqle8fj/0001-foo.patch
| /tmp/oepatchhuqle8fj/0002-bar.patch

that will result in:
| FileNotFoundError: [Errno 2] No such file or directory: 'sh:'

To fix this I separated output, made the function return stdout and
print stderr only in case of command error.

(From OE-Core rev: 482589e2cc7c3ddeefb0a0fb98d97a9cbb18c9ec)

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e2450731c1f70fb72af0b8349905b359d3cd2b1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/patch.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 40755fbb03..8ad70f53f1 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -38,15 +38,19 @@ def runcmd(args, dir = None):
         args = [ pipes.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
-        (exitstatus, output) = subprocess.getstatusoutput(cmd)
+        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        stdout, stderr = proc.communicate()
+        stdout = stdout.decode('utf-8')
+        stderr = stderr.decode('utf-8')
+        exitstatus = proc.returncode
         if exitstatus != 0:
-            raise CmdError(cmd, exitstatus >> 8, output)
-        if " fuzz " in output and "Hunk " in output:
+            raise CmdError(cmd, exitstatus >> 8, "stdout: %s\nstderr: %s" % (stdout, stderr))
+        if " fuzz " in stdout and "Hunk " in stdout:
             # Drop patch fuzz info with header and footer to log file so
             # insane.bbclass can handle to throw error/warning
-            bb.note("--- Patch fuzz start ---\n%s\n--- Patch fuzz end ---" % format(output))
+            bb.note("--- Patch fuzz start ---\n%s\n--- Patch fuzz end ---" % format(stdout))
 
-        return output
+        return stdout
 
     finally:
         if dir:
-- 
2.29.2

