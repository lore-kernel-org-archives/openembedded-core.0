Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A99C3ABD9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:44 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.84927.1747163322188383595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nszW1gFW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2325c56ebdso4940024a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163321; x=1747768121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pn9UYatJXqeVnjPMDnsFqeEJ6wN8/kL5HoCQU5sK104=;
        b=nszW1gFWbK9TtNhd/nv/7xR/+bkcJq2CD25XngodXZH7G5oFAHfBLTcYsV5/SLZ5PP
         ne+MEdTE3kAvuNbDg5TV9UWrCvhpLJDQSl7Von7dJjWGdC0htgR3mhNHJGLnNGUl2J8o
         Ht5rmqLCeSr+r3dcNEsWB3vWKfSY3SrgxODUPFigKe2cpWRg3bK84OVvCqcLZgbnBzyH
         1s9DkfU1nC21yjuGZyxyYsTFLQttmyTnNhwciiPrycp0Y5oMEnf5x46y1aNIg6P6w7M5
         zCc5tvDWdtiojtzX04k3tuhG0S7tLuOwDthwARI+38hnfikn+FoHK4wk/vrAvIjHMaM0
         k4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163321; x=1747768121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pn9UYatJXqeVnjPMDnsFqeEJ6wN8/kL5HoCQU5sK104=;
        b=aEuuzy7Zoi6lSzl4Q9WudoynTBtk5xyw+rcPivY/i9XbHq8WSUJAxveNTSdbM+XCn2
         uzoI4aX6yWZ2m62Kbw8JXh8fEGE52IcOTTxvBAA1B0ggxwVlmMw+Yo6cIiUV4hQGwFre
         zb1f+jn8C4dKQHoQsLkv8Em8c048Y00dBp2XRU8M5XCp40tnWyoCPlYnOQ3f4HRxKtZb
         0+ghkQXYAV5Gl3Zata7K5so0YXWmqH2oLICQCsRIok36u9iOSMS2d7K1oSlb5qS5MwBZ
         F7IYGbQfcvxjz0IdJ/aPPlbSvUt8OSMvTWhY4npvGsXp/ENH/JwP2NEf1FFy56YxNg4a
         TAYQ==
X-Gm-Message-State: AOJu0YyXPXRgaTqgWlE0/jyNOVPjl0nNHUQrW0XYgsA4ydAgPeQCEMGE
	TmJ6EzGhYgTx+9A44eeCHtvFMhZbAy8aokNTny+h4wIRxqzKSojWa7/ZmlaeCvlduBzjfEjE5bj
	w
X-Gm-Gg: ASbGncsMEZI38RefC1/I5hsNB3BuphPFzr5efv5fi4IqmlkzDGvB+sk0h5cyxNnIgGX
	fwV+E92xlxNe/o3ttn8binS1TcharXPvZlgJT1iyik9WTyShW44YyE3lLHu/d7r7a6gOVROOSlk
	o8PkvW56xayK6MNSL1BPRtDpyx/FgxbJx3bT2oTTKD7hZOnEALkefY9JVq2uDeZIqGaqExGchU6
	O5TdtDQSAxlpIu4E6lyxwDBXSlmShxRGJMcxhv2W5U3zlmsa3nvasg+ljdWsYdgAnYOVIwz1Izs
	TJZ8XuoksIfV2jN4Ml4o8WPej5hiQmlE+yYppvWJ5/8=
X-Google-Smtp-Source: AGHT+IH6LV3okV7nU8e7tL4EfgxNc/ZwJ089Sd0s+6i6SK6nBjxuJC6MyT7sWsoYPNWstzuPBMjTmA==
X-Received: by 2002:a17:903:3ad0:b0:22e:b215:1b6 with SMTP id d9443c01a7336-231980ef20emr9472225ad.28.1747163321386;
        Tue, 13 May 2025 12:08:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] perl: enable _GNU_SOURCE define via d_gnulibc
Date: Tue, 13 May 2025 12:08:12 -0700
Message-ID: <79dc3f42958bfefe03a8240e2a57501c38d2bd3c.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216448

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is needed to properly support memmem() and friends under musl
as musl guards the declarations with _GNU_SOURCE define, and if the
declarations are not present, gcc will issue warnings and generate
assembly that assumes the functions return int (instead of e.g.
void*), with catastrophic consequences at runtime.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6422e62fbc5c65a2165a72c97c880cfa9a80e957)
Signed-off-by: Peter Hurley <peter@meraki.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.34.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index f6ebbf2d16..c8475fc450 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -70,6 +70,7 @@ do_configure:class-target() {
     -Dlibpth='${libdir} ${base_libdir}' \
     -Dglibpth='${libdir} ${base_libdir}' \
     -Alddlflags=' ${LDFLAGS}' \
+    -Dd_gnulibc=define \
     ${PACKAGECONFIG_CONFARGS}
 
     #perl.c uses an ARCHLIB_EXP define to generate compile-time code that
-- 
2.43.0


