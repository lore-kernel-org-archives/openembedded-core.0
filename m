Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E77EC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 23:32:04 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.4968.1635204723641543416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OmrW29tE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id v20so8993553plo.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k/Yeolmbdkn8jT74HQeC9TCpOo1Vu/66LVKgnrlnGRM=;
        b=OmrW29tEu0trM/hekTXxKqLrTeNpe9fD4gHfNnNriqcrpxPcfsAjVkaJQdtpG4ZTdj
         WF6LI0t19NIYqsuL/NBbTpKJV5auZHrSpYxR2k7bcDZdMG0ROMs0Zg/SXUs0a/6CIChi
         TuOctDJSVI49cRlWD+L9QKvKxDG3Flzu1ahdVX5HAD+Fz9Z7odnei264DSkSUOwyRSDh
         hO4u2eX09ASAAdFdtv539u9RHorHs3B+dSwKhPWNoc1jVMsQi412oiJd8tAFfWLW5xJ3
         D8JoFHpsasQErUrpAklwCsmWHueU7a923x0PvnmnZbP6R5G2bmLtsZHLYdvBf/pV4XZh
         ymjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k/Yeolmbdkn8jT74HQeC9TCpOo1Vu/66LVKgnrlnGRM=;
        b=XaSD2u3n6H95tF4oEt2rqdSfdOGiC2kGkjSq0p20CXMr5ER/qnZ+ehU51D58q7rjit
         VDlky5HNSQgGY6qRNitcLa5TPxRNeiqNzOzQFS9vYuhIfZG6cwfC/dp9kpAZSlZ4IHAa
         5JawnfbjzFSrBhu2kLqBINZBSh3QV2kClk0nAS5fBOb2Lj/DxmCaAC/LeMlK46HlIJUc
         peja9+7bmb89uPp14rFBypPGf61va0fMc/7QKMLUhFO6wr9Z4gdhW+a9qUTkr1+Dsc37
         0tdSGgcAy9r7jhGcmVEvcuHcGkokybXpwWisEVE0PO/SrW38ixjbPy4/a+XTKXRbnSaS
         gi0g==
X-Gm-Message-State: AOAM5305gTZKG9dA7w+pdtI5qfDk8cb+MWHq2rJ5fjedn6hdnmrAfnWA
	aqdV89MCyka6ZeEPO5WCxVFvPFzntF95LkREdF0=
X-Google-Smtp-Source: 
 ABdhPJzuYWjbIF6q/G1LbT5EMMmm/1ecZpHb65XzqCb/rMwhvwmQ9hpQBq4qqLYdk3AkKr633/hqxg==
X-Received: by 2002:a17:903:2c2:b029:101:9c88:d928 with SMTP id
 s2-20020a17090302c2b02901019c88d928mr19308504plk.62.1635204722688;
        Mon, 25 Oct 2021 16:32:02 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm20383990pjt.21.2021.10.25.16.32.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:32:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/4] classes/reproducible_build: Use atomic rename
 for SDE file
Date: Mon, 25 Oct 2021 13:31:44 -1000
Message-Id: 
 <b98d37da1554f524bd5b16287731d7b34945e92d.1635204568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635204568.git.steve@sakoman.com>
References: <cover.1635204568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 23:32:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157371

From: Joshua Watt <JPEWhacker@gmail.com>

If an existing source date epoch file was found during do_unpack, it was
deleted and a new one would be written in its place. This causes a race
with check-before-use code in get_source_date_epoch_value. Resolve the
problem by making do_unpack write the new source date epoch to a
temporary file, then do an atomic rename to ensure it's always present,
and change the check-before-use code to use a EAFP exception instead of
checking for file existence.

[YOCTO #14384]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b5e3b33187bf78a2d62cc886463e4b27d6bd228)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 43cf9dc894..62655c2a5b 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -77,17 +77,16 @@ python create_source_date_epoch_stamp() {
     import oe.reproducible
 
     epochfile = d.getVar('SDE_FILE')
-    # If it exists we need to regenerate as the sources may have changed
-    if os.path.isfile(epochfile):
-        bb.debug(1, "Deleting existing SOURCE_DATE_EPOCH from: %s" % epochfile)
-        os.remove(epochfile)
+    tmp_file = "%s.new" % epochfile
 
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
 
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
-    with open(epochfile, 'w') as f:
+    with open(tmp_file, 'w') as f:
         f.write(str(source_date_epoch))
+
+    os.rename(tmp_file, epochfile)
 }
 
 def get_source_date_epoch_value(d):
@@ -100,7 +99,7 @@ def get_source_date_epoch_value(d):
         bb.debug(1, "Epoch file changed from %s to %s" % (efile, epochfile))
 
     source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-    if os.path.isfile(epochfile):
+    try:
         with open(epochfile, 'r') as f:
             s = f.read()
             try:
@@ -113,7 +112,7 @@ def get_source_date_epoch_value(d):
                 bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
                 source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
         bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
-    else:
+    except FileNotFoundError:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
 
     d.setVar('__CACHED_SOURCE_DATE_EPOCH', (str(source_date_epoch), epochfile))
-- 
2.25.1


