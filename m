Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB3DE7718B
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.79051.1734433969036401587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=vQULiphP;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.41, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e971a2a0so316638f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433967; x=1735038767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLY6poj+hTM+BfyKMQ3pQKevyA/LsdCQhYg4kePNS0A=;
        b=vQULiphPdwlqgzRF/1KhmFtD6LjAGBOIQKA/kYJCdv+buQwKiMy7TefzPYPVV4NjtL
         AeMU4ZBkbG7QPtlNtfXKeFRaJv1u6G73+l8vEPQeeEOLq2wVY66vEnnPdhdHxSjW3bqy
         +eHJ7SVESmt7BPSVWv7Kw/Pzsbn+8PUWDyGclg96TFkEFnlDw5nXCZH3jitEEHfp4A9e
         iFUk6w8c+/LrQRo1r2m6NXnf4BRPFw+pHh7Xlb7KUTuz7VtLlp9nLdTWDfbQd+Ijqtcg
         mYjafW493hP0BpZAA6Pdq/WSIP522u87hOlGm/DU/PNGZnxRjheIFgprY5TNVLeqvVji
         VedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433967; x=1735038767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLY6poj+hTM+BfyKMQ3pQKevyA/LsdCQhYg4kePNS0A=;
        b=wxZVvU3/aIUUmAjOrfcz9Mv63y+NskRHbHQIMG/z1LEYrHGtQ5MRZrPdZlGEuZX5cR
         A+85MwMf0ze3lLivXInJOyi3/oU2GCVIQukSdUtpy0/iEohtwnDwVaL5ueAtl212OkZA
         tURCgBELUFnWDRYWCdZTxvpKCrLD0RTvWsk57Ftt44BCkD+pdiW4PIHh3r9qGZ/kE1RF
         Q+/GhCoMRlL54wLHdGMULcGuVu2/pQq/fhRBIlfTPuLBcn1foa84DXHs5YeVagWnWrU7
         9Q5GZ1T3cvexOGBJMXUFZ3i2EQbZmy7131JyVrTibglJCCPsfoP9C59kmalCiPCovpSO
         HSGw==
X-Gm-Message-State: AOJu0Yzji+GpYfon++uE+mQeFX8AjUTgR5BVbYSn6W0XwAsKH1iVn2Ux
	AL2C0iknYYYysv6dc1qgtW8Vx9z0jOSQ2pBDSv1pO/g8mQP3hOw69UXMHjgLarlkYKKlIUdPMyl
	yVLPFTbL8tneWpDxr8+IvTgJHdria15UBHwN7Ks+/93bb/KcWhf2Fh55+Euzboe3Yf9EkFfipW2
	3IEqDktxpY
X-Gm-Gg: ASbGnctD7V3im8J+MA4KwoEwNWeTkjyYYSrvxDbAHe5AMH5ImK22oVz2FZKu5ZCAHp3
	KxAPwPWB4vCvByO1TmiH63U7r7PQX1weh2nHMYLM3zoOmCziRmQgyKNf+BGBYzqddOe4ooSdn5y
	Vx/1kXNZiJOg9TulJfRUbdwF8mzkWH58yBDkZIJ+UJFSaA7tNdg7p+L6Na/3/eqXlfLRGIJluP2
	ccuMg+v7z5XDsc4TRsHzIv8s75FYE0iTp4QqCaPigJiBo3it+WzW1L67Mpk+Xwiu8P5AFCQOvL2
	D2p6ripYpAXL1BzsEQ3oUIS3eYGfAPri8g==
X-Google-Smtp-Source: AGHT+IECE03EdS3nzHapNqY4KpPfE2JsLqRE4/OfXSKmjiPYq3KsedQ59TalLb24NzhCx+1mJ/CVAw==
X-Received: by 2002:a5d:59a3:0:b0:385:faaa:9cfe with SMTP id ffacd0b85a97d-3889ad3422cmr4963352f8f.12.1734433967268;
        Tue, 17 Dec 2024 03:12:47 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ad9asm10728586f8f.58.2024.12.17.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:46 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH kirkstone 2/6] base-passwd: Update to 3.5.52
