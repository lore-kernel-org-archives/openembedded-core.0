Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B5CCCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:20:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3313.1760602826132295400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 01:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Z1EHRn0O;
 spf=pass (domain: snapchat.com, ip: 209.85.128.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so8157825e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1760602824; x=1761207624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZVPWoH1z/aFv0JKctrEwRbkYbtW/IVXUmF9LcPwOdg=;
        b=Z1EHRn0OgMftxovSGuvbzfclLx68yGldhd9akTx62rvFtRHaAdBtEz08JO9Sff0iwV
         sCDnj3AkIuU1mT/JBmsf/i8MJW3bahnEZH6lBGwwurc/acXDojIwFoJygFYnnNkpsyfZ
         ir34vDHkWAUbi/XlfKKbT0m/3wGYUJdbUCzhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602824; x=1761207624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZVPWoH1z/aFv0JKctrEwRbkYbtW/IVXUmF9LcPwOdg=;
        b=kjVOXVgyCB8N/3QTMADKVNmkdoH1FUEwMLwdOSubYgFhVoKZDtdgT6unqwFAb2N1hU
         mol7Av6we1wauZwg6ULXAi1WZ6VJCKG7Yx5ocDQ5fV266fvupd+rkKYzU99hkOp4XHvl
         FmuAFTR++2y1t7HzIN9eqJQN9rBJURGXT5oU9xE4dedr7vtkCi/+E11X57M/BnbYUeQD
         dBLr+P8ycuOnof12fXNYA9q2QDXTINKYYg7jygpaqam4Gj6mufZbSOyWlqP4TKJIXXNK
         ctpD6rPD/vQZx51oQxw9EAVkFRSgSplbnE5qTcz3D/+M/rY7GVh0g8MoV3Ky75ZTvEKn
         +zFg==
X-Gm-Message-State: AOJu0YwkqACsl4YiNKwtalYuuRWlVWut/w4O2dOyijktp0zvN/W+/AOW
	5QcyMU9050ooh/KXi+dOwJL+8PjHjJqrIS6JlOvjua+wMjwssmry8Tr+Nvy7PX3ZsNx9aWz0zT0
	2N5m0n38=
X-Gm-Gg: ASbGncs8vkYfW04ThApcI6xI4LXtRFBHtXrLuMPUIsyjKQnOlGq+HlfF6V+KqNPhEHM
	q+SRNpTDNfAVT9z9Jjx8KE3mWxSJ0xW1a2T/u06GavL7slGdADMlzLQzK9Ponr4DWB/vjhEXfDh
	L6Ie/KW9+oktVivgwkCqvQcJvxBxOcG2JmdrhUCkY+BpNsf7tIPgaKVyNIUJvx367TLdspZ80gL
	m4YbpGg8oAiEBve8+t4BxV3ex95rfxdVaIi9Or7Gxuat/Y/BTGNSP/Vu5h62b9YjZRwYOp8BRuX
	3nlB3UfqopwxRlVoWEIbXtWdgkQjxTqGMmeDnrh1wUmcTfGW20Pr8aHhgBDvOd953Z0alDGil5v
	x+BLHL9AycbORzNrpapEcsGCsaH/dQdSP0VVK3Leqp/dcRSTjUCt90xXQIEM2ck0wxxU4nqDZiP
	l4f+MQdnJfnAEluvIoqplb8K9ObFgZZNP9Sp1oZZvP+c8=
X-Google-Smtp-Source: AGHT+IHBX/Enw0hVB3csmgMiqDZb4FUPAkBptmeEUYApKkOargS2/sNbKBm1jkThByWMhoV5e7jeAQ==
X-Received: by 2002:a05:600c:3582:b0:45c:b6d3:a11d with SMTP id 5b1f17b1804b1-4710991ec61mr28963805e9.1.1760602824192;
        Thu, 16 Oct 2025 01:20:24 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm10781205e9.11.2025.10.16.01.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:20:23 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] opkg: upgrade 0.7.0 -> 0.9.0
Date: Thu, 16 Oct 2025 10:20:18 +0200
Message-ID: <20251016082018.2275960-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224956

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-notes
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-notes

[0.9.0] - 2025-06-27

Semiannual opkg release.
Bumping the minor version as a result of the project build tooling changing from autotools to cmake.

- Added a Dockerfile container definition (`:docker/`) for a valid developer build environment for opkg.
  - It's recommended that project contributors use this container to build and test their changes.
- The AutoTools-based build framework has [been replaced](https://git.yoctoproject.org/opkg/commit/?id=3f6040e321634471ec442fb0e80f140f1437e90b) with a more modern, CMake framework.
  - Refer to the `docs/CONTRIBUTING.md` documentation for updated build instructions.

[0.8.0] - 2025-01-10

The minor version bump in this release is due to the changes to cURL error output line format.

- [Changed](https://git.yoctoproject.org/opkg/commit/?id=ab03377868256427279b36c4b2a298edae4260b8) the error output for the curl download backend, to now report the HTTP error code for failed requests.
  - e.g. `error: log_curl_download_error: Failed to download headers of https://foo.bar/all/Packages.gz: The requested URL returned error: 401`
- Enabling debug-verbosity, while using the cURL backend, [will now](https://git.yoctoproject.org/opkg/commit/?id=ce6fede3db931bb0da70d1334cdc4101d0aec702) print cURL's verbose error log to stderr when there is a download failure.
  - The verbose output may contain confidential information about your cURL transactions. So this is your reminder that debug-verbosity should not be enabled in production systems or sensitive security environments.
- The commandline configuration file option (`-f`) [can now](https://git.yoctoproject.org/opkg/commit/?id=36d08b93d2859992b624a4ba2f412cfa5c766050) be specified multiple times, and each configuration file will be loaded and their settings merged.
- [Fixed](https://git.yoctoproject.org/opkg/commit/?id=c87188d7535684fddb8cf80993c147b215602b63) a bug in control field parsing where custom fields whose keys are similar to other fields could be confused by the parser.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../opkg/{opkg_0.7.0.bb => opkg_0.9.0.bb}     | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb => opkg_0.9.0.bb} (78%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
similarity index 78%
rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
index 95480b47164..beec7f3a37d 100644
--- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -18,31 +18,31 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
+SRC_URI[sha256sum] = "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
 # PTEST_PATH ?= "${libdir}/${BPN}/ptest"
 PACKAGES =+ "libopkg"
 
-inherit autotools pkgconfig ptest
+inherit cmake pkgconfig ptest
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
 PACKAGECONFIG ??= "libsolv"
 
-PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
+PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
     gnupg gpgme libgpg-error,\
     ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
     "
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
-PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
-PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
+PACKAGECONFIG[curl] = "-DWITH_CURL=0N,-DWITH_CURL=OFF,curl"
+PACKAGECONFIG[ssl-curl] = "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
+PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
+PACKAGECONFIG[libsolv] = "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
 
-EXTRA_OECONF = "--enable-zstd"
-EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
+EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
+EXTRA_OECMAKE:append:class-native = " -DVARDIR=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} -DSYSCONFDIR=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
@@ -56,6 +56,9 @@ do_install:append () {
 }
 
 do_install_ptest () {
+	# the ptest class expects a Makefile, but cmake uses Ninja per default so we need to install ptests manually:
+	cp -r ${S}/tests ${D}${PTEST_PATH}
+
 	sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
 	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
-- 
2.43.0


