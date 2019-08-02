Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 996627EE79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f17so66685803wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2VB8t91g5MAJ+zrpiSsmewEDKICung5TS/ktWxIgCic=;
	b=E2Ylu01bGtt5xnLQGkkXLeodFfD76K6lV5Xa3F9U87FYUP2oHeLP0/4LIEAR878jTs
	wwypXmboLuRKSzjSfWYRZCeGMXMMbo2iLpMhoYGlpSCc34WDT2mG8wdhTTfvv2YAK5ZE
	DJG+3kLwxPLJP2PrmqQ7OpUFCFa7ubBhGh1q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2VB8t91g5MAJ+zrpiSsmewEDKICung5TS/ktWxIgCic=;
	b=ANl96J3I9CJrARM91mlmcP/mpMQOanokKv7Y/KmGwrI5yfrN81c7vxxGv0C9e9aAyF
	KIIyba3nk4X+tl9dU3e6farlmx3n+Fer5lIMdb1AA0CDPR1NzNcdQveD1uEtMDcuFHZp
	jYwOO0EnHHDDOy/uNE42HN+eJgqCpQaPrbiz3hd5lCm2DQpLYNRIQVFzmtZKpKeaGUDc
	MkbuZmqSXCz+p/bLgu5t/ema6YhDJ4L8pdsk7iPOcI4hu840oHxyDpEZMvZIGlCZGEJ2
	q5G/ilIE+AtV7yhDFx1og7KIa19C0EUgdIPb27XdQ1VNpGV0+vZH8UUmlQrPcZlddD3/
	pXsw==
X-Gm-Message-State: APjAAAU9jNeINsn6GiyGLcYr5ITJGuBnFvZEQKTkCve2EQwYZMMiN3Zb
	j0CJIif7W5NLVJPMlbcwkb906x6tvbU=
X-Google-Smtp-Source: APXvYqxa+GUlFsxQDuCyf4q/08F1tEfSDFIlJLrOmjAij80fG+CVdxxxTID8evdxFykbCl9mD8Xkag==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr4887681wmc.13.1564759342897; 
	Fri, 02 Aug 2019 08:22:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:14 +0100
Message-Id: <20190802152220.16954-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/8] classes/lib: Remove bb.build.FuncFailed
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:22 -0000
Content-Transfer-Encoding: 8bit

Whilst seemingly a good idea, this exception doesn't really serve any purpose
that bb.fatal() doesn't cover. Wrapping exceptions within exceptions isn't
pythonic.

