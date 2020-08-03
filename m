Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.9945.1596457836428951829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 05:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a9TX0e9x;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id 6so28034929qtt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTbw1H3Kdaf54UuBRRxizwUOQPr76NWKRiOAhKDGpMc=;
        b=a9TX0e9x8Jutf13mWX+91giyRVBO02WW1xV497kYTAi1iK7AJtRw9C5BSNDSX8QvbY
         BMbC54MjNu3IB4raqGbD2W7lgojSMbeDIsRyuh9xO5nS10v9V0VflcV+0jcdiYUymuxs
         9qxUyGigsRNqGNCgnbYSJkTVchCgaSEBwm//N+SKbCEq1cVtZoSyZdI3F4NmbgFuEnNd
         gj9+ZPkAjd2Bh+pYUOlMl+MIr8TYsCbU5zl1zuOzDzBmXDGPXqo7tMBAw+o9ajVLDDDe
         SHt/NImF7tNoU2sZSs9JeT/iV1oZYU4K4i0QYfIJdtIdxy6bJBlqQe41Jp6ZlixAhCld
         Pv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTbw1H3Kdaf54UuBRRxizwUOQPr76NWKRiOAhKDGpMc=;
        b=Xxv87PXQOKoTKJ7Q3SLx1LNq0ZUlnP48TEg70HPOIOhtZoCy8vJFlU4/m/u0aTE/QK
         06d0enXANib4LTO4XNdGcazG9lTKXhAfEvoKrnsvDAAbjxX7qrQfuCszhVcrUEajrW18
         RX3XsUUfMoAq2JwQrAAqcm3/GDS0VblkjKmzQ7iPFMcZe9QzI1EH5e169zEnTx1Vgj1S
         RAieeYQyJBUOemd2IQXrM8MEKTdmKVy83PdCtYjYkyD/EMuqGsWqEy+RRhkS1RKuPIf9
         MxVWULCNBHd7blM9LEyn/eHnVhfccB4ZU1d784arliljOpQFV+8hag9IRZWU/VNT6W+A
         dp3A==
X-Gm-Message-State: AOAM531xI6Y8F9xvdPgHOfF520guUv1dQ9Tu3uKAbrMmCNAuDGIBYfZ6
	Pv1s47Os0ThbrNGnViPbHF+EH5SFUDQIVg==
X-Google-Smtp-Source: ABdhPJzROXkj9g6uqRb7ft645XtzIuAiqKrHssYsGKRSP9SHxyjL5FIUU+EixnRVsQ+Ps53+n8dSPw==
X-Received: by 2002:ac8:7388:: with SMTP id t8mr16180844qtp.222.1596457835411;
        Mon, 03 Aug 2020 05:30:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z14sm20184299qtn.92.2020.08.03.05.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 05:30:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel-yocto: enhance configuration queue analysis capabilities
Date: Mon,  3 Aug 2020 08:30:28 -0400
Message-Id: <fd148cb1e02fec645cf89b35372b700014aa2ade.1596457310.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1596457310.git.bruce.ashfield@gmail.com>
References: <cover.1596457310.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Enable the kernel-yocto bbclass to use enhanced capabilities from
the kern-tools symbol_why.pl.

We bump the kern-tools SRCREV to pickup the reworking of symbol_why,
which uses Kconfiglib to provide analysis on configuration values.

This is useful for debugging why a symbol specified in a fragment
did not end up in the final .config.

We introduce two ways to interact with the new symbol_why:

 1) a replacement of the existing kconf_check script
 2) a dedicated task that is explicitly invoked to dump details
    on the configuration.

The kconf_check replacement is transparent to the user, and is
run in exactly the same way as it was previously. But we get better
output and more detailed diagnostics if there are symbols that
don't make it into the final .config

The second way to interact with symbol why is via the new task
do_config_analysis. This is invoked like any other task, and by
default will provide a full configuration analysis and point the
user at files to look at for details.

