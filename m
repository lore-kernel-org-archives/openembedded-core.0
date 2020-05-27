Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.2827.1590573122600453798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 02:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: breno.debian@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id s8so23302643wrt.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 02:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zVILldWZ7fkNAgkfBQS5b2pldD18ei3r4iiPAfbq0Zw=;
        b=S4RMtwJNpp7Tfja/ZcsYb2bFX606UIAhg+n9Vol2A7olbcjP6pjhCtE/kznRm+7MIh
         f/npO5fydRMwd0RwjCfPz9jG29PirjtGSRhhDFdrRKdDOWL34N6zbPCp1oCBJsuIbUP6
         Hi4TvD4lp6cWmamuDMfZb8CdTopfdKo5x7nqIxLUae7XbdfKduBvXCA56h+HHp7Ejz5I
         W857pntzigjUudK/HKdNGPhryU5SLTNo9cbhn7Ipili1KJXhx5JmgfYp1nNV5MgIpMd+
         kxWSyLNt9nRfz7Dp9PTWrf8J6z4+fWnBODfPCf+bXAe8MoH3lzv4gJM/jYBN+tZAoiEf
         uI/Q==
X-Gm-Message-State: AOAM531pTj7TAbRJ9dYWE2aXG7TJbrgUqo7EudZ8JYewwUu+MjXMzZpD
	+LcECczGLTVWXtE3A27LWSgrup+t
X-Google-Smtp-Source: ABdhPJwE6QEkgY0biwe8mWUoAGg9thuDKoyDirfICTeatPtUQiBBaj0v5vOSoj9VrSwZP4P6rNuNuA==
X-Received: by 2002:adf:fec3:: with SMTP id q3mr17769567wrs.123.1590573120914;
        Wed, 27 May 2020 02:52:00 -0700 (PDT)
Return-Path: <breno.debian@gmail.com>
Received: from ?IPv6:2a02:c7f:a63:f000:83b:ce0f:f5ae:3633? ([2a02:c7f:a63:f000:83b:ce0f:f5ae:3633])
        by smtp.gmail.com with ESMTPSA id w15sm2178446wmk.30.2020.05.27.02.52.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 02:52:00 -0700 (PDT)
Subject: [PATCH] devtool: Add IPv6 deploy targets targets
References: <600e41e7-645c-7806-9580-6db458004a25@debian.org>
To: openembedded-core@lists.openembedded.org
From: breno.debian@gmail.com
X-Forwarded-Message-Id: <600e41e7-645c-7806-9580-6db458004a25@debian.org>
Message-ID: <766e8cd6-1d5d-f149-ddd0-025e5c6a086d@debian.org>
Date: Wed, 27 May 2020 10:51:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <600e41e7-645c-7806-9580-6db458004a25@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Breno Leitao <leit@fb.com>

Unfortunately devtool is not able to deploy (and undeploy) into IPv6
hosts.

This patch simply adds a way to use IPv6 target address similarly to
ssh/scp, as foo@[xxxx:yyyy::zzzz]:/destdir.

In order to do it, I've created a function that parses the hostname,
user and destdir, and then create a target_ssh (for ssh like parameter
 -- foo@xxx:yyyy::zzz) and target_scp for scp paramers as
 -- foo@[xxxx:yyyy::zzz]:/destdir. The urlparsing is done by urlparse
module and ip version discovery is done by ipaddress module.

This is the tests I have been using to validate my patch

IPV4_FORMATS="
      root@11.11.11.2:/tmp
      root@11.11.11.2
      11.11.11.2:/tmp
      11.11.11.2
      "

IPV6_FORMATS="
      root@[2620:10d:c0bb:403:dac4:97ff:feda:3325]:/tmp
      root@[2620:10d:c0bb:403:dac4:97ff:feda:3325]
      [2620:10d:c0bb:403:dac4:97ff:feda:3325]:/tmp
      [2620:10d:c0bb:403:dac4:97ff:feda:3325]
      "

HOSTNAMES="
      root@foo.bar:/tmp
      root@foo.bar
      foo.bar:/tmp
      foo.bar
      "

for I in $IPV6_FORMATS
do
  devtool deploy-target -6 -s mypkg ${I}
  devtool undeploy-target -6 -s mypkg ${I}
done

for I in $HOSTNAMES
do
  devtool deploy-target -s mypkg ${I}
  devtool undeploy-target -s mypkg ${I}
done

for I in $IPV4_FORMATS
do
  devtool deploy-target -s mypkg ${I}
  devtool undeploy-target -s mypkg ${I}
