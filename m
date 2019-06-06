Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7502A6D52B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 22:17:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so212010wru.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tE0+JZZt4w7Yi8XjZcGdSU0PKJdykXuEmAsKCLPOV3Y=;
	b=eNItiUYJIV9yP4g9SXSodwB64HZ83nLvhU6mNeEKgCjO1i+mt78u2mSmDuttfAvJ1z
	4zAkohYto9EbTCdR9x2slBa1f+OIKO87A5qxu5Ziv0KS7aiDLOH1DFGM2oFCPwHDVhr2
	Ip18mSOYbJaUOXlFoV/Sgpvsu3vgTopiUjl3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tE0+JZZt4w7Yi8XjZcGdSU0PKJdykXuEmAsKCLPOV3Y=;
	b=X5piexyhX49yx1azmTUFa1hUfHyV50g+McS4JbrNipdfI1A15/7eCx6upEaBljEjv/
	Nolg2iIgkd2yn/wuq1V1xGLi8hKdMJpLsO4FVvqynszJzFps79+qSCsfOKV8gt1zlqFi
	/lAx52wyttltbC3G6ulmJpMDfzYulTpE74gMOVy9+fHHFxcIFLPu+x/W1fqaE/rY3vJ/
	DM4Ox2rKoRD+DYy0ZtivaAHHPC0yMFDU0kKtSRSXaPrI+g/41Cok5nY9dweQH8QtQbM5
	tS5Mufr79pmbU4wW17B393/KOYi5824Wr9C3hX4+zc+MJLVi6JKyxN55GxilEt/qrD8d
	5X1Q==
X-Gm-Message-State: APjAAAW8qBg/F/yiuKGJ0ZUk2XfZ3hLPDPV7TYSaxr3rzzJvX6LnwGPl
	A6Ev8Y5BsWRYSu5G/yD6Pzq9+OTtWYA=
X-Google-Smtp-Source: APXvYqz+0RdCGOw9IpeoXn/4dFCz6+uo4lN/sv/UlVjGSwopckiZF9IUtAUTqizMEYyxDFyOzXVySA==
X-Received: by 2002:a5d:4dd1:: with SMTP id f17mr6771454wru.43.1559859454912; 
	Thu, 06 Jun 2019 15:17:34 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w185sm156667wma.39.2019.06.06.15.17.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 15:17:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 23:17:30 +0100
Message-Id: <20190606221730.19043-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606221730.19043-1-richard.purdie@linuxfoundation.org>
References: <20190606221730.19043-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] gpg_sign/selftest: Fix secmem parameter handling
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
X-List-Received-Date: Thu, 06 Jun 2019 22:17:34 -0000
Content-Transfer-Encoding: 8bit

We keep seeing "cannot allocate memory" errors from rpm when signing packages
on the autobuilder. The following were tried:

