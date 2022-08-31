Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6652ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:12:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.24145.1661944317127555356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eEWL5DpZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id k9so17826970wri.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qwNZSulCcv+rk4VKJYrNnXt4/WL+ZC0auOLoStKPm4E=;
        b=eEWL5DpZCtVue06JIFywstTIPvpX7zBbmg+ijNZC8ujhIvz21+B1zZxweEDVzMsuPp
         faRcRiCySWhlmTPExaL4/L8rqoLNLk37KAS7Fn9iDI/FZGtcYUPQpVrBy8z8bv8X9Qqt
         FxeW/FARHQy15s/43XLPjb/dHfLuJpr9wkWVBRaVlxqV+1R7aF9F3CRAExpGsACWY0R8
         Ygqj0eFBY1hqeVv4YTW10XMBZaK/umoUDyYvaN3OMSlDSBIqfu31IxYYgoKUfoT9n9yw
         3N4X0io8wC6CeCODP7N69CGIcX6PgzWBflo/QSL2MMIAbnuRja/j8dEy34GPhw+Pf2uJ
         xzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qwNZSulCcv+rk4VKJYrNnXt4/WL+ZC0auOLoStKPm4E=;
        b=U1xqPoMgE6ROKFyFpQkl+Wo7EQB0elxT805y9CjyPwFaDvVDqa9XYiDVjRHupX914V
         Id6CeOMfZTmzyZ0yUCVk1TwoMO77Ebnz+i39LzGABfFOyRwFASKKdMLkO2vyvDvXw0El
         NNL/2/YSV9A4yN0m3BA8qKYrjDFTpr17EfYjjMeYsMVxbJkLkvXU8rJekmPYdnvz0NAI
         wqcKRIn1r6rsq5SxvJ7AKRF0MSH64uQ7ioljGdj5OVhz3OdqRvkJXapFuDFpXlc6NpwO
         6Yk4CxBrF0KALT/O6sLlChfvi9f2Fqyu7AiOs3enDrvGnmMPWeQdJUfDW4IUKbNpJqli
         /ezA==
X-Gm-Message-State: ACgBeo2y7Rm/4gnli2EKMbNBDuAbng2I2GvsxcmTQqZtTy1uApWMyXSm
	hLEo+a+7b37loX1JI7v7wcXE5muv8B8=
X-Google-Smtp-Source: 
 AA6agR461eg3uXhUwbgoIYpi9wpNMM+pX+icjMBPzEcB6gwM7SfNcUbOcvQsuNHx049dtlioO12Nxg==
X-Received: by 2002:a05:6000:682:b0:226:e78d:2d7a with SMTP id
 bo2-20020a056000068200b00226e78d2d7amr3151664wrb.103.1661944315408;
        Wed, 31 Aug 2022 04:11:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003a5c999cd1asm2173848wmq.14.2022.08.31.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:11:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/conf: move default configuration templates into
 meta/conf/templates/default
Date: Wed, 31 Aug 2022 13:11:49 +0200
Message-Id: <20220831111149.3330156-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 11:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170100

This sets the ground for standardizing (and enforcing) the location of
configuration templates: let's start with the default one.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .templateconf                                               | 2 +-
 meta/classes-global/sanity.bbclass                          | 6 +++---
 meta/conf/{ => templates/default}/bblayers.conf.sample      | 0
 meta/conf/{ => templates/default}/conf-notes.txt            | 0
 meta/conf/{ => templates/default}/local.conf.sample         | 0
 .../conf/{ => templates/default}/local.conf.sample.extended | 0
 meta/conf/{ => templates/default}/site.conf.sample          | 0
 scripts/oe-setup-builddir                                   | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/conf/{ => templates/default}/bblayers.conf.sample (100%)
 rename meta/conf/{ => templates/default}/conf-notes.txt (100%)
 rename meta/conf/{ => templates/default}/local.conf.sample (100%)
 rename meta/conf/{ => templates/default}/local.conf.sample.extended (100%)
 rename meta/conf/{ => templates/default}/site.conf.sample (100%)

