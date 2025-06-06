Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331B7C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:53 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.37102.1749225643917574256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2I13pgQn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fc7506d4so2347966b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225643; x=1749830443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34qitVRbpoH7T2obo3Z91c76SoEWVMVbFyyFQgsPBY8=;
        b=2I13pgQnT/A1EsWk/BposJzyg0Lo31p4z9AnGWVccPzjG2BkM3tT1WcbFs7AFNCWPd
         uZZRg+JR5w6qjebcyd3hztLDSQ+LAgWfsP++z63wBJJJ+Jz5QwJbgpKw9tVQESAor/kN
         /VTQ9IJGVx9HELFjIXEC4z5nQrxfjg6NKKDKWSbwx1LxY58892EcTu2hgRLwSek60byL
         odBxZBDUytcEw4YgKRbGmO4GbENJR3biQwCtkNg0tKTnyea5F8lbByX0ARRYqgDuOHlt
         QrNvDQROmk39h6LdRkMbkAP+APdz+nGf3ynMMza8WbJKMi6ut9QOodl2t70VrsZ6pDZg
         5caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225643; x=1749830443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34qitVRbpoH7T2obo3Z91c76SoEWVMVbFyyFQgsPBY8=;
        b=IEeq2uyHgiaD1UPFwIe/pufJVheJdvEn/yLbizaytD3CVmIRQt6/7AkoiBRHYaPcWO
         ULDb1fOT2DVXIYxz62vInFr9LU81zEh3pSB8IzVmsnwzHppnFDaZmL3FovRtsS/o+94U
         sVTDxRrlDZjj2HKkriiuaCSv1Lczs+0vX7OiyCSKhibdPQV2ynlggOG/3Q2AI4V2vw9L
         6RQJDG+R6+3I9rEogxNVBDAxR6+Ol6ey1p8ROeSevQToOb9lv8GBXCIi1+hoEektZZrg
         +3SWMwJjx+v3scF5KKgm8tnxtw/3Q0szsS0jez9K6TLCk2hP1q9l7Gr+BKV0NnWEBG+2
         isUQ==
X-Gm-Message-State: AOJu0YwXP/hkwdHvD7+C8uCSv+v9heKqU5bwXLP/EINjwVf4yq8JkNKh
	0Q00XAZXvTd8i1x1t5KyjK+nkRqYBmChVSWsjUr2VwL74DFJBtp8Tfavb2yYBE81G4nNRqxYd/o
	7OLsg
X-Gm-Gg: ASbGncsK1OeSENO15bAvLgqTW8ssCp7tTjWsdFIEuNSSXb7OrV2LaZRlrazyG3uVOKQ
	PI7sINFbuR5P6mz/8Yf/DCzJ/spvcpFHV7I7KoDIsHTXHn98LvNISJN2WV4z5kWRID3mgTDVYB3
	PyP1PE3tPegXSLAR3rlmhuQTtjsr3ZBvOHrvTcIGLZkMUAVtyJZKg2zTiflhz+6T4tq+jXwZ4e2
	/Cjdn9/i16/nQeSLn5MHc7lGPDz2RVc12hJZX6IJrIkfQLGSuggdxB9Gr5P9gAkBG4GnIPvRSqW
	1Qbjgo8k6qoZiCmP8k8GJbFc9qpBxQLmnPvGZNA3/kE=
X-Google-Smtp-Source: AGHT+IFyZA7bmU3XAsRb2DbGa584uF2D9EE/pUJSoDSRCoPlrFwJHEVgfYBUgY9vi7/o/cZ2sBpZ4Q==
X-Received: by 2002:a05:6a00:2343:b0:746:2a0b:3dc8 with SMTP id d2e1a72fcca58-74827f10ac0mr5088309b3a.17.1749225643146;
        Fri, 06 Jun 2025 09:00:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/12] screen: fix CVE-2025-46804
Date: Fri,  6 Jun 2025 09:00:04 -0700
Message-ID: <a313af8ca347797214669406ee86f5239997f7e3.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218173

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
 meta/recipes-extended/screen/screen_4.9.1.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46804.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46804.patch b/meta/recipes-extended/screen/screen/CVE-2025-46804.patch
new file mode 100644
index 0000000000..918c2c5ce9
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
+index 1a23e1a..6eec151 100644
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
+index 54d8cb8..6c3502f 100644
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
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-extended/screen/screen_4.9.1.bb
index bc4928ff77..706351a593 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2025-46805.patch \
            file://CVE-2025-46802.patch \
+           file://CVE-2025-46804.patch \
            "
 
 SRC_URI[sha256sum] = "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69"
-- 
2.43.0


