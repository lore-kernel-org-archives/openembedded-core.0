Received: from mail.iot.bzh (mail.iot.bzh [51.75.236.24])
 by mx.groups.io with SMTP id smtpd.web08.10906.1612366126796800984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@iot.bzh header.s=20180822 header.b=edjI8FBm;
 spf=pass (domain: iot.bzh, ip: 51.75.236.24, mailfrom: julien.massot@iot.bzh)
Received: from 3c-8c-f8-f6-b6-1d.lorient.iot (112.6.193.77.rev.sfr.net [77.193.6.112])
	by mail.iot.bzh (Postfix) with ESMTPSA id 3C27C40097;
	Wed,  3 Feb 2021 16:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
	t=1612366124; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=t2w+gW1gLycxp0bIlrBQ1paU9v042QpnuQ8+//QjSQ8=;
	b=edjI8FBm0sVtKOqmyIkT0qCaxT4e2ZLy7Cr4YiTgTkQbuGKjymZYeVRYkvwUPAeDQeo4cz
	Wg/2lc3eHghqWmsWLmmOXmq3IGr+nps3Vi0nzFSfNZbcbLq12JralKWpMC0WSvfDCD38Sj
	as4c/ylpLONaD0Ai7QezJoxYIE5NeMnzPn+8h+nSicuMybj3GLRgGtxFooVk/iuYiQEK0B
	zzYHp4qvTSuz/O8U0x5PpBqMKamaW6f4ALUTCWbgrZD+ksNwJhpz2wU0B9lJci9Ked7hrf
	YoXDxNvysBOFr3jhonu/chG4rwi2AWM5Y1reb+ZBKOH3sKRemHNkQcNoT7UWkg==
From: "Julien Massot" <julien.massot@iot.bzh>
To: openembedded-core@lists.openembedded.org
Cc: Julien Massot <julien.massot@iot.bzh>
Subject: [dunfell][PATCH] rng-tools: fix rngd_jitter initialization
Date: Wed,  3 Feb 2021 16:28:37 +0100
Message-Id: <20210203152837.1474686-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

rngd daemon may spam the console when using an older version
than 6.11.

Backport patches from https://github.com/nhorman/rng-tools/pull/99/commit=
s

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 ...-O_NONBLOCK-setting-for-entropy-pipe.patch | 26 +++++++++++++
 ...ialize-AES-key-before-setting-the-en.patch | 38 +++++++++++++++++++
 ...ys-read-from-entropy-pipe-before-set.patch | 38 +++++++++++++++++++
 .../rng-tools/rng-tools_6.9.bb                |  3 ++
 4 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_ji=
