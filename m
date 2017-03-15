Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4F73B77653
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 10:01:43 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id f84so16639049ioj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KqXeowspSnWpbHmYM4TEmiFZHCpHGWzsh4QIDHhDLFw=;
	b=wbQqkJBI2nGFW6CPRLk3QdEXiHp9cKPOGlKxm5RhbLGtmZTgDJmsA0naCYT8g6jsox
	shjGBQVxSsxDs8KQiD8yNfbRqNfNlmABcT8bPjmfq/zkSFY6w6CsXOMpg6kdwKK9PkSL
	3hMiQ/CfqRKL+fhN+5JpTdx65CCsRU8qJznigTUBSgV8Xks10cDOtpyxCqJLgcw4TYOs
	BbbGsn48v8NAflK8/hZJ4p8UgvVYeBe+4ZAHpYfXv0steFdVgfeQBDPMwoOgdYpNeApL
	hCB4r3MRgHfJ+YQC1uu0BYQFQMlflm7XdvU6CNVuTq+PmVW3NZW/5dzcNmFYvKXALL+1
	/MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KqXeowspSnWpbHmYM4TEmiFZHCpHGWzsh4QIDHhDLFw=;
	b=O76iHYuyPclFLW/EC8stN8TjghOhFLvpWsqKtYgpDhvfot78PcIl+ym7F+CnyLchYK
	EHUzcsM8FQ1kxagAVTgsnvLWcVkZs88vWCtVaCXT9FOrs+yL+dvFjj/9wW8HoawzoHd7
	VoI8t4CzUIZrRSXVzdVDK+K7NISorScNtbdUiVAiCqTjUSoYN5w/Bi0/IsMdjmgduZi0
	neU0twXp+2W1cysVZBcpG8bwL1K+K/CjwVfyxWcADvSMIdULtc3lfQtgMIgf1+nQT7xk
	f3Vn4rNdp8b3Zeo9MebS2hg+wVNssU6PzuUccXTvrzjdJWAtsPKy+xh283ci8BEQjvrU
	xkrA==
X-Gm-Message-State: AFeK/H1lBSZhEv6rm1uPRjBjWgdf5EsV5OCSYiGmQZmCuWV/e7/3QKUCSVeYe2LGShwDvIcl
X-Received: by 10.107.200.139 with SMTP id y133mr4502528iof.147.1489572104736; 
	Wed, 15 Mar 2017 03:01:44 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DCEB.dip0.t-ipconnect.de.
	[93.232.220.235])
	by smtp.gmail.com with ESMTPSA id 78sm1299917ity.7.2017.03.15.03.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Mar 2017 03:01:43 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 11:01:34 +0100
Message-Id: <20170315100134.6461-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Cc: saul.wold@intel.com
Subject: [PATCH] yocto-compat-layer: improve error handling in signature creation
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
X-List-Received-Date: Wed, 15 Mar 2017 10:01:44 -0000

When "bitbake -k -S none world" failed, the error printed by
yocto-compat-layer.py contained the stack trace multiple times and did not
contain the stderr output from bitbake, making the error hard to understand
and debug:

  INFO: ======================================================================
  INFO: ERROR: test_signatures (common.CommonCompatLayer)
  INFO: ----------------------------------------------------------------------
  INFO: Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 144, in get_signatures
      stderr=subprocess.PIPE)
    File "/usr/lib/python3.4/subprocess.py", line 620, in check_output
      raise CalledProcessError(retcode, process.args, output=output)
  subprocess.CalledProcessError: Command 'bitbake -k -S none world' returned non-zero exit status 1

  During handling of the above exception, another exception occurred:

  Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/cases/common.py", line 51, in test_signatures
      curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 149, in get_signatures
      raise RuntimeError(msg)
  RuntimeError: Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 144, in get_signatures
      stderr=subprocess.PIPE)
    File "/usr/lib/python3.4/subprocess.py", line 620, in check_output
      raise CalledProcessError(retcode, process.args, output=output)
  subprocess.CalledProcessError: Command 'bitbake -k -S none world' returned non-zero exit status 1

  Loading cache...done.
  Loaded 1328 entries from dependency cache.
  NOTE: Resolving any missing task queue dependencies
  NOTE: Runtime target 'zlib-qat' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['zlib-qat']
  ...
  Summary: There were 5 ERROR messages shown, returning a non-zero exit code.

The yocto-compat-layer.log was incomplete, it only had the first part
without the command output.

stderr was missing due to stderr=subprocess.PIPE.

Instead of the complicated try/except construct it's better to check
the return code ourselves and raise just a single exception. The
output (both on stderr and in the yocto-compat-layer.log) now is:

  INFO: ======================================================================
  INFO: ERROR: test_signatures (common.CommonCompatLayer)
  INFO: ----------------------------------------------------------------------
  INFO: Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/cases/common.py", line 51, in test_signatures
      curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 147, in get_signatures
      raise RuntimeError(msg)
  RuntimeError: Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.
  Command: bitbake -k -S none world
  Output:
  Loading cache...done.
  Loaded 1328 entries from dependency cache.
  NOTE: Resolving any missing task queue dependencies
  ERROR: Nothing PROVIDES 'qat16' (but /fast/work/meta-intel/common/recipes-extended/openssl-qat/openssl-qat_0.4.9-009.bb DEPENDS on or otherwise requires it)
  ERROR: qat16 was skipped: incompatible with machine qemux86 (not in COMPATIBLE_MACHINE)
  ...
  Missing or unbuildable dependency chain was: ['openssl-qat-dev']
  ...
  Summary: There were 5 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index b3a166aa9ab..a7eb8625310 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -135,17 +135,15 @@ def get_signatures(builddir, failsafe=False):
 
     sigs = {}
 
-    try:
-        cmd = 'bitbake '
-        if failsafe:
-            cmd += '-k '
-        cmd += '-S none world'
-        output = subprocess.check_output(cmd, shell=True,
-                stderr=subprocess.PIPE)
-    except subprocess.CalledProcessError as e:
-        import traceback
-        exc = traceback.format_exc()
-        msg = '%s\n%s\n' % (exc, e.output.decode('utf-8'))
+    cmd = 'bitbake '
+    if failsafe:
+        cmd += '-k '
+    cmd += '-S none world'
+    p = subprocess.Popen(cmd, shell=True,
+                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    output, _ = p.communicate()
+    if p.returncode:
+        msg = "Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.\nCommand: %s\nOutput:\n%s" % (cmd, output.decode('utf-8'))
         raise RuntimeError(msg)
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
 
-- 
2.11.0


