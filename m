Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id B434E7E3FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 22:09:58 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 15so4688767wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nRMNaC1iMhIauNf+e2np0iyUlaZzNtNKsJAT3QNY36g=;
	b=J/nbm/ub4MSKAg37yy5vrmSz4jilOkr3bbdKrMklxreYYspSrV1YkgUPBAzPs9j3cl
	AjtwPYXp15L3yCt//kyg03aqfdKsxyjNXrBHsZ3RzI8WkMjtM1KykwA9KEV5TSN/+J2s
	z7ZWYZYOdYdUeGOJcnKPXzClZiAtwDtBn5yqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nRMNaC1iMhIauNf+e2np0iyUlaZzNtNKsJAT3QNY36g=;
	b=NeCdgAErE7U3LGXcJPge83jGHaI1p3T0nrLS0aqPQWB43ygEh93H3+mEsJIzw0F755
	effd8jc9LnOpVGhHcE2SJ0gQGfff650qYkZjhHxYEC83RgReDTdesAnCivqMimSs2ZBo
	wH/qvBTMpZk+UAf+5xwUgmk/qZs7UDXvbbKymsbzKvXptYyNM0Djj7nkOvHz7DGpylcl
	bEyE9zT8m0dfiSebpL0K3DQdPAw1nLkLSMvQU5Zn2D63goNBIMEIGHSECMMeMZr+bRwi
	XgAK2v+17qqkHQDcqG7awfXYbl1j4WgdFByksit0qhmQbj2V/9s8FWoK0JMyZk44expY
	8e8w==
X-Gm-Message-State: APjAAAVICj4MyYjye2cPlp/Gpz+ginrYJgyf1Bm9rxsAGk39QLjGycCu
	Kp6S+1EuN8f1dD8Egj3fIWd9zDt3V+g=
X-Google-Smtp-Source: APXvYqzXeWbPwNeBV6MVRmdhXvDVH32LFowosjwnSCgotcxMckdOCztpckNcDxQw3JimA9pVoqGSXg==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr3496345wmc.39.1559254199243; 
	Thu, 30 May 2019 15:09:59 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h21sm3663855wmb.47.2019.05.30.15.09.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 15:09:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 23:09:56 +0100
Message-Id: <20190530220956.27209-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530220956.27209-1-richard.purdie@linuxfoundation.org>
References: <20190530220956.27209-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] runqemu: Add support for kvm on aarch64
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
X-List-Received-Date: Thu, 30 May 2019 22:09:59 -0000
Content-Transfer-Encoding: 8bit

The main issue is to make the x86 checks apply to x86 targets only. We may
end up with better checks on other architectures but this adapts the code to
allow for that and its still controlled by whether QB_CPU_KVM is set.

The code needed minor refactoring so the qemu-system-XXX name is set
earlier so the kvm code can use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 39bed038d5a..5752ecda731 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -491,12 +491,13 @@ class BaseConfig(object):
         yocto_paravirt_kvm_wiki = "https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
         dev_kvm = '/dev/kvm'
         dev_vhost = '/dev/vhost-net'
-        with open('/proc/cpuinfo', 'r') as f:
-            kvm_cap = re.search('vmx|svm', "".join(f.readlines()))
-        if not kvm_cap:
-            logger.error("You are trying to enable KVM on a cpu without VT support.")
-            logger.error("Remove kvm from the command-line, or refer:")
-            raise RunQemuError(yocto_kvm_wiki)
+        if self.qemu_system.endswith(('i386', 'x86_64')):
+            with open('/proc/cpuinfo', 'r') as f:
+                kvm_cap = re.search('vmx|svm', "".join(f.readlines()))
+            if not kvm_cap:
+                logger.error("You are trying to enable KVM on a cpu without VT support.")
+                logger.error("Remove kvm from the command-line, or refer:")
+                raise RunQemuError(yocto_kvm_wiki)
 
         if not os.path.exists(dev_kvm):
             logger.error("Missing KVM device. Have you inserted kvm modules?")
@@ -703,6 +704,7 @@ class BaseConfig(object):
         else:
             os.putenv('QEMU_AUDIO_DRV', 'none')
 
+        self.check_qemu_system()
         self.check_kvm()
         self.check_fstype()
         self.check_rootfs()
@@ -1128,21 +1130,23 @@ class BaseConfig(object):
 
         return 'qemu-system-%s' % qbsys
 
-    def setup_final(self):
+    def check_qemu_system(self):
         qemu_system = self.get('QB_SYSTEM_NAME')
         if not qemu_system:
             qemu_system = self.guess_qb_system()
         if not qemu_system:
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
+        self.qemu_system = qemu_system
 
-        qemu_bin = os.path.join(self.bindir_native, qemu_system)
+    def setup_final(self):
+        qemu_bin = os.path.join(self.bindir_native, self.qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
         # find QEMU in sysroot, it needs to use host's qemu.
         if not os.path.exists(qemu_bin):
             logger.info("QEMU binary not found in %s, trying host's QEMU" % qemu_bin)
             for path in (os.environ['PATH'] or '').split(':'):
-                qemu_bin_tmp = os.path.join(path, qemu_system)
+                qemu_bin_tmp = os.path.join(path, self.qemu_system)
                 logger.info("Trying: %s" % qemu_bin_tmp)
                 if os.path.exists(qemu_bin_tmp):
                     qemu_bin = qemu_bin_tmp
-- 
2.20.1


