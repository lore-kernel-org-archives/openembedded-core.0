Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1rZElbbuZ+PF9P8e5fLSD0yRNFsEiImlMjDGv70JKiaM4zjuucsTAl4gpCUYy++J8K75sCDv8D
 vvY6zx5Mz2hA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794822"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794822"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:26 -0700
IronPort-SDR: 6HgfdhVgue+YlDSCjtTZZolZcGqoHRawNHXt8L0KKDPaPaY/al4aDJiGyCqjb1yD0ngvqlJW7f
 63L8+tdPUwZA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331710"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:24 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 26/31] Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
Date: Fri,  7 May 2021 15:02:38 +0800
Message-Id: <efcc95f25843ed5aa825ebc55985eaf4660a498a.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

LD_LIBRARY_PATH leaks into host executables too, and breaks them
as they are not uninative-enabled. E.g. on ubuntu 18.04 trying
to run host bash with a sysroot that was built on Fedora 33:

akanavin@ubuntu1804-ty-3:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-24341/tmp/work/x86_64-linux/gnupg-native/2.3.1-r0/recipe-sysroot-native$ LD_LIBRARY_PATH=./usr/lib /bin/bash
/bin/bash: ./usr/lib/libtinfo.so.5: no version information available (required by /bin/bash)
/bin/bash: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./usr/lib/libtinfo.so.5)

This was seen e.g. here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2090/steps/14/logs/stdio

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e9850486b74a3de934527ca1077df001d3a8d22)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index a71c16ab14..024261410e 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -174,11 +174,8 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
     if native_sysroot:
         extra_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
                       (native_sysroot, native_sysroot, native_sysroot)
-        extra_libpaths = "%s/lib:%s/usr/lib" % \
-                         (native_sysroot, native_sysroot)
         nenv = dict(options.get('env', os.environ))
         nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
-        nenv['LD_LIBRARY_PATH'] = extra_libpaths + ':' + nenv.get('LD_LIBRARY_PATH', '')
         options['env'] = nenv
 
     cmd = Command(command, timeout=timeout, output_log=output_log, **options)
-- 
2.30.2

