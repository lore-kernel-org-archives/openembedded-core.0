Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9849.1620227964276391819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPFSb1XP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id r9so3474740ejj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nh/j35y2bCsGw6tUycN6e7hDRSf3tdz6dU7coyeKUrA=;
        b=EPFSb1XPgj9KH6sQjYmqI4NBtSUCEaFUZ7BJ/RgzPHjyG09Nja11y0W9ZDZY6dI9vV
         ev7qk1/Er5d4LUjsI6tO1lBR+eVC6w1f6mGqtgrQVTvR/XDxwHFKlIMYrL6oTNfHPKg9
         f5/dCL3UfEZNGX5BZ59Xoj1mvqChtxzqIju+9e4T9WdElA23hyOFVGUarMd1pjb19ImM
         gfUJPVbYDUz5d4M04ezfFAlnsDKo0VQUGAoCfvOGuIdNHKwFD4NCSdG+eC19172tCUaa
         vSKnVpUBh9IQTfUacp76fLUFvsCN4S3M8oxpD3JL3rP+LQDGI5jW81PI1smIyEkr2Yf/
         hkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nh/j35y2bCsGw6tUycN6e7hDRSf3tdz6dU7coyeKUrA=;
        b=hmJabVDUk6wGplBDZCGrfjC7ZlIar3JomD57Xon2O+1NwDF277GLfm8maFdPKeDKcs
         ZCoK77oKhKUE/mE+CtEZiEXbUBnKu1QiIJ2gNTcCqaQJO999djcYBO10QPhlFm5uRTTk
         YrLA3V61IBAw5Q02FoaS4yksRlLsBULxzkP6if9cUmJjUyD7ebChSs7MAw+DJ70u34LR
         88F/Rs1Uu7y/sIJuxmQsx/Re37NEXsSyPTH9zCsPksuDP0S0CC/GwMDLWbndW1wbuS9J
         sNJK5sLCg3mIR4ke3BdTMeUWPvSkv9vn6dPme9ppeqjhyXg5ja01dxsHnDh4y1fwE+ZY
         dsiw==
X-Gm-Message-State: AOAM531NBS/PzNEq0cCxfm2zZz5PgvDFF636D+b79FEjWVr8FO75NhkU
	pYMFofB3ZGwwdUpNU32f+AQD1G37zaZUdQ==
X-Google-Smtp-Source: ABdhPJwCM7HZpzOW9sEjqYvF/qf6eYid/G9bX+hT3odqVR6x86GlNSKJU5rXZOxZYEwfmW2Oqtb2Tw==
X-Received: by 2002:a17:906:c01a:: with SMTP id e26mr28064374ejz.300.1620227962759;
        Wed, 05 May 2021 08:19:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/61] systemd-boot: backport a fix to address failures with new gnu-efi
Date: Wed,  5 May 2021 17:18:22 +0200
Message-Id: <20210505151850.660512-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...f0a2af3f62acd446ebec8081b039b72caad8.patch | 179 ++++++++++++++++++
 meta/recipes-core/systemd/systemd.inc         |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch

