Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3335DC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:25:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.71902.1656941107270933605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B591mIT3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 205-20020a1c02d6000000b003a03567d5e9so7569929wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnN0sL7mDtKGvnIQUDdSYiQtA0zD1PSDaaldQihDJjo=;
        b=B591mIT3dJ4N1G42qASds9thoDyG5bid4SFWdPTKHLd1WSGIipEziPNNP/3X0jFbyk
         mk5BRPrEMMvlnUm3swxcnGoxbL2lnWJ+50iezjiaSGK2uslOx3laH763df+qo0+hvztB
         UTVRR2ScP8+kkVMRlAol+/LPykeAkcZGOYAD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnN0sL7mDtKGvnIQUDdSYiQtA0zD1PSDaaldQihDJjo=;
        b=EYr8ylWLf8L9L7nIZJiOqIo59dJP6BvkV03QWcWNZdPlb32yC7+5gpwq4TYQ7+Ar6L
         OA1+0SZXJngl5CZMnHXnOsJCvZYcgvsTJt8L6KV1voVJCkO29ejH90KK4XtP8HN7nRSk
         9FIT4Bm7XCkow3h/EmneVHAqbJQS8o9E2e9QkUVm3R2K7sWyAzxjth5XOoaG1kxPFw9V
         h0nH5zrB+st6C8TWkj0vU96qQ4gAKNlolFh0gPadd+XDfN5EwQE3EML/ERkhT1DHOQOA
         wOYdGv7YczuufRz6sHImWC23yoFzaTctrUt+/rnLOzN6hDGn9x+x5ItKIpsleZyMza5h
         cQSA==
X-Gm-Message-State: AJIora+FKml9eInGylD4L9fCpcRBWiwIaZKsYAWrxbRSrX0szX9KW9C3
	VATXOKsMrULJykF72YbFYLD82Z31LCtKGA==
X-Google-Smtp-Source: 
 AGRyM1tbv6fkF5dZUV8CupRBLMM0GKe9b2Ixtsfv/e9QELBcKpvACbmYPmLV7AZRz+LygrUCNAFd9Q==
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id
 g39-20020a05600c4ca700b003a03905d441mr31265170wmp.159.1656941105395;
        Mon, 04 Jul 2022 06:25:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 t10-20020adfe10a000000b00210320d9fbfsm36410112wrz.18.2022.07.04.06.25.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:25:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gperf: Add a patch to work around reproducibility issues
Date: Mon,  4 Jul 2022 14:25:04 +0100
Message-Id: <20220704132504.913976-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:25:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167607

Add a patch to avoid writing the full pathname to gperf into source
files which leads to reproducibility issues.

This fixes issues with systemd reproducibility in particular.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gperf/gperf/reproducibility.patch         | 26 +++++++++++++++++++
 meta/recipes-extended/gperf/gperf_3.1.bb      |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.patch

diff --git a/meta/recipes-extended/gperf/gperf/reproducibility.patch b/meta/recipes-extended/gperf/gperf/reproducibility.patch
new file mode 100644
index 00000000000..9f80828dbd7
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf/reproducibility.patch
@@ -0,0 +1,26 @@
+By default gperf puts a header into generated files with the full path to
+the tool along with the commandline used. This patch removes the path to
+the binary, allowing reproducible source files (which can be included in
+debug source packages).
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: gperf-3.1/src/options.cc
+===================================================================
+--- gperf-3.1.orig/src/options.cc
++++ gperf-3.1/src/options.cc
+@@ -280,6 +280,13 @@ Options::print_options () const
+     {
+       const char *arg = _argument_vector[i];
+ 
++      if (i == 0) {
++          const char *shortarg = strrchr(arg, '/');
++          if (shortarg) {
++              arg = shortarg + 1;
++          }
++      }
++
+       /* Escape arg if it contains shell metacharacters.  */
+       if (*arg == '-')
+         {
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 82750fca05c..3564ac0805b 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -9,6 +9,8 @@ SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
 
+SRC_URI:append = " file://reproducibility.patch"
+
 inherit autotools
 
 # The nested configures don't find the parent aclocal.m4 out of the box, so tell
-- 
2.34.1


