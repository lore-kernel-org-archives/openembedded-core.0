Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B995C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 11:17:23 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.10108.1753183036741852568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 04:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ld5ol009;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250722111712c6f2dba39308f60f76-zclyvq@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250722111712c6f2dba39308f60f76
        for <openembedded-core@lists.openembedded.org>;
        Tue, 22 Jul 2025 13:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DpMqoubvBl+s7I2PqFHd3K3y6uLzCqDJ8BTLCTnK7MY=;
 b=ld5ol009YqM061k62UkrpkahhkyU//Vyn5adccHlRkbu+cSRK0IF8XKFi74VARS1kGKvWb
 am97l/9vRMpvrqeHce9xWmltZxStl89gGgPRa3K9m5tsZAl0C1Kdc1j/fQ1M3RmFQrDuqMk7
 jvC8a0+51AsuVLyPkJDV78/tGqKqRVIMDLENq36l2Jdp2g+F3+8Jl3Q4PT1xfagDVEq9SbHx
 Y2de7ZuZKdnQISmHscRrMPzdYSLAeNvkNxx7WkH7PJAl3G9GlecLnUbMiy9akftBO04q9nSq
 BHwNNqlZkqNniWSrIEHq6uMkGTQ7q5ClXgy6pyoi7X7KLqVet87GZzdg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] db: ignore implicit-int and implicit-function-declaration issues fatal with gcc-14
Date: Tue, 22 Jul 2025 13:16:34 +0200
Message-Id: <20250722111634.43046-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220733

From: Martin Jansa <martin.jansa@gmail.com>

* many configure tests (which might not fail before) are failing with gcc-1=
4:
  # grep implicit build/config.log
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:50:17: error: implicit declaration of function 'exit' [-Wimpli=
cit-function-declaration]
  conftest.c:50:17: warning: incompatible implicit declaration of built-in =
function 'exit' [-Wbuiltin-declaration-mismatch]
  conftest.c:53:9: error: implicit declaration of function 'msem_init' [-Wi=
mplicit-function-declaration]
  conftest.c:54:9: error: implicit declaration of function 'msem_lock' [-Wi=
mplicit-function-declaration]
  conftest.c:55:9: error: implicit declaration of function 'msem_unlock' [-=
Wimplicit-function-declaration]
  conftest.c:56:9: error: implicit declaration of function 'exit' [-Wimplic=
it-function-declaration]
  conftest.c:56:9: warning: incompatible implicit declaration of built-in f=
unction 'exit' [-Wbuiltin-declaration-mismatch]
  conftest.c:50:9: error: implicit declaration of function '_spin_lock_try'=
 [-Wimplicit-function-declaration]
  conftest.c:51:9: error: implicit declaration of function '_spin_unlock' [=
-Wimplicit-function-declaration]

* I have noticed this on db-native build on host with gcc-14
  where it caused fatal do_configure error:
  http://errors.yoctoproject.org/Errors/Details/784164/

  checking for mutexes... UNIX/fcntl
  configure: error: Support for FCNTL mutexes was removed in BDB 4.8.

  the config.log confirms it's because implicit-int:

  configure:22798: checking for mutexes
  configure:22925: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/wor=
k/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/include -O2 -pipe=
  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28/re=
cipe-sysroot-native/usr/include -D_GNU_SOURCE -D_REENTRANT -L/OE/build/oe-c=
ore/tmp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/=
lib                         -L/OE/build/oe-core/tmp-glibc/work/x86_64-linux=
/db-native/5.3.28/recipe-sysroot-native/lib                         -Wl,--e=
nable-new-dtags                         -Wl,-rpath-link,/OE/build/oe-core/t=
mp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/lib  =
                       -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/x86=
_64-linux/db-native/5.3.28/recipe-sysroot-native/lib                       =
  -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28=
/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/OE/build=
/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native=
/lib                         -Wl,-O1 conftest.c  -lpthread >&5
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
     47 | main() {
        | ^~~~
  configure:22925: $? =3D 1
  configure: program exited with status 1

* comparing target db with and without this change shows following diff
  in log.do_configure:

  db $ diff 5.3.28*/temp/log.do_configure
  268c268
  < checking for mutexes... POSIX/pthreads/library
  ---
  > checking for mutexes... POSIX/pthreads/library/x86_64/gcc-assembly
  271c271
  < checking for atomic operations... no
  ---
  > checking for atomic operations... x86/gcc-assembly

(From OE-Core rev: 4d3ce333c10fadf746b6d8b55a88777c97e11ffa)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6108da955e7c553247ff5356cf1c990b3d334edf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db=
/db_5.3.28.bb
index c5427f54eb0..62a91ba7e3d 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -117,3 +117,7 @@ INSANE_SKIP:${PN} =3D "dev-so"
 INSANE_SKIP:${PN}-cxx =3D "dev-so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# many configure tests are failing with gcc-14
+CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-function-decl=
aration"
+BUILD_CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-functio=
n-declaration"

