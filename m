Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B289AE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.79326.1734433968249098962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=agYyRxGS;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.52, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e971a2a0so316635f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433966; x=1735038766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hRU8jfeZ1p8jIoaa9qKJcYXFSmpISc//kHxRr+xuTc=;
        b=agYyRxGSO3yov/nm1KbLdNj8BKj/wSUx56KTAhMfcC0UMg8aDJfLVt5Eia9nysNJxg
         YyF0c/uEJQ7LiIxw+NMEhAOZHj9pX+3x5Rc4c5oGMTVgSsRBOAeVThNdefF+tbs2O5F/
         YcwBn1CCHqvdDC7gmI3tnJwYOQK9O02nVvMZyUU8XgHvlSQ3TWZUr9Yc5U70vdQkur9P
         auEcndrqKsNn1GLDxLVMOmxAVqk6TyQgzu3nWfawAJ8tpjsIme74I2CghKjme0LVjQyC
         o//R2O2vNeqr7WHSyhNDFIOExfmMY2XO6MU7PUublib++9xKiOtDKJ/bzblFyauz3kcN
         lAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433966; x=1735038766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hRU8jfeZ1p8jIoaa9qKJcYXFSmpISc//kHxRr+xuTc=;
        b=bkrv+9UWvoNqs/yWiAWu5fyUNAiNIOJvVtYa7LjzR7YC0R7E16QAy1+/xICSsFONXD
         1S1Dv8dU+dfm1G7YP0YhMFbPEA9DHnTJy2eZIhj+ykKOqsEIfa+lGIaKaquAl0vzovq1
         bdJPrFl5veJ7aQdEu2EEPH1E5kVML61wdtvMx9O38nYk4cXKas8ddxg/5FPAJk0lPFnf
         c7tR/ZbooilyzqxGA+XqLFM6WZBki9DIv7fIU304JfOy1CD/raN1Vz4py6aSRkCZ8CkS
         hnPnJ3Us9nK5LmfyY+BP5zXjlLyI3g8HQ6nbed2JEnkwJvAM8XprlvTF5O+BJEopNGx6
         HtBA==
X-Gm-Message-State: AOJu0YyLfK+GFKMpyQEesgyPMAVj1ts9gCLk4MuM9o86fs+8VSyb87kR
	bsSJPEbaL67usx3a2rCogP9fGA77TgMJJZEok6HEOnEB6tsNjE4GYV05gZB4+tV1p/tLi9KdBko
	BCtGrEDpWLh33bLt9FaYNQBxzjZTP4TdGhODif+TBrY67eYcqv1PgEgAG+h9z8I3fpfHnr35SFv
	wo/rE90lKt
X-Gm-Gg: ASbGncs35ArbPeuauKSaIdsmgACGLAbfvdfW245vCIlFdtr/GbrfdHo6wKaoyyEhvn3
	KVh23yQpuXRvCOw0dIahTNWjcqLZy7gi8dzbILuNqf70OHJDRAkYiHzhd4TmnvNZUnbMO3LdeTT
	LWdLgZw3I52Yqmb5X/6pa0jPHq1phYFewu9X0vZj8vXOPQaXqbinaZ17MDy7vZKQk/8RGQsG3Vy
	zuLgPTcLhozVB83n5aoHzlwYW4JnrcxVzteOSpnVPkLWAJ0ezviv7BAYEkDI4YfI7w27YXUb/NS
	/voVOc1xeimr7G0Jyc02ikYWLco0WtE2xw==
X-Google-Smtp-Source: AGHT+IGXrjlfdTAKDKhAJWE12C+3ci05JTq49jcw5XwBL9n2r8S8GkWk6pnWgTfZM6BBqOkM5Kj+2w==
X-Received: by 2002:a5d:5f88:0:b0:376:2e3e:e6d4 with SMTP id ffacd0b85a97d-3888e0acb25mr4893920f8f.5.1734433966014;
        Tue, 17 Dec 2024 03:12:46 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060566sm10738101f8f.102.2024.12.17.03.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:45 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH kirkstone 1/6] base-passwd: Regenerate the patches
Date: Tue, 17 Dec 2024 12:12:24 +0100
Message-ID: <20241217111229.60698-2-jonas.gorski@bisdn.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208833

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6515d96c12b080b9e7f344799e26dba3b98e17e2)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 .../0001-Add-a-shutdown-group.patch           | 26 +++++++++++++++
 ...nstead-of-bin-bash-for-the-root-user.patch | 23 +++++++++++++
 ...t-since-we-do-not-have-an-etc-shadow.patch | 21 ++++++++++++
 ...nput-group-for-the-dev-input-devices.patch | 23 +++++++++++++
 .../{kvm.patch =3D> 0005-Add-kvm-group.patch}   |  2 +-
 ...006-Disable-shell-for-default-users.patch} |  5 +--
 ...able-generation-of-the-documentation.patch | 32 +++++++++++++++++++
 .../base-passwd/add_shutdown.patch            | 19 -----------
 .../base-passwd/disable-docs.patch            | 24 --------------
 .../base-passwd/base-passwd/input.patch       | 22 -------------
 .../base-passwd/base-passwd/nobash.patch      | 15 ---------
 .../base-passwd/base-passwd/noshadow.patch    | 14 --------
 .../base-passwd/base-passwd_3.5.29.bb         | 14 ++++----
 13 files changed, 134 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-a-sh=
