Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353D2C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:21:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.11577.1683847297928990964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YXyrhOjQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bceaf07b8so16966026a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847296; x=1686439296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=YXyrhOjQXT+++CReWGvn3ZAK6pTEgvc9WZZbhh2kmSGS8eB7i1WRxCGJ9XqwM4GVea
         Kqt74OfTaeIgLhI7Z7sn+ZsXq3Zn1gZZHhzwF/5DSElLp8O7zNDyipSnUwBSFNRwOiLe
         OcwxLem4CyXFlYZ4JqU4Ael5xAvoMOrY92OntG03GhDl2WRKUJANv4Oqky4Z+I5pT97v
         3e4alhonYmTuf55lKcO8Hx8d+uRWrVQFY92b9h819NLC5mlqpMh0e401dfTd1EFiFrrB
         otvfel+NvlfAImVAnTuqDYuJBqik5kALmwEkfGmEaLToAU8IHpYYxT2+uf4+ZLV6iy3w
         voPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847296; x=1686439296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=RImHhuelQ/1zuSbIcDn8/swL6ta+zqINh0if4ZSuBEXPqAAkwXKWqCQImeY9qYstmX
         mdq8CdIa5GlrGzXfnMb/0n30vhE5ndPDI2R4f5XaFhzGPoiZyZXTZeEBwP0jNz8MJk7s
         DxRME0w7AzBDwykl5zRqCKemXRoF1MXv05Z7/ac0oDzsyQJlsec5wBfujHqCPoeH6XMy
         E3khILjITp6KSzZSvdS2dzF0V3W7D0TgNEzzAxoCJufpDyB1LJWNFLVWZ2ja++gFU8Cl
         LDfS8LSiJLSw5VVAMWkEtORiQPFT7o+xHUnDRu/XfZ9RRiQkL4QFNCuU4WjHkuqQhrrW
         hPOg==
X-Gm-Message-State: AC+VfDyw7lxTKGPOi7JvBIDwNikslaSnBOkXjOrAoQ5bfxI9yCuFzcIA
	EZpGexcaKeONKPUZq6CS0bmEyw8KfXc=
X-Google-Smtp-Source: ACHHUZ42KlTmKewz8FMXQPc84qPgFwl/oT7RxlHtXcGK/rf+Ubfx8pa2mMTuUcS+WoSsVE6CMSi1qw==
X-Received: by 2002:a05:6402:788:b0:50b:c665:55ea with SMTP id d8-20020a056402078800b0050bc66555eamr16436353edy.3.1683847296069;
        Thu, 11 May 2023 16:21:36 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id y2-20020a056402134200b00504ecc4fa96sm3265163edw.95.2023.05.11.16.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:21:35 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 4/4] perf: add libtraceevent packageconfig
Date: Fri, 12 May 2023 01:21:29 +0200
Message-Id: <20230511232129.993289-5-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232129.993289-1-max.oss.09@gmail.com>
References: <20230511232129.993289-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181165

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'.

Older kernels did build libtraceevent as provided by the kernel sources.
(Unless LIBTRACEEVENT_DYNAMIC=1 was defined, then it tried to pickup
an external provided libtraceevent and printed a warning if not found.)

Add a libtraceevent packageconfig which adds the dependency on
libtraceevent if set, otherwise builds with NO_LIBTRACEEVENT=1.
For older kernels the old behaviour of building libtraceevent from
the kernel sources isn't changed.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 80199a4515..19f8aadaa0 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -11,7 +11,7 @@ LICENSE = "GPL-2.0-only"
 
 PR = "r9"
 
-PACKAGECONFIG ??= "scripting tui libunwind"
+PACKAGECONFIG ??= "scripting tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
@@ -27,6 +27,7 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] = ",,libcap"
+PACKAGECONFIG[libtraceevent] = ",NO_LIBTRACEEVENT=1,libtraceevent"
 # Arm CoreSight
 PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 
-- 
2.35.3


