Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848CCC2BB45
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.22605.1659940966404998868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJ1x88rg;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id i14so14808861ejg.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GKcRNwHiO3a6ODH/KGkUcw4gfShy6Mr4U4f+xtLGTz4=;
        b=gJ1x88rgIIZtzElvvBvR8ukaZUSF44hGHTI0+iUM/BeLjbuxRZMJX6u5vpH10PbHiG
         kPJulsW2Pddm321HOaefZpYwYHMg0pmEPkOJLPVuDt75I8YXAtOJMNb8dvMqI2kPQujh
         +mretyZU2Nim9Zcjg8uWPIAfZl5k+mDg4WppETPmhCalzGjQ8Nfhoa7bPv/HFKxo0F7g
         5f2MdU63FGRZXcNpHcEPBVtlAn+K43ciFS09851avfLApmaUY5IzQhBm03LIf/VZjZ5g
         YSoUKdOsyfjsq9KspweyWHl5vfkm6BZvJpsqpmSH004jz7tQqmA3YwwTRfOLAqnKt8Ax
         5rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKcRNwHiO3a6ODH/KGkUcw4gfShy6Mr4U4f+xtLGTz4=;
        b=kdUUywcLU0ToutVBfzHMGGIdHmfJrGhuelk32T9SVTjPo36T8ld+hwVZFouiJHYd2b
         8aFiHlJAtN40CtNP+IS7uhr+odXIHIrWrNz51TwUSPtZm0NhnBc4vDh5LxpY6CpSb/sV
         YVQYRgO5qlnWbCCNffDJ762USYqmJbzJGEKyxg4lsT/sVfO6C1ROEFFtlVSUz3CQVrb0
         YRptVrV7XdqfJsUWAM+kPcfhF0aVzWi2zqXba8y9pefilNTtaz0YKrdfuwb/TB/iuRUG
         Scph8ItI0vC6kh2ugNerG0uUfOaCSRXQIxFl0OpAwH0K/t5zTbnpwlqCVeED4Ftm722L
         MWww==
X-Gm-Message-State: ACgBeo2bNb7L1fY6JPLZdTUoS05ERUs3otXBE1StznQ0rpG7JI2WTOzB
	cRAbaYSwsDHZibF15YAO0ZUCsg5aBPc=
X-Google-Smtp-Source: 
 AA6agR7uB8CvnY/7zgBwchrU9DylT8ilGL+CPMapssfzRKcYWR5y8eeFNC4vtXMuYHGBzjRd+AVApA==
X-Received: by 2002:a17:907:724f:b0:731:9ec:10fc with SMTP id
 ds15-20020a170907724f00b0073109ec10fcmr8877194ejc.427.1659940964943;
        Sun, 07 Aug 2022 23:42:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 03/44] dropbear: use git to get sources as the website is
 down
Date: Mon,  8 Aug 2022 08:41:56 +0200
Message-Id: <20220808064237.3975347-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169027

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


