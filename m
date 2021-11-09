Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD1DC4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 11:12:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10541.1636456323208117276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 03:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N7Nsyns8;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id r8so32206274wra.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6gQoj3TbS+pDESsxFItqNzpcNv+lBJW/XsIOpV9LtXc=;
        b=N7Nsyns8Redosu4dDs+6lgerIQL+gPsk0gWBgF6tYarpPejHtvY3GSCcy6dnrs208C
         HUov0/Q/pmKRZE8Kktz35Fdmc99N8QndGm7CXAsW+jGvq1GpGLyU5zG6dpWr96fAD8kZ
         6KXzpQf91MD4DU8NqRRJgX3H0RtuWtD+bTrybGqBxVBEjcsGq7Lw9Kt5y6qu4FROn82/
         JOd79c3RYSquTtgH/dvuE2fMo0+2BAkVxLceBm0wP3bEv3OIDPuRXC11sN0RKyXmui2R
         +2cjlL/2YtRoftgkoI+oMS1a1N41OWaBjvx9lPB62W7NcMfwryaofeF93wvoWLq6kHg2
         ZGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6gQoj3TbS+pDESsxFItqNzpcNv+lBJW/XsIOpV9LtXc=;
        b=bxq+WR1KtFxo9cwGNrPBbW6pqyhgGchCyZftxgjNijSjeUIAEyN5MoioYflbuWNUjk
         NWIO05wiHpJFrp3niz0CxvYY0fdfcvE7lX0oCcghLx/ZT6oYpcj2orJjTBIkibL1NA9f
         byRSc7NxswVFD+mxO50r1BLWfxmTy61wqorYsETe7vpYI3yj+ls3to3wcpJyUaqbsVxX
         8qMF0L2gYHlvgXLfzyEK0fVTRLnX5MOX2o4WiaXL8a9nQLVS3aOqd6L4lIK0Enu3atZv
         keiQ4gmRUzIU2vHUd4jUd5/ttzgUfbFxT/nYleVuSL+HEkX8TFlmis1tNO5eEDjjVvUM
         PRxA==
X-Gm-Message-State: AOAM532Ma85gXA3qbi4dSfnB2t8cFgEeFdAjdZa9G2ayK5/nZNinXaBF
	m/gijYMdbHDwcZ52nzv3nMyGorZ20Y0=
X-Google-Smtp-Source: 
 ABdhPJwxMcKoN61b/t/TaosaFCAogueqsf4v3QWJyW/m26C5FlByp2Hl5au4Obyj8jozLRAQ0gRWdw==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr8075421wrg.282.1636456321601;
        Tue, 09 Nov 2021 03:12:01 -0800 (PST)
Received: from CTW-01195.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id
 c16sm19043389wrx.96.2021.11.09.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:12:01 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/3] sstate: only search on the mirrors for the missing files
Date: Tue,  9 Nov 2021 11:11:47 +0000
Message-Id: <20211109111148.136675-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109111148.136675-1-quaresma.jose@gmail.com>
References: <20211109111148.136675-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 11:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158012

The existence of missed files on the local sstate cache is the
condition to search for it on the sstate mirror.
The missed collection are populated when we search the files
on the local sstate cache.

- When we have sstate mirrors we don't need to iterate all files
again because we already know what's missing.

- When we found a file on the sstate mirror is because of they
are missing on the local sstate mirror.
So avoid checking if the hash exists on the missed collection.

- When we can't find the file on the sstate mirror we don't need
to add the hash again to the missed collection as it already exists.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3f6a1fe99f..88bd84a06c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -989,10 +989,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 found.add(tid)
-                if tid in missed:
-                    missed.remove(tid)
+                missed.remove(tid)
             except bb.fetch2.FetchError as e:
-                missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, e))
             except Exception as e:
                 bb.error("SState: cannot test %s: %s" % (srcuri, e))
@@ -1001,9 +999,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
-        for tid in sq_data['hash']:
-            if tid in found:
-                continue
+        for tid in missed:
             spec, extrapath, tname = getpathcomponents(tid, d)
             sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
             tasklist.append((tid, sstatefile))
-- 
2.33.1


