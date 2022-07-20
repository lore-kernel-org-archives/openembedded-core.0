Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E06CCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.51507.1658306722259866743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FBYrcRAx;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id m16so22829733edb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zv4YIJ/UffoteLIMAQyJH7zR5D+W9OxR+GPL8dKfamA=;
        b=FBYrcRAxyVaYki5si1082erw75QMAmVbhFyDxI52X0fuXV5eS67L5+k77+qVFOVX7F
         eNlGrlohLuY2HrDMILEFbsfzLlhSbl0Tf5VyOk/IqW+PHv82GuCQqJGE3ttxsofV5Jfa
         qpKg46Q3d4qgXyt/fY7dFMiwZk6t1S0QZm2opj/h76t46qmLyrVEgWxmcrJvT4nKFNf2
         sivOy+0LkpYZ7pLjkRyyiVpFQqT4uSGpYkMjdEDUcHrgEtRPw/1NmEmx++6qnvlgajJc
         mh3ej7fSLcx2LWtWS9Mvs4BzNdUhDOp791ltFQ5GIuaPh64WVlXeDCMCOdhqbzQQgilo
         lXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zv4YIJ/UffoteLIMAQyJH7zR5D+W9OxR+GPL8dKfamA=;
        b=QKvZjnwf5g5VIIwIxmHpOzEt8i1lxZrqq1U4Qw7vomioftI9oKELX5f7fyj1UndRLR
         A//Om5KWnFBBB+M1W9+PSVtaWuF2lEG6PF79yFMx53SSb2C+PPFDMdMJSzvzfXrT9QiZ
         qI/MvF1im87E/EQWcOmEnfDk44MF2NEraH7E23lFlvzWz4SXdNmWz0e1SH7j81i3bkZx
         IJSLqt9igRpxSpm7/RTDbhGCRRpj9iKfiECJQ7gaLAiO4n/tsGOOLLQpqiW+ISXf8B4v
         QZnQXorPkcmPtZMsbqWxJaiqeLawhnjO5GBDdKi0fhQBuNAZ2aKZDTv6ux/0XPcVbh1r
         EnDA==
X-Gm-Message-State: AJIora/2Y9enZ5uTe0NpmfzDIvUcGarE5SrgHVjhKJE2fYCyDWJNNlJj
	oK2qJTwA+VKTOpZUenQ6bGRTtdfqcQE=
X-Google-Smtp-Source: 
 AGRyM1tZL8hrgUPLNbBWJF0ZnvSVL5VxK2X9AytxjqIc94sWUpa5uBtnlYQU9l92MHHm8b9d6dY0XA==
X-Received: by 2002:a05:6402:3690:b0:43a:83f8:93bf with SMTP id
 ej16-20020a056402369000b0043a83f893bfmr43725304edb.49.1658306720679;
        Wed, 20 Jul 2022 01:45:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/51] libnotify: upgrade 0.7.12 -> 0.8.0
Date: Wed, 20 Jul 2022 10:44:23 +0200
Message-Id: <20220720084442.2940187-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168326

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libnotify/{libnotify_0.7.12.bb => libnotify_0.8.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.12.bb => libnotify_0.8.0.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.12.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.0.bb
index 21e737fd45..9c9af87e1a 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "744b2b37508135f8261b755a9debe6e09add421adc75bde930f6e198b70ab46e"
+SRC_URI[archive.sha256sum] = "46a26f0db4e64cf24016291eb1579ed9f0ba7611fe6cd9e1afec8f42780d3924"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.30.2


