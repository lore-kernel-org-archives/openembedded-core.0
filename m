Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F22C37C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q1so3840343wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=Mep43kb288KaviQ4y6GOOryBYyZFoqdfY1FSrQJvQw+wlHrlLoYnW1W7u2QTe5j9D9
	zdFULNu8O3dJg+nqO+pc9q/FEkFFk/TfsQHIQBud6EQKAzXN5YTT+fi0yQ1I8TyUN/fv
	qyh5G1eQZuNfejq99wIZDmAZhgH5kXJM9u2yxyitenGWtu8foHbmG1AsfQAfadPHEaB+
	OtDqassJ/cjB58hyOHIB2WUmiTpXbqzINjRALD9aAfiNnGSxw27n3ypbU6rQNH6sMiK2
	f/9/SiM/+X7sRJjIqLr58uIYSHvsfo3AqFfWkVMF5PXoZQHIxfUQdsHpm363Y+Ab4PdY
	kong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=Fo3nU7Cgs2OBJVL8q5NS/kBZ9kcaaJbwbH3kJ33XUPieihyUKFzYHsDNVhswa+WRCx
	m+RXXru1SNlD/mj3KKje3tEJ72UvTM3OTByzU0YOgkbCeZA82/P77AhJRykmhyGiJZ2N
	D4XoLa/ucuC1ZWg2cFLWykizNnOGU3tNPUUQE7sVuGaNfbotwLRwcwWVN0JlieeHbnE2
	a4borf1UQvqZrDkAT/grWw28kWNj+Ji9ue7bfywZ5GQPIA0avh0Q6NXvf1omCkKgC6JO
	NviT/7kV97p1efhpYLCGLEN4dWHrmW2AKyC1YvEFliqewSVceFr6En3h5BcdpgsCS7Ng
	gC5w==
X-Gm-Message-State: AHQUAuaJEadPMXSa1kxrVIlaj993KKrZEFcpAXiHxukZfOX/+Cp3Exri
	VIfb1ho5uZSDSfffxMHhbFKFossE
X-Google-Smtp-Source: AHgI3IZq5GnWLzd7GMmbCI1KAYz297MafJ2LYMRPA8M0mywYsp0DGJdS4uOQo6lAhuWHRFQAXtSNLQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr17311955wru.177.1549637171505;
	Fri, 08 Feb 2019 06:46:11 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:52 +0100
Message-Id: <a57784dca6e7af09aa1ea4c1422b358fcc40a488.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 11/12] runqemu: do not check for GL libraries
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:11 -0000

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


