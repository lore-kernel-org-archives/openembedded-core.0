Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053EFC3A5A7
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4221.1667832917636303752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eU4TJwJj;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j15so16600549wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnRIH4a4PsCG9tnVFiR+4O13t7hWFm3zeVpdvgn+iWY=;
        b=eU4TJwJjJMlkzIsSgh+W1PXhWVMmEjkoHfdVbpKdZPRVbe/+Tv02wdbt/E8Y7UHeIE
         JzGFlGd2iOJM+iyrjr5xFKwjyKajif2dsDnPDNkLGC5Zo7CRZEfsmH8vfa0iQjTMuRxY
         WaEkPen0O4kAiUeFWEnq5U1puxBy4zPl5+Asyz+JNR7xvYZdu8IVl6cyFvDlkee2AS3b
         FrKgkIWyGGy254Bc3qQh+JFgdG6YPMjVeJivuCxKJLuggVYyRmmkbpuuZosrliM67EGW
         +n2JlxsAQnfF6IAwkPxCH6ucQdmH6ptKkA6zqQQB2sqvNdndO+Ph0gNY+WZAOMcUSZt2
         IYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnRIH4a4PsCG9tnVFiR+4O13t7hWFm3zeVpdvgn+iWY=;
        b=wSafBV4/41X0dUZF80qZLSe5hufj8wHJ9d4DUzG8gtBpaXENks56kRgMsEccZM/f33
         C+fmmxllSqBpZ28uq5u1wTY+ocfwbpcraYkYfpZe8grgkl0HiYF3A2nvtrcX8Ma/GgaV
         DIAttI7mGx/i4TIgxg0CVTnxB+OFzgJJssYCrvY3V/iNGCvfiGFeq9UFN9srgZBqbjI8
         pmbTsnbNzfMf3Hr1pm7GctuqDSeBLTc258c2wrEHF/B2pSGsRteOKTt31y/ZsumWeYFh
         MTOP7krFj7EBkHJsYI5OL7Oi4sTK/rZU051CbZJIRfJjgvsmO2jPipdCCMDQW3PadWWv
         y65w==
X-Gm-Message-State: ACrzQf0sVUP/z/ISDZFRlE8GL8b1ba6S1ercHRrg+C8H9C1k5smDdCTC
	lhLpo7/UGpbmWHQYL/mNkP5Iw0a+SiU=
X-Google-Smtp-Source: AMsMyM727zo6mmMgMMYQcqdi7v6qhZZYBU1VIvN9S+Ay6UjsZgA1D/WOTuUs1ACyCi7aOhXxU6HE0Q==
X-Received: by 2002:a5d:6485:0:b0:236:4ed2:409c with SMTP id o5-20020a5d6485000000b002364ed2409cmr31606551wri.110.1667832952418;
        Mon, 07 Nov 2022 06:55:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/48] sudo: upgrade 1.9.11p3 -> 1.9.12
Date: Mon,  7 Nov 2022 15:54:57 +0100
Message-Id: <20221107145508.1051404-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172887

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sudo/files/mips-fix.patch                 | 37 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../sudo/{sudo_1.9.11p3.bb => sudo_1.9.12.bb} |  3 +-
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/mips-fix.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.11p3.bb => sudo_1.9.12.bb} (95%)

diff --git a/meta/recipes-extended/sudo/files/mips-fix.patch b/meta/recipes-extended/sudo/files/mips-fix.patch
new file mode 100644
index 0000000000..fe9c652509
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/mips-fix.patch
@@ -0,0 +1,37 @@
+From 7944494196d4a9b33e0ae64a7e20f86e19c336d3 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Wed, 26 Oct 2022 16:35:30 -0600
+Subject: [PATCH] Fix compilation error on Linux/mips.
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/7944494196d4a9b33e0ae64a7e20f86e19c336d3]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/exec_ptrace.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
+index 81cd10bc2..208a75f88 100644
+--- a/src/exec_ptrace.c
++++ b/src/exec_ptrace.c
+@@ -282,16 +282,17 @@ set_sc_arg4(struct sudo_ptrace_regs *regs, unsigned long addr)
+ static bool
+ ptrace_getregs(int pid, struct sudo_ptrace_regs *regs, int compat)
+ {
++    struct iovec iov;
+     debug_decl(ptrace_getregs, SUDO_DEBUG_EXEC);
+ 
++    iov.iov_base = &regs->u;
++    iov.iov_len = sizeof(regs->u);
++
+ # ifdef __mips__
+     /* PTRACE_GETREGSET has bugs with the MIPS o32 ABI at least. */
+-    if (ptrace(PTRACE_GETREGS, pid, NULL, &regs->u) == -1)
++    if (ptrace(PTRACE_GETREGS, pid, NULL, iov.iov_base) == -1)
+ 	debug_return_bool(false);
+ # else
+-    struct iovec iov;
+-    iov.iov_base = &regs->u;
+-    iov.iov_len = sizeof(regs->u);
+     if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov) == -1)
+ 	debug_return_bool(false);
+ # endif /* __mips__ */
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 8947c46129..fd5bbf103d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=16cf60b466f3a0606427a7b624a3a670 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-extended/sudo/sudo_1.9.12.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.11p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12.bb
index ba610ee2e7..15c6728f08 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12.bb
@@ -4,11 +4,12 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
+           file://mips-fix.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "4687e7d2f56721708f59cca2e1352c056cb23de526c22725615a42bb094f1f70"
+SRC_URI[sha256sum] = "de15733888170c56834daafd34bf983db10fb21039742fcfc396bd32168d6362"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.30.2


