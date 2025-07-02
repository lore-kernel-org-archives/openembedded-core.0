Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9E4C83F07
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:45 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.25146.1751466338639877696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RbOQGe+n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3134c67a173so4210585a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466338; x=1752071138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3MZzpAwGmz02TYzaVkTTXNvw+Fe3E/HQT7Wn19cUnQ=;
        b=RbOQGe+nwUmIzaa/y6w6UFC/JMG01MS13cwxkKjpwVdDEByWQUKSgQOQrj61iNI6eS
         XMaL58TUYL40QpBNz8fOIjCOPmj5ajjjauw6lqrSGtoHwXsofjNRbCtx0XzsIRcf/lzx
         CR5XcX1E8sZKJQWiHfKIi1sdsTr/mYcpneOquMsPxvWrr/30OvCCdAS93vvLj1BDTKGD
         Xb2R8kyJexm4evNMH0sDsGkDGwgfibc8XCOqiWYc/jpn4Y/8iadci9zYHuPJthdTroZw
         XRFSREgdZfyQBjqSvnj2TgqLd44nP39/rS2uHNHuDGiLwrqx8NMg7AhDnok3/mDQJWc2
         zymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466338; x=1752071138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3MZzpAwGmz02TYzaVkTTXNvw+Fe3E/HQT7Wn19cUnQ=;
        b=kGC8YPTUUOQw+wW7so6leiXsLrQLwhZsPdy5trdIoauSD+TLIeErGPdFCr2jpc/FlI
         kc8jCHZjpS8OgEiGsUU+JqoZqmb2R/RJfl/1VaBJ7xQzYZBQ8/1moi5AKVIZfbf1MLO6
         yhVw/3Hfnn6dER4yutDiaW9HbkgEzpKaOXJnGARl9yYRQVJoNBxpEWyLHCBG/4wl+k01
         Lw7KTnzHHd5UAEr12w7vcU9eLGCNHSZddPS1Q2DZ/dJ+cPMBy8ZSb2kReeWxTiU8/xW4
         YScEhzS/1YlSQQCYhWK1y8WIVImBuvFSG1on0rOeBlzAw0xS/gYkf6VChuJ8tWGhmiik
         Y2zA==
X-Gm-Message-State: AOJu0YznwI1jew7+QgnfIOG7Nn9QnQJ2Wc9K5aCQ1sqZFkKE6TUyWplh
	B7rnJpiEepQoPLiD2xJUudc+mgDnYT/ry6l7vVoIHlZb+u0J0yhxb3R3wFX8tAJ1PAZhbF4QJFz
	0B4re
X-Gm-Gg: ASbGncuCmsR0O+CLKQty4Apa+uc8679Hso2nAaYzMRGia5K2+cw15dN2j7Ng+FQa2Z8
	a8mBPrbn9UXZj2YoSrxQLPWYrv66VXKWIJUX0rgi9EEhyYYt4XWsw1CkAcHvTBgffxpJJ1peiXo
	pzo9HRTvqET4V5SASOjfGY8wynzxsc3lAxwveAYPCRqTQYP43QdwMtePVQfl0qGARDR498gzV1d
	loN9ngcFw6CWVtscNrA7uXA2yYKJlfB5W9sRTbmZEC1O3uj6U5koiuVhTCUHPHDgmoRl22Isz8S
	9bnUZnEEftqdu85AuO31uGHxJ4LwGxZ7sOco/qr9MaqmOfKPwcSMJw==
X-Google-Smtp-Source: AGHT+IFwafDswI8Zqc4a171nmiI9HvZxaKHT00c84hPJTDO/b94uaxR5gqNt6yR46DvdCu8CUyfJNg==
X-Received: by 2002:a17:90b:4fd0:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-31a90b1a2b8mr4744080a91.1.1751466337540;
        Wed, 02 Jul 2025 07:25:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/9] package: export debugsources in PKGDESTWORK as json
Date: Wed,  2 Jul 2025 07:25:20 -0700
Message-ID: <234263cf43f63c5e37b69f14bdb0dba2405b2cf8.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219839

