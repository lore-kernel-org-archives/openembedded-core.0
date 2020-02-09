Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id E76B360F59
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:23 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id g6so1806464plt.2
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kOzYjAxtVA3SuSCvAo1N5XcV0sHUHxFvhMiKBKksW0w=;
	b=hOzCvC0olrDxjh9if/WbN6LB5FQPRDDqoDOExclOKHluBT7NHEEu2UVgopDkj4aWkP
	xTHBcqRtBJRqYlQ/dyTC56EgwzNaIoP+ch2GK3n5XxTvh8ganXRAelbjvqvzUB12yM9Y
	seLx2X3hd8SzcpXI9QgVJm0IBws6TMVDk2jX+7TdFIcTDms9ADwKW/9p4JfTnOas5hVK
	DaHVNSXiNoVuktxzmH82AEsuk/FdKNWDKiAMN/y9NWWVTQtpqFE/lgC2Z3NETyygn70F
	PBGyx9m30aqbTQ1kfcu2IzUyFoyfHzWpx9Qq6Ugs2n4gwksRtiz7HWFpcDJd3j8JNTry
	RXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kOzYjAxtVA3SuSCvAo1N5XcV0sHUHxFvhMiKBKksW0w=;
	b=BsxzhMQs161hFzZMulJ8QZr9OQUfBqpJN2c0vVo29o3k6mbfuW8sH5yXY0+zEWOSjX
	V3svd0qAOhG7RjwCROOliPLqXy29I8k61RHhJFwh8MpuA4YFoZ/dCN7fYHeS55WVi+op
	suyxVaX71q4XVHpzAQfYoPlFZ+TYG+VSOM1cp8T6kXUdL3Zous4sG8iTlbwNaZVb8rJ5
	hUmrAvCyF8s1Tv1d3JL0oU+q4KCltm01NMSW1aMpSusNzujVD0elXUmwsz0Q5ZEAPN/C
	Lvh9Qxzia25dqDN3CVH2vYABoQuq230+LAzbfCyfWmNAGJ73YnqHQJ/pITzgM2Mjgi6h
	kFdQ==
X-Gm-Message-State: APjAAAXquCfd+cvdXkelz7Dp22abj2CTh9ScZq2uTGddLyvmxA5CwE4R
	/O32IEy+k1OjlOlalUyUM/MGnCgl
X-Google-Smtp-Source: APXvYqxEH1tDuJTDzFXPGOnaAgBvQElVnnRQSkWuaqPBqYjDVh7ypdvGInKKJA9yYxXHyRMDEwPuLQ==
X-Received: by 2002:a17:902:b949:: with SMTP id
	h9mr8981519pls.57.1581264624864; 
	Sun, 09 Feb 2020 08:10:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.24
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:54 -0800
Message-Id: <2944f0d6e80a4f4c3a4be884cf3e3f6784afd007.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 26/29] sudo: specify where target tools are
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:24 -0000

From: Ross Burton <ross.burton@intel.com>

sudo uses AC_PATH_PROG to find target paths, which means at best
potential host-contamination (and reproducible issues) and at worst it
thinks sh is at /your/build/path/hosttools/sh.

Solve this by explicitly passing the correct paths to configure.

(From OE-Core rev: 61650dd8498a093f3bfa93202c9cd2e9a7fb7834)

(From OE-Core rev: 6e809474ab686fba6924d8b46fd0b9eab5c66c06)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc       | 2 +-
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 15075bcefd..4edfabe510 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -26,7 +26,7 @@ PACKAGECONFIG[pam-wheel] = ",,,pam-plugin-wheel"
 
 CONFFILES_${PN} = "${sysconfdir}/sudoers"
 
-EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
+EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 
 EXTRA_OECONF_append_libc-musl = " --disable-hardening "
 
diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index ee3be95644..6d470d0373 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -15,8 +15,15 @@ SRC_URI[sha256sum] = "7beb68b94471ef56d8a1036dbcdc09a7b58a949a68ffce48b83f837dd3
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
+CACHED_CONFIGUREVARS = " \
+        ac_cv_type_rsize_t=no \
+        ac_cv_path_MVPROG=${base_bindir}/mv \
+        ac_cv_path_BSHELLPROG=${base_bindir}/sh \
+        ac_cv_path_SENDMAILPROG=${sbindir}/sendmail \
+        ac_cv_path_VIPROG=${base_bindir}/vi \
+        "
+
 EXTRA_OECONF += " \
-             ac_cv_type_rsize_t=no \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
              --with-vardir=/var/lib/sudo \
-- 
2.17.1


