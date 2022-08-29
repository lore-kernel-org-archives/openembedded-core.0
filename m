Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69A8ECAAD8
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:19 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3759.1661806996066428446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qLGc2diU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 p8-20020a17090ad30800b001fdfc8c7567so154960pju.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=lxuJenfKU8yAkMUUZbm9tqZP8RjObArytvfD3hEHhOc=;
        b=qLGc2diUETCxsSHg19Fli1JPN4Sbl5Y3ihHKyfWpgZpZvU2IIYjPpKTptDDn1CZe/D
         LVD56KnrAanwfG6Ie/CQeke7s6jZx5djThVlMCwHMPoFj2nj935hMMBM5wYnDYACB3oU
         YS74w5t3UP+MeSAPylFX3t8QoDW9Bw0KwCxypvL3uyvqSWKUQkuimF0q2gz/JPLIMURJ
         VU2VkqUKjClTYWjww0r9snLGog1vLa0bMuiYZkPuqWLdGIxaJQut0mhgrQv/35Oz9opb
         5wM4BD9MTRc78oxeS7mGt2R82RPEJjegyVc7OBh8c8WOlTmw9GMMC7PSCzZH5c2zZCQP
         179g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=lxuJenfKU8yAkMUUZbm9tqZP8RjObArytvfD3hEHhOc=;
        b=416FTKSKGc6KwRyjqRKUavrbU5oq0F9Zl8yCEReINAUdlcJDrqArrhIE7N8/lzjV5t
         FSRPL1ABNAUdtv+cG6ceQYxiYIGWhUlbRUaaAP13oOZpH2wUpFqlcB2i/MMDDyNXyYn0
         nRqX8FDjDqbIkRmcKAkYk1igMdF69q27RdV2Sq1X58NUpv618zW5+5g/J3yLsDd8mjT0
         rr7BHKGVU3DyIHiDI+4/zdkCfx0vanjqP/JSbBP9fQ8y+u0YRYlYKjkZqspcsgMP2i52
         FlNBo8c2Qp8F4Nu4aswZeEZ+6+8bJwIH3Cs8dAjM6FtTVspRla8u7QMm8FWUEn9+28Sf
         U26A==
X-Gm-Message-State: ACgBeo12Q4dDRdTYn4odqgx9e476U4obpPEEI1zc7YG8whgQca3n0bqF
	OUspD/Svgv2s3us4g8YlLQgdlmOAsRPoy3cQ
X-Google-Smtp-Source: 
 AA6agR5h+/ubZNn8Lpj4wo84mhUdvKO9PBXbazQaQYXrh6UUm4AeRAenc+4hrKDJzsJtLspv3nEcPQ==
X-Received: by 2002:a17:902:e892:b0:174:4022:b9c8 with SMTP id
 w18-20020a170902e89200b001744022b9c8mr16338975plg.0.1661806995092;
        Mon, 29 Aug 2022 14:03:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] relocate_sdk.py: ensure interpreter size
 error causes relocation to fail
Date: Mon, 29 Aug 2022 11:02:33 -1000
Message-Id: 
 <345193f36d08cfe4899c65e8edf3f79db09c50d2.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170039

From: Paul Eggleton <paul.eggleton@microsoft.com>

If there is insufficent space to change the interpreter, we were
printing an error here but the overall script did not return an error
code, and thus the SDK installation appeared to succeed - but some of
the binaries will not be in a working state. Allow the relocation to
proceed (so we still get a full list of the failures) but error out at
the end so that the installation is halted.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5a9a448e462d3e5457e8403c5a1a54148ecd224)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/relocate_sdk.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 8c0fdb986a..8079d13750 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -97,11 +97,12 @@ def change_interpreter(elf_file_name):
             if (len(new_dl_path) >= p_filesz):
                 print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
                     % (elf_file_name, p_memsz, len(new_dl_path) + 1))
-                break
+                return False
             dl_path = new_dl_path + b("\0") * (p_filesz - len(new_dl_path))
             f.seek(p_offset)
             f.write(dl_path)
             break
+    return True
 
 def change_dl_sysdirs(elf_file_name):
     if arch == 32:
@@ -215,6 +216,7 @@ else:
 
 executables_list = sys.argv[3:]
 
+errors = False
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
     if os.access(e, os.W_OK|os.R_OK):
@@ -240,7 +242,8 @@ for e in executables_list:
         arch = get_arch()
         if arch:
             parse_elf_header()
-            change_interpreter(e)
+            if not change_interpreter(e):
+                errors = True
             change_dl_sysdirs(e)
 
     """ change permissions back """
@@ -253,3 +256,6 @@ for e in executables_list:
         print("New file size for %s is different. Looks like a relocation error!", e)
         sys.exit(-1)
 
+if errors:
+    print("Relocation of one or more executables failed.")
+    sys.exit(-1)
-- 
2.25.1


