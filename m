Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F9CCD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:23:15 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.782.1711642994142630585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y4zS/ANt;
 spf=pass (domain: konsulko.com, ip: 209.85.214.193, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-1dddbe47ac1so15133585ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711642993; x=1712247793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr9T/1YbJ8dHYGOrpU6g7oOWIqOa6e11PT6YsG68X/Q=;
        b=Y4zS/ANtoSCj6C3Di1QvzORVLj/0UvdHL1oUjGSt21QBtGQQV/DU1nlg/wGOPkmcYT
         5CXB7nkmWvySLytqwQBIfTetonYFB1p2HDDzq3cGkvxgwoRQNGHAL2qUtMeWI6pBv2Vc
         748vx2XgihRxko7tYhhvrgUhF52kfjJF6w0ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642993; x=1712247793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr9T/1YbJ8dHYGOrpU6g7oOWIqOa6e11PT6YsG68X/Q=;
        b=uuTRYQYd/N1ELgCjhRcMP/gYLFyYCklR7Y0Qx2f4BRHWf4c5XPMpB5XbV372rSO7vo
         qFfO4OQtVs3dY+BevbNpGH1TSB2GfPEUHx1fMz0Ljh1Z+5lZJji2jNswLbX81f3jrLFz
         JOAGetAbFIBvPdFoTE8QoptXmXinKUfxHrx1y1Qz2/Z7249Tw3XFozDKet+OHi/PD/wK
         8/YWzF6yUWSih9LaJjRwEKNJ+5py0MlwxGK63JALizlCbe9+KZM9xiEqVq3yOQuIPVUh
         TZ3gjfXCPA8bRenVIcMX5BHONyEnshFX6/HDwl28jWFR04oNgJeU9cxG25My+QAA6nfA
         THyg==
X-Gm-Message-State: AOJu0Yz3HSs4vUmWczGHNkQEHguJ91JJ1xNSfGV3zRYe1rz1DqWUSyY2
	g/Rh4xU5UrYWeSZkH9z4vFHiZNuYlX2Ot9ILRgr2oIYSpJjVB+kqkT6vVWLZJqje4Hnef/kBo8T
	t04mEx/+m
X-Google-Smtp-Source: AGHT+IGct8lVFr0b5G0M1LmZyT4hQAKIf4VPQHo/U2Q0aqqXfkedjjm+NdHmqbPj6GOygYSIO6Z7rA==
X-Received: by 2002:a17:902:e844:b0:1e2:118f:e589 with SMTP id t4-20020a170902e84400b001e2118fe589mr3645523plg.32.1711642992722;
        Thu, 28 Mar 2024 09:23:12 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:6ae3:9cc1:54c1:30c])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903245200b001e197cfe08fsm1800746pls.59.2024.03.28.09.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:23:12 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] liberror-perl: move to meta-perl
Date: Thu, 28 Mar 2024 09:22:21 -0700
Message-Id: <20240328162218.1521815-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328162218.1521815-1-tim.orling@konsulko.com>
References: <20240328162218.1521815-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197589

The upstream maintainer for Error has deprecated it for quite some time [1].
The only dependency in oe-core was coreutils-ptest.

[YOCTO #15461]

[1] https://metacpan.org/pod/Error#WARNING

    Using the "Error" module is no longer recommended due to the black-magical
    nature of its syntactic sugar, which often tends to break. Its maintainers
    have stopped actively writing code that uses it, and discourage people from
    doing so. See the "SEE ALSO" section below for better recommendations [2].

[2] https://metacpan.org/pod/Error#SEE-ALSO

    SEE ALSO
    --------

    See Exception::Class for a different module providing Object-Oriented
    exception handling, along with a convenient syntax for declaring hierarchies
    for them. It doesn't provide Error's syntactic sugar of try { ... },
    catch { ... }, etc. which may be a good thing or a bad thing based on what
    you want. (Because Error's syntactic sugar tends to break.)

    Error::Exception aims to combine Error and Exception::Class "with correct
    stringification".

    TryCatch and Try::Tiny are similar in concept to Error.pm only providing a
    syntax that hopefully breaks less.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  1 -
 .../perl/liberror-perl_0.17029.bb             | 48 -------------------
 3 files changed, 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/liberror-perl_0.17029.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4ca5430a941..2d1f9fdec55 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -328,7 +328,6 @@ RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libepoxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-liberation-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-liberror-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libevdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libevent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libexif = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0192146dbd0..84f67644437 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,7 +28,6 @@ PTESTS_FAST = "\
     json-c \
     json-glib \
     libconvert-asn1-perl \
-    liberror-perl \
     libgpg-error\
     libnl \
     libpcre \
diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
deleted file mode 100644
index e54bb11ccd3..00000000000
--- a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "Error - Error/exception handling in an OO-ish way"
-DESCRIPTION = "The Error package provides two interfaces. Firstly \
-Error provides a procedural interface to exception handling. \
-Secondly Error is a base class for errors/exceptions that can \
-either be thrown, for subsequent catch, or can simply be recorded."
-HOMEPAGE = "https://github.com/shlomif/perl-error.pm"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
-
-
-DEPENDS += "perl"
-
-RDEPENDS:${PN} += " \
-    perl-module-carp \
-    perl-module-exporter \
-    perl-module-scalar-util \
-    perl-module-overload \
-    perl-module-strict \
-    perl-module-vars \
-    perl-module-warnings \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    perl-module-base \
-    perl-module-file-spec \
-    perl-module-io-handle \
-    perl-module-ipc-open3 \
-    perl-module-lib \
-    perl-module-test-more \
-"
-
-SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6732b1c6207e4a9a3e2987c88368039a"
-SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
-
-S = "${WORKDIR}/Error-${PV}"
-
-inherit cpan ptest-perl
-
-do_install:prepend() {
-	# test requires "-T" (taint) command line option
-	rm -rf ${B}/t/pod-coverage.t
-}
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


