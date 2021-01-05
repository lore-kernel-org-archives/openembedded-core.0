Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.5876.1609856685091729091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VtFZGOZw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id be12so16451081plb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jOi0jAwIYCX3zcwlyN1xRPrGwXnXeZHhop/4rg3un2s=;
        b=VtFZGOZwqRRShM3yLYoVbgy1ZydnJu/WdkvFq4G0UYK3CgNWql7g/YStVad2sIlMnV
         M1vWk4WhtSLuxbIQQ2AbAQvCOzpBaTL60npOM+p0YC8lkb+k9SRiOWPpmU58JHHxtzGK
         0zuyoIIS9JZ4sS9ZmlhmOOoLLs1aBGgUb9hxwH7bGEnb3+9SL/wnmIKNifGf8iM3mhvy
         QgXoKeUSXs8mE+x3Nsyiv9Z988//9yGLYAAqKe1HywLw652D8PsRZL1/KDI2BgrYQIFc
         bPxlGzuBkcf58s6gfD5O24juoW99lwKoeroy55yc32Nh2Jea0eyE0brgsmrPdh5KTrRE
         FFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jOi0jAwIYCX3zcwlyN1xRPrGwXnXeZHhop/4rg3un2s=;
        b=KyXHVTB7zHoYwDoKMLYVy7aFMwDjxtpJl85hsvk5jT71XqbS1EUE6ulMR96B/WuFsJ
         Zl2N6Zg9HJ+3CldeVDRWSzGYoB6UZpxKNzSTrSN59rKPP4so4n65KxIyPBbfyA129GlY
         39ufUp7IUvjnyxoFIuxFVFMhc2kflvCJFrNU76RTkK5OFF7UsY8OPQKnK3xKiPpM7B0S
         gv0vVMPoyBCapqybd4q3hZfigkPQSeQ0nIXJnv1MCq2Ivllp3Djg9dL8fXEKl+sqNFR4
         d/1QuYMyMyuhuqj08mzDIZMFSf41e/bqtA2G9q3nXS+pE9BlylTBcLB39msPavY8m+BA
         Obag==
X-Gm-Message-State: AOAM530Bs5lWR7m8YQ8f9HsDzsoR6D63fYSA9t6JHG70frYBhZAtSaP7
	c7FKLYe/lYd3WuzykObJCdVwxfjd4Fcc9IJQkfM=
X-Google-Smtp-Source: ABdhPJykTHdD+RcUb3eoV8qe0iBAghgIp0TmXV09vempNRyBK2tOJo6YK3BtScnMLnJSyYlJP4Wmqw==
X-Received: by 2002:a17:902:7d84:b029:db:feae:425e with SMTP id a4-20020a1709027d84b02900dbfeae425emr76850118plm.43.1609856684256;
        Tue, 05 Jan 2021 06:24:44 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/30] archiver.bbclass: Fix --runall=deploy_archives for images
Date: Tue,  5 Jan 2021 04:23:32 -1000
Message-Id: <1625481cdfc6560bc8e49aea7f7e9175cbaaa15e.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
INHERIT += "archiver"
COPYLEFT_LICENSE_INCLUDE = "*"

$ bitbake core-image-minimal --runall=deploy_archives
[snip]
KeyError: '/path/to/meta/recipes-core/images/core-image-minimal.bb:do_ar_original'
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59785a51110c450c7629218f6042f1d9d309618e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 1a3c190604..990f1d4674 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -591,6 +591,7 @@ addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives
 do_build[recrdeptask] += "do_deploy_archives"
+do_rootfs[recrdeptask] += "do_deploy_archives"
 do_populate_sdk[recrdeptask] += "do_deploy_archives"
 
 python () {
-- 
2.17.1

