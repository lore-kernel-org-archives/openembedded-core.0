Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65568EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:06:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8358.1687183565573106294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=G+4wRCeF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9b1a117caso7363545e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687183564; x=1689775564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZPNXdg0Kb1M8cqoVAYxEpPVj+lDYROrNKyik4GIUU8=;
        b=G+4wRCeFAu+Vs+GRdL7APChkACoz8rBF3ViAGo5A5VRagMynhoGOTfyWYq9l0Tzmwl
         /HgUjhtFWtfZ8WBXHiMNKHmoZqcH9q+0Dt5f8ZCsvgnqbZdPyfD2f+zGr+PTXPZSR6KL
         MTapU2CkWJSLWGrNt/1GaB8onEGrstnoAKRJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183564; x=1689775564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZPNXdg0Kb1M8cqoVAYxEpPVj+lDYROrNKyik4GIUU8=;
        b=IzN0UINomX5YDu39QenNhCOlhRKyjf6daeqOjoC5Xn9v4uucMg4rLRE+0Ib5ET5Vjh
         +CXWUdRL+spJMBJACv4EAY0wWyqpbZJxZwnbduvq3LvhfPEhSmxhDfC3g8YL8r3oCzZb
         08m8gKywCdbfP5vNUVf4fyrrWYfoy6C9gsQnDpAMaqy9ZpLAtP9GEW2UrTlrBeozdk7a
         ILXEV7pugxtOjpWlNxwOFFAEuerzFNMhPXqhz7QndQ4soxqQUK2F21OUOC9PNENQRM4a
         Id2KJ64ZfVWmbKScYdVITAD4X/p74NgfAqg3yHQy9qb0xHivYaWBJ8bG9EQvqtW20iHe
         eR4A==
X-Gm-Message-State: AC+VfDw4ZoE8tdl6KgMl4FEt3Cr1BkAKFw+AS58/XMuTmhrXc4IIJlUP
	eD6vipWzfJRHdWIjm0V3ay+AFaCfGyC9zJA7qhk=
X-Google-Smtp-Source: ACHHUZ6BQSqWftDSUcBhvgTzkoHkQBYKT0qwPmydr46G9yuCS0oeYzS15hVMrtz8IsVkShVEkeJuZg==
X-Received: by 2002:a7b:c84f:0:b0:3f8:fed0:1c5c with SMTP id c15-20020a7bc84f000000b003f8fed01c5cmr5448305wml.8.1687183563660;
        Mon, 19 Jun 2023 07:06:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id s3-20020a7bc383000000b003f6132f95e6sm10911209wmj.35.2023.06.19.07.06.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:06:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: Add layer-<layername> override support
Date: Mon, 19 Jun 2023 15:06:01 +0100
Message-Id: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183114

Add a new layer specific override based upon the FILE_LAYERNAME support now present
in bitbake. In particular this allows layer specific QA warnings and errors to
be made more easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 702881144ef..9625a6fef4c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -806,7 +806,8 @@ DISTRO_NAME ??= "OpenEmbedded"
 # And finally '<foo>:forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+FILE_LAYERNAME ??= "config"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
2.39.2


