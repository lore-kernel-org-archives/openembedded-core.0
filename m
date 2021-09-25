Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9810CC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 11:02:43 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.5737.1632567762837835642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 04:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=AlHFUN/d;
 spf=pass (domain: madison.systems, ip: 209.85.160.176,
 mailfrom: matt@madison.systems)
Received: by mail-qt1-f176.google.com with SMTP id j13so11986055qtq.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVQYw1A+kpotQFx9fWDSxbZR6NPmK5AaJ9shjaoEwdE=;
        b=AlHFUN/dzXrh5JgWVbLOTrKYCeRP4CpY5k1XTd1wrQUQpBRum0YBbSMPux8O0yhOFm
         TvVm5qOQOZVC/5gUmIOfS2CFCFZ+fmUUtGSIvj7tEY3LTLx9tKWUxcaD6z+hHLPyLKe+
         51nZoQuy5Ld98Xxc7L+XwhlR9xNRyYAY3iKNrnrDsaAHYzMcukOr9VdRut4nvDcFYyki
         uVc+2l1qXXgRVoTgD9k2yJEPmBC/Aq3w92b3izC+2RcqYkbjC3RfORBG6blgSMrQ2aVG
         E9uJeNUYZZqYq0Kq4lawFBaao0urSyvoEIDuj92lfLKeZGEGDa9zvHB8UST6ggDXypK9
         WU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVQYw1A+kpotQFx9fWDSxbZR6NPmK5AaJ9shjaoEwdE=;
        b=2IvIvIUkFSJRNzpF2KCRCsCHPyKZTUAXc/+1OhFoviFOqT1ijHb3IGmeWs2xGjD0wA
         Y2QS7yRi/uyOEIrLvBthgW3HS6+S2CY/9w5Us2XBWy06dub3rC6gnq7lMb+CBOko1FOf
         KyuM09LonyfPE7Qog/JTNQVqvVJn/I49bPjQ+90SqdCn5NijsWwu89JN5DAxsnShHDLI
         1Pz+djJqDvBDEnbi84e9jGQJ+wtrb1I5cGiBSyFmITcM3/k2hTbIzkwwd/ftmJRr0tFN
         y7ALBVpguJ03HNi+whjQ/KaYltIk76CxK5C5OUGNwWhZKW3CRoo2AQoad6065avuC9dT
         FX8w==
X-Gm-Message-State: AOAM532cSZ/tDxaL3fBuAcZBS021vey7jqv20x7G83grlgFhmliEB/V+
	qhp+Vszu/MP1H5kbMNqtMo+TbdttASXhBpLS
X-Google-Smtp-Source: 
 ABdhPJwwoGZVx1DWlqTCA+l1ZxGBqR4iLfibyDeLqIRbTh/7Yd58NrHDGEEfi4331A7WifMQrrgw3Q==
X-Received: by 2002:ac8:7613:: with SMTP id t19mr9048303qtq.365.1632567760181;
        Sat, 25 Sep 2021 04:02:40 -0700 (PDT)
Received: from visar.local ([76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 f83sm8453258qke.79.2021.09.25.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 04:02:39 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH 1/1] autotools.bbclass: use ordinary append for file-checksums
 update
Date: Sat, 25 Sep 2021 04:00:38 -0700
Message-Id: <20210925110038.50118-2-matt@madison.systems>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210925110038.50118-1-matt@madison.systems>
References: <20210925110038.50118-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 11:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156347

Commit 29daffc2410f06f36b779d5bf1fd1ef6e900ca8f added an
anonymous python function to append the site file dependencies
for do_configure. This causes any recipe that inherits allarch
after autotools to end up with a different set of file checksums
for each machine, since the anonymous python would get processed
before the TARGET_ARCH changes in allarch.

Use an ordinary += assignment to fix this.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/autotools.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index bc0c2ea83e..4ab2460990 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -149,10 +149,7 @@ python autotools_aclocals () {
     d.setVar("CONFIG_SITE", " ".join(sitefiles))
 }
 
-python () {
-    sitefiles, searched = siteinfo_get_files(d, sysrootcache=False)
-    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(searched))
-}
+do_configure[file-checksums] += "${@' '.join(siteinfo_get_files(d, sysrootcache=False)[1])}"
 
 CONFIGURE_FILES = "${S}/configure.in ${S}/configure.ac ${S}/config.h.in ${S}/acinclude.m4 Makefile.am"
 
-- 
2.30.2


