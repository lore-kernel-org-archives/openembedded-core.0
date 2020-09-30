Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.6583.1601504125293730314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dCkixsab;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 34so2100767pgo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=46Zj88CfrxKg1pVcDxqJ84vvfg2xnKdqnN8P+xWJITI=;
        b=dCkixsab+CHc7d7VeKZCMa/bJZMcgVvfdIquYFi5hUQ+JbucU7BPQ+gTNvbyZpZMRh
         R73QG24N+8AcW6Kmkg4AUEb5inrVyQ43ewYcHOBJxfBj9iJ/Dh8OxyYObucRnQRg/Saz
         M4LJaKtWeGmaQHO55RoKNj+Mgn/lHO9AzrdmUOfXHLt2hYl9XZH76RGmCobVlWO3mwsK
         aN88iZ6JAd8kUbtcw3zEY7K7iLoMWxjRW2iLNKmelNz0HVLra/Su7ZP7fcRB0RfUfsAq
         iO28upyRG8r+wVPD4bCB3YYaB/xPGpqpT3EgF7a8OUYxVRHaupQwyo+iCyVcCrVXix1F
         AO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=46Zj88CfrxKg1pVcDxqJ84vvfg2xnKdqnN8P+xWJITI=;
        b=Rjy/ojgVIyN4go/O8/A41ZfWlTCfPBNn1bQWVqLWpMbZ9RGF7vvv1+AAXqwqhrbVT5
         eO+2C8U1IkKZCVht+9VB6ZAgCXZLfZExNL2C5cuFdgL0gqAArA/hy61B3tZ84Js0ov7g
         qU7x5Xzu1CrlmsNGH63wTNrqxsT1MYhDqWi7MHOyiUBL6y3wWQX035UInO82Kv1+clcl
         YhOA6VeocBuWAYfBB33uc61ySMjOhFaFbnw0o8co+EtPq4H3ykpqc4jI7y3eDG3/8tg9
         1YXOT82H+FoCxSvrdu+mMokqnRWWgtZGVlt4RxJFFfIabVddXPmKXT+EsHVptm8nVcW+
         1mxQ==
X-Gm-Message-State: AOAM5314gm0JRFpa0mJ+gh9X5YJp4jqRK5Ah6i5tijUlr/ezDoDoOshI
	UmDAlbDw5BThUMklZyQF/SW9eb1Qarit02VVaYE=
X-Google-Smtp-Source: ABdhPJwFuA/ZvatQau7pUUfKEgkBhNjicKXuEXfImkN1vmQc8flbOUiQlbcMwj/4c2SSu0gbb3c0kA==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:6525 with SMTP id x124-20020a627c820000b029013c16116525mr4178652pfc.5.1601504124419;
        Wed, 30 Sep 2020 15:15:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/41] sstate.bbclass: Check file ownership before doing 'touch -a'
Date: Wed, 30 Sep 2020 12:11:34 -1000
Message-Id: <8e7bb01564d5b06bcbda402cf4d29d7a0ff170c5.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Norman Stetter <norman.stetter@garz-fricke.com>

In contrast to 'touching' a file without parameters 'touch -a' can only be
performed by the file owner. In case of a shared sstate-cache served
locally (e.g. over NFS),  where the user running bitbake is not the
owner of sstate-cache files, even if he has write access on group level,
the sstate_unpack_package task will fail.
Checking if the file is owned by the user before attempting to run
'touch -a' on it solves this.

Signed-off-by: Norman Stetter <norman.stetter@garz-fricke.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1554e8bd40c640fd58daac18ecf7b458e754109)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 375196ef21..66a96a7603 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -847,7 +847,7 @@ python sstate_report_unihash() {
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror
-	[ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
+	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
 	# Use "! -w ||" to return true for read only files
 	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
 	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-- 
2.17.1

