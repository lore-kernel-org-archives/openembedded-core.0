Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4973C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 16:23:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15569.1785342231528232016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 09:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jwevealX;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso11781205ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342231; x=1785947031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOahWsAXg/nfCks+vEpZkPi9vTCou4eV8IPTtbUI4NA=;
        b=jwevealXYO0Wyy7o7GsPSMVvL+6Vm8R8oMNUdyh6u67scPofLc21idDGI55jYfhZl/
         pCKgLkz/WdyqMJFqqTVxMG2mvbTKTlHNXSAi7EOUe5hgMT8n43qhuxAa4QSzGP7Fa9gc
         B1qPM1IPhb0nBp4cgGTd84lv6Wt2/N8wpJ4OiQmfufyl8iIeVgf73V9bXBWuaWdA0L/j
         AucWf4pUEEHd7Qb/vlqk66flopYEqm+vF+ze2fPP69xMB5k5EJ/jpOmd78jlMoWY1hAM
         9IDIwcQsAbRYXDc4PGr1NxhkAQO67u6t+QuFv9e040Q4RNAFKag+NGJ8sjEItn0Gdypm
         IMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342231; x=1785947031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOahWsAXg/nfCks+vEpZkPi9vTCou4eV8IPTtbUI4NA=;
        b=QuG5IZZEihn7+xe24XOfS6wmafEye8fFcB7p0DEJA/Lu6w3mqUOiPGQ5BIONlJjPxC
         gtRGB67MDCrDtJYg0qKzQBuoZu2nKenLQoUq7LageZpT9YOZzTGeaM1juZiqmk8gt+eS
         oSHldRks7aXJl9njgWGAhGPiHWEFwHiN18dipGN/dkgaL0ZD5YB0IoseUDPmTZH+ryPs
         wx/4o4fa1TOH4Zp5YN+YuJJvHX5YtQG6gDGg0FCNZ/igaVXCw0bG03ImTnmYvTlXkOZI
         xf49kZ5aeeabQP50J63AUaTfhAUkGpMG0YKSdE9UlTwCMmEICq5fmVS1gXPzHV6BpW9W
         6YzQ==
X-Gm-Message-State: AOJu0YyywH7UCrkSVhmifBpXqgHQLRuSz9Cx6+zjq+gtA0hLIyQBCHe5
	AN0Gnkk6Io87m3n5kWLxHCP6eqNcu6A/7V0VlyZdPkWOeR+hypsbmKsIx2XaKhMO
X-Gm-Gg: AR+sD10crF1/qItt5DoFL6LRg6ZaY9K+UVxnFWHKJB4Z3b/YlvU07u/ON5BCAlmIFlQ
	ddMRFWE1j0fwYMoAHPjoJMJz/2RlDg7svfwtbLvBkXtSW9W3bS+d6BpMIY1B7Z3MNNnupPn//3B
	hsJhkVCK5kcEvQnTUrNvfR8oV8d9FfJAtk7SvsxZqVed5gTFbvq9wddIjtN6c9daXJqgZPV8BjU
	rIjrZe8j3F4oZ+ycidXqChMaJ6C5hBH/UJlhctaI/SjaDWKPNj6VPSYuUDZnCqOuNsevJIKxbtS
	F69aF2/ouG4Bb4Fzj3uRPmV11Cpb9f5I3yOdGMA0mZ7Er4mPch8YtI4TYJEmF6EdekYDmXudYAT
	kYaoN/4iGVUiOHVEK0C0Y0XUQRbU/NAipRjPbq6BgUGbhnVHQZGP6KMJu45qX6N48eTEKEDZZad
	ct2KsIa5WsdEHD2eZp9f1Tu0r8ptrbDQLhKp+Oi7bcznlPFAeEaC8pH14MSwVcEYjUYR2BQGxh9
	odMCNTvmRzjZmHGs3K04ZyJbFKrM5gLpnucEJUkvC1UXYLEeVvNeG+BvM8/t48exUFFZqwG9TaO
	G5rOYGmlsDXOcPGyNLwi3AK+YUODOVIA4i8LWfn3xOnRvV6ehk+cgaOhNXfN+elbRCEay5HhHtA
	83BDb4VPjbmG+
