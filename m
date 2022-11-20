Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FB0C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:10 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.13281.1668953769306172176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NFcd05Y+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so9101155pjl.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiUMQXQNinjLraCjSC7OoAiRlhZoG/CnqoN4kT93MLA=;
        b=NFcd05Y+PE4vF+Pv2e8JgPxLgu5ym+y0CudCuoMd1aO/myeQF/OvSK8wZ5O1V/RmCi
         dZiL/P0Hwn4Unx5fFJCQxPQJvN6rO/eW3AliE3qEWJ26zJoQi8YIJy+1YtWqhV94G8b7
         4Qg4CQvhm2XCTKZ3l7nYqo092uQ3pUhj5lvOhdC3dnw3J8lDX7G/zV90Pr7aPCltYmvm
         8PkNFOLIMbUOcx5o6BOvFCg3DZtA7Xs/l2XR3xgQD7j/L01bWvRKkeiIUOUhuSZuhHgN
         Nzm6r17drP3izqbbpsqhMArJnAmRPBdkWrO1fW1aYaJanocvI1lKi6ZtjayeHpyX7Enh
         i6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiUMQXQNinjLraCjSC7OoAiRlhZoG/CnqoN4kT93MLA=;
        b=h+CamjkcJ2rTxiIFVwS9LuUMFgqwaOVq8RjKlEJgIhUqIiZsTuyqMbMh6EUlIpV/iU
         1QgBGAAgpd6A9LFcRXVL+7xuzK9QjKXFUbueIqqasYU115p/6yJusR1Z4Jrxkb6UAuyH
         MyzLpjoCdHnCnq4gmr/0YAm2hm57HkLBGgT4/unnh3y5xEmRrcnvH/8FNWn03y8pyq/v
         EJijXjfhwJPZjbKJDj/HX6YDZ5U+B1bbRxfXMb9wrLHTguhNg3McbkWkLK67LQEq8K8Z
         iplbyXIzBcWIPkDo3ULma6SINTz/w3c3b3ShIMSkiwCl9KYU2pkoGBBJrglYdtL8zzli
         qqZA==
X-Gm-Message-State: ANoB5pmuCBxW5ZrGcsk96113TzXZK/SV2MY6J1Ki1owpotKn/cuvxCYx
	IwRV+vpxuse4Oza9bnD6MP7ueaFIKrAhDJiQLbU=
X-Google-Smtp-Source: AA0mqf5AfBQTUF5Bl80VE0fKaqtQTXlbRmYP+PW2vOb75zvc2MEKSr5KppDs4UM9tY6NVNXuPgxnAA==
X-Received: by 2002:a17:903:31d5:b0:188:5581:c8de with SMTP id v21-20020a17090331d500b001885581c8demr3072854ple.140.1668953768251;
        Sun, 20 Nov 2022 06:16:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/35] package: Fix handling of minidebuginfo with newer binutils
Date: Sun, 20 Nov 2022 04:15:06 -1000
Message-Id: <9485559d269ed11bfcc90399c9282549ced35ce0.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173617

From: Nathan Rossi <nathan.rossi@digi.com>

Newer versions of binutils (2.38+) have changed how the
"--only-keep-debug" of objcopy behaves when stripping non-debug sections
from an ELF.

  https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=68f543154e92ab0f5d6c569e0fa143f5e8bd2d80

This change causes associated sections to be correctly marked as NOBITS
with the section contents removed from the output. The side effect is
that this causes issues with objcopy's ability to perform symbol and
relocation stripping (-S/--strip-all) on the debug split ELF, such that
with some object files (e.g. kernel modules) objcopy fails to strip
symbols/relocations with an error like the following:

  .../.debug/nls_cp950.ko[.rodata]: file truncated

Because of this it is now problematic to generate minidebuginfo for
these types of ELF objects. However it is not typically useful to inject
minidebuginfo into these types of ELFs, and other distributions (e.g.
Fedora, referring to find-debuginfo.sh of debugedit) only insert
minidebuginfo into executables and shared libraries.

This change causes the minidebuginfo injection to only apply to EXEC/DYN
type ELFs, which limits the injection to executables and shared
libraires.

Additionally this change fixes the parsing of the sections from the
"readelf -W -S" output which was not accounting for the section index
column having leading spaces for single digit index values e.g. "[ 1]".

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2084cfcb3d15db3e02637f1cd63ab9c997f38a65)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 97e97d2703..8b11fdd155 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -484,16 +484,31 @@ def inject_minidebuginfo(file, dvar, dv, d):
         bb.debug(1, 'ELF file {} has no debuginfo, skipping minidebuginfo injection'.format(file))
         return
 
+    # minidebuginfo does not make sense to apply to ELF objects other than
+    # executables and shared libraries, skip applying the minidebuginfo
+    # generation for objects like kernel modules.
+    for line in subprocess.check_output([readelf, '-h', debugfile], universal_newlines=True).splitlines():
+        if not line.strip().startswith("Type:"):
+            continue
+        elftype = line.split(":")[1].strip()
+        if not any(elftype.startswith(i) for i in ["EXEC", "DYN"]):
+            bb.debug(1, 'ELF file {} is not executable/shared, skipping minidebuginfo injection'.format(file))
+            return
+        break
+
     # Find non-allocated PROGBITS, NOTE, and NOBITS sections in the debuginfo.
     # We will exclude all of these from minidebuginfo to save space.
     remove_section_names = []
     for line in subprocess.check_output([readelf, '-W', '-S', debugfile], universal_newlines=True).splitlines():
-        fields = line.split()
-        if len(fields) < 8:
+        # strip the leading "  [ 1]" section index to allow splitting on space
+        if ']' not in line:
+            continue
+        fields = line[line.index(']') + 1:].split()
+        if len(fields) < 7:
             continue
         name = fields[0]
         type = fields[1]
-        flags = fields[7]
+        flags = fields[6]
         # .debug_ sections will be removed by objcopy -S so no need to explicitly remove them
         if name.startswith('.debug_'):
             continue
-- 
2.25.1