Date: Tue, 17 Dec 2024 12:12:25 +0100
Message-ID: <20241217111229.60698-3-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217111229.60698-1-jonas.gorski@bisdn.de>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 11:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208834

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

* Add a patch to allow the use of debconf to be disabled.
* Replace 0007-Disable-generation-of-the-documentation.patch with a new
  patch to disable the generation of the documentation using a
  configuration option.
* Replace 0006-Disable-shell-for-default-users.patch with a sed
  expression that uses a variable, NOLOGIN, to specify what command to
  use for users that are not expected to login. This allows to use some
  other command than "nologin", e.g., "false". Also, by using
  ${base_sbindir}, it adheres to usrmerge being configured.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7abf63cc8bdc61c8d978b3c21a38e17716fc292)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 ...nstead-of-bin-bash-for-the-root-user.patch |   8 +-
 ...t-since-we-do-not-have-an-etc-shadow.patch |   8 +-
 ...0006-Disable-shell-for-default-users.patch |  54 --------
 ...ble-to-build-without-debconf-support.patch | 129 ++++++++++++++++++
 ...able-generation-of-the-documentation.patch |  32 -----
 ...-to-disable-the-generation-of-the-do.patch |  46 +++++++
 ...passwd_3.5.29.bb =3D> base-passwd_3.5.52.bb} |  18 ++-
 7 files changed, 194 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Disable-=
