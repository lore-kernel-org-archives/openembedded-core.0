Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C4EC48BF2
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.18144.1708013923412972350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xcwq0uuR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d953fa3286so8971845ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013923; x=1708618723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1QYW8PxRV0iX7qdqdq2+KshvqAXcsU4lCcYmvBp4YM=;
        b=Xcwq0uuRSSqm4mD2q/MB5l9Eo+0SX1VZ3vVACiAb8mEgANzaNUbNLQ8NnWPS91H8gr
         V0uU8UsQrGFqUIk53AoVwhGQyeZJ/Agg4Tik8GrQBWWSJSTXHHlqXESssOAS4tCWTshR
         pmojPiQWEHGp6qWg4Kbyxk5KOM1Dg2WDpBEvTqHys4W6Baz6gpLaQcX7CQUwpICDRw0j
         1zARc3fVRl7pijHz/ItRA8Xd4VQvGZDH/GGd33xzmBf2cIOZqpGuDrMgOBqIMlaVeepf
         aRnEfET4RxCBHiJ4DVJhL3RNTUA53vSWdurtAn4F0eV7YdwsBLyA6uU/FUJeC8lyZHWA
         xIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013923; x=1708618723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1QYW8PxRV0iX7qdqdq2+KshvqAXcsU4lCcYmvBp4YM=;
        b=LYP9HInj1oLTKC02QdO/zNPYxtafT6BCfJE/gdIs8dizBDpGAsBQKpugR0lon+cqdo
         +/Od0q46+h7SYzqpDYJVcX7DP4ndqhnOu0Rsr4skeOIZt5/NnU8RxYH5t0tCX/DmQlnT
         MEJXhrTaWfeOo1HHNlOoyQ/iFtAX6WVbk3oKnq/Ler95VJfJMgs0+rXOiPPmGhaqQqsp
         QuYAy76kpVUlOGuOmGpNihxyKmxcCwgNGK1lDV8LCG/300DKJHrCVwgfF7gYIOTwZZiq
         X5jSfAt254v73xdi5WqRKgF7ARD+GNKr0eSZeTmiAFhiL/GBorPlM4JFxHJ1QR5lQg5o
         pVkA==
X-Gm-Message-State: AOJu0YyGTwIYRdFk60485sgLxc5z703sfcbaIdHijhNiIGPlpqMVkeoO
	KXpl+kyB6MJZGgd4cSZJ9UTrooAfGBDdFnPxUn1l/3ij5gyGyahw0NiVLWhc/sYTC1QObnpMguM
	IIro=
X-Google-Smtp-Source: AGHT+IHXmyhssvXiVZOzPMVMsw7TH/PRag8YZB00mdD18FU/VcBOTEtjYsCfX87CFyVZfTeC5pJ2xA==
X-Received: by 2002:a17:903:2601:b0:1d9:aa5d:a50 with SMTP id jd1-20020a170903260100b001d9aa5d0a50mr1926538plb.25.1708013922803;
        Thu, 15 Feb 2024 08:18:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 17/21] externalsrc: fix task dependency for do_populate_lic
Date: Thu, 15 Feb 2024 06:18:00 -1000
Message-Id: <bc02b59ca6506d727450512ac2490b8861de59ca.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195537

From: Julien Stephan <jstephan@baylibre.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea6a0cccdd274534809df62a0a196bf83489a1e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index a54f316aa0..70e27a8d35 100644
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
2.34.1


