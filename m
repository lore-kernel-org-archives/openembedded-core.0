Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DED5D7E25D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 16:12:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x64so3578055wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/bUspo3h6RLE1PoWk8Mjucv2zX3RPi1NfQVVSw9WYKk=;
	b=WCUkqWtHFforp1MYpRUL3wdGakpSDBy46fhQvl6N+vJLnVKenaLQdhzEzQsGRFeqTz
	0rJBq4DODt5wJtkg3W0Arcr+XfD3MYnUPkhRXe2s1YKI/cX2/+YzFEk/oX+5ekqr1GbS
	kMzuswIvpL5uGBC9TZ/YskBjjVFUESC1wO1bQQRKiEt7VRhaYtNAaCh+9aBoa4uP1Lg5
	3jQjTolXrO2SIa91K2UqgzHJJPi0EQR2m7/Uuk21YRor9n+5Av5RKzfDtgRuarfsJkvw
	xonIJxRtgF6arlnqFg4XA+sKu3vJVbMGktlC2q0bq6qPSDoh1TDbqVd50Yl+V3lR/qJP
	i71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/bUspo3h6RLE1PoWk8Mjucv2zX3RPi1NfQVVSw9WYKk=;
	b=LmnfEnSHhms2Ri+qyGKerFmgKgPU6uMhyIf4yZrVThDSU9JBNbZr6TWuUnhI3/nVcW
	J9fyBEVQGFm7IVUWClJxRsF0IGTLoturtNbL5BrahfjkIz4tJlBBE9OZBY4A6ysZSP4s
	8b/db0DwPx8to92xmeHo8YpHWlekAxG4D1WldOvVF3Q8YlR1VtyME4m1OEHpTEBec1KM
	CNgHLnH/Z/akjl+OH5tZV5eUbjmh9Q+0OcVrp0W9t04CfEVlvaWkf1LQ9Rw1eK8xxDeX
	L5j002UPf0XQEPp5DepTCnEe/cDXd+3vhVgVCaFPvVSEGcMdKKeTtVnyi87iFGeVJQyn
	y4WA==
X-Gm-Message-State: APjAAAXRkWpf8VAaA/ehscTp/+kLTe3CQ+l1nIQFMnzug/F30VxfD7gZ
	/Hz21tj+uZnmuVG6NRZSyVd+csKG
X-Google-Smtp-Source: APXvYqxKwAB2HHlGf10UZnzWs7l/GiSN0YIbHq2B3KhS+FU4lgLfnOApJM8FfBMvUH0awWiAJCJXLw==
X-Received: by 2002:a1c:b743:: with SMTP id h64mr4279642wmf.16.1558455125285; 
	Tue, 21 May 2019 09:12:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j82sm3917055wmj.40.2019.05.21.09.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 09:12:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 18:11:58 +0200
Message-Id: <20190521161158.45329-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libmodulemd: fix erroneous linking against v2 library when v1 was requested
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
X-List-Received-Date: Tue, 21 May 2019 16:12:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...xplicitly-specify-the-v1-library-in-.patch | 28 +++++++++++++++++++
 .../libmodulemd/libmodulemd_git.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
new file mode 100644
index 00000000000..1568d25f9d8
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
@@ -0,0 +1,28 @@
+From b651551134cf170038b3e01812e3767969506491 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 21 May 2019 17:59:26 +0200
+Subject: [PATCH] v1/meson.build: explicitly specify the v1 library in
+ pkgconfig
+
+Otherwise there would be '-lmodulemd' which resolves
+to v2 version if both v2 and v1 are present in the sysroot.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ modulemd/v1/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
+index 4d54e69..9144ca2 100644
+--- a/modulemd/v1/meson.build
++++ b/modulemd/v1/meson.build
+@@ -325,7 +325,7 @@ configure_file(
+ )
+ 
+ pkg.generate(
+-    libraries : modulemd_v1_lib,
++    libraries : '-l:libmodulemd.so.1',
+     subdirs : v1_header_path,
+     version : libmodulemd_v1_version,
+     name : 'modulemd',
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index d7f486868b8..d4ffd281b5f 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
            file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
+           file://0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch \
            "
 
 PV = "2.4.0"
-- 
2.17.1


