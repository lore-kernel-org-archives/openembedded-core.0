Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 59E667E528
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 11:57:24 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l2so6336366wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lTS9hX3s7DosVa5lqG7CmXZet6lOi/M2AJ+YcKxHYIk=;
	b=EHI+ozjSn3hPoJ7QxAmgV6jPbV5KZ2+fawrPzRnzZFLvX3AhCwkqy9+Kut/r02QTUA
	BNizXSx7M12Ec5+nyIPiiMYajaEYQ9okieRQGn3csIdEE3U3fWAYlJNXOiW1vpzu+QYM
	Z1nFXQIi9khPoBEKpeo+zACAOS1/jSiq0Pmwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lTS9hX3s7DosVa5lqG7CmXZet6lOi/M2AJ+YcKxHYIk=;
	b=i3GX922GrMWVplkh7pE47xMRJAYDQnmxocydTjikPkBVXRM8OPFFaM9PJRuNJILX7W
	JNDT77vTowPU7SE2WL3zeTFE1OmEaZ7db7Lk2mJLOaSsgWY6bslCfPtLUGfylC+HWG9c
	RKmM7DWn/57OS7mUShvtR8adGrivO2XWOh4LC30IKaSL7JwhB4nVrsEveHSVF/DTacb1
	ElxpURSf6aqrniX0BtSLtdx2w2yE7J+LXRvJCStkbni0hsxwBN2CW/aDUj36xyCA7uxv
	O1ywOEJUMSxUuiYwrRdigWaZfZJ14inMzMmN4OFvwEx/gd0w7roboVraUiKRUcu4/D1/
	Co0w==
X-Gm-Message-State: APjAAAU33fr2QK5JUWFNlBruzEUIrNMgL6PM2cvV6Pc+y8F3kwc9wKke
	WupSMjDkAdy0gOvcvkw7MupSuUnJpkA=
X-Google-Smtp-Source: APXvYqw4fENRhlPZWhuGgvQCQhvtgzIKpzV2EegWR53B2f6aUsGDTkdWxfEsBEQZXMwuvtdFO3VM2A==
X-Received: by 2002:adf:ec0b:: with SMTP id x11mr6492516wrn.88.1559303844714; 
	Fri, 31 May 2019 04:57:24 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f3sm6236991wre.93.2019.05.31.04.57.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 04:57:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 12:57:22 +0100
Message-Id: <20190531115722.19861-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] useradd: Fix build architecture corruption of sstate artefacts
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
X-List-Received-Date: Fri, 31 May 2019 11:57:24 -0000
Content-Transfer-Encoding: 8bit

When mixing aarch64 and x86_64 host builds with common sstate, useradd failures
were found. This was due to references to:

/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/sysroots-components/aarch64/pseudo-native/usr/bin/pseudo
or
/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo

on the wrong architecture within the useradd postinst files.

Instead of using COMPONENTS_DIR as the FIXME, use PSEUDO_SYSROOT which contains
the arch component as well to avoid this.

Add extra comments to cause the relavent sstate to be rebuilt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 meta/classes/useradd.bbclass | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 6bcd0b087a0..92070602228 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -168,7 +168,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
+    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.debug(2, cmd)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 124becd0824..5e600dec849 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -100,6 +100,8 @@ useradd_sysroot () {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_setscene) be running 
 	# at this point so we're explicit about the environment so pseudo can load if 
 	# not already present.
+	# PSEUDO_SYSROOT can contain references to the build architecture and COMPONENT_DIR
+	# so needs the STAGING_FIXME below
 	export PSEUDO="${FAKEROOTENV} ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
@@ -134,10 +136,10 @@ useradd_sysroot () {
 }
 
 # The export of PSEUDO in useradd_sysroot() above contains references to
-# ${COMPONENTS_DIR} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
+# ${PSEUDO_SYSROOT} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
 # shell functions use ${LOGFIFO}. These need to be handled when restoring
 # postinst-useradd-${PN} from the sstate cache.
-EXTRA_STAGING_FIXMES += "COMPONENTS_DIR PSEUDO_LOCALSTATEDIR LOGFIFO"
+EXTRA_STAGING_FIXMES += "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
 
 python useradd_sysroot_sstate () {
     scriptfile = None
-- 
2.20.1


