Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC02DC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:40 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.13201.1668953738486092819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=M0iSCu5I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so8677492pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTnqBu9eIzzZbr1TekKERZCQ+6n8EHUD0usMMv6W79E=;
        b=M0iSCu5IFnAx4GpIIR6jU26soIqPvligJylEgqxHn799GtFGZ7WIXq/W1Pee3hVPmX
         2jtF6NXMPR2SchaKj3To76PPKtbfxbzv+tbK2U6guG0Vvuh4U2HVLNZ3BdmJVYYL2Dw0
         Rxn5QYTtAPPZrDbviHr0u0OyGrId7yjN1mtDRMSGUbbfNO4J7jJWL4vnReK0XGr3KElf
         ycq6A835Qu2h8L43kyPfCkprJwVZ2/jwybJDWQUJWhbDlfvukCZppDI4Cmu0lfkKfpHd
         UJ6eTld18dCmY3th8/2dfRasqcAknDM5DHnLBHZrWcWKbZfBvJP82QKG7g1tZMtLkL3q
         s2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTnqBu9eIzzZbr1TekKERZCQ+6n8EHUD0usMMv6W79E=;
        b=n6Uot/Ot+PRzArrHVCWINSmjbFMPcZAJZ1pbipVeAamQZ+WFh/Vz3NwZDL9n9TPq5E
         C7UvbRYwCrm45bJAxzigxJBlWEYq8cGHXYZJdSz+ktpyjhogyerQOKQl84AIGJ147pjV
         uhsgamnbI4eVNAZLndBqN3dukdC9hPftXDJF0fKT1JuII+cpW1XwwgpG3zic8QUjY+zj
         uWPIRRZ44boNJVL/RRSdGYyrfiwLeAYCShKx57i9EEAOxj8vnQBLSOKQHqgBKvT1hfM3
         AKsxsEYRUAaieWUlpkl+8xDd0CkCRcBQzTyh4nxoxK3cwWPwpAncLkn4+Rm4uqRmkUC8
         rCew==
X-Gm-Message-State: ANoB5plzyAL5GoZACb/QvUUtvO89/rhSVqqbkuz6fZI9wCg9RCYWSgjp
	E3GlYNSxefFIMvOqVolbJu4y9s2SYDGn6ZRtWXE=
X-Google-Smtp-Source: AA0mqf7gVpW7jAjv4EVELM4gDNG2BRV94qA9WA4/HJ2fwZ40KMRkBrjNUvfuS6CBhI3FudgHTDaE7g==
X-Received: by 2002:a17:90a:7402:b0:209:853d:ec6 with SMTP id a2-20020a17090a740200b00209853d0ec6mr16809469pjg.29.1668953737494;
        Sun, 20 Nov 2022 06:15:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/35] dbus: fix CVE-2022-42010 Check brackets in signature nest correctly
Date: Sun, 20 Nov 2022 04:14:50 -1000
Message-Id: <901e2d7e785cfbeee6dd01146dd5185d023e70d5.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173601

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...idate-Check-brackets-in-signature-ne.patch | 119 ++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
new file mode 100644
index 0000000000..f2e14fb8d5
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
@@ -0,0 +1,119 @@
+From 3e53a785dee8d1432156188a2c4260e4cbc78c4d Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 13 Sep 2022 15:10:22 +0100
+Subject: [PATCH] dbus-marshal-validate: Check brackets in signature nest
+ correctly
+
+In debug builds with assertions enabled, a signature with incorrectly
+nested `()` and `{}`, for example `a{i(u}` or `(a{ii)}`, could result
+in an assertion failure.
+
+In production builds without assertions enabled, a signature with
+incorrectly nested `()` and `{}` could potentially result in a crash
+or incorrect message parsing, although we do not have a concrete example
+of either of these failure modes.
+
+Thanks: Evgeny Vereshchagin
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/418
+Resolves: CVE-2022-42010
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3e53a785dee8d1432156188a2c4260e4cbc78c4d]
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+(cherry picked from commit 9d07424e9011e3bbe535e83043d335f3093d2916)
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ dbus/dbus-marshal-validate.c | 38 +++++++++++++++++++++++++++++++++++-
+ 1 file changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
+index 4d492f3f..ae68414d 100644
+--- a/dbus/dbus-marshal-validate.c
++++ b/dbus/dbus-marshal-validate.c
+@@ -62,6 +62,8 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+ 
+   int element_count;
+   DBusList *element_count_stack;
++  char opened_brackets[DBUS_MAXIMUM_TYPE_RECURSION_DEPTH * 2 + 1] = { '\0' };
++  char last_bracket;
+ 
+   result = DBUS_VALID;
+   element_count_stack = NULL;
+@@ -93,6 +95,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+ 
+   while (p != end)
+     {
++      _dbus_assert (struct_depth + dict_entry_depth >= 0);
++      _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++      _dbus_assert (opened_brackets[struct_depth + dict_entry_depth] == '\0');
++
+       switch (*p)
+         {
+         case DBUS_TYPE_BYTE:
+@@ -136,6 +142,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               goto out;
+             }
+ 
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
++          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_STRUCT_BEGIN_CHAR;
+           break;
+ 
+         case DBUS_STRUCT_END_CHAR:
+@@ -151,9 +161,20 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               goto out;
+             }
+ 
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
++
++          if (last_bracket != DBUS_STRUCT_BEGIN_CHAR)
++            {
++              result = DBUS_INVALID_STRUCT_ENDED_BUT_NOT_STARTED;
++              goto out;
++            }
++
+           _dbus_list_pop_last (&element_count_stack);
+ 
+           struct_depth -= 1;
++          opened_brackets[struct_depth + dict_entry_depth] = '\0';
+           break;
+ 
+         case DBUS_DICT_ENTRY_BEGIN_CHAR:
+@@ -178,6 +199,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               goto out;
+             }
+ 
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
++          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_DICT_ENTRY_BEGIN_CHAR;
+           break;
+ 
+         case DBUS_DICT_ENTRY_END_CHAR:
+@@ -186,8 +211,19 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
+               goto out;
+             }
+-            
++
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
++
++          if (last_bracket != DBUS_DICT_ENTRY_BEGIN_CHAR)
++            {
++              result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
++              goto out;
++            }
++
+           dict_entry_depth -= 1;
++          opened_brackets[struct_depth + dict_entry_depth] = '\0';
+ 
+           element_count = 
+             _DBUS_POINTER_TO_INT (_dbus_list_pop_last (&element_count_stack));
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 7598c45f8e..4577da782c 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
            file://dbus-1.init \
+           file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
 "
 
 SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
-- 
2.25.1


