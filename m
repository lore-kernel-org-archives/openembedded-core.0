Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19111C71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.96537.1749584327708931261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FQU4+ywI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so206781b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584327; x=1750189127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPhgO0zkeQd0e+knpR+1urDJD3tgfo1lwsDaWVVDe90=;
        b=FQU4+ywIelQwV5E4pZOw9wbEE3vUhreGSQrObjONAB2w/Jhl/X9pb3RifFCK5Ac6Fh
         TDkJWqNZyuy/COqLo8LJsNObySApwkxjI/LJPiAD56TrwdjKdV2J6uLVAW87gsNSco/K
         /od6pFOA02aelq/lolkMxUo687/xPc9O6f1zGxmW0KT25t5H6CJL0CkFIdRJe8exeo7r
         1fe8lpbEecOgtFVskRBpov5pN7XPU60lD4HTETMqmiUer7LxxmvzopvKl8qtuIY2JAMy
         pw+TgctBLLBgz/uxJTWrLx4OkBlwcTbMC7X20wM7XZ5GZAf1YfaBVHS43HXg/8HpJSdL
         ft+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584327; x=1750189127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPhgO0zkeQd0e+knpR+1urDJD3tgfo1lwsDaWVVDe90=;
        b=ahNc701QI8CJQKLblr9lf7PKBJc0wjqeR1zcYgQ3b2hb1uZNB2i7eHyQE9zJvmjz5Y
         ntYu+XhmR+qHX6x4y2/798vnRP1Rk+6gNhiB9n1NLZ42uOSiQIVn25cN82f7VsgpFDwO
         /r0CZge5LDUnFxb+nnNWQssXfXIXhvsHG8xTamEPzUr1yYFKBN/aolRDZCpSivkzSLTv
         IB/VaryRTbh4dx+u+SXYzC5is27ktSdKkDRskHj2SSL6hdhKAB2eznN136WtxC7AAXHw
         RdqcaLgVLp0zTkA7y9l0v4Ywo7N5gYkPIW+HYQsZUMICWP3F1p2WM1odxmflhyVdnqpO
         Ll5w==
X-Gm-Message-State: AOJu0YxGGeqIcX3L4PFbJluAO5rsyrlRIzG6nlpm+RB/CFKrWy1t9AmV
	aDHmk6DFjruKPNVEnbvL3lPDWv3DMeSFHhhoqqwYzmwVOqaIw/NSwB7ZcI0ejlBjB8M8SE96eKM
	Ldr3b
X-Gm-Gg: ASbGncuWUkCyrjb16Ry5Rl25dwXztQ/1AaorstC+I81nEaIgSWFve6EA/6+RzhilPyQ
	YXKM1muZtNqpJsLUKT+8iCwEADW+7bhJGZP88JR3ixZCPZhjWn+r9GwUJ/Q3btAJ3QOsd+vLE3E
	cUW81MQ4//uTF6BsdWn0UVbBIWit1fCg1iQlmomTzykcbqMot/psUG5pWAsrBMDy6kRtBD3eWUs
	LWjlcmzq0qvDh1Xg0UHOaxTuE9rxeUb1brKup5BNPrUF6F6X/hWcPKL9Q7yeAMr9NJpioq0PgD7
	qOlNc7P/MKBUmRMv7XSn7y0agqqAiAH77C1+k3oxVQfAkg6irTtNgHR1RhU+EWHc
X-Google-Smtp-Source: AGHT+IHaeqqcSnLgZ5/PDoipiXbD9yr4IswzW9huitB9GlwCRnO/4ICb7Z1CUR+mOJoEUbEYUEU8eA==
X-Received: by 2002:a05:6a20:4313:b0:218:159f:1e87 with SMTP id adf61e73a8af0-21f86ffca68mr887013637.19.1749584326769;
        Tue, 10 Jun 2025 12:38:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] screen: fix CVE-2025-46804
Date: Tue, 10 Jun 2025 12:38:18 -0700
Message-ID: <fa14b05383a322f5fe751c81e8c6f1a8a1df8c9e.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218433

From: Divya Chellam <divya.chellam@windriver.com>

A minor information leak when running Screen with setuid-root
privileges allosw unprivileged users to deduce information
about a path that would otherwise not be available.

Affected are older Screen versions, as well as version 5.0.0.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-46804

