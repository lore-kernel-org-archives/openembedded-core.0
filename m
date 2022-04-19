Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C335C4707E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.2375.1650361592569201820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fLDODGb8;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id x18so13798754wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=096s4LiB+N5ZVwWcMBoks+xobXWsSxcRgQWMj8i3Czw=;
        b=fLDODGb8teT8wW5a3/WvMTD+CQmkQcaJr762rbDunaXIvrbWu9mWgQrqwepY8giPLV
         cUFv8PM4MgjigCIe8oX8X41iVIlt0ak4RT4AXBbFq9J+BZaylfsynS2YhjaxMcsAGhCf
         S7mYBMl1p5ISqEE1hmkPaRf26YaLNtDscj4d6QKdddZdBxXkAUY1p8zaYMbcNtU+PohX
         APQUiTY57qJUvW8bdJfHo9K5PshHWTf2W1dgn18V/VwZmI/uHlCwET4txD/7PL2Qjtl8
         GaZt0yJRt9EOCUFTVpeug8e76gsZLmAzeVFsVnZbvS2cr7dH5S6hSthZBiprTR7pdp+f
         cgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=096s4LiB+N5ZVwWcMBoks+xobXWsSxcRgQWMj8i3Czw=;
        b=vDdxgu/z5PYRtHcSuYsxWPYxXAkEdkfqOgFCIETkjTH370xrgLlHM1Cjaecv+UTvTu
         CrgdpyeNWYb6Qbz3vjZDzZYvpv45WX4uzKO4Bk2XGiOWKMXI+gSdAPPbWw4OmNlOMC7k
         a/vcelhA0+1hjfF6ZfO8bB3d7ihQ6wzqWhb6zuMMnhppW/Eu6TZzTJGe4Iekoh3XKMml
         tAzaOd7HDWsYZXOb2dkE6vHarqoA3IM0MXCBMAbUjK5GjYw18IacweW85URyBZnm+gT4
         HWSdmMm3rmWWaocZBnu0KVMjb5d5Iuh6Tiys4vxRTf8dYF7pDfdmrzGZE/xMoZmTdVCq
         iVww==
X-Gm-Message-State: AOAM5306xbX2oL+wOgTIxIpl2Ir2lZGb4TiGEWRarEH1yS5YBGX5jQsD
	VWHGoqET/DZd80EO3vi0U7vA1jDDzidPuA==
X-Google-Smtp-Source: 
 ABdhPJxYBDtZRKMxR6edTwz0s088VjLcUlFQfCMXiHdfkJN4BG4AHo3VPPJQLhaB9BT/cjqvRdrxPg==
X-Received: by 2002:a5d:64cb:0:b0:20a:9050:f7e9 with SMTP id
 f11-20020a5d64cb000000b0020a9050f7e9mr8404157wri.51.1650361590920;
        Tue, 19 Apr 2022 02:46:30 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1c5444000000b00391ca5976c8sm13556435wmi.0.2022.04.19.02.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 02:46:30 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] sstate: reuse the localdata copy on the mirror thread
 pool
Date: Tue, 19 Apr 2022 10:46:16 +0100
Message-Id: <20220419094616.433632-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220419094616.433632-1-quaresma.jose@gmail.com>
References: <20220419094616.433632-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164619

We don't need a new copy of the bitbake data [localdata2] in each running
thread of the pool.

We can do the copy on the startup of the thread pool in each thread worker
and reuse it in each running thread, this is the same we did for the
connection_cache which is reused by fetcher.

May be related with [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ebc336b497..7526ec7562 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -979,6 +979,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         from bb.fetch2 import FetchConnectionCache
         def checkstatus_init(thread_worker):
             thread_worker.connection_cache = FetchConnectionCache()
+            thread_worker.localdata2 = bb.data.createCopy(localdata)
 
         def checkstatus_end(thread_worker):
             thread_worker.connection_cache.close_connections()
@@ -986,15 +987,14 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         def checkstatus(thread_worker, arg):
             (tid, sstatefile) = arg
 
-            localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
-            localdata2.setVar('SRC_URI', srcuri)
+            thread_worker.localdata2.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             import traceback
 
             try:
-                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
+                fetcher = bb.fetch2.Fetch(srcuri.split(), thread_worker.localdata2,
                             connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
-- 
2.35.3


