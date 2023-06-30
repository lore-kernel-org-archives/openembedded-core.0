Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF178EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:54 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.3866.1688092193577356744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ch+AS+O6;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.174, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-765a6bbddd6so122901285a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092192; x=1690684192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IgFoxYRdZhVv0lfpC9o/DTyQHvl6SuhffbvyQjkmXA=;
        b=Ch+AS+O6j11w3QIee9MNAmCHbRMQJ0Wlbg++Pl+gICTk6PLWSEaxvAQTpwVgo61JdD
         /mhFNtx4hXe6qCrfU91sxPiXRAiSIAY8JZ33sLbExAn87YjjD/jpOpLZiChoXwJ3HBJX
         iT4aulY/r/2+5lZfFkIfWp+DQ/+VzRzgGrcKVzr5qVf55gD3+zuQpPaOuPLHzBO/VJSM
         fIRAIdeieTh8X2TFU+2oDjwLcTAW6CXucOg4aQ6l5CPhTKfvUaZ6FFmsjmBiStHWeFHQ
         UpInSxVRAbnWtZecPJ2o8T2pZTgCbx0xsQtv0z15cYYvSZOjk9/BXu9v7WrOBrcpmDuX
         /zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092192; x=1690684192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IgFoxYRdZhVv0lfpC9o/DTyQHvl6SuhffbvyQjkmXA=;
        b=YozRh8UIKgvh20RG7yqoegIZq7h8Go+8bI7LL3gvcAsXxwK6SusiWmdLBYqvV+P7eu
         YqkcJhi3UNc3ROH4fuj10SRA3IuiyLqSdE5Ab/AJwpo2modGqqwD/XDQMORluwD9JdsS
         m8S5Oo0tB9XXHpWm6Tr48CNXVqENDhim+z3OqmrKMSU060jmP7QcgYw8mVZIj0Zp4734
         aXFkBCnqGTZ/fcof0quNlFBt+hA2AQEdPMg/pCUzwrlQz3ytV1qQZnQ21fg/2VYcTzoY
         qZBqEDHzEzt7uKxjstZVlNC/V+BzlPra98LHewzrvuEhfGNsZ5B0IkO/RIB5a1c/+qZf
         ViuA==
X-Gm-Message-State: AC+VfDwXFjLqUvWujOY5xpGzoRq0I4ajQOx/drK6oLUfAXG+DlTpwe5r
	4UvWxWrFw9Cyp46WtaTg7XMcWhqbocblJNHs7/GTKQ==
X-Google-Smtp-Source: ACHHUZ6Go7RH4o3Enky6iuKwSve/Sc065Dj36UoLxhf9E0VT5gQQBxvptOgm1WhSETbMQD9K1HEBkQ==
X-Received: by 2002:a05:620a:450b:b0:767:603:d05f with SMTP id t11-20020a05620a450b00b007670603d05fmr1593907qkp.3.1688092192364;
        Thu, 29 Jun 2023 19:29:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/30] babeltrace2: Always use BFD linker when building tests with ld-is-lld distro feature
Date: Thu, 29 Jun 2023 16:29:01 -1000
Message-Id: <092ea60841b5dd45ddbfff9c94b4380855f8e639.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183665

From: Khem Raj <raj.khem@gmail.com>

lld results in textrels in some .so used in tests, fixes

babeltrace2-ptest: ELF binary /usr/lib/babeltrace2/ptest/tests/lib/test-plugin-plugins/plugin-minimal.so has relocations in .text
babeltrace2-ptest: ELF binary /usr/lib/babeltrace2/ptest/tests/lib/test-plugin-plugins/plugin-sfs.so has relocations in .text [textrel]
ERROR: babeltrace2-2.0.5-r0 do_package_qa: QA Issue: babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-ctf.so has relocations in .text
babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-utils.so has relocations in .text
babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-text.so has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 18d443b53a0d76102fbbc1088fbcb3f8087a2b1b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 6123456c30..9a4007fb25 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -28,6 +28,7 @@ FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
 FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
 
 ASNEEDED = ""
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd ', '', d)}"
 
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
-- 
2.34.1