From: Daniel Turull <daniel.turull@ericsson.com>

The source information used during packaging can be use from other tasks to
have more detailed information on the files used during the compilation and
improve SPDX accuracy.

Source files used during compilation are store as compressed zstd json in
pkgdata/debugsources/$PN-debugsources.json.zstd
Format:
{ binary1: [src1, src2, ...], binary2: [src1, src2, ...] }

I checked the sstate size, and it slightly increases using core-image-full-cmdline:
without patch: 2456792 KB sstate-cache/
with patch:    2460028 KB sstate-cache/
(4236 KB or 0.17%)

(From OE-Core rev: c507dcb8a8780a42bfe68b1ebaff0909b4236e6b)
Adaptations to match spdx in scarthgap: change BP to PF

CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf |  2 ++
 meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 78f15b76ae..acf4e2d153 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -989,5 +989,7 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] = "BBEXTENDCURR BBEXTENDVARIAN
 oe.utils.get_multilib_datastore[vardepsexclude] = "DEFAULTTUNE_MULTILIB_ORIGINAL OVERRIDES"
 oe.path.format_display[vardepsexclude] = "TOPDIR"
 oe.utils.get_bb_number_threads[vardepsexclude] = "BB_NUMBER_THREADS"
+oe.package.save_debugsources_info[vardepsexclude] = "BB_NUMBER_THREADS"
+oe.package.read_debugsources_info[vardepsexclude] = "BB_NUMBER_THREADS"
 oe.packagedata.emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
 oe.packagedata.read_subpkgdata_extended[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index af0923a63f..ba0d326781 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1038,6 +1038,49 @@ def copydebugsources(debugsrcdir, sources, d):
             if os.path.exists(p) and not os.listdir(p):
                 os.rmdir(p)
 
+def save_debugsources_info(debugsrcdir, sources_raw, d):
+    import json
+    import bb.compress.zstd
+    if debugsrcdir and sources_raw:
+        debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
+        debugsources_dir = os.path.dirname(debugsources_file)
+        if not os.path.isdir(debugsources_dir):
+            bb.utils.mkdirhier(debugsources_dir)
+        bb.utils.remove(debugsources_file)
+
+        workdir = d.getVar("WORKDIR")
+        pn = d.getVar('PN')
+
+        # Kernel sources are in a different directory and are special case
+        # we format the sources as expected by spdx by replacing /usr/src/kernel/
+        # into BP/
+        kernel_src = d.getVar('KERNEL_SRC_PATH')
+        pf = d.getVar('PF')
+        sources_dict = {}
+        for file, src_files in sources_raw:
+            file_clean = file.replace(f"{workdir}/package/","")
+            sources_clean = [
+                src.replace(f"{debugsrcdir}/{pn}/", "")
+                if not kernel_src else src.replace(f"{kernel_src}/", f"{pf}/")
+                for src in src_files
+                if not any(keyword in src for keyword in ("<internal>", "<built-in>")) and not src.endswith("/")
+            ]
+            sources_dict[file_clean] = sorted(sources_clean)
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+            json.dump(sources_dict, f, sort_keys=True)
+
+def read_debugsources_info(d):
+    import json
+    import bb.compress.zstd
+    try:
+        fn = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(fn, "rt", encoding="utf-8", num_threads=num_threads) as f:
+            return json.load(f)
+    except FileNotFoundError:
+        bb.debug(1, f"File not found: {fn}")
+        return None
 
 def process_split_and_strip_files(d):
     cpath = oe.cachedpath.CachedPath()
@@ -1269,6 +1312,9 @@ def process_split_and_strip_files(d):
         # Process the dv["srcdir"] if requested...
         # This copies and places the referenced sources for later debugging...
         copydebugsources(dv["srcdir"], sources, d)
+
+        # Save source info to be accessible to other tasks
+        save_debugsources_info(dv["srcdir"], results, d)
     #
     # End of debug splitting
     #
-- 
2.43.0


