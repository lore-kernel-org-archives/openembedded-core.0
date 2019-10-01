Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id BCB9F7F282
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 00:56:05 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 205so6666842pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2d2lqUQpU4bmAZzcghyeB7ceFG8V5h2IBAlSJo6RlwQ=;
	b=MoHtMCogVy3aOjMx7tmpWV/7j3kDP80+38mBO6xYssCtzYZEP3on9R5hzzywzNzwV0
	jnl5DjkEmMuO3G0W7BrM9YNKuUoMl4eV2k3tlNQRpkOKYST76YKXV41Q0v8DJF6rZDo7
	wy2RbfWC3fvSfuVHsg7OIo3fF69mbwF7eUAwpl2hO8uUG1RcPXxEbtMVzrmwhropnPH/
	XG7iSQL78PH0dfQneSE+0j+M9cT14r4WSM4/f1X+jtYJOGFEd5vPKFkGQx4Zlx0OpRUN
	/WHy1CUEHbyaHPdecEkYutpvGIIt1wmzQm8vY7rGZCnxU3J62HhAuKWownJgliIV0AjH
	sNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2d2lqUQpU4bmAZzcghyeB7ceFG8V5h2IBAlSJo6RlwQ=;
	b=dIYYNwH3wFN9mr52fVQ3xGmdMAzys+WeipSqjGOgS4zNZeWDcD5kS9tArP35Fyu3ZI
	0Jei8atPt+mZpHG1EjgCfhEUvRxtZlyc9hcEtc7ZJayl4GdPnExSPvKzEOCToaBRrJRF
	QIM+5IUuW2Cmb1y0YWqj8m+Lmg++tkqa0knOOtHMcdmGuB92RRxwcPTT6mwiM1IIbKvn
	NdwsBJUXAyBODLo2jkDgu6Lwjq5oWMK2lqpPxpSXMbTnXIg8wbCN6zurTPmEbuO0r6+b
	qnLQzZ5IX9hOQ+ZxL05xzuousspHpUqf8gCvVvC/FX2qlsKE6i6XV7XP9dugpFh4czdC
	zTsg==
X-Gm-Message-State: APjAAAWJsl3urdO0wDgP4ShnqaU8nvK9HeAOjsZu8xMPLIza3TRhL60A
	irdjxGv42JmvD/GtU+qxpIzRMAADUxM=
X-Google-Smtp-Source: APXvYqzp9FJS1h5JF761LewnkFZYbMfk7rLiVmxDr7ILc2YAthtZl2rY82ls74FjbzvLncXrqiRcTA==
X-Received: by 2002:a17:90a:f98f:: with SMTP id
	cq15mr2323712pjb.54.1569891366750; 
	Mon, 30 Sep 2019 17:56:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a9c1:2a99:4c55:de93])
	by smtp.gmail.com with ESMTPSA id a7sm702881pjv.0.2019.09.30.17.56.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Sep 2019 17:56:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2019 17:56:00 -0700
Message-Id: <68e147ae974089fb1e4cf8c1e65baee5bad7769a.1569891224.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569891224.git.akuster808@gmail.com>
References: <cover.1569891224.git.akuster808@gmail.com>
Subject: [warrior-next 2/2] runqemu: Add support for kvm on aarch64
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
X-List-Received-Date: Tue, 01 Oct 2019 00:56:05 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The main issue is to make the x86 checks apply to x86 targets only. We may
end up with better checks on other architectures but this adapts the code to
allow for that and its still controlled by whether QB_CPU_KVM is set.

The code needed minor refactoring so the qemu-system-XXX name is set
earlier so the kvm code can use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/runqemu | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 19fd521..af90c01 100755
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
@@ -709,6 +710,7 @@ class BaseConfig(object):
         else:
             os.putenv('QEMU_AUDIO_DRV', 'none')
 
+        self.check_qemu_system()
         self.check_kvm()
         self.check_fstype()
         self.check_rootfs()
@@ -1134,21 +1136,23 @@ class BaseConfig(object):
 
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
2.7.4


