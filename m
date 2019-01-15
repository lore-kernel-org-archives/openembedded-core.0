Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id EE8EA7C124
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z5so3670486wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=B1iU48dX8ftQj+wsP2Qj56redPdVu6p0PlIfa9XdNzo=;
	b=fNZSU2zbztJVznjB7H4fpjjjQEsKti2usOwS574fvrZVNjIXBu4gWaYCE50MNho40Z
	S19t8Qlx9kUXuoWMfQuYAXDgKeiV+M6EX9cS28GJkt5qYhJZQ8PwbeFi8i4Xufa+o77U
	5pLIQ6Zvd92I06feSM8Au/oIAdh1iKfZpFwXnPxqUUbpxd+AzSM9cFRo69N2RAO/U+L1
	zc3n26BJFcVIPowz/H5V0wg0UYxloCuM8l2YNyGItFIJeO7jsBvwdU/1wY7oVssFEzW4
	zvfAzZC3jcNbRb2Rx5KVEPdKHqxwERtDs7C8o4J6yBfQjnct8Ed1SoolfMy4btwDp2L3
	ZMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=B1iU48dX8ftQj+wsP2Qj56redPdVu6p0PlIfa9XdNzo=;
	b=DZqjQwcCx/EV3Z5vslFXqn+buYquOZlNMKvtHqmdflV3vRlb8yVtcnmff5ERIx+t90
	gUCWcFmkXoRwlm59mFuEkB9q6ahI7SJ/vAdUI4YckuUHsKoWLBS35al3cWQ1lb2jlctu
	7FeRh5fWkYG5FHNzo5HSC09k3hldGHGI3wsLisc9m//pbWJfo362vMYQdnoUIIgg292q
	ghgv3Ist5VnRMyL5bcNHFym6seEI4qDh6lXwnsGCBf97fUG7wddkFIaT8pm3FKDpzguw
	QOv0eWf0fvm8aPPKFwHrkTGqpec+as/D9R9t8dkqZa4Ekdy8Hn5dE12c9QlfRTehAkCX
	hXqQ==
X-Gm-Message-State: AJcUukdcAfw5T94dzsrhNpRntABVbKQol05CAOTcmZnRoeHUba5A1N4E
	vi+Pk4obdSm9DWte1pLzZj8USp2AOwQ=
X-Google-Smtp-Source: ALg8bN4huF0yA9BFuQ+X1gUuJtThgTsy7P0ljiIPuBow0fuc7bDJNBwhypL3JJtYkoZJvMjaMYFnfA==
X-Received: by 2002:adf:81c4:: with SMTP id 62mr3632140wra.266.1547570363483; 
	Tue, 15 Jan 2019 08:39:23 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:55 +0100
Message-Id: <41a344e3be1a539f3844a56cb318e56ada85d864.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 20/22] runqemu: do not check for GL libraries
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:23 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 38de092bfd7..4536ac12f82 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -117,39 +117,6 @@ def check_tun():
     if not os.access(dev_tun, os.W_OK):
         raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
-def check_libgl(qemu_bin):
-    cmd = ('ldd', qemu_bin)
-    logger.debug('Running %s...' % str(cmd))
-    need_gl = subprocess.check_output(cmd).decode('utf-8')
-    if re.search('libGLU', need_gl):
-        # We can't run without a libGL.so
-        libgl = False
-        check_files = (('/usr/lib/libGL.so', '/usr/lib/libGLU.so'), \
-            ('/usr/lib64/libGL.so', '/usr/lib64/libGLU.so'), \
-            ('/usr/lib/*-linux-gnu/libGL.so', '/usr/lib/*-linux-gnu/libGLU.so'))
-
-        for (f1, f2) in check_files:
-            if re.search('\*', f1):
-                for g1 in glob.glob(f1):
-                    if libgl:
-                        break
-                    if os.path.exists(g1):
-                        for g2 in glob.glob(f2):
-                            if os.path.exists(g2):
-                                libgl = True
-                                break
-                if libgl:
-                    break
-            else:
-                if os.path.exists(f1) and os.path.exists(f2):
-                    libgl = True
-                    break
-        if not libgl:
-            logger.error("You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.")
-            logger.error("Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.")
-            logger.error("Fedora package names are: mesa-libGL-devel mesa-libGLU-devel.")
-            raise RunQemuError('%s requires libGLU, but not found' % qemu_bin)
-
 def get_first_file(cmds):
     """Return first file found in wildcard cmds"""
     for cmd in cmds:
@@ -1163,8 +1130,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


