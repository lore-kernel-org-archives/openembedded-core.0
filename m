Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB23CF044D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 10:47:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13325.1728470845696663576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 03:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6621FFEC;
	Wed,  9 Oct 2024 03:47:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BBE43F64C;
	Wed,  9 Oct 2024 03:47:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH 1/2] bitbake.conf: don't force musl on mips to use classic sysv hashing
Date: Wed,  9 Oct 2024 11:47:15 +0100
Message-Id: <20241009104716.711424-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 10:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205346

This is no longer needed, qemumips with musl generates the expected
DT_MIPS_XHASH table as it already does with glibc:

Dynamic Section:
  NEEDED               libc.so
  SONAME               libz.so.1
  DT_MIPS_XHASH        0x000001a8

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3f583668f66..8000baba389 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -636,8 +636,6 @@ ASNEEDED ?=3D "-Wl,--as-needed"
=20
 export LDFLAGS =3D "${TARGET_LDFLAGS}"
 TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBU=
G_PREFIX_MAP}"
-# mips does not support GNU hash style therefore we override
-LINKER_HASH_STYLE:mipsarch:libc-musl =3D "sysv"
=20
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE:prepend:task-compile =3D "${PARALLEL_MAKE} "
--=20
2.34.1


