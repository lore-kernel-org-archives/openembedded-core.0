Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2ABC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:35 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.64016.1656877047420803404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lWt91nqy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so7562394pjj.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+ugZPqvXV8XX0kujAQvijggAgBeXUQp7B36JuM0FxI0=;
        b=lWt91nqy1d1gDDbClt7SmontPRBHLtYwtLzBAQ0lh4pr86fLd0Px+yZuIaEiWRor56
         PIprLIBdYA0yBGuh5qikoQj8Zb4xcquyeYpjLr0KKmc4dSzZG4Cjdxti0IjR/M2UJgF1
         7WkyNl0gr+CsKrn5sisACjeGC/KmwX90cWVr9u70ugNkeAJG8/OXh8nn+e1oR2Vn7iHL
         XqajW9XgyAjS9v+qWuFL7H1e3UDcfpGJrSAzcdqsaTjV5FnMJ8nlHZV1Xsuy0KccEPfB
         Un3Pth2ISsekoUbcLVlHVrpPAFlaqwIvPAMXlgwuBCvG80EKlsEjBxj6BW3xFieSUyY+
         k9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ugZPqvXV8XX0kujAQvijggAgBeXUQp7B36JuM0FxI0=;
        b=OJv0FJY2UIJLeTeH2rB5h8CF0DSVboQkVK6qdeUnpSpRSIc0/3A1bLua1DsEdkIujH
         nY4xWUzibj1Lm0rqyIhW7YfXHM3t1jQUx877tEbpIWgT9mN2CthtK9qEHu/BTH/f83LX
         DB33fDRi8HBtXAx4I5RSuRhNolLlR94Gce3rq3V2Gpmn+Po3LWq1KJCTKKVs1lz1Vgqa
         QFoW6uQ2CaOBB6fxs5FeTjx9vDsh3QwfICBerR4CQrIzDUuaNrxiJZpW2kucJEJUBkiU
         +UWEA797RzcPkq8j94D/zEfWN0mn/R0RPwcyJYLqdeIWYJ2xM2wBU1aEDnzHv/aZsYkN
         wF/g==
X-Gm-Message-State: AJIora+ozVcLF2y7jN0OVHorABS5YwtKDcCUfzVyY48jGRRW6IPOtCgU
	zDI4eO2sC7ewnTO/RHJ6ZZTKo3sWep7qrmxn
X-Google-Smtp-Source: 
 AGRyM1vpF6muWqljw193/tyiFM5SsD3vAizBdd9lmpIgch/q1ilSsBQxv8r9i0mJdcgqL2ztEgz+gQ==
X-Received: by 2002:a17:903:453:b0:16b:ce52:f610 with SMTP id
 iw19-20020a170903045300b0016bce52f610mr9465046plb.25.1656877046392;
        Sun, 03 Jul 2022 12:37:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/30] perf: sort-pmuevents: really keep array
 terminators
Date: Sun,  3 Jul 2022 09:35:49 -1000
Message-Id: 
 <70d4a09c1f9fada1a02cf7b3886ffaf39d1b9baf.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167574

From: Lucas Stach <l.stach@pengutronix.de>

Commit e1382583cd50 ("perf: sort-pmuevents: don't drop elements") tried
to fix a case where the array terminator elements were dropped from the
sorted list breaking the build, but it only worked for the case where
the terminator is the only element of the array. When the array has other
elements the terminator will still be silently dropped, causing invalid
memory accesses at runtime when the perf utility iterates over the array.

Fix this by treating any unmatched entry as an array terminator and also
add a comment to make it a little more clear how things are ending up at
the right position in the sorted list.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69c35a48c5100b884f1b633142b07222b9390e92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf/sort-pmuevents.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 09ba3328a7..0362f2d8fa 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -62,7 +62,10 @@ for struct in re.findall( struct_block_regex, data ):
             #print( "    name found: %s" % name.group(1) )
             entry_dict[struct[2]]['fields'][name.group(1)] = entry
 
-        if not entry_dict[struct[2]]['fields']:
+        # unmatched entries are most likely array terminators and
+        # should end up as the last element in the sorted list, which
+        # is achieved by using '0' as the key
+        if not cpuid and not name:
             entry_dict[struct[2]]['fields']['0'] = entry
 
 # created ordered dictionaries from the captured values. These are ordered by
-- 
2.25.1


