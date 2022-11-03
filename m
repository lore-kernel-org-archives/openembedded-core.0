Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6844C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 07:56:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.16880.1667462189230069840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 00:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=LUst+0hg;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.177, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f177.google.com with SMTP id u6so1155050plq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n94LPe89X6J99cRvHy1YATnmt8heLfHsDOcDaScNYWk=;
        b=LUst+0hgL2SEtKP1Kia2HjjKhJ9ChGpZpyBIGg2Su0wqdVnAaWflTDSNdy1QiJWJgs
         y0IPj1VaLUAoue02EuL25pvXAabAwAWHNQNZrJhxFV4P7CxyOD9rIirvj15XdxT5kte8
         h3xJP4LDqs4Tl7JsMsbx8iWFjff9HG85peZrKZ6TJiih3/+UEMIc+ir9MKW6F/W6PEEz
         yJjCYrH84i6VAGzTGaWkgCv3bY+Pg/OfjUacxvYnSY14/wzFvN52sieJ9OjrOFV/zA++
         H3bRo0+n/HEN25KDAdjhxn7rSVtOv3MSbdf7bMh0nuK9E4Md90F4XYqCCM7IdcZ09jnJ
         pRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n94LPe89X6J99cRvHy1YATnmt8heLfHsDOcDaScNYWk=;
        b=aKWYooD9NTCc/Stq9MzsPUyjJ51WDesNNrOtQ9clM0F3josph/JV6D0tVuZhT0IYvq
         oAk6QTU4FCgsMtwlv84ez5c9gamOSgUpx7oLCuEVfl1bLGAIe0+rYo0l2GlKpMOBIu++
         ICr/bYiX61zenc9VjAvk6nMnwYIg5sFkRC137fZizgm5x0L/IySyqYfqQVvGx9UDJ66k
         p7+QpBmumGLHjiFyRdKL8SiJYNkHMwRilfxG91hm42Qkem432DPTZJvUE93Edwt3nGrY
         rzwI5ujAIyb3Ba9L7m/b3DYg+4yG1p7+J4QhVYGE7rTZq4u2G1pzmmQ7ev8S9bfh2L22
         BD6g==
X-Gm-Message-State: ACrzQf254KnEOpsSoAq2rCR646zEQoVkLYP9/8PNRAMH3/0gi5rBmNbn
	PG8D7oJLdgep/ojR7/NoN0N0Dw==
X-Google-Smtp-Source: AMsMyM4N6LVJbgYYbX2XXacmOqYLEYIcrh0TVwMEus0V9amtU3KgM/HxaCR3gXVbzOVpXTlNoh/tRw==
X-Received: by 2002:a17:90a:b011:b0:213:473e:6fe1 with SMTP id x17-20020a17090ab01100b00213473e6fe1mr30134168pjq.229.1667462188565;
        Thu, 03 Nov 2022 00:56:28 -0700 (PDT)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id x23-20020aa79ad7000000b0056d3b8f530csm135418pfp.34.2022.11.03.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:56:27 -0700 (PDT)
Date: Thu, 03 Nov 2022 07:56:06 +0000
Message-Id: <20221103075606.208982-3-nathan@nathanrossi.com>
In-Reply-To: <20221103075606.208982-1-nathan@nathanrossi.com>
References: <20221103075606.208982-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: 
 Nathan Rossi <nathan@nathanrossi.com>, Nathan Rossi <nathan.rossi@digi.com>
Subject: 
 [PATCH 3/3] package: Fix handling of minidebuginfo with newer binutils
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172617

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
---
2.37.2