Its not used in many places, lets clean up those and remove usage of it
entirely. It may ultimately be dropped form bitbake entirely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/go.bbclass         | 18 +++++++-----------
 meta/classes/image.bbclass      |  7 ++-----
 meta/lib/oe/gpg_sign.py         |  5 ++---
 meta/lib/oe/useradd.py          |  2 +-
 meta/lib/oe/utils.py            |  2 +-
 meta/lib/oeqa/targetcontrol.py  |  4 ++--
 meta/lib/oeqa/utils/commands.py |  4 ++--
 7 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index f303a15eaf3..e40e55689dd 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -71,17 +71,13 @@ python go_do_unpack() {
     if len(src_uri) == 0:
         return
 
-    try:
-        fetcher = bb.fetch2.Fetch(src_uri, d)
-        for url in fetcher.urls:
-            if fetcher.ud[url].type == 'git':
-                if fetcher.ud[url].parm.get('destsuffix') is None:
-                    s_dirname = os.path.basename(d.getVar('S'))
-                    fetcher.ud[url].parm['destsuffix'] = os.path.join(s_dirname, 'src',
-                                                                      d.getVar('GO_IMPORT')) + '/'
-        fetcher.unpack(d.getVar('WORKDIR'))
-    except bb.fetch2.BBFetchException as e:
-        raise bb.build.FuncFailed(e)
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+    for url in fetcher.urls:
+        if fetcher.ud[url].type == 'git':
+            if fetcher.ud[url].parm.get('destsuffix') is None:
+                s_dirname = os.path.basename(d.getVar('S'))
+                fetcher.ud[url].parm['destsuffix'] = os.path.join(s_dirname, 'src', d.getVar('GO_IMPORT')) + '/'
+    fetcher.unpack(d.getVar('WORKDIR'))
 }
 
 go_list_packages() {
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 682858dc957..7fa4ff20bd3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -305,11 +305,8 @@ fakeroot python do_image_qa () {
             bb.build.exec_func(cmd, d)
         except oe.utils.ImageQAFailed as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
-        except bb.build.FuncFailed as e:
-            qamsg = qamsg + '\tImage QA function %s failed' % e.name
-            if e.logfile:
-                qamsg = qamsg + ' (log file is located at %s)' % e.logfile
-            qamsg = qamsg + '\n'
+        except Exception as e:
+            qamsg = qamsg + '\tImage QA function %s failed\n' % cmd
 
     if qamsg:
         imgname = d.getVar('IMAGE_NAME')
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 2fd8c3b1ac3..d7624804d53 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -89,8 +89,7 @@ class LocalSigner(object):
             (_, stderr) = job.communicate(passphrase.encode("utf-8"))
 
             if job.returncode:
-                raise bb.build.FuncFailed("GPG exited with code %d: %s" %
-                                          (job.returncode, stderr.decode("utf-8")))
+                bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
 
         except IOError as e:
             bb.error("IO error (%s): %s" % (e.errno, e.strerror))
@@ -108,7 +107,7 @@ class LocalSigner(object):
             ver_str = subprocess.check_output(cmd).split()[2].decode("utf-8")
             return tuple([int(i) for i in ver_str.split("-")[0].split('.')])
         except subprocess.CalledProcessError as e:
-            raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
+            bb.fatal("Could not get gpg version: %s" % e)
 
 
     def verify(self, sig_file):
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
index bedfe0ecb53..8fc77568ff9 100644
--- a/meta/lib/oe/useradd.py
+++ b/meta/lib/oe/useradd.py
@@ -14,7 +14,7 @@ class myArgumentParser(argparse.ArgumentParser):
         error(message)
 
     def error(self, message):
-        raise bb.build.FuncFailed(message)
+        bb.fatal(message)
 
 def split_commands(params):
     params = re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params.strip())
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d686ce1bf61..652b2be145e 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -486,7 +486,7 @@ def write_ld_so_conf(d):
         f.write(d.getVar("base_libdir") + '\n')
         f.write(d.getVar("libdir") + '\n')
 
-class ImageQAFailed(bb.build.FuncFailed):
+class ImageQAFailed(Exception):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
         self.name = name
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 15e617c95a9..1445e3ecfb9 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -175,7 +175,7 @@ class QemuTarget(BaseTarget):
             if os.path.exists(self.qemulog):
                 with open(self.qemulog, 'r') as f:
                     bb.error("Qemu log output from %s:\n%s" % (self.qemulog, f.read()))
-            raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
+            raise RuntimeError("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
 
     def check(self):
         return self.runner.is_alive()
@@ -192,7 +192,7 @@ class QemuTarget(BaseTarget):
             self.server_ip = self.runner.server_ip
             self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
         else:
-            raise bb.build.FuncFailed("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
+            raise RuntimError("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
     def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 59ebfbe1253..7140bc73d24 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -337,8 +337,8 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         qemu.deploy()
         try:
             qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd, discard_writes=discard_writes)
-        except bb.build.FuncFailed:
-            msg = 'Failed to start QEMU - see the logs in %s' % logdir
+        except EXception as e:
+            msg = str(e) + '\nFailed to start QEMU - see the logs in %s' % logdir
             if os.path.exists(qemu.qemurunnerlog):
                 with open(qemu.qemurunnerlog, 'r') as f:
                     msg = msg + "Qemurunner log output from %s:\n%s" % (qemu.qemurunnerlog, f.read())
-- 
2.20.1


