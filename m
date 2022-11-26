Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE5C4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.70855.1669472164690029252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=z6jXGbPM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id 140so6474512pfz.6
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yet9tc2MNGrKEZeC/qzvhlM3yR6mgzPlNFICM2u4BAA=;
        b=z6jXGbPMRD1tt9+GRw0fAH8n/0NgK2DTAcTBxEcixuHxsz5cWpi4jhkP01kT6vNDYd
         GWTCUCdGRzxNj8i/ra9/+nLgRDQAPkajWy9elLi8IZCm4fNwdsLmuQc+2q4PNdsOu2XI
         MK24A3V5M1UgdM321onMnCW9ww4v5HwNsjISA1LPD1ac0+U44obi5gBE6/hHUgBBS3k6
         inXZFievywBsy0xxuvAq4dnL/vk8T7KKgbogAt/MMFWUfS1h6wPKVD82MxgDfvFNxvwx
         WvYrOwIknaf9NUHnf7bGYDo1fG7UH96J7h1IByo+4snzoFatqkO50W93nGAjBGGckoGB
         NASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yet9tc2MNGrKEZeC/qzvhlM3yR6mgzPlNFICM2u4BAA=;
        b=f5+OqzQ4h/6mWLK1Cl+sq/qfKUdjEgxw41KH7yeOGL2JsC/pqsG6GTg1vG2mc7CVXH
         jnKZYZtjh1uBpk1pekQdaNfQs8YP5JTGY5Xbu7d/suyKFrQmLwWCHfFdaVhWI17h/tYG
         C5KvZnnv21tfq9W4zqCpXyUJZkpsqH5fB160215BHJwY9SwXsxNwkdc08vCnEUdTDdki
         KuTvuiavegPD3DFTLbyJfBImxHYHnEHIrDc+K7Q4yf0my+2sdCsc+vZXwjO99MukC9D3
         ScRiaCP3A2VIu4kVCOsZETJCMsvqkUnQpmr1pcISs2T5OD+8ua695tRQHOGbkXHQlvv0
         uUmw==
X-Gm-Message-State: ANoB5pkwCvkH5SS9ggHIleBhOP+xEUxlI6Z0tqyrgKcibZy+okodhUcF
	ubyQce/Q4mMEAzKPAOBnJwAZddiAJHDgjgwMIgY=
X-Google-Smtp-Source: AA0mqf5qsSpAKLJs8mwjG4MMrvNojkLVWoUa7K/IkQgIC58LZ63Bl0sGXlQmrSJrFndPP4EPyX26yg==
X-Received: by 2002:aa7:91c9:0:b0:56d:8e07:4626 with SMTP id z9-20020aa791c9000000b0056d8e074626mr44770676pfa.70.1669472163662;
        Sat, 26 Nov 2022 06:16:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/37] package: Fix handling of minidebuginfo with newer binutils
Date: Sat, 26 Nov 2022 04:14:32 -1000
Message-Id: <f3aaad246fec3defda54328555f3b0765bb43b9e.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173821

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
 meta/classes-global/package.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 2d985d8aff..7a0a428b30 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -490,16 +490,31 @@ def inject_minidebuginfo(file, dvar, dv, d):
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


