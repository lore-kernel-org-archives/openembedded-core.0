Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30290C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 07:00:23 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34779.1785913216120266054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 00:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ego1GpEC;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f23e851626so3663906d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913215; x=1786518015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qY3+hrtfX47T925s2C2RzsybHcS3Nb3xya67s0wMugE=;
        b=ego1GpECuHGQhBrgC7e0b3X2HlPhF+uOOSVQcf1JeLbuCNDqPoq46ktAzH2qlc9kXA
         91UE7VZQbjKcUd0AbkDJ9/s7xSNGfPDsl83J8XNixvaUt8Wu8p596pco0B1rKLTOglQZ
         hA1rZIZireCSJCV6kWwknw1MP0RhH6mRvf9PfW5CLUoBzHpCqOnfvqTAOz8L0hUvBmpA
         6QM3wp67A1qR58lToxMhafywLoJjzF0JbMMRhbvVRTFD+DIHkF/y3LuSmtwVZf2cHTxj
         WVzKLH+2IDxhfgv8JNW8SjJ7l0rOL1mAj9d4cbq863+5EQ+5awfG40J0mzvZbCNJPA3R
         AkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913215; x=1786518015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qY3+hrtfX47T925s2C2RzsybHcS3Nb3xya67s0wMugE=;
        b=P0KVhnGLkbwUdJbxKyI41/sbXbcr8r/erlUT81svK7I3ZYYsErr7yJIij463/cFPg6
         jO2MnAjZU1H6bzu/GepjavsWcGN3MBKrGj/s94xJjHOjqi5zzEu/GmX3rJ2entrCXYQf
         XiCiVVGYYB8QOVVZWI4Z9W7uHQkG0LPnb5NhBvgNpNjWk/h+lgWp23L8WfvjRZyZStqQ
         6qbVYpQrcQxz0QHz6SItJAz8otYD7uHJNADxRtJiRKWJE16uQY6d17mJhEUb0LMxQZzE
         J6JnjzriuCVj6n+hJg0uMWLL1YxmWxX/MqoIejxSwd6n9wiX1xVZ1W3luK/kJ4XDraFj
         fhWQ==
X-Gm-Message-State: AOJu0YwyPUcCbAlbtV5AuqZbFFGW7Pb/fExUgCkt9k2fUhdzeFZ6Y2tC
	fId04X5CSATQVf0NlPHFYRO4XT5jl9sEYOJhu63Rlr82r4w0KTUfp7stDLxIPw==
X-Gm-Gg: AR+sD1144pNo1Csx++11aPboSCCcgHUK+/T+PhS++eou+AGvbDszsCVOALBgdS9TNlS
	IUeU6z+YvfDgnuD92KL6vggNk+vUUe3ufhZ7JMXWHvfilvEyl8s6kbFXfoFnDXYBkW7sokPYaMD
	B9n4CTyIOeJPOPPphBBgZo/7btoGLBOpjVcqStFL7YTy2Thnz4wUgM2Ye6Eruy44Zlk2gdB5Hx2
	mYq3aAkGx5SXqvpftn0j+sdt/HyDqLBDoa1MtxLSrBY0oqBwF0XvV3VJjhJl3MW7059+Yn/Eb7E
	RHXGcHdQQMy8Q+NQkboZrbxYyf2vQTqBaDKi8ZRQn80/uti3bTy41ojtg2lXNkM+tB+SR56cWsl
	1bkJF1A/G4Vi2slxWzPYro6mBDNtduoA3dgpeHTGFarnM0V36lglKOSv1exvWYkU5fvhpcBl79N
	+3rTQW8Z3IQkFpl5u8PeDHa/rYKmtIu1vH4ThjknvzkG+gjL9AxT2B+iLAi4JeFrqMrC1jsH8sa
	4/vR7ZVOwrXzGoAL3f9vPRWVnYznOQ=
X-Received: by 2002:a05:6214:268a:b0:8cc:ee2e:8d9c with SMTP id 6a1803df08f44-90881081346mr53659076d6.5.1785913214747;
        Wed, 05 Aug 2026 00:00:14 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffb8f76sm21450386d6.11.2026.08.05.00.00.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:00:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ruby: scrub build host paths from rbconfig.rb in every class
Date: Wed,  5 Aug 2026 03:00:09 -0400
Message-ID: <20260805070009.3498678-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242829

rbconfig.rb records the full configure invocation, which contains the
recipe sysroot, the hosttools directory and the debug prefix map, all of
them paths on the machine that did the build. The recipe removes them,
but only for class-target, so a nativesdk build ships them.

Nothing noticed because nativesdk-ruby has not been installed into an
SDK before. Doing so fails do_package_qa outright:

  QA Issue: File .../rbconfig.rb in package nativesdk-ruby contains
  reference to TMPDIR [buildpaths]

Drop the class-target restriction so the same scrubbing runs whatever
class is being built. The variables it substitutes are defined for every
class, and for a target build the result is byte for byte what it was.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-devtools/ruby/ruby_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.6.bb b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
index 13b6746bbeb3..8b8c397963c4 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -78,7 +78,7 @@ EXTRA_OECONF:append:libc-musl = "\
 
 PARALLEL_MAKEINST = ""
 
-do_install:append:class-target () {
+do_install:append () {
     rbconfig_rb=`find ${D} -name rbconfig.rb`
     # Remove build host directories
     sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
-- 
2.50.0.173.g8b6f19ccfc3a


