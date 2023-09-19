Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DF1CD54BE
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 11:53:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6381.1695124414578744526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 04:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gjNgefo2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B36240002;
	Tue, 19 Sep 2023 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695124412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pHIzGH/+Rj+vYxF3t2zVO7B0dH5FHBf/Xcsu15C6NMU=;
	b=gjNgefo2nn1GFYqEOnpfDdO3K0LnQoBt/obTsZ9vVty/xxnWEAsrpqO3p7CJXgsACvgGIz
	QzwJM5OI1Y+aEJgWOlpM4wkUj5W2IvsWA7YKKZxx4er0sU5+ZL3AKI1FzU1Hk1fL3+Z0MW
	ERk5AbQIxxBJ/Dn3g6yECOGS0LVkARpYjq6PepQefLWio94veLgFx8qaL1wwUP15LgQVn3
	1brQn1Vwa9KsAb9IfwSJTwN51g8HPr4wIt00HRLDaeiR3diriCBcokEFtXFMcEATPdyUXK
	oUz05lNaXd7xntYWGkKHKtUu5+cBIzjHWilHRbdscsopTyY0FzOR+TJ8TYEXtg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] alsa-lib: upgrade 1.2.9 -> 1.2.10
Date: Tue, 19 Sep 2023 13:53:19 +0200
Message-Id: <20230919115320.2983439-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 11:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187855

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Changelog:
- Fix symver build error on non-ELF platforms
- ucm: main - remove cast to pointer from integer of different size warning
- ucm: mark internal functions static
- topology: fix src/mixer/mixer.c return value warning
- dogyxen: fix topology.h warnings
- doxygen: fix broken examples links
- doxygen: include docs for shmarea functions
- doxygen: conf: do not hide PCM specific function
- doxygen: silence warning from asoundlib.h
- doxygen: ucm: silence warnings
- doxygen: topology: silence 'not documented' warnings
- doxygen: global: silence 'not documented' warnings
- doxygen: namehint: silence 'not documented' warnings
- doxygen: seq: silence 'not documented' warnings
- doxygen: conf: silence 'not documented' warnings
- doxygen: rawmidi: silence 'not documented' warnings
- doxygen: control: silence 'not documented' item warnings
- doxygen: pcm: silence 'not documented' warnings
- doxygen: include external control docs
- doxygen: fix inadvertent link requests
- doxygen: fix list indentation errors
- doxygen: escape xml tags
- doxygen: fix image path
- doxygen: fix broken parameter name tags
- doxygen: Fix missing group end markers
- reshuffle included files to include config.h as first
- configure: add AC_SYS_LARGEFILE
- seq: Fix wrong seq version update at snd_seq_hw_get_client_info()
- seq: Add overflow check in snd_seq_ev_set_ump_data()
- test: oldapi - fix the clang-16 compilation error
- rawmidi: Suppress error messages for non-fatal errors
- seq: ump: Fix typo in function name containing "group"
- pcm: hw: fix minor bug in sw_params ioctl
- seq: Add UMP 1.1 features
- ump: Add UMP 1.1 features
- uapi: Update rawmidi API to 2.0.4
- seq: Add UMP support
- uapi: Update asequencer.h definitions for 1.0.3
- ump: Add helpers for handling SysEx data
- ump: Add helpers to parse / set UMP packet data
- control: Add UMP Endpoint and Block info query support
- control: Add UMP device query support
-- ump: Add initial support
- rawmidi: Add UMP ioctl support
- uapi: Update control API to 2.0.9
- uapi: Update rawmidi API to 2.0.3
- remove extra trailing new line in SNDMSG and SNDERR calls
- usecase: add CaptureMicInfoFile field to documentation
- include: fix SND_DLSYM_BUILD_VERSION() for static build
- pcm: hw - prevent divide by zero for broken apps

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...STRING-macro-outside-PIC-ifdef-block.patch | 52 +++++++++++++++++++
 .../{alsa-lib_1.2.9.bb => alsa-lib_1.2.10.bb} |  6 ++-
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.9.bb => alsa-lib_1.2.10.bb} (88%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
new file mode 100644
index 0000000000..a75300f51f
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
@@ -0,0 +1,52 @@
+From 10bd599970acc71c92f85eb08943eb8d3d702a9c Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Wed, 6 Sep 2023 15:16:44 +0200
+Subject: [PATCH] global.h: move __STRING() macro outside !PIC ifdef block
+
+From: Jaroslav Kysela <perex@perex.cz>
+
+It solves the musl libc compilation issue.
+
+control.c: In function 'snd_ctl_open_conf':
+../../include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaratio]
+   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
+      |                                    ^~~~~~~~
+
+Fixes: https://github.com/alsa-project/alsa-lib/issues/350
+Upstream-Status: Accepted
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+ include/global.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/global.h b/include/global.h
+index dfe9bc2b..3ecaeee8 100644
+--- a/include/global.h
++++ b/include/global.h
+@@ -51,6 +51,11 @@ const char *snd_asoundlib_version(void);
+ #define ATTRIBUTE_UNUSED __attribute__ ((__unused__))
+ #endif
+ 
++#ifndef __STRING
++/** \brief Return 'x' argument as string */
++#define __STRING(x)     #x
++#endif
++
+ #ifdef PIC /* dynamic build */
+ 
+ /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
+@@ -71,11 +76,6 @@ struct snd_dlsym_link {
+ 
+ extern struct snd_dlsym_link *snd_dlsym_start;
+ 
+-#ifndef __STRING
+-/** \brief Return 'x' argument as string */
+-#define __STRING(x)     #x
+-#endif
+-
+ /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
+ #define __SND_DLSYM_VERSION(prefix, name, version) _ ## prefix ## name ## version
+ /**
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
similarity index 88%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
index d482e27683..83bc6877d2 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
@@ -9,8 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch \
+           "
+SRC_URI[sha256sum] = "c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


