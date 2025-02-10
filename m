Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC2BC0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 18:16:41 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.59301.1739211396359064113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 10:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=d++Gninl;
 spf=pass (domain: snapchat.com, ip: 209.85.214.181, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f5660c2fdso60080805ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739211395; x=1739816195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyK5RwXLRfHyTYl4yGGYJhOpn2MF6kqzMOYQM80hSmg=;
        b=d++GninluiDEAZzMk5jQga3hpxzWpQsKWoW+ZbjnNCtyU+w88lQ17cPm9LfhxPq9E1
         NsvhIgyrA5rv4vqiUtMNtXsSFFzVB84uUXcfp2ARAP0rnXzhpfKL469Z6ch5ba0OIxAO
         8skoXzGc25m0SOJ2Fz6od0KB3Wkm9ew/NM/u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211395; x=1739816195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyK5RwXLRfHyTYl4yGGYJhOpn2MF6kqzMOYQM80hSmg=;
        b=UHINytzqxd72aJcPWGBxM0mJ2C/N9taz81M9R78YaG3IwfTD3o8xEAn7TeHckieSNx
         vYTuDgbBQySGQkSfQapZo2Kqiefu7fJRjWPTeChZyvIoJQ1DJFNBLt1nklUgOr5J9+iM
         p+UL06WdaOi5b4C1S53/K1dO/+bf3jAaLMW0qdcHfVEKyYBuKayZQ2St1qMy+SyAC2eS
         U074utcQjIu9e81yn6xB0IpMqSpHOIpV+aWrY1e6NMd5S+aD9znMb3LxuoWMFUBLM8dN
         O8/p8TIfQ9SPBBwSotVrjdYbcS+e/RArJwy9CgWf2Qarq1cbs5IqjVaatqIE4ukSF9MY
         HoEQ==
X-Gm-Message-State: AOJu0YzZDkazCOVW19DJCyjjdBn5N7IkmdAyaDSMQ23pjnPpcES5Bnlh
	pZiyiZKzjKK/F0svC+YmnljyMiY/fsZz3rQozia1cwFyIoUot/Wo2xV1/w//GIa7HhBF9TRM9kc
	U
X-Gm-Gg: ASbGnctthKj/jeWdNA7+L1tlosK7lEFSvspizqhSFKzGbh7rJGu11pglA1/IdnGe+qt
	ZKvkgftrLwDSLSp1ENdyF1gZpLAJfRUaEKbWy3j3L/SbwsgrfX+dbhDcB9x5UT+5IIv+LEq9aqR
	fhj1zuZsr0f7K4Qew8rrwP0YuVHE86UjpjVx9KrXlUJCdAi2SVFAckdMNVZnDhHXcgoJbpIIHAu
	AasCbWrWFCcBpCzadM8FEY/OCkJ9YyqHC++3kvklPTTyX97l/5ohCL2zD6ZD6RJHRLG8zH6f3he
	1SwhV1UpnLHnDtdF6TwMQCnsQsc=
X-Google-Smtp-Source: AGHT+IGweIqUOupGk8fOPNN659FSoYm+uXCfk27SP/fiaB4Xrgd+c4s44yletESTVJ0mkvOidGkLMA==
X-Received: by 2002:a05:6a20:918b:b0:1ee:43c3:9bfa with SMTP id adf61e73a8af0-1ee43c39ff7mr4541152637.35.1739211395270;
        Mon, 10 Feb 2025 10:16:35 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad6019204c5sm855846a12.60.2025.02.10.10.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:16:34 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-Core][PATCH v2] gdb: enable xz in gdb-cross and gdb-cross-canadian
Date: Mon, 10 Feb 2025 19:16:25 +0100
Message-ID: <20250210181625.3675958-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211113

From: Etienne Cordonnier <ecordonnier@snap.com>

- Keep a single base-value of the PACKAGECONFIG variable in gdb-common.inc for easier maintenance.

- Enable xz (needed by minidebuginfo) unconditionally in gdb-cross and
  gdb-cross-canadian since those are typically not used in minimal systems, but
  rather e.g. on an X86 desktop, and xz is not a huge dependency. It is also nice
  to not need to recompile gdb-cross when switching between a DISTRO where
  minidebuginfo is disabled, and one where minidebuginfo is enabled.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
 meta/recipes-devtools/gdb/gdb-cross.inc          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 9150c196a85..2e7bf99d352 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -12,7 +12,7 @@ DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp nat
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
+PACKAGECONFIG:append = " xz"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core \
                          nativesdk-python3-codecs nativesdk-python3-netclient \
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 399f4bba97a..e7bffe11d3e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -5,7 +5,7 @@ DEPENDS = "expat-native gmp-native mpfr-native ncurses-native flex-native bison-
 inherit python3native pkgconfig
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
+PACKAGECONFIG:append = " xz"
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-native"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils-native"
-- 
2.43.0


