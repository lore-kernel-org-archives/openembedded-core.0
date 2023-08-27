Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9B0C83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 08:12:01 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.23975.1693123920088816042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GXNqBOMR;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99de884ad25so293907866b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693123918; x=1693728718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9is5WwiLx3mUvcR8frkiE0DrobjjnVCbzGRJjEcQDJI=;
        b=GXNqBOMRLxu+/03aYimP7FhSpGbcZgkP6o1okG61WY3nS3SVlfS80xw6R+Q4VSpzZG
         h850iv8HWd+YQkGmZaxn40rQINCo4cqYrdI6T0EeIHgSlQvBieuf3ZzDayJOJ2qxIPun
         7++AuhkExOu+/QhyLiEgPnaLxx6qfShDuHKQWPmgCZz2rI4oltGgUFAXFl7NH8v5B4RG
         HfALWV/7M4F8A+dRXitNxSNCV7ap3YhoYJC69UrnrS7no8WCLYkBMdvRUoinwf+8drjs
         sCwI4CtKN6mQHTMf9Ya5213PmIOdEQhse11WxiICH2dWstpE4oZoQ22U4U+0hkxB/6SI
         +Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693123918; x=1693728718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9is5WwiLx3mUvcR8frkiE0DrobjjnVCbzGRJjEcQDJI=;
        b=Z4fElL80KhtUOphI812HnTZr4Z6rabrDcsWdgmy7Fo/SdxeFI0Zk5uxc1VWmJl4s4M
         oXB+IbaPl+5rjPESKduw81M87eBjrjDz7Gq5bXPYKcocEKalYnWulY72N3gI19m6MLM+
         yyU8ARsrKxByhILRDJyPl4tHEHliDEi1wzZ56zGFvVJHIyvfvJEoJRO/oO32iP04YQhg
         5nNNdUmYyqgfoqVj4gZODszL3XhSWLgRqux3a/YHjhCurs+FeVnW8AJYocImTsWsFuKV
         XERR2kaet8qsMtLwWZtHK/lFS3KQJlVDkbdfUZv9B6NE4G3keUtX4LBOipuZrg6mXof3
         6YGw==
X-Gm-Message-State: AOJu0YyCca5tE68iujc8EHNsYsy2mBr3MoJD3V8+KqPMZv4lqFJo4rkD
	+FuoN+MKBwswXzOruE1L58/K3yCdXf4=
X-Google-Smtp-Source: AGHT+IGoTjkH0yVbDI8ycO6GSgHpngbzQG9prOdbQpi3Gq1v/Ye4qmAQWyIQ3q1R+Wu0+0Xumsz1wg==
X-Received: by 2002:a17:906:5307:b0:9a2:40e:2cad with SMTP id h7-20020a170906530700b009a2040e2cadmr6934899ejo.48.1693123918082;
        Sun, 27 Aug 2023 01:11:58 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id lx16-20020a170906af1000b0099bcd1fa5b0sm3159756ejb.192.2023.08.27.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 01:11:57 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Randolph Sapp <rs@ti.com>
Subject: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the default dependencies"
Date: Sun, 27 Aug 2023 10:09:52 +0200
Message-Id: <20230827080953.2005190-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 08:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186768

From: Max Krummenacher <max.krummenacher@toradex.com>

Hi

With commit d1d09bd4d7 ("bin_package.bbclass: Inhibit the default
dependencies") applied I'm getting a lot of these errors, i.e. qa
does miss libc and compiler provided libs:

ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue: /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlibs requires ld-linux-aarch64.so.1(GLIBC_2.17)(64bit), but no providers found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue: /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlibs requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue: /usr/lib/libufwriter.so.23.1.6404501 contained in package ti-img-rogue-umlibs requires libstdc++.so.6(GLIBCXX_3.4.14)(64bit), but no providers found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]

Reverting the commit makes the build pass, alternatively adding
to depends in the recipe which is using the bin_package class
fixes it too:

DEPENDS += " virtual/${TARGET_PREFIX}compilerlibs virtual/libc"

I'd prefer reverting removing the default dependencies over fixing
each of the recipes which do use the bin_package class to actually
install binaries running in the target user space.

Any opinions?

Max

Max Krummenacher (1):
  Revert "bin_package.bbclass: Inhibit the default dependencies"

 meta/classes-recipe/bin_package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.35.3


