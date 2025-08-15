Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9709CA0EED
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:16 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.16354.1755276316169551519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i1IzsdPZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so2385111b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276315; x=1755881115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGOUsN2GRdvN1Kcbh3/ImtSRtgscKM513LvFZU42tCw=;
        b=i1IzsdPZHUwoTCZ5MOU88Om0ujvFglGLoSWLQZsOpmcQ9WPrWbaA2dC90gXqw+dxUb
         z+oxDcvNJJ/fPIMSV8VnVNeNIZUYD5qk2EothZEeWJthkoM5fa3y3yrwmRLYhv4pbxkQ
         kLJzddUO6a/WcPUwifkc40zowcHknTYc+FvMI+qfMY77PSm3g9Yj/FAkSUqydz08HISW
         MqqDa8b+rzYDa+DusLZuplbWm/pEynQSXWwt6Lp83fi7JzRrsqFf5aZ7pjNW5Nj3JhVN
         k3g01lTEVNKVi8kU/oMeoRS/4f8gSrLVJTzWTVXIIPeWHsuK9I92CqaNCvyIre2YLVEP
         9ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276315; x=1755881115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGOUsN2GRdvN1Kcbh3/ImtSRtgscKM513LvFZU42tCw=;
        b=tPvgNBU/ZeTHp3ytfWntjkTBRkkiJUr5GQ2UTZdkYiZW6lu0ehHqiw+LtuUIOFouvW
         VHNBMdHA8wmnLYJ9wndFWzWCudAsszjq5tzeRJresuFi6DfEnV6odz+0pj3jUHhFizj6
         /Om4NJqU72LhLbjf45de9S2bm6khQgaSS7WEKELEBRd+qd0Xodf0O/dpgEU6Sp1F9Q1F
         6zkHd3LmHjcEDFYHSZRsXvFqHQ16Oh1GLsAzafjb1mc2SoZ7qqMkU6A3c7QygUcWulZn
         SxUzLzKCpwFwHMKRrNizdZ4qSO3Qr7sN7j1+eI2viJyxxowY1bFp0MZ8ZJuDsOUCDPbx
         pJ9Q==
X-Gm-Message-State: AOJu0YwhRD1mwR8HIex5LC+rYAiz8hAEOuzxm3bQzOjOeLrPy3a5v154
	yuk0+aQT3jFP1zNMPbzoOvKQ90RrizR30e3JfIv3+v+KSfSx7eL3vKDJpKTMeU254gRgzVpzQt9
	2nLkc
X-Gm-Gg: ASbGnctkVXwV03feg3PcXyGMWrHBETPNs8KYIT7dsRjIPuIYsLA0FokvbvizTGVXcXy
	3RUUr3I8bFiErQXQavL0teigs5hLEANPy/vZAl8rEuCAqRxQ1BypjGDBtn3uXwyGPpr0KjgSqRj
	BtrZyZc/9SKNKdCYvHEY7GCAHGdoWwdj3m+WmYvGI63gC7EJesjAnoknVbGsrcmuMv3zjC+gWYF
	PUAwjO/KXQKjuGMz3WNgOjCaCmnS0FngMzGfhEViIz5ZZa/NBHGMdDuyG/O87uQbO+NdW7QU4tb
	fU5aVzKoPUQZYTvV4yX4XS19l14hK69RDbnSujnlToc+6rT8DHddAZGjDW00EoC7rEyCFwSOpXv
	+PcQOEWD4fP84xg==
X-Google-Smtp-Source: AGHT+IFTT7K+N+/XH7gVDLfMvPNnYUTaEO1OXWUaoBG71upWJ0bUM+XES4EjfWRaIzmCfGndzwTzAw==
X-Received: by 2002:a17:903:1a6f:b0:233:d3e7:6fd6 with SMTP id d9443c01a7336-24459800f39mr123140345ad.19.1755276315317;
        Fri, 15 Aug 2025 09:45:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/9] libpam: re-add missing libgen include
Date: Fri, 15 Aug 2025 09:44:58 -0700
Message-ID: <6d88a28ac7b6ff61808eb46e5c85dabd17c77f2e.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221987

From: Martin Jansa <martin.jansa@gmail.com>

It was added by original commit for CVE-2025-6020-01.patch
https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b4196847c0072e#diff-05f443e6acbe32a148a45648148739bf6f02f13acc5c20c6037bf933223d4d77
but removed here in the rebase, causing:

../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:11: error: call to undeclared function 'dirname'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  326 |         parent = dirname(buf);
      |                  ^
../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:9: error: incompatible integer to pointer conversion assigning to 'char*' from 'int' [-Wint-conversion]
  326 |         parent = dirname(buf);
      |                ^ ~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pam/libpam/0002-pam-namespace-rebase.patch                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
index ff5a8a4946..c57011da0b 100644
--- a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
+++ b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
@@ -714,7 +714,7 @@ diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespace/pam_n
 index a991b4c..180e042 100644
 --- a/modules/pam_namespace/pam_namespace.h
 +++ b/modules/pam_namespace/pam_namespace.h
-@@ -44,21 +44,16 @@
+@@ -44,21 +44,17 @@
  #include <stdlib.h>
  #include <errno.h>
  #include <syslog.h>
@@ -728,7 +728,7 @@ index a991b4c..180e042 100644
 -#include <sys/resource.h>
  #include <sys/mount.h>
  #include <sys/wait.h>
--#include <libgen.h>
+ #include <libgen.h>
  #include <fcntl.h>
  #include <sched.h>
  #include <glob.h>
-- 
2.43.0