utdown-group.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-=
sh-instead-of-bin-bash-for-the-root-user.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0003-Remove-f=
or-root-since-we-do-not-have-an-etc-shadow.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0004-Add-an-i=
nput-group-for-the-dev-input-devices.patch
 rename meta/recipes-core/base-passwd/base-passwd/{kvm.patch =3D> 0005-Add-=
kvm-group.patch} (88%)
 rename meta/recipes-core/base-passwd/base-passwd/{disable-shell.patch =3D>=
 0006-Disable-shell-for-default-users.patch} (96%)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Disable-=
generation-of-the-documentation.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/add_shutdown.=
patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-docs.=
patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/input.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/nobash.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/noshadow.patc=
h

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-=
group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown=
-group.patch
new file mode 100644
index 000000000000..e50efc9623f8
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.p=
atch
@@ -0,0 +1,26 @@
+From 8f3ace87df3aaad85946c22cae240532ea3e73b8 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Fri, 29 Apr 2022 13:32:27 +0000
+Subject: [PATCH] Add a shutdown group
+
+We need to have a shutdown group to allow the shutdown icon to work
+correctly. Any users that want to use shutdown like the xuser should
+be added to this group.
+
+Upstream-Status: Inappropriate [Embedded]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index ad1dd2d..1b5e2fb 100644
+--- a/group.master
++++ b/group.master
+@@ -35,5 +35,6 @@ sasl:*:45:
+ plugdev:*:46:
+ staff:*:50:
+ games:*:60:
++shutdown:*:70:
+ users:*:100:
+ nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-inst=
ead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/bas=
e-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
new file mode 100644
index 000000000000..ea0256684be9
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-=
bin-bash-for-the-root-user.patch
@@ -0,0 +1,23 @@
+From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Fri, 29 Apr 2022 13:32:27 +0000
+Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
+
+/bin/bash may not be included in some images such as minimal.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ passwd.master | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/passwd.master b/passwd.master
+index a01a6aa..b54ff51 100644
+--- a/passwd.master
++++ b/passwd.master
+@@ -1,4 +1,4 @@
+-root:*:0:0:root:/root:/bin/bash
++root:*:0:0:root:/root:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+ bin:*:2:2:bin:/bin:/bin/sh
+ sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root=
-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/b=
ase-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
new file mode 100644
index 000000000000..88cc5be66ca5
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-=
we-do-not-have-an-etc-shadow.patch
@@ -0,0 +1,21 @@
+From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Fri, 29 Apr 2022 13:32:28 +0000
+Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ passwd.master | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/passwd.master b/passwd.master
+index b54ff51..e1c32ff 100644
+--- a/passwd.master
++++ b/passwd.master
+@@ -1,4 +1,4 @@
+-root:*:0:0:root:/root:/bin/sh
++root::0:0:root:/root:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+ bin:*:2:2:bin:/bin:/bin/sh
+ sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-gr=
oup-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-pa=
sswd/0004-Add-an-input-group-for-the-dev-input-devices.patch
new file mode 100644
index 000000000000..394a0f01d323
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for=
-the-dev-input-devices.patch
@@ -0,0 +1,23 @@
+From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Fri, 29 Apr 2022 13:32:28 +0000
+Subject: [PATCH] Add an input group for the /dev/input/* devices
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index 1b5e2fb..cea9d60 100644
+--- a/group.master
++++ b/group.master
+@@ -12,6 +12,7 @@ uucp:*:10:
+ man:*:12:
+ proxy:*:13:
+ kmem:*:15:
++input:*:19:
+ dialout:*:20:
+ fax:*:21:
+ voice:*:22:
diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/rec=
ipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
similarity index 88%
rename from meta/recipes-core/base-passwd/base-passwd/kvm.patch
rename to meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patc=
h
index 113d5151e7a9..72e6ee333c9b 100644
--- a/meta/recipes-core/base-passwd/base-passwd/kvm.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
+From 6cf19461fb31d7a7a3010629aae9aab49c26a01b Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch =
b/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-=
users.patch
similarity index 96%
rename from meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
rename to meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-=
default-users.patch
index bfaa786018a3..2bcb829d9c32 100644
--- a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-defa=
ult-users.patch
@@ -1,4 +1,4 @@
-From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
+From f35eb24213475d3024ad45297fd855c6abfbbac0 Mon Sep 17 00:00:00 2001
 From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 Date: Mon, 18 Apr 2022 11:22:43 +0800
 Subject: [PATCH] Disable shell for default users
@@ -52,6 +52,3 @@ index e1c32ff..0cd5ffd 100644
 +irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
 +gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nol=
ogin
 +nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
---
-2.32.0
-
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generat=
ion-of-the-documentation.patch b/meta/recipes-core/base-passwd/base-passwd/=
0007-Disable-generation-of-the-documentation.patch
new file mode 100644
index 000000000000..4a19f91c35a0
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-=
the-documentation.patch
@@ -0,0 +1,32 @@
+From 7ccf8227cb10d78f1958a7a7feed75a390a6b133 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Fri, 29 Apr 2022 13:32:28 +0000
+Subject: [PATCH] Disable generation of the documentation
+
+It uses tools currently not supported by OE-Core. It uses sgmltools
+and po4a.
+
+Upstream-Status: Inappropriate [OE-Core specific]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ Makefile.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 9ba097c..d3ea47c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -25,13 +25,10 @@ gen_configure	=3D config.cache config.status config.lo=
g \
+ 		  confdefhs.h config.h Makefile
+=20
+ all: update-passwd
+-	$(MAKE) -C doc all
+-	$(MAKE) -C man all
+=20
+ install: all
+ 	mkdir -p $(DESTDIR)$(sbindir)
+ 	$(INSTALL) update-passwd $(DESTDIR)$(sbindir)/
+-	$(MAKE) -C man install
+=20
+ update-passwd.o: version.h
+=20
diff --git a/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch b=
/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
deleted file mode 100644
index 5f357d88957c..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-
-We need to have a shutdown group to allow the shutdown icon
-to work correctly. Any users that want to use shutdown like
-the xuser should be added to this group.
-
-Upstream-Status: Inappropriate [Embedded]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: base-passwd-3.5.26/group.master
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- base-passwd-3.5.26.orig/group.master
-+++ base-passwd-3.5.26/group.master
-@@ -36,5 +36,6 @@ sasl:*:45:
- plugdev:*:46:
- staff:*:50:
- games:*:60:
-+shutdown:*:70:
- users:*:100:
- nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-docs.patch b=
/meta/recipes-core/base-passwd/base-passwd/disable-docs.patch
deleted file mode 100644
index 14c08b748476..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/disable-docs.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Disable documentation for now as it uses tools currently not supported
-by OE-Core. It uses sgmltools and po4a.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: base-passwd-3.5.28/Makefile.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- base-passwd-3.5.28.orig/Makefile.in
-+++ base-passwd-3.5.28/Makefile.in
-@@ -25,13 +25,10 @@ gen_configure	=3D config.cache config.stat
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
diff --git a/meta/recipes-core/base-passwd/base-passwd/input.patch b/meta/r=
ecipes-core/base-passwd/base-passwd/input.patch
deleted file mode 100644
index 3abbcad5d593..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/input.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Add an input group for the /dev/input/* devices.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
----
- group.master |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: base-passwd-3.5.26/group.master
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- base-passwd-3.5.26.orig/group.master
-+++ base-passwd-3.5.26/group.master
-@@ -12,6 +12,7 @@ uucp:*:10:
- man:*:12:
- proxy:*:13:
- kmem:*:15:
-+input:*:19:
- dialout:*:20:
- fax:*:21:
- voice:*:22:
diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch b/meta/=
recipes-core/base-passwd/base-passwd/nobash.patch
deleted file mode 100644
index b5a692295b06..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-use /bin/sh instead of /bin/bash, since the latter may not be included in
-some images such as minimal
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- base-passwd/passwd.master~nobash
-+++ base-passwd/passwd.master
-@@ -1,4 +1,4 @@
--root:*:0:0:root:/root:/bin/bash
-+root:*:0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch b/met=
a/recipes-core/base-passwd/base-passwd/noshadow.patch
deleted file mode 100644
index e27bf7d9becc..000000000000
--- a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-remove "*" for root since we don't have a /etc/shadow so far.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- base-passwd/passwd.master~nobash
-+++ base-passwd/passwd.master
-@@ -1,4 +1,4 @@
--root:*:0:0:root:/root:/bin/sh
-+root::0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/rec=
ipes-core/base-passwd/base-passwd_3.5.29.bb
index ef7792ae49c7..e5615991363e 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539fee=
f013de476e68b5c50a"
 RECIPE_NO_UPDATE_REASON =3D "Version 3.5.38 requires cdebconf for update-p=
asswd utility"
=20
 SRC_URI =3D "https://launchpad.net/debian/+archive/primary/+files/${BPN}_$=
{PV}.tar.gz \
-           file://add_shutdown.patch \
-           file://nobash.patch \
-           file://noshadow.patch \
-           file://input.patch \
-           file://disable-docs.patch \
-           file://kvm.patch \
-           file://disable-shell.patch \
+           file://0001-Add-a-shutdown-group.patch \
+           file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.pa=
tch \
+           file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.=
patch \
+           file://0004-Add-an-input-group-for-the-dev-input-devices.patch =
\
+           file://0005-Add-kvm-group.patch \
+           file://0006-Disable-shell-for-default-users.patch \
+           file://0007-Disable-generation-of-the-documentation.patch \
            "
=20
 SRC_URI[md5sum] =3D "6beccac48083fe8ae5048acd062e5421"
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


