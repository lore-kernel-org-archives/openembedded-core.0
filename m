Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.20721.1599740682436218398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OhzDlwHy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id b79so5586393wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EPTSDHyPDADLJnlgS0GY++n+BnpLlbqc5IjGDBS7NAI=;
        b=OhzDlwHyzgRRjiH6sD/Xr6epqXaVjRnsOm5LZpVyQpYG+obSeIbhOzsas9JRvQR0sc
         mylF//iOaSy2M7HcojMyljl8Tg//elnK2ca+uV3kq/JoHnR1jWSiOi8w6TiPIT6F3zAP
         aYwdNMappeZAjmK4ZBrlCAq1G28wn2snmv2Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EPTSDHyPDADLJnlgS0GY++n+BnpLlbqc5IjGDBS7NAI=;
        b=l6b3s4Tbwfc1+L4v79FkYQwgsCZaHc2/aFslFvIWdw6BFfiEp7pGgIrcfAvnIoQBET
         BVYB2B18pHTqSw6z98XO3YdQBSmqRgBdZ6XdnwcQQpqlPqPM1/nWjyyj0XYVBXG4ZmiE
         HtZYa6cxniyAXroiVEUsSKzE8FmUaB1Rnt7Z2pdeDobVUQthkY3Lp9kUTeQRBJiidvqj
         frnH+M4jHVutkvnrRneI7BMdFhvagOFRmrMd7k4JE2nwAuuixXfh58s3MCMia8fTN1UO
         W1NyPmHP5MskaBQA3UKkqnIt8jEdI6KA5w+KLPllMTxIn8W5f9tnI7exmqoiT3OFE2Ci
         uQeQ==
X-Gm-Message-State: AOAM531W4upMtu1cnO155daD+W0gScyfTXPqKQfp891JK3Z/Kpwhqdla
	o1tQJzbxgp2XMwlnez+ps0F59T/CQgDpgA==
X-Google-Smtp-Source: ABdhPJyfR0B+MRCWACQ0QoxqUJiZFhWmeQR4WruoMQ/4Hs3bxxYUryMRjwEQaUjhl/t/inLimVwnfg==
X-Received: by 2002:a1c:800f:: with SMTP id b15mr7905220wmd.114.1599740680514;
        Thu, 10 Sep 2020 05:24:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
Subject: [PATCH][thud 08/29] runqemu: add lockfile for port used when slirp enabled
Date: Thu, 10 Sep 2020 13:24:12 +0100
Message-Id: <20200910122433.2040293-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

There is race condition when multi qemu starting with slirp,
add lockfile for each port to avoid problem like:

runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: Could not set up host forwarding rule 'tcp::2323-:23'

