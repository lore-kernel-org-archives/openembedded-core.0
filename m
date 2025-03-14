Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43F9C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:36:03 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2818.1741980960090097416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mc7ow0ID;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2235189adaeso44374405ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741980959; x=1742585759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdK75pJJvOAyZ7RacQCXP0X/9zt+mZmlsyt17OKzdiE=;
        b=Mc7ow0IDQnP1EUP/H6zajd/GRBNJkk3I5wKXMRMvAm1oqoYeIZkEzZDI+0yBjpJZ6n
         AIY/Aw3cg7kQ5P2Wn5CEcBXs66nS4mN1M3fZraMNf9w6V1dptJ4XUIRVpyUDlOLU/D03
         wj6DETBM/mFCkYsTtWyMl9OMxqTH6peuRtDUajlcdCr8f8MOR4Hv5rTIH2HBIDThvIry
         QEZV/7w3gxpD/uGerETIHlyQVQAvtAs3uOYySVipsldJz0iNevF6Nhk8fNqChvQLL4tD
         Z75z7AS+4wXXyrKx2TjM3y0FZASWTlE88TkjyRsfvGupjHtvbJ6lKSFqbRsqJfUIcLPK
         +5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741980959; x=1742585759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdK75pJJvOAyZ7RacQCXP0X/9zt+mZmlsyt17OKzdiE=;
        b=IvTnU2BDXZNuf4btRYP/DQOSV3wQynsMZGKdjG3hOqccCgtWidc6TIoZc08jefUUd1
         CVFhJRCAaF61slclFJa+ffweDe0KakyQT88p2CcFi0GCifNpeFUcZ7P4ApB0z9kAVzsD
         WufjYng2U8Fbjl5F/8gKap6kXmNCjyX8tnjDkchhTXN7dkXpUkx8wTRXNAFgkAPOqmeE
         3wL9+LO5kMd7ZXXWHVF8nFk3YPZPWVezJ9+UykBnQX1XxuI2REm81cA7rlPXhEXfFSLJ
         0gbzZ3iWBQsgTE0POyavVw3zsuVeaxJsMibe09dpOr7SnEBZ5AEDA6q2BCTJ98cJfWb0
         rJAQ==
X-Gm-Message-State: AOJu0YxKNODt4pPalpvy6MwsnP2tpAqO0m9suz558WjCdwMQm13Wlsjz
	OONr+sg7uyqlLS0vZ4tV5EBVET3KnSzdqfCgnqsZzBHCyujn3eRuHO5WUA6tJ6vOVXnXM3x3rfh
	+
X-Gm-Gg: ASbGncvigW9FOvWiBCBr5KtLLue0O4ACMys5LjADJxsTyYTVBKTdNCd/XXFJHeYXOry
	AplR3i5VB21C92OQmpET/1XiRGAlF3FSkgXeg6Kdq9A38a+tLxIsoONF7x08+jUUILDWTwM0cqR
	j0o3QD83hjZbL9B28cjkHYlCr05uIPNoVaxQ+BQc8wcso6LqGFDYvCspUR3VLBsUZb8RJDjn7dj
	6m37o8GPUw4IHoryY1oTSuDd+N53Lrv+Xluv5cr/u4EpmGFu0kUBoKMsrWc+24h8YzzMzlSK9oK
	UOUBUVF3zrrYmMs5Ga1vjHJGosnnh/GZu/XdPCIQ7BBtufI=
X-Google-Smtp-Source: AGHT+IH5cMQYaOz86mQpSgf2LTaQT9OPo93yh3PWb3bqf1nC0Qdmn5u4hI+LXWgwqLXoaX+tWIdBuQ==
X-Received: by 2002:a17:903:13ce:b0:215:758c:52e8 with SMTP id d9443c01a7336-225e16b1b84mr56340005ad.12.1741980959314;
        Fri, 14 Mar 2025 12:35:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6978:e88e:1ab7:676a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d5dsm32265685ad.153.2025.03.14.12.35.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:35:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/4] mpg123: upgrade 1.32.6 -> 1.32.10
Date: Fri, 14 Mar 2025 12:35:37 -0700
Message-ID: <a3db638932e76ac0972d7905072cc7ab3f2abb75.1741980835.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741980835.git.steve@sakoman.com>
References: <cover.1741980835.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212861

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
==========
1.32.10
  - scripts/tag_lyrics.py: fix for python3
  - libout123: Use strtok_r() to avoid conflicts multithreaded contexts
  - libmpg123: Un-break DLL builds that need I/O functions defined in libmpg123.c
  - ports/cmake: More fixup to also produce .pc files with Libs.private.
1.32.9
  - libmpg123:
    -- enable 64 bit offset path for MSVCRT and avoid warnings about
       MS's game about POSIX API with and without underscores
    -- Increase the library patchlevel, as was forgotten on previous
      release.
1.32.8
  Update: The buffer overflow got assigned the CVE ID CVE-2024-10573.
  - libmpg123:
    -- Add sections to assembly to support PAC/BTI code
       for aarch64 (-mbranch-protection variants)
    -- Prevent premature application of header info into decoding structure,
       at worst having triggered out-of-bounds writes of decoded PCM data
  - out123: Show --quiet in --longhelp.
1.32.7
  - ports/cmake: Work around bug in CMake that does not detect FPU on Apple ARM CPUs.
  - Fix some laziness (func() to func(void)) for standards conformance.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mpg123/{mpg123_1.32.6.bb => mpg123_1.32.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.6.bb => mpg123_1.32.10.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
index f7786e8588..82f7b7d332 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6"
+SRC_URI[sha256sum] = "87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


