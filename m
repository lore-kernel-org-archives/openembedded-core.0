Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.8847.1632492999315064202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NHpwrQFX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id s11so9951336pgr.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6gqKXJan/3/1JYHxsmdf0I4KFzzRdlbqycHRZHRoPSs=;
        b=NHpwrQFXnWKcg36idAzhlDmnotgcSFcm42nep6FDb6e03mJRbESp3fvgoWOTbFOKpK
         07tCWAiSl/VG21kzIpvzlajxZM0j5LDBZFO1AdIuM2jSgDB3lCR3VSjBqLVOY0VdCCng
         RR+Sg4iIm76q6KouuUFi7BOVxBi/t5xtDH3aVy5vUbUAzmMiBd7IGggkCWA1EP6te4Ak
         rjZIfWtUJwipiCIZaYVGCGj/NcBn0aXP6nktM8+oQ/eXZXd9Taq+Ey1pBuoC/FFN+fOx
         IJclfv9yXxpbYVBeU9CUTNCCEq77m8L5j8UWTc5cTKpJ+BgaKkctzRzrDKnBljR2JzgU
         sK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6gqKXJan/3/1JYHxsmdf0I4KFzzRdlbqycHRZHRoPSs=;
        b=3xLmCJ9qij5GgD+CHYEbvj9PAUusT1nnCbjXnt2krhCV17PqMmm+ts/emnfqZ4qi3H
         wfJ24uXtxDYdIu2sRonslM5COnJYT4oXtAgxHiQt973cOm8FwvNOMvzsMo+DE0sNBUGP
         UzsV2Op8ESkIIYg0ebbmBcUnRU/8BpdSNrqLvcZhS4TL26olA8NQ6/RSmAbXhughN99/
         pwuturXuo18je1XEYiblK6nrces2RjouR8crNvDPk9W6tWWyjJhV9kAwZYC4NmVL9vvD
         l/p3PZFfSpGBsgRv33PWstqwmK5e9RzTA03voDR4g9bAKas9g6q3nglmCwdhRFevWczC
         B++Q==
X-Gm-Message-State: AOAM5328rtiTAKeJZTa/FBQ+BAby+/Nu79s6VVtzvw5famyJ+mdui/Dt
	eMO1VE1VudpKlXU7rMeIwyKmp9pBEdLuiegCCmM=
X-Google-Smtp-Source: ABdhPJz30J1lqfp7uvAufjXWzhzWGL9Y9gOjfLLX5/MYztduS2fp5oX1FxUuMnfOJcAZ8Iqi4NheqQ==
X-Received: by 2002:aa7:953d:0:b0:438:c168:df09 with SMTP id c29-20020aa7953d000000b00438c168df09mr10145230pfp.59.1632492998327;
        Fri, 24 Sep 2021 07:16:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/25] useradd: Ensure preinst data is expanded correctly in pkgdata
Date: Fri, 24 Sep 2021 04:15:22 -1000
Message-Id: <56764df0a7822557f1d07d8dbad2c5cb8f17a9e3.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The preinst data in pkgdata will not expand out the ${XXX_PARAM} variables
since they don't use a package suffix. It happens that the final expansion
used for the packages is corrected by a second trip through the datastore.

The first version is used for calculation of the task output hash and
recent improvements in hash reuse showed this data wasn't using included
in the hashes, meaning for example builds with dynamic IDs were mixing
sstate with builds using static IDs. The result was a mess.

Fix this by expanding the data in the preinst correctly to use the
package specific _PARAM values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 375430f249e7e0b6622e566e2478b40ba7e606ab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/useradd.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index e5f3ba24f9..0f0ed3446d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -230,6 +230,10 @@ fakeroot python populate_packages_prepend () {
         preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd')
         preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems')
         preinst += d.getVar('useradd_preinst')
+        # Expand out the *_PARAM variables to the package specific versions
+        for rep in ["GROUPADD_PARAM", "USERADD_PARAM", "GROUPMEMS_PARAM"]:
+            val = d.getVar(rep + "_" + pkg) or ""
+            preinst = preinst.replace("${" + rep + "}", val)
         d.setVar('pkg_preinst_%s' % pkg, preinst)
 
         # RDEPENDS setup
-- 
2.25.1

