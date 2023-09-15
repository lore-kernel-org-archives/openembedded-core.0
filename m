Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C151AEED60E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:15 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.23124.1694791331662434575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P/6U3KFr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-573e67cc6eeso1781753a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791331; x=1695396131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L41TuZ7o3nzCpD7sP+XfQDRSK68DXwDBksUA20+Aths=;
        b=P/6U3KFrNHaDH/dOiZCYfbzXvmk3sbFOxDnOi4u0dsj+d5EzuJglRN2yCABUG1hTWZ
         IfD3oSPLmc4Xcst6l5B210q0Oipeb5QFqAYObSYckHJYEz1boiAiWzY/ljhQBWEqD1WB
         ehblpNjB46PkH/u/0z59XadizuVl18OXF8dxCLtZP3Vq+GH2rzkbU+h56GHvTwVxthR6
         8hZHnhG6/cFz55aFdMVqwY8kuogYnb24Y4RXYGeDqmcE1wdu63I8KUnx9U2BNWuaW/co
         RdBPN1wX5VAHuVtJKNZpCZa+99TylEITOfZjnmxXUwuKYLM7Ukrzx88CAXWyzdCPAViA
         Gc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791331; x=1695396131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L41TuZ7o3nzCpD7sP+XfQDRSK68DXwDBksUA20+Aths=;
        b=NLOC8pGlyZsxsexstYtTstx0npp44pkq5uhRw1N9dV4tSTtP47x6LeFesnPLJ53pDU
         +14G9YRCDWGtSeEBdAo+7wF4PQN98VIUBa5E5AySilFld3z1FRkvgTbh0eRCAp54tV/C
         EcObQJFj7CZOb+P97OY+GDMaOFJ9AaqCSFgeG1Q5+sX4D0ZreQRSYaRIB09FBFLzF08P
         +34huC2ytNW1rsXpt0Dcp3chs357mja7rPiCJHsSkdUOwhYWy1l8pKT2XGd5Snu2QKjK
         n76RNVFafzt5Vu0mDnQWtRX4/xEk8KdBOrDT0xbBhatCSLhgwHhCVOlrykUFxwbUBw4R
         WWwQ==
X-Gm-Message-State: AOJu0YwG+//p/11y7+1HooLN/+1RnJn5iUULl4hy8MiqubdNaswTV4ba
	EtWvkpzU8ylhTyupHEsw0nn5NEAsCuyiiunSFDQ=
X-Google-Smtp-Source: AGHT+IHs4uI6L1Ymq4OzismpLJ7zuuFJO1+hBUHPMd70G1NMXlhWe7b2n3NckgTRCHLARECfp8J8rg==
X-Received: by 2002:a17:90a:6e04:b0:268:1b60:5031 with SMTP id b4-20020a17090a6e0400b002681b605031mr1813806pjk.12.1694791330722;
        Fri, 15 Sep 2023 08:22:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:22:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 6/8] vim: upgrade 9.0.1592 -> 9.0.1664
Date: Fri, 15 Sep 2023 05:21:44 -1000
Message-Id: <f979cf5aa35e608403272cb640bf979a9fd2631b.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187674

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-3896
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling with 'smoothscroll' set

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a1ab744142c9229f03a359b45e5e89a1fbae0d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 83ab9ea5de..8a399cd802 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1592"
-SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
+PV .= ".1664"
+SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


