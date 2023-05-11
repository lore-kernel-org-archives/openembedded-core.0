Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CD6C7EE24
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:22:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.11594.1683847340482790351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YdQtH3gb;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-965d2749e2eso1350282366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847339; x=1686439339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=YdQtH3gbDKDU3WM8/zGZrZ/0peE47P+RPfUcTpUwdfEkP5v4XtAuvS4w9b/g82f+r1
         KAqBwpJ5/8YP+98QvNIJ/uEe3rhepaUvMMN37xw7xoIL0hLZ9px4Xc6jXYcBBIkUydIT
         Fcm9D1rNWuAqTDr3eR9Far7lYT5bgpM0OlZ9qZDn1DaVSNAarvXYsbJZuPYeSfmEKR8W
         H0GZJz1vOgiM+soq1qPrw60cat5ztofxmmYaniDAMLfrPvcp+oIvk8JYeR+WTOhJc2Oa
         JfpRoWdPL0HEVVuMZ0NK5Wyy/FlTH+CQx1IH8a6LEcBeyT2uyWSXe3UnnWYB2nx64pHh
         M9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847339; x=1686439339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=KXEmyq3eKXPKbVb5Vrve393mEyQZzaD+tbyJTlojkIHuvEFIpARx/kFlE7gvZSeVlw
         pqcTlxnIg58k9G9RK2m+Y9anES0fPaTJOdk4MF6Y037KqyTCmo0D1F09KllOwFt6x0Ov
         qBstt3sgZcsZIh2Or4wmcV7JXGzHdLksSIa3nZrpVZ6fqt6KyPauyKAieysOAaeUKUqi
         orurgrLOXt/pw/WxqQdPmkSXUF7EeWn7AhP3giEt9s52PPWt6G5unFzS0D+ofgx9LjBq
         XgdDy3BKOM97mUtKWyN2hkBk8rh9VFVQp8pqFH3aMD2JXbsZGeSzc1UEjQqKpoyS80UK
         OQIA==
X-Gm-Message-State: AC+VfDw0SGSdo+topbQN0ZkOyggg3/LiPYIHyzgV3o4+6HRv6t6Ae5ip
	wEChfqtgFf3NYPmV01s+paP0GF3V0Uk=
X-Google-Smtp-Source: ACHHUZ7pIQAGLTgY9glFaAFM7bhYmIqaTyOXLj/NCmpSSdezuUkUHIinegfjD4s//dDSZe9aqLKjtA==
X-Received: by 2002:a17:907:1c9e:b0:96a:9c6:d75a with SMTP id nb30-20020a1709071c9e00b0096a09c6d75amr9519557ejc.24.1683847338912;
        Thu, 11 May 2023 16:22:18 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm3480162edv.36.2023.05.11.16.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:22:18 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 4/4] perf: add libtraceevent packageconfig
Date: Fri, 12 May 2023 01:22:14 +0200
Message-Id: <20230511232214.993328-5-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232214.993328-1-max.oss.09@gmail.com>
References: <20230511232214.993328-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181171

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


