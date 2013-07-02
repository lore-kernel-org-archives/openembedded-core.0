Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id BAFC46103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:15:03 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id s1so3724226qcw.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RFCxqHCFwXowrImBxFixtCWpoYPNgD3XKypenaAPT/M=;
	b=Q/Hzw4OoXIe60TEa4TYe7y3Xw6xF9Md/LdlZpT6TgR0FQqBAmT/fPVy7OO3RhPCkGr
	RAniGaCVgvT0YQEwotw9d+ftp1VlyMCZ8nXkHZAXgM8Qlw79qZp1UZO2kUN8BuO9Pbdc
	9ZGOq9n8QtPwUc1N8n0NjTjemFH6V8gR3oqt4s5P+G3naB81nPmYOD4quyodCfVFIchV
	PGPLmKBKI+/vPJuByH1sqxsbxBH/ICa46jaGVutVhpcod8EJwmdHYagGm2FIVuT0QiAh
	6JJOrzlpom8SCOy141FIV5isLII8msolQ8eaS6Q7N4Xo/aJjObwfvRQ4OqI2FFWxj9py
	2TFA==
X-Received: by 10.49.12.11 with SMTP id u11mr38869335qeb.21.1372774504302;
	Tue, 02 Jul 2013 07:15:04 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id 15sm37190458qaa.9.2013.07.02.07.15.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 07:15:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Jul 2013 11:14:40 -0300
Message-Id: <1372774482-16476-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
References: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] lttng-modules: Update to 2.2.0 based release
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
X-List-Received-Date: Tue, 02 Jul 2013 14:15:04 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch | 66 +++++++++++++++++-----
 ...tng-modules_2.1.1.bb => lttng-modules_2.2.0.bb} |  5 +-
 2 files changed, 55 insertions(+), 16 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.1.1.bb => lttng-modules_2.2.0.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
index aa24171..30f825c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
@@ -7,35 +7,75 @@ build and install lttng-modules, we do this replacement for
 it as-is.
 
 Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
----
- Makefile |    7 +++----
- 1 files changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 5ac13d7..25caad5 100644
+index a9d1cb1..c1b65b9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -38,17 +38,16 @@ obj-m += lib/
+@@ -43,19 +43,19 @@ obj-m += lib/
+ endif # CONFIG_TRACEPOINTS
+ 
+ else # KERNELRELEASE
+-	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
++	KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
+ 	PWD := $(shell pwd)
+ 	CFLAGS = $(EXTCFLAGS)
+ 
+ default:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
+ 
+ modules_install:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
+ 
+ clean:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
+ 
+ %.i: %.c
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) $@
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) $@
+ endif # KERNELRELEASE
+diff --git a/README b/README
+index 8c5dd46..6bd3334 100644
+--- a/README
++++ b/README
+@@ -27,8 +27,8 @@ access to your full kernel source tree), and use:
+ If you need to specify the target directory to the kernel you want to build
+ against, use:
+ 
+-% KERNELDIR=path_to_kernel_dir make
+-# KERNELDIR=path_to_kernel_dir make modules_install
++% KERNEL_SRC=path_to_kernel_dir make
++# KERNEL_SRC=path_to_kernel_dir make modules_install
+ # depmod -a kernel_version
+ 
+ Use lttng-tools to control the tracer. LTTng tools should automatically load
+diff --git a/probes/Makefile b/probes/Makefile
+index 225803c..3449866 100644
+--- a/probes/Makefile
++++ b/probes/Makefile
+@@ -212,18 +212,18 @@ endif
  endif
-
+ 
  else
 -	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
++	KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
  	PWD := $(shell pwd)
  	CFLAGS = $(EXTCFLAGS)
-
+ 
  default:
 -	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 +	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
-
+ 
  modules_install:
 -	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
 +	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
-
+ 	/sbin/depmod -a
+ 
  clean:
 -	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
 +	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
-
+ 
  endif
--- 
-1.7.5.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
index 700c4c5..7926d12 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
@@ -10,9 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "b374c356eb4827b68754d68adc0f1c94b5de9faa"
-PV = "2.1.1"
-PR = "r0"
+SRCREV = "1b26381c19dd2d9fa41f52d8dc13b15b8dd32c7c"
+PV = "2.2.0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.8.3.1