done
---
 scripts/lib/devtool/deploy.py | 61 +++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 6a997735fc..1580256e2a 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -11,6 +11,8 @@ import os
 import shutil
 import subprocess
 import tempfile
+import urllib
+import ipaddress
 
 import bb.utils
 import argparse_oe
@@ -134,6 +136,18 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
     return '\n'.join(lines)
 
 
+def parse_ip(args):
+    t = urllib.parse.urlparse("ssh://" + args.target)
+
+    try:
+        ip = ipaddress.ip_address(t.hostname)
+        version = ip.version
+    except ValueError:
+        # hostname instead of ip return version  0
+        version = None;
+
+    return t.username, t.hostname, t.path, version
+
 
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
@@ -143,14 +157,7 @@ def deploy(args, config, basepath, workspace):
 
     check_workspace_recipe(workspace, args.recipename, checksrc=False)
 
-    try:
-        host, destdir = args.target.split(':')
-    except ValueError:
-        destdir = '/'
-    else:
-        args.target = host
-    if not destdir.endswith('/'):
-        destdir += '/'
+    user, host, destdir, ipversion = parse_ip(args)
 
     tinfoil = setup_tinfoil(basepath=basepath)
     try:
@@ -235,16 +242,30 @@ def deploy(args, config, basepath, workspace):
                 f.write('%d\n' % ftotalsize)
                 for fpath, fsize in filelist:
                     f.write('%s %d\n' % (fpath, fsize))
+
+            # Need to generate target as a scp format
+            if ipversion == 6:
+                target_scp = "[%s]:%s" % (host, os.path.dirname(tmpscript))
+            else:
+                target_scp = "%s:%s" % (host, os.path.dirname(tmpscript))
+            if user:
+                target_scp = "%s@%s" % (user, target_scp)
+
             # Copy them to the target
-            ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+            ret = subprocess.call("scp %s %s %s %s/* %s" % (scp_sshexec, scp_port, extraoptions, tmpdir, target_scp), shell=True)
             if ret != 0:
                 raise DevtoolError('Failed to copy script to %s - rerun with -s to '
                                 'get a complete error message' % args.target)
         finally:
             shutil.rmtree(tmpdir)
 
+        if user:
+            target_ssh = "%s@%s" % (user, host)
+        else:
+            target_ssh = host
+
         # Now run the script
-        ret = exec_fakeroot(rd, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+        ret = exec_fakeroot(rd, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, target_ssh, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
         if ret != 0:
             raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                             'error message')
@@ -268,6 +289,8 @@ def undeploy(args, config, basepath, workspace):
     elif not args.recipename and not args.all:
         raise argparse_oe.ArgumentUsageError('If you don\'t specify a recipe, you must specify -a/--all', 'undeploy-target')
 
+    user, host, destdir, ipversion = parse_ip(args)
+
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
@@ -285,8 +308,6 @@ def undeploy(args, config, basepath, workspace):
         scp_port = "-P %s" % args.port
         ssh_port = "-p %s" % args.port
 
-    args.target = args.target.split(':')[0]
-
     tmpdir = tempfile.mkdtemp(prefix='devtool')
     try:
         tmpscript = '/tmp/devtool_undeploy.sh'
@@ -294,16 +315,28 @@ def undeploy(args, config, basepath, workspace):
         # Write out the script to a file
         with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
             f.write(shellscript)
+
+        # Format for scp
+        if ipversion == 6:
+            target_scp = "[%s]:%s" % (host, os.path.dirname(tmpscript))
+        else:
+            target_scp = "%s:%s" % (host, os.path.dirname(tmpscript))
+        if user:
+            target_scp = "%s@%s" % (user, target_scp)
+
         # Copy it to the target
-        ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+        ret = subprocess.call("scp %s %s %s %s/* %s" % (scp_sshexec, scp_port, extraoptions, tmpdir, target_scp), shell=True)
         if ret != 0:
             raise DevtoolError('Failed to copy script to %s - rerun with -s to '
                                 'get a complete error message' % args.target)
     finally:
         shutil.rmtree(tmpdir)
 
+    target_ssh = host
+    if user:
+        target_ssh = "%s@%s" % (user, target_ssh)
     # Now run the script
-    ret = subprocess.call('%s %s %s %s \'sh %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
+    ret = subprocess.call('%s %s %s %s \'sh %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, target_ssh, tmpscript, args.recipename), shell=True)
     if ret != 0:
         raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
                            'error message')
-- 
2.24.1

