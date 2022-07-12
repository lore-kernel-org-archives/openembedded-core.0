Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1154C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:37:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9775.1657636657813991895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E04101596;
	Tue, 12 Jul 2022 07:37:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0929F3F73D;
	Tue, 12 Jul 2022 07:37:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] ltp: fix builds when host ld doesn't know about target ELF
 formats
Date: Tue, 12 Jul 2022 15:37:34 +0100
Message-Id: <20220712143734.204094-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 14:37:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167929

The kvm tests use the host ld, which doesn't necessarily know about the
target ELF format.  It should be using the cross ld we built, so call
$(LD) instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-kvm-use-LD-instead-of-hardcoding-ld.patch | 37 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220527.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead=
-of-hardcoding-ld.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-har=
dcoding-ld.patch b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-=
of-hardcoding-ld.patch
new file mode 100644
index 00000000000..23634d0c860
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding=
-ld.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pu=
ll/948]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 7670233e43df2aed6d44b96c51b034f8e2d28a19 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 12 Jul 2022 15:03:54 +0100
+Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld
+
+In cross-compiled builds the host ld may not know the required ELF forma=
t,
+so ensure we use $(LD) which will be the cross-capable ld binary.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ testcases/kernel/kvm/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefi=
le
+index 69a9946fe..4ddef9f95 100644
+--- a/testcases/kernel/kvm/Makefile
++++ b/testcases/kernel/kvm/Makefile
+@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target=
.mk
+ ifdef VERBOSE
+ 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload=
.elf $^ $(GUEST_LDLIBS)
+ 	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit=
_array -j .init_array --gap-fill=3D0 $*-payload.elf $*-payload.bin
+-	ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=3D$(BIN_FORMAT) -o=
 $@ $*-payload.bin
++	$(LD) -r -T $(abs_srcdir)/linker/payload.lds --oformat=3D$(BIN_FORMAT)=
 -o $@ $*-payload.bin
+ else
+ 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payloa=
d.elf $^ $(GUEST_LDLIBS)
+ 	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preini=
t_array -j .init_array --gap-fill=3D0 $*-payload.elf $*-payload.bin
+-	@ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=3D$(BIN_FORMAT) -=
o $@ $*-payload.bin
++	@$(LD) -r -T $(abs_srcdir)/linker/payload.lds --oformat=3D$(BIN_FORMAT=
) -o $@ $*-payload.bin
+ 	@echo KVM_CC $(target_rel_dir)$@
+ endif
+ 	@rm $*-payload.elf $*-payload.bin
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-ext=
ended/ltp/ltp_20220527.bb
index 56fa83f5a03..094251ec811 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -28,6 +28,7 @@ SRCREV =3D "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
 SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster=
;protocol=3Dhttps \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://disable_hanging_tests.patch \
+           file://0001-kvm-use-LD-instead-of-hardcoding-ld.patch \
            "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


