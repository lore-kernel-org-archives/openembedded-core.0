Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DCE007C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s12so17888586wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=BRx/6sWFNmdw9FazechizCvJGfS8LpLGS0H/YoqgL/MtGT4luOlgMfz5GFz573idp4
	j/JCYrojBVLV/Zei1j5APg9fa3FtrWjxfX9serT7Kv6MIYc+MYwi1fVUszPz8lf2MYvq
	gtHd4CuGK01w15lECfPIOHBIQYaK5tKztFOj7V3o3FjJM2yJvwp0rw4iw2FbHW4SnkFh
	AzyXYPSzbdjg5Uhn9GVBYR4LGk5c/pMzltUPwXs7JIap8lMLbtcHwzTJvw8sDYj5wTE8
	rF6v0DhC+uceiUxSfSnf1QkebgUTkWysK08vn2R4s3rOdXN+eVh/KNKqCD/SW/DKrF/1
	RrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=sN349KK1MMZmA/WpcajTZBHFnMmA3LcrYYgB8Z+jSVZH7x+dBFqresoyscjHd67auR
	CLV+Vvq/XT/ROyDJKFQVGD2he+c1DftTyOYtzih84yIo1ZpE+lrM21sSS2tdPtC2KkhK
	v91daH9Ov5CySnX4EpytneAZbfY1uzMpHlciUUGz2XY1/r2sS5z5hjjn/ZETge/Ia3EC
	TDnbtZQ/piV63q1OFdIcW6QdaIjH3DB+ylrxDCjxh24Y/n+BGIUtMKE6m2CYGev1DeSa
	aDMwKNFY2cw3Yp88Sp8ksvu5/CcRGVy+B/yUMcpDNCyxQw8MizfHYiYa2h0dygWnmZmr
	gLpg==
X-Gm-Message-State: AJcUukfy2SxkQoZUSnICZsDt1eVTN2et8LfUXTnyYcbxJwGS8ZEXVWRp
	M/uCtWIOVHJf4OhMj1W25H25FyzJ
X-Google-Smtp-Source: ALg8bN4n65Pxav4JbqcQ4QS7pbZ3lI5sXgN0f2bEhcWAcXE/VL46KOOSxVQf04vFz8EwiUKNY8FZvg==
X-Received: by 2002:adf:c846:: with SMTP id e6mr20875030wrh.243.1548679650467; 
	Mon, 28 Jan 2019 04:47:30 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:53 +0100
Message-Id: <81171db25d84d14edf93baa49cb78cda4235211d.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 22/24] runqemu: do not check for GL libraries
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:30 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 50888a532e8..586f8700c94 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -118,39 +118,6 @@ def check_tun():
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
@@ -1178,8 +1145,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