Upstream-patch:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=e0eef5aac453fa98a2664416a56c50ad1d00cb30

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../screen/screen/CVE-2025-46804.patch        | 131 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46804.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46804.patch b/meta/recipes-extended/screen/screen/CVE-2025-46804.patch
new file mode 100644
index 0000000000..4cb1465535
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2025-46804.patch
@@ -0,0 +1,131 @@
+From e0eef5aac453fa98a2664416a56c50ad1d00cb30 Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Mon, 12 May 2025 15:26:11 +0200
+Subject: [PATCH] fix CVE-2025-46804: avoid file existence test information
+ leaks
+
+In setuid-root context the current error messages give away whether
+certain paths not accessible by the real user exist and what type they
+have. To prevent this only output generic error messages in setuid-root
+context.
+
+In some situations, when an error is pertaining a directory and the
+directory is owner by the real user then we can still output more
+detailed diagnostics.
+
+This change can lead to less helpful error messages when Screen is
+install setuid-root. More complex changes would be needed to avoid this
+(e.g.  only open the `SocketPath` with raised privileges when
+multi-attach is requested).
+
+There might still be lingering some code paths that allow such
+information leaks, since `SocketPath` is a global variable that is used
+across the code base. The majority of issues should be caught with this
+fix, however.
+
+CVE: CVE-2025-46804
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=e0eef5aac453fa98a2664416a56c50ad1d00cb30]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ screen.c | 45 ++++++++++++++++++++++++++++++++++-----------
+ socket.c |  9 +++++++--
+ 2 files changed, 41 insertions(+), 13 deletions(-)
+
+diff --git a/screen.c b/screen.c
+index f2e8171..ef6c26a 100644
+--- a/screen.c
++++ b/screen.c
+@@ -1122,15 +1122,28 @@ int main(int ac, char** av)
+ #endif
+   }
+ 
+-  if (stat(SockPath, &st) == -1)
+-    Panic(errno, "Cannot access %s", SockPath);
+-  else
+-    if (!S_ISDIR(st.st_mode))
++  if (stat(SockPath, &st) == -1) {
++    if (eff_uid == real_uid) {
++      Panic(errno, "Cannot access %s", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  } else if (!S_ISDIR(st.st_mode)) {
++    if (eff_uid == real_uid || st.st_uid == real_uid) {
+       Panic(0, "%s is not a directory.", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  }
+ #ifdef MULTIUSER
+   if (multi) {
+-    if ((int)st.st_uid != multi_uid)
+-      Panic(0, "%s is not the owner of %s.", multi, SockPath);
++    if ((int)st.st_uid != multi_uid) {
++      if (eff_uid == real_uid || st.st_uid == real_uid) {
++        Panic(0, "%s is not the owner of %s.", multi, SockPath);
++      } else {
++        Panic(0, "Error accessing %s", SockPath);
++      }
++    }
+   }
+   else
+ #endif
+@@ -1144,9 +1157,13 @@ int main(int ac, char** av)
+       Panic(0, "You are not the owner of %s.", SockPath);
+ #endif
+   }
+-
+-  if ((st.st_mode & 0777) != 0700)
+-    Panic(0, "Directory %s must have mode 700.", SockPath);
++  if ((st.st_mode & 0777) != 0700) {
++    if (eff_uid == real_uid || st.st_uid == real_uid) {
++      Panic(0, "Directory %s must have mode 700.", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  }
+   if (SockMatch && index(SockMatch, '/'))
+     Panic(0, "Bad session name '%s'", SockMatch);
+   SockName = SockPath + strlen(SockPath) + 1;
+@@ -1184,8 +1201,14 @@ int main(int ac, char** av)
+       else
+         exit(9 + (fo || oth ? 1 : 0) + fo);
+     }
+-    if (fo == 0)
+-      Panic(0, "No Sockets found in %s.\n", SockPath);
++    if (fo == 0) {
++      if (eff_uid == real_uid || st.st_uid == real_uid) {
++        Panic(0, "No Sockets found in %s.\n", SockPath);
++      } else {
++        Panic(0, "Error accessing %s", SockPath);
++      }
++    }
++
+     Msg(0, "%d Socket%s in %s.", fo, fo > 1 ? "s" : "", SockPath);
+     eexit(0);
+   }
+diff --git a/socket.c b/socket.c
+index 3bbd64e..5661e6e 100644
+--- a/socket.c
++++ b/socket.c
+@@ -169,8 +169,13 @@ bool *is_sock;
+   xsetegid(real_gid);
+ #endif
+ 
+-  if ((dirp = opendir(SockPath)) == 0)
+-    Panic(errno, "Cannot opendir %s", SockPath);
++  if ((dirp = opendir(SockPath)) == 0) {
++    if (eff_uid == real_uid) {
++      Panic(errno, "Cannot opendir %s", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  }
+ 
+   slist = 0;
+   slisttail = &slist;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index 540a78e04b..574b738dbf 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://CVE-2023-24626.patch \
            file://CVE-2025-46805.patch \
            file://CVE-2025-46802.patch \
+           file://CVE-2025-46804.patch \
           "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
-- 
2.43.0


