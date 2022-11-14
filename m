Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784E0C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 08:17:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.3290.1668413853442512888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 00:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=I/Nx32UK;
 spf=pass (domain: nathanrossi.com, ip: 209.85.216.50, mailfrom: nathan@nathanrossi.com)
Received: by mail-pj1-f50.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so9902328pjd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 00:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RK/SqMMJjbIUbuck5Lk+tyl0Jt8j8OWilGE8F6EJ41E=;
        b=I/Nx32UKaucuccMZvMd2Ex0LU7IvmITblER+vNHnDjBxfDnWfcxn3Vbl1Pza6cKCBT
         cYJ8Uo5VTpqcBpWpEdlNgpIwX0trm6go9hGZFXPPeTfO2SouHMV4kBUpew1r+JFon0ER
         j0PoQQ4JvThlxaAuujC7piMVBOFxWPtQWH4eZoW8dEV0pLjws5nwtJ4WcZvJCiSXUzs9
         fJUVnHWRqsHlWDR+9zjR4aX2DIKpx0NoAPRB4ZBvfFxHCr8mW6niI9lNap3lW5PNTn9n
         nBJ7scr+350up5SmO4aC9t4xZr0x8bOfdxnaUrS6ocKXIUOS96JZOo+DU+TUxyDJi3Ry
         8bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK/SqMMJjbIUbuck5Lk+tyl0Jt8j8OWilGE8F6EJ41E=;
        b=vSARm9L9/qQ+JmvufS6tmKH6rV1clJkC180CeoM+y52WkFRf1LyxmaLWkZ2r0G/yvi
         dzXOB5Qa3VTbLJ/ySrO36L24re6PchXSnKTQDSwl2O1jJHQpLG68y/9I0oUGiHYmPmzX
         6+h+1HmmizCkt6kHzkTT0BS5JjFC8xgw+QpE41dQjU070XhFq+3gfm+hzmGaYKUIrDyf
         f9UpIUR10EQKEDh7MvUgpSXryGj+jnhV7D7RPbgOT8bV65mwj9cEA+ZVJCXFFTMgXBJT
         hQa+NPEtZfVQzLt0cvnqpAgn89Pd2QIOj1AUmPkW0d2HAzW+DYfZhsNQDewn3qY6kQSW
         j0iw==
X-Gm-Message-State: ANoB5ploG8/XEMenFryrq8crIw3gY24SXXg5oUjXS6EMdFARC2dJqxZB
	gvbwtvs8rpgEU1l/wPGuoPQ9Y8Wv2Dbl8w==
X-Google-Smtp-Source: AA0mqf6W37j5KgDhoDk1qrwgERMiWY8GuDLGe/nROT/OAOlI/+VvVlJ7qPvzmbHWrI+42ukfZfn8Kg==
X-Received: by 2002:a17:90b:3755:b0:213:f0bb:a44d with SMTP id ne21-20020a17090b375500b00213f0bba44dmr12739936pjb.237.1668413852315;
        Mon, 14 Nov 2022 00:17:32 -0800 (PST)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id x128-20020a623186000000b0056da2ad6503sm6095871pfx.39.2022.11.14.00.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:17:30 -0800 (PST)
Date: Mon, 14 Nov 2022 08:17:18 +0000
Message-Id: <20221114081718.50468-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
 Nathan Rossi <nathan.rossi@digi.com>, Steve Sakoman <steve@sakoman.com>
Subject: [kirkstone][PATCH 1/4] oeqa/selftest/lic_checksum: Cleanup changes to
 emptytest include
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 08:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173228

From: Nathan Rossi <nathan.rossi@digi.com>

Config written to the emptytest include file is invalid after the test
has cleaned up its temporary directories resulting in the emptytest
recipe potentially having invalid content when parsed by successive
bitbake runs.

This presents the following error in tests after lic_checksum execution,
e.g. 'oe-selftest -r lic_checksum recipetool'

  ERROR: .../emptytest.bb: Unable to get checksum for emptytest SRC_URI entry tmpn_nyosnq: file could not be found

Remove the recipe include content once the bitbake runs are completed in
each lic_checksum test case.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 087df767a64b271b503d714df3df6d8b3caad1c0)
---
 meta/lib/oeqa/selftest/cases/lic_checksum.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 8f1226e6a5..bc0a2b5d8e 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 """ % (urllib.parse.quote(lic_path), urllib.parse.quote(lic_path)))
         result = bitbake(bitbake_cmd)
+        self.delete_recipeinc('emptytest')
 
 
     # Verify that changing a license file that has an absolute path causes
@@ -51,5 +52,6 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
             f.write("data")
 
         result = bitbake(bitbake_cmd, ignore_status=True)
+        self.delete_recipeinc('emptytest')
         if error_msg not in result.output:
             raise AssertionError(result.output)
---
2.38.1