tter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-rngd_ji=
tter-initialize-AES-key-before-setting-the-en.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0003-rngd_ji=
tter-always-read-from-entropy-pipe-before-set.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fi=
x-O_NONBLOCK-setting-for-entropy-pipe.patch b/meta/recipes-support/rng-to=
ols/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.pa=
tch
new file mode 100644
index 0000000000..3b44095cf5
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NON=
BLOCK-setting-for-entropy-pipe.patch
@@ -0,0 +1,26 @@
+From 6ce86cb5cf06541cd5aad70fe8494b07b22c247e Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <matthias.schiffer@tq-group.com>
+Date: Wed, 27 Jan 2021 16:10:32 +0100
+Subject: [PATCH] rngd_jitter: fix O_NONBLOCK setting for entropy pipe
+
+A pointer was passed to fcntl instead of the flags variable, setting
+random flags.
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
+---
+ rngd_jitter.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 32bac53..25b3543 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -465,7 +465,7 @@ int init_jitter_entropy_source(struct rng *ent_src)
+=20
+ 	flags =3D fcntl(pipefds[0], F_GETFL, 0);
+ 	flags |=3D O_NONBLOCK;
+-	fcntl(pipefds[0], F_SETFL, &flags);
++	fcntl(pipefds[0], F_SETFL, flags);
+=20
+ 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
+ #ifdef HAVE_LIBGCRYPT
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-in=
itialize-AES-key-before-setting-the-en.patch b/meta/recipes-support/rng-t=
ools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.=
patch
new file mode 100644
index 0000000000..34f8227543
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initializ=
e-AES-key-before-setting-the-en.patch
@@ -0,0 +1,38 @@
+From 330c2ba14510c8103b30d5021adb18f1534031a1 Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <matthias.schiffer@tq-group.com>
+Date: Wed, 27 Jan 2021 16:18:09 +0100
+Subject: [PATCH] rngd_jitter: initialize AES key before setting the entr=
opy
+ pipe to O_NONBLOCK
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
+---
+ rngd_jitter.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 25b3543..48f344c 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -463,10 +463,6 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 		pthread_mutex_unlock(&tdata[i].statemtx);
+ 	}
+=20
+-	flags =3D fcntl(pipefds[0], F_GETFL, 0);
+-	flags |=3D O_NONBLOCK;
+-	fcntl(pipefds[0], F_SETFL, flags);
+-
+ 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
+ #ifdef HAVE_LIBGCRYPT
+ 		/*
+@@ -487,6 +483,11 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 			ent_src->rng_options[JITTER_OPT_USE_AES].int_val =3D 1;
+ 		}
+ 		xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
++
++		flags =3D fcntl(pipefds[0], F_GETFL, 0);
++		flags |=3D O_NONBLOCK;
++		fcntl(pipefds[0], F_SETFL, flags);
++
+ #else
+ 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "libgcrypt not available. D=
isabling AES in JITTER source\n");
+ 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val =3D 0;
diff --git a/meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-al=
ways-read-from-entropy-pipe-before-set.patch b/meta/recipes-support/rng-t=
ools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.=
patch
new file mode 100644
index 0000000000..b3bc8028ea
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-re=
ad-from-entropy-pipe-before-set.patch
@@ -0,0 +1,38 @@
+From 36bc92ef2789b13183c8895d83665f48b13c2b9e Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <matthias.schiffer@tq-group.com>
+Date: Wed, 27 Jan 2021 16:22:39 +0100
+Subject: [PATCH] rngd_jitter: always read from entropy pipe before setti=
ng
+ O_NONBLOCK
+
+Even with AES disabled, we want to make sure that jent_read_entropy() ha=
s
+already generated some entropy before we consider the the source
+initialized. Otherwise "Entropy Generation is slow" log spam will be
+emitteded until this has happened, which can take several seconds.
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
+---
+ rngd_jitter.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 48f344c..b736cdd 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -492,6 +492,17 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "libgcrypt not available. D=
isabling AES in JITTER source\n");
+ 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val =3D 0;
+ #endif
++	} else {
++		/*
++		 * Make sure that an entropy gathering thread has generated
++		 * at least some entropy before setting O_NONBLOCK and finishing
++		 * the entropy source initialization.
++		 *
++		 * This avoids "Entropy Generation is slow" log spamming that
++		 * would otherwise happen until jent_read_entropy() has run
++		 * for the first time.
++		 */
++		xread_jitter(&i, 1, ent_src);
+ 	}
+ 	message_entsrc(ent_src,LOG_DAEMON|LOG_INFO, "Enabling JITTER rng suppo=
rt\n");
+ 	return 0;
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.9.bb b/meta/recip=
es-support/rng-tools/rng-tools_6.9.bb
index 913342c315..b8c6f022f3 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.9.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
@@ -10,6 +10,9 @@ DEPENDS =3D "sysfsutils"
=20
 SRC_URI =3D "\
     git://github.com/nhorman/rng-tools.git \
+    file://0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patc=
h \
+    file://0002-rngd_jitter-initialize-AES-key-before-setting-the-en.pat=
ch \
+    file://0003-rngd_jitter-always-read-from-entropy-pipe-before-set.pat=
ch \
     file://init \
     file://default \
     file://rngd.service \
--=20
2.29.2

