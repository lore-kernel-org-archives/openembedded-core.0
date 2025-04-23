Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2149CC369D9
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:57 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.8577.1745414454333674678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rWSI/j47;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73972a54919so6632014b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414453; x=1746019253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiA92nc+ySyldF4Tbwgck/eo6KBBXaKp5fEUhqmAYJQ=;
        b=rWSI/j47dcpL0QWK/xK++m7eouHCEuDQtn9bIjOTw1UWlmfx7gzoGbXdfTUWL6G8d9
         5a4cmDtdsud/XP2mrY1XS4sQd1KLeZiVp0MaXIe6wdXkcNTCMK758W/wCMaZ+Kz6MC8O
         IzY9HxMYbM38/bHuZ+bndkWNNeX22ouOpudlH18LTD0oMvK+a00B+6qUOUl7SJhK6bek
         LxWYyXlwUuKdfMw/n2fU6Vfj/dPyCY8EOTZ6F1uGzv+n3bRI51m3Gqj+mToswVKnRSQL
         8Llsa3AiWLSPaOzWYdNp7vKCy80eCHeaPMWRR0ya6ICnrijoyZ3/jqmI0HXsjX32Z7/T
         oLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414453; x=1746019253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiA92nc+ySyldF4Tbwgck/eo6KBBXaKp5fEUhqmAYJQ=;
        b=QimqzxVHc0qzGHPOp98kHgkzfKHgb2N1NpYFChU4ePHVWR3TATunJcYZ8/7cme7uss
         mCaPkb3CX06nRu8nXNFz848PW3V8F5bhW4FdSr6w5zhZo9ptnd+8My9Nx7N4cZNuEnVx
         WTrVHWkkKlnVw7xmPXxkhK7rNlpuaoV58jnw31fPKMhM+E0jdoulg8O2Bps/kIQLaX9k
         efH07zScd3S/ySrZc6JxLezUtnLRoadIVWPbrYFE3GybSZ+lj7DUiv3FyBlgcaNyyVxI
         WWHTxk1bz1dViOBA+e25ZjwI+BJKH/SrsvwsVlCAcUgVnnGWx7+exmQYJr5wilrl7HDy
         ZxXw==
X-Gm-Message-State: AOJu0YwhMf1N0sfV8kh9fzLCfViQSwpUDHqep91U/6zzW18PE2sfolUT
	TiSwzMy+vU0ge307hH6ctSvce0TEHx2rgtJxGQbSpO+tj9MvhLKWZkcohMlaZv4r1wmUjbYm/N0
	G
X-Gm-Gg: ASbGncvCs34KiyXwsWVYomLFaEScEPItXydkBoUW+BvB/C0w2sO13JV/S9ID0XrpgAc
	p5CDZdODdxsrobMbrMmUsevNuXNg0MR1IKgNuvMjIDsMB1DoMy1vBII96Jo+mBdHRCsFG4ahota
	7iGQf0CUSTipn+6hlMBeqKI6cE73L/zOSu1D+I7qO4Is2E9Qc9oIpXJKYYxRamPIJM+0fe0BvJZ
	uXU+tp5A9FhYfrzJVWhVeb1MoHJBvTQR3o8jybOD8yAE7CWyWPJktWwJLJWIW254VwbHHKRlhfu
	60ib54s05IcQ8OLgp29T4euXL6ATDcM=
X-Google-Smtp-Source: AGHT+IFUChmqObetUtPQXJha5nkPx1C9UeURmWIxSXibJyNZSXqzFgSIkyAeN50r6EGQbNcf6msIgQ==
X-Received: by 2002:a05:6a20:3d81:b0:1f5:70af:a32a with SMTP id adf61e73a8af0-203cbd2122emr37320382637.32.1745414453636;
        Wed, 23 Apr 2025 06:20:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/14] wic: bootimg-efi: Support + symbol in filenames
Date: Wed, 23 Apr 2025 06:20:22 -0700
Message-ID: <081fa0ebb33dbbfd0f6e8239690261c0a9dcdb2c.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215304

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Allow the '+' symbol as a valid character in filenames listed in the
IMAGE_EFI_BOOT_FILES variable.

The '+' symbol might be used to support boot counting for boot entries,
as described in the UAPI Boot Loader Specification [1]:

The boot counting data is stored in the name of the boot loader entry.
A boot loader entry file name may contain a plus (+) followed by a
number. This may optionally be followed by a minus (-)
followed by a second number. The dot (.) and file name suffix
(conf or efi) must immediately follow.
Boot counting is enabled for entries which match this pattern.

Example:
IMAGE_EFI_BOOT_FILES:append = " entry.conf;loader/entries/entry+3.conf"

[1] https://uapi-group.org/specifications/specs/boot_loader_specification/#boot-counting
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f25822281eb9423ff86105eaebb0bed48663648)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 7cc5131541..37d07093f5 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -245,7 +245,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
             # list of tuples (src_name, dst_name)
             deploy_files = []
-            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+            for src_entry in re.findall(r'[\w;\-\.\+/\*]+', boot_files):
                 if ';' in src_entry:
                     dst_entry = tuple(src_entry.split(';'))
                     if not dst_entry[0] or not dst_entry[1]:
-- 
2.43.0


