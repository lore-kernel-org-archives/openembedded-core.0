Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C45AC54EAA
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.34084.1674440520626613246
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Cgt5RY4r;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id o13so10412805pjg.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCWC4wlYGLBImPqzBpidmgSI7uPiKBPbUVZhb3PoWJo=;
        b=Cgt5RY4reMS1AkV2iXILcEILfPdL4zxwIKtVH5OcLUlZdUmwyOV7xtZM66eBOqtV8l
         pnCe8aBHnEjKmtBBrsAkUgniA1k7vCrvneEdyQBtnQ0nze43a2ZinCAMVVt43G6oZlvk
         Gsey7PU/HhVpKoCrOg5V5Gvf16K4O46Z057qeXWarcQvrHrpCAHGhilNpr/wblUgzCaD
         t/g7NXhHV3dvkCGEicMkpJLrONEvIsw9mER4r1lbvaQNgNdihpAiaP1vepGN9N7xMLbh
         lgD9bXLOLQFkAYBCaqllc4qaf8abApdSmKHA17nCW6of9hb3tg4wC4C8d5NzEUc0SXOY
         8gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCWC4wlYGLBImPqzBpidmgSI7uPiKBPbUVZhb3PoWJo=;
        b=G5Cx7MlfCU1q6qyLgBGFc2MHWarlgM/I0WoiS7CG/aPNp7Dy3MnHWmQKO5p5sLB8DH
         sHzcb0W5nYTF9+6WZ7Ae73iNxGkYg/CT2mSQRRlVlNXgf8DC0nthVgKPeF/1zKiJkrW+
         5t3rE5kUZ/VWNYOk8X9oteSBEAgcqW9AwHGERLdnTQsDAhtK+GuHlDBALZSolBoA6js1
         WhBUegIXHsFW/2pc+8+qCo/Wkop2gadlcmQ4T5Af1Se2rCjeS4agg6zEc4d6Wi/CxkGv
         EAvUSfhfpOxUcTDtdJmz95QHw7A0qX7Cc87dIvFWVYSwBkIuWB1z04VAE9TN9lX0262G
         1rsQ==
X-Gm-Message-State: AFqh2kqrTByp9ZZ55++fH1qHAqdx2VuVexzfjG0R5ZkXXBu0T001nInd
	f5ZG29HzXmk9pB81sLPTYtj1n9g8EDQzJR7mWbI=
X-Google-Smtp-Source: AMrXdXuPMyzzzACPxqtSuXjZm3dKIqo4msbFE/UmTQeV/yRmLLEFrgu+AHqwBoEkkUUd+wVhb/qOcQ==
X-Received: by 2002:a05:6a20:6997:b0:b8:a5a1:ed7c with SMTP id t23-20020a056a20699700b000b8a5a1ed7cmr30432989pzk.44.1674440519582;
        Sun, 22 Jan 2023 18:21:59 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/32] libksba: update 1.6.2 -> 1.6.3
Date: Sun, 22 Jan 2023 16:21:03 -1000
Message-Id: <0c1829b0e7e085ba8aef0d47852abf520ef9d635.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176273

From: Alexander Kanavin <alex.kanavin@gmail.com>

Noteworthy changes in version 1.6.3 (2022-12-06)

Fix another integer overflow in the CRL parser. [T6284,CVE-2022-47629]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83f3f21b1b84ab9e7b461ac966691c80f4ed4e97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit f098cb5073051eb371f4142678b4b3d5e7b52426)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch        | 6 +++---
 .../libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index af96bd57cd..bdb80ff34d 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 6081640895b6d566fa21123e2de7d111eeab5c4c Mon Sep 17 00:00:00 2001
+From ca8174aa81d7bf364b33f7254a9e887735c4996d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index 6b55bb8..6e7336f 100644
+index 452c245..aa96255 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
 @@ -23,37 +23,6 @@ dnl with a changed API.
@@ -44,7 +44,7 @@ index 6b55bb8..6e7336f 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$KSBA_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG ksba --exists; then
 -      KSBA_CONFIG="$GPGRT_CONFIG ksba"
 -      AC_MSG_NOTICE([Use gpgrt-config as ksba-config])
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.3.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.2.bb
rename to meta/recipes-support/libksba/libksba_1.6.3.bb
index f6ecb9aec4..dc39693be4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.3.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
+SRC_URI[sha256sum] = "3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.25.1


