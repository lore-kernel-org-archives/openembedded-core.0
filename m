Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A01C48BC1
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:19:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.27560.1707862746535307570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGkqr2K0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-561587ce966so330649a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707862745; x=1708467545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KkiH9Dcv4fI8DL20xuDzNm1v6LbwAhrAagg3ZEQzCU=;
        b=KGkqr2K0NKVBcxkBuPwV+lc19TvrefOIUd0wImUKazUNXetBpkxNItAZ8K56ihUINe
         y4a3Y/fmmZftc0RBe1XpHBy/fPAD7cWHBHPtzwS1ZvEoA0viX1pSDw6iCezYc/9rQj5k
         8kUruEDgcbC04OVq8nkCEZ1GCHGPMGcgQceW5DatMPh75imQl/cjjc15uX+x+hUxN50K
         UMhWvFNCA37oRgxyrmwz1kzxoC4nXDBN0+cZSm7hKbrofd9GSeJH/64/aixIMe4vDY9K
         D3qJ1xIme/vUBXmgSmScX5WDfaigEuouK8sUaI0lxF+GArK5ozbjrtuVPNHoaXDLkrf9
         6ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707862745; x=1708467545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KkiH9Dcv4fI8DL20xuDzNm1v6LbwAhrAagg3ZEQzCU=;
        b=i1wUgzZJRRQaD10JJWoxuKMy4/2xVF987lQmlwgWsBwoLMDl4GMrTxzmwDK2u6ANVd
         NUVC7BGUQLhl3VliGPsglgQjWxu/qtU0zcwX1TrMaPQRCd9lrKyrviuGzvF4JZpGNAUm
         hG2OK6Dc/gW7N8l8r7WmO6uZoG6rVT55EhpJNRlcY4qzd1fBSALKYzY/aAb1wY+uRjtI
         duzViTVfVGb6M72GedOprxnQC/GS4qMnJrD7sz9yZbcMxj8jQNHAy66QJeRT380V06+E
         nT8sBOmSQ1Xt+Zt3fhqwwMbOaVVPSMeRkG8ZVw+07+sLivgtO9xSwtNjxp94lSGbWuwq
         qRcA==
X-Gm-Message-State: AOJu0YyxifC254daD7PWncppDlZUv+z6Rde/b2oy6KRdb/qOYTJ1IYLE
	kZ2/WnP88IajpYG9WuVMQ3UVs8Mg9wfCS8Egx1f+Xe/f76E+W6mq0WT/iWSj
X-Google-Smtp-Source: AGHT+IFjlE0de3echhcMLu2Cl3qVFgIAOYgXe6TPGv9yegxK1H7oYb4lbhXiGMV+TpGzFILhpweMEg==
X-Received: by 2002:a05:6402:530d:b0:561:f0f1:5e01 with SMTP id eo13-20020a056402530d00b00561f0f15e01mr132989edb.10.1707862744619;
        Tue, 13 Feb 2024 14:19:04 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b005612987a525sm4027137edx.89.2024.02.13.14.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:19:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/4] oe-init-build-env: add OEINIT variable
Date: Tue, 13 Feb 2024 23:18:06 +0100
Message-ID: <20240213221846.109260-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213221846.109260-1-adrian.freihofer@siemens.com>
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195441

Introduce a new OEINIT variable which can be used by templates.

OEINIT refers to the directory where the oe-init-build-env script is.
The template engine needs this information to generate the .vscode
directory and the settings.json file.

For the most basic use case where only poky is used, the build folder
and the .vscode folder can be generated in poky. That means
OEINIT = OEROOT --> poky.

If more layers are used or a different folder structure is used the
build folder and the .vscode folder should probably be at a different
location, where the OEINIT variable is required.
One use case is a layer structure like this:

my-top-dir                <-- OEINIT
  build                   <-- BUILDDIR (=BBPATH)
  .vscode
    settings.json
  oe-init-build-env
  my-layer
  meta-oe
  poky                    <-- OEROOT
    oe-buildenv-internal
    oe-setup-builddir

Having this infrastructure in the core allows for example overriding
the oe-init-build-env script in my-top-dir like this:
  OEINIT=$(dirname "$THIS_SCRIPT")
  OEINIT=$(readlink -f "$OEINIT")
  OEROOT="$OEINIT/poky"

Many different folder structures should be supported by this concept.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 oe-init-build-env         | 6 ++++++
 scripts/oe-setup-builddir | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 38333ab8582..14917a425ee 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -41,12 +41,18 @@ if [ -z "$OEROOT" ]; then
 fi
 unset THIS_SCRIPT
 
+# OEINIT is where the oe-init-build-env script is located.
+# If this script is provided by a different layer OEINIT != OEROOT.
+OEINIT="$OEROOT"
+
+export OEINIT
 export OEROOT
 . "$OEROOT"/scripts/oe-buildenv-internal &&
     TEMPLATECONF="$TEMPLATECONF" "$OEROOT"/scripts/oe-setup-builddir || {
     unset OEROOT
     return 1
 }
+unset OEINIT
 unset OEROOT
 
 [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 1b5dc55743e..dfd9acbb2cf 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -93,7 +93,8 @@ EOM
     # bitbake without the init script after the first run.
     # ##COREBASE## is deprecated as its meaning was inconsistent, but continue
     # to replace it for compatibility.
-    sed -e "s|##OEROOT##|$OEROOT|g" \
+    sed -e "s|##OEINIT##|$OEINIT|g" \
+        -e "s|##OEROOT##|$OEROOT|g" \
         -e "s|##COREBASE##|$OEROOT|g" \
         "$OECORELAYERCONF" > "$BUILDDIR/conf/bblayers.conf"
     SHOWYPDOC=yes
-- 
2.43.0


