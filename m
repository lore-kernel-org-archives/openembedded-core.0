Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2854C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 08:17:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.3263.1668413874758705392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 00:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=WHLVtTnx;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.171, mailfrom: nathan@nathanrossi.com)
Received: by mail-pf1-f171.google.com with SMTP id b29so10286860pfp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 00:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQCBCyr2ptTR5++CHLIG+yLPB8BCJlU1KfYjd3p0AC4=;
        b=WHLVtTnxU7Jkm/RTQkELKwwaP7lMRyIOOiaALiloam9sjLnPhU0fa3fs5FPlnqaVoG
         KiPZuC/cXTXuXexGxoMAd10+nY3x/O7ZZNGQlqlUP8W06t0tXDfYh7mVPgoNbF9ICgOm
         Yg2ZpKGY6e3uwD+LLWmD6l3b7i0Zjr+ysYaI5lxA+ZzM9vkvh6siuU2Ac/2F505hh8D+
         nUQq+DCqbdlaDNmwi89Frmid575d/WYP0UOm64MPmDO5/YxHxQSVyNurMqDrkRWWj8+5
         DzqHPFS+oCj2Oal1wYo6OiPcqi/G3tWzi84XlwFDN6PlFdNQ8Y1bVkiyKm+EkJgxHqHy
         ut2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KQCBCyr2ptTR5++CHLIG+yLPB8BCJlU1KfYjd3p0AC4=;
        b=S5g+rIKb6kQV13+GxDaXo/yaTJlYCpc3luMTl/1lcWX+U/FxbT7xBKhvUyi72KZygH
         bxcEWaVfmCxrLS4Y9Ytn909NFa1jsO75uGSaOinL5JCN1yFbJ8whkkM/kmy86Fg/KiAa
         d3q1pcik223yjGut3h4naPw/02MtXUXkA5R3RD6lfHO5PzjA/Mm5apeFULl/ndItCDci
         7J10p4b9R4bnxclEDDe5Iz2vWheB2AVKLr6k5Asuxj0oe/MwdpvyNLJphGBLawINhFDa
         1hdAHrsb7srCQD/9AIB8EIudZKgSxTIhz7Uk0aeDelX9XBaurhwTJ/lhdTdmyLYQ3EdI
         giRQ==
X-Gm-Message-State: ANoB5pmI4T2BlaBvfZ+mzO8/NUuyYbvUxVKnMNQyHe94bii0PG+v0CJX
	BVU2t2Hk+d2NEFbJ26ahSrWmST2mFPTlew==
X-Google-Smtp-Source: AA0mqf5/8Ei/1bIsjz/+uebEygTwPsBmFL4ftl+FTo8H7cizcZsuxbBOYiduJ8iBElV+2vXUU39khQ==
X-Received: by 2002:a63:4622:0:b0:46f:9c0c:809c with SMTP id t34-20020a634622000000b0046f9c0c809cmr10940218pga.523.1668413873772;
        Mon, 14 Nov 2022 00:17:53 -0800 (PST)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id q13-20020aa7960d000000b0056a7486da77sm6272222pfg.13.2022.11.14.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:17:51 -0800 (PST)
Date: Mon, 14 Nov 2022 08:17:18 +0000
Message-Id: <20221114081718.50468-4-nathan@nathanrossi.com>
In-Reply-To: <20221114081718.50468-1-nathan@nathanrossi.com>
References: <20221114081718.50468-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
 Nathan Rossi <nathan.rossi@digi.com>, Steve Sakoman <steve@sakoman.com>
Subject: [kirkstone][PATCH 4/4] package: Fix handling of minidebuginfo with
 newer binutils
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 08:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173231

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
---
2.38.1