shell-for-default-users.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-=
possible-to-build-without-debconf-support.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Disable-=
generation-of-the-documentation.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Make-it-=
possible-to-disable-the-generation-of-the-do.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.29.bb =3D> base-pass=
wd_3.5.52.bb} (89%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-inst=
ead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/bas=
e-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index ea0256684be9..09f8cfea9c64 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-=
bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-=
bin-bash-for-the-root-user.patch
@@ -12,12 +12,12 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/passwd.master b/passwd.master
-index a01a6aa..b54ff51 100644
+index 7cd4e24..041685a 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
 -root:*:0:0:root:/root:/bin/bash
 +root:*:0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/usr/sbin/nologin
+ bin:*:2:2:bin:/bin:/usr/sbin/nologin
+ sys:*:3:3:sys:/dev:/usr/sbin/nologin
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root=
-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/b=
ase-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 88cc5be66ca5..06222ab04cef 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-=
we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-=
we-do-not-have-an-etc-shadow.patch
@@ -10,12 +10,12 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/passwd.master b/passwd.master
-index b54ff51..e1c32ff 100644
+index 041685a..31a84d4 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
 -root:*:0:0:root:/root:/bin/sh
 +root::0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/usr/sbin/nologin
+ bin:*:2:2:bin:/bin:/usr/sbin/nologin
+ sys:*:3:3:sys:/dev:/usr/sbin/nologin
diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-f=
or-default-users.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Dis=
able-shell-for-default-users.patch
deleted file mode 100644
index 2bcb829d9c32..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-defa=
ult-users.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f35eb24213475d3024ad45297fd855c6abfbbac0 Mon Sep 17 00:00:00 2001
-From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
-Date: Mon, 18 Apr 2022 11:22:43 +0800
-Subject: [PATCH] Disable shell for default users
-
-Change the shell of all global static users other than root (which
-retains /bin/sh) and sync (as /bin/sync is rather harmless) to
-/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
-
-Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passw=
d/3.5.30]
-Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
----
- passwd.master | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/passwd.master b/passwd.master
-index e1c32ff..0cd5ffd 100644
---- a/passwd.master
-+++ b/passwd.master
-@@ -1,18 +1,18 @@
- root::0:0:root:/root:/bin/sh
--daemon:*:1:1:daemon:/usr/sbin:/bin/sh
--bin:*:2:2:bin:/bin:/bin/sh
--sys:*:3:3:sys:/dev:/bin/sh
-+daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
-+bin:*:2:2:bin:/bin:/sbin/nologin
-+sys:*:3:3:sys:/dev:/sbin/nologin
- sync:*:4:65534:sync:/bin:/bin/sync
--games:*:5:60:games:/usr/games:/bin/sh
--man:*:6:12:man:/var/cache/man:/bin/sh
--lp:*:7:7:lp:/var/spool/lpd:/bin/sh
--mail:*:8:8:mail:/var/mail:/bin/sh
--news:*:9:9:news:/var/spool/news:/bin/sh
--uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
--proxy:*:13:13:proxy:/bin:/bin/sh
--www-data:*:33:33:www-data:/var/www:/bin/sh
--backup:*:34:34:backup:/var/backups:/bin/sh
--list:*:38:38:Mailing List Manager:/var/list:/bin/sh
--irc:*:39:39:ircd:/var/run/ircd:/bin/sh
--gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
--nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
-+games:*:5:60:games:/usr/games:/sbin/nologin
-+man:*:6:12:man:/var/cache/man:/sbin/nologin
-+lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
-+mail:*:8:8:mail:/var/mail:/sbin/nologin
-+news:*:9:9:news:/var/spool/news:/sbin/nologin
-+uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
-+proxy:*:13:13:proxy:/bin:/sbin/nologin
-+www-data:*:33:33:www-data:/var/www:/sbin/nologin
-+backup:*:34:34:backup:/var/backups:/sbin/nologin
-+list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
-+irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
-+gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nol=
ogin
-+nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possibl=
e-to-build-without-debconf-support.patch b/meta/recipes-core/base-passwd/ba=
se-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
new file mode 100644
index 000000000000..61ed1641a126
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-bu=
ild-without-debconf-support.patch
@@ -0,0 +1,129 @@
+From 236d6c8c0dd7e15d9a9795813b94bc87ce09eec5 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Fri, 29 Apr 2022 19:32:29 +0200
+Subject: [PATCH] Make it possible to build without debconf support
+
+Not all systems have the debconfclient library available.
+
+Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/=
merge_requests/11]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.am     |  1 -
+ configure.ac    | 13 +++++++++++++
+ update-passwd.c | 15 +++++++++++++++
+ 3 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 223916f..4bdd769 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,6 @@ SUBDIRS =3D doc man
+ sbin_PROGRAMS =3D update-passwd
+=20
+ update_passwd_SOURCES =3D update-passwd.c
+-update_passwd_LDADD =3D -ldebconfclient
+=20
+ pkgdata_DATA =3D passwd.master group.master
+=20
+diff --git a/configure.ac b/configure.ac
+index 9d1ace5..1e35ad1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,19 @@ AC_SYS_LARGEFILE
+ dnl Scan for things we need
+ AC_CHECK_FUNCS([putgrent])
+=20
++dnl Check for debconf
++AC_MSG_CHECKING([whether to enable debconf support])
++AC_ARG_ENABLE([debconf],
++  [AS_HELP_STRING([--disable-debconf], [disable support for debconf])],
++  [],
++  [enable_debconf=3Dyes])
++AC_MSG_RESULT($enable_debconf)
++AS_IF([test "x$enable_debconf" !=3D xno],
++  [AC_CHECK_LIB([debconfclient], [debconfclient_new], [],
++    [AC_MSG_ERROR(
++      [debconf support not available (use --disable-debconf to disable)])=
])
++   AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])]=
)
++
+ dnl Finally output everything
+ AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
+ AC_OUTPUT
+diff --git a/update-passwd.c b/update-passwd.c
+index 3f3dffa..5b49740 100644
+--- a/update-passwd.c
++++ b/update-passwd.c
+@@ -39,7 +39,9 @@
+ #include <stdarg.h>
+ #include <ctype.h>
+=20
++#ifdef HAVE_DEBCONF
+ #include <cdebconf/debconfclient.h>
++#endif
+=20
+ #define DEFAULT_PASSWD_MASTER	"/usr/share/base-passwd/passwd.master"
+ #define DEFAULT_GROUP_MASTER	"/usr/share/base-passwd/group.master"
+@@ -143,6 +145,7 @@ int		flag_debconf	=3D 0;
+ const char*	user_domain	=3D DEFAULT_DEBCONF_DOMAIN;
+ const char*	group_domain	=3D DEFAULT_DEBCONF_DOMAIN;
+=20
++#ifdef HAVE_DEBCONF
+ struct debconfclient*	debconf	=3D NULL;
+=20
+ /* Abort the program if talking to debconf fails.  Use ret exactly once. =
*/
+@@ -162,6 +165,10 @@ struct debconfclient*	debconf	=3D NULL;
+     DEBCONF_CHECK(debconf_register(debconf, (template), (question)))
+ #define DEBCONF_SUBST(question, var, value) \
+     DEBCONF_CHECK(debconf_subst(debconf, (question), (var), (value)))
++#else
++#define DEBCONF_REGISTER(template, question)
++#define DEBCONF_SUBST(question, var, value)
++#endif
+=20
+=20
+ /* malloc() with out-of-memory checking.
+@@ -621,6 +628,7 @@ void version() {
+  * flag.  Aborts the problem on any failure.
+  */
+ int ask_debconf(const char* priority, const char* question) {
++#ifdef HAVE_DEBCONF
+     int		ret;
+     const char*	response;
+=20
+@@ -640,6 +648,9 @@ int ask_debconf(const char* priority, const char* ques=
tion) {
+ 	return 1;
+     else
+ 	return 0;
++#else
++	return 0;
++#endif
+ }
+=20
+=20
+@@ -1427,6 +1438,7 @@ int main(int argc, char** argv) {
+     /* If DEBIAN_HAS_FRONTEND is set in the environment, we're running un=
der
+      * debconf.  Enable debconf prompting unless --dry-run was also given=
.
+      */
++#ifdef HAVE_DEBCONF
+     if (getenv("DEBIAN_HAS_FRONTEND")!=3DNULL && !opt_dryrun) {
+ 	debconf=3Ddebconfclient_new();
+ 	if (debconf=3D=3DNULL) {
+@@ -1435,6 +1447,7 @@ int main(int argc, char** argv) {
+ 	}
+ 	flag_debconf=3D1;
+     }
++#endif
+=20
+     if (read_passwd(&master_accounts, master_passwd)!=3D0)
+ 	return 2;
+@@ -1480,8 +1493,10 @@ int main(int argc, char** argv) {
+ 	if (!unlock_files())
+ 	    return 5;
+=20
++#ifdef HAVE_DEBCONF
+     if (debconf!=3DNULL)
+ 	debconfclient_delete(debconf);
++#endif
+=20
+     if (opt_dryrun)
+ 	return flag_dirty;
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generat=
ion-of-the-documentation.patch b/meta/recipes-core/base-passwd/base-passwd/=
0007-Disable-generation-of-the-documentation.patch
deleted file mode 100644
index 4a19f91c35a0..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-=
the-documentation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ccf8227cb10d78f1958a7a7feed75a390a6b133 Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Fri, 29 Apr 2022 13:32:28 +0000
-Subject: [PATCH] Disable generation of the documentation
-
-It uses tools currently not supported by OE-Core. It uses sgmltools
-and po4a.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- Makefile.in | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 9ba097c..d3ea47c 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -25,13 +25,10 @@ gen_configure	=3D config.cache config.status config.lo=
g \
- 		  confdefhs.h config.h Makefile
-=20
- all: update-passwd
--	$(MAKE) -C doc all
--	$(MAKE) -C man all
-=20
- install: all
- 	mkdir -p $(DESTDIR)$(sbindir)
- 	$(INSTALL) update-passwd $(DESTDIR)$(sbindir)/
--	$(MAKE) -C man install
-=20
- update-passwd.o: version.h
-=20
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possibl=
e-to-disable-the-generation-of-the-do.patch b/meta/recipes-core/base-passwd=
/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patc=
h
new file mode 100644
index 000000000000..2bec065cdbdf
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-di=
sable-the-generation-of-the-do.patch
@@ -0,0 +1,46 @@
+From 63e8270141a296843cfe1daba38e1969ac6d75ae Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Sat, 30 Apr 2022 00:35:34 +0200
+Subject: [PATCH] Make it possible to disable the generation of the
+ documentation
+
+Not all systems have docbook and po4a available.
+
+Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/=
merge_requests/11]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.am  | 2 ++
+ configure.ac | 9 +++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4bdd769..97b4f42 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,6 @@
++if ENABLE_DOCS
+ SUBDIRS =3D doc man
++endif
+=20
+ sbin_PROGRAMS =3D update-passwd
+=20
+diff --git a/configure.ac b/configure.ac
+index 1e35ad1..b98374e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,6 +27,15 @@ AS_IF([test "x$enable_debconf" !=3D xno],
+       [debconf support not available (use --disable-debconf to disable)])=
])
+    AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])]=
)
+=20
++dnl Check whether to build the documentation=20
++AC_MSG_CHECKING([whether to build the documentation])
++AC_ARG_ENABLE([docs],
++  [AC_HELP_STRING([--disable-docs], [do not build and install documentati=
on])],
++  [],
++  [enable_docs=3Dyes])
++AC_MSG_RESULT($enable_docs)
++AM_CONDITIONAL(ENABLE_DOCS, test "x$enable_docs" =3D xyes)
++
+ dnl Finally output everything
+ AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
+ AC_OUTPUT
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/rec=
ipes-core/base-passwd/base-passwd_3.5.52.bb
similarity index 89%
rename from meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
index e5615991363e..f89752c07710 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
@@ -5,27 +5,30 @@ SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a"
=20
-RECIPE_NO_UPDATE_REASON =3D "Version 3.5.38 requires cdebconf for update-p=
asswd utility"
-
-SRC_URI =3D "https://launchpad.net/debian/+archive/primary/+files/${BPN}_$=
{PV}.tar.gz \
+SRC_URI =3D "https://launchpad.net/debian/+archive/primary/+files/${BPN}_$=
{PV}.tar.xz \
            file://0001-Add-a-shutdown-group.patch \
            file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.pa=
