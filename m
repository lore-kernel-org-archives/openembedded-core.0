Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33D1C0018C
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13928.1699451221743220483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FKP6ObSI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc7077d34aso52729185ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451221; x=1700056021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZXPBH1TdZvBvF6yAqWgUPZcwHxJsls1R8XCiDe41n0=;
        b=FKP6ObSIrN+ataDxG8n10JPotQwyKiNCquVCd6GVsJTzBaUsVhKwY/eSDAfbWnPBSm
         adDlbR+S0cy5w9yaJArMsOeueZ3Gx0Jq2L2ZV5MBgREYT2c34QGWbEtKN9XAzR4vduTy
         a2kJF2Pru+DSXX1N1m5MCkCwDh5n+UATgipelu4OtignFrFN201iFQUC1JtXw/ITT8un
         rFDz9JZP1o3uFGdv9vlKPKtRHbAzquVJMTKYSXU1eRNmQIp4kYBq81LB6rmG+XU74iu/
         PwV98aF4N787gY2hv+IvQerK/FYv86a71RUHi5KP/z5VuXXxaX0vowRJreY9x+IpdNfB
         QjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451221; x=1700056021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZXPBH1TdZvBvF6yAqWgUPZcwHxJsls1R8XCiDe41n0=;
        b=iipgXEEmPnfTRnsTtfLUa1YWdRhsRuLbgc13MIaKn1YhiMVIr7FH2IsQAGigDizvKu
         dyopqz8Ylb/xMosSfy4OvLwgRted30E4pP1RNl0upyIfEnD46qYxHih+G/MQ+jz0zvmQ
         9veAqjEF13MsvCcqZXkIcQoZi8KitY69w0c5AwbdRhVVBOGbZPoZxEa2mHvasuQzDWJ+
         8JO/gvCfhWzxyLK9YnUbMZOmXnM88kC2R49frygRwvDviKjYJ+93fDh6cfdvkM2wnSrm
         Y3XqRLFKDtO+iQiQwEm+9RmBSsXvDV6s4VpkSYnETFQNYuScwApKHQYL2cU+emehrDif
         D5jQ==
X-Gm-Message-State: AOJu0Yy1xC03d6lHAZ0He4g8Wn2ZwqCcn2TwjiNR5ZpKwichewuw1Bip
	JXDvuhol77MNUHbr30aYKIIyc+sXOH5JOY9W3t2IKQ==
X-Google-Smtp-Source: AGHT+IEUOyfzJeQ2qfjBPfg7G1vkW2hxzPWYRKh8pMP7ASMZQSMdEGUAKR6huiRF2E39SqQYK7z8LA==
X-Received: by 2002:a17:902:cf01:b0:1c9:d8b6:e7ad with SMTP id i1-20020a170902cf0100b001c9d8b6e7admr2893607plg.56.1699451220591;
        Wed, 08 Nov 2023 05:47:00 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.46.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/10] shadow: Fix CVE-2023-4641
Date: Wed,  8 Nov 2023 03:46:43 -1000
Message-Id: <3623f48ff73ad97f583172b7dbfcb56affc9353b.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190328

From: Xiangyu Chen <xiangyu.chen@windriver.com>

shadow-utils: possible password leak during passwd(1) change

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
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
index cf05a3af93..4014baddc1 100644
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


