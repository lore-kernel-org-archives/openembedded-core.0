Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.8786.1632493008219372412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ymDmneaF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id r7so6511412pjo.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/hMiEtW61gvmZbUIek87fOGdH9W2eKLitdx9dND1y58=;
        b=ymDmneaF7GMPKNkNCnbdAYdNLHSRCxGv025NGhfT9n7FFy4nzqy+Ai3dOT5vwiWLFT
         npZZvmV31PWMAXwDLpIu+ewjONEeaj0vFFbmeimxNsjESgEtmOs0TSOSvApv4enjh782
         SccPFEah3HrpNGrnsMGY4E5wcVC1JvDpDKGJcnmKEg7gKC1uki5fbfC3/uupoiuQuQk0
         T25Da631Fi1aNAvL2Qf/HNSfubpE7/3QixHa2NEzwJjv1L+QXgHrcbiSnRuhYChamPV3
         cGMDdhbSd81cQZ077dtzjRI8OE9TjzU1Q0rqAG1m3tHHhcr5ysL16QxidoQduTQ0G2UX
         WyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/hMiEtW61gvmZbUIek87fOGdH9W2eKLitdx9dND1y58=;
        b=B16w9wUmb6CnltdhEgSjhGiwWOgkBWyA9nX2+WMKcY+uDavTqqWZ2lQZlNY5bPfQ7g
         HgYOa5varUrqOux3vtCjJLsgVcAiSZQ8/qUNwukUwZeMVdFOD0ZZGkJb0qGiIxS2qFzS
         eCPbcD8PzF6famst78jJ6LM5BtzrP0QkTKlNuh1P0ZMmzRiYQqKwh0AX9YltxZ2vpXFw
         /2JfuG9XRjzKRzc5cRqgyvWSJ9s+1HoVMrOaC8SieEeG/O1ZclW+nwlQqTeVmUa0+vvu
         stH9dKWSDx1iWiGOfrUGDHUeVjG6NI/VyvaIcQ1EBw9krrcbR0gYkhbc9JbgRmDtPvts
         PRnQ==
X-Gm-Message-State: AOAM533rrhIhyIFBRj+xa+DboT/lEFHmcbYarhqLSLr3RlDduHoA8Yki
	eD2Aouuz4ooGQQlKb2ZnNwUlhjRQ0phxtuYv9KU=
X-Google-Smtp-Source: ABdhPJxc7snMwkumVSBpkgs725iZGXuN4Wy1m63Y0Kohd+Mvxx8vSVcExeI5RgilamLh5z7tBC2LMA==
X-Received: by 2002:a17:90b:30b:: with SMTP id ay11mr2530777pjb.192.1632493007216;
        Fri, 24 Sep 2021 07:16:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/25] wic: keep rootfs_size as integer
Date: Fri, 24 Sep 2021 04:15:26 -1000
Message-Id: <db7f557781c8f08f5d046accddcda5295aea7e81.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

The corrected line accidentally converted it to float,
which causes problems later on with python 3.10:

|   File "/home/alex/development/poky/scripts/lib/wic/partition.py", line 278, in prepare_rootfs_ext
|     os.ftruncate(sparse.fileno(), rootfs_size * 1024)
| TypeError: 'float' object cannot be interpreted as an integer

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1d260dd2d196d10379ed9e238bcb34f39f3a3b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 85f9847047..792bb3dcd3 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -104,7 +104,7 @@ class Partition():
                 extra_blocks = self.extra_space
 
             rootfs_size = actual_rootfs_size + extra_blocks
-            rootfs_size *= self.overhead_factor
+            rootfs_size = int(rootfs_size * self.overhead_factor)
 
             logger.debug("Added %d extra blocks to %s to get to %d total blocks",
                          extra_blocks, self.mountpoint, rootfs_size)
-- 
2.25.1

