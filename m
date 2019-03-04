Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2999260107
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 09:07:27 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id i204so3541655ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 01:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9qdIPjewQ+8/+V+akGhwLYGcYI9wQZN0qYu4hnXIZHk=;
	b=TTfjkyxbXp5GshGg4WFZcx/ydrNdFXWyvYBpsygBfVLiLXFFeJmgoz+jo21LOPYVhg
	ZCRkA+owFSfFlJwmXA7/1irdZCfiLHJqxhNS5lmfwW9sNepg7pDuOJ/Mr+NxgdQEqo4s
	//NpsnD4gOzw8Us6dDEBI/rpIgvNH21eoFEPJaAphxS5vRK4Y5+oyE6ySkRx27Yq9kvu
	4e7bbuz7QV/GfYzTmFxEhQTsmzvgA2kZ5B14mUZJxHotmR18/O7fLgLi39QqbsvYnkDC
	GpBoPJx2ktJ7lknZFQ6XpTDo8vnIodt2T9JV8yD7LQMlAExZVsyrp3fPzgAew+SOn93f
	aBMg==
X-Gm-Message-State: APjAAAXzEmofZGeeyRYgTXlAwju53W7Ek9CE37AlEnIMaWj6eSnjNxG9
	4hJ56N5SagxSa8z4ms92MhHUc/C7Pdc=
X-Google-Smtp-Source: APXvYqxDmwE1mboikM4jimi/8T8F8dB8VF5Az5sh9AF0XtXU5s44oQfLE77roxRCePkSlcbBbRWPXg==
X-Received: by 2002:a25:5343:: with SMTP id h64mr14081070ybb.55.1551690447830; 
	Mon, 04 Mar 2019 01:07:27 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n82sm2369235ywd.37.2019.03.04.01.07.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 01:07:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 09:07:24 +0000
Message-Id: <20190304090724.888-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] masterimage: remove code duplication
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
X-List-Received-Date: Mon, 04 Mar 2019 09:07:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Two identical classes exist for SystemdbootTarget,
introduced in commit f9a61d3400ad
("gummiboot: Remove/change gummiboot references with systemd-boot")
poky commit 2dce2648e3d8

Remove the duplicated copy.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 40 ------------------------
 1 file changed, 40 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index a2912fc568..f175e119da 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -197,43 +197,3 @@ class SystemdbootTarget(MasterImageHardwareTarget):
         self.power_cycle(self.master)
         # there are better ways than a timeout but this should work for now
         time.sleep(120)
-
-
-class SystemdbootTarget(MasterImageHardwareTarget):
-
-    def __init__(self, d):
-        super(SystemdbootTarget, self).__init__(d)
-        # this the value we need to set in the LoaderEntryOneShot EFI variable
-        # so the system boots the 'test' bootloader label and not the default
-        # The first four bytes are EFI bits, and the rest is an utf-16le string
-        # (EFI vars values need to be utf-16)
-        # $ echo -en "test\0" | iconv -f ascii -t utf-16le | hexdump -C
-        # 00000000  74 00 65 00 73 00 74 00  00 00                    |t.e.s.t...|
-        self.efivarvalue = r'\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00'
-        self.deploy_cmds = [
-                'mount -L boot /boot',
-                'mkdir -p /mnt/testrootfs',
-                'mount -L testrootfs /mnt/testrootfs',
-                'modprobe efivarfs',
-                'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
-                'cp ~/test-kernel /boot',
-                'rm -rf /mnt/testrootfs/*',
-                'tar xvf ~/test-rootfs.%s -C /mnt/testrootfs' % self.image_fstype,
-                'printf "%s" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f' % self.efivarvalue
-                ]
-
-    def _deploy(self):
-        # make sure these aren't mounted
-        self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
-        # from now on, every deploy cmd should return 0
-        # else an exception will be thrown by sshcontrol
-        self.master.ignore_status = False
-        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
-        self.master.copy_to(self.kernel, "~/test-kernel")
-        for cmd in self.deploy_cmds:
-            self.master.run(cmd)
-
-    def _start(self, params=None):
-        self.power_cycle(self.master)
-        # there are better ways than a timeout but this should work for now
-        time.sleep(120)
-- 
2.20.1


