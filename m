Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10DB47C0A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n190so9270027wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mw22IrYmHw0mJi5y2yGhhHsbUj3wDOnSQPvWanwmivk=;
	b=udELQRISQPHjWBifTst6/cMUg0C1Hlijg+zTwQLrzr4I33iMUV3lfPgNSvOe+LzlXq
	uWem0UZPHJI/9qyG+FFDSLSVF4URcrB+eYSEAl9MGJiuZcYPmKF6JR4zdZ5ZtCczv8IL
	eUOqnRu3IHUgElHOirbqjtqdoQip4hZXSJh9zSA1zZDD2nqvdZfwRinL6W1ZDf2R5r0D
	43PzWY0JhEMYJV+jBJ8Gx/lIeRHuGydL4ZTCZI2l8klvB1Cxbb1kuQzmtvswXBl4dXws
	BPj30VIRdTh7aCvcvoWQ9MjFvrj6toJXvMzkIKSX1QSsmFA0tTHkS67LyIedPbXr6uTR
	cUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mw22IrYmHw0mJi5y2yGhhHsbUj3wDOnSQPvWanwmivk=;
	b=Ikjp3bJPTYC3swRlQsq9aSCTubJ76mAAvgcxIF0WtdOZKkb+7mfNeGZTI8YVlfe4ch
	5+2X8GMd1NR42vgLTbCvfXsLPOxBfKKiw4eNer7Szx1fmO0yhY5EM1xg/7O+yhtrHvFK
	GjYsKzmyhfwFrEgzxM4DYP/eGWx+WH9a1IwL3OQxEaCfTxbwFoIzdsqOmiKUorZA2rD6
	jJ1fVOefg17qIC5HXLpXd9VflWACW9V3XGFV0MJ9CQ21lmRJqGgfVuakQ/6uQz1kXVQx
	F8YQKImAdquU9x8Y2nv1uJfL7HmGOHuUhdO9JLY8tAp9GFIgxch6pm3ay01rO8fs2VuL
	idsQ==
X-Gm-Message-State: AJcUukeRg/LkzXCrDO+zyzYNZAqmj974FUlwelPwGMp0CnQ7AVNBLcoX
	oNMTixbsl+75xvhU9lEpVTpUswLf
X-Google-Smtp-Source: ALg8bN7KHe8da5jwaU0yKCvZtX0aUN0FuCxzlfII///Hl8BbFoRvjfFHnPRNmgL5xGCGaWWPsWSpVg==
X-Received: by 2002:a1c:2382:: with SMTP id j124mr12050957wmj.14.1547478224492;
	Mon, 14 Jan 2019 07:03:44 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:17 +0100
Message-Id: <6bc81cf180fd667c1572943ec0755cb9f17eca26.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 21/23] runqemu: do not check for GL libraries
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:44 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index fa88dc4583c..ac45dc78942 100755
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
@@ -1166,8 +1133,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


