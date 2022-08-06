Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88692C19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 09:07:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.1488.1659776872260648722
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P2GPgh3u;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id j1so5623778wrw.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=YIueRolYyVHOncl8TSrm2FTPOo0Lu536kiNGVsWpN7A=;
        b=P2GPgh3uwD+enLFOePnfxBfpn0q64EqX1p0tsIpUaEzXw/j3T2cEUS3yN97/Ti1VV7
         V+FQSoUoiWSdIOF6i4r/x/hlPJQp6LvT2xWHyvqyhQzha/WaDD9byitUFzJ+xGe5rTAS
         7qqzws3ARQUj8cXuKlkUyU5TDQVxKpnRSNCdOVf2jCI5rkeGB7IjnPVsm8wFqW/GsvvB
         yf334flUbsFntryc1B6y0TZRJAfrs9pcN9kXZtW2ckcaSRfNnf1/IVgvqROjIRjwtXgL
         eY9J8lUkO7ZOp8BpWLZt6h/V/efJpw+2fzv/dXA6g1Q5du0Z9dfTzwCC/q1IFmY21O/H
         tDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=YIueRolYyVHOncl8TSrm2FTPOo0Lu536kiNGVsWpN7A=;
        b=zb0YqS6dk3MqXxSn5NOdA/CjVPGLgFvi+k9Bikh0W54+Mo35Hqo0h9Fu9XyNjOeJOy
         rUs8uXOStKZMtgiYxyq9DTq3O0915UoG6x7K4D/2Pt2gydcbNxW1nw7BssG2yYKGuYZv
         lvcj9x5iy/zXK/aFNCNgUpTF8D0603PHm10rH4uRISzH9l+mZkhZqaxGstupbjfTOuy1
         ZmtH2KUiwOIJnoBIWvwTpvjzjkNawQPkkdHnAtZzCr3rsXqZ2ZnqDtastzweStxJLzAH
         Gw+U2y6gSobYFXOs0MBRiAW0eU5wUHHh1YK+FlioOW3/dDX7VqNNztKggSX7PP/+llmQ
         cRwA==
X-Gm-Message-State: ACgBeo1UqIfmYlNbvxtLMbfePKOKoQMo2BwXN3prre6oZ0QZjR/DzYhK
	ys4ZrkJgSeuY68/LQNgzreZz+Zlk6Co=
X-Google-Smtp-Source: 
 AA6agR4sEveLYaik58A7FPRwwEVt/rVRwMswnuLLZJPhiF7JlAWpuGCgGHtKyHMO8RrF4x0f0WdQsg==
X-Received: by 2002:a5d:6d81:0:b0:21d:bb16:e6c8 with SMTP id
 l1-20020a5d6d81000000b0021dbb16e6c8mr6171474wrs.88.1659776870571;
        Sat, 06 Aug 2022 02:07:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b0021e74ef5ae8sm6030590wrr.21.2022.08.06.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 02:07:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] [RFC][DO NOT MERGE] insane: check for 'unsafe for
 cross-compilation' in log.do_compile and log.do_install again
Date: Sat,  6 Aug 2022 11:07:14 +0200
Message-Id: <20220806090714.2001241-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 09:07:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168969

* only a RFC to discuss what might prevent
  --enable-poison-system-directories=true in gcc-cross to work or to
  test this on AB to see if there are other places where these issues
  sneaked in without being detected

* it was removed in:
  https://git.openembedded.org/openembedded-core/commit/?id=a67e9ebfd5b8002fd4a7d8d27ff0d997817f76e1
  but looks like the "follow-up patches":
    d039d6fbfc gcc-cross: make use of the system include directories fatal
    1fcaa5f452 gcc: add an option for --enable-poison-system-directories to be fatal
  don't work anymore? I was checking if e.g. -Wno-error is used in
  webkitgtk to disable them, but it's not there, so something else went
  wrong, because in webkit-gtk log.do_compile I've just noticed:

  # grep unsafe poky/build/tmp/work/core2-64-poky-linux/webkitgtk/2.36.4-r0/temp/log.do_compile.3901410 | sort | uniq -c
      6 cc1: warning: include location "/usr/include/gstreamer-1.0" is unsafe for cross-compilation [-Wpoison-system-directories]
   1267 cc1plus: warning: include location "/usr/include/gstreamer-1.0"	is unsafe for cross-compilation [-Wpoison-system-directories]

* and with this it confirms the same in webkitgtk:

  ERROR: webkitgtk-2.36.4-r0 do_compile: QA Issue: This /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.36.4-r0/temp/log.do_compile log indicates 'unsafe for cross-compilation' or '-Wpoison-system-directories' errors, it looked at host include and/or library paths [compile-unsafe]

  and this was the only error (when building webkitgtk from scratch)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c8b434bb54..9ce5ae0f6f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -35,8 +35,8 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf file-rdeps configure-unsafe \
             configure-gettext perllocalpod shebang-size \
-            already-stripped installed-vs-shipped ldflags compile-host-path \
-            install-host-path pn-overrides unknown-configure-option \
+            already-stripped installed-vs-shipped ldflags compile-unsafe \
+            install-unsafe pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
             "
 # Add usrmerge QA check based on distro feature
@@ -1231,6 +1231,31 @@ python do_qa_patch() {
                    bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
 }
 
+def check_poisoned_system_directories(file):
+    import subprocess
+
+    statement = "grep -q -F -e 'is unsafe for cross-compilation' %s" % file
+    if subprocess.call(statement, shell=True) == 0:
+         return """This %s log indicates 'unsafe for cross-compilation' or '-Wpoison-system-directories' errors, it looked at host include and/or library paths""" % file
+
+python do_qa_compile() {
+    log = os.path.join(d.getVar('T'),"log.do_compile")
+    skip = (d.getVar('INSANE_SKIP') or "").split()
+    if 'compile-unsafe' not in skip and os.path.exists(log):
+        error_msg = check_poisoned_system_directories(log)
+        if error_msg:
+            oe.qa.handle_error("compile-unsafe", error_msg, d)
+}
+
+python do_qa_install() {
+    log = os.path.join(d.getVar('T'),"log.do_install")
+    skip = (d.getVar('INSANE_SKIP') or "").split()
+    if 'install-unsafe' not in skip and os.path.exists(log):
+        error_msg = check_poisoned_system_directories(log)
+        if error_msg:
+            oe.qa.handle_error("install-unsafe", error_msg, d)
+}
+
 python do_qa_configure() {
     import subprocess
 
@@ -1253,9 +1278,8 @@ python do_qa_configure() {
             statement = "grep -q -F -e 'is unsafe for cross-compilation' %s" % \
                         os.path.join(root,"config.log")
             if "config.log" in files:
-                if subprocess.call(statement, shell=True) == 0:
-                    error_msg = """This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
-Rerun configure task after fixing this."""
+                error_msg = check_poisoned_system_directories(os.path.join(root,"config.log"))
+                if error_msg:
                     oe.qa.handle_error("configure-unsafe", error_msg, d)
 
             if "configure.ac" in files:
@@ -1356,6 +1380,10 @@ do_patch[postfuncs] += "do_qa_patch "
 #addtask qa_configure after do_configure before do_compile
 do_configure[postfuncs] += "do_qa_configure "
 
+# Check poison-system-directories in log.do_compile and log.do_install
+do_compile[postfuncs] += "do_qa_compile"
+do_compile[postfuncs] += "do_qa_install"
+
 # Check does S exist.
 do_unpack[postfuncs] += "do_qa_unpack"
 

