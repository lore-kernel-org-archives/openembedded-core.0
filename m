Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61F7C19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 12:55:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2884.1659790522803500914
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 05:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kVGdfJuc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id b6so2544989wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KC3ZNJO2xD6uFWS6d0Z6laYDdCwpcZD8uPNCCdWVluo=;
        b=kVGdfJucLTGagzfqTcr0ZPh7Vt2rbwtFbF0GcsAP/dGLmQsKJba+VF3qjZ1dEwXCc0
         Fo39hK0GrB0LNJgYY/k2LdqQVA1As2YvGZ4yV2ZHu5BrKQqOOYld37tTceLb9IB8rfuW
         4aJfeVsqEsfTFSLRfFcVvG5Th9jYxtfwq1vxywDvtEbuedc8B0JegClWSuOtVgOGRk6o
         i/O0hAI1xvZUW1eHuOe0aBGaV/0/aDnrPP4ZH8evOGVUzw5RF599PhgEN8AbWctpUOiA
         k+mrzq03UfGaxHj6gyGdrRWU5jLvpQNcRB5wnDQnKmy4s2GIwAcaJdM8picGosJ21038
         HwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KC3ZNJO2xD6uFWS6d0Z6laYDdCwpcZD8uPNCCdWVluo=;
        b=FJ6a1J7uhwv6k2ITP0dvz2uI+jXvYpA84EoCgozLetZ2XoD2HUwDdZl2ToQ9NlKPLm
         vW3rV98j0I4VU7C/NZHbLmekbmvEO2+SdEz4hh0a1QfdXpPYQIq6ZfhiieeIv/IZFdjh
         pOS/gAJ7vldinryX/0fxRqJXabEx6WNbc0X+yf9Lo7/DKyqv+VLfOjUmqinp6MS65+0C
         agBXsoStlt9nbpUiq/Tgm4hdEjh5zXa03dpzPQuXMd1PTmjXasZOkLAXUpF46hm3Bu/5
         s+HZHJVMUVNSdhR7vxpEQBTNFIkNpVJN5U2+CwY7AmPF+Wh3w/2nS8AptYTPKgjzQQdv
         YT+w==
X-Gm-Message-State: ACgBeo1LF3aWuDM6UUzcAjpZI1df8RVeB2JxmKldfc2oDPu9QODgVmpA
	gVdjU6+CQ+8rYprtXPpCvTyrWBA63UU=
X-Google-Smtp-Source: 
 AA6agR4f3XPxoqbu90rQctx3mpHNTReUoH9V9sv6wtx6oi6bI5o9uCCxmcJx4sQgFXKnhR0j6G1cIQ==
X-Received: by 2002:a05:600c:21d4:b0:3a3:150a:7ed2 with SMTP id
 x20-20020a05600c21d400b003a3150a7ed2mr7515192wmj.166.1659790521045;
        Sat, 06 Aug 2022 05:55:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b002217339ce90sm4087663wrx.8.2022.08.06.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 05:55:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2][RFC][DO NOT MERGE] insane: check for 'unsafe for
 cross-compilation' in log.do_compile and log.do_install again
Date: Sat,  6 Aug 2022 14:54:46 +0200
Message-Id: <20220806125446.2786715-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: 
 <CANPvuRkFDG6u29S4SweVtV95mgSyxi0xwZHbsgBMb7-nxiAHmw@mail.gmail.com>
References: 
 <CANPvuRkFDG6u29S4SweVtV95mgSyxi0xwZHbsgBMb7-nxiAHmw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 12:55:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168973

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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

 v2: fixed copy&paste issue in postfuncs reported by Jose

 meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c8b434bb54..2cb730111b 100644
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
+do_install[postfuncs] += "do_qa_install"
+
 # Check does S exist.
 do_unpack[postfuncs] += "do_qa_unpack"
 

