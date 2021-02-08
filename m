Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.467.1612808272528798475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: technoboy85@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id b3so18361399wrj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 10:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovxDvkJ01YZnBjCrSXXJ0tZoJvNliWG8b6tKutrixPY=;
        b=lZ8fLRZvJ+5FCKGnFE704J7+AF5GLqIPwYiYlxrLOM66YLbD5HCASLaOjcchyFRPse
         6m36u52NHk/OcJL78DkXBSg264H/DR0ajNwHMaRldnUSdo5gp1TzhswfdR3VIhVLtQNz
         ASMqDMhcRY6nTXoSB4gK4iZU087DF1/YIprVXBqmpw4eVBMTsMNgSkXAh0nEdnVvu9GZ
         ez0ZZlr6C/ivl3lTsOKpBfTmu0L9ZqjE8vTL+HscG2Va+bbTMEHKMdyaMCVceNm01IKV
         o23pkjY4B/vDTJ9xjgTdRM4DU6pmuLRc84sQAiWW5aB8UlwwwjDTuTqLLMMguteNFEsc
         7Yng==
X-Gm-Message-State: AOAM530klvg7HDTJnJ5l3b4sXJBlLWlwg+2F7iPZES3WZTC2N46IGFKU
	iUjRlpIlJcvxaYKWy1TG1p0WOt8qPPQ=
X-Google-Smtp-Source: ABdhPJx3fRB8aa7eXvVEkCyJxW2ZqSWtfPtOFMtKalEmZmqnMl8sRldIc2jd+l/ATiKgrBphJrUbwA==
X-Received: by 2002:adf:e511:: with SMTP id j17mr2745034wrm.251.1612808270801;
        Mon, 08 Feb 2021 10:17:50 -0800 (PST)
Return-Path: <technoboy85@gmail.com>
Received: from msft-t490s.teknoraver.net (net-2-36-203-239.cust.vodafonedsl.it. [2.36.203.239])
        by smtp.gmail.com with ESMTPSA id y5sm23950wmi.10.2021.02.08.10.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:17:50 -0800 (PST)
From: "Matteo Croce" <mcroce@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes-kernel: add libbpf
Date: Mon,  8 Feb 2021 19:17:47 +0100
Message-Id: <20210208181747.44789-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matteo Croce <mcroce@microsoft.com>

Add a recipe to build libbpf from https://github.com/libbpf/libbpf
The only patch fixes a build issue, and it's already merged upstream.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 ...01-install-don-t-preserve-file-owner.patch | 29 +++++++++++++++++++
 meta/recipes-kernel/libbpf/libbpf_0.3.bb      | 25 ++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
 create mode 100644 meta/recipes-kernel/libbpf/libbpf_0.3.bb

diff --git a/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
new file mode 100644
index 0000000000..4e65d8d80a
--- /dev/null
+++ b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
@@ -0,0 +1,29 @@
+From 7df10d91db6f533cc0f6c09f4ae8ad92918c6160 Mon Sep 17 00:00:00 2001
+From: Matteo Croce <mcroce@microsoft.com>
+Date: Tue, 26 Jan 2021 12:41:47 +0100
+Subject: [PATCH] install: don't preserve file owner
+
+'cp -p' preserve file ownership, this may leave files owned by the
+current in user in /lib .
+
+Signed-off-by: Matteo Croce <mcroce@microsoft.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index da33613..ab66edc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -130,7 +130,7 @@ define do_s_install
+ 	$(Q)if [ ! -d '$(DESTDIR)$2' ]; then		\
+ 		$(INSTALL) -d -m 755 '$(DESTDIR)$2';	\
+ 	fi;
+-	$(Q)cp -fpR $1 '$(DESTDIR)$2'
++	$(Q)cp -fR $1 '$(DESTDIR)$2'
+ endef
+ 
+ install: all install_headers install_pkgconfig
+-- 
+2.29.2
+
diff --git a/meta/recipes-kernel/libbpf/libbpf_0.3.bb b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
new file mode 100644
index 0000000000..402e57257f
--- /dev/null
+++ b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Library for BPF handling"
+DESCRIPTION = "Library for BPF handling"
+HOMEPAGE = "https://github.com/libbpf/libbpf"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+
+LIC_FILES_CHKSUM = "file://../LICENSE.LPGL-2.1;md5=b370887980db5dd40659b50909238dbd"
+
+DEPENDS = "zlib elfutils"
+
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https"
+SRCREV = "051a4009f94d5633a8f734ca4235f0a78ee90469"
+
+# Backported from version 0.4
+SRC_URI += "file://0001-install-don-t-preserve-file-owner.patch"
+
+S = "${WORKDIR}/git/src"
+
+inherit pkgconfig
+
+do_install() {
+	make install DESTDIR=${D} LIBDIR=${libdir}
+}
+
+BBCLASSEXTEND = "native"
-- 
2.29.2