diff --git a/.templateconf b/.templateconf
index 0bf5ecf1e5..e399e06acd 100644
--- a/.templateconf
+++ b/.templateconf
@@ -1,2 +1,2 @@
 # Template settings
-TEMPLATECONF=${TEMPLATECONF:-meta/conf}
+TEMPLATECONF=${TEMPLATECONF:-meta/conf/templates/default}
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 4a403a2590..75c453d486 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -42,7 +42,7 @@ BBLAYERS_CONF_UPDATE_FUNCS += " \
 
 SANITY_DIFF_TOOL ?= "meld"
 
-SANITY_LOCALCONF_SAMPLE ?= "${COREBASE}/meta*/conf/local.conf.sample"
+SANITY_LOCALCONF_SAMPLE ?= "${COREBASE}/meta*/conf/templates/default/local.conf.sample"
 python oecore_update_localconf() {
     # Check we are using a valid local.conf
     current_conf  = d.getVar('CONF_VERSION')
@@ -62,7 +62,7 @@ is a good way to visualise the changes."""
     raise NotImplementedError(failmsg)
 }
 
-SANITY_SITECONF_SAMPLE ?= "${COREBASE}/meta*/conf/site.conf.sample"
+SANITY_SITECONF_SAMPLE ?= "${COREBASE}/meta*/conf/templates/default/site.conf.sample"
 python oecore_update_siteconf() {
     # If we have a site.conf, check it's valid
     current_sconf = d.getVar('SCONF_VERSION')
@@ -82,7 +82,7 @@ is a good way to visualise the changes."""
     raise NotImplementedError(failmsg)
 }
 
-SANITY_BBLAYERCONF_SAMPLE ?= "${COREBASE}/meta*/conf/bblayers.conf.sample"
+SANITY_BBLAYERCONF_SAMPLE ?= "${COREBASE}/meta*/conf/templates/default/bblayers.conf.sample"
 python oecore_update_bblayers() {
     # bblayers.conf is out of date, so see if we can resolve that
 
diff --git a/meta/conf/bblayers.conf.sample b/meta/conf/templates/default/bblayers.conf.sample
similarity index 100%
rename from meta/conf/bblayers.conf.sample
rename to meta/conf/templates/default/bblayers.conf.sample
diff --git a/meta/conf/conf-notes.txt b/meta/conf/templates/default/conf-notes.txt
similarity index 100%
rename from meta/conf/conf-notes.txt
rename to meta/conf/templates/default/conf-notes.txt
diff --git a/meta/conf/local.conf.sample b/meta/conf/templates/default/local.conf.sample
similarity index 100%
rename from meta/conf/local.conf.sample
rename to meta/conf/templates/default/local.conf.sample
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/templates/default/local.conf.sample.extended
similarity index 100%
rename from meta/conf/local.conf.sample.extended
rename to meta/conf/templates/default/local.conf.sample.extended
diff --git a/meta/conf/site.conf.sample b/meta/conf/templates/default/site.conf.sample
similarity index 100%
rename from meta/conf/site.conf.sample
rename to meta/conf/templates/default/site.conf.sample
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 5d644168cb..975619789a 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -69,7 +69,7 @@ fi
 
 unset SHOWYPDOC
 if [ -z "$OECORELOCALCONF" ]; then
-    OECORELOCALCONF="$OEROOT/meta/conf/local.conf.sample"
+    OECORELOCALCONF="$OEROOT/meta/conf/templates/default/local.conf.sample"
 fi
 if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
     cat <<EOM
@@ -85,7 +85,7 @@ EOM
 fi
 
 if [ -z "$OECORELAYERCONF" ]; then
-    OECORELAYERCONF="$OEROOT/meta/conf/bblayers.conf.sample"
+    OECORELAYERCONF="$OEROOT/meta/conf/templates/default/bblayers.conf.sample"
 fi
 if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
     cat <<EOM
@@ -125,7 +125,7 @@ EOM
 fi
 
 if [ -z "$OECORENOTESCONF" ]; then
-    OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
+    OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
 fi
 [ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
 unset OECORENOTESCONF
-- 
2.30.2


