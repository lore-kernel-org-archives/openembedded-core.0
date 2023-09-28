Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A556FCE7AE4
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:48:58 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.6169.1695869335002814750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vB6I5nvP;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3af608eb34bso906372b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869334; x=1696474134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL88MDJxmEvj0pXDqioiC4K3Q+p+A8WiOdcvGy7rbOU=;
        b=vB6I5nvPItKlgscNLJdfRpCAjHuojRPtpDPNzUynE4OAt5NSinNnxLgBr4kHsmwdtt
         sUlisNujl6pycI1gXXYLVj4Z2xWh/7V2BuPb7mQuHgQavz1YcxM3T8W37vGyspytZ0BI
         kPQj5KyDlge2V9HDp/yyvmAhV5K6ysnaPvP+tfl9/dr1s2G5mDjmqfy1TDOlGjieUYx7
         zz69gC8YoniKG+AbWohgJfB0Nc9El+1XcSzo16Y2MSVyegWnhTQ8evStErAhjzpQTec3
         YlNSc86oWyfsnfBcd8wDafoAzgITa7XUES4R+/4k8kDG98DWB1l697DJ76FQ5sPcmNcc
         wMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869334; x=1696474134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL88MDJxmEvj0pXDqioiC4K3Q+p+A8WiOdcvGy7rbOU=;
        b=VA41mJgXGEF3JqRgXDUDM5Y9Qeym5eDB4feU5sb7d7mMm2cO9hKiXt38GQT1d1HM70
         F4G7cnEtsYu3A1p53/JmaCZiOs1zv3HXNHQDRGTkpz55Vg5s98r4eDUC52FOkh/LJekD
         naCTZfeOXT8u5Y/TAWQSSsyzLV0Y7KN2M3n814FQp3Id4txmGshCVXDC0RvnBMBekKBD
         5Tt1M1mv8N+VM1VNZ33f58G9EsnG97cbdrHAR2bHYxa4RwEMl1mnIqoPrgdYGvIpgIFm
         ug+8oOu33eFw2STrBubsAIEFo2UVCj7/uppZrgRH0VzWV2j8hE28R4oJo9mbjVIWM2E2
         E30Q==
X-Gm-Message-State: AOJu0YwpDZggwg7lYo++mU0/5KJUS8Kt7nZCOz06dToukvopXF5Ks4Ke
	CglSYdS1zAM8Mth9ZNQAz6NBY4IxpwTbC6pR4wE=
X-Google-Smtp-Source: AGHT+IG+FWSSw0pdGlzr5TFe+XIDM5CMnvWsOgLbgjU+eUAeT6KlILBw68akXSkP+j3JR9/aLE6Y6w==
X-Received: by 2002:a05:6808:64d:b0:3a7:1e3e:7f97 with SMTP id z13-20020a056808064d00b003a71e3e7f97mr3774626oih.4.1695869333808;
        Wed, 27 Sep 2023 19:48:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:48:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/17] shadow: Fix CVE-2023-4641
Date: Wed, 27 Sep 2023 16:48:30 -1000
Message-Id: <734a3e1fb5ee8ded3097a94c7ee8696518346166.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188351

From: Soumya Sambu <soumya.sambu@windriver.com>

shadow-utils: possible password leak during passwd(1) change

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../shadow/files/CVE-2023-4641-0001.patch     |  36 +++++
 .../shadow/files/CVE-2023-4641-0002.patch     | 147 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   2 +
 3 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch b/meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch
new file mode 100644
index 0000000000..2d3c462f4d
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch
@@ -0,0 +1,36 @@
+From 58b6e97a9eef866e9e479fb781aaaf59fb11ef36 Mon Sep 17 00:00:00 2001
+From: Christian Göttsche <cgzones@googlemail.com>
+Date: Mon Apr 25 12:17:40 2022 +0200
+Subject: [PATCH 1/2] passwd: erase password copy on all error branches
+
+CVE: CVE-2023-4641
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/58b6e97a9eef866e9e479fb781aaaf59fb11ef36]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/passwd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/passwd.c b/src/passwd.c
+index 80531ec..8c6f81a 100644
+--- a/src/passwd.c
++++ b/src/passwd.c
+@@ -289,6 +289,7 @@ static int new_password (const struct passwd *pw)
+		cp = getpass (_("New password: "));
+		if (NULL == cp) {
+			memzero (orig, sizeof orig);
++			memzero (pass, sizeof pass);
+			return -1;
+		}
+		if (warned && (strcmp (pass, cp) != 0)) {
+@@ -316,6 +317,7 @@ static int new_password (const struct passwd *pw)
+		cp = getpass (_("Re-enter new password: "));
+		if (NULL == cp) {
+			memzero (orig, sizeof orig);
++			memzero (pass, sizeof pass);
+			return -1;
+		}
+		if (strcmp (cp, pass) != 0) {
+--
+2.40.0
diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch b/meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch
new file mode 100644
index 0000000000..a37379d7a0
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch
@@ -0,0 +1,147 @@
+From 65c88a43a23c2391dcc90c0abda3e839e9c57904 Mon Sep 17 00:00:00 2001
+From: Alejandro Colomar <alx@kernel.org>
+Date: Sat, 10 Jun 2023 16:20:05 +0200
+Subject: [PATCH 2/2] gpasswd(1): Fix password leak
+
+How to trigger this password leak?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When gpasswd(1) asks for the new password, it asks twice (as is usual
+for confirming the new password).  Each of those 2 password prompts
+uses agetpass() to get the password.  If the second agetpass() fails,
+the first password, which has been copied into the 'static' buffer
+'pass' via STRFCPY(), wasn't being zeroed.
+
+agetpass() is defined in <./libmisc/agetpass.c> (around line 91), and
+can fail for any of the following reasons:
+
+-  malloc(3) or readpassphrase(3) failure.
+
+   These are going to be difficult to trigger.  Maybe getting the system
+   to the limits of memory utilization at that exact point, so that the
+   next malloc(3) gets ENOMEM, and possibly even the OOM is triggered.
+   About readpassphrase(3), ENFILE and EINTR seem the only plausible
+   ones, and EINTR probably requires privilege or being the same user;
+   but I wouldn't discard ENFILE so easily, if a process starts opening
+   files.
+
+-  The password is longer than PASS_MAX.
+
+   The is plausible with physical access.  However, at that point, a
+   keylogger will be a much simpler attack.
+
+And, the attacker must be able to know when the second password is being
+introduced, which is not going to be easy.
+
+How to read the password after the leak?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Provoking the leak yourself at the right point by entering a very long
+password is easy, and inspecting the process stack at that point should
+be doable.  Try to find some consistent patterns.
+
+Then, search for those patterns in free memory, right after the victim
+leaks their password.
+
+Once you get the leak, a program should read all the free memory
+searching for patterns that gpasswd(1) leaves nearby the leaked
+password.
+
+On 6/10/23 03:14, Seth Arnold wrote:
+> An attacker process wouldn't be able to use malloc(3) for this task.
+> There's a handful of tools available for userspace to allocate memory:
+>
+> -  brk / sbrk
+> -  mmap MAP_ANONYMOUS
+> -  mmap /dev/zero
+> -  mmap some other file
+> -  shm_open
+> -  shmget
+>
+> Most of these return only pages of zeros to a process.  Using mmap of an
+> existing file, you can get some of the contents of the file demand-loaded
+> into the memory space on the first use.
+>
+> The MAP_UNINITIALIZED flag only works if the kernel was compiled with
+> CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
+>
+> malloc(3) doesn't zero memory, to our collective frustration, but all the
+> garbage in the allocations is from previous allocations in the current
+> process.  It isn't leftover from other processes.
+>
+> The avenues available for reading the memory:
+> -  /dev/mem and /dev/kmem (requires root, not available with Secure Boot)
+> -  /proc/pid/mem (requires ptrace privileges, mediated by YAMA)
+> -  ptrace (requires ptrace privileges, mediated by YAMA)
+> -  causing memory to be swapped to disk, and then inspecting the swap
+>
+> These all require a certain amount of privileges.
+
+How to fix it?
+~~~~~~~~~~~~~~
+
+memzero(), which internally calls explicit_bzero(3), or whatever
+alternative the system provides with a slightly different name, will
+make sure that the buffer is zeroed in memory, and optimizations are not
+allowed to impede this zeroing.
+
+This is not really 100% effective, since compilers may place copies of
+the string somewhere hidden in the stack.  Those copies won't get zeroed
+by explicit_bzero(3).  However, that's arguably a compiler bug, since
+compilers should make everything possible to avoid optimizing strings
+that are later passed to explicit_bzero(3).  But we all know that
+sometimes it's impossible to have perfect knowledge in the compiler, so
+this is plausible.  Nevertheless, there's nothing we can do against such
+issues, except minimizing the time such passwords are stored in plain
+text.
+
+Security concerns
+~~~~~~~~~~~~~~~~~
+
+We believe this isn't easy to exploit.  Nevertheless, and since the fix
+is trivial, this fix should probably be applied soon, and backported to
+all supported distributions, to prevent someone else having more
+imagination than us to find a way.
+
+Affected versions
+~~~~~~~~~~~~~~~~~
+
+All.  Bug introduced in shadow 19990709.  That's the second commit in
+the git history.
+
+Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream version, shadow (19990709)")
+Reported-by: Alejandro Colomar <alx@kernel.org>
+Cc: Serge Hallyn <serge@hallyn.com>
+Cc: Iker Pedrosa <ipedrosa@redhat.com>
+Cc: Seth Arnold <seth.arnold@canonical.com>
+Cc: Christian Brauner <christian@brauner.io>
+Cc: Balint Reczey <rbalint@debian.org>
+Cc: Sam James <sam@gentoo.org>
+Cc: David Runge <dvzrv@archlinux.org>
+Cc: Andreas Jaeger <aj@suse.de>
+Cc: <~hallyn/shadow@lists.sr.ht>
+Signed-off-by: Alejandro Colomar <alx@kernel.org>
+
+CVE: CVE-2023-4641
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90c0abda3e839e9c57904]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/gpasswd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gpasswd.c b/src/gpasswd.c
+index c7c9477..00ca569 100644
+--- a/src/gpasswd.c
++++ b/src/gpasswd.c
+@@ -896,6 +896,7 @@ static void change_passwd (struct group *gr)
+		strzero (cp);
+		cp = getpass (_("Re-enter new password: "));
+		if (NULL == cp) {
++			memzero (pass, sizeof pass);
+			exit (1);
+		}
+
+--
+2.40.0
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 3c1dd2f98e..57b5002e8b 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -18,6 +18,8 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            file://useradd \
            file://CVE-2023-29383.patch \
            file://0001-Overhaul-valid_field.patch \
+	   file://CVE-2023-4641-0001.patch \
+	   file://CVE-2023-4641-0002.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