[YOCTO #13364]

(From OE-Core rev: ceb3555a40ba06e58914465376aaf41392c12a7c)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 128 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 91 insertions(+), 37 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f83e05728b1..b0509672d55 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -157,19 +157,6 @@ def get_first_file(cmds):
                     return f
     return ''
 
-def check_free_port(host, port):
-    """ Check whether the port is free or not """
-    import socket
-    from contextlib import closing
-
-    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
-        if sock.connect_ex((host, port)) == 0:
-            # Port is open, so not free
-            return False
-        else:
-            # Port is not open, so free
-            return True
-
 class BaseConfig(object):
     def __init__(self):
         # The self.d saved vars from self.set(), part of them are from qemuboot.conf
@@ -218,8 +205,9 @@ class BaseConfig(object):
         self.audio_enabled = False
         self.tcpserial_portnum = ''
         self.custombiosdir = ''
-        self.lock = ''
-        self.lock_descriptor = None
+        self.taplock = ''
+        self.taplock_descriptor = None
+        self.portlocks = {}
         self.bitbake_e = ''
         self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
@@ -240,30 +228,81 @@ class BaseConfig(object):
         # avoid cleanup twice
         self.cleaned = False
 
-    def acquire_lock(self, error=True):
-        logger.debug("Acquiring lockfile %s..." % self.lock)
+    def acquire_taplock(self, error=True):
+        logger.debug("Acquiring lockfile %s..." % self.taplock)
         try:
-            self.lock_descriptor = open(self.lock, 'w')
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            self.taplock_descriptor = open(self.taplock, 'w')
+            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
-            msg = "Acquiring lockfile %s failed: %s" % (self.lock, e)
+            msg = "Acquiring lockfile %s failed: %s" % (self.taplock, e)
             if error:
                 logger.error(msg)
             else:
                 logger.info(msg)
-            if self.lock_descriptor:
-                self.lock_descriptor.close()
-                self.lock_descriptor = None
+            if self.taplock_descriptor:
+                self.taplock_descriptor.close()
+                self.taplock_descriptor = None
             return False
         return True
 
-    def release_lock(self):
-        if self.lock_descriptor:
+    def release_taplock(self):
+        if self.taplock_descriptor:
             logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
-            self.lock_descriptor.close()
-            os.remove(self.lock)
-            self.lock_descriptor = None
+            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_UN)
+            self.taplock_descriptor.close()
+            os.remove(self.taplock)
+            self.taplock_descriptor = None
+
+    def check_free_port(self, host, port, lockdir):
+        """ Check whether the port is free or not """
+        import socket
+        from contextlib import closing
+
+        lockfile = os.path.join(lockdir, str(port) + '.lock')
+        if self.acquire_portlock(lockfile):
+            with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
+                if sock.connect_ex((host, port)) == 0:
+                    # Port is open, so not free
+                    self.release_portlock(lockfile)
+                    return False
+                else:
+                    # Port is not open, so free
+                    return True
+        else:
+            return False
+
+    def acquire_portlock(self, lockfile, error=True):
+        logger.debug("Acquiring lockfile %s..." % lockfile)
+        try:
+            portlock_descriptor = open(lockfile, 'w')
+            self.portlocks.update({lockfile: portlock_descriptor})
+            fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_EX|fcntl.LOCK_NB)
+        except Exception as e:
+            msg = "Acquiring lockfile %s failed: %s" % (lockfile, e)
+            if error:
+                logger.error(msg)
+            else:
+                logger.info(msg)
+            if self.portlocks[lockfile]:
+                self.portlocks[lockfile].close()
+                del self.portlocks[lockfile]
+            return False
+        return True
+
+    def release_portlock(self, lockfile=None):
+        if lockfile != None:
+           logger.debug("Releasing lockfile '%s'" % lockfile)
+           fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
+           self.portlocks[lockfile].close()
+           os.remove(lockfile)
+           del self.portlocks[lockfile]
+        elif len(self.portlocks):
+            for lockfile, descriptor in self.portlocks.items():
+                logger.debug("Releasing lockfile '%s'" % lockfile)
+                fcntl.flock(descriptor, fcntl.LOCK_UN)
+                descriptor.close()
+                os.remove(lockfile)
+            self.portlocks = {}
 
     def get(self, key):
         if key in self.d:
@@ -923,10 +962,21 @@ class BaseConfig(object):
         ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
         ports = [int(i) for i in ports]
         mac = 2
+
+        lockdir = "/tmp/qemu-port-locks"
+        if not os.path.exists(lockdir):
+            # There might be a race issue when multi runqemu processess are
+            # running at the same time.
+            try:
+                os.mkdir(lockdir)
+                os.chmod(lockdir, 0o777)
+            except FileExistsError:
+                pass
+
         # Find a free port to avoid conflicts
         for p in ports[:]:
             p_new = p
-            while not check_free_port('localhost', p_new):
+            while not self.check_free_port('localhost', p_new, lockdir):
                 p_new += 1
                 mac += 1
                 while p_new in ports:
@@ -981,8 +1031,8 @@ class BaseConfig(object):
             if os.path.exists('%s.skip' % lockfile):
                 logger.info('Found %s.skip, skipping %s' % (lockfile, p))
                 continue
-            self.lock = lockfile + '.lock'
-            if self.acquire_lock(error=False):
+            self.taplock = lockfile + '.lock'
+            if self.acquire_taplock(error=False):
                 tap = p
                 logger.info("Using preconfigured tap device %s" % tap)
                 logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
@@ -1000,8 +1050,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
             tap = subprocess.check_output(cmd).decode('utf-8').strip()
             lockfile = os.path.join(lockdir, tap)
-            self.lock = lockfile + '.lock'
-            self.acquire_lock()
+            self.taplock = lockfile + '.lock'
+            self.acquire_taplock()
             self.cleantap = True
             logger.debug('Created tap: %s' % tap)
 
@@ -1233,8 +1283,11 @@ class BaseConfig(object):
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
         pass_fds = []
-        if self.lock_descriptor:
-            pass_fds = [self.lock_descriptor.fileno()]
+        if self.taplock_descriptor:
+            pass_fds = [self.taplock_descriptor.fileno()]
+        if len(self.portlocks):
+            for descriptor in self.portlocks.values():
+                pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
         self.qemupid = process.pid
         retcode = process.wait()
@@ -1256,7 +1309,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
-        self.release_lock()
+        self.release_taplock()
+        self.release_portlock()
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-- 
2.25.1