If a more targetted analysis is desired, then specific symbols
can be set in the CONFIG_ANALYSIS variable. When this variable
is set, the task will only run for the given symbols and provide
per-variable links to the user. This variable can be set like
any other, including specification in the local.conf:

  CONFIG_ANALYSIS_pn-linux-yocto-dev = 'NF_CONNTRACK LOCALVERSION'

Which produces output as follows:

   WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
   do_config_analysis: Configuration analysis executed, see: tmp/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/NF_CONNTRACK-config-analysis.txt for details
   WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
   do_config_analysis: Configuration audit executed, see: tmp/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/NF_CONNTRACK-config-audit.txt for details
   WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
   do_config_analysis: Configuration analysis executed, see: tmp/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/LOCALVERSION-config-analysis.txt for details
   WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
   do_config_analysis: Configuration audit executed, see: work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/LOCALVERSION-config-audit.txt for details

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass             | 158 ++++++++++++++----
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   2 +-
 3 files changed, 128 insertions(+), 34 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 70818cc01c..3c428c0782 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -405,6 +405,67 @@ do_kernel_configme() {
 }
 
 addtask kernel_configme before do_configure after do_patch
+addtask config_analysis
+
+do_config_analysis[depends] = "virtual/kernel:do_configure"
+do_config_analysis[depends] += "kern-tools-native:do_populate_sysroot"
+
+CONFIG_AUDIT_FILE ?= "${WORKDIR}/config-audit.txt"
+CONFIG_ANALYSIS_FILE ?= "${WORKDIR}/config-analysis.txt"
+
+python do_config_analysis() {
+    import re, string, sys, subprocess
+
+    s = d.getVar('S')
+
+    env = os.environ.copy()
+    env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
+    env['LD'] = d.getVar('KERNEL_LD')
+    env['CC'] = d.getVar('KERNEL_CC')
+    env['ARCH'] = d.getVar('ARCH')
+    env['srctree'] = s
+
+    # read specific symbols from the kernel recipe or from local.conf
+    # i.e.: CONFIG_ANALYSIS_pn-linux-yocto-dev = 'NF_CONNTRACK LOCALVERSION'
+    config = d.getVar( 'CONFIG_ANALYSIS' )
+    if not config:
+       config = [ "" ]
+    else:
+       config = config.split()
+
+    for c in config:
+        for action in ["analysis","audit"]:
+            if action == "analysis":
+                try:
+                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
+                except subprocess.CalledProcessError as e:
+                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+
+                outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
+
+            if action == "audit":
+                try:
+                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
+                except subprocess.CalledProcessError as e:
+                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+
+                outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
+
+            if c:
+                outdir = os.path.dirname( outfile )
+                outname = os.path.basename( outfile )
+                outfile = outdir + '/'+ c + '-' + outname
+
+            if config and os.path.isfile(outfile):
+                os.remove(outfile)
+
+            with open(outfile, 'w+') as f:
+                f.write( analysis )
+
+            bb.warn( "Configuration {} executed, see: {} for details".format(action,outfile ))
+            if c:
+                bb.warn( analysis )
+}
 
 python do_kernel_configcheck() {
     import re, string, sys, subprocess
@@ -420,51 +481,84 @@ python do_kernel_configcheck() {
 
     env = os.environ.copy()
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
-    env['LD'] = "${KERNEL_LD}"
+    env['LD'] = d.getVar('KERNEL_LD')
+    env['CC'] = d.getVar('KERNEL_CC')
+    env['ARCH'] = d.getVar('ARCH')
+    env['srctree'] = s
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
     except subprocess.CalledProcessError as e:
         bb.fatal( "Cannot gather config fragments for audit: %s" % e.output.decode("utf-8") )
 
-    try:
-        subprocess.check_call(['kconf_check', '--report', '-o',
-                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s, configs], cwd=s, env=env)
-    except subprocess.CalledProcessError:
-        # The configuration gathering can return different exit codes, but
-        # we interpret them based on the KCONF_AUDIT_LEVEL variable, so we catch
-        # everything here, and let the run continue.
-        pass
-
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
     bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
 
-    # if config check visibility is non-zero, report dropped configuration values
-    mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
-    if os.path.exists(mismatch_file):
-        if config_check_visibility:
-            with open (mismatch_file, "r") as myfile:
+    # if config check visibility is "1", that's the lowest level of audit. So
+    # we add the --classify option to the run, since classification will
+    # streamline the output to only report options that could be boot issues,
+    # or are otherwise required for proper operation.
+    extra_params = ""
+    if config_check_visibility == 1:
+       extra_params = "--classify"
+
+    # category #1: mismatches
+    try:
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+
+    if analysis:
+        outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
+        if os.path.isfile(outfile):
+           os.remove(outfile)
+        with open(outfile, 'w+') as f:
+            f.write( analysis )
+
+        bb.debug( "outfile size is: %s %s" % (outfile,os.stat(outfile).st_size))
+        if config_check_visibility and os.stat(outfile).st_size > 0:
+            with open (outfile, "r") as myfile:
                 results = myfile.read()
                 bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration:\n\n%s" % results)
 
-    if bsp_check_visibility:
-        invalid_file = d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
-        if os.path.exists(invalid_file) and os.stat(invalid_file).st_size > 0:
-            with open (invalid_file, "r") as myfile:
-                results = myfile.read()
-                bb.warn( "[kernel config]: This BSP sets config options that are not offered anywhere within this kernel:\n\n%s" % results)
-        errors_file = d.expand("${S}/%s/cfg/fragment_errors.txt" % kmeta)
-        if os.path.exists(errors_file) and os.stat(errors_file).st_size > 0:
-            with open (errors_file, "r") as myfile:
+    # category #2: invalid fragment elements
+    extra_params = ""
+    if bsp_check_visibility > 1:
+        extra_params = "--strict"
+    try:
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+
+    if analysis:
+        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
+        if os.path.isfile(outfile):
+           os.remove(outfile)
+        with open(outfile, 'w+') as f:
+            f.write( analysis )
+
+        if bsp_check_visibility and os.stat(outfile).st_size > 0:
+            with open (outfile, "r") as myfile:
                results = myfile.read()
-               bb.warn( "[kernel config]: This BSP contains fragments with errors:\n\n%s" % results)
-
-    # if the audit level is greater than two, we report if a fragment has overriden
-    # a value from a base fragment. This is really only used for new kernel introduction
-    if bsp_check_visibility > 2:
-        redefinition_file = d.expand("${S}/%s/cfg/redefinition.txt" % kmeta)
-        if os.path.exists(redefinition_file) and os.stat(redefinition_file).st_size > 0:
-            with open (redefinition_file, "r") as myfile:
+               bb.warn( "[kernel config]: This BSP contains fragments with warnings:\n\n%s" % results)
+
+    # category #3: redefined options (this is pretty verbose and is debug only)
+    try:
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+
+    if analysis:
+        outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
+        if os.path.isfile(outfile):
+           os.remove(outfile)
+        with open(outfile, 'w+') as f:
+            f.write( analysis )
+
+        # if the audit level is greater than two, we report if a fragment has overriden
+        # a value from a base fragment. This is really only used for new kernel introduction
+        if bsp_check_visibility > 2 and os.stat(outfile).st_size > 0:
+            with open (outfile, "r") as myfile:
                 results = myfile.read()
                 bb.warn( "[kernel config]: This BSP has configuration options defined in more than one config, with differing values:\n\n%s" % results)
 }
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4f1af731d6..4402e14754 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
+SRCREV = "8b6fa727013daba5e8d72e5fc61d80caed944c6a"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d3fb451340..811c37e8ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -38,7 +38,7 @@ DEPENDS += "openssl-native util-linux-native"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
+KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.19.1

