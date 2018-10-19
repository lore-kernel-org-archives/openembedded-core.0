Return-Path: <matt.hoosier@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id B0C4574588
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 16:04:57 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q18-v6so1262121iod.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xf/uxsQ7kQf1nsMOk8ZTDmw0BHq5MALxeRZKskdLp+s=;
	b=uvANijoHmPJhKEsUnrCoQDpYZoOGpYecbOvm7NRkpE7K2IBVIVYyhq9vzbNed/bo62
	jwqHlPti6v9/wH3Ni2PWk7TXEJ7BpouDadIe480I9Md1pzNYlHGUGYdz2hjDAsaOLNRW
	VJ6dGyBNjOjy+WUfnK9VsRjMw0ycYQB0ALenzyMhact6Q2K1J6C3z1uPu6ildpLyApyd
	RrbZ8y+JvYMllUviCleoqRM4CjQROwGvHOTkpUD8NUYtB4pQQTdNvhfTYCC5QHOlIlXi
	PfaZYfMmdGaFIJG2zmdVeehykPO+z8Akb8N7UNi3Q1ECITeFI2WcJrmRehcST0nreP80
	v/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xf/uxsQ7kQf1nsMOk8ZTDmw0BHq5MALxeRZKskdLp+s=;
	b=sLYDdP9dgEuxKYDbZzar94KVrdVT62/Q5VnMi2j5c66YyMtuNkP7TdUXtdTgzVkhOd
	yzMRbaULvR8Iy1c6JIsZivSVGiVmUL7rphtRx2jKYmp0Pm5YAhsSEeez8KffwtG/IfgY
	/SfRFWTLb3fWkdkchWWg+BvSiA+LPNs4BAwBPKjd8ANz0o9Kohj6yK0lTJrpJgU6IJ4x
	uxhJhTrXUfcpgYLGabc5Bi+AtNguYdf3VHVsdI0VnRn3C5eaV2GXdObufj7to+0NN3RO
	w9X9U6OirKVGi223xCZY7Eq8nWMz6nfjw2wqjZMzG9XQ4iKDDL4c+UY4CN19Po/Q3nNK
	5Seg==
X-Gm-Message-State: AGRZ1gIRaDj/mBo8IJvRSFVQPGz5xtW0ldnWbBpk+CZOaTTGtR7n/zsj
	MtkyFJujTTN3/j+ykHjsZZ4Vl0qK
X-Google-Smtp-Source: AJdET5cO/Lx4ZR13PtL10D+50/IoKojY0P5SUHk0Chhnt16HAkG8eXj5znsj4+r2+GPbeF+nMkHoBg==
X-Received: by 2002:a6b:1bd5:: with SMTP id
	b204-v6mr3209143iob.105.1539965098384; 
	Fri, 19 Oct 2018 09:04:58 -0700 (PDT)
Received: from localhost.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	4-v6sm7089413ioy.55.2018.10.19.09.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Oct 2018 09:04:57 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 11:04:55 -0500
Message-Id: <20181019160455.4606-1-matt.hoosier@gmail.com>
X-Mailer: git-send-email 2.17.2
Cc: Matt Hoosier <matt.hoosier@garmin.com>
Subject: [PATCH] volatile-binds: use overlayfs if available
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
X-List-Received-Date: Fri, 19 Oct 2018 16:04:57 -0000

From: Matt Hoosier <matt.hoosier@garmin.com>

Copying files from the read-only root filesystem to the tmpfs
providing the volatile directories can be slow and waste memory.
If the kernel supports the overlay filesystem, use it to mount
a writable tmpfs on top of the read-only directory from the
rootfs and avoid copies.

Analogous to the modification made to initscripts's
read-only-rootfs-hook in 370fda1b2e8d5dc011522131bba4106de26bfb19.

Signed-off-by: Matt Hoosier <matt.hoosier@gmail.com>
---
 .../volatile-binds/files/mount-copybind       | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/recipes-core/volatile-binds/files/mount-copybind
index 2aeaf84ddb..fddf520053 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -8,7 +8,10 @@ if [ $# -lt 2 ]; then
     exit 1
 fi
 
+# e.g. /var/volatile/lib
 spec=$1
+
+# e.g. /var/lib
 mountpoint=$2
 
 if [ $# -gt 2 ]; then
@@ -20,15 +23,34 @@ fi
 [ -n "$options" ] && options=",$options"
 
 mkdir -p "${spec%/*}"
+
 if [ -d "$mountpoint" ]; then
-    if [ ! -d "$spec" ]; then
+
+    if [ -d "$spec" ]; then
+        specdir_existed=yes
+    else
+        specdir_existed=no
         mkdir "$spec"
-        cp -pPR "$mountpoint"/. "$spec/"
+    fi
+
+    # Fast version of calculating `dirname ${spec}`/.`basename ${spec}`-work
+    overlay_workdir="${spec%/*}/.${spec##*/}-work"
+    mkdir "${overlay_workdir}"
+
+    # Try to mount using overlay, which is must faster than copying files.
+    # If that fails, fall back to slower copy.
+    if ! mount -t overlay overlay -olowerdir="$mountpoint",upperdir="$spec",workdir="$overlay_workdir" "$mountpoint" > /dev/null 2>&1; then
+
+        if [ "$specdir_existed" != "yes" ]; then
+            cp -pPR "$mountpoint"/. "$spec/"
+        fi
+
+        mount -o "bind$options" "$spec" "$mountpoint"
     fi
 elif [ -f "$mountpoint" ]; then
     if [ ! -f "$spec" ]; then
         cp -pP "$mountpoint" "$spec"
     fi
-fi
 
-mount -o "bind$options" "$spec" "$mountpoint"
+    mount -o "bind$options" "$spec" "$mountpoint"
+fi
-- 
2.17.2


