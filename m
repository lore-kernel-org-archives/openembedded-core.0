Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAE6C25B06
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:38:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.22579.1659940732839812224
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CX+G4zg6;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id qn6so2976883ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GKcRNwHiO3a6ODH/KGkUcw4gfShy6Mr4U4f+xtLGTz4=;
        b=CX+G4zg6EPl1RzJQULiNg/wA5c0lOKmpRnhqp9LrEU204FwLmwm1DoU4aVH1odspKW
         ZNjNaO+52+8M4MW0BS2TEjkDezCGTvL8mH2ufSLX5IQTH1DhuMaJ/UnG6m1yBSdEEx0Z
         Gol9Yv41eLz/cNnaTJghDqu56SwaZfeVG6Jw0hExd6pEd5m2oTAhPta78jTIp+978/ev
         c6D3snAl6t17xf7C4HgYd8Si1rH3PSy/yMin/tMJ2qZlf6MqPewE82ewRo010WhVbALk
         tQtsVNnJ7nja2V0Dh4jyG3y2OWNNhZ9kn5O3r4yvXFxYpboH1xkTWvxzREf8KHwRWbu8
         hpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKcRNwHiO3a6ODH/KGkUcw4gfShy6Mr4U4f+xtLGTz4=;
        b=rbuvDrDd/Qy/GlTqvloxGcFqXTCEtGgWvuHt5tIqatCACuM27MKraZgLn9RTZrhwnL
         W+6ONDKbohjGc8Yexu6B/mGLMk0YNyTqRMr6rJl80PtWpbRbHXC2ymkDSJJlcACxtOKk
         SNiTNZL0gWT7SZCkU8506VeTreHIFxQ0eP78wJv6Pya6Vcw61qnwZayZDOSfSZrBH9jI
         x4uyIXRmMUpUcW8riChZm1TtFnZPOzS47tzMedH7C4VIfhjpmZlnhfizKIFOz9XcKgMo
         RV1FbVCSqHo7/l3CM83ZL5WqEDitPQf/B1gPsZzYUw2KRaQQ+hkY7FgrGDmNXsR2TozK
         9kgQ==
X-Gm-Message-State: ACgBeo2owUgWZq5lP/nA50KqxSkT/AY7OmlxDaZTbjHFNQaUfN2K+NxH
	CA+VIIl+zgVAtsqMinP2G9juAhu0N+M=
X-Google-Smtp-Source: 
 AA6agR7xsSWoPxtaJM1WDJcM1f60I68rtEgKvp7rVknLavlFgYA6Vw2auTURmYr1EZSoCp7LbRRjdA==
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr12648027ejc.49.1659940731382;
        Sun, 07 Aug 2022 23:38:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/45] dropbear: use git to get sources as the website is down
Date: Mon,  8 Aug 2022 08:38:01 +0200
Message-Id: <20220808063843.3975130-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169017

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/dropbear/dropbear_2022.82.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
index e170587d08..cff2e6c024 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
@@ -14,7 +14,7 @@ RCONFLICTS:${PN} = "openssh-sshd openssh"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+SRC_URI = "git://github.com/mkj/dropbear.git;branch=master;protocol=https \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://init \
            file://dropbearkey.service \
@@ -23,6 +23,8 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
+SRCREV = "b8669b063bd2fc1906a13fb4b50c8b4697bf49ce"
+S = "${WORKDIR}/git"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.30.2


