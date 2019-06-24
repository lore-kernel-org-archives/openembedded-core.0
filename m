Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1B06F7E512
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:39 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id b7so6101882pls.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LVi+DkjYvIMpmu76xf+Q+6Shk0UMvsbeJF+zRArwBaE=;
	b=FS/8yo8fMGbx0IvyVuVejUm5mrpX3KQabbAv+50jXTG5REVAonFWcU1PPv60TFDg2a
	NIO7T9ljRyPauFA/53mw9VsLRFfKMa88y0lYXNYeEoyRtvX+OkMoHWkx1BAxa2K3lqXw
	pzwBQJA+cGV9rc+wV2x8xOQF2g6qv3X+qXw4npgTMxqu3sYMnv/3DC9hrhkwXnDyNvJR
	voN1iXK+ofxDmDP0I/8l4qQFwCtQ18B2sa73Zw2LgYdvSQKmoQ8GGplztP+fvS7NDNFX
	4vnBk7Ll5+RUC33b+boHTjaZ+yCqCpQxWZcHaJFw55ElMOUyAA6gAkxk0U6ZE4RCt6aZ
	Jsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LVi+DkjYvIMpmu76xf+Q+6Shk0UMvsbeJF+zRArwBaE=;
	b=J5Kjxet+0rQP1WlX7eSMBQrObEhOJ9McGRJG6GeYT5icPEGFRpnIwYXa9Iyg1wRnAf
	kW8RFnSGzL3DuIWQwpmmH+V31Im/KQ6Vx3Bd6SlkHCarOB+ZpVhP02DjFhAB6V5WyEHE
	angir2JPDoEJu1xvKVAPR1FcpG4jC1+nk+e3K55/27oKtH7D740LWOcUULkX7hSQvWgT
	qL2k3XnK5or4OFrjE6uQGgGHY8bXPPHVYL/FBBq07SY4AmdAGn1aswCyOPZCoOouKv71
	PdnAB6KLghXjjwXxpmzqUzNDzi/4aPkE/1fpeK4Caok6zYVcPf8jQW2AtbP9cwLg0dv6
	qHaw==
X-Gm-Message-State: APjAAAWjmPXQfhvxWt/xl1XBr0E5AeFqFyX+PBZoM/JI6sLNv2yjuXt8
	IuS9nX3aLPjWD9wTPZyL5zUCN69K2kc=
X-Google-Smtp-Source: APXvYqwg2TJzJjMirWtegGRXtirUpBa3LF5ZPLBx8eu7IcQEKqBCPOpLbgE9J7VpBqzn/3IhBaxmzQ==
X-Received: by 2002:a17:902:6ac6:: with SMTP id
	i6mr132116227plt.233.1561348480157; 
	Sun, 23 Jun 2019 20:54:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:18 -0700
Message-Id: <41ebe9afeb7f7ffda8cfeb7ff85ae4dba35e6a48.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 19/19] gpg_sign/selftest: Fix secmem parameter handling
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/gpg_sign.py                 | 39 +++++++++++++++++++--------------
 meta/lib/oeqa/selftest/cases/signing.py |  3 ++-
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index a95d2ba..2fd8c3b 100644
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
index 9c710bd..b390f37 100644
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
2.7.4


