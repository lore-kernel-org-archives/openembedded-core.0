Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED74C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:28:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41070.1785756530530709357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UpqsBtx9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8F21143D
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 04:28:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E2D53F632
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785756530; bh=Z2Sl36bz5ZlGEqTYvvJ2bp0sCXfytStr5oslRW/8R7M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UpqsBtx9YM0w/zX4ohljQeGgVs69JB3WJhDRaZCbxZl+jsmrwrrUmTn9F3LOtetbp
	 cZnZPD35i4LUyltNEdl3JjG8BbdUMXCUi2fLzx/AHVptMBOVkPzIa+w1kRpWXPlQaV
	 8RFd7gY8JNRQNwiQhbiqBsE65H5GQ7DOC4rCFKM0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] pkgconf: upgrade 3.0.4 -> 3.0.5
Date: Mon,  3 Aug 2026 12:28:42 +0100
Message-ID: <20260803112843.1362937-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112843.1362937-1-ross.burton@arm.com>
References: <20260803112843.1362937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 11:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242651

Abridged release notes:

 Correctness fixes:
  - Shell quoting and backslash escapes in pc(5) properties are now consu=
med
    once, after variable substitution, instead of while splitting the pro=
perty
    beforehand.
  - Metadata queries no longer consult Conflicts rules between the module=
s named
    on the command line, as reporting metadata does not combine them into=
 a
    build.
  - ${pc_sysrootdir} is now injected into the path taken by every -isyste=
m and
    -idirafter flag in a fragment list, rather than only the first.
  - -isystem and -idirafter written joined to their path, as in `-isystem=
/opt`,
    are split into the flag and the path it takes, so that the path is su=
bject
    to the same sysroot injection and deduplication as the separated spel=
ling.
  - Sysroot injection is decided by reading the fragment's path instead o=
f
    remembering whether ${pc_sysrootdir} was expanded, so a path which al=
ready
    lies under the sysroot never acquires a doubled prefix.

* Performance:
  - The package cache and the fragment deduplication index are kept sorte=
d and
    searched with bsearch() rather than re-sorted or scanned linearly.
  - Variable keys and fragment text are stored with the structures they b=
elong
    to, and buffers are rewound and reused rather than reallocated.
  - Escaping, fragment rendering and path relocation write into their
    destination buffer directly.

* Build and portability fixes:
  - Fix the pkgconf-lite build, which failed to link because the dependen=
cy list
    renderer had come to depend on tracing machinery that pkgconf-lite om=
its.
  - Fix the test runner failing to build on MinGW, where the mkdtemp(3) f=
allback
    was compiled only for MSVC builds.
    See https://github.com/pkgconf/pkgconf/issues/582.
  - The meson build now defines HAVE_DECL_READLINKAT, so readlinkat(2) is=
 used
    where it is available instead of always falling back to readlink(2).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/{pkgconf_3.0.4.bb =3D> pkgconf_3.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.4.bb =3D> pkgconf_3.0.=
5.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.5.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
index 0abd0fa923c..79ac3208d3e 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "91ce346b47f46b87d680c6928e6c43240b9cdc7a31afbea1=
9f2298de4dbe266d"
+SRC_URI[sha256sum] =3D "3acd3a8a3cce65a8d620321855d92fb602e026cbe8e13ee3=
6bdec58483b59ace"
 UPSTREAM_CHECK_REGEX =3D "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
=20
 inherit autotools pkgconfig
--=20
2.43.0