diff --git a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch b/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
new file mode 100644
index 0000000000..e3ce296741
--- /dev/null
+++ b/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
@@ -0,0 +1,179 @@
+From 48fff0a2af3f62acd446ebec8081b039b72caad8 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Fri, 12 Mar 2021 22:09:44 +0000
+Subject: [PATCH] boot: Move console declarations to missing_efi.h
+
+These were added to eficonex.h in gnu-efi 3.0.13. Let's move them
+to missing_efi.h behind an appropriate guard to fix the build with
+recent versions of gnu-efi.
+
+(cherry picked from commit 95ba433a5f34baf92921fb58051bc8241f908c0e)
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/boot/efi/console.c     | 57 --------------------------------
+ src/boot/efi/console.h     |  6 +---
+ src/boot/efi/missing_efi.h | 67 ++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 68 insertions(+), 62 deletions(-)
+
+diff --git a/src/boot/efi/console.c b/src/boot/efi/console.c
+index 2dd4543d51..1d6dfeeea2 100644
+--- a/src/boot/efi/console.c
++++ b/src/boot/efi/console.c
+@@ -9,63 +9,6 @@
+ #define SYSTEM_FONT_WIDTH 8
+ #define SYSTEM_FONT_HEIGHT 19
+ 
+-#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \
+-        { 0xdd9e7534, 0x7762, 0x4698, { 0x8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }
+-
+-struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
+-
+-typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
+-        BOOLEAN ExtendedVerification
+-);
+-
+-typedef UINT8 EFI_KEY_TOGGLE_STATE;
+-
+-typedef struct {
+-        UINT32 KeyShiftState;
+-        EFI_KEY_TOGGLE_STATE KeyToggleState;
+-} EFI_KEY_STATE;
+-
+-typedef struct {
+-        EFI_INPUT_KEY Key;
+-        EFI_KEY_STATE KeyState;
+-} EFI_KEY_DATA;
+-
+-typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
+-        EFI_KEY_DATA *KeyData
+-);
+-
+-typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
+-        EFI_KEY_TOGGLE_STATE *KeyToggleState
+-);
+-
+-typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
+-        EFI_KEY_DATA *KeyData
+-);
+-
+-typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
+-        EFI_KEY_DATA KeyData,
+-        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
+-        VOID **NotifyHandle
+-);
+-
+-typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
+-        VOID *NotificationHandle
+-);
+-
+-typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
+-        EFI_INPUT_RESET_EX Reset;
+-        EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
+-        EFI_EVENT WaitForKeyEx;
+-        EFI_SET_STATE SetState;
+-        EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
+-        EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;
+-} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
+-
+ EFI_STATUS console_key_read(UINT64 *key, BOOLEAN wait) {
+         EFI_GUID EfiSimpleTextInputExProtocolGuid = EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID;
+         static EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *TextInputEx;
+diff --git a/src/boot/efi/console.h b/src/boot/efi/console.h
+index 41df3a406e..2c69af552a 100644
+--- a/src/boot/efi/console.h
++++ b/src/boot/efi/console.h
+@@ -1,11 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ #pragma once
+ 
+-#define EFI_SHIFT_STATE_VALID           0x80000000
+-#define EFI_RIGHT_CONTROL_PRESSED       0x00000004
+-#define EFI_LEFT_CONTROL_PRESSED        0x00000008
+-#define EFI_RIGHT_ALT_PRESSED           0x00000010
+-#define EFI_LEFT_ALT_PRESSED            0x00000020
++#include "missing_efi.h"
+ 
+ #define EFI_CONTROL_PRESSED             (EFI_RIGHT_CONTROL_PRESSED|EFI_LEFT_CONTROL_PRESSED)
+ #define EFI_ALT_PRESSED                 (EFI_RIGHT_ALT_PRESSED|EFI_LEFT_ALT_PRESSED)
+diff --git a/src/boot/efi/missing_efi.h b/src/boot/efi/missing_efi.h
+index 1b838af2a4..b6aae1eb5b 100644
+--- a/src/boot/efi/missing_efi.h
++++ b/src/boot/efi/missing_efi.h
+@@ -53,3 +53,70 @@ typedef struct _EFI_RNG_PROTOCOL {
+ } EFI_RNG_PROTOCOL;
+ 
+ #endif
++
++#ifndef EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID
++
++#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \
++        { 0xdd9e7534, 0x7762, 0x4698, { 0x8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }
++
++#define EFI_SHIFT_STATE_VALID           0x80000000
++#define EFI_RIGHT_CONTROL_PRESSED       0x00000004
++#define EFI_LEFT_CONTROL_PRESSED        0x00000008
++#define EFI_RIGHT_ALT_PRESSED           0x00000010
++#define EFI_LEFT_ALT_PRESSED            0x00000020
++
++struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
++
++typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        BOOLEAN ExtendedVerification
++);
++
++typedef UINT8 EFI_KEY_TOGGLE_STATE;
++
++typedef struct {
++        UINT32 KeyShiftState;
++        EFI_KEY_TOGGLE_STATE KeyToggleState;
++} EFI_KEY_STATE;
++
++typedef struct {
++        EFI_INPUT_KEY Key;
++        EFI_KEY_STATE KeyState;
++} EFI_KEY_DATA;
++
++typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        EFI_KEY_DATA *KeyData
++);
++
++typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        EFI_KEY_TOGGLE_STATE *KeyToggleState
++);
++
++typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
++        EFI_KEY_DATA *KeyData
++);
++
++typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        EFI_KEY_DATA KeyData,
++        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
++        VOID **NotifyHandle
++);
++
++typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        VOID *NotificationHandle
++);
++
++typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
++        EFI_INPUT_RESET_EX Reset;
++        EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
++        EFI_EVENT WaitForKeyEx;
++        EFI_SET_STATE SetState;
++        EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
++        EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;
++} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
++
++#endif
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3a919fd82b..88dddb309c 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -18,6 +18,7 @@ SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
            file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           file://48fff0a2af3f62acd446ebec8081b039b72caad8.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.31.1

