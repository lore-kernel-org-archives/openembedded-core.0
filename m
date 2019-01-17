Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 64EC07C1E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:49 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id v15-v6so9076846ljh.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TdRjFDNlsvPmOIWFUl4swW8nG0ZMDwlUqbvYfHyeEmY=;
	b=uWq9CLi1R08tLF/x8PJ/IEZFTLEESHahZP7OBR16I0oSd+JwlTNxurlEMVEvAhUNyK
	MmE85atvqolFJ3WnE00ISIUCD0o6ozIxrj8P0LzEvSmEVHFs2sMM3RvoXRgxr6PGK4Yx
	4RTKw+o0keMQBBIHNam7fpxLEGzAxHcs/sTC0KNrL9ze6BSOgqO3eww55YXQQAJWGud8
	ZVRJpAlsSvGpTjWb52fOUmqaydyqT/CFTZoPb1e7Yy5NCMDJcbRYDeFFk7MwHGz3l5wv
	8hYFqjZpGFEIQeccsOfEIVtNaV+J1Zxzpl1/dsjQz8YlPi3fS/uPiM46397+JLQjDGTG
	hliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TdRjFDNlsvPmOIWFUl4swW8nG0ZMDwlUqbvYfHyeEmY=;
	b=HkONB7xhEh7hGIhZZ20pTlr83uKu0My9u7423qj32cK3yiwF7nW7bpG33leYIgWCle
	3hYwzu15TcFhK3PfIIaNeqSNlrcFv2wLKe0efNeCMEqgkKFzuA5iABy+dpVXrc5ki3wx
	xbnMEqeCABleLUql9h1HVQSOtKcnx2IrN1B/Qy7/8l2nNN8ZZN9GIUquALYcuXV8korj
	3iGOBXpjwCtwghyXl20UUfBHXqJy/TtYkqdjb9ZSm1AiPgezstvx42Jx+/QnmbiDM2dE
	/hAzyHt/FcHhKteAOptbsy+XZyu14KIELs1BhI1LkyUX9MXjQ5uFwR9XgPK0U/CBHqEI
	StbQ==
X-Gm-Message-State: AJcUukcbsVIfxmqoc0Bq1StLmmUuMJq52aF2kRgmodbAH0r7jCYaJPR7
	WlOhJ/aLu1FXKYzVpcxWU+S6Fe+N
X-Google-Smtp-Source: ALg8bN7hhbRWJ/9UdOMo51blyyTijKkxryDFAkmcF9so4eVQwTDOLtUECowjrH5JM6ZUvABRPC3Yeg==
X-Received: by 2002:a2e:4819:: with SMTP id
	v25-v6mr10847718lja.2.1547743249710; 
	Thu, 17 Jan 2019 08:40:49 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:07 +0100
Message-Id: <0ed1483f2d3ca8c7fc38ae39894ed22da52f72e3.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 22/27] runqemu: do not check for GL libraries
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:50 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 12372bb7d84..5393ac5067b 100755
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
@@ -1180,8 +1147,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


