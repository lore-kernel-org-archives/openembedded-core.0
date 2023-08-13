Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0678EEB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:19 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.93774.1691961549218496684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=W/xzgBpu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2909305a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961548; x=1692566348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HbHOx+zJdT6iwc3IM/rCQe9e26KodarbW7qhcf3O9w=;
        b=W/xzgBpuUQQ5+2/5z3C7MpF2HO4SgDztivqeNPd3BOeqcUgK59fuhHB0teywpto0iJ
         W/6B2hNvaHjaQ4jnFhoG1cAWpN3FSFsQCjPsPZDIVxttJ0pR3nMb53TcwH+bBiWkFW+c
         h/rFU/41tDXZ9c4lSI34R1CBgbV1tLc2Hjja/igiqQH5l7/EZr9PKnLoL7095t6OqyqH
         rUhspjlOy5+HDjlJyFvHfVqxJCkTXdS7IfdYJNvv4kbiqwwtzrMKhVrt6POenPzm4Pfl
         mqIe56Kb3xbGNa2+gmFnS9vuRqD9s8OPsQt29RXtkqwOEW3r/r1dwseW5NkqOYI2k8qe
         229Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961548; x=1692566348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HbHOx+zJdT6iwc3IM/rCQe9e26KodarbW7qhcf3O9w=;
        b=Q6s573uY4ODc8y7JPGLUgWtJGtBqLfgq4COJ7L2qNJRGZCl1nkWRlfFp9QJf0m4Ucz
         W7mlZm1Z75C39xH98c8cda7cwg4KWeKnPwD1C1ng1HFTF+ogu1HrF/B/QPCARJiihpNS
         F2t6FZIB1Dazs88h2CXPROWxdRteNW3X8wuibf30HhQQgn6CfgLIU+nyn05XFfPuGkZe
         lxRtmNzfWFcsES2Lc8LWyNTDg+TwoFcG0j7JszESacC8r70BLPoNE8rtS4OZQFk++jq3
         s/pXPTB7s4o5uh329mJUp6XWBea0tolMbfy+BeMe4VSpPX9PYdYPhENSBBh0bFitP05t
         pe9A==
X-Gm-Message-State: AOJu0YyGuZko/y5dmylqfDVVpTYIz50kUCQPwZkBqwzxrZjNQ0tW0ttP
	k8iaBEh4/XHPwYv5fjkIAtCsQTUSE3vs3lyvEgJblg==
X-Google-Smtp-Source: AGHT+IEhgv4rjNWgQZ4NLXx3nW+35TAebgrzMHP5vhW6aqG71PM+mWTXMt1YHYf+m+J8MRkIDmKJxg==
X-Received: by 2002:a17:90a:5a4d:b0:269:18f5:683e with SMTP id m13-20020a17090a5a4d00b0026918f5683emr6567183pji.3.1691961548284;
        Sun, 13 Aug 2023 14:19:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/22] qemu: CVE-ID correction for CVE-2020-35505
Date: Sun, 13 Aug 2023 11:18:16 -1000
Message-Id: <9d54930a0c37e2878bbbe221341ebbd2bdd78a22.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185901

From: Emily Vekariya <emily.vekariya@einfochips.com>

- The commit [https://github.com/qemu/qemu/commit/995457517340]
  ("esp: ensure cmdfifo is not empty and current_dev is non-NULL")
  fixes CVE-2020-35505 instead of CVE-2020-35504.
- Hence, corrected the CVE-ID in CVE-2020-35505.patch.
- Reference: https://bugzilla.redhat.com/show_bug.cgi?id=1909769

Signed-off-by: Emily Vekariya <emily.vekariya@einfochips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
index c5ff6e89ff..40c0b1e74f 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
@@ -20,16 +20,19 @@ Reviewed-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
 Tested-by: Alexander Bulekov <alxndr@bu.edu>
 Message-Id: <20210407195801.685-7-mark.cave-ayland@ilande.co.uk>
 
-CVE: CVE-2020-35504
+CVE: CVE-2020-35505
 Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-35505.patch?h=ubuntu/focal-security Upstream commit https://github.com/qemu/qemu/commit/99545751734035b76bd372c4e7215bb337428d89  ]
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+Signed-off-by: Emily Vekariya <emily.vekariya@einfochips.com>
 ---
- hw/scsi/esp.c | 3 +++
- 1 file changed, 3 insertions(+)
+ hw/scsi/esp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
 
+diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
+index c7d701bf..c2a67bc8 100644
 --- a/hw/scsi/esp.c
 +++ b/hw/scsi/esp.c
-@@ -193,6 +193,10 @@ static void do_busid_cmd(ESPState *s, ui
+@@ -193,6 +193,10 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
  
      trace_esp_do_busid_cmd(busid);
      lun = busid & 7;
-- 
2.34.1


