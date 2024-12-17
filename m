Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A31E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:30 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.91465.1734468923324781986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b3hMZl46;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-728e81257bfso4721300b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468922; x=1735073722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBBwbKkJNkAxbV6reQGMzig9wXJR+66083INzpvkMfc=;
        b=b3hMZl46ygg46T+FczN82mvY7SOpkqjTis77twg2I/6MM4nQo+AU7Im1MWiBbf/i4U
         QedO623D3CLlfW/Y6oW/D0n2NltJuYdZRDYQh8vO0p3BqgrbY5n/IzTjWy5dhoN0oPMp
         bksA6Cc9J3ei4ruMljNMWLwp9d0rXxp8sL4X+vq8aklyz6QnZ+bnHMMzHJOwq4dhd+Ml
         PQCZqdDmDFbcvtJTb4wnNEyawTr3JZoiiDfGAUhcMXDbtyeafN8vxXx6RqacR0tjeqfC
         5RVj2MsP6DF1G2WEBzSwEvu8GJRF/7JELmWwgxiQ9MsLgav8xzLKQPygTdRnCt1GWbQO
         NzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468922; x=1735073722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBBwbKkJNkAxbV6reQGMzig9wXJR+66083INzpvkMfc=;
        b=XmikGVqktZOe1QroZ83dvxlwtcvjcnZTuoEbbfE27cuh150ZkbuGadkMF9vwC7auWJ
         cgsJOSweS/Op3t/Hyt3Yw0dxQ7pnu7yTEeT7XbFkRxvubTUMW2wPU93PxikMKQr/TH+d
         gMG+kcpCms9EIN9pjSTItiIacQvOulgvT6JMi86ko4151yH03jCUuxlSreVwIBLo8LCg
         rgxG1JwXRpBpC0haln0rN1ZV0yuakE/S9e5ms2DPpFmS4Bgxfm91HQ7QRMHlt0KLRDDS
         xmi4vJGV3BzVKhHMu80Mgm41Tj/xoZRFf3f4w8vW11KCc3N+48BFHvWuaGLI2Sac6SR1
         mk7A==
X-Gm-Message-State: AOJu0YwPDezl0SHF9YSNDdjohiaxqhS1hdCZwMK0pJsF1vx7XWgF2Aeo
	42xYUVSmKFC954COjIQrIQj9AhU4iphJ6CGNOa/GbcQdE3j+StxbBX2FgYY1hcw/H4C3cZcG9Hy
	K
X-Gm-Gg: ASbGncuaJviSIePS0DIWmZyIGq74KNHSETPB72AAJVgZCiBnOifDCwbb4x83idOz2c7
	NnFLLej/KKlB3eQxp6A4sDjaiLt3ZZzIAW7ByxR2+kC0uo5R+YMhgXCYu9yxjCT/kgbCjrJEVgL
	frwJSdG/KBGDCsNieZ3p8Yu4Cbdu13n1HW7R5UCdntyHRkvtgFseS7YQu5YbXe8dQkLLthSKA8W
	Ia3ncjmcoHE5zouB/+elmPfbSkA6ZC9sMS5EOufrCh2fg==
X-Google-Smtp-Source: AGHT+IGGP+UBY/EESNoQGcrAOzPr+WwAni9By+620dge/xqBnd/UZnoFri3yC6EPPlyTnITxCNl60Q==
X-Received: by 2002:a05:6a20:9f04:b0:1e1:f281:8d07 with SMTP id adf61e73a8af0-1e5b47fb4bbmr754733637.10.1734468922586;
        Tue, 17 Dec 2024 12:55:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] package.bbclass: Use shlex instead of deprecated pipes
Date: Tue, 17 Dec 2024 12:54:54 -0800
Message-Id: <bcaab04c20cbefced7d20beb9c37e042f8dc1577.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208848

From: Ernst Persson <ernst.persson@non.se.com>

The pipes library is deprecated in Python 3.11 and will be removed in
Python 3.13. pipes.quote is just an import of shlex.quote anyway.

Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 07bf5eb426..e6ba79346c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1850,7 +1850,7 @@ SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs2"
 
 python package_do_shlibs() {
     import itertools
-    import re, pipes
+    import re, shlex
     import subprocess
 
     exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', False)
@@ -1894,7 +1894,7 @@ python package_do_shlibs() {
         sonames = set()
         renames = []
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
-        cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
+        cmd = d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()
-- 
2.34.1


