Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5BFC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 21:18:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.3209.1664399920106984546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 14:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EftGM4BK;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id n10so21609472wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 14:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HMC8wYT11dYY+gzC+BoKUH3xYeV4uF/q0YkyvDA36JA=;
        b=EftGM4BKMtVcUZMw+vJ3/TKbl7QIpcCh2gO8fq+pVKiErpPpXNtCszCfnWNk/o+47a
         Wol9PbnIBGeB3T59mrwQtW1DvbtZ7+zDr9PtmvF7EvubFxgZIFm2qbWe52mTPC9aPWJg
         fo2Bqh9T4uCqNWhTJfHSN9Ibd1qIXwUMCO4LG5MFzkXTDKiXu5wHchTYujwD5xH9n9Hj
         vqZrB2LCmUK2qzY3mZvujXNMRQh37XXeNWhW4n7Z9Lr+Nfs4tyDl7UDf37hK4x8RWu9Z
         iPoES0jUEFJE41QOSHpEEnytDCAxRl8+iIyOfHeRoca9Yb5xMPr/c0LxLs6HmTf7iDSt
         H1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=HMC8wYT11dYY+gzC+BoKUH3xYeV4uF/q0YkyvDA36JA=;
        b=1/MXrcoRCg7LW5VzuUWIsK9n1sPWyVI/78RUyDzRSHnkmJR94FULNsKmrYronU0A8e
         b8f6fjiO/T3WwmV5SiIywIfZ+5S3FPI2cNCyFF2eeA6Wl9qZ9L0pxo4SI0zSVnCfZr2F
         KK3zQoeJvad8v0fnhQ6/4BirRohNUSv+iW/TEx23WNfDxXvB2Xy7yK6uSvDwdgbzrZr5
         RI246iBcShMVTBHS4G1JRPfK6ijXaX+sAn2omi/mx20pq4fWG+xRnqoBSfF3+8Nk31/i
         hyd4zFeil4+pynp75i5FoiNcLSCqr+EluzIlkBSdmffC1/ptWkIQ2/OHsNTGdBdSGtO3
         VjNg==
X-Gm-Message-State: ACrzQf28/renc2DHkHmzZ5rIFpI0AnU43oL0bbxLAiyDyx0EI1+PWPk3
	2NjKxljDY4be3DVuqP19/E2KiZ9GzPQ=
X-Google-Smtp-Source: 
 AMsMyM5/RsVzPqvaNNzQdfNVLVL95d3v9q7zQa02V23o42W62gMCqBQGC6nFQcMSlA2GrhUh2bCxWA==
X-Received: by 2002:a05:6000:15cf:b0:228:45fb:110e with SMTP id
 y15-20020a05600015cf00b0022845fb110emr21295791wry.709.1664399918422;
        Wed, 28 Sep 2022 14:18:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q16-20020adfcd90000000b0022cbf4cda62sm5504537wrj.27.2022.09.28.14.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:18:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] scripts/oe-setup-builddir: do not read TEMPLATECONF from
 templateconf.cfg
Date: Wed, 28 Sep 2022 23:18:32 +0200
Message-Id: <20220928211832.576609-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 21:18:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171154

Also, write to it only if it does not already exist.

As discussed here[1], reading from templateconf.cfg serves no purpose:
it exists only if the build directory has already been initialized, and so
the scripts will not change anything in the build directory anyway.

My adjustment is to keep the file however; it is useful as a pointer
to the original template, which can be utilized by config management
tools in the future.

[1] https://lists.openembedded.org/g/openembedded-architecture/topic/template_handling_in_oe_core/93968540

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index e3c8c6d437..3a91bbf5b1 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -34,16 +34,6 @@ chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDD
 
 cd "$BUILDDIR" || die "Failed to change directory to $BUILDDIR!"
 
-if [ -z "$TEMPLATECONF" ] && [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
-    # The following two are no longer valid; unsetting them will automatically get them replaced
-    # with correct ones.
-    if [ "$TEMPLATECONF" = meta/conf ] || [ "$TEMPLATECONF" = meta-poky/conf ]; then
-        unset TEMPLATECONF
-        rm "$BUILDDIR/conf/templateconf.cfg"
-    fi
-fi
-
 . "$OEROOT/.templateconf"
 
 # Keep the original TEMPLATECONF before possibly prefixing it with $OEROOT below.
@@ -132,4 +122,6 @@ fi
 [ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
 unset OECORENOTESCONF
 
-echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
+if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
+  echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
+fi
-- 
2.30.2


