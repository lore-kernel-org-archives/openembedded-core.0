Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
 by mx.groups.io with SMTP id smtpd.web12.2520.1625428937865071363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 13:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synopsys.com header.s=mail header.b=mEsxyzoR;
 spf=pass (domain: synopsys.com, ip: 149.117.73.133, mailfrom: alexey.brodkin@synopsys.com)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1479A40F5C;
	Sun,  4 Jul 2021 20:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1625428936; bh=hsLg79LH2Y3VF5RrcEV293NOkkG1c+1iUuIJaHxmy28=;
	h=From:To:Cc:Subject:Date:From;
	b=mEsxyzoRKEAoVCRcmdSwgNO2Ck79RiqbnGnXf1g9bLimQwdZCqgjYP3i8kR6JGRHS
	 FYuR4jvAw/PWhYd3VX7XJQGovp/PGYbYYBx+emyrU+r9o+4lv1vb5Jk7fyauoiYi+C
	 eB0nh+nIHmCuW+FT36blhgAyy81Mv1eHsDgTMNow2LFsSpryki60/zg7B01r/AuO/b
	 N7JtyLONceVkKN8hRLuY6w36s6KB9IOGWhG8GlOlpeCLwPLCrn6i2oiJm3jy14Cy1h
	 02pgrMZKsLZ4Iwjst5VPGopVu37rmWQa1SSVm6MCWxucbrl4fHQg79D+lpMrtjd059
	 6A+uYzp7IMmjQ==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 10028A0079;
	Sun,  4 Jul 2021 20:02:12 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Alexey Brodkin" <abrodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] dhcpcd: add ARC support
Date: Sun,  4 Jul 2021 13:02:02 -0700
Message-Id: <20210704200202.5144-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2

This retrofits ARC support from upstream [1].
Should be a part of the next release of "dhcpcd".

https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Changes in v2:

 * Added "Upstream-Status" tag in the patch
 * Added my SoB in the patch

 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb   |  1 +
 ...rc-privsep-linux.c-add-support-for-arc-28.patch | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
index 56fcf5cc0b..5be480eb03 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
@@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+           file://0002-src-privsep-linux.c-add-support-for-arc-28.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
new file mode 100644
index 0000000000..045f06a9aa
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
@@ -0,0 +1,63 @@
+From 82386110e67cf75c224e9817fce55e6b0f143266 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Feb 2021 07:23:54 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
+
+Fix the following build failure:
+
+privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
+ #  error "Platform does not support seccomp filter yet"
+    ^~~~~
+In file included from privsep-linux.c:36:
+privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
+  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
+                                      ^~~~~~~~~~~~~~~~~~
+
+It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
+since kernel 5.2 and
+https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
+
+Detection of arc compact and arc v2 have been "copy/pasted" from
+https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
+
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266]
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ src/privsep-linux.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 402667af..21d41a9a 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
+ #elif defined(__x86_64__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
++#elif defined(__arc__)
++#  if defined(__A7__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
++#    endif
++#  elif defined(__HS__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
++#    endif
++#  else
++#    error "Platform does not support seccomp filter yet"
++#  endif
+ #elif defined(__arm__)
+ #  ifndef EM_ARM
+ #    define EM_ARM 40
+-- 
+2.16.2
+
-- 
2.16.2

