Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8823C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:06:58 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.12948.1706018817658088203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ufLRY5ST;
 spf=pass (domain: baylibre.com, ip: 209.85.208.180, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cddb2c2b54so43064451fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706018815; x=1706623615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39Mj3J8NiAGnFD5+wIVjybr9VmHKjpe5br1DegH/4zw=;
        b=ufLRY5STXpKLAwTl4j5FIJohSgYKT4uSaXhFXiBd+rFcIeX4DV50D+RBSE1CchzVOG
         +XFQlHz6qzzNCspmTmTRdsK0ZH8KIMb7qENJUx+NUkQl8BtH14Wucdi1ukLSDInyjN6+
         EKfrTV5jl4mOGZMikCKCAP9jmr4xXh2S+IQwp0VqXtumMnTVSCGUU4pDBVtn00GXtrA0
         xsjiaLGodq+3jwdvHE1hvSDmBW74vwJzu8kZ56zGpMDQTajaLaTRGo7NwzgFn/xeY0i3
         r/XDhI1+gqhcRcj2oMA56Lekp8zswV1ONY2lAZ0bBd88gzWMCBCVZeajXdr+bSXFROpm
         2FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018815; x=1706623615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39Mj3J8NiAGnFD5+wIVjybr9VmHKjpe5br1DegH/4zw=;
        b=AKPoz/OxbI9/+gfmmnCCl+3p5Yv85A/Oxr1R/rIfe2N5MxxYU+rQh3AwxonxRX5B/K
         Ii3OzUMPPlH7qqFFe1RxgiqIprk8pl/Nh//yQtYMzjIytu9PS1ZE18wb3vFFudTdf5qy
         UUfkIe9tlk8ZHnGLYNH0GWq6JKKBImWBeBmhdn7mkLJ+gaNvT7+QwatMxLUVa9patJeM
         4dr2yRwFkCo2zJ/XtDCAd8uVLOkTW+9xCo976B+c2ZD+nqotLnpAySIhA+CI0INOy55D
         0BlJs/9VZSQKeV1YkrO/r7STXvZaGcQ0dY6MYxYnxS9DMvejb9PC+eWNHg2VEJ4Q5EIQ
         R7CQ==
X-Gm-Message-State: AOJu0Yz7UrMctgCpoQxdewYT4hcc9/4jFmfD2kfZoM4soA2R1xfNB1iO
	MlA41enABDgghA8P7FWg+AtDpUGfe8rYg3hR9wSOoZZpu+36hp2GULFod/OgWNFa3ulpqhgrqRO
	m7HM=
X-Google-Smtp-Source: AGHT+IHKRMfgaTlnl2cuBx7k5uhUsCJo2kWPmac7NAxbw1ZPTT7XNcZ9fUI4vo4T/HbXhr/T09eFqA==
X-Received: by 2002:a2e:300c:0:b0:2cc:8735:5532 with SMTP id w12-20020a2e300c000000b002cc87355532mr2584739ljw.59.1706018814778;
        Tue, 23 Jan 2024 06:06:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b00337d6aa3912sm12998447wrp.10.2024.01.23.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:06:53 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 1/3] externalsrc: fix task dependency for do_populate_lic
Date: Tue, 23 Jan 2024 15:06:49 +0100
Message-ID: <20240123140651.930307-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123140651.930307-1-jstephan@baylibre.com>
References: <20240123140651.930307-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194238

do_populate_lic dependencies are defined inside license.bbclass such as:

  addtask populate_lic after do_patch before do_build

but externalsrc deletes the do_patch task, so the only dependency left for
do_populate_lic is "before do_build"

On a devtool context, when doing devtool modify, sources are extracted inside
build/workspace/sources/${BPN}/ and local files inside
build/workspace/sources/${BPN}/oe-local-files

When building the recipe after a devtool modify, do_unpack is called again to
unpack (possibly modified) local files from
build/workspace/sources/${BPN}/oe-local-files into ${WORKDIR}.

Since the only left dependency for do_populate_lic is do_build, the
do_populate_lic can be called BEFORE do_unpack. Most of the time this is not a
problem, because license files are generally located inside ${S}, which
corresponds to build/workspace/sources/${BPN} (and is already unpacked),
but this can lead to an issue if recipe sets LIC_FILES_CHKSUM to look for
files in ${WORKDIR} (example from init-ifupdown_1.0.bb):

  LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"

So devtool modify init-ifupdown && bitbake init-ifupdown gives the following
error:

  WARNING: init-ifupdown-1.0-r0 do_populate_lic: Could not copy license file <...>/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0/copyright to <...>/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0/license-destdir/qemux86_64/init-ifupdown/copyright: [Errno 2] No such file or directory: '<...>/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0/copyright'
  ERROR: init-ifupdown-1.0-r0 do_populate_lic: QA Issue: init-ifupdown: LIC_FILES_CHKSUM points to an invalid file: <...>/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0/copyright [license-checksum]
  ERROR: init-ifupdown-1.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
  ERROR: Logfile of failure stored in: <...>/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0/temp/log.do_populate_lic.838584
  ERROR: Task (<...>/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:do_populate_lic) failed with exit code '1'

Fix this by forcing the do_populate_lic task to run after do_unpack

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index a54f316aa0a..70e27a8d351 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -104,6 +104,7 @@ python () {
         # If we deltask do_patch, there's no dependency to ensure do_unpack gets run, so add one
         # Note that we cannot use d.appendVarFlag() here because deps is expected to be a list object, not a string
         d.setVarFlag('do_configure', 'deps', (d.getVarFlag('do_configure', 'deps', False) or []) + ['do_unpack'])
+        d.setVarFlag('do_populate_lic', 'deps', (d.getVarFlag('do_populate_lic', 'deps', False) or []) + ['do_unpack'])
 
         for task in d.getVar("SRCTREECOVEREDTASKS").split():
             if local_srcuri and task in fetch_tasks:
-- 
2.43.0


