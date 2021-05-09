Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.24212.1620597153066675573
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 14:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PYVtAOUx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id y124-20020a1c32820000b029010c93864955so10040016wmy.5
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKMdGvUw+7+BpQAqG3cNEIAQWXO9ESZerEfLw7wu23k=;
        b=PYVtAOUxcu0XUhgCCKpfqxR0MzuOrZpi7LFt/o8oLeIuZXgpznlvkdesG1iXqD+kdv
         DhKSQm9c4blyGgINq6ArHiGaNJoVrGF2kMaEaZBY+wR5RS3LpxcE44ZGzIvnbUnsSOAT
         SLcsqQC46wCj7jXl2KHvRRCTr8tbtuH9M/PJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKMdGvUw+7+BpQAqG3cNEIAQWXO9ESZerEfLw7wu23k=;
        b=YES53wDsci4HVbEccCXfnT54cVc8383Q4tZC7HJB4+wJrom16B3wI3B2dFkoepvy7P
         rMq0kR0k38SmnsuZDy0HKVQr07nQ33Ck0KHyA4r5y7fv4feFsg4XBF2VqrV4HenbZXDa
         sBOxzw9gEubDTNQMxjZNaKtAJvnJrmIUL4/jSmDrhyHyh8diCZKfbMk6Io9Ugjq2YOwe
         auLPKuq/vXmxFeKeVzMp/2469RPGZfJGDG5rWIdZY42kEhI2spMiw8WRlF4Wo5dBdEiZ
         4hU7mJ+xN0k0cEc89XuGFhiA7jKiEJCpqjVgkXdH52DdfWAQwKfdd1ykptp6pRXO3s9f
         kQ1w==
X-Gm-Message-State: AOAM533YMiU/7qU65XuVz+Hhw8Vlpi3BCsJscQMLyR95y+l6SZ1CYIKT
	BTD5JGAneZqbuHdvwvdVzPxNsQgd9TGawg==
X-Google-Smtp-Source: ABdhPJyTx44BmAkEqWK+ZInF11K8xQQir/6XaAWBGtq/HbhlkF4bel1C+TqDuIudavL750cFklTnVQ==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr33429241wma.127.1620597151623;
        Sun, 09 May 2021 14:52:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id e10sm20407546wrw.20.2021.05.09.14.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:52:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] qemu: use 4 cores in qemu guests
Date: Sun,  9 May 2021 22:52:28 +0100
Message-Id: <20210509215229.2137549-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Each of the cores is mapped to a thread on the host, this
should speed up things inside qemu which can take advantage of that.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/qemuboot.bbclass | 4 ++++
 scripts/runqemu               | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 1f8012edc1d..0fdd10099ce 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -19,6 +19,9 @@
 # QB_CPU_KVM: the similar to QB_CPU, but used when kvm, e.g., '-cpu kvm64',
 #             set it when support kvm.
 #
+# QB_SMP: amount of CPU cores inside qemu guest, each mapped to a thread on the host,
+#             e.g. "-smp 8".
+#
 # QB_KERNEL_CMDLINE_APPEND: options to append to kernel's -append
 #                           option, e.g., "console=ttyS0 console=tty"
 #
@@ -80,6 +83,7 @@
 # See "runqemu help" for more info
 
 QB_MEM ?= "-m 256"
+QB_SMP ?= "-smp 4"
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
diff --git a/scripts/runqemu b/scripts/runqemu
index edd17d09c4a..e2dc529baaf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -540,13 +540,13 @@ class BaseConfig(object):
     def check_kvm(self):
         """Check kvm and kvm-host"""
         if not (self.kvm_enabled or self.vhost_enabled):
-            self.qemu_opt_script += ' %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU'))
+            self.qemu_opt_script += ' %s %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU'), self.get('QB_SMP'))
             return
 
         if not self.get('QB_CPU_KVM'):
             raise RunQemuError("QB_CPU_KVM is NULL, this board doesn't support kvm")
 
-        self.qemu_opt_script += ' %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU_KVM'))
+        self.qemu_opt_script += ' %s %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU_KVM'), self.get('QB_SMP'))
         yocto_kvm_wiki = "https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
         yocto_paravirt_kvm_wiki = "https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
         dev_kvm = '/dev/kvm'
-- 
2.30.2

