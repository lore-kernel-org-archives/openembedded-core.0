Return-Path: <aehs29@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id CDE9D60D24
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 10:30:10 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id p11so800173plq.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 02:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3Hd+0KC5VG2qiKyVZV/2ffTGzfJ+zX/n7yLsgy+HnZI=;
	b=A/omQcDf5atMlZuxKeUkIRGkXvAcQGyUY1H8LPIt/rPTqhES961GOflCwIznFpMP2M
	gfE3SyAbeCuYdt47qfNScApKcazveMClgWCNbv1/7hOnw86PNo9+KvSmJ+IX65MrzGj9
	iXI/5V7VgvAktkTrITyzGWqqJwepI8lfw+nOAp2A874iA0EIy1On/11H08Phd47XU1r4
	14tb4+7KA50WvqSFp1ufm8RX4wm/F0fI1OKCs4wbdmRM8DdrcPQ/1bgA302aNvKkvE2q
	XOoVBwTOecL8YHwBMIw3GgV3sKlIafV989bTG/GWj6UFJfSvCFgdmgnV6rWfaAKfQNDE
	a+hA==
X-Gm-Message-State: APjAAAXBMMkvKWcQH5jWeb0afQ3B6aLRxnygULgHTDviVFxV4U0hSw4N
	PcuOisx9U5Z9GqoMduR+zIZ6BONitwf6rw==
X-Google-Smtp-Source: APXvYqwH+FVmIz2G+6oe7m8AoKI5/LD1edlaGpMejv2+d+/Z1/8EbBAjIxwDbHp5lISB5lteOPKSXQ==
X-Received: by 2002:a17:90a:1e63:: with SMTP id
	w90mr9274035pjw.36.1581157811357; 
	Sat, 08 Feb 2020 02:30:11 -0800 (PST)
Received: from penguin.lxd (c-73-223-117-38.hsd1.ca.comcast.net.
	[73.223.117.38]) by smtp.gmail.com with ESMTPSA id
	p17sm5767763pfn.31.2020.02.08.02.30.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 02:30:10 -0800 (PST)
From: Alejandro Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Feb 2020 02:30:04 -0800
Message-Id: <20200208103004.4910-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] testimage: Allow testing on QEMU machines with a single serial port
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
X-List-Received-Date: Sat, 08 Feb 2020 10:30:10 -0000
Content-Transfer-Encoding: 8bit

commmit 6cde67d0a84 enables the use of qemurunner on machines that
only have a single serial port, but still sets the default value
as serial_ports=2 if not provided.

The testimage class does not call qemurunner with a serial_ports
argument, hence always defaulting to two.

Pass the serial_ports argument from the testimage class to allow
tests to run on QEMU machines with a single serial port.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/classes/testimage.bbclass    | 1 +
 meta/lib/oeqa/core/target/qemu.py | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 844ed87944..0d55c3247e 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -256,6 +256,7 @@ def testimage_main(d):
                       'kvm'         : kvm,
                       'slirp'       : slirp,
                       'dump_dir'    : d.getVar("TESTIMAGE_DUMP_DIR"),
+                      'serial_ports': len(d.getVar("SERIAL_CONSOLES").split()),
                     }
 
     # TODO: Currently BBPATH is needed for custom loading of targets.
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 758703c0d1..008a9f03ce 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -18,7 +18,7 @@ class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
-            tmpdir='', dir_image='', boottime=60, **kwargs):
+            tmpdir='', dir_image='', boottime=60, serial_ports=2, **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
@@ -35,7 +35,8 @@ class OEQemuTarget(OESSHTarget):
                                  deploy_dir_image=dir_image, display=display,
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
-                                 dump_host_cmds=dump_host_cmds, logger=logger)
+                                 dump_host_cmds=dump_host_cmds, logger=logger,
+                                 serial_ports=serial_ports)
 
     def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
-- 
2.20.1


