Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2741093162
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2625.1773966513580752181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hzY1WPDl;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso15343785e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966512; x=1774571312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTSw4lJ7Nf24QQ2xlKrIRJOrz7nsQJQWCYKAoMUjXsg=;
        b=hzY1WPDl6LANCn4ZADhkD6oevUnrjTFwICherFBa2yUkEW4NZhJe6YoG96sVzd7uJq
         SoDzoShPl4RZDXBa8JQYVGiu7dvJaT6KySnMN68CN7lULaj+kiapdG3/QtIu+AooRn8I
         KmKr396FL9rRCO+pav7f5vSiwlCoXYJtQsxbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966512; x=1774571312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QTSw4lJ7Nf24QQ2xlKrIRJOrz7nsQJQWCYKAoMUjXsg=;
        b=jTntJOU5wFvRE54wcbkzqMqw0AezE4JZQXU1VL+4rv0+b9BwqajgxAZvJ+RRgNUzmD
         ocGap667syG3C/SEA7w5WHaUax7AVWYMa81a77I+vxgd2rkL5fybrTrNHchj+sXefNFI
         kQpaO/K6r/dIK0cN339XyNNUTW6zB40Geyt3klDJIBJT7i640WnT7U+3239rcr3aaYAi
         y7CbifALH3pxoo8IjDWDhXq0LN9utf/nP9pB1H+HbCqhWgFn01nLblu5Fx3QzdqvDuTH
         74rC0uQkw03wNwkofg6ZuC+71MPbZOWdhV/ZamCYA7JZJZV1qdU4r3k5O+HZhBeGIYEI
         Ji5Q==
X-Gm-Message-State: AOJu0YwIimTi0jNEgA+HzuGIdaMt+IlGfiqGRYgHSppKEwt2AM6O2i57
	+KCXLxEh0BokpzJM3qkJqdrQZQQypZ3Il8LrLqNZmLzxJE8GZVmWDl2lcErV2SBpyZDv8S07Tdn
	diGd9
X-Gm-Gg: ATEYQzz23JrhtUVyKbqhiN1gpLqcuvggjRboevt4fPch0ujItJZMR0krWXRH3UTplTh
	aluPXqIiYgJUtLY30+aiRJKmgh73jjb9h5r41BaIFSG6zo7LAncQbhnrd8hxNfvLg6DDLEW1h3P
	XO8ii012xFeNwirFazEcyiwnysWnycNlGhYnwAcoeTJpPnA5ceaNrw1U0fzkmALYN8SE0K4sPTs
	7HHUIOAmF4VwFX5bOyBEjMGotjbnPUmfk8uuDi4tGZkCD0FH33Wj4MDaxe7vVfsyzVp76JRAMUq
	VkqRutt3Tv2/qj32jtHmrqvPPfO35IRQQvkTLUUxhN9LwRTP4M3XSDqf6WGouJ9RA9JpPHtNwqp
	dx6tDWbTnDsc7D78rC9ckbE+FTnYK2qvdvX3tJm92Ay5XJWWQo9BqxOMp9bg0QZBZSd17vTYEZ6
	n3EfLfCaYq2uhG5u3242lA8ebi1Gv1ttFQc0grADQaABE9c3H+Qwnyy7e9uAWXlEl/rwNT2x/8O
	wMCYGswnVdSh8sCnKBg3QTiXqk=
X-Received: by 2002:a05:600c:1d15:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-486febb7648mr14788945e9.3.1773966511582;
        Thu, 19 Mar 2026 17:28:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/15] improve_kernel_cve_report: add option to read debugsources.zstd
Date: Fri, 20 Mar 2026 01:28:14 +0100
Message-ID: <366e124551bdbac0846512fa98cb8d6df5415cd7.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233568

From: Daniel Turull <daniel.turull@ericsson.com>

Adding option to be able to import debugsources.zstd directly.
The linux-yocto-debugsources.zstd is generated in every build and
does not require any additional configuration.

In contrast, SPDX_INCLUDE_COMPILED_SOURCES needs to be explicitly
added and increases build time.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c84a8958f30bbb982656ddcbe7476f6f81e1a6fb)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 5c39df05a5a..3a15b1ed26e 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -236,6 +236,26 @@ def read_spdx3(spdx):
             cfiles.add(filename)
     return cfiles
 
+def read_debugsources(file_path):
+    '''
+    Read zstd file from pkgdata to extract sources
+    '''
+    import zstandard as zstd
+    import itertools
+    # Decompress the .zst file
+    cfiles = set()
+    with open(file_path, 'rb') as fh:
+        dctx = zstd.ZstdDecompressor()
+        with dctx.stream_reader(fh) as reader:
+            decompressed_bytes = reader.read()
+            json_data = json.loads(decompressed_bytes)
+            # We need to remove one level from the debug sources
+            for source_list in json_data.values():
+                for source in source_list:
+                    src = source.split("/",1)[1]
+                    cfiles.add(src)
+    return cfiles
+
 def check_kernel_compiled_files(compiled_files, cve_info):
     """
     Return if a CVE affected us depending on compiled files
@@ -372,6 +392,10 @@ def main():
         "--spdx",
         help="SPDX2/3 for the kernel. Needs to include compiled sources",
     )
+    parser.add_argument(
+        "--debug-sources-file",
+        help="Debug sources zstd file generated from Yocto",
+    )
     parser.add_argument(
         "--datadir",
         type=pathlib.Path,
@@ -415,6 +439,9 @@ def main():
     if args.spdx:
         compiled_files = read_spdx(args.spdx)
         logging.info("Total compiled files %d", len(compiled_files))
+    if args.debug_sources_file:
+        compiled_files = read_debugsources(args.debug_sources_file)
+        logging.info("Total compiled files %d", len(compiled_files))
 
     if args.old_cve_report:
         with open(args.old_cve_report, encoding='ISO-8859-1') as f:

