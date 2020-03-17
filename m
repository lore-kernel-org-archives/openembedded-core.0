Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 16CAC60B46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so16187672wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LEMNOBgIs/nKX/cNWS25BZO3Ttt5aL7mlb2hfjIqprI=;
	b=QnU4RDMPZAWJDgtkf+jGkxqvpKOq/Pwq2hnIpTPmuq0ivF8eJzoVHH97lT9qRviAek
	p2w9PXNjcIFEW1kywvnXOkQnkiTreqpTIQMbwDT+pcWrVfqLoRSuGC3oT0/4OHUmXc/u
	4l17QZyiieO+az0i8fvEopapyIDtUmnsKwtGg4K7+TdASg1YGi2k78evYDjDGnI8L71I
	NcRj070xy7XF9P816jMZYvTwMaROm+btBdUtquXtXxmaAe02VncPKQXYZ+e+0BDwKVcm
	IoV3LVhPuwi+lz91fcGk49CdB1j2HqCsZqQWrz0Sp9RKab0NtRRWfk0Zu/NDrd8CHnRR
	884A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LEMNOBgIs/nKX/cNWS25BZO3Ttt5aL7mlb2hfjIqprI=;
	b=dNbwjX7B6Pi6Ed7xa7Q+30hvv5MH/s3jdPRizzEnNYsUyVR8Zcav8dmnaIojb/IEEz
	Bmpmr8oD6+HCUPRG8jLNiN2GdLPKU2QBVoe5n+xha2lc+40rrurm+sz33QMIocPCr4iM
	jedjqtFPRRPJUpC7/1DkYi2jb6/A0DU+dZbYujT0i680KpQidk7GXsVN+RQ33vEulej+
	AaeZWF+pPReYALzKRwLS0+eE6cUfnnUDaccR+rtmy9WktWa57D3fwK4nleQAPPOr0yDV
	WUbporkBzKkNHVZpC9WU/sD+mX353JGfclY56Lybmig1dBPkEUkDR2yRqnA0xxgQWKnh
	FAXQ==
X-Gm-Message-State: ANhLgQ3Mou8GUSAQBzJKFdNSwtTAr6oo0yHpCqDlkEeaLyOHDsqZcsvp
	zBgWlg40EllCCIBFIjk1g8PmvA7q
X-Google-Smtp-Source: ADFU+vtpYMRXF+2LMYEC2o/3ihjOTEYX0xfxYhJ9vHwvPRIOzqPfsDByhgTnfNhCSxZ2XPfcmt7vqw==
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr6212696wrt.33.1584458931170; 
	Tue, 17 Mar 2020 08:28:51 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:50 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:53 +0000
Message-Id: <20200317152303.4600-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 01/11] systemd: Package udev rules explicitly
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:51 -0000

udev is packaged before systemd so any wildcard inclusions in FILES will
override later specifics. List all udev rules explicitly so that the
systemd specific rules, packaged alongside systemd, appear in the
correct package.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_244.3.bb | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index c5c0ce4bad05..bb799831996c 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -599,7 +599,33 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/scsi_id \
                ${rootlibexecdir}/udev/v4l_id \
                ${rootlibexecdir}/udev/keymaps \
-               ${rootlibexecdir}/udev/rules.d/*.rules \
+               ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
+               ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
+               ${rootlibexecdir}/udev/rules.d/60-block.rules \
+               ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-drm.rules \
+               ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
+               ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-input-id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
+               ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
+               ${rootlibexecdir}/udev/rules.d/60-serial.rules \
+               ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
+               ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
+               ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
+               ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
+               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
+               ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
+               ${rootlibexecdir}/udev/rules.d/75-net-description.rules \
+               ${rootlibexecdir}/udev/rules.d/75-probe_mtd.rules \
+               ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
+               ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
+               ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
+               ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
-- 
2.17.1


