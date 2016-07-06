Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CD0F66013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 09:57:01 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r190so31409052wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2vUMPIYCGrgL3XYJFK/NiNJrISeNlYcZsPSTE2NxrP8=;
	b=leSA1k5YLtSm+HFOfwn7HlFTfeWoKPYuRhEsO20TaSPdC33STdrE31k7bU0sjZyPTr
	pC0OMApbKALLqgjLu2AS7KSw3lJt5T2E1X8+gqdT4vs4+l1b1euIv1QeqUa7dhwZTp8q
	p2nd6SwBU0fUBjp7x51AA1aXSa7vwVUh2Z6BGfeJbs2VYGI9W3zCOoU/gaRtO8OPPiUv
	njWdO0yPGP66NFBIbK0ESXdaz8LAJvyAzgSE6iGbAaJaUNAvPJ8MfumL9hSBYHvfLbKI
	+J4g/x2nLBAXpzuoeRrxdE8u6hDC24SXxr6rHqNOSVlFj129yh6zWQmSzyVquvJxy1Z6
	L8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2vUMPIYCGrgL3XYJFK/NiNJrISeNlYcZsPSTE2NxrP8=;
	b=WQ1IPT9hrbFHMVYEocZCOjhrmzUnR6C7H3pbiY0zG64J6jf4tQV+eZm56gyaLZyt19
	wHctkxHY+1uoYvhUB2h4bEF/hXlAvb8eJUouURqaVLmkzD4L4x3i+uH5jdACqFmuifKK
	/AN1FRBBRiBRBnHURo6kdIr97FiBk8H8X40aqDEh7buFDXnH6vtzIAuam0Tc5Iffy/YJ
	Ja77pZhk4VX5hSlW14ckyVX59nlhC2NXDWoH9aN0hSKywI10R+l03DAA2nCAJX2DQHze
	KQhRKvG2hhVCuhbLS3fj6U4OtDg4DOXkQQgdol3aG6+Z7fJfCZqhMa5fZmexFeDAIgGV
	8Q1Q==
X-Gm-Message-State: ALyK8tKLVwfvgHThbgfxA+MUXhkFS4WirNY46OyoTngwMslraO7jVgu/wSJoR4a8wEXrVNbm
X-Received: by 10.194.113.136 with SMTP id iy8mr19612500wjb.174.1467799021501; 
	Wed, 06 Jul 2016 02:57:01 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	bh7sm1688488wjb.22.2016.07.06.02.57.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 02:57:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2016 10:56:53 +0100
Message-Id: <1467799014-3012-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] libc-package: remove obsolete do_configure_prepend
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
X-List-Received-Date: Wed, 06 Jul 2016 09:57:02 -0000

This fragment comes dates from when this class was used for more than just glibc
locale packaging, and as glibc-locale disables do_configure it can't have been
executed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/libc-package.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 6624746..a8d86cf 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -47,14 +47,6 @@ python __anonymous () {
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
-do_configure_prepend() {
-        if [ -e ${S}/elf/ldd.bash.in ]; then
-                sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
-        fi
-}
-
-
-
 # indentation removed on purpose
 locale_base_postinst() {
 #!/bin/sh
-- 
2.8.1


