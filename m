Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 70C7C7BEE1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r10so1065656wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KcT5hiZaJ5mqj6bj8rFqNKTWG33mc5itbB+cUY3dh/c=;
	b=AnNTR0CFFsvx1vj6NOgt4ZwXkPjo0pE8oahJsqqmrm1LTGl+YKTGNQFJiYM8z1jMvb
	QLUTB3f0Vtq+YLJLm2ILK9ZqH7vHIqNwZf/yBEaXCjjPak23AqiqPyw7zuYWeRHJV6dU
	oI7x7hzZSH/zsZtbnH7kaWd81xZV5IdXADHLoBH88BjXHue3HE4VteSdS9Iu29LXwVrx
	dvoxt8vhvc+uHtXaaXo1blVNPMeVCUPIi8q6PT+qJSubVLMt/NuuE3QJ5Zzpnb2592Tn
	JSCvTIYK7sDSu7VOXa1v5Yd6bS8r8uppTxWdr1hlz2Pbfo7refqyktj7u4JwMPYMNujy
	rUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KcT5hiZaJ5mqj6bj8rFqNKTWG33mc5itbB+cUY3dh/c=;
	b=Hv/d9Xxl/etxgQrvWqCpZi7qEjHZg7eUfHETbcg9W4HRS460hZn2RC7xAyrCsP/Z38
	3GcwYOUnVXeZOlWWo4PBNlg17lKfxDYs2wATA+slAzWAxoteFiUeLK00jkNCmMBSMdMz
	G1G/ZM8iODb9jJqnkhj8tLptTPX5CqAZPkCEBmk7SYuREgMtsjj29LxOwhPFlRiUoYXq
	DRSWUYaPBImPxWL0jVALVGYmPlQ2RgCGYF4Qg3BgX5WNDQGOwJBbixXK3JIVHZ3SqgWq
	WO5YrrZ+efSG3ahmkrtbA8QadLEi2ZPcVppQdzZVBN3YC8neoVk9sqbkiAxkidTfVY/2
	/QVA==
X-Gm-Message-State: AJcUukfsMa+EdBEcPcEwQfd2p1cWtuJ4AHQ1wK8V/k8whDQPExsonx5M
	HlyucRR9TCmuAtCOPUaBlOfYIcEVEm4=
X-Google-Smtp-Source: ALg8bN68i5sOc8WPn7ATqNkYXhQ03//wqsxLQ7s2gURX8GoRC7zBn6IuRr5ZCR06RGMkzZuGViVCIQ==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr44768728wro.35.1546879114726; 
	Mon, 07 Jan 2019 08:38:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:18 +0000
Message-Id: <20190107163823.31816-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
Subject: [PATCH 2/7] meson: use a sensible default for libdir when cross-compiling
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
X-List-Received-Date: Mon, 07 Jan 2019 16:38:34 -0000

If --libdir isn't passed to Meson a default is used, but as this default value
changes depending on the host (whether it is Debian-like, or has /usr/lib64)
this isn't appropriate for cross builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |  1 +
 .../meson/meson/cross-libdir.patch                 | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/cross-libdir.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index ef8c5aefa52..d37afc3b0dc 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
+           file://cross-libdir.patch \
            "
 SRC_URI[sha256sum] = "fb0395c4ac208eab381cd1a20571584bdbba176eb562a7efa9cb17cace0e1551"
 SRC_URI[md5sum] = "3c35b91e8040901034809576d54007c6"
diff --git a/meta/recipes-devtools/meson/meson/cross-libdir.patch b/meta/recipes-devtools/meson/meson/cross-libdir.patch
new file mode 100644
index 00000000000..2bd4fb3f9e3
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/cross-libdir.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ce24f0d6a9be22ba61d80cd254e0409de2eaffd7 Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jpakkane@gmail.com>
+Date: Thu, 27 Dec 2018 23:43:35 +0200
+Subject: [PATCH] Default libdir is "lib" when cross compiling. Closes #2535.
+
+---
+ docs/markdown/snippets/crosslib.md |  7 +++++++
+ mesonbuild/coredata.py             |  8 ++++++++
+ run_unittests.py                   | 13 +++++++++++++
+ 3 files changed, 28 insertions(+)
+ create mode 100644 docs/markdown/snippets/crosslib.md
+
+diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
+index d70c23038c..4e2f3e008c 100644
+--- a/mesonbuild/coredata.py
++++ b/mesonbuild/coredata.py
+@@ -299,6 +299,7 @@ def __init__(self, options):
+         # Only to print a warning if it changes between Meson invocations.
+         self.pkgconf_envvar = os.environ.get('PKG_CONFIG_PATH', '')
+         self.config_files = self.__load_config_files(options.native_file)
++        self.libdir_cross_fixup()
+ 
+     @staticmethod
+     def __load_config_files(filenames):
+@@ -348,6 +349,13 @@ def __load_cross_file(filename):
+ 
+         raise MesonException('Cannot find specified cross file: ' + filename)
+ 
++    def libdir_cross_fixup(self):
++        # By default set libdir to "lib" when cross compiling since
++        # getting the "system default" is always wrong on multiarch
++        # platforms as it gets a value like lib/x86_64-linux-gnu.
++        if self.cross_file is not None:
++            self.builtins['libdir'].value = 'lib'
++
+     def sanitize_prefix(self, prefix):
+         if not os.path.isabs(prefix):
+             raise MesonException('prefix value {!r} must be an absolute path'
-- 
2.11.0


