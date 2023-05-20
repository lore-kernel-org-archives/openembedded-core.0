Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D89C7EE2F
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:35 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13411.1684598733406398178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=z8IG5KrR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d293746e0so2926101b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598732; x=1687190732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtT28HNrjKqEziWuAT+ChjN5RrSXlg49qGU+clgwsGs=;
        b=z8IG5KrR+xkBKMymk2xAp06vHMQEu7OXGV8mDY2484559daRtwdMOXP0ZQeqCOHM8L
         /9MAX17yX2jXtyKdcCXAjh3Hhvx5CGE5k9vWyuzwMsBwglyaYTGtAsx1+klHfM6l2T7I
         PJy4RTN0thUp+v1odhg8NosOJY9Txcb5uk0y26bl5xqE+L1wUSGtZ5h465/r0VbXfPK4
         ox2atqjSQ8hK0VZuLnaJSt8Pn/2q4IHi8ADoE2p7aT1+vd/teLIiZd6K6bk87kUUGANw
         T05ei7io0KYp3LngXSh9qsXrFDpTyrEHc+HrudZBOGImeoQFAukTDo9vOO7ZQzuptPNG
         tNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598732; x=1687190732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtT28HNrjKqEziWuAT+ChjN5RrSXlg49qGU+clgwsGs=;
        b=POrVwovOzWI2q0HbeDHAZlXXG/qV5azAqVqsb7eMStyc0iDSiRcMDKfQCsJfmzhKGp
         3b/nCQPcUO1Wk83CX8urTH4aP0ecQcbTTzdmJto6mB1tdj9uKdBW7xjz9z5ejRm0XNzr
         q9+51e+3H/by2u0AQIx2yT0pgNoVEdXGMNNiM+LvR1DFQGDZJVnVHueiLzh0d4N1lk8E
         togea9gvZ3W+t3IxOTz4HxMz/nCl/NJKBl6GITRaM4QSBztORqhtYEOJ4ky+g3bzZ1aC
         EC+gMAQXHwMAdqRKL51TWJO0MuuZ8nlY7s2wXM2hTdAGmL6ZTRUug33Bcw96uLHiFyfA
         Sp5A==
X-Gm-Message-State: AC+VfDzTsUnbH9rZfR7IuMsN/PaoPN39y17FIGwxJdNHRdZQVZ4XQb9q
	Tw8j3SqgqH+U8KdosIsSe0aTg37iDK6BKdqxpOY=
X-Google-Smtp-Source: ACHHUZ6d2X8JT+YcNfiz8TAXX6lGAYnKdF7pzs4eR68/6nYuZsBQrOVeh/YYxGmSalSSE4vZaGkogg==
X-Received: by 2002:a05:6a21:100a:b0:100:a636:6f22 with SMTP id nk10-20020a056a21100a00b00100a6366f22mr4535165pzb.19.1684598732218;
        Sat, 20 May 2023 09:05:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO override
Date: Sat, 20 May 2023 06:05:05 -1000
Message-Id: <8f0e2e505d11697d0a1280b0a77a3fe8d72a4d49.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181572

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise it ends '<unknown>' inside esdk, because of parsing order:
  # $METADATA_REVISION [3 operations]
  #   set /OE/build/test-D/conf/local.conf:43
  #     "f2da54ef432eac89b0f18eaad68e602b6990b5de"
  #   immediate /OE/build/test-D/layers/poky/meta/classes/metadata_scm.bbclass:9
  #     "${@oe.buildcfg.detect_revision(d)}"
  #   set /OE/build/test-D/layers/poky/meta/classes/metadata_scm.bbclass:10
  #     [vardepvalue] "${METADATA_REVISION}"
  # pre-expansion value:
  #   "<unknown>"
  METADATA_REVISION="<unknown>"

* This causes base-files.do_install and following tasks to have different
  signatures between esdk and the build directory where this esdk was created:

  bitbake-diffsigs {test-D,poky/build-uninative-disabled}/tmp/stamps/qemux86_64-poky-linux/base-files/*do_install*sigdata*
  NOTE: Starting bitbake server...
  basehash changed from 5b6981cf58bfd57d416b0e31611b73a26baae635dd1ac31c08d46f95064c3ffc to dbdce042da4d7813d632b6d1cc87a16f728ad20e55fecbc392830e6acf72babd
  Variable METADATA_REVISION value changed from '<unknown>' to 'f2da54ef432eac89b0f18eaad68e602b6990b5de'

  and an warning from "python3 /OE/build/test-D/ext-sdk-prepare.py" when eSDK is being prepared for use:
  WARNING: The base-files:do_install sig is computed to be 83b9c9a6ef1145baac5a1e0d08814b9156af239c58fc42df95c25a9cd8a7f201,
    but the sig is locked to 3dc22233059075978e5503691e98e79e7cc60db94259dfcd886bca2291c0add7 in SIGGEN_LOCKEDSIGS_t-qemux86-64

[RP: Add commit about why we need the override for future reference]
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 675ea7281c17f77bf5dea17cfd4d9da0928382a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a43ff3fb32..1bdfd92847 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -363,7 +363,8 @@ python copy_buildsystem () {
             f.write('BUILDCFG_HEADER = ""\n\n')
 
             # Write METADATA_REVISION
-            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+            # Needs distro override so it can override the value set in the bbclass code (later than local.conf)
+            f.write('METADATA_REVISION:%s = "%s"\n\n' % (d.getVar('DISTRO'), d.getVar('METADATA_REVISION')))
 
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
-- 
2.34.1


