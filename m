Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7CCEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:49 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.61381.1688484584694160213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EjYCXT/v;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-55af0a816e4so2919535a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484584; x=1691076584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S9yMhh3yemlWaWnNna2OnEf9WEsLzkLKlhWhfjwxxQ=;
        b=EjYCXT/vNCHj4u1HeyoZO2f04ZeH8srRy5D6n/j4Lbzoosl1W/5XTciyyMykA3Y9B2
         fchDB63hjjBU6pRTuEDEbfU5lm9onIqvRR7gb+KLR63TEt1qA0bbXrn1T8OtS5shp+Ol
         UYje0ZcinD2rvSWnmZNVH8CP11tShe82ft4RWc2CJaCZUAt5gNL9tMutpuTY1W9jNHn/
         wxaBlAZhXkM7aArPHTSvLnoE9otqeTFEmi4cXlvEC+8E/aPOfmMJ1cQ0yf1OLaVfYjHd
         gjV4QU2QmIL1UwtG7Lnr8QiEyD6hNU4eyEhTyZf2Jv+2aF5bE1GrTI/H8E0p/zOTsH9U
         f0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484584; x=1691076584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4S9yMhh3yemlWaWnNna2OnEf9WEsLzkLKlhWhfjwxxQ=;
        b=AVPqOp+2V4k/X891G8CpTnjCWroUYbD/+b4gMwsneu8q1RcPyiSBsTlWEWuqTGYI1I
         USL9UfKnPE20+m5fEdf5XhmEenXOuj1x88scCEuisUBTNQChXyqTIOjH3F+R5pzh6ixw
         ADyMcBWd0ZQKXjlur4+bV24/HKX/Avh1tBUYpKeZ1/D0wcywGNP+u8Qg/V+DxtMMRSPk
         +fsqW44j2uOYcIEyrjwWVEaN2IL04Fgx8CbFeDLbWJGx6Od3aHKCqixU1u/uLhY4Br7M
         DdCIiRNAiGba/CxvAoc17LKWyPouhdJLIigcohkYKP2tXTXNXtAUOySwqvDCjQcZ/QvX
         SI3A==
X-Gm-Message-State: ABy/qLZ4/s2JgxWzZF2q4cn3iodNqR45wH6TumUVz2iK2e8X6uxsDYF9
	inWhBPSBVx0+XeU6ViJotdtX89URN55hcQKDd86Vaw==
X-Google-Smtp-Source: APBJJlEkoaA7FndkNb6llCpaA7fDi4cYMKvYd7FaB5tUqHHBrvvyeO7Po1yxQeci8axB2tl53ESxog==
X-Received: by 2002:a05:6a20:1611:b0:12e:65f8:10dd with SMTP id l17-20020a056a20161100b0012e65f810ddmr7480658pzj.53.1688484583688;
        Tue, 04 Jul 2023 08:29:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/30] gawk: upgrade 5.2.1 -> 5.2.2
Date: Tue,  4 Jul 2023 05:29:04 -1000
Message-Id: <3ace3af1e57b701308ab397c6ac45a6fa703ed40.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183837

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is a bug fix release.

Changes from 5.2.1 to 5.2.2
---------------------------

1. Infrastructure upgrades: makeinfo 7.0.1 must be used to format
   the manual.  As a result, the manual can also now be formatted
   with LaTeX by running it through `makeinfo --latex'.

2. Gawk no longer builds an x86_64 executable on M1 macOS systems.
   This means that PMA is unavailable on those systems.

3. Gawk will now diagnose if a heap file was created with a different
   setting of -M/--bignum than in the current invocation and exit with
   a fatal message if so.

4. Gawk no longer "leaks" its free list of NODEs in the heap file, resulting
   in much more efficient usage of persistent storage.

5. PROCINFO["pma"] exists if the PMA allocator is compiled into gawk.
   Its value is the PMA version.

6. The time extension is no longer deprecated. The strptime() function
   from gawkextlib's timex extension has been added to it.

7. Better information is passed to input parsers for when they want to
   decide whether or not to take control of a file. In particular, the
   readdir extension is simplified for Windows because of this.

8. The various PNG files are now installed for Info and HTML. The
   images files now have gawk_ prefixed names to avoid any conflicts
   with other installed PNG file names.

9. As usual, there have been several minor code cleanups and bug fixes.
   See the ChangeLog for details.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8504a35f1fe222d256241ff00c05b63e24e9adcb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} (97%)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.2.bb
similarity index 97%
rename from meta/recipes-extended/gawk/gawk_5.2.1.bb
rename to meta/recipes-extended/gawk/gawk_5.2.2.bb
index 768c8eb364..3c18b6911a 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "529e7c8c6acf21ff3a6183f4d763c632810908989c24675c77995d51ac37b79c"
+SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.34.1


