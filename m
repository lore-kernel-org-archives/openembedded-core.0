Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A512C47089
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:33 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.92061.1669557388060462141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wFufl6Nk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id b29so8112657pfp.13
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bcww4m6LwVQId1Jk6/fh1+RhGs1AvZy47VUhQQR/84=;
        b=wFufl6NkfxQY7cfUTRmNm3hQzsvmkpGFHLt/25vlXeD1DjMWGvpez98bz2ZD0vyPGP
         fBOY3ubbH2plWYnUtQOs3mkAb04aM3/i2fZS1fymio94QMruRJNGVs+fXTO/FT9Y3und
         qFJpXphBGLKFMZJUM6rSvgyP2oWh5mMSQHLTTDGVzR2OnEiq5lH08Hv8ukldzlq79NpZ
         h0FRfRq25y5eogXqVkQ4lHDvN0VFP3gVAi4Mm7ELhwWyTtY0OqW+gQcDEbdp4sAJH+FM
         CaZSE4zgLx4D40JSvXW9lNE7vbJ5LX031EaFHN3lQOugqu++Eqfrtd5EyjO2d19CMVNl
         eD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bcww4m6LwVQId1Jk6/fh1+RhGs1AvZy47VUhQQR/84=;
        b=ctcd4yfiQ5jFM16K1XAvFoixfW/nVCf326wgl+zUdmTCrtU3ZUYvpfMeU+La7wwIIe
         bhWcAu7Q84EtgnOVTtt4jW1JQFhAf/wFXbFvX/WPPyrJmQdWDcd4Z4OC80/mWXobzr0k
         TLQHzMVk9ssbfNGzZf3XPKxuOdxid0yvDUWUupYRislcIIbuzDHdMDkSX6kwZcnxka7D
         NPcJyOhu3z1arI0eNPzz6nxu8BjOddjsVR+hYzTvovuSLJtty9Ytrs037OxDKbYBvh3g
         DwOkJr5fJpAsjuNPYxBpzh4x0fXIcc1x/XRfIxgRPAaJyYsAMwOUYptR8/REcCTyep6m
         1eYg==
X-Gm-Message-State: ANoB5plapTmGCdKtNu8k4fL/dH/WQVAczyn/E8tGDSsiFwXrYVEGhAxu
	76IjS1uO80Z76xJcggPX59SecYvBEtWDcFAqLqA=
X-Google-Smtp-Source: AA0mqf4H+Wt8qb/kDZNLt7fBlfBoa64kIHXNkb23o5JRlLwku4HtmaYbDh3nanDu6DMOwuTpAktWDg==
X-Received: by 2002:a63:fc0a:0:b0:434:7885:6ade with SMTP id j10-20020a63fc0a000000b0043478856ademr28285666pgi.243.1669557387110;
        Sun, 27 Nov 2022 05:56:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/31] sanity: Drop data finalize call
Date: Sun, 27 Nov 2022 03:55:14 -1000
Message-Id: <06e088ef6e961f05ca600612adcc71bff91f09be.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173873

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This call was effectively like update_data and no longer did anything
in bitbake. Drop it as it is obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d3eb4531aae28a07cb7e52ed5fe1102445d2effd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f2b2e4dfaf..293e405f62 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -999,13 +999,6 @@ def check_sanity(sanity_data):
     if status.messages != "":
         raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
 
-# Create a copy of the datastore and finalise it to ensure appends and 
-# overrides are set - the datastore has yet to be finalised at ConfigParsed
-def copy_data(e):
-    sanity_data = bb.data.createCopy(e.data)
-    sanity_data.finalize()
-    return sanity_data
-
 addhandler config_reparse_eventhandler
 config_reparse_eventhandler[eventmask] = "bb.event.ConfigParsed"
 python config_reparse_eventhandler() {
@@ -1016,13 +1009,13 @@ addhandler check_sanity_eventhandler
 check_sanity_eventhandler[eventmask] = "bb.event.SanityCheck bb.event.NetworkTest"
 python check_sanity_eventhandler() {
     if bb.event.getName(e) == "SanityCheck":
-        sanity_data = copy_data(e)
+        sanity_data = bb.data.createCopy(e.data)
         check_sanity(sanity_data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
     elif bb.event.getName(e) == "NetworkTest":
-        sanity_data = copy_data(e)
+        sanity_data = bb.data.createCopy(e.data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
-- 
2.25.1


