Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB376CCA485
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:32 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.28165.1658155823353833355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7YwFXrQ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id o18so10789462pgu.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VVmXVmDmSapcmUT6HNLAeqDI5v2qBW+iP2pMmyLKmBY=;
        b=7YwFXrQ6llpf8sRVfb617qN3eZuW/AdUTbeJjspCtbThR/vxNQeK56ZP5HPDhgvw5P
         yLAe4Pk0G6qDB8LgWN2uyV03ykMmiy5jNalcLwG9wL6d+Uvc2+91Lf35IES+Gn0LBjn3
         4enxBBGR6p8hRUqYovqbdVH4T43zZL/3MP7U4WlAuchnkds9PD3eBVNcjCdmHrmWpRf8
         gyUIXmVOoQY3U6CR5Y5+pAy/V4aukVqadSK4RJSMS+oFJX4o30WdkWhe9EJAIRViG5ge
         J2o8BZlWDJik39bieN4Cb2UcQPqU80SayzMvrQBTvcWNOGCK0FyEzK23fSQExa4gMt9j
         OvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VVmXVmDmSapcmUT6HNLAeqDI5v2qBW+iP2pMmyLKmBY=;
        b=cLICTgDzUu0NkljgSICMOXVfP/CXzO1at+o7ZFTKagpIWiwYcMFiKNVBPKHvIo7KFq
         0NiBFM8OM1D9+qTbgaY19MGtVkUyK//a0wEiH0se+Dsv1xeGg6CnvJXLMo0kR6IGYyR9
         Ok2jsMOFXRHZWHntjWyYdEDfio3oj7ZOEv+DEfvk7lln4huJ3t/oVcVBMVvur+DbibUX
         uJYRjOAg1lhuMCeOqF+fY7JnG0MfSEWtX/TaZv5Yj3C5MAT2k+O7TobZvYqnmtOfdAk0
         FWOFSr2WRPQhv3YizWTHc+J0LXb1liYQ99aQi9FFV9vNEBmvo7BNC+uxZLk5yhAOf0oL
         qPQg==
X-Gm-Message-State: AJIora+rJotx2647JrBBknycJC+W+eslBQnmo0IUKDNgBVFG761SYfpP
	6MXUjGw98lija0tUVVRsPeaFL6B2SIakLVpr
X-Google-Smtp-Source: 
 AGRyM1t7EALDfwilZsB75PCe/b2DKsgSwKbBEB7lMdDSSp3pvPL8l4TePFu66O4GFjvM1UC8Q3CCZg==
X-Received: by 2002:aa7:991a:0:b0:52a:c5df:e17f with SMTP id
 z26-20020aa7991a000000b0052ac5dfe17fmr28518868pff.52.1658155822305;
        Mon, 18 Jul 2022 07:50:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/35] perl: don't install Makefile.old into
 perl-ptest
Date: Mon, 18 Jul 2022 04:48:47 -1000
Message-Id: 
 <d6ec3784c530714182a1cf1ac693ca35ef0b4f57.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168222

From: Ross Burton <ross.burton@arm.com>

We already exclude Makefile, makefile, and makefile.old from copy of the
perl source tree that is used by perl-ptest, but Makefile.old is not
being excluded.  In a rebuild of perl with an existing source tree these
files now exist but have build paths in. As they're backup files, they
can just be excluded from the packages.

Use range globs to clean up the expressions, and exclude Makefile.old.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30a99affca7930f7fe0ddeb016b6183240b5f13c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 54c7807571..c233fab545 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -10,12 +10,12 @@ do_install_ptest () {
 	sed -e "s:\/usr\/local:${bindir}:g" -i cpan/version/t/*
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
-	tar -c --exclude=try --exclude=a.out --exclude='*.o' --exclude=libperl.so* --exclude=Makefile --exclude=makefile --exclude=hostperl \
+	tar -c --exclude=try --exclude=a.out --exclude='*.o' --exclude=libperl.so* --exclude=[Mm]akefile --exclude=hostperl \
 	    --exclude=cygwin --exclude=os2 --exclude=djgpp --exclude=qnx --exclude=symbian --exclude=haiku \
 	    --exclude=vms --exclude=vos --exclude=NetWare --exclude=amigaos4  --exclude=buildcustomize.pl \
 	    --exclude='win32/config.*' --exclude=plan9 --exclude=README.plan9 --exclude=perlplan9.pod --exclude=Configure \
 	    --exclude=veryclean.sh --exclude=realclean.sh  --exclude=getioctlsizes \
-	    --exclude=dl_aix.xs --exclude=sdbm.3 --exclude='cflags.SH' --exclude=makefile.old \
+	    --exclude=dl_aix.xs --exclude=sdbm.3 --exclude='cflags.SH' --exclude=[Mm]akefile.old \
 		--exclude=miniperl --exclude=generate_uudmap --exclude=patches --exclude='config.log' * | ( cd ${D}${PTEST_PATH} && tar -x )
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
-- 
2.25.1


