Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61865C47DA2
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:42 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.15552.1704990454456802584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AfwyPFMv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d41bb4da91so31055445ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990453; x=1705595253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pkdPHV+I/ZCBq5tW54d6I6gY7sfYIdg5WNA6f+AmLA=;
        b=AfwyPFMv9f79AZU98skoacy4emPcLc+Dw+L/4f18O8xZYxvN4YCXr0vCtAXjlQP4+h
         f8LkTw0Nry1aXPJLR60gBocfbpzW7t3l0ZL8KdiY8MJOwclBAFC1fuTEmx1sU3tLzlOj
         cHoM7SWe3YSY/nznRCEh41GLDCiu0UXzvX6WY/aiMBhi/2ERc5f4y1a4LNK+gNsznID8
         S3utMx7d7BfmQG4p+vnOXyunasMmYItv+eLjzC1Y6lz8jibKOdUDu7ADP6QyrPDNRwHA
         7rbPGL2B/4LKiY0E4C+JB++HlO0/0g9GMoRxi2DRDYViJXuM/ZLsJw3LlQ8UdWPHKH0q
         kcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990453; x=1705595253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pkdPHV+I/ZCBq5tW54d6I6gY7sfYIdg5WNA6f+AmLA=;
        b=Vv0T0RgOjT+x6imPNshMYIiumaM5Yikq+jIjPimoC6KJ+CLMmqd9A5NnFAGVvCkoMW
         EP+TS41ikOzqmlgbAUQeBcu/IhXSv/1g79sIckc7yrLSSKQksvxDo5rM8hErBqoks3iW
         NTPq7zgmXEYz+RAgvb/y2lRxfXAJkA7BZVokQa1v7YT16aj1CaATKVhLlgRbFCkGbbu0
         ScaoKa28nFafuBegtQ1cCStJKQSj6NgJmcXPNScwKVIZx3JtlJPNJww2CzCfRTRTcodq
         qhVkDoNQlBcX2B0L4n3dTOMEmoULLdqcomtuWhPCsSeum1M3v/0btFEk7hyhHGX7bqop
         l+cw==
X-Gm-Message-State: AOJu0YyPdY2PovhWtAEbmpRbhSOwiPj2kvv7kqkAagTMV968cd+xoMPz
	bEz67j6dtmjbOilVAtQ52UXlNMTq8zbogy+WQvZ+gsQGoFPzPQ==
X-Google-Smtp-Source: AGHT+IHyk5mC94ezMuDKc4wRX4z2jf5Z3lZOpW7NoolBZqxVzMeCcUPnDtK/PQCKLopH0tfQ0Hm5Lg==
X-Received: by 2002:a17:902:f542:b0:1d4:6d08:9061 with SMTP id h2-20020a170902f54200b001d46d089061mr1535529plf.58.1704990452974;
        Thu, 11 Jan 2024 08:27:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/12] shadow: Fix for CVE-2023-4641
Date: Thu, 11 Jan 2024 06:27:14 -1000
Message-Id: <d6ca15b3df54e2973a8e21814a73016255a1cb9b.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193549

From: Xiangyu Chen <xiangyu.chen@windriver.com>

shadow-utils: possible password leak during passwd(1) change

CVE: CVE-2023-4641

Upstream-Status: Backport
[https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90c0abda3e839e9c57904]

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7942df17d9dfcf690106b8b86506d496e6251327)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../shadow/files/CVE-2023-4641.patch          | 147 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
new file mode 100644
index 0000000000..1fabfe928e
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
@@ -0,0 +1,147 @@
+From 25dbe2ce166a13322b7536ff2f738786ea2e61e7 Mon Sep 17 00:00:00 2001
+From: Alejandro Colomar <alx@kernel.org>
+Date: Sat, 10 Jun 2023 16:20:05 +0200
+Subject: [PATCH] gpasswd(1): Fix password leak
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
+
+CVE: CVE-2023-4641
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90c0abda3e839e9c57904]
+
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
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/gpasswd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gpasswd.c b/src/gpasswd.c
+index 5983f787..2d8869ef 100644
+--- a/src/gpasswd.c
++++ b/src/gpasswd.c
+@@ -896,6 +896,7 @@ static void change_passwd (struct group *gr)
+ 		strzero (cp);
+ 		cp = getpass (_("Re-enter new password: "));
+ 		if (NULL == cp) {
++			memzero (pass, sizeof pass);
+ 			exit (1);
+ 		}
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 83e1a84769..ce3ce62715 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
 	   file://0001-Fix-can-not-print-full-login.patch \
            file://CVE-2023-29383.patch \
            file://0001-Overhaul-valid_field.patch \
+           file://CVE-2023-4641.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


