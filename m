Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4E6C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 22:44:49 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.7768.1678315489081472175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 14:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e9x8Maa0;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id c3so106187qtc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678315488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAQhR9Cr2hJL1ZcyUkwaIdmGMuQpVBRcuNKSRVJJ/xg=;
        b=e9x8Maa0l2KUi36yVuhlDfP5tEhXY31QOHwec0CHmjrtIkpVGgZ9JRaWeMopdQ1kQz
         14phwAXWAAufawWvsYkFj+XSfouXuifR74wWtwga6z/zN5Fa9GqX4dWux2Zr6ILfLgSP
         b4kq1fnabeR8wdCqDcaIxi2l6njtZ+bZH1eyRTqeJUEJe69Y8AbSc1ArrvpuNGfPXd4S
         HHHYpkhuKSMtowsJvihRHFavsX6sAlSHy112vCbTyrqY7DNL7TuRQVd/E546SjUtSBhT
         9w51822L3AK2TfAXftNQg8f0i4kI+FNB4YXM1/gpmxjiHharr7R1Phz7lQ3k9+xVx6fj
         BQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAQhR9Cr2hJL1ZcyUkwaIdmGMuQpVBRcuNKSRVJJ/xg=;
        b=UawwwMTtGCWSyZ0yQqwY1PIRZJygfRF0JddPUcy3O98GfADlMO+uCdmoRu3Lxk9p0J
         ksZzqp1ARYZ+v6KVmlZqULvDqffZUayAbiQVdmR/xHXoCyeI4Xd1sCVAEO4bAmqSN4de
         UB6WNq5g+XKiFGG66A2a1BL2a/OD8/JIlgBRhNMXVcQ9Lx9aAhAFnp7CT4tIdBmuyo/k
         GAYUVj69kA9P0DcHCWlDNCZKB60gpJNENJCE9dKGXOeMJ5kqfGIdI/95T1PFh19WofUm
         fUed55YB7tits1ygIGc9U59sqoTG3gp1kYZX75ztDWw/ePQNFtJZlzf4FPBulNccLh33
         T/5g==
X-Gm-Message-State: AO0yUKVJucgsZVzodgI/I6QhWGoauQu2LTlwRDBCD6N+SuCNMBEWWe1h
	1j03O11jn1HvVB78PAOZ229Ggiu8Yh4=
X-Google-Smtp-Source: AK7set940ETtNiMxK0hPj3eP2eDSR2FZ41LWpvKENHA/FcKI/eVu80LKZ68RTZVveT4YOBnO08Yudw==
X-Received: by 2002:ac8:5d88:0:b0:3bf:cc89:9c8f with SMTP id d8-20020ac85d88000000b003bfcc899c8fmr33196535qtx.68.1678315487962;
        Wed, 08 Mar 2023 14:44:47 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id dt17-20020a05620a479100b00742f250ebc0sm12228087qkb.9.2023.03.08.14.44.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:44:47 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] cups: check PACKAGECONFIG for pam feature
Date: Wed,  8 Mar 2023 17:44:41 -0500
Message-Id: <20230308224442.33516-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230308224442.33516-1-twoerner@gmail.com>
References: <20230308224442.33516-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 22:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178203

The cups' PACKAGECONFIG is populated based on DISTRO_FEATURES, but a user
is free to enable or disable PACKAGECONFIGs at will. In theory it is
possible that pam is enabled globally in DISTRO_FEATURES but disabled in
cups' PACKAGECONFIG. Checking the PACKAGECONFIG to determine whether or not
pam is enabled would be a safer check rather than relying on DISTRO_FEATURES.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b8b655a4fb85..1b522d7d8535 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -74,7 +74,7 @@ do_install () {
 	rmdir ${D}/${libexecdir}/${BPN}/driver
 
 	# Fix the pam configuration file permissions
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
 	    chmod 0644 ${D}${sysconfdir}/pam.d/cups
 	fi
 
-- 
2.36.0.rc2.17.g4027e30c53


