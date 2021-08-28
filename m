Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.194.1630174446756206778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=akQegsTy;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.47, mailfrom: steve@sakoman.com)
Received: by mail-io1-f47.google.com with SMTP id a13so13516109iol.5
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tsV29cASDcNsP+ERHSD5NEZb0shjxPOSNFpyo+ReUsI=;
        b=akQegsTy9g403UGQ/CdmOS6qFCxPL6RhKnqn1PlpgId7M+en+ckjUInmNwy+SLGCqr
         /hT282hD3mMXRsw3iDLJAG09uUByKcoDFMC5sbS7RfFvGq37ysfJfSwkCQGLLU4tfp8C
         n5yv2wvehDcCD55ROZJUE1BmJ9cCwTgIO2EsBi0oi9bMi8K/bGe0Aevk073I3l/BOxsM
         OOjlUBq20l3HQ2d8LeDS4ZKA4qE5q3e4S3lXib9xur7wnmxonXx8OEUenoWS+c7wO7vN
         FMcxJT4saa88Y4nMfR0PWu1j4tvHKt2bdGZPgjbsPE4MOUPMIfbReiFtX986DFNHd3Jo
         sGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tsV29cASDcNsP+ERHSD5NEZb0shjxPOSNFpyo+ReUsI=;
        b=gvOrlmiQHCFwBrEItJKTiPNNqRo8UqwN4AwVe669zm1O9kxI5YDL59yJA8lEmbvTHy
         3E6woPr9tCVoPeA8xvOwBaBfwLgAAsjlHiepFNsgyNQ7YtxkOjCTEkQ7wb5t/P+YWRbB
         iXL1Fo8JMN1m1ZvCmJHtjOiORVWbtF/VcFHj9tTozAvLPI72je0g1Qlxj1/cffWUqKjD
         qHBzisI6qky12rssrlMRHrklTkwcD34D9iZeovn7KyfUzAINl+F22YqKtT/ozFwVi1ZM
         dBYroA23GZXiPClVD7JBz6Uc1Ruh6mVCIHyv3/ty3JhfgM79OQfrvZOZaFPS384L0mYG
         JeeA==
X-Gm-Message-State: AOAM5338qpOdUq3hvdmgHEJw8Yt870oaXXsxppQPz05AmNqOgsBE7b48
	k/smJfFbOQQc3bpYwW4NBMLKm5bpDaxem2rJ
X-Google-Smtp-Source: ABdhPJxBDhuoQK5KRcj2rtTgJsAKeXtZ09/UY1pqvB41JINL3BZPKwa4U6Z+me7ADj7TGYZb/3U0tw==
X-Received: by 2002:a05:6638:40ab:: with SMTP id m43mr9520519jam.110.1630174445617;
        Sat, 28 Aug 2021 11:14:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/36] Use the label provided when formating a dos partition
Date: Sat, 28 Aug 2021 08:11:14 -1000
Message-Id: <c9617934a20d30198a8ddcf10fc02de4885fd433.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jbouchard <jeanbouch418@gmail.com>

Previously the bootimg-pcbios wic plugin was not respecting
the --label option provided from the wks file. The plugin
was setting the label to 'boot'. With this fix, the --label
option is use. If no option are specified, then the default
is 'boot'.

Signed-off-by: jbouchard <jeanbouch418@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fd7a73c1bd2486b7a022f0f69bbcb2e0d9cb141)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index f2639e7004..32e47f1831 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -186,8 +186,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
 
-        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
+        label = part.label if part.label else "boot"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.25.1