* checking locked memory use (isn't hitting limits)
* Restricting RPM_GPG_SIGN_CHUNK to 1
* Limiting to 10 parallel do_package_write_rpm tasks
* Allowing unlimied memory overcommit
* Disabling rpm parallel compression

and the test still failed. Further invetigation showed that the --auto-expand-secmem
wasn't being passed to gpg-agent which meant the secmem couldn't be expanded hence the
errors when there was pressure on the agent.

The reason this happens is that some of the early gpg commands can start the agent
without the option and it sticks around in memory so a version with the correct
option may or may not get started.

We therefore add the option to all the key gpg calls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/gpg_sign.py                 | 39 ++++++++++++++-----------
 meta/lib/oeqa/selftest/cases/signing.py |  3 +-
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index a95d2ba34c6..2fd8c3b1ac3 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -15,21 +15,27 @@ class LocalSigner(object):
     def __init__(self, d):
         self.gpg_bin = d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
+        self.gpg_cmd = [self.gpg_bin]
+        self.gpg_agent_bin = bb.utils.which(os.getenv('PATH'), "gpg-agent")
+        # Without this we see "Cannot allocate memory" errors when running processes in parallel
+        # It needs to be set for any gpg command since any agent launched can stick around in memory
+        # and this parameter must be set.
+        if self.gpg_agent_bin:
+            self.gpg_cmd += ["--agent-program=%s|--auto-expand-secmem" % (self.gpg_agent_bin)]
         self.gpg_path = d.getVar('GPG_PATH')
-        self.gpg_version = self.get_gpg_version()
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
-        self.gpg_agent_bin = bb.utils.which(os.getenv('PATH'), "gpg-agent")
+        self.gpg_version = self.get_gpg_version()
+
 
     def export_pubkey(self, output_file, keyid, armor=True):
         """Export GPG public key to a file"""
-        cmd = '%s --no-permission-warning --batch --yes --export -o %s ' % \
-                (self.gpg_bin, output_file)
+        cmd = self.gpg_cmd + ["--no-permission-warning", "--batch", "--yes", "--export", "-o", output_file]
         if self.gpg_path:
-            cmd += "--homedir %s " % self.gpg_path
+            cmd += ["--homedir", self.gpg_path]
         if armor:
-            cmd += "--armor "
-        cmd += keyid
-        subprocess.check_output(shlex.split(cmd), stderr=subprocess.STDOUT)
+            cmd += ["--armor"]
+        cmd += [keyid]
+        subprocess.check_output(cmd, stderr=subprocess.STDOUT)
 
     def sign_rpms(self, files, keyid, passphrase, digest, sign_chunk, fsk=None, fsk_password=None):
         """Sign RPM files"""
@@ -59,7 +65,7 @@ class LocalSigner(object):
         if passphrase_file and passphrase:
             raise Exception("You should use either passphrase_file of passphrase, not both")
 
-        cmd = [self.gpg_bin, '--detach-sign', '--no-permission-warning', '--batch',
+        cmd = self.gpg_cmd + ['--detach-sign', '--no-permission-warning', '--batch',
                '--no-tty', '--yes', '--passphrase-fd', '0', '-u', keyid]
 
         if self.gpg_path:
@@ -72,9 +78,6 @@ class LocalSigner(object):
         if self.gpg_version > (2,1,):
             cmd += ['--pinentry-mode', 'loopback']
 
-        if self.gpg_agent_bin:
-            cmd += ["--agent-program=%s|--auto-expand-secmem" % (self.gpg_agent_bin)]
-
         cmd += [input_file]
 
         try:
@@ -101,7 +104,8 @@ class LocalSigner(object):
     def get_gpg_version(self):
         """Return the gpg version as a tuple of ints"""
         try:
-            ver_str = subprocess.check_output((self.gpg_bin, "--version", "--no-permission-warning")).split()[2].decode("utf-8")
+            cmd = self.gpg_cmd + ["--version", "--no-permission-warning"]
+            ver_str = subprocess.check_output(cmd).split()[2].decode("utf-8")
             return tuple([int(i) for i in ver_str.split("-")[0].split('.')])
         except subprocess.CalledProcessError as e:
             raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
@@ -109,11 +113,12 @@ class LocalSigner(object):
 
     def verify(self, sig_file):
         """Verify signature"""
-        cmd = self.gpg_bin + " --verify --no-permission-warning "
+        cmd = self.gpg_cmd + [" --verify", "--no-permission-warning"]
         if self.gpg_path:
-            cmd += "--homedir %s " % self.gpg_path
-        cmd += sig_file
-        status = subprocess.call(shlex.split(cmd))
+            cmd += ["--homedir", self.gpg_path]
+
+        cmd += [sig_file]
+        status = subprocess.call(cmd)
         ret = False if status else True
         return ret
 
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 4ef2f70075e..404d68b899b 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -30,7 +30,8 @@ class Signing(OESelftestTestCase):
         self.secret_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.secret")
 
         nsysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native")
-        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
+
+        runCmd('gpg --agent-program=`which gpg-agent`\|--auto-expand-secmem --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
         return nsysroot + get_bb_var("bindir_native")
 
 
-- 
2.20.1


