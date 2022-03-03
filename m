Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF92C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 11:18:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.9681.1646306336280888911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D1WMMaaQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d3so7312340wrf.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGScNjagdTuFYNHRcGIsvkEYGp/3oVqZqn7uFbwPyTU=;
        b=D1WMMaaQubrOg73hMSDjUC7QmOpZcAAhtc3O6DvtZq6U/tENFZ4zTjDi5o1pn0yoPo
         EL34loUNkMcSCNF/G0wop+0Vdo3S2x2AJ/ilQnecdbggcGq3gnX60k6uc5DubGN5qduY
         KTrlBp0XxbQki9n6OsRFQ2kRmFerE3dcyGHJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGScNjagdTuFYNHRcGIsvkEYGp/3oVqZqn7uFbwPyTU=;
        b=nWAktJiXVvrX4KgbmG7PDzPzziNkpAhxgeJmfHeD5bUIC2wnjm0lhnyERP6nzTEZUn
         tDGfrdURQJnF5Rps+uDzvOIKYO3Age2uMwMY9iGfsuSDaXUaiyCTM5Va7Xh0S1bGyoaJ
         A+3TA8JwrVJg6qixToLSAQUYJZKIFArAI4oJCe6BB7IqpefH57137v5AXa1vGwnuaE8z
         oUQK5DesHIfLA+G/V7dkfMzvgGnXPosOy9jhIWy/JkjijfsGgLO+qrB/C+hZ92nG65mI
         msb0TLlNymU3q1qIOLhhT+j8AoX42PPvNPohB+lps5vwUXMD8U+GogY6ukD5jV6+Ag+Q
         fq/Q==
X-Gm-Message-State: AOAM530JJkGqGhlPs1oJcABESjJ6F0YKdkNOCyav0LrUDKzYMJte2UZB
	byRMxi/+gusokF1NRVBOhMc9lnlx+mRIf0rU
X-Google-Smtp-Source: 
 ABdhPJwRgCBAjCkKdKqMA59PcjxjHBBJmEkxN0UL7tqP/4QLhg36X0KhYrNHERg0VsPh6jXAuOQUFQ==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr26669564wrn.246.1646306334271;
        Thu, 03 Mar 2022 03:18:54 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b001e6114938a8sm1708894wrs.56.2022.03.03.03.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 03:18:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsndfile: Fix missing external library support
Date: Thu,  3 Mar 2022 11:18:52 +0000
Message-Id: <20220303111852.323319-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 11:18:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162650

The recent upgrade regressed codec support since opus is missing and
this caused several codecs to be disabled. Add a patch to work around
the issue whilst it is discussed with upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsndfile/libsndfile1/noopus.patch       | 55 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch
new file mode 100644
index 00000000000..6bcb9324298
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch
@@ -0,0 +1,55 @@
+We don't have opus in OE-Core which causes all the external libs to be disabled 
+silently. The silent issue is discussed in the link below and hints a patch
+to make things configurable may be accepted.
+
+This patch removing the opus piece at least gets most of the functionality
+we previously used back whilst the issue is discussed.
+
+Upstream-Status: Pending [https://github.com/libsndfile/libsndfile/pull/812]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libsndfile-1.0.31/configure.ac
+===================================================================
+--- libsndfile-1.0.31.orig/configure.ac
++++ libsndfile-1.0.31/configure.ac
+@@ -361,13 +361,13 @@ AS_IF([test -n "$PKG_CONFIG"], [
+ 				enable_external_libs=yes
+ 			])
+ 
+-			AS_IF([test "x$ac_cv_flac$ac_cv_ogg$ac_cv_vorbis$ac_cv_vorbisenc$ac_cv_opus" = "xyesyesyesyesyes"], [
++			AS_IF([test "x$ac_cv_flac$ac_cv_ogg$ac_cv_vorbis$ac_cv_vorbisenc" = "xyesyesyesyes"], [
+ 					HAVE_EXTERNAL_XIPH_LIBS=1
+ 					enable_external_libs=yes
+ 
+-					EXTERNAL_XIPH_CFLAGS="$FLAC_CFLAGS $VORBIS_CFLAGS $VORBISENC_CFLAGS $SPEEX_CFLAGS $OPUS_CFLAGS $OGG_CFLAGS "
+-					EXTERNAL_XIPH_LIBS="$FLAC_LIBS $VORBIS_LIBS $VORBISENC_LIBS $SPEEX_LIBS $OPUS_LIBS $OGG_LIBS "
+-					EXTERNAL_XIPH_REQUIRE="flac ogg vorbis vorbisenc opus"
++					EXTERNAL_XIPH_CFLAGS="$FLAC_CFLAGS $VORBIS_CFLAGS $VORBISENC_CFLAGS $SPEEX_CFLAGS $OGG_CFLAGS "
++					EXTERNAL_XIPH_LIBS="$FLAC_LIBS $VORBIS_LIBS $VORBISENC_LIBS $SPEEX_LIBS $OGG_LIBS "
++					EXTERNAL_XIPH_REQUIRE="flac ogg vorbis vorbisenc"
+ 
+ 					if test x$ac_cv_speex = "xyes" ; then
+ 						EXTERNAL_XIPH_REQUIRE="$EXTERNAL_XIPH_REQUIRE speex"
+@@ -716,7 +716,7 @@ AC_MSG_RESULT([
+ 
+     Experimental code : ................... ${enable_experimental:-no}
+     Using ALSA in example programs : ...... ${enable_alsa:-no}
+-    External FLAC/Ogg/Vorbis/Opus : ....... ${enable_external_libs:-no}
++    External FLAC/Ogg/Vorbis : ....... ${enable_external_libs:-no}
+     Building Octave interface : ........... ${OCTAVE_BUILD}
+ 
+   Tools :
+Index: libsndfile-1.0.31/src/ogg_opus.c
+===================================================================
+--- libsndfile-1.0.31.orig/src/ogg_opus.c
++++ libsndfile-1.0.31/src/ogg_opus.c
+@@ -159,7 +159,7 @@
+ #include "sfendian.h"
+ #include "common.h"
+ 
+-#if HAVE_EXTERNAL_XIPH_LIBS
++#if 0
+ 
+ #include <ogg/ogg.h>
+ #include <opus/opus.h>
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index 9f1a106600b..ea14fe29cb5 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -9,6 +9,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 
 SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
+           file://noopus.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.32.0


