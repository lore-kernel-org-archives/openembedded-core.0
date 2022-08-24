Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F50DC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 12:42:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.10401.1661344971152842789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 05:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AYCbkreD;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id k9so20643364wri.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 05:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qwNZSulCcv+rk4VKJYrNnXt4/WL+ZC0auOLoStKPm4E=;
        b=AYCbkreDBFWkV0P3RyLqnxmymzxmVU82/wYoMJ7nDJLa+Lwqw9pFjnTY2EHKoVvB9u
         2DuoQug+r+wke6Kg9Mrh0Q+j/CBf5rjINMq6gKv03vuY4TK/dFl71kKNpUSOgrwvMLRp
         3dNUv3KICTRDMcpDmZKiB3u5U49Q3Vc/o/wx7znhr6aIP5Gr0ISjYLyDSBXqvsO3dSmj
         aq8dZLETg4kkIhaRgBD+ANej0vIxzYhdy/DT+ZFysjzAcolDhG3QsIfwspl9UbsN6wN0
         QKXp5NrrS5IwpJH8EvJlvmwvSoqfiljkzyoQH9tCFkVkBnzQ0+cwIhfccyI3rmlI1LYS
         A7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qwNZSulCcv+rk4VKJYrNnXt4/WL+ZC0auOLoStKPm4E=;
        b=VM7wJy0JBMEfgpoOFW7DzspMisbCEG/6EAla3Qy0pCbE4f3VBK/4whkdbBhyIH8Eqe
         RXVFZhhIk5vebD0YLawZhrNEunK5yl7wmlY7WHMccmfj8TCDmQVCDgiWr00alLp1RCJZ
         BxJLxAJUa0M0LJ+u3SO9XNGk8eSLs1WZyQJHniERlU7OJgspRHAJvXV1430FHpGOYNHy
         c544Tyc10AEr3fI229fuSh+YjEWDXpWs6Rg9A2xFyV1E1mEWDWam2RaH+IAn/ae0kJZX
         w9WPVxT75PT7b60r09JmRdF9xhhPmj6iPxicYA8eGx8HdJH/B4nRHXY6OII4qCrSjEAi
         wImg==
X-Gm-Message-State: ACgBeo2R3Mwsl4V8gC/Q6FltkS430L+JpvBuwZ952g9yXL43HyNvh2r4
	eL/4ZrLe++Aqan94OyxC32UvdInQTzg=
X-Google-Smtp-Source: 
 AA6agR6r+pPYjaR5EN6u6P+C0STpHUxR7INRDegi0Pl8FuElu19fvg5mFHwAeZJZoBx+cLVkVeMqow==
X-Received: by 2002:a05:6000:1563:b0:222:c70e:b2a5 with SMTP id
 3-20020a056000156300b00222c70eb2a5mr16247354wrz.492.1661344969491;
        Wed, 24 Aug 2022 05:42:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003a32297598csm1778628wml.43.2022.08.24.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 05:42:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] meta/conf: move default configuration templates into
 meta/conf/templates/default
Date: Wed, 24 Aug 2022 14:42:33 +0200
Message-Id: <20220824124234.3549247-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 12:42:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169810

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


