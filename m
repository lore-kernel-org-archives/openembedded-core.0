Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 781D37E6B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u17so742595pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=E4XHCEMIaHG3Ck4lBr5kGkFZi7r4vggScC/aq9VmSHo=;
	b=BmmbsX02n5t71oYlemllJ8Ata58TNQLF9pF85+f7Gkb5tWhV3LderB8S0AkDKcxyzT
	jUQTd/jbgMpi4JSPpynMnkSvUgnyApczCeQeXd8eMmw3Pe10hwtK/2k9HNDvsuUBlQWy
	k1QUHHZvIGs38TYBmK6yg3hRnbV1gQBGZw3eyo+WHJNcKzC1+D5CpBJNEqf5OX3zF050
	vILeWVmTCl7WN9juFck/9CIx1jVyt0nVOl8QGdjjycjHTRqhMHkEdRcDRK3fnqcGX/Ch
	EVITktUzy34LqJSV6gQ2zLj6b+D2M7BAVSMaEumCjrSBLapNLNGcowrl28Rfd6rV/n3k
	otVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=E4XHCEMIaHG3Ck4lBr5kGkFZi7r4vggScC/aq9VmSHo=;
	b=n2ESCsM0XFJL8b4jaic3QYGTf7yM3n9rOXeSsf+G2YeALdfAqdgGjZ+kNkGWS9ZdbH
	S/6YFfVySi8jGHQmpICx+hJ5uEyjeRXWzN2FgtCNAiMd1EN/NGud558RUlcU+0pLwCmX
	IjkwgPGvPTy9nYQjNGp2U+9CIEaqhGkmFsrL8zmzMFeF70T6Grk4EHX0OXLBHEZX1ElA
	ABl81kLiRZHB2w5BSZEf5PSq0+aXH/UaS7f4fjPoUuD86QMakkJkaaNv4bbq4x5cOxGk
	3lpyROvvJynw2aeymJK9xR/AR1d6ddYFl6+6RSbL5X9zZf0szwWVOlvifng19zpF83rB
	x/vQ==
X-Gm-Message-State: APjAAAU0noPSmnmnQRomQfukVzNyyXWLZQi0G2eOdUFjMjWxrc4Wrnpf
	4mKw74lrL0KDi+06WVVZOmeCNA==
X-Google-Smtp-Source: APXvYqxYUq8Zdu727giVj5jLPRzjzeyoRa75rIAfgak14wkSPafHPzp9Uul3ezUcocPfcHiFF6PGFA==
X-Received: by 2002:a65:6096:: with SMTP id t22mr1928534pgu.204.1566968849443; 
	Tue, 27 Aug 2019 22:07:29 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	5sm960435pgh.93.2019.08.27.22.07.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:28 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-9-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 9/11] oeqa/utils/nfs: Add unfs_server function to setup a userspace NFS server
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add a nfs module into oeqa utils. This module provides unfs_server which
allows a test case to build unfs3-native and setup the unfs server on a
target directory of the host. This directory is then shared and can be
mounted by the host or a target device attached to the host (e.g. qemu
via tap or slirp). The nfs server is setup over UDP and automatically
assigns user privileged ports. The function provides the UDP ports for
the server as part of a returned python contextmanager which handles
cleanup of the server process on completion or exception.

Also add a 'udp' arg to get_free_port to get a free UDP port.

Note: unfs3 still requires the host to have rpcbind or portmap running.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/utils/network.py |  4 ++--
 meta/lib/oeqa/utils/nfs.py     | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/nfs.py

diff --git a/meta/lib/oeqa/utils/network.py b/meta/lib/oeqa/utils/network.py
index 59cbbc4f1b..59d01723a1 100644
--- a/meta/lib/oeqa/utils/network.py
+++ b/meta/lib/oeqa/utils/network.py
@@ -4,8 +4,8 @@
 
 import socket
 
-def get_free_port():
-    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+def get_free_port(udp = False):
+    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM if not udp else socket.SOCK_DGRAM)
     s.bind(('', 0))
     addr = s.getsockname()
     s.close()
diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
new file mode 100644
index 0000000000..a37686c914
--- /dev/null
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: MIT
+import os
+import sys
+import tempfile
+import contextlib
+import socket
+from oeqa.utils.commands import bitbake, get_bb_var, Command
+from oeqa.utils.network import get_free_port
+
+@contextlib.contextmanager
+def unfs_server(directory, logger = None):
+    unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
+    if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
+        # build native tool
+        bitbake("unfs3-native -c addto_recipe_sysroot")
+
+    exports = None
+    cmd = None
+    try:
+        # create the exports file
+        with tempfile.NamedTemporaryFile(delete = False) as exports:
+            exports.write("{0} (rw,no_root_squash,no_all_squash,insecure)\n".format(directory).encode())
+
+        # find some ports for the server
+        nfsport, mountport = get_free_port(udp = True), get_free_port(udp = True)
+
+        nenv = dict(os.environ)
+        nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
+        cmd = Command(["unfsd", "-d", "-p", "-N", "-e", exports.name, "-n", str(nfsport), "-m", str(mountport)],
+                bg = True, env = nenv, output_log = logger)
+        cmd.run()
+        yield nfsport, mountport
+    finally:
+        if cmd is not None:
+            cmd.stop()
+        if exports is not None:
+            # clean up exports file
+            os.unlink(exports.name)
+
---
2.23.0.rc1

