Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BF8C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:28 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.140908.1698632480179455510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wTw9qO+3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6b44befac59so3540035b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632479; x=1699237279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgN7aMvjuK1Z+T0XrmrNA5T3m5yp1O+b9vwsN6shfuk=;
        b=wTw9qO+3AopbxHxJ9SPYsGsE7IlVAI/1BEZU++8d1Rrh5Qmu2Mit7Gk+Q99aK+bihW
         GeqgGlQ7Jwji4z/XQ/RPWqIljblFCwEJn4wPxqVFryjyiASK/dbS0v1J1leIJhtyWAfS
         AcGS6zBOACnOHtnbo2JQRh5Wvdn4DEjtazuNcYXdbXj4Aj2kPvZFLmxJviWnkrBvYQy6
         JY+ilqO/WGKlqXRKE8pleELoqTpB/YFIGAZr9uLIw0Xbd0faTKT4hKeQFjJHiZynpp4B
         06tARcgZP3Z0YnglTpEZJi2fbnFiM3kcrIyOmNnswxJOr0wIQQB3fyelDzwQHwBr71eg
         wgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632479; x=1699237279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgN7aMvjuK1Z+T0XrmrNA5T3m5yp1O+b9vwsN6shfuk=;
        b=iSsnMc5/wk+6C58cWN0hqqT0ax5PuVW7SWvlDhgL/e3NCgXuINfxdMovap9lOsQGmR
         P+yGN58aIJSoPlG8RfLWmrcDUv1/H/MS5PnBmti46HwuVXKlmIEACGnhAOb6VK6gB329
         tddUS2f6DHAYere3MEF2sBdfSXjCYfczegzfcRRPhXgTzTHnGrlQmXYpLJkXARCe+20N
         B7ldgZxs1PwY1MjtV/7fV3D5WFnGpeIZF8Yoa4MxeBTxtJ9SuG3lE1XA5ScrA0/30rRf
         2zPkY6bj7ab2jeEAHtPRS5p7c5Bq+qCvKQotz66lyw+5b6vohkD5/vGrHzsWf4vzHo/a
         cTqQ==
X-Gm-Message-State: AOJu0Yy8SiXBANvtac3EvwKRc7zcz20Prb9OyL7Vt7ygxS6gBLja0oAF
	33Qgaxbjfsfp0PzF8LJfzeOLOCKIkzIuHfK0LG30cQ==
X-Google-Smtp-Source: AGHT+IGyfAk5pB8+0DYfMn9FF1ckm+cFGAphGjZd/HtDzNFFd2Xif1ljr9+c/HIs2ACzJhepNZNcGQ==
X-Received: by 2002:a05:6a20:e11d:b0:158:143d:e215 with SMTP id kr29-20020a056a20e11d00b00158143de215mr15671876pzb.1.1698632479284;
        Sun, 29 Oct 2023 19:21:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] package_rpm: Allow compression mode override
Date: Sun, 29 Oct 2023 16:20:56 -1000
Message-Id: <ad4ea9f225b0dd6396088cc70b34f886c5fa62b4.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698632320.git.steve@sakoman.com>
References: <cover.1698632320.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189785

From: Niko Mauno <niko.mauno@vaisala.com>

Commit 4a4d5f78a6962dda5f63e9891825c80a8a87bf66 ("package_rpm: use zstd
instead of xz") changed the rpm package compressor from 'xz' to 'zstd'
which results in decompression failure with BusyBox-provided 'rpm2cpio'
applet and 'rpm' applet when given the '-i' (Install package) option:

  rpm2cpio: no gzip/bzip2/xz magic

Introduce a variable which makes it possible to use a different
compression mode, making it possible to override the default value for
example like

  RPMBUILD_COMPMODE = "${@'w6T%d.xzdio' % int(d.getVar('XZ_THREADS'))}"

to enable rpm decompression without including the full rpm package in
the resulting root filesystem.

(From OE-Core rev: a40d9258148e28cbee2168c93179cd4c1232fb62)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_rpm.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index bbbef3793f..f403af5343 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM="rpm"
 RPMBUILD="rpmbuild"
+RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
@@ -652,6 +653,7 @@ python do_package_rpm () {
 
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
+    rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
     targetsys = d.getVar('TARGET_SYS')
     targetvendor = d.getVar('HOST_VENDOR')
 
@@ -678,8 +680,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
-    cmd = cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
-    cmd = cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
+    cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
+    cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
-- 
2.34.1


