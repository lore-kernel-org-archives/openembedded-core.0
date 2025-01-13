Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01FBC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.28746.1736801259610869907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O2IvZjXa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21661be2c2dso80804915ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801259; x=1737406059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kpy6vbbJbgf1U2Cz3lreSXdtB5K0Ohsf4oGAdkHOQxM=;
        b=O2IvZjXaXKmOq5iyUtTx2aMuUnngYFfTbYbwihFaj9JhqEzkSsKCbipisd6nx1H9us
         O+LSjrC5sv06GVVQz2KNWsnXrZf6Ni4g8XBvApmscuC1xXvZnX7CB7YQtmOyhKT+p5av
         4vvpmrH/YlFcioiCloDpqfMCpCrNeVyqzLKcnvoB8Zxj9pEVbCisSbf4G152v9RNv7iF
         KfzJjNYJTYUj5xd2QQqtoVPAFyXNaQkQWWsuxok9mdCCXr0PRCljEABkeQLPsgAV0Xzx
         jFmNfaPj5H3fwzo6i+TMesAlvWAK6Zg8qbf6RjRpi8KLgHBXlyBvuzrLyHLyX4WBQ7EA
         5aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801259; x=1737406059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kpy6vbbJbgf1U2Cz3lreSXdtB5K0Ohsf4oGAdkHOQxM=;
        b=u1kDOHydL0Z2jKQDKwdG+f/IQaV8rXzCAQ2WiRMdjgL/+7yyf7RIOedK46tiTc3Tlo
         SZVxfHag0JBZLs6Vk8tZgW9oF7qK/0ewH2qLc2EIgWZTjQB3q2kDUidRqr3U3K6fKwzP
         2GTdgM1B0rUC42dMEUWGWKvuWYq3GjXzRwmtGx3beTOvNG0yIUKztuveXD9pRCd+/jlG
         0ArGqROAu0/s4iIZF9L7qmOzVYPSJiY9v3GBAQHEFOVABhRKDTf66n/PNjPJaDDqVNJc
         AFYjLNNCgQ6CRGOJkYudueqBzoMpa0cNNk+UOKOR1LTnWoSTo7gWtQxTJJRdWXMUByQx
         SbmQ==
X-Gm-Message-State: AOJu0YwO3KISco2fbl+rekdsblaBKFeJx3Nnsni2IEdbp0RLERfc2G+8
	28YjFbflvNlFOOgMFjlJ+9j7T8wAYMmD3V0bIfJmyvc/8MJ8H6BukAuGp0JSkllkADs0e9EUH7k
	fBaQ=
X-Gm-Gg: ASbGncuEFQFrHWTvoTn6fN2YmeCvqwLHB0VM4fNwMsD2GCcyY65oBEuQyUyQDAiscEr
	GyRuChREu4N/an/dHnawOpgki2BXT729unrWwpNbOpnQr4eXDesf+sYh/PRnpDkuO9tr6pdpFKp
	9YXahCULJqnVFC/g214Kp8XDckuH/aAw92SpH89HsXzqoIg13j2tlDHZ1rqIaghtuFRtAzIawhC
	GtuC+TRSLFvvMTfbZwFMSvUKQ606dZGLGjgoEm/O/lsCw==
X-Google-Smtp-Source: AGHT+IEHPS7V7YAQ8OnCANzcyKf20Bd0ncXZ3C5TGPhp6mWHiqSZhKvUD1/FsFTuOo6TVN0KnqTPgw==
X-Received: by 2002:a05:6a00:1bca:b0:725:a78c:6c31 with SMTP id d2e1a72fcca58-72d21f107f1mr30825328b3a.3.1736801258905;
        Mon, 13 Jan 2025 12:47:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/15] groff: Fix race issues for parallel build
Date: Mon, 13 Jan 2025 12:47:05 -0800
Message-ID: <44b625a820a22c99f4fa1d4ed6b6de98c5d75884.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209757

From: Robert Yang <liezhi.yang@windriver.com>

Fixed race issues for parallel build:
groff: error: couldn't exec soelim: Permission

And:
groff: error: couldn't exec grn: Permission denied

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
(cherry picked from commit b9ee7ea9ab05a1887c863dc9fccc65cb9e6850df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch

diff --git a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
new file mode 100644
index 0000000000..de4a55bbab
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
@@ -0,0 +1,31 @@
+From 771686c042d5f494550d0399f36e00b1ca557b2d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 11 Nov 2024 14:12:51 +0000
+Subject: [PATCH] contrib/hdtbl/hdtbl.am: Fix race issues for parallel build
+
+Fixed race issues for parallel build:
+groff: error: couldn't exec soelim: Permission
+
+And:
+groff: error: couldn't exec grn: Permission denied
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/groff/2024-11/msg00097.html]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ contrib/hdtbl/hdtbl.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
+index 9384fac..70f7bc9 100644
+--- a/contrib/hdtbl/hdtbl.am
++++ b/contrib/hdtbl/hdtbl.am
+@@ -119,7 +119,7 @@ SUFFIXES += .roff .in .ps
+ 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
+ 
+ $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
+-  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
++  grops grn soelim font/devps/stamp contrib/hdtbl/examples/common.roff
+ 
+ uninstall_groffdirs: uninstall-hdtbl-hook
+ uninstall-hdtbl-hook:
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 8a16321479..34a42c7e26 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
            file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
            file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
+           file://0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
-- 
2.43.0