X-Received: by 2002:a17:903:2f0d:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2d015abe547mr86722565ad.10.1785342230803;
        Wed, 29 Jul 2026 09:23:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b670dcsm11181609eec.7.2026.07.29.09.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:23:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] m4: Fix ptest hang with glibc 2.44
Date: Wed, 29 Jul 2026 09:23:47 -0700
Message-ID: <20260729162347.4037154-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242278

glibc 2.44 declares the POSIX 2024 name posix_spawn_file_actions_addchdir in
<spawn.h> as an asm level alias of the long standing
posix_spawn_file_actions_addchdir_np [1]:

  extern int __REDIRECT_NTH (posix_spawn_file_actions_addchdir,
                             (posix_spawn_file_actions_t *, const char *),
                             posix_spawn_file_actions_addchdir_np);

There is no symbol exported under the standard name though. gnulib probes for the
function with AC_CHECK_FUNCS, which does not include <spawn.h>, so it does not
see the alias and concludes the function is missing. gnulib then compiles its
own lib/spawn_faction_addchdir.c, but the header attaches the asm name
posix_spawn_file_actions_addchdir_np to that identifier, as a result the
*definition* is emitted under the _np name while its body does

  return posix_spawn_file_actions_addchdir_np (file_actions, path);

i.e. it calls itself (INFINITE LOOP). It overrides the real
glibc symbol for the whole program:

  0000000000000000 <posix_spawn_file_actions_addchdir_np>:
     0:	eb fe                	jmp    0 <posix_spawn_file_actions_addchdir_np>

tests/test-execute.sh case 21 therefore spins there forever. Because gnulib's
execute() blocks the fatal signals before spawning, the hung process also
ignores SIGTERM and ptest-runner has to SIGKILL it.

m4 cannot be autoreconf'd (m4-native sets INHIBIT_AUTOTOOLS_DEPS and overrides
do_configure, as autoreconf needs m4), so fix the probe result directly:
reached through <spawn.h> the function really is available. gnulib then takes
its REPLACE_ code path, which names the definition rpl_* so that it no longer
collides with the glibc symbol it forwards to:

  0000000000000000 <rpl_posix_spawn_file_actions_addchdir>:
     0:	e9 00 00 00 00       	jmp    5 <rpl_posix_spawn_file_actions_addchdir+0x5>
  			1: R_X86_64_PLT32	posix_spawn_file_actions_addchdir_np-0x4

The underlying gnulib probe is still wrong upstream and it is reported [2] and also
discussed in glibc bugzilla [3]

[1] https://sourceware.org/cgit/glibc/commit/?id=7594b4e5a75d41e891782aa7e3fb51924f6840cb
[2] https://lists.gnu.org/archive/html/bug-gnulib/2026-07/msg00164.html
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=34437

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/m4/m4-1.4.21.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.21.inc b/meta/recipes-devtools/m4/m4-1.4.21.inc
index 1af9b9a783..3be6a521a8 100644
--- a/meta/recipes-devtools/m4/m4-1.4.21.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
@@ -23,6 +23,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464\
 
 EXTRA_OECONF += "--without-libsigsegv-prefix"
 
+# see https://lists.gnu.org/archive/html/bug-gnulib/2026-07/msg00165.html
+# Drop it when upgrading to next release where above fix is accepted
+CACHED_CONFIGUREVARS:append:libc-glibc = " ac_cv_func_posix_spawn_file_actions_addchdir=yes"
+CACHED_CONFIGUREVARS:append:class-native = " ac_cv_func_posix_spawn_file_actions_addchdir=yes"
+
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
 do_compile_ptest() {

