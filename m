Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40A8C61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18285.1787652441718470520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QclSr3dn;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1707453f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652440; x=1788257240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IX3x/QEoev3p98aTF9AxHVSWjGME4MgvRZA8po6mNbI=;
        b=QclSr3dnwGKedVjvm7NGVV2oiQl0TeCTAvWh0En6X29PNJt1brnKlXUrNhcAcbJIxv
         7bUFJ/VyhIIlKWtmRkynwXvGbUYg5PsTnZnk1XXRs2Uo+v3Q3/+qxPvdO0rYxj676gyz
         dIBvakTj+oLlhLmDSP8KcbuTGFn38IspUZgh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652440; x=1788257240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IX3x/QEoev3p98aTF9AxHVSWjGME4MgvRZA8po6mNbI=;
        b=bm/XRFOaPnekus4NwxVLMQgqGc9ffV7ZGkUJFnYk9SvD91ReimDOwA4CDmJ7eTUjIv
         XnQo+M5OjPzauZaxY3pnoQAJRVx5tjQ0qoPqy4bFjdxu3nLdWhsII2A8D/0aPpaOaMod
         aAvl9FyRMWNw89lt8rZUMOVpqE83x1N7WhQpMgBBudJZpw8hDUGDERpopQxEtGU7yOXX
         Y89tGpIaR8EFKVwHf3Fs4qe8MqEgXoPaWoAJzZ2lYA6ra2BVb+qmU8AYaH7ZTP4TkE6v
         rOpM+VXF5OsdQh83S+iE7Kojaic8beuImHhCSDTMN7/r+awAiUZO5Wr6LG0bZ7Z+QsfA
         +CBw==
X-Gm-Message-State: AFuF++nI3qsItNGav8iQvDuqH1zhyyGKpev0a7Ub6LMV+4vnFqjL4Xi0
	T4Y/fwlCkCBTmBveHFVnDeeggSWtP0p+VQIr5/dbf5GzD2CGOsYIH8Bl14flwi9r0bty/jr5RQK
	MN7gK9PA=
X-Gm-Gg: AR+sD11r//MUm7/IsDMO57fNAQDXNcINbm++4T9SZc+Bdl/6turEMajUrx1/IwDe8ha
	2Tcx1LsINyYuE/d9aqSXZ2Lz9HXiu4v6parG/CyELdkqZ6/JlXE9x3UQa9hMid/8Lj+fjaKNnKA
	aVtlZlMV1rxxcT5Y2rvSoQQUPLTlpJZV6KP7Zaw5bG+9BR0fUEgw90gqDOEoGsAAOaRlZ87o3dk
	w0xlPjgNbibf2/x2L0ElCBa4c5yVnCj5vTPpv6MLK/QLYGz0hcFOV/WSxXbKRP726bWYe+MAcAF
	f/zsWq5RpgRnyprXvJP0ywIu3K2Ubx75boeOI8jz/59t3FHmV6azTsgIhKkT+PV9zmyL6gfNZaR
	aWR1ZQB8Za0ynHVpZ0R+HACG1in61sZRaMV30rHTPXKPgbB3uNlkPnZ7QGG48+L92SjZDa0akeq
	obrgtrPf6PaaY4CN0gFh/xmPFUmHi124ZR8FL6AMOCMQPnA0RGyndfjdlWSAJBEsLpoRjt/LMRP
	KK4nubVAT62KbP3BIMmMxN1PBCRgUjHoIzihauh5eL6AofkdNaIwwa7rF4fuAOjGKDWHLzTwqeX
	hGIuKg==
X-Received: by 2002:a5d:64c8:0:b0:47f:83ee:e56f with SMTP id ffacd0b85a97d-482c81ca417mr29938896f8f.18.1787652439834;
        Tue, 25 Aug 2026 03:07:19 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] bitbake.conf: add TMPDIR to GIT_CEILING_DIRECTORIES
Date: Tue, 25 Aug 2026 12:06:47 +0200
Message-ID: <b2258129ecabc6a85fe9dc48f580e881d27a68c0.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244223

From: Ross Burton <ross.burton@arm.com>

We export GIT_CEILING_DIRECTORIES=WORKDIR to ensure that git calls
inside the builds don't find oe-core when they're meant to be looking
for the git repository of the source code.

However, this breaks for recipes that use work-shared (such as llvm), as
their working directory is outside of WORKDIR.

Solve this by adding TMPDIR to the list as a final catch, but keeping
WORKDIR first so that git will stop sooner in the general case.

This solves reproduciblity problems in LLVM, where for example lld's
version string would contain the URL and commit hash of the poky repo
being built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f42f0185bd00e68ecc86a930487f21fc86214cfa)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
[fatho: edit commit message by adding "cherry picked from"]
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e20b17fad6f..3fd442edbdd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -786,9 +786,9 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
-# Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
-# repository when building a recipe
-export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
+# Don't allow git to chdir up past WORKDIR or TMPDIR so that it doesn't detect the OE
+# repository when building a recipe.
+export GIT_CEILING_DIRECTORIES = "${WORKDIR}:${TMPDIR}"
 
 ###
 ### Config file processing

