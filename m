Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74E8C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:35:06 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.7232.1708986900980124153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mo2iD/a7;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68f571be9ddso35268226d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986900; x=1709591700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDDX8laBqBka1sdfcLZ25d1heusp6PjdqNsW5zQAU9A=;
        b=mo2iD/a7wAKdzQVs37Y6u9WxV/iIqRrcdYXMKOxOHNA7w3Jxyom125oEtYhNq4e3mz
         xGvgc2RJQ2geWNSBV+psOhbGVEETK2gYu7HlKRMrDyTc8PjPE3MPvWLOMR1xcThc12a9
         ZFBAXQOnG6Ls1QIBm4nEBy6HHJ18aWoDBX2GKHrtrALXgtsmbiRhLY3Dr1Hw/LoUf1zZ
         t+KXo/5C+wHYJ+ilqoSJydvnRnrNEgn+SneMZ5ry5Y2SziD+bbWJTWwPQXPl1rstcxW6
         HVNSOrZS76x2fLwxJE8m8MlL1JKUHQdNWbhaVvHHznL+ycL01akvwcjwLFocQpHJNN9u
         Ox/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986900; x=1709591700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDDX8laBqBka1sdfcLZ25d1heusp6PjdqNsW5zQAU9A=;
        b=ANXoi0tp9ceJ6w21L5Pb3iBQRSHLjYeRnadYpSLSogEVeFvRT+xqx7A43Bs7If8UOi
         WpPOuYbyXelQTiHXZ0cd+Z28Nf0aKEqGTNxPQOJUS9RzNPG20ijIidYUWfiSPAWFSTJt
         +DV7losj+KjdLgE75IJocx/oFRD+nHPKvc3t3BB4wBVfZSk0j47vCQfZZRK6VjaGjrsn
         DfjkEZ+5gDXz6eV+4G2TcyPTEwsTa/LZGMcFbQzm/3bXsGqttk41mnfudQlkf8jbyJrL
         BE2NkBw8JsvFWhWOP5sXwnjTLI4A579Yw7qPQGUuIukyPm7bdkc09F2XR1Ac3MxGHXrM
         YVlA==
X-Gm-Message-State: AOJu0YwdI00dib3XNDC3wm+/yjg0YSkjjF9aUqEJUnmF0PSWvLgv6laQ
	nvYnZ9NZdPxCk868DjDCx/9K2nlhNehv5S9FqiSc3ea5GngIXitXE2kcPcu7
X-Google-Smtp-Source: AGHT+IHylh2yNEAOBjcemWVPaaEtazDk3kxrlYESDhHRVVv2JaVqBH2jEreKbyG+S4UaqIPG7sz2lw==
X-Received: by 2002:a0c:f093:0:b0:68f:477e:5e64 with SMTP id g19-20020a0cf093000000b0068f477e5e64mr421587qvk.45.1708986899918;
        Mon, 26 Feb 2024 14:34:59 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:34:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/6.6: config: x86 tidy & consolidation
Date: Mon, 26 Feb 2024 17:34:49 -0500
Message-Id: <ea05be7021e1fff79a32f994e03bb995cb3bca16.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708986570.git.bruce.ashfield@gmail.com>
References: <cover.1708986570.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196226

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Paul Gortmaker
    Email: paul.gortmaker@windriver.com
    Subject: BSP: remove from all - latencytop feature inclusion
    Date: Thu, 30 Nov 2023 14:07:48 -0500

    Consider this 5+ year old commit

        commit bcbc7bbc4fb967d8d4ae6333f71b73491a80b94e
        Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
        Date:   Thu Mar 1 16:00:41 2018 +0200

        latencytop: remove recipe

        Last commit and release were in 2009; website is down; it's a dead project.

        (From OE-Core rev: 36aae56e7f86a4d5ce93e4528e7dcc42f60c705e)

        Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
        Signed-off-by: Ross Burton <ross.burton@intel.com>
        Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

    Given that, it seems sensible to drop it from default inclusion across
    the BSPs.  I've left the feature itself, so anyone who still cares can
    easily manually add it still.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Paul Gortmaker
    Email: paul.gortmaker@windriver.com
    Subject: x86-64: separate out the NUMA features to our existing NUMA scc/cfg
    Date: Thu, 30 Nov 2023 14:07:45 -0500

    A user reported getting NUMA warnings like the ones reported here:

    https://www.suse.com/support/kb/doc/?id=000021040

    "Fail to get numa node for CPU:0 bus:0 dev:0 fn:1"

    ...and repeated for every core on the platform.  Distracting.

    When I asked if it was a crazy big server system with multiple CPU
    sockets and localized RAM near each socket - the answer was "no".

    Turns out they didn't choose NUMA support - rather we did it for them.

    Yocto has been and still remains more "embedded leaning".  That is not
    to say we can't support NUMA.  We just shouldn't be enabling it by
    default in the base x86-64 config fragment that everyone uses.

    Move the two NUMA settings that were not in our existing numa.cfg
    feature out of the BSP and into the feature.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Paul Gortmaker
    Email: paul.gortmaker@windriver.com
    Subject: x86-64: consolidate crypto options
    Date: Thu, 30 Nov 2023 14:07:44 -0500

    No functional change - just makes further reorganizations and
    refactoring more easy to review/parse.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index ab28df64cd..3b85917506 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "f0a5daf40acf2b457445f9b4f97f9eb2a3d1508a"
-SRCREV_meta ?= "7fa1deab7b048f2b8c5cad8268e48419e00b92fb"
+SRCREV_meta ?= "1a7881cb61f28deae2a90a93648a76fd4e1b0cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7ac6987582..a2234c4f57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "7fa1deab7b048f2b8c5cad8268e48419e00b92fb"
+SRCREV_meta ?= "1a7881cb61f28deae2a90a93648a76fd4e1b0cc2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2b93f5d185..141e1e4529 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
 SRCREV_machine:qemux86-64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
 SRCREV_machine:qemumips64 ?= "7c478488b642339d97ac55fd8b1acfd086e95c5c"
 SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "7fa1deab7b048f2b8c5cad8268e48419e00b92fb"
+SRCREV_meta ?= "1a7881cb61f28deae2a90a93648a76fd4e1b0cc2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


