Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ADAC77B7A
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 02:40:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.50184.1686537599971235483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 19:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=S9Rml5/z;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2565b864f9aso1903353a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 19:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686537599; x=1689129599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbZsoch6TktObvN5sJ0wElAZIvXnWGB8gWZ+elGqKsk=;
        b=S9Rml5/ziIYypGcE+Y3Agk0JPAMUhwx87/SSxgn8/Kv93946RjgkBoApYHM2IFjl+T
         3fMUDTyWr8l3pRVun/urGF8p/6tDlNnfv6zfh3RUBSHl0QziDcrsoKnCfoYCOnv5s6Rz
         oN+xme5UgtSn0HzhGO/OmUL/xZUdzL2h3wDlfZtdNGckGgiK6d3FgITioqvgxSYbHIbD
         3Sh+0/Pn2weN+ogIYDYnXfo99PKAzPcHcTbHce9kAeYDx7GzTnbBua3NnH4oPZs8NRsx
         ngxSfZRzxIXOHY3fRTmTbX/jsGurAcrRTRunEzOqwXEjPTZZvjEGLMbySlpFR1Alba1s
         ddSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686537599; x=1689129599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbZsoch6TktObvN5sJ0wElAZIvXnWGB8gWZ+elGqKsk=;
        b=lSmuB/0xqA1W47ZpGsne+dxqbQ+dAgd9rxtorVVUIaZ55zXwGlK684R3jEZPRifvbL
         c9W6KpESn89ENyHLAIKxqXjXDUpUs4gDUloGjlEWRshqYJ5S4F1iuSmMmEdu0Uyu7Q5M
         m48fH0jeuwi8UJENafMsCQFQqZI2sUI1E/1dmHgInI0Uvxt6Z53+gCMNnvj4cJ9VrfY+
         6iUoiuE4xlexx2MDsxFRxqroEzLNqZymUoTWa/e1+7Nsr+SQ5VH/s7Nd09xUWrwLnCZ0
         0ZCH+OUgE1JCRjP4680mkzcAxCdyKw9o7QcKQc74fSIVAyvlKPVz7jdNSL9sLNA+IPdu
         mw9w==
X-Gm-Message-State: AC+VfDxllLAdT6dv7PghewWDRraXZeoyJ1JCd7pRx+VJbIjEyNH4iBmu
	OpPb9DuvNi493DmHufx+Dn3TrMdlMzA=
X-Google-Smtp-Source: ACHHUZ6X46/TWJQtXjiC6yI1mhZLpCqm3FKLvekwpgoItaBTX7iHyoNT0OoQ+TI6opK5JkjnGFU9zw==
X-Received: by 2002:a17:90a:5d01:b0:25b:bcc2:7fa9 with SMTP id s1-20020a17090a5d0100b0025bbcc27fa9mr4484030pji.8.1686537598981;
        Sun, 11 Jun 2023 19:39:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b00252d960a8dfsm1516109pjd.16.2023.06.11.19.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:39:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] babeltrace2: Always use BFD linker when building tests with ld-is-lld distro feature
Date: Sun, 11 Jun 2023 19:39:56 -0700
Message-ID: <20230612023956.36702-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 02:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182649

lld results in textrels in some .so used in tests, fixes

babeltrace2-ptest: ELF binary /usr/lib/babeltrace2/ptest/tests/lib/test-plugin-plugins/plugin-minimal.so has relocations in .text
babeltrace2-ptest: ELF binary /usr/lib/babeltrace2/ptest/tests/lib/test-plugin-plugins/plugin-sfs.so has relocations in .text [textrel]
ERROR: babeltrace2-2.0.5-r0 do_package_qa: QA Issue: babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-ctf.so has relocations in .text
babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-utils.so has relocations in .text
babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-text.so has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 6123456c30f..9a4007fb258 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -28,6 +28,7 @@ FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
 FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
 
 ASNEEDED = ""
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd ', '', d)}"
 
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
-- 
2.41.0


