Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6813DC32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:38 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.4531.1661294171833207652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=X0CXvO6x;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id v4so13442175pgi.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ZeZ4eXPjAJE8SrB7FbPF0zjAPQr5+v6nvvj1lBr39gc=;
        b=X0CXvO6x8isnWoSTPi4C/jln5Y6/a0VZeQvDoL3GvSaBQ08Ibwe/PJbatDKfcOdMpf
         tMkHm0WPKHYbWZWEAuJc+Qzlpbo0u02k1lGFyc4bXuuoo5tqFn41uNLSUTsWfZ6K2nNK
         G6AAdhU0xbY/WPFFrufML6OxACRdJsWZ7PXfekHLAJzUF2Bkskyz+0SxkScGqTgL6ZJd
         sfl4eQOWuEHBIO4nR3eeNvTzMFO0AQSI6GxRqLCNdMRvff4+8JqbXrlQwUp6cWqiA5JH
         9BuboQrpE53orPemAGMpHjy9J6P2nJRzNRpyp2J5wUDSV9KasZEs8kvnEgaSDEEzxiZh
         TLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ZeZ4eXPjAJE8SrB7FbPF0zjAPQr5+v6nvvj1lBr39gc=;
        b=u0sTXNGQrMESwBYdrQy0Dsyy+mZK1pzBzUPrMiuXdVZjWSWEx6BMxH+4CaxzqryjyA
         B/VINj5cHoUuRsPQyPKMw2orcmHtoHhtofsns0Fl1EhxZ17dZo9zgiISCDyzsdix6it5
         8pv9lZYsSR/hP8sNigwgrsJDKQC8NCXosfQc1alLeu809xh9p9ZBMcbEMDQQ6bJAnf5W
         OhfeTGVFFTBhtOrKY+wCtKjJYvM/mX0hPS5OIeVOXJlLvvKFAzv4poNx/fzTBMtthJNK
         TP8EzpPKjwLhcIEietJgVFEx34axm4L/XhlzcyBc6zAG8UqVTzvsoRgbodHl4E+hRVAr
         NCjg==
X-Gm-Message-State: ACgBeo1tuzttI0om3h05eKHj2mWyNxwO3dFyQoYBifiRWWtRjmugT/rs
	+UGdkmIyWFGMOZxbYP8NXUmHbky8nczU+ho9
X-Google-Smtp-Source: 
 AA6agR6yVYcLpxpF9FdTKj4xEnkGfThGWxc7waSi0GnPgzt/LHBj11DnwRiO409uIMcUUyQAHofIgQ==
X-Received: by 2002:a63:1857:0:b0:41c:4217:426e with SMTP id
 23-20020a631857000000b0041c4217426emr21917635pgy.285.1661294195873;
        Tue, 23 Aug 2022 15:36:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/28] perf: Fix reproducibility issues with 5.19
 onwards
Date: Tue, 23 Aug 2022 12:35:35 -1000
Message-Id: 
 <6d1bedab94e5ffa1b6fefcf181b09fcf4127bdc7.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169755

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In 5.19 onwards the build process changed and encoded full build paths
into the output. Adapt the code to look more like our setuptools class
calls. This seems to work ok with older kernels too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 138673f833a72c636a7fa185089f25dda350dc54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 95e7eae9fe..95b4362958 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -203,7 +203,7 @@ do_configure:prepend () {
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/Makefile.perf
-        sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
+        sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(PYTHON_SITEPACKAGES_DIR)' --root='\$(DESTDIR)',g" \
             ${S}/tools/perf/Makefile.perf
         # backport https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
         sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
-- 
2.25.1


