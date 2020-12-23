Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.4017.1608766466016737919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 15:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WSCTpajt;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id p187so695072iod.4
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 15:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJVeXJVvdBWyImaV2bXrywLgelntAwWsNCV5t6kOEE8=;
        b=WSCTpajtw/xphpe0bdZxX4RgPYM07htwqJwpW5rxvrYj1CrD9hJaR8S7OqALhIYZe6
         vZ7sToxmoArSlBQ32/MiHJQH660UuOatukZjivamipBUXdA1DS65Ej8pebpl+GHdcNYV
         m6h0NLKNRQzuW88qCRYnLoi7Q9IB5ELNRo8uQA/mVn5rqAEkr4VzrDPLOUmKSn1H5vbl
         q/XVosfrVz/KDz2rBjIcNhTb5O/zFv+V7zZMo9NyC6eA/N+uPH2ooRU3ZlikFUwRu0AG
         kUQp4GcC8K+nG6UgvfJVq9+pTJ/ZBNY2u6tin0ztgWbE8+eZYj0GSMNZ71Tq0avJW+Wb
         L3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJVeXJVvdBWyImaV2bXrywLgelntAwWsNCV5t6kOEE8=;
        b=mnI99/9PJTJo7pyIrToqotVyOJiBZXEqJcHCQm/uH1LUurWWDPkCRWkLYPU5FnU6wR
         DuhLpyjYFoT4mAMAT1MW3oEiHgcwuPFCbabvpy9LceYkVwFSoU8dU541m/tvQj34Gc7T
         YZz+hg4SByLScXohkPPFlA+nJz2LDytPWk9m04KDHFNPjGMdxO1/Sn7IWQcwk6gRWE+V
         JSAaY2nuitCImhUDbthHWZHUdPIz531gJ21qUNpZSvmsjE9Ih4wXtHrUD9snIc3Peu/4
         k+zBH/kcTLbEqN1JTqO56thaMGgAOspARyNGRsnHWorL6y4GsuEJAkvtrm0hgVzk5DIN
         mJnQ==
X-Gm-Message-State: AOAM530N+53vaJavd9m49U26JCmqtTYsdb2myuukKL8mu4d/taOGVDmo
	eiYERhb1iXxQZSu+yS9ioLD2FwO3w/4y1A==
X-Google-Smtp-Source: ABdhPJzxbrtGL8hGEqLcHD0ty43WXRNYjWJ3/2kkkflz+ovJfPwpfZBRGVJKN+lnJTSUuR8S7/Y2Eg==
X-Received: by 2002:a05:6638:ecd:: with SMTP id q13mr25044151jas.62.1608766464972;
        Wed, 23 Dec 2020 15:34:24 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id 1sm19199016ilv.37.2020.12.23.15.34.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 15:34:24 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] psplash: work on first boot (sysvinit)
Date: Wed, 23 Dec 2020 18:34:18 -0500
Message-Id: <20201223233418.21060-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The psplash program has a mechanism for showing progress/updates. This
is done via a pipe. On images that are R/O or images that are assembled
via wic, the pipe is being setup in a location that is R/O on first boot,
therefore the pipe can not be created. If the psplash program is not able
to create the pipe, the app will not run. This situation is "fixed" on
non-R/O images when the first bootup is complete. Therefore the psplash
program is able to run for the first shutdown, and all subsequent bootups
and shutdowns as well, but not on the very first boot.

If the directory in which the psplash pipe is to be created already exists in
the filesystem and that location is not R/O on first boot, then the psplash
program can run on first boot (and subsequent boots and shutdowns).

NOTE: this is only an issue with sysvinit and most non-qemu machines. A
systemd image, and images run on qemu machines, are able to run psplash on
the first and subsequent boots.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 3 +++
 meta/recipes-core/sysvinit/sysvinit/rc   | 1 +
 2 files changed, 4 insertions(+)

changes between v1 and v2:
- move .psplash directory back to /mnt

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 44f0007daf..bb57d25c76 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -102,6 +102,7 @@ do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
 		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+		install -d ${D}/mnt/.psplash
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -122,3 +123,5 @@ SYSTEMD_SERVICE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'pspl
 
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
+
+FILES_${PN} += "/mnt/.psplash"
diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 1c956a3a56..61946e56eb 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -177,5 +177,6 @@ if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; th
     if type psplash-write >/dev/null 2>&1; then
         psplash-write "QUIT" || true
         umount -l $PSPLASH_FIFO_DIR
+        rmdir $PSPLASH_FIFO_DIR
     fi
 fi
-- 
2.30.0.rc0