tch \
            file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.=
patch \
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch =
\
            file://0005-Add-kvm-group.patch \
-           file://0006-Disable-shell-for-default-users.patch \
-           file://0007-Disable-generation-of-the-documentation.patch \
+           file://0006-Make-it-possible-to-build-without-debconf-support.p=
atch \
+           file://0007-Make-it-possible-to-disable-the-generation-of-the-d=
o.patch \
            "
=20
-SRC_URI[md5sum] =3D "6beccac48083fe8ae5048acd062e5421"
-SRC_URI[sha256sum] =3D "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64=
accc55986b6a36"
+SRC_URI[sha256sum] =3D "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31=
a3d6317f95ccea"
=20
 # the package is taken from launchpad; that source is static and goes stal=
e
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/b/base-passwd/"
=20
+S =3D "${WORKDIR}/work"
+
 inherit autotools
=20
+EXTRA_OECONF +=3D "--disable-debconf --disable-docs"
+
+NOLOGIN ?=3D "${base_sbindir}/nologin"
+
 do_install () {
 	install -d -m 755 ${D}${sbindir}
 	install -o root -g root -p -m 755 ${B}/update-passwd ${D}${sbindir}/
@@ -37,6 +40,7 @@ do_install () {
 	install -d -m 755 ${D}${datadir}/base-passwd
 	install -o root -g root -p -m 644 ${S}/passwd.master ${D}${datadir}/base-=
passwd/
 	sed -i 's#:/root:#:${ROOT_HOME}:#' ${D}${datadir}/base-passwd/passwd.mast=
er
+	sed -i 's#/usr/sbin/nologin#${NOLOGIN}#' ${D}${datadir}/base-passwd/passw=
d.master
 	install -o root -g root -p -m 644 ${S}/group.master ${D}${datadir}/base-p=
asswd/
=20
 	install -d -m 755 ${D}${docdir}/${BPN}
--=20
2.47.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


