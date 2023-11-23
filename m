Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0674C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:49:17 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.90974.1700747348720233955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=D82LYQN1;
 spf=pass (domain: baylibre.com, ip: 209.85.167.53, mailfrom: pidge@baylibre.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso1225085e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700747347; x=1701352147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLiaQ7yF2jU2dJgjr6hKykmy5MrE/mD7HbUcW4kTLIs=;
        b=D82LYQN19aOPb0zlHXt4X/NIDwLdrQ3e2xnxYWaTF4byEbisTAD7AGAeMMTFCCROV8
         xUh6Uwr3tZS+g+GYu0uaS9hcrP9UC1NWvEZ4x34X5583g2t4VYwTMdeb3cwJ4UG0HoGG
         bAHO7Jh3fW2R9eVIG2epTlX3kjW1t1gWNTC9Q4jk8/VJGDgCMHITlndKiTLXRqhjyKf7
         F1IObv886WQBVqnod0hlQC9v5fHE4fRFl+wF9vemcerF5z4Rk4lm/41pZwfmtdtbOsF+
         OWUFtR2/S05GQ3hTd5rWm59lLdIgK32p4Ir35V1RJs00MK4eVEUmmokjzOOESYtnVi8E
         niXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700747347; x=1701352147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLiaQ7yF2jU2dJgjr6hKykmy5MrE/mD7HbUcW4kTLIs=;
        b=GpOS8trbz4LkTmwZXbbK5+A/mLvGnvVzZ4jxdXBuX0q98BYk777of3htSNqnxf/vdf
         N7X9ZlUYYBu6IwBAjgUTl9xHSwte1fBdZqBpny1zdEQss+aPMFlUktpvirtiXdLObGe9
         S6i0cdel3Cp3CO4SiwEiApVTcqTZFRff42STHOTNZGcfH9+WYeEcctTaBH9BGSPkpiZT
         K4b00rFPErbSL0XIXSG/fV6CK3faNM+lRjrkW2O7wF9or/iqWBJkvYb0K2huAxhToyUM
         FdoBgZS/ymqGj1ij52Lx8HDrHL+7CBk7vYcV1mXdLlTMxW/ZVyC+kTphcT8e+jlCRZA/
         RRhg==
X-Gm-Message-State: AOJu0Yy3GmzTUIs7BmTsOMKcNadXjNrC+uNQ/8jfG2DcDxyXqgsQaHqF
	dHt2kyjMMOt1v6cVwPVXPWoBz7SbSVFfRHKlimM3NQ==
X-Google-Smtp-Source: AGHT+IF+NuVInFOHTmsNuknLIqw8n7VVSDZiZqi1vYZY1+J2dTdlnoXEbVbcIuPHeHPHlHLNlwNzPA==
X-Received: by 2002:ac2:554d:0:b0:507:9787:6776 with SMTP id l13-20020ac2554d000000b0050797876776mr3707110lfk.5.1700747346053;
        Thu, 23 Nov 2023 05:49:06 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4143000000b0032dde679398sm1754983wrq.8.2023.11.23.05.49.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 05:49:05 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC 2/2] useradd.bbclass: ensure sysroot_setscene for DEPENDS
Date: Thu, 23 Nov 2023 13:49:01 +0000
Message-Id: <c6d2ae3913582947c046d577a9dbf6dc8629909a.1700746611.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700746611.git.pidge@baylibre.com>
References: <cover.1700746611.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191155

[YOCTO #13419]

If recipeB creates a user and assigns it to a group created in recipeA,
we need to ensure two things:

That recipeA is in recipeB's DEPENDS (documentation issue) and that the
sysroot setscene, in the case of a TMPDIR wipeout, is in
USERADDSETSCENEDEPS.

RP and I discussed adding a USERADD_DEPENDS variable to deal with this,
but there is some magic around DEPENDS that a new variable wouldn't have
so I'm sending this as is for people to poke at.

This commit should also fix issues seen in the following bugs:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13279
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13904
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15084

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/classes/useradd.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4d3bd9a5f56..98c6999a0d2 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -177,6 +177,14 @@ SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
 
 SSTATEPREINSTFUNCS:append:class-target = " useradd_sysroot_sstate"
 
+python __anonymous() {
+    setscenedeps = ""
+    if "-native" not in d.getVar("PN"):
+        for pkg in d.getVar("DEPENDS").split():
+            setscenedeps += " %s:do_populate_sysroot_setscene " % pkg
+        d.setVar("USERADDSETSCENEDEPS", "%s %s" % (d.getVar("USERADDSETSCENEDEPS"), setscenedeps))
+}
+
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
 USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
-- 
2.34.1


