Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B590C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 06:31:13 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144530.1783319465399786706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 23:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HY8aY61D;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so2531578a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783319465; x=1783924265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPUE34VzA28P6M7VHXM/Zf+VfEpaT2omqRcHkMDh4Vs=;
        b=HY8aY61D60Zi1e/oZAfkbm3dvMLpr0m+JXEEi3DH25GpDhSqUglW5NNT0clpIhpaEw
         XX9i9WDz56mNZTpJd/LmvavkD5dOCADnR6nxVOwtgkB/TLdWtNotp+hDuMeVFlHzsT5Q
         NVNA3sTAqvErhn+VkS+uPXuhbMG3nouZwS60p6Ri73nAQQ+xS5Sf0eDNDG89ELutj14b
         AqVHVCvfkeCxhnuTDmJIuq8bV4voRAp0FqF6VaHwLmASAGNoqmYd4FTE7kHar1T+32Mx
         R8Ax76gQyQOb5T89Vac71mBcmntCDTbhe4qfaXDhQVV6b8pRs5kSMz/C3eYt/NM+Q4aZ
         wpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783319465; x=1783924265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPUE34VzA28P6M7VHXM/Zf+VfEpaT2omqRcHkMDh4Vs=;
        b=MiLh3hJZB0fviWraph1+XpMBykmbErdPdGWBdO0abWVAGGpaUOX+T0GFl7w5qIRDVN
         mVTzT4N3SCR5ivj/rvoEkE+LDkNQaUCV8VR1ImGG+A/b43g43EoiyUmp4fES+l56oH1d
         fNGgQmeZNx3dgZquIBGkBuJx4AId4Su3lWaiKtZKd8iVHFSQAXpdM9BEcLcHCMxQRriS
         xc0gZ5hvgf7fNQnzypGcgMQ3cf2E8k8+8+fUSoJBDzhtxKGoToj3QBQe1oyJlCgdovSZ
         A8SHirHzVEUG6JOnt1WQI9i4V/Md6+z0NlwgfqthTY/Q3BFePVXk2mvFNdbQxnY/LF1T
         lGew==
X-Gm-Message-State: AOJu0YyUHH0stUBTRWYid4V2suKHu7hhd9hSzCM0ZT1GZAnvOvwFyqkt
	fO7ZzguQwkIeAVV1qU/HyC3tFPyVNRgEp7qxw2csxbsIw2gOJX0DNISa4kftUZ9lMyE=
X-Gm-Gg: AfdE7ckJy9vKmZG0DJv8VcHRPlGaxG9aCbW6BmQAo7N84z7Vk8cFPb8/UxAA33MznLj
	JW6UtffB6NTJGKrHd4WpnQBHEh0znbMuDiMzJM8V8dAMuwwh03dowzCPA36Hpdobu3BNCNcrGoE
	NG2qtuhMQxsRXVmX4QaRPK+ReC+hrazOOW6oL6NDXQGhJDtG5LokALqS6gssU8cowlLdTS6vIXv
	Y64SuuZViIQby+INM1R/XnTwPIZ+/kj+QzR78sbvsRL3t2qqS7IJIVrovUeRxQZGNH5V5NOgEuc
	jmgoZAz8firrhIYCwuVtf97zu0Ft5QVR4qIIpdL1RwW3eSyFnrAmG3eKzXnkfnAWsKqDrptmT+p
	u0pffpauQ1fQOWP6ICVV+vcYTFxI/4kK8Y+Q+nlFp4RKrVSnWXamc4tScXaOahQxCtj7ycqVqYs
	aid3Y0ns5ZgiGDe7RzcPr8X9I0E5Vwu03yyitfY1bMRnCS5Uv1cfZLqWKBa9Y=
X-Received: by 2002:a05:6a20:4303:b0:3bb:21ad:40d8 with SMTP id adf61e73a8af0-3c03e4d70f6mr9277132637.39.1783319464600;
        Sun, 05 Jul 2026 23:31:04 -0700 (PDT)
Received: from naduvan.timesys.com ([136.185.139.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm56770247eec.14.2026.07.05.23.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:31:04 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Chen Qi <Qi.Chen@windriver.com>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [OE-core][wrynose][PATCH v2] util-linux: backport pam_lastlog2 libpam linking fix
Date: Mon,  6 Jul 2026 12:00:55 +0530
Message-Id: <20260706063055.1914103-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 06:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240214

pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
autotools build did not link the module against libpam. With the
linker default of --as-needed, libpam was discarded and did not end
up in the module's ELF NEEDED entries. The module then fails to load
via dlopen() in processes that do not themselves link libpam (e.g.
systemd on recent Fedora, or weston on journald-based systems without
syslog):

  PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symbol: pam_syslog
  PAM adding faulty module: /usr/lib/security/pam_lastlog2.so

Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
it is placed after the object files and retained as a NEEDED entry.
Against 2.41.3 only the LIBADD line needs changing.

[YOCTO #16320]

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
v2:
 - Preserve the upstream commit message verbatim in the backported
   patch and only append the backport info (Upstream-Status, dropped
   LDFLAGS hunk note), per review feedback from Yoann Congal.
 - Point Upstream-Status at the util-linux master commit
   5683ed6320e00205146cbb3d0c76462733530eca (PR #4358). It is also in
   the v2.41 stable branch as c8d0af0421f6 (released in 2.41.5) and is
   already present in 2.42.x, so this backport targets the wrynose
   branch (still on util-linux 2.41.3).
 - Retag the subject for the wrynose branch.

 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...ix-libpam-linking-in-autotools-build.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..3cdc1e2c0f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
            file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
+           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch \
            "
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
new file mode 100644
index 0000000000..90532dde7a
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
@@ -0,0 +1,43 @@
+From 5683ed6320e00205146cbb3d0c76462733530eca Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 19 May 2026 10:54:57 +0200
+Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
+
+Move -lpam from LDFLAGS to LIBADD. When -lpam is in LDFLAGS it
+appears on the linker command line before object files, so the
+--as-needed linker flag (default on Fedora) discards it before
+seeing any undefined PAM symbols. This results in pam_lastlog2.so
+missing libpam.so in its ELF NEEDED entries.
+
+The module then fails to load with dlopen() if the calling process
+does not itself link against libpam (e.g., systemd in Fedora 44+):
+
+  PAM unable to dlopen(pam_lastlog2.so): undefined symbol: pam_syslog
+
+Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2453457
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/5683ed6320e00205146cbb3d0c76462733530eca]
+[Dropped the LDFLAGS hunk: the -lpam in LDFLAGS was introduced upstream
+ after 2.41.3 and is not present in this tree, so only the LIBADD hunk
+ applies here.]
+Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
+---
+ pam_lastlog2/src/Makemodule.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
+index 40d597c58..876171e9f 100644
+--- a/pam_lastlog2/src/Makemodule.am
++++ b/pam_lastlog2/src/Makemodule.am
+@@ -11,7 +11,7 @@ pam_lastlog2_la_CFLAGS = \
+ 	 $(SOLIB_CFLAGS) \
+ 	 -I$(ul_liblastlog2_incdir)
+
+-pam_lastlog2_la_LIBADD = liblastlog2.la
++pam_lastlog2_la_LIBADD = liblastlog2.la -lpam
+
+ pam_lastlog2_la_LDFLAGS = $(SOLIB_LDFLAGS) -module -avoid-version -shared
+ if HAVE_VSCRIPT
+--
+2.43.0
-- 
2.34.1


